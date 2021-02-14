void api_putchar(int c);
void api_putstr(char *s);
int  api_openwin(char *buf, int xsiz, int ysiz, int col_inv, char *title);
void api_putstrwin(int win, int x, int y, int col, int len, char *str);
void api_boxfilwin(int win, int x0, int y0, int x1, int y1, int col);
void api_point(int win, int x, int y, int col);
void api_refreshwin(int win, int x0, int y0, int x1, int y1);
void api_linewin(int win, int x0, int y0, int x1, int y1, int col);
void api_closewin(int win);
int  api_getkey(int mode);
void api_showstring();
int  api_fopen(char *fname);
int  api_fread(char *buf, int maxsize, int fh);
void api_fseek(int fhandle, int offset, int mode);
#define _A  214013LL
#define _B  2531011LL
int ran = 23;
int  rand() {
  return ((ran = ran * _A + _B)>>16) & 0x7fff;
}

void main() {
    int fh;
    fh = api_fopen("ijk.txt");
    int j = 0;
    api_fseek(fh, 5, 0);
    char fb[2];
    if (fh != 0) {
        for (j = 0; j < 10; j++) {
            if (api_fread(fb, 1, fh) == 0) {
                break;
            }
            api_putchar(fb[0]);
        }
    }

    char buf[160 * 100];
    int win;
    win = api_openwin(buf, 150, 100, -1, "star");
    api_boxfilwin(win, 6, 26, 143, 93, 0);
    int i = 0;
    
    for (i = 0; i < 8; i++) {
        api_linewin(win, 8, 26, 77, i*9 + 26, 4);
        api_linewin(win, 88, 26, i*9+88, 89, 4);
    }

    api_refreshwin(win, 6, 26, 154, 90);
        
    while (api_getkey(1) != 0x1c) {}

    api_closewin(win);    
    
    return;
}



