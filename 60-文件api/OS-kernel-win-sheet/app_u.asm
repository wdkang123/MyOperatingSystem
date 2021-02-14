; Disassembly of file: app.o
; Sat Jan  6 11:58:39 2018
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
extern api_putchar                                      ; near
extern api_fread                                        ; near
extern api_fseek                                        ; near
extern api_fopen                                        ; near


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
        sub     esp, 16036                              ; 0035 _ 81. EC, 00003EA4
        sub     esp, 12                                 ; 003B _ 83. EC, 0C
        push    ?_008                                   ; 003E _ 68, 00000000(d)
        call    api_fopen                               ; 0043 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0048 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 004B _ 89. 45, EC
        mov     dword [ebp-0CH], 0                      ; 004E _ C7. 45, F4, 00000000
        sub     esp, 4                                  ; 0055 _ 83. EC, 04
        push    0                                       ; 0058 _ 6A, 00
        push    5                                       ; 005A _ 6A, 05
        push    dword [ebp-14H]                         ; 005C _ FF. 75, EC
        call    api_fseek                               ; 005F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0064 _ 83. C4, 10
        cmp     dword [ebp-14H], 0                      ; 0067 _ 83. 7D, EC, 00
        jz      ?_004                                   ; 006B _ 74, 40
        mov     dword [ebp-0CH], 0                      ; 006D _ C7. 45, F4, 00000000
        jmp     ?_003                                   ; 0074 _ EB, 31

?_001:  sub     esp, 4                                  ; 0076 _ 83. EC, 04
        push    dword [ebp-14H]                         ; 0079 _ FF. 75, EC
        push    1                                       ; 007C _ 6A, 01
        lea     eax, [ebp-1AH]                          ; 007E _ 8D. 45, E6
        push    eax                                     ; 0081 _ 50
        call    api_fread                               ; 0082 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0087 _ 83. C4, 10
        test    eax, eax                                ; 008A _ 85. C0
        jnz     ?_002                                   ; 008C _ 75, 02
        jmp     ?_004                                   ; 008E _ EB, 1D

?_002:  movzx   eax, byte [ebp-1AH]                     ; 0090 _ 0F B6. 45, E6
        movsx   eax, al                                 ; 0094 _ 0F BE. C0
        sub     esp, 12                                 ; 0097 _ 83. EC, 0C
        push    eax                                     ; 009A _ 50
        call    api_putchar                             ; 009B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A0 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 00A3 _ 83. 45, F4, 01
?_003:  cmp     dword [ebp-0CH], 9                      ; 00A7 _ 83. 7D, F4, 09
        jle     ?_001                                   ; 00AB _ 7E, C9
?_004:  sub     esp, 12                                 ; 00AD _ 83. EC, 0C
        push    ?_009                                   ; 00B0 _ 68, 00000008(d)
        push    -1                                      ; 00B5 _ 6A, FF
        push    100                                     ; 00B7 _ 6A, 64
        push    150                                     ; 00B9 _ 68, 00000096
        lea     eax, [ebp-3E9AH]                        ; 00BE _ 8D. 85, FFFFC166
        push    eax                                     ; 00C4 _ 50
        call    api_openwin                             ; 00C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00CA _ 83. C4, 20
        mov     dword [ebp-18H], eax                    ; 00CD _ 89. 45, E8
        sub     esp, 8                                  ; 00D0 _ 83. EC, 08
        push    0                                       ; 00D3 _ 6A, 00
        push    93                                      ; 00D5 _ 6A, 5D
        push    143                                     ; 00D7 _ 68, 0000008F
        push    26                                      ; 00DC _ 6A, 1A
        push    6                                       ; 00DE _ 6A, 06
        push    dword [ebp-18H]                         ; 00E0 _ FF. 75, E8
        call    api_boxfilwin                           ; 00E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E8 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 00EB _ C7. 45, F0, 00000000
        mov     dword [ebp-10H], 0                      ; 00F2 _ C7. 45, F0, 00000000
        jmp     ?_006                                   ; 00F9 _ EB, 4C

?_005:  mov     edx, dword [ebp-10H]                    ; 00FB _ 8B. 55, F0
        mov     eax, edx                                ; 00FE _ 89. D0
        shl     eax, 3                                  ; 0100 _ C1. E0, 03
        add     eax, edx                                ; 0103 _ 01. D0
        add     eax, 26                                 ; 0105 _ 83. C0, 1A
        sub     esp, 8                                  ; 0108 _ 83. EC, 08
        push    4                                       ; 010B _ 6A, 04
        push    eax                                     ; 010D _ 50
        push    77                                      ; 010E _ 6A, 4D
        push    26                                      ; 0110 _ 6A, 1A
        push    8                                       ; 0112 _ 6A, 08
        push    dword [ebp-18H]                         ; 0114 _ FF. 75, E8
        call    api_linewin                             ; 0117 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 011C _ 83. C4, 20
        mov     edx, dword [ebp-10H]                    ; 011F _ 8B. 55, F0
        mov     eax, edx                                ; 0122 _ 89. D0
        shl     eax, 3                                  ; 0124 _ C1. E0, 03
        add     eax, edx                                ; 0127 _ 01. D0
        add     eax, 88                                 ; 0129 _ 83. C0, 58
        sub     esp, 8                                  ; 012C _ 83. EC, 08
        push    4                                       ; 012F _ 6A, 04
        push    89                                      ; 0131 _ 6A, 59
        push    eax                                     ; 0133 _ 50
        push    26                                      ; 0134 _ 6A, 1A
        push    88                                      ; 0136 _ 6A, 58
        push    dword [ebp-18H]                         ; 0138 _ FF. 75, E8
        call    api_linewin                             ; 013B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0140 _ 83. C4, 20
        add     dword [ebp-10H], 1                      ; 0143 _ 83. 45, F0, 01
?_006:  cmp     dword [ebp-10H], 7                      ; 0147 _ 83. 7D, F0, 07
        jle     ?_005                                   ; 014B _ 7E, AE
        sub     esp, 12                                 ; 014D _ 83. EC, 0C
        push    90                                      ; 0150 _ 6A, 5A
        push    154                                     ; 0152 _ 68, 0000009A
        push    26                                      ; 0157 _ 6A, 1A
        push    6                                       ; 0159 _ 6A, 06
        push    dword [ebp-18H]                         ; 015B _ FF. 75, E8
        call    api_refreshwin                          ; 015E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0163 _ 83. C4, 20
        nop                                             ; 0166 _ 90
?_007:  sub     esp, 12                                 ; 0167 _ 83. EC, 0C
        push    1                                       ; 016A _ 6A, 01
        call    api_getkey                              ; 016C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0171 _ 83. C4, 10
        cmp     eax, 28                                 ; 0174 _ 83. F8, 1C
        jnz     ?_007                                   ; 0177 _ 75, EE
        sub     esp, 12                                 ; 0179 _ 83. EC, 0C
        push    dword [ebp-18H]                         ; 017C _ FF. 75, E8
        call    api_closewin                            ; 017F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0184 _ 83. C4, 10
        nop                                             ; 0187 _ 90
        mov     ecx, dword [ebp-4H]                     ; 0188 _ 8B. 4D, FC
        leave                                           ; 018B _ C9
        lea     esp, [ecx-4H]                           ; 018C _ 8D. 61, FC
        ret                                             ; 018F _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_008:                                                  ; byte
        db 69H, 6AH, 6BH, 2EH, 74H, 78H, 74H, 00H       ; 0000 _ ijk.txt.

?_009:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0008 _ star.


