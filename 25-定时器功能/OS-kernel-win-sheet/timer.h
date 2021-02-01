#define PIT_CTRL   0x0043
#define PIT_CNT0   0x0040


void init_pit(void);

struct TIMERCTL {
    unsigned int count;
    unsigned int timeout;
    struct FIFO8 *fifo;
    unsigned char data;
};

struct TIMERCTL* getTimerController();

void settimer(unsigned int timeout, struct FIFO8 *fifo, unsigned char data);
