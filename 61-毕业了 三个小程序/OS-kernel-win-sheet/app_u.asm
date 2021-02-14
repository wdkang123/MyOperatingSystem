; Disassembly of file: app.o
; Sat Jan 13 15:34:35 2018
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global putstr: function
global waitting: function
global main: function

extern api_closewin                                     ; near
extern api_putchar                                      ; near
extern api_inittimer                                    ; near
extern api_alloctimer                                   ; near
extern api_openwin                                      ; near
extern api_getkey                                       ; near
extern api_settimer                                     ; near
extern api_refreshwin                                   ; near
extern api_putstrwin                                    ; near
extern api_boxfilwin                                    ; near


SECTION .text   align=1 execute                         ; section number 1, code

putstr: ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 40                                 ; 0003 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 0006 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+14H]                    ; 000D _ 8B. 45, 14
        add     eax, 1                                  ; 0010 _ 83. C0, 01
        shl     eax, 3                                  ; 0013 _ C1. E0, 03
        mov     dword [ebp+14H], eax                    ; 0016 _ 89. 45, 14
        mov     eax, dword [ebp+18H]                    ; 0019 _ 8B. 45, 18
        shl     eax, 4                                  ; 001C _ C1. E0, 04
        add     eax, 29                                 ; 001F _ 83. C0, 1D
        mov     dword [ebp+18H], eax                    ; 0022 _ 89. 45, 18
        mov     eax, dword [ebp+14H]                    ; 0025 _ 8B. 45, 14
        mov     dword [ebp-14H], eax                    ; 0028 _ 89. 45, EC
        jmp     ?_002                                   ; 002B _ EB, 04

?_001:  add     dword [ebp-0CH], 1                      ; 002D _ 83. 45, F4, 01
?_002:  mov     edx, dword [ebp-0CH]                    ; 0031 _ 8B. 55, F4
        mov     eax, dword [ebp+20H]                    ; 0034 _ 8B. 45, 20
        add     eax, edx                                ; 0037 _ 01. D0
        movzx   eax, byte [eax]                         ; 0039 _ 0F B6. 00
        test    al, al                                  ; 003C _ 84. C0
        jnz     ?_001                                   ; 003E _ 75, ED
        mov     eax, dword [ebp+18H]                    ; 0040 _ 8B. 45, 18
        add     eax, 15                                 ; 0043 _ 83. C0, 0F
        sub     esp, 8                                  ; 0046 _ 83. EC, 08
        push    0                                       ; 0049 _ 6A, 00
        push    eax                                     ; 004B _ 50
        push    262                                     ; 004C _ 68, 00000106
        push    dword [ebp+18H]                         ; 0051 _ FF. 75, 18
        push    8                                       ; 0054 _ 6A, 08
        push    dword [ebp+8H]                          ; 0056 _ FF. 75, 08
        call    api_boxfilwin                           ; 0059 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005E _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0061 _ 8B. 45, 18
        imul    eax, eax, 270                           ; 0064 _ 69. C0, 0000010E
        mov     edx, eax                                ; 006A _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 006C _ 8B. 45, 0C
        add     eax, edx                                ; 006F _ 01. D0
        mov     dword [ebp-10H], eax                    ; 0071 _ 89. 45, F0
        mov     byte [ebp-1DH], 0                       ; 0074 _ C6. 45, E3, 00
?_003:  mov     eax, dword [ebp+20H]                    ; 0078 _ 8B. 45, 20
        movzx   eax, byte [eax]                         ; 007B _ 0F B6. 00
        movzx   eax, al                                 ; 007E _ 0F B6. C0
        mov     dword [ebp-18H], eax                    ; 0081 _ 89. 45, E8
        cmp     dword [ebp-18H], 0                      ; 0084 _ 83. 7D, E8, 00
        jnz     ?_004                                   ; 0088 _ 75, 05
        jmp     ?_019                                   ; 008A _ E9, 000001AB

?_004:  cmp     dword [ebp-18H], 32                     ; 008F _ 83. 7D, E8, 20
        je      ?_018                                   ; 0093 _ 0F 84, 00000194
        cmp     dword [ebp-18H], 96                     ; 0099 _ 83. 7D, E8, 60
        jle     ?_015                                   ; 009D _ 0F 8E, 0000014C
        cmp     dword [ebp-18H], 104                    ; 00A3 _ 83. 7D, E8, 68
        jg      ?_015                                   ; 00A7 _ 0F 8F, 00000142
        mov     eax, dword [ebp-18H]                    ; 00AD _ 8B. 45, E8
        sub     eax, 97                                 ; 00B0 _ 83. E8, 61
        shl     eax, 4                                  ; 00B3 _ C1. E0, 04
        mov     edx, eax                                ; 00B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 00B8 _ 8B. 45, 10
        add     eax, edx                                ; 00BB _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 00BD _ 89. 45, E4
        mov     eax, dword [ebp+14H]                    ; 00C0 _ 8B. 45, 14
        add     dword [ebp-10H], eax                    ; 00C3 _ 01. 45, F0
        mov     dword [ebp-0CH], 0                      ; 00C6 _ C7. 45, F4, 00000000
        jmp     ?_014                                   ; 00CD _ E9, 00000104

?_005:  mov     edx, dword [ebp-0CH]                    ; 00D2 _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 00D5 _ 8B. 45, E4
        add     eax, edx                                ; 00D8 _ 01. D0
        movzx   eax, byte [eax]                         ; 00DA _ 0F B6. 00
        test    al, al                                  ; 00DD _ 84. C0
        jns     ?_006                                   ; 00DF _ 79, 0A
        mov     eax, dword [ebp+1CH]                    ; 00E1 _ 8B. 45, 1C
        mov     edx, eax                                ; 00E4 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 00E6 _ 8B. 45, F0
        mov     byte [eax], dl                          ; 00E9 _ 88. 10
?_006:  mov     edx, dword [ebp-0CH]                    ; 00EB _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 00EE _ 8B. 45, E4
        add     eax, edx                                ; 00F1 _ 01. D0
        movzx   eax, byte [eax]                         ; 00F3 _ 0F B6. 00
        movsx   eax, al                                 ; 00F6 _ 0F BE. C0
        and     eax, 40H                                ; 00F9 _ 83. E0, 40
        test    eax, eax                                ; 00FC _ 85. C0
        jz      ?_007                                   ; 00FE _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 0100 _ 8B. 45, F0
        add     eax, 1                                  ; 0103 _ 83. C0, 01
        mov     edx, dword [ebp+1CH]                    ; 0106 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 0109 _ 88. 10
?_007:  mov     edx, dword [ebp-0CH]                    ; 010B _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 010E _ 8B. 45, E4
        add     eax, edx                                ; 0111 _ 01. D0
        movzx   eax, byte [eax]                         ; 0113 _ 0F B6. 00
        movsx   eax, al                                 ; 0116 _ 0F BE. C0
        and     eax, 20H                                ; 0119 _ 83. E0, 20
        test    eax, eax                                ; 011C _ 85. C0
        jz      ?_008                                   ; 011E _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 0120 _ 8B. 45, F0
        add     eax, 2                                  ; 0123 _ 83. C0, 02
        mov     edx, dword [ebp+1CH]                    ; 0126 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 0129 _ 88. 10
?_008:  mov     edx, dword [ebp-0CH]                    ; 012B _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 012E _ 8B. 45, E4
        add     eax, edx                                ; 0131 _ 01. D0
        movzx   eax, byte [eax]                         ; 0133 _ 0F B6. 00
        movsx   eax, al                                 ; 0136 _ 0F BE. C0
        and     eax, 10H                                ; 0139 _ 83. E0, 10
        test    eax, eax                                ; 013C _ 85. C0
        jz      ?_009                                   ; 013E _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 0140 _ 8B. 45, F0
        add     eax, 3                                  ; 0143 _ 83. C0, 03
        mov     edx, dword [ebp+1CH]                    ; 0146 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 0149 _ 88. 10
?_009:  mov     edx, dword [ebp-0CH]                    ; 014B _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 014E _ 8B. 45, E4
        add     eax, edx                                ; 0151 _ 01. D0
        movzx   eax, byte [eax]                         ; 0153 _ 0F B6. 00
        movsx   eax, al                                 ; 0156 _ 0F BE. C0
        and     eax, 08H                                ; 0159 _ 83. E0, 08
        test    eax, eax                                ; 015C _ 85. C0
        jz      ?_010                                   ; 015E _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 0160 _ 8B. 45, F0
        add     eax, 4                                  ; 0163 _ 83. C0, 04
        mov     edx, dword [ebp+1CH]                    ; 0166 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 0169 _ 88. 10
