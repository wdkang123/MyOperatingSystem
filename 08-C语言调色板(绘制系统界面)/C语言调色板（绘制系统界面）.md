# C语言调色板（绘制系统界面）

这可是重要的一节 而且流程还比较繁琐 所以要好好弄一下呀！

# 1.简介

在上一节 已经完成了C语言图像的绘制 这节课 我们来写一个像模像样的系统界面

把多种RGB颜色的24位数值放入到一个数组中 原来的八位数不再对应一个颜色值 而是变成这个数组的下标 

硬件在显示像素颜色时，从像素对应的显存读取这个八位数，然后把这个数当做下标，在RGB颜色素组中找到对应的RGB颜色值，再把这个颜色值显示到对应的像素上



# 2.简单上手

先来简单定义一些色彩 只有16种 编号0-15

```
0x000000 全黑
0xff0000 亮红
0x00ff00 亮绿
0xffff00 亮黄
0x0000ff 亮蓝
0xff00ff 亮紫
0x00ffff 浅亮
0xffffff 全白
0xc6c6c6 亮灰
0x840000 暗红
0x008400 暗绿
0x848400 暗黄
0x000084 暗蓝
0x840084 暗紫
0x008484 浅暗蓝
0x848484 暗灰
```

要想使得显存系统将颜色的显示模式转换成调色板模式 我们必须给系统发生指令 通知它改变运作方式 

计算机硬件通过端口给硬件发送命令 想发送命令时 给某个指定的端口写入特定数值

硬件接收到命令后 可产生一些反馈 

这些反馈也会存入某些指定的端口 程序只要读取某些端口就可以得到反馈的数据

汇编语言中 从指定端口读取数据的指令叫in 

（由于C语言无法直接操作硬件 所以这里读写端口还是依靠汇编）：

```assembly
	  io_in8:
      mov  edx, [esp + 4]
      mov  eax, 0
      in   al, dx
      ret

    io_in16:
      mov  edx, [esp + 4]
      mov  eax, 0
      in   ax, dx
      ret

    io_in32:
      mov edx, [esp + 4]
      in  eax, dx
      ret

    io_out8:
       mov edx, [esp + 4]
       mov al, [esp + 8]
       out dx, al
       ret

    io_out16:
       mov edx, [esp + 4]
       mov eax, [esp + 8]
       out dx, ax
       ret

    io_out32:
        mov edx, [esp + 4]
        mov eax, [esp + 8]
        out dx, eax
        ret

    io_cli:
      CLI
      RET
    io_load_eflags:
        pushfd
        pop  eax
        ret

    io_store_eflags:
        mov eax, [esp + 4]
        push eax
        popfd
        ret
```

## 2.1 io_in8

io_in8 是向al指定的端口读入一个8位的数值

## 2.2 io_in16

io_in16 是向al指定的端口读入16位的数值

## 2.3 in_out8

in_out8 是向指定的端口写入8位的数值汇编提供硬件操作功能  那么C语言就可以直接使用了

## 2.4 C读取

 **如果在C语言代码中 要想从某个端口读取数据：**

```c
byte portValue = io_in8(portNum);
```

## 2.5 C写入

**C语言要想将数据写入某个端口：**

```
io_out8(portNum, portValue);
```

## 2.6 io_cli

io_cli 的作用是关闭中断 cpu在计算时 如果接收到中断信号 它会放下当前的任务 然后去处理相关的事件 但如果当前处理的任务不允许做到一半就放下来的话 那么我们必须关闭中断信号的发生机制 以避免CPU被干扰

## 2.7 EFLAGS

在CPU上 还有一个专门的寄存器叫EFLAGS  这是一个16位的寄存器 

这个寄存器的某一位如果设置成1 那么对应的某种硬件功能就可以使用 

如果设置为0 那么该功能 CPU就禁止使用

中断功能对应该寄存器的第9位，也就是说，第9位如果设置为1，那么中断功能就会被打开，如果设置为0，中断功能就会被关闭。CLI指令实际上，就是通过把这个寄存器的第9位设置成0，从而实现禁止中断功能的。

