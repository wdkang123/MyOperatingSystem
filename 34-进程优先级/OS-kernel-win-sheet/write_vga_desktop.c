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
#include "timer.h"
#include "global_define.h"
#include "multi_task.h"

struct MEMMAN* memman = (struct MEMMAN*)0x100000;

char get_font_data(int c, int offset);

void io_hlt(void);
void io_cli(void);
void io_sti(void);
int  io_load_eflags(void);
void io_store_eflags(int eflags);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram,int xsize,  unsigned char c, int x, int y,
int x0, int y0);

void taskswitch8();

static char keytable[0x54] = {
		0,   0,   '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '^', 0,   0,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '@', '[', 0,   0,   'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ':', 0,   0,   ']', 'Z', 'X', 'C', 'V',
		'B', 'N', 'M', ',', '.', '/', 0,   '*', 0,   ' ', 0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   '7', '8', '9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.'
	};


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


static struct FIFO8 keyinfo;
static struct  FIFO8 mouseinfo;

static char keybuf[32];
static char mousebuf[128];

struct MOUSE_DEC {
    unsigned char buf[3], phase;
    int x, y, btn;
};

static struct MOUSE_DEC mdec;

static struct FIFO8 timerinfo;
static char timerbuf[8];

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

struct SHEET* message_box(struct SHTCTL *shtctl,  char* title);
void make_window8(struct SHTCTL *shtctl, struct SHEET *sht,  char *title);

static int mx = 0, my = 0;
static int xsize = 0, ysize = 0;
static  unsigned char *buf_back, buf_mouse[256];
#define COLOR_INVISIBLE  99

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c);
static struct SHEET* shtMsgBox;
static struct SHTCTL *shtctl;
static struct SHEET *sht_back, *sht_mouse;

void task_b_main(struct SHEET *sht_win_b);


static int task_b = 0;
static struct TIMER g_timer_b;

void CMain(void) {

    initBootInfo(&bootInfo);

    unsigned char *buf_win_b;
    struct SHEET *sht_win_b[3];
    static struct TASK *task_b[3];

    char*vram = bootInfo.vgaRam;
    xsize = bootInfo.screenX, ysize = bootInfo.screenY;

    struct TIMER *timer, *timer2, *timer3;

    init_pit();


    fifo8_init(&timerinfo, 8, timerbuf, 0);
    timer = timer_alloc();
    timer_init(timer, &timerinfo, 10);
    timer_settime(timer, 100);


    timer2 = timer_alloc();
    timer_init(timer2, &timerinfo, 2);
    timer_settime(timer2, 300);


    timer3 = timer_alloc();
    timer_init(timer3, &timerinfo, 1);
    timer_settime(timer3, 50);


    fifo8_init(&keyinfo, 32, keybuf, 0);
    fifo8_init(&mouseinfo, 128, mousebuf, 0);


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
    
    int cursor_x = 8, cursor_c=COL8_FFFFFF;
    shtMsgBox = message_box(shtctl, "counter");

    sheet_updown(shtctl, sht_back, 0);
  
    sheet_updown(shtctl, sht_mouse, 100);


    io_sti();
    enable_mouse(&mdec);

    
//switch task
    int addr_code32 = get_code32_addr();
    struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *)get_addr_gdt();

    static struct TSS32 tss_b, tss_a;
    static struct TASK *task_a;

    task_a = task_init(memman);
    keyinfo.task = task_a;
    char taskTitle[6] = {'t','a','s','k', 0, 0};
    int i = 0;
   for (i = 0; i < 2; i++) {
       sht_win_b[i] = sheet_alloc(shtctl);
       buf_win_b = (unsigned char*)memman_alloc_4k(memman, 144*52);
       char c = 'b' + i;
       taskTitle[4] = c;
       sheet_setbuf(sht_win_b[i], buf_win_b, 144, 52, -1);
       make_window8(shtctl, sht_win_b[i], taskTitle);

       task_b[i] = task_alloc();
       task_b[i]->tss.ldtr = 0;
       task_b[i]->tss.iomap = 0x40000000;
       task_b[i]->tss.eip =  (int)(task_b_main - addr_code32);
      
       task_b[i]->tss.es = 0;
       task_b[i]->tss.cs = 1*8;//6 * 8;
       task_b[i]->tss.ss = 4*8;
       task_b[i]->tss.ds = 3*8;
       task_b[i]->tss.fs = 0;
       task_b[i]->tss.gs = 2*8;
       task_b[i]->tss.esp -= 8;
       *((int*)(task_b[i]->tss.esp + 4)) = (int)sht_win_b[i];

       task_run(task_b[i], (i+1)*5);
    }

    sheet_slide(shtctl,sht_win_b[0], 16, 28);
    sheet_updown(shtctl, sht_win_b[0], 1);
    
    sheet_slide(shtctl, sht_win_b[1], 160, 28);
    sheet_updown(shtctl, sht_win_b[1], 1);
