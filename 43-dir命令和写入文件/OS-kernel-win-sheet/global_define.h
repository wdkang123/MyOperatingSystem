struct FIFO8 {
    unsigned char* buf;
    int p, q, size, free, flags;
    struct TASK *task;
};

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf, 
struct TASK *task);

int fifo8_put(struct FIFO8 *fifo, unsigned char data);

int fifo8_get(struct FIFO8 *fifo);

int fifo8_status(struct FIFO8 *fifo);

int strcmp(char *src, char *dest);

#define  ADR_DISKIMG  0x10E00

struct FILEINFO {
    unsigned char name[8], ext[3], type;
    char  reserve[10];
    unsigned short time, date, clustno;
    unsigned int  size;
};


#define FILEINFO_SIZE  32
