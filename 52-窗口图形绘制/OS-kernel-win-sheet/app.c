void api_putchar(int c);
void api_putstr(char *s);
int  api_openwin(char *buf, int xsiz, int ysiz, int col_inv, char *title);
void api_putstrwin(int win, int x, int y, int col, int len, char *str);
void api_boxfilwin(int win, int x0, int y0, int x1, int y1, int col);
void api_point(int win, int x, int y, int col);
void api_refreshwin(int win, int x0, int y0, int x1, int y1);
void api_linewin(int win, int x0, int y0, int x1, int y1, int col);

#define _A  214013LL
#define _B  2531011LL
int ran = 23;
int  rand() {
  return ((ran = ran * _A + _B)>>16) & 0x7fff;
}

void main() {
    char buf[160 * 100];
    int win;
    win = api_openwin(buf, 150, 100, -1, "star");
    api_boxfilwin(win, 6, 26, 143, 93, 0);
//    api_point(win, 75, 59, 3);
    int i = 0;
/*    int x = 0;
    int y = 0;
    for (i = 0; i < 50; i++) {
        x = rand() % 137 + 6;
        y = rand() % 67 + 26;
        api_point(win, x, y, 3);
    }
  */  
    
    for (i = 0; i < 8; i++) {
        api_linewin(win, 8, 26, 77, i*9 + 26, i);
        api_linewin(win, 88, 26, i*9+88, 89, i);
    }
    
    api_refreshwin(win, 6, 26, 154, 90);
    
    return;
}



