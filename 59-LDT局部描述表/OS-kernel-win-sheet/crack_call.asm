[map symbols app_c.map]
[SECTION .s32]
BITS 32
mov AX, 30 * 8
mov DS, ax
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

api_point:  ;void api_point(int win, int x, int y, int col)
  push edi
  push esi
  push ebx
  mov  edx, 11
  mov  ebx, [esp+16]  ;win
  mov  esi, [esp+20]  ;x
  mov  edi, [esp+24]  ;y
  mov  eax, [esp+28]  ;col
  int  02Dh
  pop  ebx
  pop  esi
  pop  edi
  ret

api_refreshwin:  ;void api_refreshwin(int win, int x0, int y0, int x1, int y1)
  push  edi
  push  esi
  push  ebx
  mov   edx, 12
  mov   ebx, [esp+16] ; win
  mov   eax, [esp+20] ;x0
  mov   ecx, [esp+24] ;y0
  mov   esi, [esp+28] ;x1
  mov   edi, [esp+32] ;y1
  int   02Dh
  pop   ebx
  pop   esi
  pop   edi
  ret

api_linewin:   ;void api_linewin(int win, int x0, int y0, int x1, int y1, int col)
  push edi
  push esi
  push ebp
  push ebx
  mov  edx, 13
  mov  ebx, [esp+20] ;win
  mov  eax, [esp+24] ;x0
  mov  ecx, [esp+28] ;y0
  mov  esi, [esp+32] ;x1
  mov  edi, [esp+36] ;y1
  mov  ebp, [esp+40] ;col
  int  02Dh

  pop  ebx
  pop  ebp
  pop  esi
  pop  edi
  ret

api_closewin: ;void api_closewin(int win);
  push ebx
  mov  edx, 14
  mov  ebx, [esp+8]
  int  02Dh
  pop  ebx
  ret

api_getkey:  ;int api_getkey(int mode)
  mov  edx, 15
  mov  eax, [esp+4] ;mode
  int  02Dh
  ret

api_alloctimer:
  mov edx, 16
  int 02Dh
  ret

api_inittimer: ;void api_initimer(int timer, int data)
  push ebx
  mov  edx, 17
  mov  ebx, [esp+8]
  mov  eax, [esp+12]
  int  02Dh
  pop  ebx
  ret

api_settimer:  ;void api_settimer(int timer, int time)
  push ebx
  mov  edx, 18
  mov  ebx, [esp + 8]
  mov  eax, [esp + 12]
  int  02Dh
  pop  ebx
  ret

api_freetimer:  ;void api_freetimer(int timer)
  push ebx
  mov  edx, 19
  mov  ebx, [esp + 8]
  int  02Dh
  pop  ebx
  ret

api_showstring:
  push ebx
  mov  edx, 20
  int  02Dh
  pop  ebx
  ret


%include "crack.asm"