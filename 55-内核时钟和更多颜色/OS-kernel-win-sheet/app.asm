; Disassembly of file: app.o
; Fri Sep 15 16:18:07 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






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

intToStr:; Function begin
        push    ebp                                     ; 0027 _ 55
        mov     ebp, esp                                ; 0028 _ 89. E5
        sub     esp, 16                                 ; 002A _ 83. EC, 10
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-3H], 0                        ; 002D _ 66: C7. 45, FD, 0000
        mov     byte [ebp-1H], 0                        ; 0033 _ C6. 45, FF, 00
        mov     byte [ebp-3H], 48                       ; 0037 _ C6. 45, FD, 30
        mov     byte [ebp-1H], 0                        ; 003B _ C6. 45, FF, 00
        mov     ecx, dword [ebp+8H]                     ; 003F _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 0042 _ BA, 66666667
        mov     eax, ecx                                ; 0047 _ 89. C8
        imul    edx                                     ; 0049 _ F7. EA
        sar     edx, 2                                  ; 004B _ C1. FA, 02
        mov     eax, ecx                                ; 004E _ 89. C8
        sar     eax, 31                                 ; 0050 _ C1. F8, 1F
        sub     edx, eax                                ; 0053 _ 29. C2
        mov     eax, edx                                ; 0055 _ 89. D0
        shl     eax, 2                                  ; 0057 _ C1. E0, 02
        add     eax, edx                                ; 005A _ 01. D0
        add     eax, eax                                ; 005C _ 01. C0
        sub     ecx, eax                                ; 005E _ 29. C1
        mov     edx, ecx                                ; 0060 _ 89. CA
        mov     eax, edx                                ; 0062 _ 89. D0
        add     eax, 48                                 ; 0064 _ 83. C0, 30
        mov     byte [ebp-2H], al                       ; 0067 _ 88. 45, FE
        mov     ecx, dword [ebp+8H]                     ; 006A _ 8B. 4D, 08
        mov     edx, 1717986919                         ; 006D _ BA, 66666667
        mov     eax, ecx                                ; 0072 _ 89. C8
        imul    edx                                     ; 0074 _ F7. EA
        sar     edx, 2                                  ; 0076 _ C1. FA, 02
        mov     eax, ecx                                ; 0079 _ 89. C8
        sar     eax, 31                                 ; 007B _ C1. F8, 1F
        sub     edx, eax                                ; 007E _ 29. C2
        mov     eax, edx                                ; 0080 _ 89. D0
        add     eax, 48                                 ; 0082 _ 83. C0, 30
        mov     byte [ebp-3H], al                       ; 0085 _ 88. 45, FD
        lea     eax, [ebp-3H]                           ; 0088 _ 8D. 45, FD
        leave                                           ; 008B _ C9
        ret                                             ; 008C _ C3
; intToStr End of function

main:   ; Function begin
        lea     ecx, [esp+4H]                           ; 008D _ 8D. 4C 24, 04
        and     esp, 0FFFFFFF0H                         ; 0091 _ 83. E4, F0
        push    dword [ecx-4H]                          ; 0094 _ FF. 71, FC
        push    ebp                                     ; 0097 _ 55
        mov     ebp, esp                                ; 0098 _ 89. E5
        push    esi                                     ; 009A _ 56
        push    ebx                                     ; 009B _ 53
        push    ecx                                     ; 009C _ 51
        sub     esp, 23660                              ; 009D _ 81. EC, 00005C6C
        sub     esp, 12                                 ; 00A3 _ 83. EC, 0C
        push    ?_006                                   ; 00A6 _ 68, 00000000(d)
        push    -1                                      ; 00AB _ 6A, FF
        push    164                                     ; 00AD _ 68, 000000A4
        push    144                                     ; 00B2 _ 68, 00000090
        lea     eax, [ebp-5C70H]                        ; 00B7 _ 8D. 85, FFFFA390
        push    eax                                     ; 00BD _ 50
        call    api_openwin                             ; 00BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00C3 _ 83. C4, 20
        mov     dword [ebp-24H], eax                    ; 00C6 _ 89. 45, DC
        mov     dword [ebp-1CH], 0                      ; 00C9 _ C7. 45, E4, 00000000
        jmp     ?_004                                   ; 00D0 _ E9, 000000BC

?_001:  mov     dword [ebp-20H], 0                      ; 00D5 _ C7. 45, E0, 00000000
        jmp     ?_003                                   ; 00DC _ E9, 000000A2