## 2.8 is_load_eflags

io_load_eflags, 这个调用功能就是要把EFLAGS寄存器的数据保存在寄存器eax中

有一个问题是，就算汇编语言，也不能直接访问EFLAGS寄存器，

因为汇编中没有 “mov eax, EFLAGS” 这种指令，但是pushfd 这个指令是专门把EFLAGS寄存器的内容压入堆栈的，

所以，要把EFLAGS的数据保留到eax中，必须先使用指令 pushfd把EFLAGS的数据压入堆栈，然后再从堆栈中，把压入的数据弹出到eax寄存器里面。



## 2.9 调色板（C语言）

把调色板的数据发送给硬件需要以下操作步骤：
（1）关闭中断，防止CPU被干扰
（2）将调色板的号码写入端口0x03c8, 由于我们现在只有一个调色板，因此调色板的编号默认为0，如果要设置多个调色板，那么其他调色板的编号可以一次为1，2…等
（3）将RGB的颜色数值依次写入端口0x3c9, 假设我们要写入的RGB颜色值是
0x848484 暗灰



C语言代码：（write_vga.c）

```c
void io_hlt(void);
void io_cli(void);
void io_out(int port, int data);
int  io_load_eflags(void);
void io_store_eflags(int eflags);

void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);

void CMain(void) {
    int i;
    char*p = 0;

    init_palette();

    for (i = 0xa0000; i <= 0xaffff; i++) {
        p = i;
        *p = i & 0x0f;  
    }

    for(;;) {
       io_hlt();
    }

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
        io_out8(0x03c9,  rgb[0] );
        io_out8(0x03c9,  rgb[1] );
        io_out8(0x03c9,  rgb[2] );

        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}
```



# 3.调色板编译（我是MAC环境）

其实流程和我们上次的流程差不多

交叉编译 - 反汇编 - 再汇编

编译C文件

```shell
i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga.o write_vga.c
```

目录下会生成write_vga.o二进制文件 接着使用objconv（之前课里有 也可以自己编译一个版本）进行反汇编

把objconv拿到这个目录下（项目里 我会打包的）

```shell
./objconv -fnasm write_vga.o write_vga.asm
```

反汇编后代码如下:

