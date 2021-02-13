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
int  api_alloctimer(void);
int  api_inittimer(int timer, int data);
int  api_settimer(int timer, int time);
void api_beep(int tone);

#define _A  214013LL
#define _B  2531011LL
int ran = 23;
int  rand() {
  return ((ran = ran * _A + _B)>>16) & 0x7fff;
}

char*  intToStr(int v) {
    char s[3] = {'0'};
    s[2] = 0;
    
    s[1] = v % 10 + '0';
    s[0] = v / 10 + '0';

    return s;
}


void main() {
/*    char buf[160 * 100];
    char s[9] = {'a', 'p', 'p', 0};
    int win, timer, sec = 0, min = 0, hou = 0;
    win = api_openwin(buf, 150, 100, -1, "star");
    int i = 0;
    timer = api_alloctimer();
    api_inittimer(timer, 128);
    char *p;    
    for(;;) {
        api_boxfilwin(win, 6, 26, 143, 93, 7);
        p = intToStr(hou);
        s[0] = *p;
        s[1] = *(p+1);
        s[2] = ':';
        p = intToStr(min);
        s[3] = *p;
        s[4] = *(p+1);
        s[5] = ':';
        p = intToStr(sec);
        s[6] = *p;
        s[7] = *(p+1);
        api_putstrwin(win, 6, 26, 0, 8, s);

        api_settimer(timer, 100);

        if (api_getkey(1) == 0x1c) {
            api_freetimer(timer);
            break;
        }

        sec++;
        if (sec == 60) {
            sec = 0;
            min++;
            if (min == 60) {
                min = 0;
                hou++;
            }
        }
    }
*/

    //more colorful window
    char buf[144 * 164];
    int win = api_openwin(buf, 144, 164, -1, "color2");
    int y, x, r, g, b;
    for (y = 0; y < 128; y++) {
        for (x = 0; x < 128; x++) {
            r = x * 2;
            g = y * 2;
            b = 0;
            buf[(x+8) + (y+28)*144] = 16 + (r/43) + (g/43)*6 + (b/43)*36;            
        }
    }

    api_refreshwin(win, 8, 28, 136, 156);
    while(api_getkey(1) != 0x1c){}
    api_closewin(win);    
    return;
}

