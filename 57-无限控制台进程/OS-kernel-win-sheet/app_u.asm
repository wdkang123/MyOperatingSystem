; Disassembly of file: app.o
; Thu Sep 28 08:56:00 2017
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
        sub     esp, 12                                 ; 003B _ 83. EC, 0C
        push    ?_004                                   ; 003E _ 68, 00000000(d)
        push    -1                                      ; 0043 _ 6A, FF
        push    100                                     ; 0045 _ 6A, 64
        push    150                                     ; 0047 _ 68, 00000096
        lea     eax, [ebp-3E90H]                        ; 004C _ 8D. 85, FFFFC170
        push    eax                                     ; 0052 _ 50
        call    api_openwin                             ; 0053 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0058 _ 83. C4, 20
        mov     dword [ebp-10H], eax                    ; 005B _ 89. 45, F0
        sub     esp, 8                                  ; 005E _ 83. EC, 08
        push    0                                       ; 0061 _ 6A, 00
        push    93                                      ; 0063 _ 6A, 5D
        push    143                                     ; 0065 _ 68, 0000008F
        push    26                                      ; 006A _ 6A, 1A
        push    6                                       ; 006C _ 6A, 06
        push    dword [ebp-10H]                         ; 006E _ FF. 75, F0
        call    api_boxfilwin                           ; 0071 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0076 _ 83. C4, 20
        mov     dword [ebp-0CH], 0                      ; 0079 _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 0080 _ C7. 45, F4, 00000000
        jmp     ?_002                                   ; 0087 _ EB, 4C

?_001:  mov     edx, dword [ebp-0CH]                    ; 0089 _ 8B. 55, F4
        mov     eax, edx                                ; 008C _ 89. D0
        shl     eax, 3                                  ; 008E _ C1. E0, 03
        add     eax, edx                                ; 0091 _ 01. D0
        add     eax, 26                                 ; 0093 _ 83. C0, 1A
        sub     esp, 8                                  ; 0096 _ 83. EC, 08
        push    4                                       ; 0099 _ 6A, 04
        push    eax                                     ; 009B _ 50
        push    77                                      ; 009C _ 6A, 4D
        push    26                                      ; 009E _ 6A, 1A
        push    8                                       ; 00A0 _ 6A, 08
        push    dword [ebp-10H]                         ; 00A2 _ FF. 75, F0
        call    api_linewin                             ; 00A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00AA _ 83. C4, 20
        mov     edx, dword [ebp-0CH]                    ; 00AD _ 8B. 55, F4
        mov     eax, edx                                ; 00B0 _ 89. D0
        shl     eax, 3                                  ; 00B2 _ C1. E0, 03
        add     eax, edx                                ; 00B5 _ 01. D0
        add     eax, 88                                 ; 00B7 _ 83. C0, 58
        sub     esp, 8                                  ; 00BA _ 83. EC, 08
        push    4                                       ; 00BD _ 6A, 04
        push    89                                      ; 00BF _ 6A, 59
        push    eax                                     ; 00C1 _ 50
        push    26                                      ; 00C2 _ 6A, 1A
        push    88                                      ; 00C4 _ 6A, 58
        push    dword [ebp-10H]                         ; 00C6 _ FF. 75, F0
        call    api_linewin                             ; 00C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00CE _ 83. C4, 20
        add     dword [ebp-0CH], 1                      ; 00D1 _ 83. 45, F4, 01
?_002:  cmp     dword [ebp-0CH], 7                      ; 00D5 _ 83. 7D, F4, 07
        jle     ?_001                                   ; 00D9 _ 7E, AE
        sub     esp, 12                                 ; 00DB _ 83. EC, 0C
        push    90                                      ; 00DE _ 6A, 5A
        push    154                                     ; 00E0 _ 68, 0000009A
        push    26                                      ; 00E5 _ 6A, 1A
        push    6                                       ; 00E7 _ 6A, 06
        push    dword [ebp-10H]                         ; 00E9 _ FF. 75, F0
        call    api_refreshwin                          ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00F1 _ 83. C4, 20
        nop                                             ; 00F4 _ 90
?_003:  sub     esp, 12                                 ; 00F5 _ 83. EC, 0C
        push    1                                       ; 00F8 _ 6A, 01
        call    api_getkey                              ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00FF _ 83. C4, 10
        cmp     eax, 28                                 ; 0102 _ 83. F8, 1C
        jnz     ?_003                                   ; 0105 _ 75, EE
        sub     esp, 12                                 ; 0107 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 010A _ FF. 75, F0
        call    api_closewin                            ; 010D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0112 _ 83. C4, 10
        nop                                             ; 0115 _ 90
        mov     ecx, dword [ebp-4H]                     ; 0116 _ 8B. 4D, FC
        leave                                           ; 0119 _ C9
        lea     esp, [ecx-4H]                           ; 011A _ 8D. 61, FC
        ret                                             ; 011D _ C3
; main End of function


SECTION .data   align=4 noexecute                       ; section number 2, data

ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_004:                                                  ; byte
        db 73H, 74H, 61H, 72H, 00H                      ; 0000 _ star.


