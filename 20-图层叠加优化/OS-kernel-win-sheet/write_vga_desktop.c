#define  COL8_000000  0
#define  COL8_FF0000  1
#define  COL8_00FF00  2
#define  COL8_FFFF00  3
#define  COL8_0000FF  4
#define  COL8_FF00FF  5
#define  COL8_00FFFF  6
#define  COL8_FFFFFF  7
#define  COL8_C6C6C6  8
#define  COL8_840000  9
#define  COL8_008400  10
#define  COL8_848400  11
#define  COL8_000084  12
#define  COL8_840084  13
#define  COL8_008484  14
#define  COL8_848484  15

#define  PORT_KEYDAT  0x0060
#define  PIC_OCW2     0x20
#define  PIC1_OCW2    0xA0
#include "mem_util.h"
#include "win_sheet.h"

struct MEMMAN* memman = (struct MEMMAN*)0x100000;

char get_font_data(int c, int offset);

void io_hlt(void);
void io_cli(void);
void io_sti(void);
void io_out(int port, int data);
int  io_load_eflags(void);
void io_store_eflags(int eflags);
void show_char(void);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram,int xsize,  unsigned char c, int x, int y,
int x0, int y0);

struct  BOOTINFO {
    char* vgaRam;
    short screenX, screenY;
};

void initBootInfo(struct BOOTINFO *pBootInfo);


extern char systemFont[16];

void showFont8(char *vram, int xsize, int x, int y, char c, char* font);

void showString(struct SHTCTL *shtctl, struct SHEET *sht, int x, int y, char color, unsigned char *s );

void putblock(char* vram, int vxsize, int pxsize,
int pysize, int px0, int py0, char* buf, int bxsize);

void init_mouse_cursor(char* mouse, char bc);
void intHandlerFromC(char* esp);

static struct BOOTINFO bootInfo;

static char keyval[5] = {'0', 'X', 0, 0, 0};

struct FIFO8 {
    unsigned char* buf;
    int p, q, size, free, flags;
};

static struct FIFO8 keyinfo;
static struct  FIFO8 mouseinfo;

static char keybuf[32];
static char mousebuf[128];

struct MOUSE_DEC {
    unsigned char buf[3], phase;
    int x, y, btn;
};

static struct MOUSE_DEC mdec;

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char* buf);
int  fifo8_put(struct FIFO8 *fifo, unsigned char data);
int  fifo8_get(struct FIFO8 *fifo);
int  fifo8_status(struct FIFO8 *fifo);


char   charToHexVal(char c);
char*  charToHexStr(unsigned char c);
char*  intToHexStr(unsigned int d);

void  init_keyboard(void);
void  enable_mouse(struct MOUSE_DEC *mdec);

void  show_mouse_info(struct SHTCTL *shtctl, struct SHEET* sht_back, struct SHEET *sht_mouse);
int   mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat);

struct AddrRangeDesc {
    unsigned int baseAddrLow;
    unsigned int baseAddrHigh;
    unsigned int lengthLow;
    unsigned int lengthHigh;
    unsigned int type;
};

int   get_memory_block_count(void);
char* get_adr_buffer(void);
void  showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht,struct AddrRangeDesc* desc, char* vram, int page, int xsize,int color);

void init_screen8(char *vram, int x, int y);

static int mx = 0, my = 0;
static int xsize = 0, ysize = 0;
static  unsigned char *buf_back, buf_mouse[256];
#define COLOR_INVISIBLE  99

void CMain(void) {
    initBootInfo(&bootInfo);
    char*vram = bootInfo.vgaRam;
    xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    struct SHTCTL *shtctl;
    struct SHEET *sht_back = 0, *sht_mouse = 0;
 
    fifo8_init(&keyinfo, 32, keybuf);
    fifo8_init(&mouseinfo, 128, mousebuf);

    init_palette();
    init_keyboard();
       

    int memCnt = get_memory_block_count();
 
    struct AddrRangeDesc* memDesc = (struct AddrRangeDesc*)get_adr_buffer();
    memman_init(memman);
    memman_free(memman, 0x001008000, 0x3FEE8000);

    shtctl = shtctl_init(memman, vram, xsize, ysize);
    sht_back = sheet_alloc(shtctl);
    sht_mouse = sheet_alloc(shtctl);
    buf_back = (unsigned char*)memman_alloc_4k(memman, xsize*ysize);
    

    sheet_setbuf(sht_back, buf_back, xsize, ysize, COLOR_INVISIBLE);
    sheet_setbuf(sht_mouse, buf_mouse, 16, 16, COLOR_INVISIBLE);


    init_screen8(buf_back, xsize, ysize);    


    init_mouse_cursor(buf_mouse, COLOR_INVISIBLE);
    sheet_slide(shtctl, sht_back, 0, 0);

    
    mx = (xsize - 16) / 2;
    my = (ysize - 28 - 16) / 2;
    sheet_slide(shtctl, sht_mouse, mx, my);
 

    sheet_updown(shtctl, sht_back, 0);
  
    sheet_updown(shtctl, sht_mouse, 1);


    io_sti();
    enable_mouse(&mdec);


    int data = 0;
    int count = 0;
    for(;;) {
       io_cli();
       if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo)  == 0) {
 
           io_stihlt();
       } else if(fifo8_status(&keyinfo) != 0){
           io_sti();
           data = fifo8_get(&keyinfo);
           
           if (data == 0x1C) {
               showMemoryInfo(shtctl, sht_back,  memDesc + count, buf_back, count, xsize, COL8_FFFFFF);
               count = (count+1);
               if (count > memCnt) {
                  count = 0;
               }

           }
                     
       } else if (fifo8_status(&mouseinfo) != 0) {
           show_mouse_info(shtctl, sht_back, sht_mouse);
       }
    }

}