?_010:  mov     edx, dword [ebp-0CH]                    ; 016B _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 016E _ 8B. 45, E4
        add     eax, edx                                ; 0171 _ 01. D0
        movzx   eax, byte [eax]                         ; 0173 _ 0F B6. 00
        movsx   eax, al                                 ; 0176 _ 0F BE. C0
        and     eax, 04H                                ; 0179 _ 83. E0, 04
        test    eax, eax                                ; 017C _ 85. C0
        jz      ?_011                                   ; 017E _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 0180 _ 8B. 45, F0
        add     eax, 5                                  ; 0183 _ 83. C0, 05
        mov     edx, dword [ebp+1CH]                    ; 0186 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 0189 _ 88. 10
?_011:  mov     edx, dword [ebp-0CH]                    ; 018B _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 018E _ 8B. 45, E4
        add     eax, edx                                ; 0191 _ 01. D0
        movzx   eax, byte [eax]                         ; 0193 _ 0F B6. 00
        movsx   eax, al                                 ; 0196 _ 0F BE. C0
        and     eax, 02H                                ; 0199 _ 83. E0, 02
        test    eax, eax                                ; 019C _ 85. C0
        jz      ?_012                                   ; 019E _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 01A0 _ 8B. 45, F0
        add     eax, 6                                  ; 01A3 _ 83. C0, 06
        mov     edx, dword [ebp+1CH]                    ; 01A6 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 01A9 _ 88. 10
?_012:  mov     edx, dword [ebp-0CH]                    ; 01AB _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 01AE _ 8B. 45, E4
        add     eax, edx                                ; 01B1 _ 01. D0
        movzx   eax, byte [eax]                         ; 01B3 _ 0F B6. 00
        movsx   eax, al                                 ; 01B6 _ 0F BE. C0
        and     eax, 01H                                ; 01B9 _ 83. E0, 01
        test    eax, eax                                ; 01BC _ 85. C0
        jz      ?_013                                   ; 01BE _ 74, 0B
        mov     eax, dword [ebp-10H]                    ; 01C0 _ 8B. 45, F0
        add     eax, 7                                  ; 01C3 _ 83. C0, 07
        mov     edx, dword [ebp+1CH]                    ; 01C6 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 01C9 _ 88. 10
?_013:  add     dword [ebp-10H], 270                    ; 01CB _ 81. 45, F0, 0000010E
        add     dword [ebp-0CH], 1                      ; 01D2 _ 83. 45, F4, 01
?_014:  cmp     dword [ebp-0CH], 15                     ; 01D6 _ 83. 7D, F4, 0F
        jle     ?_005                                   ; 01DA _ 0F 8E, FFFFFEF2
        mov     eax, dword [ebp+14H]                    ; 01E0 _ 8B. 45, 14
        add     eax, 4320                               ; 01E3 _ 05, 000010E0
        neg     eax                                     ; 01E8 _ F7. D8
        add     dword [ebp-10H], eax                    ; 01EA _ 01. 45, F0
        jmp     ?_018                                   ; 01ED _ EB, 3E

?_015:  cmp     dword [ebp-18H], 104                    ; 01EF _ 83. 7D, E8, 68
        jle     ?_016                                   ; 01F3 _ 7E, 06
        cmp     dword [ebp-18H], 122                    ; 01F5 _ 83. 7D, E8, 7A
        jle     ?_017                                   ; 01F9 _ 7E, 0C
?_016:  cmp     dword [ebp-18H], 64                     ; 01FB _ 83. 7D, E8, 40
        jle     ?_018                                   ; 01FF _ 7E, 2C
        cmp     dword [ebp-18H], 90                     ; 0201 _ 83. 7D, E8, 5A
        jg      ?_018                                   ; 0205 _ 7F, 26
?_017:  mov     eax, dword [ebp+20H]                    ; 0207 _ 8B. 45, 20
        movzx   eax, byte [eax]                         ; 020A _ 0F B6. 00
        mov     byte [ebp-1EH], al                      ; 020D _ 88. 45, E2
        sub     esp, 8                                  ; 0210 _ 83. EC, 08
        lea     eax, [ebp-1EH]                          ; 0213 _ 8D. 45, E2
        push    eax                                     ; 0216 _ 50
        push    1                                       ; 0217 _ 6A, 01
        push    dword [ebp+1CH]                         ; 0219 _ FF. 75, 1C
        push    dword [ebp+18H]                         ; 021C _ FF. 75, 18
        push    dword [ebp+14H]                         ; 021F _ FF. 75, 14
        push    dword [ebp+8H]                          ; 0222 _ FF. 75, 08
        call    api_putstrwin                           ; 0225 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 022A _ 83. C4, 20
?_018:  add     dword [ebp+20H], 1                      ; 022D _ 83. 45, 20, 01
        add     dword [ebp+14H], 8                      ; 0231 _ 83. 45, 14, 08
        jmp     ?_003                                   ; 0235 _ E9, FFFFFE3E

?_019:  mov     eax, dword [ebp+18H]                    ; 023A _ 8B. 45, 18
        add     eax, 15                                 ; 023D _ 83. C0, 0F
        sub     esp, 12                                 ; 0240 _ 83. EC, 0C
        push    eax                                     ; 0243 _ 50
        push    262                                     ; 0244 _ 68, 00000106
        push    dword [ebp+18H]                         ; 0249 _ FF. 75, 18
        push    8                                       ; 024C _ 6A, 08
        push    dword [ebp+8H]                          ; 024E _ FF. 75, 08
        call    api_refreshwin                          ; 0251 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0256 _ 83. C4, 20
        leave                                           ; 0259 _ C9
        ret                                             ; 025A _ C3
; putstr End of function

waitting:; Function begin
        push    ebp                                     ; 025B _ 55
        mov     ebp, esp                                ; 025C _ 89. E5
        sub     esp, 24                                 ; 025E _ 83. EC, 18
        cmp     dword [ebp+8H], 0                       ; 0261 _ 83. 7D, 08, 00
        jle     ?_020                                   ; 0265 _ 7E, 1A
        sub     esp, 8                                  ; 0267 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 026A _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 026D _ FF. 75, 0C
        call    api_settimer                            ; 0270 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0275 _ 83. C4, 10
        mov     dword [ebp+8H], 128                     ; 0278 _ C7. 45, 08, 00000080
        jmp     ?_021                                   ; 027F _ EB, 07

?_020:  mov     dword [ebp+8H], 28                      ; 0281 _ C7. 45, 08, 0000001C
?_021:  sub     esp, 12                                 ; 0288 _ 83. EC, 0C
        push    1                                       ; 028B _ 6A, 01
        call    api_getkey                              ; 028D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0292 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0295 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0298 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 029B _ 3B. 45, F4
        jnz     ?_022                                   ; 029E _ 75, 02
        jmp     ?_026                                   ; 02A0 _ EB, 2C

?_022:  cmp     dword [ebp-0CH], 36                     ; 02A2 _ 83. 7D, F4, 24
        jnz     ?_023                                   ; 02A6 _ 75, 06
        mov     eax, dword [ebp+10H]                    ; 02A8 _ 8B. 45, 10
        mov     byte [eax], 1                           ; 02AB _ C6. 00, 01
?_023:  cmp     dword [ebp-0CH], 37                     ; 02AE _ 83. 7D, F4, 25
        jnz     ?_024                                   ; 02B2 _ 75, 09
        mov     eax, dword [ebp+10H]                    ; 02B4 _ 8B. 45, 10
        add     eax, 1                                  ; 02B7 _ 83. C0, 01
        mov     byte [eax], 1                           ; 02BA _ C6. 00, 01
?_024:  cmp     dword [ebp-0CH], 57                     ; 02BD _ 83. 7D, F4, 39
        jnz     ?_025                                   ; 02C1 _ 75, 09
        mov     eax, dword [ebp+10H]                    ; 02C3 _ 8B. 45, 10
        add     eax, 2                                  ; 02C6 _ 83. C0, 02
        mov     byte [eax], 1                           ; 02C9 _ C6. 00, 01
?_025:  jmp     ?_021                                   ; 02CC _ EB, BA

?_026:  nop                                             ; 02CE _ 90
        leave                                           ; 02CF _ C9
        ret                                             ; 02D0 _ C3
; waitting End of function

