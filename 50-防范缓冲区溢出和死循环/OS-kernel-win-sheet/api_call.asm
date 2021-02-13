[map symbols app_c.map]
[SECTION .s32]
BITS 32

call main


mov  edx, 4  ;返回内核
int  02Dh


api_putchar:
  mov edx, 1
  mov al, [esp + 4]
  int 02Dh
  ret

%include "app.asm"