#include "global_define.h"
#include "timer.h"
#define  PIC0_OCW2     0x20
#define  PIC1_OCW2    0xA0

static struct TIMERCTL timerctl;

void io_out8(int, int);

void  init_pit(void) {
    io_out8(PIT_CTRL, 0x34);
    io_out8(PIT_CNT0, 0x9c);
    io_out8(PIT_CNT0, 0x2e);

    timerctl.count = 0;
    timerctl.timeout = 0;
}

void intHandlerForTimer(char *esp) {
    io_out8(PIC0_OCW2, 0x60);
    timerctl.count++;

    if (timerctl.timeout > 0) {
        timerctl.timeout--;
        if (timerctl.timeout == 0) {
            fifo8_put(timerctl.fifo, timerctl.data);
        }
    }
    return;
}

void settimer(unsigned int timeout, struct FIFO8 *fifo, unsigned char data) {
    int eflags;
    eflags = io_load_eflags();
    io_cli();//暂时停止接收中断信号
    timerctl.timeout = timeout; //设定时间片
    timerctl.fifo = fifo; //设定数据队列，内核在主循环中将监控这个队列
    timerctl.data = data;
    io_store_eflags(eflags);//恢复接收中断信号
    return;
}

struct TIMERCTL* getTimerController() {
    return &timerctl;
}