```assembly
; Disassembly of file: write_vga.o
; Thu Jan 28 16:05:00 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global init_palette: function
global set_palette: function

extern io_store_eflags                                  ; near
extern io_out8                                          ; near
extern io_cli                                           ; near
extern io_load_eflags                                   ; near
extern io_hlt                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 0006 _ C7. 45, F0, 00000000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 655360                 ; 0012 _ C7. 45, F4, 000A0000
        jmp     ?_002                                   ; 0019 _ EB, 16

?_001:  mov     eax, dword [ebp-0CH]                    ; 001B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 001E _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 0021 _ 8B. 45, F4
        and     eax, 0FH                                ; 0024 _ 83. E0, 0F
        mov     dl, al                                  ; 0027 _ 88. C2
        mov     eax, dword [ebp-10H]                    ; 0029 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 002C _ 88. 10
        inc     dword [ebp-0CH]                         ; 002E _ FF. 45, F4
?_002:  cmp     dword [ebp-0CH], 720895                 ; 0031 _ 81. 7D, F4, 000AFFFF
        jle     ?_001                                   ; 0038 _ 7E, E1
?_003:  call    io_hlt                                  ; 003A _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003F _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0041 _ 55
        mov     ebp, esp                                ; 0042 _ 89. E5
        sub     esp, 8                                  ; 0044 _ 83. EC, 08
        sub     esp, 4                                  ; 0047 _ 83. EC, 04
        push    table_rgb.1523                          ; 004A _ 68, 00000000(d)
        push    15                                      ; 004F _ 6A, 0F
        push    0                                       ; 0051 _ 6A, 00
        call    set_palette                             ; 0053 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0058 _ 83. C4, 10
        nop                                             ; 005B _ 90
        leave                                           ; 005C _ C9
        ret                                             ; 005D _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 005E _ 55
        mov     ebp, esp                                ; 005F _ 89. E5
        sub     esp, 24                                 ; 0061 _ 83. EC, 18
        call    io_load_eflags                          ; 0064 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0069 _ 89. 45, F0
        call    io_cli                                  ; 006C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0071 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0074 _ FF. 75, 08
        push    968                                     ; 0077 _ 68, 000003C8
        call    io_out8                                 ; 007C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0081 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0084 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0087 _ 89. 45, F4
        jmp     ?_005                                   ; 008A _ EB, 56

?_004:  mov     eax, dword [ebp+10H]                    ; 008C _ 8B. 45, 10
        mov     al, byte [eax]                          ; 008F _ 8A. 00
        movzx   eax, al                                 ; 0091 _ 0F B6. C0
        sub     esp, 8                                  ; 0094 _ 83. EC, 08
        push    eax                                     ; 0097 _ 50
        push    969                                     ; 0098 _ 68, 000003C9
        call    io_out8                                 ; 009D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A2 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00A5 _ 8B. 45, 10
        inc     eax                                     ; 00A8 _ 40
        mov     al, byte [eax]                          ; 00A9 _ 8A. 00
        movzx   eax, al                                 ; 00AB _ 0F B6. C0
        sub     esp, 8                                  ; 00AE _ 83. EC, 08
        push    eax                                     ; 00B1 _ 50
        push    969                                     ; 00B2 _ 68, 000003C9
        call    io_out8                                 ; 00B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00BF _ 8B. 45, 10
        add     eax, 2                                  ; 00C2 _ 83. C0, 02
        mov     al, byte [eax]                          ; 00C5 _ 8A. 00
        movzx   eax, al                                 ; 00C7 _ 0F B6. C0
        sub     esp, 8                                  ; 00CA _ 83. EC, 08
        push    eax                                     ; 00CD _ 50
        push    969                                     ; 00CE _ 68, 000003C9
        call    io_out8                                 ; 00D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D8 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 00DB _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 00DF _ FF. 45, F4
?_005:  mov     eax, dword [ebp-0CH]                    ; 00E2 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 00E5 _ 3B. 45, 0C
        jle     ?_004                                   ; 00E8 _ 7E, A2
        sub     esp, 12                                 ; 00EA _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 00ED _ FF. 75, F0
        call    io_store_eflags                         ; 00F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F5 _ 83. C4, 10
        nop                                             ; 00F8 _ 90
        leave                                           ; 00F9 _ C9
        ret                                             ; 00FA _ C3
; set_palette End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

table_rgb.1523:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........


SECTION .bss    align=1 noexecute                       ; section number 3, bss
```

这里要删除一些东西（不知道的看上节）

删除后的文件（对比一下）：

