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

int  api_alloctimer();
void api_inittimer(int timer, int data);
void api_settimer(int timer, int time);
void api_freetimer(int timer);

#define win_width 270

void putstr(int win, char *winbuf,char * charset,
 int x, int y, int col, unsigned char *s) {
    int c, x0, i = 0, j;
    char *p, *q, t[2];
    x = x*8+8;
    y = y*16+29;
    x0 = x;
    while (s[i] != 0) {
        i++;
    }

    api_boxfilwin(win, 8, y, win_width - 8 , y+15, 0);

    q = winbuf + y * win_width; 
    t[1] = 0;
    for (;;) {
        c = *s;
        if (c == 0) {
            break;
        }
        if (c != ' ') {
            if ('a' <= c && c <= 'h') {
                p = charset + 16 * (c-'a');
                q += x;
                for (i = 0; i < 16; i++) {
                    
                    if ((p[i] & 0x80) != 0) {q[0] = col;}
                    if ((p[i] & 0x40) != 0) {q[1] = col;}
                    if ((p[i] & 0x20) != 0) {q[2] = col;}
                    if ((p[i] & 0x10) != 0) {q[3] = col;}
                    if ((p[i] & 0x08) != 0) {q[4] = col;}
                    if ((p[i] & 0x04) != 0) {q[5] = col;}
                    if ((p[i] & 0x02) != 0) {q[6] = col;}
                    if ((p[i] & 0x01) != 0) {q[7] = col;}
                    
                    q += win_width; 
                }
                q -= win_width * 16 + x;

            } else if((c>='i' && c <= 'z') || (c>='A' && c <= 'Z')) {
                t[0] = *s;
                api_putstrwin(win, x, y, col,1,t);
            }
        }

        s++;
        x += 8;
    }

    api_refreshwin(win,  8, y, win_width - 8, y+15);

}


void waitting(int i, int timer, char* keyflag) {
    int j;
    if (i > 0) {
        api_settimer(timer, i);
        i = 128;
    } else {
        i = 0x1c;
    }

    for(;;) {
        j = api_getkey(1);
        if (i == j) {
            break;
        }

        if (j == 0x24) {
          //key j
            keyflag[0] = 1;
        }
        if (j == 0x25) {
            //key k
            keyflag[1] = 1;
        }
        if (j == 0x39) {
            //key space
            keyflag[2] = 1;
        }
    }

    return;
}


