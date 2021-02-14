; Disassembly of file: app.o
; Tue Dec  5 23:09:14 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global rand: function
global main: function
global ran

extern api_closewin                                     ; near
extern api_getkey                                       ; near
extern api_refreshwin                                   ; near
extern api_linewin                                      ; near
extern api_boxfilwin                                    ; near
extern api_openwin                                      ; near


SECTION .text   align=1 execute                         ; section number 1, code

rand:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        mov     eax, dword [ran]                        ; 0003 _ A1, 00000000(d)
        imul    eax, eax, 214013                        ; 0008 _ 69. C0, 000343FD
        add     eax, 2531011                            ; 000E _ 05, 00269EC3
        mov     dword [ran], eax                        ; 0013 _ A3, 00000000(d)
        mov     eax, dword [ran]                        ; 0018 _ A1, 00000000(d)
        sar     eax, 16                                 ; 001D _ C1. F8, 10
        and     eax, 7FFFH                              ; 0020 _ 25, 00007FFF
        pop     ebp                                     ; 0025 _ 5D
        ret                                             ; 0026 _ C3
; rand End of function

main:   ; Function begin
        lea     ecx, [esp+4H]                           ; 0027 _ 8D. 4C 24, 04
        and     esp, 0FFFFFFF0H                         ; 002B _ 83. E4, F0
        push    dword [ecx-4H]                          ; 002E _ FF. 71, FC
        push    ebp                                     ; 0031 _ 55
        mov     ebp, esp                                ; 0032 _ 89. E5
        push    ecx                                     ; 0034 _ 51
        sub     esp, 16020                              ; 0035 _ 81. EC, 00003E94
        mov     dword [ebp-10H], 291                    ; 003B _ C7. 45, F0, 00000123
        mov     eax, dword [ebp-10H]                    ; 0042 _ 8B. 45, F0
        mov     byte [eax], 97                          ; 0045 _ C6. 00, 61
        mov     eax, dword [ebp-10H]                    ; 0048 _ 8B. 45, F0
        add     eax, 1                                  ; 004B _ 83. C0, 01
        mov     byte [eax], 112                         ; 004E _ C6. 00, 70
        mov     eax, dword [ebp-10H]                    ; 0051 _ 8B. 45, F0
        add     eax, 2                                  ; 0054 _ 83. C0, 02
        mov     byte [eax], 112                         ; 0057 _ C6. 00, 70
        mov     eax, dword [ebp-10H]                    ; 005A _ 8B. 45, F0
        add     eax, 3                                  ; 005D _ 83. C0, 03
        mov     byte [eax], 0                           ; 0060 _ C6. 00, 00
        sub     esp, 12                                 ; 0063 _ 83. EC, 0C
        push    ?_004                                   ; 0066 _ 68, 00000000(d)
        push    -1                                      ; 006B _ 6A, FF
        push    100                                     ; 006D _ 6A, 64
        push    150                                     ; 006F _ 68, 00000096
        lea     eax, [ebp-3E94H]                        ; 0074 _ 8D. 85, FFFFC16C
        push    eax                                     ; 007A _ 50
        call    api_openwin                             ; 007B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0080 _ 83. C4, 20
        mov     dword [ebp-14H], eax                    ; 0083 _ 89. 45, EC
        sub     esp, 8                                  ; 0086 _ 83. EC, 08
        push    0                                       ; 0089 _ 6A, 00
        push    93                                      ; 008B _ 6A, 5D
        push    143                                     ; 008D _ 68, 0000008F
        push    26                                      ; 0092 _ 6A, 1A
        push    6                                       ; 0094 _ 6A, 06
        push    dword [ebp-14H]                         ; 0096 _ FF. 75, EC
        call    api_boxfilwin                           ; 0099 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 009E _ 83. C4, 20
        mov     dword [ebp-0CH], 0                      ; 00A1 _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 00A8 _ C7. 45, F4, 00000000
        jmp     ?_002                                   ; 00AF _ EB, 4C

?_001:  mov     edx, dword [ebp-0CH]                    ; 00B1 _ 8B. 55, F4
        mov     eax, edx                                ; 00B4 _ 89. D0
        shl     eax, 3                                  ; 00B6 _ C1. E0, 03
        add     eax, edx                                ; 00B9 _ 01. D0
        add     eax, 26                                 ; 00BB _ 83. C0, 1A
        sub     esp, 8                                  ; 00BE _ 83. EC, 08
        push    4                                       ; 00C1 _ 6A, 04
        push    eax                                     ; 00C3 _ 50
        push    77                                      ; 00C4 _ 6A, 4D
        push    26                                      ; 00C6 _ 6A, 1A
        push    8                                       ; 00C8 _ 6A, 08
        push    dword [ebp-14H]                         ; 00CA _ FF. 75, EC
        call    api_linewin                             ; 00CD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00D2 _ 83. C4, 20
        mov     edx, dword [ebp-0CH]                    ; 00D5 _ 8B. 55, F4
        mov     eax, edx                                ; 00D8 _ 89. D0
        shl     eax, 3                                  ; 00DA _ C1. E0, 03
        add     eax, edx                                ; 00DD _ 01. D0
        add     eax, 88                                 ; 00DF _ 83. C0, 58
        sub     esp, 8                                  ; 00E2 _ 83. EC, 08
        push    4                                       ; 00E5 _ 6A, 04
        push    89                                      ; 00E7 _ 6A, 59
        push    eax                                     ; 00E9 _ 50
        push    26                                      ; 00EA _ 6A, 1A
        push    88                                      ; 00EC _ 6A, 58
        push    dword [ebp-14H]                         ; 00EE _ FF. 75, EC
        call    api_linewin                             ; 00F1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00F6 _ 83. C4, 20
        add     dword [ebp-0CH], 1                      ; 00F9 _ 83. 45, F4, 01
?_002:  cmp     dword [ebp-0CH], 7                      ; 00FD _ 83. 7D, F4, 07
        jle     ?_001                                   ; 0101 _ 7E, AE
        sub     esp, 12                                 ; 0103 _ 83. EC, 0C
        push    90                                      ; 0106 _ 6A, 5A
        push    154                                     ; 0108 _ 68, 0000009A
        push    26                                      ; 010D _ 6A, 1A
        push    6                                       ; 010F _ 6A, 06
        push    dword [ebp-14H]                         ; 0111 _ FF. 75, EC
        call    api_refreshwin                          ; 0114 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0119 _ 83. C4, 20
        nop                                             ; 011C _ 90
?_003:  sub     esp, 12                                 ; 011D _ 83. EC, 0C
        push    1                                       ; 0120 _ 6A, 01
        call    api_getkey                              ; 0122 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0127 _ 83. C4, 10
        cmp     eax, 28                                 ; 012A _ 83. F8, 1C
        jnz     ?_003                                   ; 012D _ 75, EE
        sub     esp, 12                                 ; 012F _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 0132 _ FF. 75, EC
        call    api_closewin                            ; 0135 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 013A _ 83. C4, 10
        nop                                             ; 013D _ 90
        mov     ecx, dword [ebp-4H]                     ; 013E _ 8B. 4D, FC
        leave                                           ; 0141 _ C9
        lea     esp, [ecx-4H]                           ; 0142 _ 8D. 61, FC
        ret                                             ; 0145 _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_004:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


