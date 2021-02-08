# mem 第一个控制台程序

# 1.简介

操作系统的一个重要功能是平台功能 也就是它能提供基础设施让其他程序运行在其自身之上

甚至不少应用程序发展到后期 它自身的代码量和复杂度比运行它的操作系统还要复杂

例如现在的chrome

有一类程序叫命令行程序 此类程序没有花哨的窗口特效

他们的运行方法是 用户在黑色的命令行窗口中 输入程序的名字 

后面跟着提交给程序的参数 点击回车 然后程序开始运行 然后把计算后的结果展示在命令行窗口里

早期的DOS 以及现在Linux系统的Shell 都可以通过命令行来运行一系列程序

我们这一节的内容 就是实现一个命令行程序运行的功能



# 2.代码

我们首先要解决的是文字的滚屏问题 也就是当我们在控制台输入命令

按下回车后 文字能向上滚动一行 由于单个字体的高度是16个像素 那么滚动一行的实现方式

就是把一个窗体内的像素向上挪动16个像素单位

具体的实现代码如下

```
int cons_newline(int cursor_y, struct SHEET *sheet) {
    int x, y;

    if (cursor_y < 28 + 112) {
         cursor_y += 16;
    } else {
         for (y = 28; y < 28 + 112; y++) {
             for (x = 8; x < 8 + 240; x++) {
                 sheet->buf[x + y * sheet->bxsize] =
                 sheet->buf[x + (y + 16) * sheet->bxsize];
             }
         }

         for (y = 28 + 112; y < 28 + 128; y++) {
             for (x = 8; x < 8 + 240; x++) {
                 sheet->buf[x + y * sheet->bxsize] = COL8_000000;
             }
         }

         sheet_refresh(shtctl, sheet, 8, 28, 8+240, 28+128);
   }

    showString(shtctl, sheet, 8, cursor_y, COL8_FFFFFF, ">"); 
    return cursor_y;
}
```

cons_newline 用来实现控制台的文字向上滚动

它的做法很简单 就是把控制台的像素逐个向上移动16个单位即可

移动后最底部的一行用黑色填充

第一个输入参数cursor_y用来表示当前控制台输入所在的y坐标

第二个参数是控制台窗口的图层对象

代码中第一个for循环就是把像素依次上移16个单位

第二个循环 目的是把最后一行用黑色填充

最后程序在新的一行输出一个”>”符号

同时返回新一行的y坐标



当命令行控制台接收到的按键是回车时 调用该函数 实现换行功能

```
void console_task(struct SHEET *sheet, int memtotal) {
    ....
    for(;;) {
    ....
     else if (i == KEY_RETURN) {
                set_cursor(shtctl, sheet, cursor_x, cursor_y, COL8_000000);

                cursor_y = cons_newline(cursor_y, sheet);
     }
    ....
    }
}
```

每次回车换行时 我们先把光标的白色块给抹掉

然后执行换行逻辑 这样每次我们在控制台中点击回车时 我们的输入光标都会顺利的出现在新的一行



**接下来 我们就可以实现mem命令功能了**

它的逻辑简单 每当回车按下时

命令行进程看看输入的字符是否是字符串”mem”

如果是的话 那么调用内存管理接口 获取当前可用内存大小

然后以字符串的形式输出到控制台

我们看看具体实现

```
void console_task(struct SHEET *sheet, int memtotal) {

    ....
    char  cmdline[30];
    for(;;) {
    ....
    else if (i == KEY_RETURN) {
                set_cursor(shtctl, sheet, cursor_x, cursor_y, COL8_000000);
                cmdline[cursor_x / 8 - 2] = 0;
                cursor_y = cons_newline(cursor_y, sheet); 
                if (cmdline[0] == 'm' && cmdline[1]== 'e' && cmdline[2] == 'm'
                  && cmdline[3] == 0) {
                    char *s = intToHexStr(memtotal / (1024));
                    showString(shtctl,sheet,16,cursor_y,COL8_FFFFFF, "free ");
                    showString(shtctl,sheet,52,cursor_y, COL8_FFFFFF, s);
                    showString(shtctl, sheet, 126, cursor_y, COL8_FFFFFF, " KB");
                    cursor_y = cons_newline(cursor_y, sheet);
                }
                cursor_x = 16;
            }
    ....
    else {
                       char c = transferScanCode(i);
                       if (cursor_x < 240 && c!=0 ) {
                           set_cursor(shtctl, sheet, cursor_x, cursor_y,COL8_000000);
                           char s[2] = {c, 0};
                           cmdline[cursor_x/8 - 2] = c;
                           showString(shtctl, sheet, cursor_x, cursor_y, COL8_FFFFFF, s);
                           cursor_x += 8;
                       }
                }
    }

    ....
}
```

代码中 第二个else是处理处理普通输入字符的情况

此时我们把当前输入的字符全部放入到缓冲区cmdline中

当回车键按下时 我们判断cmdline中的字符形成的字符串是不是”mem”

如果是的话 我们把当前可用内存的大小转换成十六进制字符串

然后显示到控制台窗口中 当前可用内存大小是从函数入口处传进来的

是主进程启动命令行控制台进程时 传进来的一个参数

代码如下

```
struct SHEET*  launch_console() {
....
*((int*)(task_console->tss.esp + 4)) = (int)sht_cons;
*((int*)(task_console->tss.esp + 8)) = memman_total(memman);
....
}
```

主进程在启动命令行控制台前 把当前可用内存的大小放入到控制台进程的堆栈中

控制台进程启动它的主函数后 从他的输入参数中 获得主进程传进来的信息

完成系列代码后，我们就可以实现mem命令功能了



# 3.编译和运行

make

java

img

【图片】