org  0x7c00;

LoadAddr EQU  08000h   


entry:
    mov  ax, 0
    mov  ss, ax
    mov  ds, ax
    mov  es, ax
    
    
    mov          BX, LoadAddr       ; ES:BX 数据存储缓冲区
    mov          CH, 1        ;CH 用来存储柱面号
    mov          DH, 0        ;DH 用来存储磁头号
    
readFloppy:
   
    cmp          byte [load_count], 0
    je           beginLoad

    
    mov          CL, 1        ;CL 用来存储扇区号

    mov          AH, 0x02      ;  AH = 02 表示要做的是读盘操作
    mov          AL,  18        ; AL 表示要练习读取几个扇区
    mov          DL, 0         ;驱动器编号，一般我们只有一个软盘驱动器，所以写死   
                               ;为0
    INT          0x13          ;调用BIOS中断实现磁盘读取功能

    inc          CH
    dec          byte [load_count]
    JC           fin
    add          bx, 512 * 18
    jmp          readFloppy
    
beginLoad:
    jmp          LoadAddr


load_count db 3 ;连续读取几个柱面

fin:
    HLT
    jmp  fin