void init_screen8(char* vram, int xsize, int ysize) {
    boxfill8(vram, xsize, COL8_008484, 0, 0, xsize-1, ysize-29);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize-28, xsize-1, ysize-28);
    boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize-27, xsize-1, ysize-27);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize-26, xsize-1, ysize-1);

    boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize-24, 59, ysize-24);
    boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize-24, 2, ysize-4);
    boxfill8(vram, xsize, COL8_848484, 3, ysize-4,  59, ysize-4);
    boxfill8(vram, xsize, COL8_848484, 59, ysize-23, 59, ysize-5);
    boxfill8(vram, xsize, COL8_000000, 2, ysize-3, 59, ysize-3);
    boxfill8(vram, xsize, COL8_000000, 60, ysize-24, 60, ysize-3);

    boxfill8(vram, xsize, COL8_848484, xsize-47, ysize-24, xsize-4, ysize-24);
    boxfill8(vram, xsize, COL8_848484, xsize-47, ysize-23, xsize-47, ysize-4);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize-47, ysize-3, xsize-4, ysize-3);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize-3,  ysize-24, xsize-3, ysize-3);

}

void computeMousePosition(struct SHTCTL *shtctl, struct SHEET *sht,struct MOUSE_DEC* mdec) {
    mx += mdec->x;
    my += mdec->y;
    if (mx < 0) {
       mx = 0;
    }

    if (my < 0) {
       my = 0;
    }

    if (mx > xsize - 16) {
       mx = xsize - 16;
    }
    if (my > ysize - 16) {
       my = ysize - 16;
    }

    showString(shtctl, sht, 0, 0, COL8_FFFFFF, "improve string showing");
}



void  show_mouse_info(struct SHTCTL *shtctl, struct SHEET *sht_back,struct SHEET *sht_mouse) {
    char*vram = buf_back;
    unsigned char data = 0;
     
    io_sti();
    data = fifo8_get(&mouseinfo);
    if (mouse_decode(&mdec, data) != 0) {
         computeMousePosition(shtctl, sht_back, &mdec);
        
         sheet_slide(shtctl, sht_mouse, mx, my);
    }
}

void initBootInfo(struct BOOTINFO *pBootInfo) {
    pBootInfo->vgaRam = (char*)0xa0000;
    pBootInfo->screenX = 320;
    pBootInfo->screenY = 200;
}

void showString(struct SHTCTL *shtctl ,struct SHEET *sht, int x, int y, char color, unsigned char *s ) {
    int begin = x;
    for (; *s != 0x00; s++) {
       showFont8(sht->buf, sht->bxsize, x, y,color, systemFont+ *s * 16);
       x += 8;
    }

    sheet_refresh(shtctl, sht, begin, y, x , y + 16); 
}

void init_palette(void) {
    static  unsigned char table_rgb[16 *3] = {
        0x00,  0x00,  0x00,
        0xff,  0x00,  0x00,
        0x00,  0xff,  0x00,
        0xff,  0xff,  0x00,
        0x00,  0x00,  0xff,
        0xff,  0x00,  0xff,
        0x00,  0xff,  0xff,
        0xff,  0xff,  0xff,
        0xc6,  0xc6,  0xc6,
        0x84,  0x00,  0x00,
        0x00,  0x84,  0x00,
        0x84,  0x84,  0x00,
        0x00,  0x00,  0x84,
        0x84,  0x00,  0x84,
        0x00,  0x84,  0x84,
        0x84,  0x84,  0x84,
    };
 
    set_palette(0, 15, table_rgb);
    return;
}