//switch task

    int data = 0;
    int count = 0;
    i = 0;
    int pos = 0;
    int stop_task_A = 0;

    for(;;) {

       io_cli();
       if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) +
           fifo8_status(&timerinfo) == 0) {
 
           io_sti();
       } else if(fifo8_status(&keyinfo) != 0){
           io_sti();
           data = fifo8_get(&keyinfo);
           
           if (data == 0x1C) {
               showMemoryInfo(shtctl, sht_back,  memDesc + count, buf_back, count, xsize, COL8_FFFFFF);
               count = (count+1);
               if (count > memCnt) {
                  count = 0;
               }

           } else if (keytable[data] != 0 && cursor_x < 144) {
               boxfill8(shtMsgBox->buf, shtMsgBox->bxsize, COL8_FFFFFF,cursor_x,
              28, cursor_x + 7, 43);
              sheet_refresh(shtctl, shtMsgBox, cursor_x, 28, cursor_x+8, 44);

                   char buf[2] = {keytable[data], 0};
                   showString(shtctl,  shtMsgBox, cursor_x, 28, COL8_000000, buf);
                   cursor_x += 8;
                
              stop_task_A = 1;

              boxfill8(shtMsgBox->buf, shtMsgBox->bxsize, cursor_c, cursor_x,
              28, cursor_x + 7, 43);
              sheet_refresh(shtctl, shtMsgBox, cursor_x, 28, cursor_x+8, 44);
           }
                     
       } else if (fifo8_status(&mouseinfo) != 0) {
           show_mouse_info(shtctl, sht_back, sht_mouse);
       }  else if (fifo8_status(&timerinfo) != 0) {
           io_sti();
           int i = fifo8_get(&timerinfo);
           if (i == 10) {
                showString(shtctl, sht_back, pos, 144, COL8_FFFFFF,
                 "A"); 
                //switch task 
              //  farjmp(0, 9*8);
                timer_settime(timer, 100);
                pos += 8;
                if (pos > 40 && stop_task_A == 0) {
                    io_cli();
                    task_sleep(task_a);
                    io_sti();
                 }
           } else if (i == 2) {
               showString(shtctl, sht_back, 0, 32, COL8_FFFFFF, "3[sec]");
           } else {
               if (i != 0) {
                  timer_init(timer3, &timerinfo, 0);
                  cursor_c = COL8_000000;
               } else {
                  timer_init(timer3, &timerinfo, 1);
                  cursor_c = COL8_FFFFFF;
               }

               timer_settime(timer3, 50);
               boxfill8(shtMsgBox->buf, shtMsgBox->bxsize, cursor_c, cursor_x,
               28, cursor_x + 7, 43);
               sheet_refresh(shtctl, shtMsgBox, cursor_x, 28, cursor_x+8, 44);

           }
       }
    } 
}




