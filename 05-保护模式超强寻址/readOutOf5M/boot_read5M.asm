%include "pm.inc"

org   0x7c00

jmp   LABEL_BEGIN

[SECTION .gdt]
 ;                                  段基址          段界限                属性
LABEL_GDT:          Descriptor        0,            0,                   0  
LABEL_DESC_CODE32:  Descriptor        0,      SegCode32Len - 1,       DA_C + DA_32
LABEL_DESC_VIDEO:   Descriptor     0B8000h,         0ffffh,           DA_DRW
LABEL_DESC_5M:      Descriptor     0500000h,        0ffffh,           DA_DRW

GdtLen     equ    $ - LABEL_GDT
GdtPtr     dw     GdtLen - 1
           dd     0

SelectorCode32    equ   LABEL_DESC_CODE32 -  LABEL_GDT
SelectorVideo     equ   LABEL_DESC_VIDEO  -  LABEL_GDT
Selector5M        equ   LABEL_DESC_5M - LABEL_GDT

[SECTION  .s16]
[BITS  16]
LABEL_BEGIN:
     mov   ax, cs
     mov   ds, ax
     mov   es, ax
     mov   ss, ax
     mov   sp, 0100h

     xor   eax, eax
     mov   ax,  cs
     shl   eax, 4
     add   eax, LABEL_SEG_CODE32
     mov   word [LABEL_DESC_CODE32 + 2], ax
     shr   eax, 16
     mov   byte [LABEL_DESC_CODE32 + 4], al
     mov   byte [LABEL_DESC_CODE32 + 7], ah

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
    mov   ax, SelectorVideo
    mov   gs, ax

    mov   si, msg
    mov   ax, Selector5M    ;用 es 指向5M内存描述符
    mov   es, ax
    mov   edi, 0

write_msg_to_5M:  ;将si指向的字符一个个写到5M内存处
    cmp   byte [si], 0
    je    prepare_to_show_char
    mov   al, [si]
    mov   [es:edi], al
    add   edi, 1
    add   si, 1
    jmp   write_msg_to_5M


prepare_to_show_char:
    mov   ebx, 10
    mov   ecx, 2
    mov   si, 0

showChar:
    mov   edi, (80*11)
    add   edi, ebx
    mov   eax, edi
    mul   ecx
    mov   edi, eax
    mov   ah, 0ch
    mov   al, [es:si]  ;由于es指向描述符LABEL_DESC_5M， 所以es:si 表示的地址是从5M开始的内存,si表示从5M开始后的偏移
    cmp   al, 0
    je    end
    add   ebx,1
    add   si, 1
    mov   [gs:edi], ax
    jmp   showChar
end: 
    jmp   $
    msg:
    DB     "This string is writeen to 5M memory", 0

SegCode32Len   equ  $ - LABEL_SEG_CODE32
