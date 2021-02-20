# MessageBox

# 1.简介

早年学习win32 GUI编程 通过调用一个API 叫MessageBox

使得程序能快速弹出一个小窗口 当看到这个小窗口出现在屏幕上时 

开心得不得了 觉得非常不可思议

它生动形象 跟原来在控制台上运行的 只能给出黑底白色结果的dos程序完全不同

从此 我从黑色单调的世界进入了称之为“图形界面“的色彩斑斓的绝妙空间



# 2.代码

一个小巧可爱的MessageBox跃然于桌面上 

**下面我们看看它的实现代码**

```
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
```

make_window8 函数是专门用来绘制这个小窗口的

closebtn这个数组 对应的是小窗口右上角的X按钮

这个数组中 @元素所对应的就是图像中关闭按钮的小叉叉

该调用函数中 参数sht对应的就是该小窗口的图层 

代码中 boxfill8这几个函数的调用 作用是绘制窗口的主窗体 

showString调用用来显示小窗口上方的小标题 

下面的两个for循环这是用来绘制小窗台右上角的关闭按钮

```
void message_box(struct SHTCTL *shtctl,  char *title) {
    struct SHEET *sht_win;
    unsigned char *buf_win;

    sht_win = sheet_alloc(shtctl);
    buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 68);
    sheet_setbuf(sht_win, buf_win, 160, 68, -1);

    make_window8(shtctl, sht_win, title);

    showString(shtctl, sht_win, 24, 28, COL8_000000, "Welcome to");
    showString(shtctl, sht_win, 24, 44, COL8_000000, "MyOS");

    sheet_slide(shtctl, sht_win, 80, 72);
    sheet_updown(shtctl, sht_win, 1);
}
```

**主入口函数的变化**

```
void CMain(void) {
   ....
   message_box(shtctl, "windown");

   sheet_updown(shtctl, sht_back, 0);

   sheet_updown(shtctl, sht_mouse, 100);

   io_sti();
   ....
}
```



# 3.编译运行

Make 回车

java 打包

img运行

































