[map symbols hlt.map]
[SECTION .s32]
BITS 32
main:
mov al, 'A'
push ax
call api_putchar
ret


