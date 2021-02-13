#define PIT_CTRL   0x0043
#define PIT_CNT0   0x0040

#define MAX_TIMER  500

void init_pit(void);

struct TIMER {
    unsigned int timeout, flags;
    struct FIFO8 *fifo;
    unsigned char data;
};

struct TIMERCTL {
    unsigned int count;
    
    struct TIMER timer[MAX_TIMER];
    
};

struct TIMER* timer_alloc(void);

void timer_free(struct TIMER *timer);

void timer_init(struct TIMER *timer, struct FIFO8 *fifo, unsigned char data) ;

void timer_settime(struct TIMER *timer, unsigned int timeout);