main:   ; Function begin
        lea     ecx, [esp+4H]                           ; 02D1 _ 8D. 4C 24, 04
        and     esp, 0FFFFFFF0H                         ; 02D5 _ 83. E4, F0
        push    dword [ecx-4H]                          ; 02D8 _ FF. 71, FC
        push    ebp                                     ; 02DB _ 55
        mov     ebp, esp                                ; 02DC _ 89. E5
        push    edi                                     ; 02DE _ 57
        push    ebx                                     ; 02DF _ 53
        push    ecx                                     ; 02E0 _ 51
        sub     esp, 64476                              ; 02E1 _ 81. EC, 0000FBDC
        lea     eax, [ebp-0FB0AH]                       ; 02E7 _ 8D. 85, FFFF04F6
        mov     ecx, 192                                ; 02ED _ B9, 000000C0
        mov     ebx, 0                                  ; 02F2 _ BB, 00000000
        mov     dword [eax], ebx                        ; 02F7 _ 89. 18
        mov     dword [eax+ecx-4H], ebx                 ; 02F9 _ 89. 5C 08, FC
        lea     edx, [eax+4H]                           ; 02FD _ 8D. 50, 04
        and     edx, 0FFFFFFFCH                         ; 0300 _ 83. E2, FC
        sub     eax, edx                                ; 0303 _ 29. D0
        add     ecx, eax                                ; 0305 _ 01. C1
        and     ecx, 0FFFFFFFCH                         ; 0307 _ 83. E1, FC
        shr     ecx, 2                                  ; 030A _ C1. E9, 02
        mov     edi, edx                                ; 030D _ 89. D7
        mov     eax, ebx                                ; 030F _ 89. D8
        rep stosd                                       ; 0311 _ F3: AB
        lea     eax, [ebp-0FA4AH]                       ; 0313 _ 8D. 85, FFFF05B6
        mov     dword [ebp-30H], eax                    ; 0319 _ 89. 45, D0
        lea     edx, [ebp-0FB40H]                       ; 031C _ 8D. 95, FFFF04C0
        mov     eax, 0                                  ; 0322 _ B8, 00000000
        mov     ecx, 9                                  ; 0327 _ B9, 00000009
        mov     edi, edx                                ; 032C _ 89. D7
        rep stosd                                       ; 032E _ F3: AB
        mov     byte [ebp-0FB40H], 32                   ; 0330 _ C6. 85, FFFF04C0, 20
        mov     byte [ebp-0FB3FH], 97                   ; 0337 _ C6. 85, FFFF04C1, 61
        mov     byte [ebp-0FB3EH], 98                   ; 033E _ C6. 85, FFFF04C2, 62
        mov     byte [ebp-0FB3DH], 99                   ; 0345 _ C6. 85, FFFF04C3, 63
        mov     byte [ebp-0FB3CH], 100                  ; 034C _ C6. 85, FFFF04C4, 64
        mov     byte [ebp-0FB3BH], 32                   ; 0353 _ C6. 85, FFFF04C5, 20
        mov     byte [ebp-0FB3AH], 97                   ; 035A _ C6. 85, FFFF04C6, 61
        mov     byte [ebp-0FB39H], 98                   ; 0361 _ C6. 85, FFFF04C7, 62
        mov     byte [ebp-0FB38H], 99                   ; 0368 _ C6. 85, FFFF04C8, 63
        mov     byte [ebp-0FB37H], 100                  ; 036F _ C6. 85, FFFF04C9, 64
        mov     byte [ebp-0FB36H], 32                   ; 0376 _ C6. 85, FFFF04CA, 20
        mov     byte [ebp-0FB35H], 97                   ; 037D _ C6. 85, FFFF04CB, 61
        mov     byte [ebp-0FB34H], 98                   ; 0384 _ C6. 85, FFFF04CC, 62
        mov     byte [ebp-0FB33H], 99                   ; 038B _ C6. 85, FFFF04CD, 63
        mov     byte [ebp-0FB32H], 100                  ; 0392 _ C6. 85, FFFF04CE, 64
        mov     byte [ebp-0FB31H], 32                   ; 0399 _ C6. 85, FFFF04CF, 20
        mov     byte [ebp-0FB30H], 97                   ; 03A0 _ C6. 85, FFFF04D0, 61
        mov     byte [ebp-0FB2FH], 98                   ; 03A7 _ C6. 85, FFFF04D1, 62
        mov     byte [ebp-0FB2EH], 99                   ; 03AE _ C6. 85, FFFF04D2, 63
        mov     byte [ebp-0FB2DH], 100                  ; 03B5 _ C6. 85, FFFF04D3, 64
        mov     byte [ebp-0FB2CH], 32                   ; 03BC _ C6. 85, FFFF04D4, 20
        mov     byte [ebp-0FB2BH], 97                   ; 03C3 _ C6. 85, FFFF04D5, 61
        mov     byte [ebp-0FB2AH], 98                   ; 03CA _ C6. 85, FFFF04D6, 62
        mov     byte [ebp-0FB29H], 99                   ; 03D1 _ C6. 85, FFFF04D7, 63
        mov     byte [ebp-0FB28H], 100                  ; 03D8 _ C6. 85, FFFF04D8, 64
        mov     byte [ebp-0FB27H], 32                   ; 03DF _ C6. 85, FFFF04D9, 20
        lea     edx, [ebp-0FBD0H]                       ; 03E6 _ 8D. 95, FFFF0430
        mov     eax, 0                                  ; 03EC _ B8, 00000000
        mov     ecx, 36                                 ; 03F1 _ B9, 00000024
        mov     edi, edx                                ; 03F6 _ 89. D7
        rep stosd                                       ; 03F8 _ F3: AB
        mov     byte [ebp-0FBCDH], 67                   ; 03FA _ C6. 85, FFFF0433, 43
        mov     byte [ebp-0FBCCH], 95                   ; 0401 _ C6. 85, FFFF0434, 5F
        mov     byte [ebp-0FBCBH], 95                   ; 0408 _ C6. 85, FFFF0435, 5F
        mov     byte [ebp-0FBCAH], 95                   ; 040F _ C6. 85, FFFF0436, 5F
        mov     byte [ebp-0FBC9H], 127                  ; 0416 _ C6. 85, FFFF0437, 7F
        mov     byte [ebp-0FBC8H], 31                   ; 041D _ C6. 85, FFFF0438, 1F
        mov     byte [ebp-0FBC7H], 31                   ; 0424 _ C6. 85, FFFF0439, 1F
        mov     byte [ebp-0FBC6H], 31                   ; 042B _ C6. 85, FFFF043A, 1F
        mov     byte [ebp-0FBC5H], 31                   ; 0432 _ C6. 85, FFFF043B, 1F
        mov     byte [ebp-0FBC3H], 32                   ; 0439 _ C6. 85, FFFF043D, 20
        mov     byte [ebp-0FBC2H], 63                   ; 0440 _ C6. 85, FFFF043E, 3F
        mov     byte [ebp-0FBBFH], 15                   ; 0447 _ C6. 85, FFFF0441, 0F
        mov     byte [ebp-0FBBEH], 127                  ; 044E _ C6. 85, FFFF0442, 7F
        mov     byte [ebp-0FBBDH], -1                   ; 0455 _ C6. 85, FFFF0443, FF
        mov     byte [ebp-0FBBCH], -49                  ; 045C _ C6. 85, FFFF0444, CF
        mov     byte [ebp-0FBBBH], -49                  ; 0463 _ C6. 85, FFFF0445, CF
        mov     byte [ebp-0FBBAH], -49                  ; 046A _ C6. 85, FFFF0446, CF
        mov     byte [ebp-0FBB9H], -1                   ; 0471 _ C6. 85, FFFF0447, FF
        mov     byte [ebp-0FBB8H], -1                   ; 0478 _ C6. 85, FFFF0448, FF
        mov     byte [ebp-0FBB7H], -32                  ; 047F _ C6. 85, FFFF0449, E0
        mov     byte [ebp-0FBB6H], -1                   ; 0486 _ C6. 85, FFFF044A, FF
        mov     byte [ebp-0FBB5H], -1                   ; 048D _ C6. 85, FFFF044B, FF
        mov     byte [ebp-0FBB4H], -64                  ; 0494 _ C6. 85, FFFF044C, C0
        mov     byte [ebp-0FBB3H], -64                  ; 049B _ C6. 85, FFFF044D, C0
        mov     byte [ebp-0FBB2H], -64                  ; 04A2 _ C6. 85, FFFF044E, C0
        mov     byte [ebp-0FBAFH], -16                  ; 04A9 _ C6. 85, FFFF0451, F0
        mov     byte [ebp-0FBAEH], -2                   ; 04B0 _ C6. 85, FFFF0452, FE
        mov     byte [ebp-0FBADH], -1                   ; 04B7 _ C6. 85, FFFF0453, FF
        mov     byte [ebp-0FBACH], -13                  ; 04BE _ C6. 85, FFFF0454, F3
        mov     byte [ebp-0FBABH], -13                  ; 04C5 _ C6. 85, FFFF0455, F3
        mov     byte [ebp-0FBAAH], -13                  ; 04CC _ C6. 85, FFFF0456, F3
        mov     byte [ebp-0FBA9H], -1                   ; 04D3 _ C6. 85, FFFF0457, FF
        mov     byte [ebp-0FBA8H], -1                   ; 04DA _ C6. 85, FFFF0458, FF
        mov     byte [ebp-0FBA7H], 7                    ; 04E1 _ C6. 85, FFFF0459, 07
        mov     byte [ebp-0FBA6H], -1                   ; 04E8 _ C6. 85, FFFF045A, FF
        mov     byte [ebp-0FBA5H], -1                   ; 04EF _ C6. 85, FFFF045B, FF
        mov     byte [ebp-0FBA4H], 3                    ; 04F6 _ C6. 85, FFFF045C, 03
        mov     byte [ebp-0FBA3H], 3                    ; 04FD _ C6. 85, FFFF045D, 03
        mov     byte [ebp-0FBA2H], 3                    ; 0504 _ C6. 85, FFFF045E, 03
        mov     byte [ebp-0FB9DH], -62                  ; 050B _ C6. 85, FFFF0463, C2
        mov     byte [ebp-0FB9CH], -6                   ; 0512 _ C6. 85, FFFF0464, FA
        mov     byte [ebp-0FB9BH], -6                   ; 0519 _ C6. 85, FFFF0465, FA
        mov     byte [ebp-0FB9AH], -6                   ; 0520 _ C6. 85, FFFF0466, FA
        mov     byte [ebp-0FB99H], -2                   ; 0527 _ C6. 85, FFFF0467, FE
        mov     byte [ebp-0FB98H], -8                   ; 052E _ C6. 85, FFFF0468, F8
        mov     byte [ebp-0FB97H], -8                   ; 0535 _ C6. 85, FFFF0469, F8
        mov     byte [ebp-0FB96H], -8                   ; 053C _ C6. 85, FFFF046A, F8
        mov     byte [ebp-0FB95H], -8                   ; 0543 _ C6. 85, FFFF046B, F8
        mov     byte [ebp-0FB93H], 4                    ; 054A _ C6. 85, FFFF046D, 04
        mov     byte [ebp-0FB92H], -4                   ; 0551 _ C6. 85, FFFF046E, FC
        mov     byte [ebp-0FB8EH], 1                    ; 0558 _ C6. 85, FFFF0472, 01
        mov     byte [ebp-0FB8DH], 1                    ; 055F _ C6. 85, FFFF0473, 01
        mov     byte [ebp-0FB8CH], 1                    ; 0566 _ C6. 85, FFFF0474, 01
        mov     byte [ebp-0FB8BH], 1                    ; 056D _ C6. 85, FFFF0475, 01
        mov     byte [ebp-0FB8AH], 1                    ; 0574 _ C6. 85, FFFF0476, 01
        mov     byte [ebp-0FB89H], 1                    ; 057B _ C6. 85, FFFF0477, 01
        mov     byte [ebp-0FB88H], 1                    ; 0582 _ C6. 85, FFFF0478, 01
        mov     byte [ebp-0FB87H], 67                   ; 0589 _ C6. 85, FFFF0479, 43
        mov     byte [ebp-0FB86H], 71                   ; 0590 _ C6. 85, FFFF047A, 47
        mov     byte [ebp-0FB85H], 79                   ; 0597 _ C6. 85, FFFF047B, 4F
        mov     byte [ebp-0FB84H], 95                   ; 059E _ C6. 85, FFFF047C, 5F
        mov     byte [ebp-0FB83H], 127                  ; 05A5 _ C6. 85, FFFF047D, 7F
        mov     byte [ebp-0FB82H], 127                  ; 05AC _ C6. 85, FFFF047E, 7F
        mov     byte [ebp-0FB80H], 24                   ; 05B3 _ C6. 85, FFFF0480, 18
        mov     byte [ebp-0FB7FH], 126                  ; 05BA _ C6. 85, FFFF0481, 7E
        mov     byte [ebp-0FB7EH], -1                   ; 05C1 _ C6. 85, FFFF0482, FF
        mov     byte [ebp-0FB7DH], -61                  ; 05C8 _ C6. 85, FFFF0483, C3
        mov     byte [ebp-0FB7CH], -61                  ; 05CF _ C6. 85, FFFF0484, C3
        mov     byte [ebp-0FB7BH], -61                  ; 05D6 _ C6. 85, FFFF0485, C3
        mov     byte [ebp-0FB7AH], -61                  ; 05DD _ C6. 85, FFFF0486, C3
        mov     byte [ebp-0FB79H], -1                   ; 05E4 _ C6. 85, FFFF0487, FF
        mov     byte [ebp-0FB78H], -1                   ; 05EB _ C6. 85, FFFF0488, FF
        mov     byte [ebp-0FB77H], -1                   ; 05F2 _ C6. 85, FFFF0489, FF
        mov     byte [ebp-0FB76H], -25                  ; 05F9 _ C6. 85, FFFF048A, E7
        mov     byte [ebp-0FB75H], -25                  ; 0600 _ C6. 85, FFFF048B, E7
        mov     byte [ebp-0FB74H], -25                  ; 0607 _ C6. 85, FFFF048C, E7
        mov     byte [ebp-0FB73H], -25                  ; 060E _ C6. 85, FFFF048D, E7
        mov     byte [ebp-0FB72H], -1                   ; 0615 _ C6. 85, FFFF048E, FF
        mov     byte [ebp-0FB6EH], -128                 ; 061C _ C6. 85, FFFF0492, 80
        mov     byte [ebp-0FB6DH], -128                 ; 0623 _ C6. 85, FFFF0493, 80
        mov     byte [ebp-0FB6CH], -128                 ; 062A _ C6. 85, FFFF0494, 80
        mov     byte [ebp-0FB6BH], -128                 ; 0631 _ C6. 85, FFFF0495, 80
        mov     byte [ebp-0FB6AH], -128                 ; 0638 _ C6. 85, FFFF0496, 80
        mov     byte [ebp-0FB69H], -128                 ; 063F _ C6. 85, FFFF0497, 80
        mov     byte [ebp-0FB68H], -128                 ; 0646 _ C6. 85, FFFF0498, 80
        mov     byte [ebp-0FB67H], -62                  ; 064D _ C6. 85, FFFF0499, C2
        mov     byte [ebp-0FB66H], -30                  ; 0654 _ C6. 85, FFFF049A, E2
        mov     byte [ebp-0FB65H], -14                  ; 065B _ C6. 85, FFFF049B, F2
        mov     byte [ebp-0FB64H], -6                   ; 0662 _ C6. 85, FFFF049C, FA
        mov     byte [ebp-0FB63H], -2                   ; 0669 _ C6. 85, FFFF049D, FE
        mov     byte [ebp-0FB62H], -2                   ; 0670 _ C6. 85, FFFF049E, FE
        mov     byte [ebp-0FB5FH], 24                   ; 0677 _ C6. 85, FFFF04A1, 18
        mov     byte [ebp-0FB5EH], 24                   ; 067E _ C6. 85, FFFF04A2, 18
        mov     byte [ebp-0FB5DH], 24                   ; 0685 _ C6. 85, FFFF04A3, 18
        mov     byte [ebp-0FB5CH], 24                   ; 068C _ C6. 85, FFFF04A4, 18
        mov     byte [ebp-0FB5BH], 24                   ; 0693 _ C6. 85, FFFF04A5, 18
        mov     byte [ebp-0FB5AH], 24                   ; 069A _ C6. 85, FFFF04A6, 18
        mov     byte [ebp-0FB59H], 24                   ; 06A1 _ C6. 85, FFFF04A7, 18
        mov     byte [ebp-0FB58H], 24                   ; 06A8 _ C6. 85, FFFF04A8, 18
        mov     byte [ebp-0FB57H], 24                   ; 06AF _ C6. 85, FFFF04A9, 18
        mov     byte [ebp-0FB56H], 24                   ; 06B6 _ C6. 85, FFFF04AA, 18
        mov     byte [ebp-0FB55H], 24                   ; 06BD _ C6. 85, FFFF04AB, 18
        mov     byte [ebp-0FB54H], 24                   ; 06C4 _ C6. 85, FFFF04AC, 18
        mov     byte [ebp-0FB53H], 24                   ; 06CB _ C6. 85, FFFF04AD, 18
        mov     byte [ebp-0FB52H], 24                   ; 06D2 _ C6. 85, FFFF04AE, 18
        sub     esp, 12                                 ; 06D9 _ 83. EC, 0C
        push    ?_061                                   ; 06DC _ 68, 00000000(d)
        push    -1                                      ; 06E1 _ 6A, FF
        push    237                                     ; 06E3 _ 68, 000000ED
        push    270                                     ; 06E8 _ 68, 0000010E
        lea     eax, [ebp-0FA4AH]                       ; 06ED _ 8D. 85, FFFF05B6
        push    eax                                     ; 06F3 _ 50
        call    api_openwin                             ; 06F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06F9 _ 83. C4, 20
        mov     dword [ebp-50H], eax                    ; 06FC _ 89. 45, B0
        sub     esp, 8                                  ; 06FF _ 83. EC, 08
        push    0                                       ; 0702 _ 6A, 00
        push    228                                     ; 0704 _ 68, 000000E4
        push    264                                     ; 0709 _ 68, 00000108
        push    29                                      ; 070E _ 6A, 1D
        push    8                                       ; 0710 _ 6A, 08
        push    dword [ebp-50H]                         ; 0712 _ FF. 75, B0
        call    api_boxfilwin                           ; 0715 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 071A _ 83. C4, 20
        call    api_alloctimer                          ; 071D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], eax                    ; 0722 _ 89. 45, AC
        sub     esp, 8                                  ; 0725 _ 83. EC, 08
        push    128                                     ; 0728 _ 68, 00000080
        push    dword [ebp-54H]                         ; 072D _ FF. 75, AC
        call    api_inittimer                           ; 0730 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0735 _ 83. C4, 10
        mov     dword [ebp-2CH], 18                     ; 0738 _ C7. 45, D4, 00000012
        mov     dword [ebp-0FBD8H], 0                   ; 073F _ C7. 85, FFFF0428, 00000000
        mov     dword [ebp-0FBD4H], 0                   ; 0749 _ C7. 85, FFFF042C, 00000000
        mov     byte [ebp-0FBD8H], 101                  ; 0753 _ C6. 85, FFFF0428, 65
        mov     byte [ebp-0FBD7H], 102                  ; 075A _ C6. 85, FFFF0429, 66
        mov     byte [ebp-0FBD6H], 103                  ; 0761 _ C6. 85, FFFF042A, 67
        sub     esp, 4                                  ; 0768 _ 83. EC, 04
        lea     eax, [ebp-0FBD8H]                       ; 076B _ 8D. 85, FFFF0428
        push    eax                                     ; 0771 _ 50
        push    6                                       ; 0772 _ 6A, 06
        push    11                                      ; 0774 _ 6A, 0B
        push    18                                      ; 0776 _ 6A, 12
        lea     eax, [ebp-0FBD0H]                       ; 0778 _ 8D. 85, FFFF0430
        push    eax                                     ; 077E _ 50
        lea     eax, [ebp-0FA4AH]                       ; 077F _ 8D. 85, FFFF05B6
        push    eax                                     ; 0785 _ 50
        push    dword [ebp-50H]                         ; 0786 _ FF. 75, B0
        call    putstr                                  ; 0789 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 078E _ 83. C4, 20
        mov     dword [ebp-38H], 20                     ; 0791 _ C7. 45, C8, 00000014