void main() {
    int win, i, j, ix, iy, fx, timer;
    char winbuf[win_width * 237], invstr[32*6] = {0}, s[12], keyflag[6];
    char* p = winbuf;
    int idir, movewait0, movewait;

    char invstr0[36] = {' ' , 'a','b','c','d',' ' ,'a','b','c','d', ' ',
                         'a','b','c','d',' ',  'a','b','c','d',' ',
                           'a','b','c','d', ' ',
                         0};
  
    char charset[18 * 8] = {
    0x00, 0x00, 0x00, 0x43, 0x5f, 0x5f, 0x5f, 0x7f,
    0x1f, 0x1f, 0x1f, 0x1f, 0x00, 0x20, 0x3f, 0x00,

    0x00, 0x0f, 0x7f, 0xff, 0xcf, 0xcf, 0xcf, 0xff,
    0xff, 0xe0, 0xff, 0xff, 0xc0, 0xc0, 0xc0, 0x00,

    0x00, 0xf0, 0xfe, 0xff, 0xf3, 0xf3, 0xf3, 0xff,
    0xff, 0x07, 0xff, 0xff, 0x03, 0x03, 0x03, 0x00,

    0x00, 0x00, 0x00, 0xc2, 0xfa, 0xfa, 0xfa, 0xfe,
    0xf8, 0xf8, 0xf8, 0xf8, 0x00, 0x04, 0xfc, 0x00,

    0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x43, 0x47, 0x4f, 0x5f, 0x7f, 0x7f, 0x00,

    0x18, 0x7e, 0xff, 0xc3, 0xc3, 0xc3, 0xc3, 0xff,
    0xff, 0xff, 0xe7, 0xe7, 0xe7, 0xe7, 0xff, 0x00,

    0x00, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
    0x80, 0xc2, 0xe2, 0xf2, 0xfa, 0xfe, 0xfe, 0x00,

    0x00, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
    0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x00
    };

    win = api_openwin(winbuf, win_width, 237, -1, "invader");
    api_boxfilwin(win, 8, 29, win_width - 6, 228, 0);
    timer = api_alloctimer();
    api_inittimer(timer, 128);

nextgroup:
    fx = 18;
    char fly[8] = {'e', 'f', 'g', 0};
    putstr(win, winbuf, charset, 18, 11, 6, fly);
    movewait0 = 20;


    ix =  7;
    iy = 1;
    int invline = 3;
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 20; j++) {
            invstr[i * 32 + j] = invstr0[j];
        }
        putstr(win, winbuf,charset, ix, iy + i, 2, invstr + i * 32);
    }
    
    keyflag[0] = 0;
    keyflag[1] = 0;
    keyflag[2] = 0;

    int ly = 0, lx = 0;
    int laserwait = 0;
    movewait = movewait0;
    idir = 1;

    for(;;) {
        if (laserwait != 0) {
            laserwait--;
            keyflag[2] = 0;
        }

        waitting(4, timer, keyflag);

        if (keyflag[0] != 0 && fx > 1) {
           //fighter fly to left
           fx--;
           fly[0] = 'e', fly[1] = 'f', fly[2] = 'g', fly[3] = ' ';
           fly[4] = 0;
           putstr(win, winbuf, charset, fx, 11, 6, fly); 
           keyflag[0] = 0;
        }
        if (keyflag[1] != 0 && fx < 24) {
           fx++;
           fly[0] = ' ', fly[1] = 'e', fly[2] = 'f', fly[3] = 'g';
           fly[4] = 0;
           putstr(win, winbuf, charset, fx, 11, 6, fly);
           keyflag[1] = 0;
        }
        if (keyflag[2] != 0 && laserwait == 0) {
           //shooting
           laserwait = 15;
           lx = fx + 1;
           ly = 8;
        }

        //move aliens
        if (movewait != 0) {
            movewait--;
        } else {
            movewait = movewait0;
            if (ix + idir > 12 || ix + idir < 1) {
                if (iy + invline == 10) {
                   //game over
                   api_boxfilwin(win, 8, 29, win_width - 6, 228, 0);
                   goto gameover;
                }
                idir = -idir;
                putstr(win, winbuf, charset,ix + 1, iy, 0, "  ");
                iy++;
            } else {
                ix += idir;
            }
            for (i = 0; i < invline; i++) {
                putstr(win, winbuf,charset, ix, iy + i, 2, invstr + i * 32);
            }
        }

        //draw laser bullet
        if (ly > 0) {
            if (ly < 8) {
                if (ix < lx && lx < ix + 25 && iy <= ly && ly < iy + invline) {
                    putstr(win, winbuf, charset, ix, ly, 2, invstr + (ly - iy) * 32);
                }//if (ix < lx ...)
                else {
                    putstr(win, winbuf, charset, lx, ly, 0, "  ");
               }
            }//if(ly < 13)
            ly--;
            if (ly > 0) {
                char c[2] = {'h', 0};
                putstr(win, winbuf,charset, lx, ly, 3, c);
            } // if(ly > 0)
            
            if (ix < lx && lx < ix + 25 && iy <= ly && ly < iy + invline) {
               p = invstr + (ly - iy) * 32 + (lx - ix);
               if (*p != ' ' ) {
                   //hit
                   for(p--; *p != ' '; p--) {}
                   for (i = 1; i < 5; i++) {
                       p[i] = ' ';
                   }
                  putstr(win, winbuf, charset, ix, ly, 2, invstr+(ly-iy)*32);
                  for(; invline > 0; invline--) {
                      for(p = invstr + (invline-1)*32; *p != 0; p++) {
                          if (*p != ' ') {
                              goto alive;
                          }
                      }
                  } 
            gameover:
                  //hit all 
                  movewait0 -= movewait0 / 3;
                  char gameover[12] = {'G','A','M','E',' ','O','V','E','R'};
                  putstr(win, winbuf, charset, 15, 6, 1, gameover);
                  waitting(10, timer, keyflag);

                  goto nextgroup;
            alive:
                  ly = 0;
               }
            } //if(ix < lx...)
            
        }//if (ly > 0)
    }

   /* wait(0, timer, keyflag);
    for (i = 1; i < 14; i++) {
       putstr(win, winbuf, charset, 0, i, 0, "    ");
    }
    */
    
    api_refreshwin(win, 8, 29, 207, 228);

    for(;;) {
        if (api_getkey(1) == 0x1c) {
            break;
        }
    }

    api_closewin(win);

    return;
}



