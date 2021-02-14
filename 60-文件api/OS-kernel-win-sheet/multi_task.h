
struct TSS32 {
	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
	int es, cs, ss, ds, fs, gs;
	int ldtr, iomap;
};

struct SEGMENT_DESCRIPTOR {
	short limit_low, base_low;
	char base_mid, access_right;
	char limit_high, base_high;
};

void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar);

#define AR_TSS32		0x0089
#define AR_CODE32               0x409a
#define AR_DATA                 0x4092
#define AR_LDT                  0x0082

struct FILEHANDLE {
    char *buf;
    int size;
    int pos;
};

struct TASK {
    int sel, flags;
    int priority;
    int level;
    struct FIFO8 fifo;
    struct TSS32 tss;
    struct CONSOLE console;
    struct Buffer *pTaskBuffer;
    struct SHEET *sht;
    //change here add stack record
    int cons_stack;
    struct SEGMENT_DESCRIPTOR ldt[2]; 
    // change here
    struct FILEHANDLE *fhandle;
};

#define  MAX_TASKS  10
#define  MAX_TASKS_LV   10
#define  MAX_TASKLEVELS 10

#define  TASK_GDT0  7
#define  SIZE_OF_TASK  264

struct TASKLEVEL {
    int running;
    int now;
    struct TASK *tasks[MAX_TASKS_LV];
};

#define SIZE_OF_TASKLEVEL  (8+ 4*MAX_TASKS_LV)

struct TASKCTL {
    int  now_lv;
    int  lv_change;
    struct TASKLEVEL  level[MAX_TASKLEVELS];
    struct TASK tasks0[MAX_TASKS];
};

struct TASK *task_init(struct MEMMAN *memman);

#define SIZE_OF_TASKCTL  (4 + 4 + SIZE_OF_TASKLEVEL*MAX_TASKLEVELS + SIZE_OF_TASK*MAX_TASKS)

struct TASK *task_alloc(void);

struct TASK *task_now(void);

int task_sleep(struct TASK *task);

struct TASKCTL *get_taskctl();

#define  PROC_RESUME   0x57
#define  PROC_PAUSE    0x58

void send_message(struct TASK *sender, struct TASK *receiver, int msg);