void set_palette(int start,  int end,  unsigned char* rgb) {
    int i, eflags;
    eflags = io_load_eflags();
    io_cli();
    io_out8(0x03c8,  start);  //set  palette number
    for (i = start; i <=end; i++ ) {
        io_out8(0x03c9,  rgb[0] / 4);
        io_out8(0x03c9,  rgb[1] / 4);
        io_out8(0x03c9,  rgb[2] / 4);
 
        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}

void boxfill8(unsigned char* vram, int xsize, unsigned char c, 
int x0, int y0, int x1, int y1) {
    int  x, y;
    for (y = y0; y <= y1; y++)
     for (x = x0; x <= x1; x++) {
         vram[y * xsize + x] = c;
     }

}

void showFont8(char *vram, int xsize, int x, int y, char c, char* font) {
    int i;
    char d;

    for (i = 0; i < 16; i++) {
        d = font[i]; 
        if ((d & 0x80) != 0) {vram[(y+i)*xsize + x + 0] = c;}
        if ((d & 0x40) != 0) {vram[(y+i)*xsize + x + 1] = c;}
        if ((d & 0x20) != 0) {vram[(y+i)*xsize + x + 2] = c;} 
        if ((d & 0x10) != 0) {vram[(y+i)*xsize + x + 3] = c;}
        if ((d & 0x08) != 0) {vram[(y+i)*xsize + x + 4] = c;}
        if ((d & 0x04) != 0) {vram[(y+i)*xsize + x + 5] = c;}
        if ((d & 0x02) != 0) {vram[(y+i)*xsize + x + 6] = c;}
        if ((d & 0x01) != 0) {vram[(y+i)*xsize + x + 7] = c;}
    }

}

void init_mouse_cursor(char* mouse, char bc) {
    static char cursor[16][16] = {
		"**************..",
		"*OOOOOOOOOOO*...",
		"*OOOOOOOOOO*....",
		"*OOOOOOOOO*.....",
		"*OOOOOOOO*......",
		"*OOOOOOO*.......",
		"*OOOOOOO*.......",
		"*OOOOOOOO*......",
		"*OOOO**OOO*.....",
		"*OOO*..*OOO*....",
		"*OO*....*OOO*...",
		"*O*......*OOO*..",
		"**........*OOO*.",
		"*..........*OOO*",
		"............*OO*",
		".............***"
	};

      int x, y;
      for (y = 0; y < 16; y++) {
          for (x = 0; x < 16; x++) {
             if (cursor[y][x] == '*') {
                 mouse[y*16 + x] = COL8_000000;
             }
             if (cursor[y][x] == 'O') {
                mouse[y*16 + x] = COL8_FFFFFF;
             }
             if (cursor[y][x] == '.') {
                 mouse[y*16 + x] = bc;
             }
          }
      }
}

void putblock(char* vram, int vxsize, int pxsize,
int pysize, int px0, int py0, char* buf, int bxsize) {
    int x, y;
    for (y = 0; y < pysize; y++)
      for (x = 0; x < pxsize; x++) {
          vram[(py0+y) * vxsize + (px0+x)] = buf[y * bxsize + x];
      }
}


void intHandlerFromC(char* esp) {
    char*vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    io_out8(PIC_OCW2, 0x20);
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT);
    fifo8_put(&keyinfo, data);
   
    return;
}

char   charToHexVal(char c) {
    if (c >= 10) {
        return 'A' + c - 10;
    } 

    return '0' + c;
}

char*  charToHexStr(unsigned char c) {
    int i = 0;
    char mod = c % 16;
    keyval[3] = charToHexVal(mod);
    c = c / 16;
    keyval[2] = charToHexVal(c);
  
    return keyval;
}

char*  intToHexStr(unsigned int d) {
    static char str[11];
    str[0] = '0';
    str[1] = 'X';
    str[10] = 0;

    int i = 2;
    for(; i < 10; i++) {
        str[i] = '0';
    }

    int p = 9;
    while (p > 1 && d > 0) {
        int e = d % 16;
        d /= 16;
        if (e >= 10) {
           str[p] = 'A' + e - 10;
        } else {
            str[p] = '0' + e;
        }         
        p--;
    } 

    return str;
}

#define  PORT_KEYDAT  0x0060
#define  PORT_KEYSTA  0x0064
#define  PORT_KEYCMD  0x0064
#define  KEYSTA_SEND_NOTREADY  0x02
#define  KEYCMD_WRITE_MODE  0x60
#define  KBC_MODE     0x47

void  wait_KBC_sendready() {
    for(;;) {
        if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0) {
            break;
        }
    }
}

void init_keyboard(void) {
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, KBC_MODE);
    return;
}

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4