```assembly
; Disassembly of file: write_vga.o
; Thu Jan 28 16:05:00 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 0006 _ C7. 45, F0, 00000000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 655360                 ; 0012 _ C7. 45, F4, 000A0000
        jmp     ?_002                                   ; 0019 _ EB, 16

?_001:  mov     eax, dword [ebp-0CH]                    ; 001B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 001E _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 0021 _ 8B. 45, F4
        and     eax, 0FH                                ; 0024 _ 83. E0, 0F
        mov     dl, al                                  ; 0027 _ 88. C2
        mov     eax, dword [ebp-10H]                    ; 0029 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 002C _ 88. 10
        inc     dword [ebp-0CH]                         ; 002E _ FF. 45, F4
?_002:  cmp     dword [ebp-0CH], 720895                 ; 0031 _ 81. 7D, F4, 000AFFFF
        jle     ?_001                                   ; 0038 _ 7E, E1
?_003:  call    io_hlt                                  ; 003A _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003F _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 0041 _ 55
        mov     ebp, esp                                ; 0042 _ 89. E5
        sub     esp, 8                                  ; 0044 _ 83. EC, 08
        sub     esp, 4                                  ; 0047 _ 83. EC, 04
        push    table_rgb.1523                          ; 004A _ 68, 00000000(d)
        push    15                                      ; 004F _ 6A, 0F
        push    0                                       ; 0051 _ 6A, 00
        call    set_palette                             ; 0053 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0058 _ 83. C4, 10
        nop                                             ; 005B _ 90
        leave                                           ; 005C _ C9
        ret                                             ; 005D _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 005E _ 55
        mov     ebp, esp                                ; 005F _ 89. E5
        sub     esp, 24                                 ; 0061 _ 83. EC, 18
        call    io_load_eflags                          ; 0064 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0069 _ 89. 45, F0
        call    io_cli                                  ; 006C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0071 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0074 _ FF. 75, 08
        push    968                                     ; 0077 _ 68, 000003C8
        call    io_out8                                 ; 007C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0081 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0084 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0087 _ 89. 45, F4
        jmp     ?_005                                   ; 008A _ EB, 56

?_004:  mov     eax, dword [ebp+10H]                    ; 008C _ 8B. 45, 10
        mov     al, byte [eax]                          ; 008F _ 8A. 00
        movzx   eax, al                                 ; 0091 _ 0F B6. C0
        sub     esp, 8                                  ; 0094 _ 83. EC, 08
        push    eax                                     ; 0097 _ 50
        push    969                                     ; 0098 _ 68, 000003C9
        call    io_out8                                 ; 009D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A2 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00A5 _ 8B. 45, 10
        inc     eax                                     ; 00A8 _ 40
        mov     al, byte [eax]                          ; 00A9 _ 8A. 00
        movzx   eax, al                                 ; 00AB _ 0F B6. C0
        sub     esp, 8                                  ; 00AE _ 83. EC, 08
        push    eax                                     ; 00B1 _ 50
        push    969                                     ; 00B2 _ 68, 000003C9
        call    io_out8                                 ; 00B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00BF _ 8B. 45, 10
        add     eax, 2                                  ; 00C2 _ 83. C0, 02
        mov     al, byte [eax]                          ; 00C5 _ 8A. 00
        movzx   eax, al                                 ; 00C7 _ 0F B6. C0
        sub     esp, 8                                  ; 00CA _ 83. EC, 08
        push    eax                                     ; 00CD _ 50
        push    969                                     ; 00CE _ 68, 000003C9
        call    io_out8                                 ; 00D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D8 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 00DB _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 00DF _ FF. 45, F4
?_005:  mov     eax, dword [ebp-0CH]                    ; 00E2 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 00E5 _ 3B. 45, 0C
        jle     ?_004                                   ; 00E8 _ 7E, A2
        sub     esp, 12                                 ; 00EA _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 00ED _ FF. 75, F0
        call    io_store_eflags                         ; 00F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F5 _ 83. C4, 10
        nop                                             ; 00F8 _ 90
        leave                                           ; 00F9 _ C9
        ret                                             ; 00FA _ C3
; set_palette End of function

table_rgb.1523:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
```

接着 我们通过nasm进行编译

打开Kernel asm文件 （别include错了）

```assembly
%include "write_vga.asm"
```

```shell
nasm -o kernel.bat kernel.asm
```

运行后生成了kernel.bat

接着我们通过java代码生成system.img

（这里我们要注意上节课 提到的 扇区的事情）

运行后 java控制台输出：

```
Load file boot.bat to floppy with cylinder: 0 and sector:1
Load file kernel.bat to floppy with cylinder: 1 and sector:2
Load file kernel.bat to floppy with cylinder: 1 and sector:3
Load file kernel.bat to floppy with cylinder: 1 and sector:4
```

这是用了4个扇区 所以我们的boot.asm也要修改成4个（小了之后 程序会出错）

```
    mov          AL,  4        ; AL 表示要练习读取几个扇区
```

改完之后编译boot.asm

再运行java程序 最终生成了system.img

我们启动看看：

【图片】





# 4.通过调色板绘制方块

还是上边的老套路 我这里就少写一些

C编译（write_vga_retangle.c）

```shell
i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_retangle.o write_vga_retangle.c
```

反汇编

```shell
./objconv -fnasm write_vga_retangle.o write_vga_retangle.asm
```

删除掉无用的信息

结果：