?_027:  mov     dword [ebp-24H], 7                      ; 0798 _ C7. 45, DC, 00000007
        mov     dword [ebp-28H], 1                      ; 079F _ C7. 45, D8, 00000001
        mov     dword [ebp-40H], 3                      ; 07A6 _ C7. 45, C0, 00000003
        mov     dword [ebp-1CH], 0                      ; 07AD _ C7. 45, E4, 00000000
        jmp     ?_031                                   ; 07B4 _ EB, 74

?_028:  mov     dword [ebp-20H], 0                      ; 07B6 _ C7. 45, E0, 00000000
        jmp     ?_030                                   ; 07BD _ EB, 26

?_029:  mov     eax, dword [ebp-1CH]                    ; 07BF _ 8B. 45, E4
        shl     eax, 5                                  ; 07C2 _ C1. E0, 05
        mov     edx, eax                                ; 07C5 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 07C7 _ 8B. 45, E0
        add     edx, eax                                ; 07CA _ 01. C2
        lea     ecx, [ebp-0FB40H]                       ; 07CC _ 8D. 8D, FFFF04C0
        mov     eax, dword [ebp-20H]                    ; 07D2 _ 8B. 45, E0
        add     eax, ecx                                ; 07D5 _ 01. C8
        movzx   eax, byte [eax]                         ; 07D7 _ 0F B6. 00
        mov     byte [ebp+edx-0FB0AH], al               ; 07DA _ 88. 84 15, FFFF04F6
        add     dword [ebp-20H], 1                      ; 07E1 _ 83. 45, E0, 01