?_002:  mov     eax, dword [ebp-20H]                    ; 00E1 _ 8B. 45, E0
        add     eax, eax                                ; 00E4 _ 01. C0
        mov     dword [ebp-28H], eax                    ; 00E6 _ 89. 45, D8
        mov     eax, dword [ebp-1CH]                    ; 00E9 _ 8B. 45, E4
        add     eax, eax                                ; 00EC _ 01. C0
        mov     dword [ebp-2CH], eax                    ; 00EE _ 89. 45, D4
        mov     dword [ebp-30H], 0                      ; 00F1 _ C7. 45, D0, 00000000
        mov     eax, dword [ebp-20H]                    ; 00F8 _ 8B. 45, E0
        lea     ecx, [eax+8H]                           ; 00FB _ 8D. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 00FE _ 8B. 45, E4
        lea     edx, [eax+1CH]                          ; 0101 _ 8D. 50, 1C
        mov     eax, edx                                ; 0104 _ 89. D0
        shl     eax, 3                                  ; 0106 _ C1. E0, 03
        add     eax, edx                                ; 0109 _ 01. D0
        shl     eax, 4                                  ; 010B _ C1. E0, 04
        lea     ebx, [ecx+eax]                          ; 010E _ 8D. 1C 01
        mov     ecx, dword [ebp-28H]                    ; 0111 _ 8B. 4D, D8
        mov     edx, 799063683                          ; 0114 _ BA, 2FA0BE83
        mov     eax, ecx                                ; 0119 _ 89. C8
        imul    edx                                     ; 011B _ F7. EA
        sar     edx, 3                                  ; 011D _ C1. FA, 03
        mov     eax, ecx                                ; 0120 _ 89. C8
        sar     eax, 31                                 ; 0122 _ C1. F8, 1F
        sub     edx, eax                                ; 0125 _ 29. C2
        mov     eax, edx                                ; 0127 _ 89. D0
        mov     esi, eax                                ; 0129 _ 89. C6
        mov     ecx, dword [ebp-2CH]                    ; 012B _ 8B. 4D, D4
        mov     edx, 799063683                          ; 012E _ BA, 2FA0BE83
        mov     eax, ecx                                ; 0133 _ 89. C8
        imul    edx                                     ; 0135 _ F7. EA
        sar     edx, 3                                  ; 0137 _ C1. FA, 03
        mov     eax, ecx                                ; 013A _ 89. C8
        sar     eax, 31                                 ; 013C _ C1. F8, 1F
        sub     edx, eax                                ; 013F _ 29. C2
        mov     eax, edx                                ; 0141 _ 89. D0
        mov     edx, eax                                ; 0143 _ 89. C2
        mov     eax, edx                                ; 0145 _ 89. D0
        add     eax, eax                                ; 0147 _ 01. C0
        add     eax, edx                                ; 0149 _ 01. D0
        add     eax, eax                                ; 014B _ 01. C0
        add     esi, eax                                ; 014D _ 01. C6
        mov     ecx, dword [ebp-30H]                    ; 014F _ 8B. 4D, D0
        mov     edx, 799063683                          ; 0152 _ BA, 2FA0BE83
        mov     eax, ecx                                ; 0157 _ 89. C8
        imul    edx                                     ; 0159 _ F7. EA
        sar     edx, 3                                  ; 015B _ C1. FA, 03
        mov     eax, ecx                                ; 015E _ 89. C8
        sar     eax, 31                                 ; 0160 _ C1. F8, 1F
        sub     edx, eax                                ; 0163 _ 29. C2
        mov     eax, edx                                ; 0165 _ 89. D0
        mov     edx, eax                                ; 0167 _ 89. C2
        mov     eax, edx                                ; 0169 _ 89. D0
        shl     eax, 3                                  ; 016B _ C1. E0, 03
        add     eax, edx                                ; 016E _ 01. D0
        shl     eax, 2                                  ; 0170 _ C1. E0, 02
        add     eax, esi                                ; 0173 _ 01. F0
        add     eax, 16                                 ; 0175 _ 83. C0, 10
        mov     byte [ebp+ebx-5C70H], al                ; 0178 _ 88. 84 1D, FFFFA390
        add     dword [ebp-20H], 1                      ; 017F _ 83. 45, E0, 01
?_003:  cmp     dword [ebp-20H], 127                    ; 0183 _ 83. 7D, E0, 7F
        jle near      ?_002                                   ; 0187 _ 0f 8e, ffffff54
        add     dword [ebp-1CH], 1                      ; 018D _ 83. 45, E4, 01
?_004:  cmp     dword [ebp-1CH], 127                    ; 0191 _ 83. 7D, E4, 7F
        jle near      ?_001                                   ; 0195 _ 0f 8e, ffffff3a
        sub     esp, 12                                 ; 019B _ 83. EC, 0C
        push    156                                     ; 019E _ 68, 0000009C
        push    136                                     ; 01A3 _ 68, 00000088
        push    28                                      ; 01A8 _ 6A, 1C
        push    8                                       ; 01AA _ 6A, 08
        push    dword [ebp-24H]                         ; 01AC _ FF. 75, DC
        call    api_refreshwin                          ; 01AF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B4 _ 83. C4, 20
        nop                                             ; 01B7 _ 90
?_005:  sub     esp, 12                                 ; 01B8 _ 83. EC, 0C
        push    1                                       ; 01BB _ 6A, 01
        call    api_getkey                              ; 01BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C2 _ 83. C4, 10
        cmp     eax, 28                                 ; 01C5 _ 83. F8, 1C
        jnz near      ?_005                                   ; 01c8 _ 75, ee
        sub     esp, 12                                 ; 01CA _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 01CD _ FF. 75, DC
        call    api_closewin                            ; 01D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01D5 _ 83. C4, 10
        nop                                             ; 01D8 _ 90
        lea     esp, [ebp-0CH]                          ; 01D9 _ 8D. 65, F4
        pop     ecx                                     ; 01DC _ 59
        pop     ebx                                     ; 01DD _ 5B
        pop     esi                                     ; 01DE _ 5E
        pop     ebp                                     ; 01DF _ 5D
        lea     esp, [ecx-4H]                           ; 01E0 _ 8D. 61, FC
        ret                                             ; 01E3 _ C3
; main End of function



ran:                                                    ; dword
        dd 00000017H                                    ; 0000 _ 23 





?_006:                                                  ; byte
        db 63H, 6FH, 6CH, 6FH, 72H, 32H, 00H            ; 0000 _ color2.