```assembly
; Disassembly of file: write_vga_retangle.o
; Thu Jan 28 16:18:18 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-0CH], 655360                 ; 0006 _ C7. 45, F4, 000A0000
        call    init_palette                            ; 000D _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 0012 _ 83. EC, 04
        push    120                                     ; 0015 _ 6A, 78
        push    120                                     ; 0017 _ 6A, 78
        push    20                                      ; 0019 _ 6A, 14
        push    20                                      ; 001B _ 6A, 14
        push    1                                       ; 001D _ 6A, 01
        push    320                                     ; 001F _ 68, 00000140
        push    dword [ebp-0CH]                         ; 0024 _ FF. 75, F4
        call    boxfill8                                ; 0027 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 002C _ 83. C4, 20
        sub     esp, 4                                  ; 002F _ 83. EC, 04
        push    150                                     ; 0032 _ 68, 00000096
        push    170                                     ; 0037 _ 68, 000000AA
        push    50                                      ; 003C _ 6A, 32
        push    70                                      ; 003E _ 6A, 46
        push    2                                       ; 0040 _ 6A, 02
        push    320                                     ; 0042 _ 68, 00000140
        push    dword [ebp-0CH]                         ; 0047 _ FF. 75, F4
        call    boxfill8                                ; 004A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 004F _ 83. C4, 20
        sub     esp, 4                                  ; 0052 _ 83. EC, 04
        push    180                                     ; 0055 _ 68, 000000B4
        push    220                                     ; 005A _ 68, 000000DC
        push    80                                      ; 005F _ 6A, 50
        push    120                                     ; 0061 _ 6A, 78
        push    4                                       ; 0063 _ 6A, 04
        push    320                                     ; 0065 _ 68, 00000140
        push    dword [ebp-0CH]                         ; 006A _ FF. 75, F4
        call    boxfill8                                ; 006D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0072 _ 83. C4, 20
?_001:  call    io_hlt                                  ; 0075 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 007A _ EB, F9
; CMain End of function

init_palette:; Function begin
        push    ebp                                     ; 007C _ 55
        mov     ebp, esp                                ; 007D _ 89. E5
        sub     esp, 8                                  ; 007F _ 83. EC, 08
        sub     esp, 4                                  ; 0082 _ 83. EC, 04
        push    table_rgb.1527                          ; 0085 _ 68, 00000000(d)
        push    15                                      ; 008A _ 6A, 0F
        push    0                                       ; 008C _ 6A, 00
        call    set_palette                             ; 008E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0093 _ 83. C4, 10
        nop                                             ; 0096 _ 90
        leave                                           ; 0097 _ C9
        ret                                             ; 0098 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0099 _ 55
        mov     ebp, esp                                ; 009A _ 89. E5
        sub     esp, 24                                 ; 009C _ 83. EC, 18
        call    io_load_eflags                          ; 009F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 00A4 _ 89. 45, F0
        call    io_cli                                  ; 00A7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 00AC _ 83. EC, 08
        push    dword [ebp+8H]                          ; 00AF _ FF. 75, 08
        push    968                                     ; 00B2 _ 68, 000003C8
        call    io_out8                                 ; 00B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BC _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 00BF _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 00C2 _ 89. 45, F4
        jmp     ?_003                                   ; 00C5 _ EB, 56

?_002:  mov     eax, dword [ebp+10H]                    ; 00C7 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 00CA _ 8A. 00
        movzx   eax, al                                 ; 00CC _ 0F B6. C0
        sub     esp, 8                                  ; 00CF _ 83. EC, 08
        push    eax                                     ; 00D2 _ 50
        push    969                                     ; 00D3 _ 68, 000003C9
        call    io_out8                                 ; 00D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DD _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00E0 _ 8B. 45, 10
        inc     eax                                     ; 00E3 _ 40
        mov     al, byte [eax]                          ; 00E4 _ 8A. 00
        movzx   eax, al                                 ; 00E6 _ 0F B6. C0
        sub     esp, 8                                  ; 00E9 _ 83. EC, 08
        push    eax                                     ; 00EC _ 50
        push    969                                     ; 00ED _ 68, 000003C9
        call    io_out8                                 ; 00F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F7 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 00FA _ 8B. 45, 10
        add     eax, 2                                  ; 00FD _ 83. C0, 02
        mov     al, byte [eax]                          ; 0100 _ 8A. 00
        movzx   eax, al                                 ; 0102 _ 0F B6. C0
        sub     esp, 8                                  ; 0105 _ 83. EC, 08
        push    eax                                     ; 0108 _ 50
        push    969                                     ; 0109 _ 68, 000003C9
        call    io_out8                                 ; 010E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0113 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0116 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 011A _ FF. 45, F4
?_003:  mov     eax, dword [ebp-0CH]                    ; 011D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0120 _ 3B. 45, 0C
        jle     ?_002                                   ; 0123 _ 7E, A2
        sub     esp, 12                                 ; 0125 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0128 _ FF. 75, F0
        call    io_store_eflags                         ; 012B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0130 _ 83. C4, 10
        nop                                             ; 0133 _ 90
        leave                                           ; 0134 _ C9
        ret                                             ; 0135 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0136 _ 55
        mov     ebp, esp                                ; 0137 _ 89. E5
        sub     esp, 20                                 ; 0139 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 013C _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 013F _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0142 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0145 _ 89. 45, F8
        jmp     ?_007                                   ; 0148 _ EB, 30

?_004:  mov     eax, dword [ebp+14H]                    ; 014A _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 014D _ 89. 45, FC
        jmp     ?_006                                   ; 0150 _ EB, 1D

?_005:  mov     eax, dword [ebp-8H]                     ; 0152 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0155 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0159 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 015B _ 8B. 45, FC
        add     eax, edx                                ; 015E _ 01. D0
        mov     edx, eax                                ; 0160 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0162 _ 8B. 45, 08
        add     edx, eax                                ; 0165 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0167 _ 8A. 45, EC
        mov     byte [edx], al                          ; 016A _ 88. 02
        inc     dword [ebp-4H]                          ; 016C _ FF. 45, FC
?_006:  mov     eax, dword [ebp-4H]                     ; 016F _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0172 _ 3B. 45, 1C
        jle     ?_005                                   ; 0175 _ 7E, DB
        inc     dword [ebp-8H]                          ; 0177 _ FF. 45, F8
?_007:  mov     eax, dword [ebp-8H]                     ; 017A _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 017D _ 3B. 45, 20
        jle     ?_004                                   ; 0180 _ 7E, C8
        nop                                             ; 0182 _ 90
        nop                                             ; 0183 _ 90
        leave                                           ; 0184 _ C9
        ret                                             ; 0185 _ C3
; boxfill8 End of function

table_rgb.1527:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0000 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0008 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0010 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0018 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0020 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0028 _ ........
```