?_030:  cmp     dword [ebp-20H], 19                     ; 07E5 _ 83. 7D, E0, 13
        jle     ?_029                                   ; 07E9 _ 7E, D4
        mov     eax, dword [ebp-1CH]                    ; 07EB _ 8B. 45, E4
        shl     eax, 5                                  ; 07EE _ C1. E0, 05
        mov     edx, eax                                ; 07F1 _ 89. C2
        lea     eax, [ebp-0FB0AH]                       ; 07F3 _ 8D. 85, FFFF04F6
        add     edx, eax                                ; 07F9 _ 01. C2
        mov     ecx, dword [ebp-28H]                    ; 07FB _ 8B. 4D, D8
        mov     eax, dword [ebp-1CH]                    ; 07FE _ 8B. 45, E4
        add     eax, ecx                                ; 0801 _ 01. C8
        sub     esp, 4                                  ; 0803 _ 83. EC, 04
        push    edx                                     ; 0806 _ 52
        push    2                                       ; 0807 _ 6A, 02
        push    eax                                     ; 0809 _ 50
        push    dword [ebp-24H]                         ; 080A _ FF. 75, DC
        lea     eax, [ebp-0FBD0H]                       ; 080D _ 8D. 85, FFFF0430
        push    eax                                     ; 0813 _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0814 _ 8D. 85, FFFF05B6
        push    eax                                     ; 081A _ 50
        push    dword [ebp-50H]                         ; 081B _ FF. 75, B0
        call    putstr                                  ; 081E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0823 _ 83. C4, 20
        add     dword [ebp-1CH], 1                      ; 0826 _ 83. 45, E4, 01
?_031:  cmp     dword [ebp-1CH], 2                      ; 082A _ 83. 7D, E4, 02
        jle     ?_028                                   ; 082E _ 7E, 86
        mov     byte [ebp-0FB1CH], 0                    ; 0830 _ C6. 85, FFFF04E4, 00
        mov     byte [ebp-0FB1BH], 0                    ; 0837 _ C6. 85, FFFF04E5, 00
        mov     byte [ebp-0FB1AH], 0                    ; 083E _ C6. 85, FFFF04E6, 00
        mov     dword [ebp-44H], 0                      ; 0845 _ C7. 45, BC, 00000000
        mov     dword [ebp-48H], 0                      ; 084C _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 0853 _ C7. 45, B4, 00000000
        mov     eax, dword [ebp-38H]                    ; 085A _ 8B. 45, C8
        mov     dword [ebp-3CH], eax                    ; 085D _ 89. 45, C4
        mov     dword [ebp-34H], 1                      ; 0860 _ C7. 45, CC, 00000001
?_032:  cmp     dword [ebp-4CH], 0                      ; 0867 _ 83. 7D, B4, 00
        jz      ?_033                                   ; 086B _ 74, 0B
        sub     dword [ebp-4CH], 1                      ; 086D _ 83. 6D, B4, 01
        mov     byte [ebp-0FB1AH], 0                    ; 0871 _ C6. 85, FFFF04E6, 00
?_033:  sub     esp, 4                                  ; 0878 _ 83. EC, 04
        lea     eax, [ebp-0FB1CH]                       ; 087B _ 8D. 85, FFFF04E4
        push    eax                                     ; 0881 _ 50
        push    dword [ebp-54H]                         ; 0882 _ FF. 75, AC
        push    4                                       ; 0885 _ 6A, 04
        call    waitting                                ; 0887 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 088C _ 83. C4, 10
        movzx   eax, byte [ebp-0FB1CH]                  ; 088F _ 0F B6. 85, FFFF04E4
        test    al, al                                  ; 0896 _ 84. C0
        jz      ?_034                                   ; 0898 _ 74, 5E
        cmp     dword [ebp-2CH], 1                      ; 089A _ 83. 7D, D4, 01
        jle     ?_034                                   ; 089E _ 7E, 58
        sub     dword [ebp-2CH], 1                      ; 08A0 _ 83. 6D, D4, 01
        mov     byte [ebp-0FBD8H], 101                  ; 08A4 _ C6. 85, FFFF0428, 65
        mov     byte [ebp-0FBD7H], 102                  ; 08AB _ C6. 85, FFFF0429, 66
        mov     byte [ebp-0FBD6H], 103                  ; 08B2 _ C6. 85, FFFF042A, 67
        mov     byte [ebp-0FBD5H], 32                   ; 08B9 _ C6. 85, FFFF042B, 20
        mov     byte [ebp-0FBD4H], 0                    ; 08C0 _ C6. 85, FFFF042C, 00
        sub     esp, 4                                  ; 08C7 _ 83. EC, 04
        lea     eax, [ebp-0FBD8H]                       ; 08CA _ 8D. 85, FFFF0428
        push    eax                                     ; 08D0 _ 50
        push    6                                       ; 08D1 _ 6A, 06
        push    11                                      ; 08D3 _ 6A, 0B
        push    dword [ebp-2CH]                         ; 08D5 _ FF. 75, D4
        lea     eax, [ebp-0FBD0H]                       ; 08D8 _ 8D. 85, FFFF0430
        push    eax                                     ; 08DE _ 50
        lea     eax, [ebp-0FA4AH]                       ; 08DF _ 8D. 85, FFFF05B6
        push    eax                                     ; 08E5 _ 50
        push    dword [ebp-50H]                         ; 08E6 _ FF. 75, B0
        call    putstr                                  ; 08E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08EE _ 83. C4, 20
        mov     byte [ebp-0FB1CH], 0                    ; 08F1 _ C6. 85, FFFF04E4, 00
