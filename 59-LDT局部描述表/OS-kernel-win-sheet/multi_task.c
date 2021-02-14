#include "mem_util.h"
#include "global_define.h"
#include "multi_task.h"
#include "timer.h"

void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar)
{
	if (limit > 0xfffff) {
		ar |= 0x8000; /* G_bit = 1 */
		limit /= 0x1000;
	}
	sd->limit_low    = limit & 0xffff;
	sd->base_low     = base & 0xffff;
	sd->base_mid     = (base >> 16) & 0xff;
	sd->access_right = ar & 0xff;
	sd->limit_high   = ((limit >> 16) & 0x0f) | ((ar >> 8) & 0xf0);
	sd->base_high    = (base >> 24) & 0xff;
	return;
}

static struct TIMER *task_timer;
static struct TASKCTL *taskctl;

struct TASKCTL *get_taskctl() {
    return taskctl;
}

void init_task_level(int level) {
    taskctl->level[level].running = 0;
    taskctl->level[level].now = 0;
    int i;
    for (i = 0; i < MAX_TASKS_LV; i++) {
        taskctl->level[i].tasks[i] = 0;
    }
}

struct TASK  *task_init(struct MEMMAN *memman) {
    int  i;
    struct TASK *task;
    struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *)get_addr_gdt();
    taskctl = (struct TASKCTL *)memman_alloc_4k(memman, SIZE_OF_TASKCTL);
    for (i = 0; i < MAX_TASKS; i++) {
        taskctl->tasks0[i].flags = 0;
        taskctl->tasks0[i].sel = (TASK_GDT0 + i) * 8;
        //change here
        taskctl->tasks0[i].tss.ldtr = (TASK_GDT0 + MAX_TASKS + i) * 8;
        set_segmdesc(gdt + TASK_GDT0 + i, 103, (int)&taskctl->tasks0[i].tss,
        AR_TSS32);
        //change here
        set_segmdesc(gdt + TASK_GDT0 + MAX_TASKS + i, 15, (int)taskctl->tasks0[i].ldt, AR_LDT);
    }
 
    for (i = 0; i < MAX_TASKLEVELS; i++) {
        init_task_level(i);
    }

    task = task_alloc();
    task->flags = 2;  //active
    task->priority = 100;
    task->level = 0;
    task_add(task);
    task_switchsub();

    load_tr(task->sel);
    task_timer = timer_alloc();
    timer_settime(task_timer, task->priority);
    return task;
}

struct TASK *task_alloc(void) {
    int i;
    struct TASK *task;
    for (i = 0; i < MAX_TASKS; i++) {
        if (taskctl->tasks0[i].flags == 0) {
            task = &taskctl->tasks0[i];
            task->flags = 1;
            task->tss.eflags = 0x00000202;
            task->tss.eax = 0;
            task->tss.ecx = 0;
            task->tss.edx = 0;
            task->tss.ebx = 0;
            task->tss.ebp = 0;
            task->tss.esp = 512*(i+1);
            task->tss.esi = 0;
            task->tss.edi = 0;
            task->tss.es = 0;
            task->tss.ds = 0;
            task->tss.fs = 0;
            task->tss.gs = 0;
            task->tss.ss0 = 0;
            //change here
            task->tss.iomap = 0x40000000;
            return task;
        }
    }

    return 0;
}

void task_run(struct TASK *task,int level, int priority) {
    if (level < 0) {
        level = task->level;
    }

    if (priority > 0) {
        task->priority = priority;
    }

    if (task->flags == 2 && task->level != level) {
        task_remove(task); //change task flags
    }

    if (task->flags != 2) {
        task->level = level;
        task_add(task);
    }

    taskctl->lv_change = 1;
    
    return;
} 

void task_switch(void) {
    struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
    struct TASK *new_task, *now_task = tl->tasks[tl->now];
    tl->now++;
    if (tl->now == tl->running) {
        tl->now = 0;
    }
 
    if (taskctl->lv_change != 0) {
        task_switchsub();
        tl = &taskctl->level[taskctl->now_lv];
    }

    new_task = tl->tasks[tl->now];
    timer_settime(task_timer, new_task->priority);
    if (new_task != now_task && new_task != 0) {
        farjmp(0, new_task->sel);
    }

    return;
}

int  task_sleep(struct TASK *task) {
   struct TASK *cur_task = 0;
   int rtask = 0;

   if (task->flags == 2) {
       cur_task = task_now();
       task_remove(task);
   
       rtask = 1;

       if (task == cur_task) {
          task_switchsub();
          cur_task = task_now();
          rtask = 2;

          if (cur_task != 0)
          {
              farjmp(0, cur_task->sel);
          }
       }
   }

   return rtask;
}

struct TASK *task_now(void) {
    struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
    return tl->tasks[tl->now];
}

void task_add(struct TASK *task) {
    struct TASKLEVEL *tl = &taskctl->level[task->level];
    tl->tasks[tl->running] = task;
    tl->running++;
    task->flags = 2;
    return;
} 

void task_remove(struct TASK *task) {
    int i ;
    struct TASKLEVEL *tl = &taskctl->level[task->level];
    for (i = 0; i< tl->running; i++) {
        if (tl->tasks[i] == task) {
            tl->tasks[i] = 0;
            break;
        }
    }

    tl->running--;
    if (i < tl->now) {
        tl->now--;
    }

    if (tl->now >= tl->running) {
        tl->now = 0;
    } 

    task->flags = 1;

    for (; i < tl->running; i++) {
        tl->tasks[i] = tl->tasks[i+1];
    }

    return;
}

void task_switchsub(void) {
    int i;
    for (i = 0; i < MAX_TASKLEVELS; i++) {
        if (taskctl->level[i].running > 0) {
           break;
        }
    }

    taskctl->now_lv = i;
    taskctl->lv_change = 0;
}

void send_message(struct TASK *sender, struct TASK *receiver, int msg) {
    fifo8_put(&receiver->fifo, msg);
    task_sleep(sender);
}