void enable_mouse(struct MOUSE_DEC* mdec) {
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);

    mdec->phase = 0;
    return;
}

void intHandlerForMouse(char* esp) {
    unsigned char data;
    io_out8(PIC1_OCW2, 0x20);
    io_out8(PIC_OCW2, 0x20);
    
    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mouseinfo, data);
}

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf) {
    fifo->size = size;
    fifo->buf = buf;
    fifo->free = size;
    fifo->flags = 0;
    fifo->p = 0;
    fifo->q = 0;
    return ;
}

#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data) {
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

int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat) {
    if (mdec->phase == 0) {
        if (dat == 0xfa) {
           mdec->phase = 1;
        }

       return 0;
    }

    if (mdec->phase == 1) {
        if ((dat & 0xc8) == 0x08) {
            mdec->buf[0] = dat;
            mdec->phase = 2;
        }

        return 0;
    }

    if (mdec->phase == 2) {
        mdec->buf[1] = dat;
        mdec->phase = 3;
        return 0;
    }

    if (mdec->phase == 3) {
        mdec->buf[2] = dat;
        mdec->phase = 1;
        mdec->btn = mdec->buf[0] & 0x07;
        mdec->x = mdec->buf[1];
        mdec->y = mdec->buf[2];
        if ((mdec->buf[0] & 0x10) != 0) {
           mdec->x |= 0xffffff00;
        }

        if ((mdec->buf[0] & 0x20) != 0) {
           mdec->y |= 0xffffff00;
        }

        mdec->y = -mdec->y;
        return 1;
    }

    return -1;
}

void  showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht,struct AddrRangeDesc* desc, char* vram, int page,int xsize, int color) {
    int x = 0, y = 0, gap = 13*8,  strLen = 10* 8;

    init_screen8(sht->buf, xsize, ysize);

    showString(shtctl, sht, x, y, color, "page is: ");
    char* pPageCnt = intToHexStr(page);
    showString(shtctl, sht, gap, y, color, pPageCnt);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrL: ");
    char* pBaseAddrL = intToHexStr(desc->baseAddrLow);
    showString(shtctl, sht, gap, y, color, pBaseAddrL);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrH: ");
    char* pBaseAddrH = intToHexStr(desc->baseAddrHigh);
    showString(shtctl, sht, gap, y, color, pBaseAddrH);
  
    y += 16;
    showString(shtctl, sht, x, y, color, "lengthLow: ");
    char* pLengthLow = intToHexStr(desc->lengthLow);
    showString(shtctl, sht, gap, y, color, pLengthLow);

    y+= 16;
    showString(shtctl, sht, x, y, color, "lengthHigh: ");
    char* pLengthHigh = intToHexStr(desc->lengthHigh);
    showString(shtctl, sht, gap, y, color, pLengthHigh);

    y+= 16;
    showString(shtctl, sht, x, y, color, "type: ");
    char* pType = intToHexStr(desc->type);
    showString(shtctl, sht, gap, y, color, pType);
}
/*
void memman_init(struct MEMMAN *man) {
    man->frees = 0;
    man->maxfrees = 0;
    man->lostsize = 0;
    man->losts = 0;
}

unsigned int memman_total(struct MEMMAN *man) {
    unsigned int i, t = 0;
    for (i = 0; i < man->frees; i++) {
        t += man->free[i].size;
    }

    return t;
}


unsigned int memman_alloc(struct MEMMAN *man, unsigned int size) {
    unsigned int i, a;
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].size >= size) {
            a = man->free[i].addr;
            man->free[i].size -= size;
            if (man->free[i].size == 0) {
                man->frees--;
            }

            return a;
        }
    }

    return 0;
}

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size) {
    int i, j;
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].addr > addr) {
            break;
        }
    }

    if (i > 0) {
        if (man->free[i-1].addr + man->free[i-1].size == addr) {
           man->free[i-1].size += size;
           if (i < man->frees) {
               if (addr + size == man->free[i].addr) {
                   man->free[i-1].size += man->free[i].size;
                   man->frees--;
               }
           }
     
           return 0;
        }
    }

    if (i < man->frees) {
        if (addr + size == man->free[i].addr) {
           man->free[i].addr = addr;
           man->free[i].size += size;
           return 0;
        }
    }

    if (man->frees < MEMMAN_FREES) {
        for (j = man->frees; j > i; j--) {
            man->free[j] = man->free[j-1];
        }

        man->frees++;
        if (man->maxfrees < man->frees) {
            man->maxfrees = man->frees;
        }

        man->free[i].addr = addr;
        man->free[i].size = size;
        return 0;
    }

    man->losts++;
    man->lostsize += size;
    return -1;
}
*/
