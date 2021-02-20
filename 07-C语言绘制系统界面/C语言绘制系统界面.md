# C语言绘制系统界面

# 1.简介

我们的目标是做出像windows那样具备舒心的图像用户界面那样的系统，所以在这一节，我们由字符模式切换入画面模式，初步体验下，那些绚丽多彩的图像界面是如何发展而成的。



# 2.代码部分

要想由字符模式转入图形模式，我们需要操作硬件，特别是向显卡发送命令，让其进入图形显示模式，就如同前面我们所做的，要操作硬件，一般需要使用BIOS调用，以下几行就是打开VGA显卡色彩功能的代码：

```assembly
mov  al, 0x13h
mov  ah, 0x00
int  0x10
```

其中al 的值决定了要设置显卡的色彩模式，下面是一些常用的模式设置：
0x03, 16色字符模式
0x12, VGA图形模式, 640 * 480 * 4位彩色模式，独特的4面存储模式
0x13, VGA图形模式, 320 * 200 * 8位彩色模式，调色板模式
0x6a, 扩展VGA图形模式， 800 * 600 * 4彩色模式



我们采用的是0x13模式，其中320*200*8 中，最后的数值8表示的是色彩值得位数，也就是我们可以用8位数值表示色彩，总共可以显示256种色彩。

# 2.1 汇编内核

```assembly
%include "pm.inc"

org   0x9000

jmp   LABEL_BEGIN

[SECTION .gdt]
 ;                                  段基址          段界限                属性
LABEL_GDT:          Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,      SegCode32Len - 1,       DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor        0B8000h,         0ffffh,            DA_DRW
LABEL_DESC_VRAM:    Descriptor        0,         0ffffffffh,            DA_DRW
LABEL_DESC_STACK:   Descriptor        0,             TopOfStack,        DA_DRWA+DA_32

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
SelectorStack     equ   LABEL_DESC_STACK  -  LABEL_GDT
SelectorVram      equ   LABEL_DESC_VRAM   -  LABEL_GDT


[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     mov   sp, 0100h

     mov   al, 0x13
     mov   ah, 0
     int   0x10

     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_SEG_CODE32
     mov   word [LABEL_DESC_CODE32 + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_CODE32 + 4], al
     mov   byte [LABEL_DESC_CODE32 + 7], ah

     ;set stack for C language
     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_STACK
     mov   word [LABEL_DESC_STACK + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_STACK + 4], al
     mov   byte [LABEL_DESC_STACK + 7], ah

     xor   eax, eax
     mov   ax, ds
     shl   eax, 4
     add   eax,  LABEL_GDT
     mov   dword  [GdtPtr + 2], eax

     lgdt  [GdtPtr]

     cli   ;关中断

     in    al,  92h
     or    al,  00000010b
     out   92h, al

     mov   eax, cr0
     or    eax , 1
     mov   cr0, eax

     jmp   dword  SelectorCode32: 0

     [SECTION .s32]
     [BITS  32]
     LABEL_SEG_CODE32:
     ;initialize stack for c code
     mov  ax, SelectorStack
     mov  ss, ax
     mov  esp, TopOfStack

     mov  ax, SelectorVram
     mov  ds,  ax

C_CODE_ENTRY:
     %include "write_vga.asm"


     io_hlt:  ;void io_hlt(void);
      HLT
      RET

SegCode32Len   equ  $ - LABEL_SEG_CODE32

[SECTION .gs]
ALIGN 32
[BITS 32]
LABEL_STACK:
times 512  db 0
TopOfStack  equ  $ - LABEL_STACK
```

LABEL_DESC_VRAM, 这个描述符对应的内存起始地址是0，长度是0xffffffff，也就是我们把整个4G内存当做一段可读可写的内存，有了这个设置后，我们在C语言里就可以随意读写内存的任何地方。

LABEL_DESC_STACK 这个描述符用来设置一段可读可写的内存，它的起始地址是LABEL_STACK， 可以看到，程序通过语句：times 512 db 0 初始化了512字节的内存

C语言的运行，特别是函数调用时，是需要一个堆栈来传递参数的，所以为其配置一个堆栈

切记后边分配参数的时候 不可大于512 将会报错

```c
void fun() {
  char buf[513];
}
```

语句%include write_vga.asm”， 表明，我们要开发的C代码文件叫write_vga.c, 我们写完C代码后，会使用上一节的步骤将它编译成汇编，然后include到我们当前的汇编文件里，统一编译成可执行内核。

下面的代码是是进入死循环，HLT指令会让系统进入休眠状态

```assembly
io_hlt: ;void io_hlt(void);
HLT
RET
```



## 2.2 C语言

write_ram.c:

```c
void CMain(void) {
    int i;
    char*p = 0;
    for (i = 0xa0000; i <= 0xaffff; i++) {
        p = i;
        *p = i & 0x0f;  
    }
    for(;;) {
       io_hlt();
    }
}
```

将指针P指向地址0xa0000, 这个地址正好就是vga显存地址，vga显存地址从0xa0000开始，直到0xaffff结束，总共64k.接着语句:

*p = i & 0x0f 将一个数值写入显存，这个值可以是0-256中任意一个数值，我们代码里是将i的最后4位作为像素颜色写入显存，这个值是任意的，大家可以随意设置。



# 2.3 进行编译（我在mac环境上 不是乌班图）

原课程老师是在乌班图上编译的（当然你也可以选择在乌班图上编译）

但我挑战一下 在mac上编译

这里 因为在06节上 我们已经配置了 交叉编译的环境

所以我就在mac本地配置了（我当前是MacOS BigSur 11.1 ）

**下面我们一步一步来：(很重要！！)**

首先 把C写的程序gcc编译走一波：

```shell
i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga.o write_vga.c
```

目录下会生成write_vga.o二进制文件 接着使用objconv（上节课里有 也可以自己编译一个版本）进行反汇编

把objconv拿到这个目录下（项目里 我会打包的）

```shell
./objconv -fnasm write_vga.o write_vga.asm
```

反汇编后代码如下:

```assembly
; Disassembly of file: write_vga.o
; Thu Jan 28 14:44:02 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function

extern io_hlt                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 0006 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 655360                 ; 000D _ C7. 45, F4, 000A0000
        jmp     ?_002                                   ; 0014 _ EB, 16

?_001:  mov     eax, dword [ebp-0CH]                    ; 0016 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 0019 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 001C _ 8B. 45, F4
        and     eax, 0FH                                ; 001F _ 83. E0, 0F
        mov     dl, al                                  ; 0022 _ 88. C2
        mov     eax, dword [ebp-10H]                    ; 0024 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 0027 _ 88. 10
        inc     dword [ebp-0CH]                         ; 0029 _ FF. 45, F4
?_002:  cmp     dword [ebp-0CH], 720895                 ; 002C _ 81. 7D, F4, 000AFFFF
        jle     ?_001                                   ; 0033 _ 7E, E1
?_003:  call    io_hlt                                  ; 0035 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003A _ EB, F9
; CMain End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss




```

这里还不能直接拿来用 需要处理一下

在上面代码中去掉以`section`开始的指令 这些指令会影响我们把当前汇编结合入内核kerne.asm.
同时去掉开头的两句：

```
global CMain: function
extern io_hlt
```

处理后变成：(为了防止弄错 留个对照)

```assembly
; Disassembly of file: write_vga.asm
; Thu Jan 28 14:37:46 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 24                                 ; 0003 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 0006 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 655360                 ; 000D _ C7. 45, F4, 000A0000
        jmp     ?_002                                   ; 0014 _ EB, 16

?_001:  mov     eax, dword [ebp-0CH]                    ; 0016 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 0019 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 001C _ 8B. 45, F4
        and     eax, 0FH                                ; 001F _ 83. E0, 0F
        mov     dl, al                                  ; 0022 _ 88. C2
        mov     eax, dword [ebp-10H]                    ; 0024 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 0027 _ 88. 10
        inc     dword [ebp-0CH]                         ; 0029 _ FF. 45, F4
?_002:  cmp     dword [ebp-0CH], 720895                 ; 002C _ 81. 7D, F4, 000AFFFF
        jle     ?_001                                   ; 0033 _ 7E, E1
?_003:  call    io_hlt                                  ; 0035 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 003A _ EB, F9
; CMain End of function

```

接着 我们通过nasm进行编译

```shell
nasm -o kernel.bat kernel.asm
```

运行后生成了kernel.bat

这里我们注意 因为代码变大了 所以我们在运行的java的时候发现（控制台输出）：

```
Load file kernel.bat to floppy with cylinder: 1 and sector:2
Load file kernel.bat to floppy with cylinder: 1 and sector:3
```

发现一个扇区已经不够用了（此时在boot.asm中 我们只读了一个扇区）

所以要修改一下boot.asm

(下面是代码片段)

```assembly
readFloppy:
    mov          CH, 1        ;CH 用来存储柱面号
    mov          DH, 0        ;DH 用来存储磁头号
    mov          CL, 2        ;CL 用来存储扇区号

    mov          BX, LOAD_ADDR       ; ES:BX 数据存储缓冲区

    mov          AH, 0x02      ;  AH = 02 表示要做的是读盘操作
    mov          AL,  2        ; AL 表示要练习读取几个扇区
    mov          DL, 0         ;驱动器编号，一般我们只有一个软盘驱动器，所以写死   
                               ;为0
    INT          0x13          ;调用BIOS中断实现磁盘读取功能
   
    JC           fin

    jmp          LOAD_ADDR
```

这里改成2

```
mov          AL,  2        ; AL 表示要练习读取几个扇区
```

接着nasm编译一下boot.asm

最后运行java程序 生成system.img

```
Load file boot.bat to floppy with cylinder: 0 and sector:1
Load file kernel.bat to floppy with cylinder: 1 and sector:2
Load file kernel.bat to floppy with cylinder: 1 and sector:3
```

这样我们就完成了在mac上进行编译

而不用在ubuntu上



# 3.运行

将img装载运行：

![](https://github.com/wdkang123/MyOperatingSystem/blob/main/images/07-img01.png?raw=true)







