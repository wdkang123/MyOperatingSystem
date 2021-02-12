[SECTION .s32]
BITS 32
call main
retf

api_putchar:
  mov edx, 1
  mov al, [esp + 4]
  int 02Dh
  ret

%include "app.asm"