void task_b_main(struct SHEET *sht_win_b) {
   showString(shtctl, sht_back, 0, 160, COL8_FFFFFF, "enter task b");

    struct FIFO8 timerinfo_b;
    char timerbuf_b[8];
    struct TIMER *timer_b = 0;

    int i = 0;
 
    fifo8_init(&timerinfo_b, 8, timerbuf_b, 0);
    timer_b = timer_alloc();
    timer_init(timer_b, &timerinfo_b, 123);
   
    timer_settime(timer_b, 100);
   
    int count = 0;

    int pos = 0;
    for(;;) {
       count++;
       io_cli();
        if (fifo8_status(&timerinfo_b) == 0) {
            io_sti();
        } else {
           i = fifo8_get(&timerinfo_b);
           io_sti();
           if (i == 123) {
               showString(shtctl, sht_back, pos, 192, COL8_FFFFFF, "B");
              // farjmp(0, 8*8);
               timer_settime(timer_b, 100);
               pos += 8;
               boxfill8(sht_win_b->buf, 144, COL8_C6C6C6, 24, 28, 104, 44);
               sheet_refresh(shtctl, sht_win_b, 24, 28, 104, 44);

               char *p = intToHexStr(count);
               showString(shtctl, sht_win_b, 24, 28, COL8_FFFFFF,p);
           }
           
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

    if (mx > xsize - 1) {
       mx = xsize - 1;
    }
    if (my > ysize - 1) {
       my = ysize - 1;
    }

}



void  show_mouse_info(struct SHTCTL *shtctl, struct SHEET *sht_back,struct SHEET *sht_mouse) {
    char*vram = buf_back;
    unsigned char data = 0;
     
    io_sti();
    data = fifo8_get(&mouseinfo);
    if (mouse_decode(&mdec, data) != 0) {
         computeMousePosition(shtctl, sht_back, &mdec);
        
         sheet_slide(shtctl, sht_mouse, mx, my);
         if ((mdec.btn & 0x01) != 0) {
            sheet_slide(shtctl, shtMsgBox, mx - 80, my - 8); 
         }
    }
}

void initBootInfo(struct BOOTINFO *pBootInfo) {
    pBootInfo->vgaRam = (char*)0xe0000000;
    pBootInfo->screenX = 640;
    pBootInfo->screenY = 480;
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
/*
    y+= 16;
    showString(shtctl, sht, x, y, color, "lengthHigh: ");
    char* pLengthHigh = intToHexStr(desc->lengthHigh);
    showString(shtctl, sht, gap, y, color, pLengthHigh);

    y+= 16;
    showString(shtctl, sht, x, y, color, "type: ");
    char* pType = intToHexStr(desc->type);
    showString(shtctl, sht, gap, y, color, pType);
*/
}

struct SHEET*  message_box(struct SHTCTL *shtctl,  char *title) {
    struct SHEET *sht_win;
    unsigned char *buf_win;
    
    sht_win = sheet_alloc(shtctl);
    buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 68);
    sheet_setbuf(sht_win, buf_win, 160, 68, -1);

    make_window8(shtctl, sht_win, title);
    make_textbox8(sht_win, 8, 28, 144, 16, COL8_FFFFFF);    
    
    sheet_slide(shtctl, sht_win, 260, 172);
    sheet_updown(shtctl, sht_win, 2);

    return sht_win;
}

void make_window8(struct SHTCTL *shtctl, struct SHEET *sht,  char *title) {
                
    static char closebtn[14][16] = {
		"OOOOOOOOOOOOOOO@", 
		"OQQQQQQQQQQQQQ$@",
		"OQQQQQQQQQQQQQ$@",
		"OQQQ@@QQQQ@@QQ$@",
		"OQQQQ@@QQ@@QQQ$@",
		"OQQQQQ@@@@QQQQ$@",
		"OQQQQQQ@@QQQQQ$@",
		"OQQQQQ@@@@QQQQ$@",
		"OQQQQ@@QQ@@QQQ$@",
		"OQQQ@@QQQQ@@QQ$@",
		"OQQQQQQQQQQQQQ$@",
		"OQQQQQQQQQQQQQ$@",
		"O$$$$$$$$$$$$$$@",
		"@@@@@@@@@@@@@@@@"
	};

    int x, y;
    char c;
    int bxsize = sht->bxsize;
    int bysize = sht->bysize;
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, bxsize - 1, 0);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, bxsize - 2, 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, 0,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, 1,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_848484, bxsize - 2, 1, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, bxsize - 1, 0, bxsize - 1, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 2, 2, bxsize - 3, bysize - 3);
    boxfill8(sht->buf, bxsize, COL8_000084, 3, 3, bxsize - 4, 20);
    boxfill8(sht->buf, bxsize, COL8_848484, 1, bysize - 2, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, 0, bysize - 1, bxsize - 1, bysize - 1);
    
    showString(shtctl, sht, 24, 4, COL8_FFFFFF, title);

    for (y = 0; y < 14; y++) {
        for (x = 0; x < 16; x++) {
            c = closebtn[y][x];
            if (c == '@') {
                c = COL8_000000;
            } else if (c == '$') {
                c = COL8_848484;
            } else if (c == 'Q') {
                c = COL8_C6C6C6;
            } 
            else {
                c = COL8_FFFFFF;
            }

            sht->buf[(5+y) * sht->bxsize + (sht->bxsize - 21 + x)] = c;
        }
 
    }

    return;
}

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c) {
    int x1 = x0 + sx, y1 = y0 + sy;
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, c, x0 - 1, y0 - 1, x1 + 0, y1 + 0); 
}



