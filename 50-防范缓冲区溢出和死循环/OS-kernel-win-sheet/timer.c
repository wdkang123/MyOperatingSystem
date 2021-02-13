#include "global_define.h"
#include "multi_task.h"
#include "timer.h"

#define  PIC0_OCW2     0x20
#define  PIC1_OCW2    0xA0
#define  TIMER_FLAGS_ALLOC  1
#define  TIMER_FLAGS_USING  2

static struct TIMERCTL timerctl;
extern struct TIMER *task_timer;

void  init_pit(void) {
    io_out8(PIT_CTRL, 0x34);
    io_out8(PIT_CNT0, 0x9c);
    io_out8(PIT_CNT0, 0x2e);

    timerctl.count = 0;
    int i;
    for (i = 0; i < MAX_TIMER; i++) {
        timerctl.timer[i].flags = 0; //not used
        timerctl.timer[i].fifo = 0;
    }
}

struct TIMER* timer_alloc(void) {
    int i;
    for (i = 0; i < MAX_TIMER; i++) {
        if (timerctl.timer[i].flags == 0) {
            timerctl.timer[i].flags = TIMER_FLAGS_ALLOC;
            return &timerctl.timer[i];
        }
    }

    return 0;
}

void timer_free(struct TIMER *timer) {
    timer->flags = 0;
    return;
}

void timer_init(struct TIMER *timer, struct FIFO8 *fifo, unsigned char data) {
    timer->fifo = fifo;
    timer->data = data;
    return;
}

void timer_settime(struct TIMER *timer, unsigned int timeout) {
    timer->timeout = timeout;
    timer->flags = TIMER_FLAGS_USING;
    return;
}


void intHandlerForTimer(char *esp) {
    io_out8(PIC0_OCW2, 0x20);

    timerctl.count++;
    int i;
    char ts = 0;

    for (i = 0; i < MAX_TIMER; i++) {
        if (timerctl.timer[i].flags == TIMER_FLAGS_USING) {
            timerctl.timer[i].timeout--;
            if (timerctl.timer[i].timeout == 0) {
                timerctl.timer[i].flags = TIMER_FLAGS_ALLOC;
                fifo8_put(timerctl.timer[i].fifo, timerctl.timer[i].data);
                if (&timerctl.timer[i] == task_timer) {
                    ts = 1;
                }
            }
        }
 
        if (ts != 0) {
           task_switch();
        }
    }


    return;
}


struct TIMERCTL* getTimerController() {
    return &timerctl;
}