?_034:  movzx   eax, byte [ebp-0FB1BH]                  ; 08F8 _ 0F B6. 85, FFFF04E5
        test    al, al                                  ; 08FF _ 84. C0
        jz      ?_035                                   ; 0901 _ 74, 5E
        cmp     dword [ebp-2CH], 23                     ; 0903 _ 83. 7D, D4, 17
        jg      ?_035                                   ; 0907 _ 7F, 58
        add     dword [ebp-2CH], 1                      ; 0909 _ 83. 45, D4, 01
        mov     byte [ebp-0FBD8H], 32                   ; 090D _ C6. 85, FFFF0428, 20
        mov     byte [ebp-0FBD7H], 101                  ; 0914 _ C6. 85, FFFF0429, 65
        mov     byte [ebp-0FBD6H], 102                  ; 091B _ C6. 85, FFFF042A, 66
        mov     byte [ebp-0FBD5H], 103                  ; 0922 _ C6. 85, FFFF042B, 67
        mov     byte [ebp-0FBD4H], 0                    ; 0929 _ C6. 85, FFFF042C, 00
        sub     esp, 4                                  ; 0930 _ 83. EC, 04
        lea     eax, [ebp-0FBD8H]                       ; 0933 _ 8D. 85, FFFF0428
        push    eax                                     ; 0939 _ 50
        push    6                                       ; 093A _ 6A, 06
        push    11                                      ; 093C _ 6A, 0B
        push    dword [ebp-2CH]                         ; 093E _ FF. 75, D4
        lea     eax, [ebp-0FBD0H]                       ; 0941 _ 8D. 85, FFFF0430
        push    eax                                     ; 0947 _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0948 _ 8D. 85, FFFF05B6
        push    eax                                     ; 094E _ 50
        push    dword [ebp-50H]                         ; 094F _ FF. 75, B0
        call    putstr                                  ; 0952 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0957 _ 83. C4, 20
        mov     byte [ebp-0FB1BH], 0                    ; 095A _ C6. 85, FFFF04E5, 00
?_035:  movzx   eax, byte [ebp-0FB1AH]                  ; 0961 _ 0F B6. 85, FFFF04E6
        test    al, al                                  ; 0968 _ 84. C0
        jz      ?_036                                   ; 096A _ 74, 2A
        cmp     dword [ebp-4CH], 0                      ; 096C _ 83. 7D, B4, 00
        jnz     ?_036                                   ; 0970 _ 75, 24
        mov     dword [ebp-4CH], 15                     ; 0972 _ C7. 45, B4, 0000000F
        mov     eax, dword [ebp-2CH]                    ; 0979 _ 8B. 45, D4
        add     eax, 1                                  ; 097C _ 83. C0, 01
        mov     dword [ebp-48H], eax                    ; 097F _ 89. 45, B8
        mov     dword [ebp-44H], 8                      ; 0982 _ C7. 45, BC, 00000008
        sub     esp, 12                                 ; 0989 _ 83. EC, 0C
        push    99                                      ; 098C _ 6A, 63
        call    api_putchar                             ; 098E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0993 _ 83. C4, 10
?_036:  cmp     dword [ebp-3CH], 0                      ; 0996 _ 83. 7D, C4, 00
        jz      ?_037                                   ; 099A _ 74, 09
        sub     dword [ebp-3CH], 1                      ; 099C _ 83. 6D, C4, 01
        jmp     ?_044                                   ; 09A0 _ E9, 00000168

?_037:  mov     eax, dword [ebp-38H]                    ; 09A5 _ 8B. 45, C8
        mov     dword [ebp-3CH], eax                    ; 09A8 _ 89. 45, C4
        mov     edx, dword [ebp-24H]                    ; 09AB _ 8B. 55, DC
        mov     eax, dword [ebp-34H]                    ; 09AE _ 8B. 45, CC
        add     eax, edx                                ; 09B1 _ 01. D0
        cmp     eax, 12                                 ; 09B3 _ 83. F8, 0C
        jg      ?_038                                   ; 09B6 _ 7F, 10
        mov     edx, dword [ebp-24H]                    ; 09B8 _ 8B. 55, DC
        mov     eax, dword [ebp-34H]                    ; 09BB _ 8B. 45, CC
        add     eax, edx                                ; 09BE _ 01. D0
        test    eax, eax                                ; 09C0 _ 85. C0
        jg      ?_040                                   ; 09C2 _ 0F 8F, 000000EF
?_038:  mov     edx, dword [ebp-28H]                    ; 09C8 _ 8B. 55, D8
        mov     eax, dword [ebp-40H]                    ; 09CB _ 8B. 45, C0
        add     eax, edx                                ; 09CE _ 01. D0
        cmp     eax, 13                                 ; 09D0 _ 83. F8, 0D
        jne     ?_039                                   ; 09D3 _ 0F 85, 000000A8
        nop                                             ; 09D9 _ 90
        mov     dword [ebp-0FBE4H], 0                   ; 09DA _ C7. 85, FFFF041C, 00000000
        mov     dword [ebp-0FBE0H], 0                   ; 09E4 _ C7. 85, FFFF0420, 00000000
        mov     dword [ebp-0FBDCH], 0                   ; 09EE _ C7. 85, FFFF0424, 00000000
        mov     byte [ebp-0FBE4H], 71                   ; 09F8 _ C6. 85, FFFF041C, 47
        mov     byte [ebp-0FBE3H], 65                   ; 09FF _ C6. 85, FFFF041D, 41
        mov     byte [ebp-0FBE2H], 77                   ; 0A06 _ C6. 85, FFFF041E, 4D
        mov     byte [ebp-0FBE1H], 69                   ; 0A0D _ C6. 85, FFFF041F, 45
        mov     byte [ebp-0FBE0H], 32                   ; 0A14 _ C6. 85, FFFF0420, 20
        mov     byte [ebp-0FBDFH], 79                   ; 0A1B _ C6. 85, FFFF0421, 4F
        mov     byte [ebp-0FBDEH], 86                   ; 0A22 _ C6. 85, FFFF0422, 56
        mov     byte [ebp-0FBDDH], 69                   ; 0A29 _ C6. 85, FFFF0423, 45
        mov     byte [ebp-0FBDCH], 82                   ; 0A30 _ C6. 85, FFFF0424, 52
        sub     esp, 4                                  ; 0A37 _ 83. EC, 04
        lea     eax, [ebp-0FBE4H]                       ; 0A3A _ 8D. 85, FFFF041C
        push    eax                                     ; 0A40 _ 50
        push    1                                       ; 0A41 _ 6A, 01
        push    6                                       ; 0A43 _ 6A, 06
        push    15                                      ; 0A45 _ 6A, 0F
        lea     eax, [ebp-0FBD0H]                       ; 0A47 _ 8D. 85, FFFF0430
        push    eax                                     ; 0A4D _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0A4E _ 8D. 85, FFFF05B6
        push    eax                                     ; 0A54 _ 50
        push    dword [ebp-50H]                         ; 0A55 _ FF. 75, B0
        call    putstr                                  ; 0A58 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A5D _ 83. C4, 20
        sub     esp, 12                                 ; 0A60 _ 83. EC, 0C
        push    228                                     ; 0A63 _ 68, 000000E4
        push    207                                     ; 0A68 _ 68, 000000CF
        push    29                                      ; 0A6D _ 6A, 1D
        push    8                                       ; 0A6F _ 6A, 08
        push    dword [ebp-50H]                         ; 0A71 _ FF. 75, B0
        call    api_refreshwin                          ; 0A74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A79 _ 83. C4, 20
        jmp     ?_058                                   ; 0A7C _ E9, 000002A7

