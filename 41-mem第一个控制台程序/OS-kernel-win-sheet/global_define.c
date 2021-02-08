#include "multi_task.h"
#include "global_define.h"

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf, 
    struct TASK *task) {
    fifo->size = size;
    fifo->buf = buf;
    fifo->free = size;
    fifo->flags = 0;
    fifo->p = 0;
    fifo->q = 0;
    fifo->task = task;
    return ;
}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data) {
    if (fifo == 0) {
        return -1;
    }    

    if (fifo->free ==0) {
        fifo->flags |= FLAGS_OVERRUN;
        return -1;
    }

    fifo->buf[fifo->p] = data;
    fifo->p++;
    if (fifo->p == fifo->size) {
        fifo->p = 0;
    }

    fifo->free--;

    if (fifo->task != 0) {
        if (fifo->task->flags != 2) {
            task_run(fifo->task, -1, 0);
        }
    }

    return 0;
}

int fifo8_get(struct FIFO8 *fifo) {
    int data;
    if (fifo->free == fifo->size) {
        return -1;
    }

    data = fifo->buf[fifo->q];
    fifo->q++;
    if (fifo->q == fifo->size) {
        fifo->q = 0;
    }

    fifo->free++;
    return data;
}

int fifo8_status(struct FIFO8 *fifo) {
    return fifo->size - fifo->free;
}
