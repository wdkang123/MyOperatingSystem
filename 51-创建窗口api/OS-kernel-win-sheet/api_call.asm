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

api_putstr:   ;void api_putstr(char* s)
  push ebx
  mov  edx, 2
  mov  ebx, [ESP+8]
  int  02Dh
  pop  ebx
  ret

api_openwin:  ;int api_openwin(char*buf, int xsiz, int ysiz, int col_inv, char*title)
  push edi
  push esi
  push ebx
  mov  edx, 5
  mov  ebx, [esp+16] ;buf
  mov  esi, [esp+20] ;xsiz
  mov  edi, [esp+24] ;ysiz
  mov  eax, [esp+28] ;col_inv
  mov  ecx, [esp+32] ;title
  int  02Dh
  pop  ebx
  pop  esi
  pop  edi
  ret

 api_putstrwin:   ;void api_putstrwin(int win, int x, int y, int col, int len, char* str)
 
 push edi
 push esi
 push ebp
 push ebx
 mov  edx, 6
 mov  ebx, [esp+20]  ;win
 mov  esi, [esp+24]  ;x
 mov  edi, [esp+28]  ;y
 mov  eax, [esp+32]  ;col
 mov  ecx, [esp+36]  ;len
 mov  ebp, [esp+40]  ;str
 int  02Dh
 pop  ebx
 pop  ebp
 pop  esi
 pop  edi
 ret

 api_boxfilwin: ;void api_boxfilwin(int win, int x0, int y0,int x1, int y1, int col)
 push edi
 push esi
 push ebp
 push ebx
 mov  edx, 7
 mov  ebx, [esp+20] ;win
 mov  eax, [esp+24] ;x0
 mov  ecx, [esp+28] ;y0
 mov  esi, [esp+32] ;x1
 mov  edi, [esp+36] ;y1
 mov  ebp, [esp+40] ;col

 int 02DH
 pop  ebx
 pop  ebp
 pop  esi
 pop  edi
 ret

%include "app.asm"