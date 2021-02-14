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

//change here old 0x13400
#define  ADR_DISKIMG  0x15800

struct FILEINFO {
    unsigned char name[8], ext[3], type;
    char  reserve[10];
    unsigned short time, date, clustno;
    unsigned int  size;
};


#define FILEINFO_SIZE  32
//kernel begin with 0x8000, we leave 6 clinders to kernel image
//therefore 0x8000 + 6*18*512 = 0x15800
#define FILE_CONTENT_HEAD_ADDR 0x17C00
#define DISK_SECTOR_SIZE  512

#define API_CALL_INDEX_TABLE 0x5000

struct Buffer {
    unsigned char *pBuffer;
    unsigned char *pDataSeg;
    int  length;
};

struct CONSOLE {
    struct SHEET *sht;
    int cur_x, cur_y, cur_c;
    char s[2];
    struct TIMER *timer;
    //change here
    char *cmdline;
};