?_039:  neg     dword [ebp-34H]                         ; 0A81 _ F7. 5D, CC
        mov     eax, dword [ebp-24H]                    ; 0A84 _ 8B. 45, DC
        add     eax, 1                                  ; 0A87 _ 83. C0, 01
        sub     esp, 4                                  ; 0A8A _ 83. EC, 04
        push    ?_062                                   ; 0A8D _ 68, 00000008(d)
        push    0                                       ; 0A92 _ 6A, 00
        push    dword [ebp-28H]                         ; 0A94 _ FF. 75, D8
        push    eax                                     ; 0A97 _ 50
        lea     eax, [ebp-0FBD0H]                       ; 0A98 _ 8D. 85, FFFF0430
        push    eax                                     ; 0A9E _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0A9F _ 8D. 85, FFFF05B6
        push    eax                                     ; 0AA5 _ 50
        push    dword [ebp-50H]                         ; 0AA6 _ FF. 75, B0
        call    putstr                                  ; 0AA9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AAE _ 83. C4, 20
        add     dword [ebp-28H], 1                      ; 0AB1 _ 83. 45, D8, 01
        jmp     ?_041                                   ; 0AB5 _ EB, 06

?_040:  mov     eax, dword [ebp-34H]                    ; 0AB7 _ 8B. 45, CC
        add     dword [ebp-24H], eax                    ; 0ABA _ 01. 45, DC
?_041:  mov     dword [ebp-1CH], 0                      ; 0ABD _ C7. 45, E4, 00000000
        jmp     ?_043                                   ; 0AC4 _ EB, 3F

?_042:  mov     eax, dword [ebp-1CH]                    ; 0AC6 _ 8B. 45, E4
        shl     eax, 5                                  ; 0AC9 _ C1. E0, 05
        mov     edx, eax                                ; 0ACC _ 89. C2
        lea     eax, [ebp-0FB0AH]                       ; 0ACE _ 8D. 85, FFFF04F6
        add     edx, eax                                ; 0AD4 _ 01. C2
        mov     ecx, dword [ebp-28H]                    ; 0AD6 _ 8B. 4D, D8
        mov     eax, dword [ebp-1CH]                    ; 0AD9 _ 8B. 45, E4
        add     eax, ecx                                ; 0ADC _ 01. C8
        sub     esp, 4                                  ; 0ADE _ 83. EC, 04
        push    edx                                     ; 0AE1 _ 52
        push    2                                       ; 0AE2 _ 6A, 02
        push    eax                                     ; 0AE4 _ 50
        push    dword [ebp-24H]                         ; 0AE5 _ FF. 75, DC
        lea     eax, [ebp-0FBD0H]                       ; 0AE8 _ 8D. 85, FFFF0430
        push    eax                                     ; 0AEE _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0AEF _ 8D. 85, FFFF05B6
        push    eax                                     ; 0AF5 _ 50
        push    dword [ebp-50H]                         ; 0AF6 _ FF. 75, B0
        call    putstr                                  ; 0AF9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AFE _ 83. C4, 20
        add     dword [ebp-1CH], 1                      ; 0B01 _ 83. 45, E4, 01
?_043:  mov     eax, dword [ebp-1CH]                    ; 0B05 _ 8B. 45, E4
        cmp     eax, dword [ebp-40H]                    ; 0B08 _ 3B. 45, C0
        jl      ?_042                                   ; 0B0B _ 7C, B9
?_044:  cmp     dword [ebp-44H], 0                      ; 0B0D _ 83. 7D, BC, 00
        jle     ?_057                                   ; 0B11 _ 0F 8E, 0000020C
        cmp     dword [ebp-44H], 7                      ; 0B17 _ 83. 7D, BC, 07
        jg      ?_046                                   ; 0B1B _ 0F 8F, 0000008B
        mov     eax, dword [ebp-24H]                    ; 0B21 _ 8B. 45, DC
        cmp     eax, dword [ebp-48H]                    ; 0B24 _ 3B. 45, B8
        jge     ?_045                                   ; 0B27 _ 7D, 5A
        mov     eax, dword [ebp-24H]                    ; 0B29 _ 8B. 45, DC
        add     eax, 25                                 ; 0B2C _ 83. C0, 19
        cmp     eax, dword [ebp-48H]                    ; 0B2F _ 3B. 45, B8
        jle     ?_045                                   ; 0B32 _ 7E, 4F
        mov     eax, dword [ebp-28H]                    ; 0B34 _ 8B. 45, D8
        cmp     eax, dword [ebp-44H]                    ; 0B37 _ 3B. 45, BC
        jg      ?_045                                   ; 0B3A _ 7F, 47
        mov     edx, dword [ebp-28H]                    ; 0B3C _ 8B. 55, D8
        mov     eax, dword [ebp-40H]                    ; 0B3F _ 8B. 45, C0
        add     eax, edx                                ; 0B42 _ 01. D0
        cmp     eax, dword [ebp-44H]                    ; 0B44 _ 3B. 45, BC
        jle     ?_045                                   ; 0B47 _ 7E, 3A
        mov     eax, dword [ebp-44H]                    ; 0B49 _ 8B. 45, BC
        sub     eax, dword [ebp-28H]                    ; 0B4C _ 2B. 45, D8
        shl     eax, 5                                  ; 0B4F _ C1. E0, 05
        mov     edx, eax                                ; 0B52 _ 89. C2
        lea     eax, [ebp-0FB0AH]                       ; 0B54 _ 8D. 85, FFFF04F6
        add     eax, edx                                ; 0B5A _ 01. D0
        sub     esp, 4                                  ; 0B5C _ 83. EC, 04
        push    eax                                     ; 0B5F _ 50
        push    2                                       ; 0B60 _ 6A, 02
        push    dword [ebp-44H]                         ; 0B62 _ FF. 75, BC
        push    dword [ebp-24H]                         ; 0B65 _ FF. 75, DC
        lea     eax, [ebp-0FBD0H]                       ; 0B68 _ 8D. 85, FFFF0430
        push    eax                                     ; 0B6E _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0B6F _ 8D. 85, FFFF05B6
        push    eax                                     ; 0B75 _ 50
        push    dword [ebp-50H]                         ; 0B76 _ FF. 75, B0
        call    putstr                                  ; 0B79 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B7E _ 83. C4, 20
        jmp     ?_046                                   ; 0B81 _ EB, 29

?_045:  sub     esp, 4                                  ; 0B83 _ 83. EC, 04
        push    ?_062                                   ; 0B86 _ 68, 00000008(d)
        push    0                                       ; 0B8B _ 6A, 00
        push    dword [ebp-44H]                         ; 0B8D _ FF. 75, BC
        push    dword [ebp-48H]                         ; 0B90 _ FF. 75, B8
        lea     eax, [ebp-0FBD0H]                       ; 0B93 _ 8D. 85, FFFF0430
        push    eax                                     ; 0B99 _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0B9A _ 8D. 85, FFFF05B6
        push    eax                                     ; 0BA0 _ 50
        push    dword [ebp-50H]                         ; 0BA1 _ FF. 75, B0
        call    putstr                                  ; 0BA4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BA9 _ 83. C4, 20
?_046:  sub     dword [ebp-44H], 1                      ; 0BAC _ 83. 6D, BC, 01
        cmp     dword [ebp-44H], 0                      ; 0BB0 _ 83. 7D, BC, 00
        jle     ?_047                                   ; 0BB4 _ 7E, 39
        mov     byte [ebp-0FBE6H], 104                  ; 0BB6 _ C6. 85, FFFF041A, 68
        mov     byte [ebp-0FBE5H], 0                    ; 0BBD _ C6. 85, FFFF041B, 00
        sub     esp, 4                                  ; 0BC4 _ 83. EC, 04
        lea     eax, [ebp-0FBE6H]                       ; 0BC7 _ 8D. 85, FFFF041A
        push    eax                                     ; 0BCD _ 50
        push    3                                       ; 0BCE _ 6A, 03
        push    dword [ebp-44H]                         ; 0BD0 _ FF. 75, BC
        push    dword [ebp-48H]                         ; 0BD3 _ FF. 75, B8
        lea     eax, [ebp-0FBD0H]                       ; 0BD6 _ 8D. 85, FFFF0430
        push    eax                                     ; 0BDC _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0BDD _ 8D. 85, FFFF05B6
        push    eax                                     ; 0BE3 _ 50
        push    dword [ebp-50H]                         ; 0BE4 _ FF. 75, B0
        call    putstr                                  ; 0BE7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BEC _ 83. C4, 20