接着 我们通过nasm进行编译

打开Kernel asm文件 （别include错了）

```assembly
%include "write_vga_retangle.asm"
```

```shell
nasm -o kernel.bat kernel.asm
```

运行后生成了kernel.bat

(自己注意扇区的事情)

```
Load file boot.bat to floppy with cylinder: 0 and sector:1
Load file kernel.bat to floppy with cylinder: 1 and sector:2
Load file kernel.bat to floppy with cylinder: 1 and sector:3
Load file kernel.bat to floppy with cylinder: 1 and sector:4
```

装载运行：

【图片】



# 5.再上一层楼

编译C语言：（write_vga_desktop.asm）

```shell
i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c
```

反汇编

```shell
./objconv -fnasm write_vga_desktop.o write_vga_desktop.asm
```

删除掉无用的信息

修改kernel.asm

```assembly
%include "write_vga_desktop.asm"
```

```shell
nasm -o kernel.bat kernel.asm
```

运行后生成了kernel.bat

（注意扇区大小）

运行java代码：

```
Load file boot.bat to floppy with cylinder: 0 and sector:1
Load file kernel.bat to floppy with cylinder: 1 and sector:2
Load file kernel.bat to floppy with cylinder: 1 and sector:3
Load file kernel.bat to floppy with cylinder: 1 and sector:4
Load file kernel.bat to floppy with cylinder: 1 and sector:5
```

装载运行

【图片】





