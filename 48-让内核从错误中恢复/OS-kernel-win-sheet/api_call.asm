[SECTION .s32]
BITS 32
call main
pop  eax ;故意让返回地址出错造成异常保护中断
retf


api_putchar:
  mov edx, 1
  mov al, [esp + 4]
  int 02Dh
  ret

%include "app.asm"