?_047:  mov     eax, dword [ebp-24H]                    ; 0BEF _ 8B. 45, DC
        cmp     eax, dword [ebp-48H]                    ; 0BF2 _ 3B. 45, B8
        jge     ?_057                                   ; 0BF5 _ 0F 8D, 00000128
        mov     eax, dword [ebp-24H]                    ; 0BFB _ 8B. 45, DC
        add     eax, 25                                 ; 0BFE _ 83. C0, 19
        cmp     eax, dword [ebp-48H]                    ; 0C01 _ 3B. 45, B8
        jle     ?_057                                   ; 0C04 _ 0F 8E, 00000119
        mov     eax, dword [ebp-28H]                    ; 0C0A _ 8B. 45, D8
        cmp     eax, dword [ebp-44H]                    ; 0C0D _ 3B. 45, BC
        jg      ?_057                                   ; 0C10 _ 0F 8F, 0000010D
        mov     edx, dword [ebp-28H]                    ; 0C16 _ 8B. 55, D8
        mov     eax, dword [ebp-40H]                    ; 0C19 _ 8B. 45, C0
        add     eax, edx                                ; 0C1C _ 01. D0
        cmp     eax, dword [ebp-44H]                    ; 0C1E _ 3B. 45, BC
        jle     ?_057                                   ; 0C21 _ 0F 8E, 000000FC
        mov     eax, dword [ebp-44H]                    ; 0C27 _ 8B. 45, BC
        sub     eax, dword [ebp-28H]                    ; 0C2A _ 2B. 45, D8
        shl     eax, 5                                  ; 0C2D _ C1. E0, 05
        mov     edx, eax                                ; 0C30 _ 89. C2
        mov     eax, dword [ebp-48H]                    ; 0C32 _ 8B. 45, B8
        sub     eax, dword [ebp-24H]                    ; 0C35 _ 2B. 45, DC
        add     edx, eax                                ; 0C38 _ 01. C2
        lea     eax, [ebp-0FB0AH]                       ; 0C3A _ 8D. 85, FFFF04F6
        add     eax, edx                                ; 0C40 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 0C42 _ 89. 45, D0
        mov     eax, dword [ebp-30H]                    ; 0C45 _ 8B. 45, D0
        movzx   eax, byte [eax]                         ; 0C48 _ 0F B6. 00
        cmp     al, 32                                  ; 0C4B _ 3C, 20
        je      ?_057                                   ; 0C4D _ 0F 84, 000000D0
        sub     dword [ebp-30H], 1                      ; 0C53 _ 83. 6D, D0, 01
        jmp     ?_049                                   ; 0C57 _ EB, 04

?_048:  sub     dword [ebp-30H], 1                      ; 0C59 _ 83. 6D, D0, 01
?_049:  mov     eax, dword [ebp-30H]                    ; 0C5D _ 8B. 45, D0
        movzx   eax, byte [eax]                         ; 0C60 _ 0F B6. 00
        cmp     al, 32                                  ; 0C63 _ 3C, 20
        jnz     ?_048                                   ; 0C65 _ 75, F2
        mov     dword [ebp-1CH], 1                      ; 0C67 _ C7. 45, E4, 00000001
        jmp     ?_051                                   ; 0C6E _ EB, 0F

?_050:  mov     edx, dword [ebp-1CH]                    ; 0C70 _ 8B. 55, E4
        mov     eax, dword [ebp-30H]                    ; 0C73 _ 8B. 45, D0
        add     eax, edx                                ; 0C76 _ 01. D0
        mov     byte [eax], 32                          ; 0C78 _ C6. 00, 20
        add     dword [ebp-1CH], 1                      ; 0C7B _ 83. 45, E4, 01
?_051:  cmp     dword [ebp-1CH], 4                      ; 0C7F _ 83. 7D, E4, 04
        jle     ?_050                                   ; 0C83 _ 7E, EB
        mov     eax, dword [ebp-44H]                    ; 0C85 _ 8B. 45, BC
        sub     eax, dword [ebp-28H]                    ; 0C88 _ 2B. 45, D8
        shl     eax, 5                                  ; 0C8B _ C1. E0, 05
        mov     edx, eax                                ; 0C8E _ 89. C2
        lea     eax, [ebp-0FB0AH]                       ; 0C90 _ 8D. 85, FFFF04F6
        add     eax, edx                                ; 0C96 _ 01. D0
        sub     esp, 4                                  ; 0C98 _ 83. EC, 04
        push    eax                                     ; 0C9B _ 50
        push    2                                       ; 0C9C _ 6A, 02
        push    dword [ebp-44H]                         ; 0C9E _ FF. 75, BC
        push    dword [ebp-24H]                         ; 0CA1 _ FF. 75, DC
        lea     eax, [ebp-0FBD0H]                       ; 0CA4 _ 8D. 85, FFFF0430
        push    eax                                     ; 0CAA _ 50
        lea     eax, [ebp-0FA4AH]                       ; 0CAB _ 8D. 85, FFFF05B6
        push    eax                                     ; 0CB1 _ 50
        push    dword [ebp-50H]                         ; 0CB2 _ FF. 75, B0
        call    putstr                                  ; 0CB5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CBA _ 83. C4, 20
        jmp     ?_056                                   ; 0CBD _ EB, 41

?_052:  mov     eax, dword [ebp-40H]                    ; 0CBF _ 8B. 45, C0
        sub     eax, 1                                  ; 0CC2 _ 83. E8, 01
        shl     eax, 5                                  ; 0CC5 _ C1. E0, 05
        mov     edx, eax                                ; 0CC8 _ 89. C2
        lea     eax, [ebp-0FB0AH]                       ; 0CCA _ 8D. 85, FFFF04F6
        add     eax, edx                                ; 0CD0 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 0CD2 _ 89. 45, D0
        jmp     ?_055                                   ; 0CD5 _ EB, 1B

?_053:  mov     eax, dword [ebp-30H]                    ; 0CD7 _ 8B. 45, D0
        movzx   eax, byte [eax]                         ; 0CDA _ 0F B6. 00
        cmp     al, 32                                  ; 0CDD _ 3C, 20
        jz      ?_054                                   ; 0CDF _ 74, 0D
        nop                                             ; 0CE1 _ 90
        mov     dword [ebp-44H], 0                      ; 0CE2 _ C7. 45, BC, 00000000
        jmp     ?_032                                   ; 0CE9 _ E9, FFFFFB79

?_054:  add     dword [ebp-30H], 1                      ; 0CEE _ 83. 45, D0, 01
?_055:  mov     eax, dword [ebp-30H]                    ; 0CF2 _ 8B. 45, D0
        movzx   eax, byte [eax]                         ; 0CF5 _ 0F B6. 00
        test    al, al                                  ; 0CF8 _ 84. C0
        jnz     ?_053                                   ; 0CFA _ 75, DB
        sub     dword [ebp-40H], 1                      ; 0CFC _ 83. 6D, C0, 01
?_056:  cmp     dword [ebp-40H], 0                      ; 0D00 _ 83. 7D, C0, 00
        jg      ?_052                                   ; 0D04 _ 7F, B9
        mov     ecx, dword [ebp-38H]                    ; 0D06 _ 8B. 4D, C8
        mov     edx, 1431655766                         ; 0D09 _ BA, 55555556
        mov     eax, ecx                                ; 0D0E _ 89. C8
        imul    edx                                     ; 0D10 _ F7. EA
        mov     eax, ecx                                ; 0D12 _ 89. C8
        sar     eax, 31                                 ; 0D14 _ C1. F8, 1F
        sub     edx, eax                                ; 0D17 _ 29. C2
        mov     eax, edx                                ; 0D19 _ 89. D0
        sub     dword [ebp-38H], eax                    ; 0D1B _ 29. 45, C8
        jmp     ?_027                                   ; 0D1E _ E9, FFFFFA75

?_057:  jmp     ?_032                                   ; 0D23 _ E9, FFFFFB3F

?_058:  sub     esp, 12                                 ; 0D28 _ 83. EC, 0C
        push    1                                       ; 0D2B _ 6A, 01
        call    api_getkey                              ; 0D2D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D32 _ 83. C4, 10
        cmp     eax, 28                                 ; 0D35 _ 83. F8, 1C
        jnz     ?_059                                   ; 0D38 _ 75, 02
        jmp     ?_060                                   ; 0D3A _ EB, 02

?_059:  jmp     ?_058                                   ; 0D3C _ EB, EA

?_060:  sub     esp, 12                                 ; 0D3E _ 83. EC, 0C
        push    dword [ebp-50H]                         ; 0D41 _ FF. 75, B0
        call    api_closewin                            ; 0D44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D49 _ 83. C4, 10
        nop                                             ; 0D4C _ 90
        lea     esp, [ebp-0CH]                          ; 0D4D _ 8D. 65, F4
        pop     ecx                                     ; 0D50 _ 59
        pop     ebx                                     ; 0D51 _ 5B
        pop     edi                                     ; 0D52 _ 5F
        pop     ebp                                     ; 0D53 _ 5D
        lea     esp, [ecx-4H]                           ; 0D54 _ 8D. 61, FC
        ret                                             ; 0D57 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_061:                                                  ; byte
        db 69H, 6EH, 76H, 61H, 64H, 65H, 72H, 00H       ; 0000 _ invader.

?_062:                                                  ; byte
        db 20H, 20H, 00H                                ; 0008 _   .


