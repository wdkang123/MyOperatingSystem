; Disassembly of file: write_vga_desktop_mouse_init.o
; Fri Jan 29 13:58:06 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 36                                 ; 0004 _ 83. EC, 24
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 001C _ 89. 45, F4
        mov     eax, dword [?_042]                      ; 001F _ A1, 00000104(d)
        cwde                                            ; 0024 _ 98
        mov     dword [ebp-10H], eax                    ; 0025 _ 89. 45, F0
        mov     ax, word [?_043]                        ; 0028 _ 66: A1, 00000106(d)
        cwde                                            ; 002E _ 98
        mov     dword [ebp-14H], eax                    ; 002F _ 89. 45, EC
        call    init_palette                            ; 0032 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0037 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 003C _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 003F _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 0042 _ 8B. 45, F0
        dec     eax                                     ; 0045 _ 48
        sub     esp, 4                                  ; 0046 _ 83. EC, 04
        push    edx                                     ; 0049 _ 52
        push    eax                                     ; 004A _ 50
        push    0                                       ; 004B _ 6A, 00
        push    0                                       ; 004D _ 6A, 00
        push    14                                      ; 004F _ 6A, 0E
        push    dword [ebp-10H]                         ; 0051 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0054 _ FF. 75, F4
        call    boxfill8                                ; 0057 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 005C _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 005F _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 0062 _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 0065 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0068 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 006B _ 8B. 45, EC
        sub     eax, 28                                 ; 006E _ 83. E8, 1C
        sub     esp, 4                                  ; 0071 _ 83. EC, 04
        push    ecx                                     ; 0074 _ 51
        push    edx                                     ; 0075 _ 52
        push    eax                                     ; 0076 _ 50
        push    0                                       ; 0077 _ 6A, 00
        push    8                                       ; 0079 _ 6A, 08
        push    dword [ebp-10H]                         ; 007B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 007E _ FF. 75, F4
        call    boxfill8                                ; 0081 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0086 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0089 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 008C _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 008F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0092 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0095 _ 8B. 45, EC
        sub     eax, 27                                 ; 0098 _ 83. E8, 1B
        sub     esp, 4                                  ; 009B _ 83. EC, 04
        push    ecx                                     ; 009E _ 51
        push    edx                                     ; 009F _ 52
        push    eax                                     ; 00A0 _ 50
        push    0                                       ; 00A1 _ 6A, 00
        push    7                                       ; 00A3 _ 6A, 07
        push    dword [ebp-10H]                         ; 00A5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00A8 _ FF. 75, F4
        call    boxfill8                                ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B0 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00B3 _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00B6 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00B9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00BC _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00BF _ 8B. 45, EC
        sub     eax, 26                                 ; 00C2 _ 83. E8, 1A
        sub     esp, 4                                  ; 00C5 _ 83. EC, 04
        push    ecx                                     ; 00C8 _ 51
        push    edx                                     ; 00C9 _ 52
        push    eax                                     ; 00CA _ 50
        push    0                                       ; 00CB _ 6A, 00
        push    8                                       ; 00CD _ 6A, 08
        push    dword [ebp-10H]                         ; 00CF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00D2 _ FF. 75, F4
        call    boxfill8                                ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00DA _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00DD _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 00E0 _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 00E3 _ 8B. 45, EC
        sub     eax, 24                                 ; 00E6 _ 83. E8, 18
        sub     esp, 4                                  ; 00E9 _ 83. EC, 04
        push    edx                                     ; 00EC _ 52
        push    59                                      ; 00ED _ 6A, 3B
        push    eax                                     ; 00EF _ 50
        push    3                                       ; 00F0 _ 6A, 03
        push    7                                       ; 00F2 _ 6A, 07
        push    dword [ebp-10H]                         ; 00F4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00F7 _ FF. 75, F4
        call    boxfill8                                ; 00FA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FF _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0102 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0105 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0108 _ 8B. 45, EC
        sub     eax, 24                                 ; 010B _ 83. E8, 18
        sub     esp, 4                                  ; 010E _ 83. EC, 04
        push    edx                                     ; 0111 _ 52
        push    2                                       ; 0112 _ 6A, 02
        push    eax                                     ; 0114 _ 50
        push    2                                       ; 0115 _ 6A, 02
        push    7                                       ; 0117 _ 6A, 07
        push    dword [ebp-10H]                         ; 0119 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 011C _ FF. 75, F4
        call    boxfill8                                ; 011F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0124 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0127 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 012A _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 012D _ 8B. 45, EC
        sub     eax, 4                                  ; 0130 _ 83. E8, 04
        sub     esp, 4                                  ; 0133 _ 83. EC, 04
        push    edx                                     ; 0136 _ 52
        push    59                                      ; 0137 _ 6A, 3B
        push    eax                                     ; 0139 _ 50
        push    3                                       ; 013A _ 6A, 03
        push    15                                      ; 013C _ 6A, 0F
        push    dword [ebp-10H]                         ; 013E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0141 _ FF. 75, F4
        call    boxfill8                                ; 0144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0149 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 014C _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 014F _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 0152 _ 8B. 45, EC
        sub     eax, 23                                 ; 0155 _ 83. E8, 17
        sub     esp, 4                                  ; 0158 _ 83. EC, 04
        push    edx                                     ; 015B _ 52
        push    59                                      ; 015C _ 6A, 3B
        push    eax                                     ; 015E _ 50
        push    59                                      ; 015F _ 6A, 3B
        push    15                                      ; 0161 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0163 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0166 _ FF. 75, F4
        call    boxfill8                                ; 0169 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 016E _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0171 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0174 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0177 _ 8B. 45, EC
        sub     eax, 3                                  ; 017A _ 83. E8, 03
        sub     esp, 4                                  ; 017D _ 83. EC, 04
        push    edx                                     ; 0180 _ 52
        push    59                                      ; 0181 _ 6A, 3B
        push    eax                                     ; 0183 _ 50
        push    2                                       ; 0184 _ 6A, 02
        push    0                                       ; 0186 _ 6A, 00
        push    dword [ebp-10H]                         ; 0188 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 018B _ FF. 75, F4
        call    boxfill8                                ; 018E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0193 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0196 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0199 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 019C _ 8B. 45, EC
        sub     eax, 24                                 ; 019F _ 83. E8, 18
        sub     esp, 4                                  ; 01A2 _ 83. EC, 04
        push    edx                                     ; 01A5 _ 52
        push    60                                      ; 01A6 _ 6A, 3C
        push    eax                                     ; 01A8 _ 50
        push    60                                      ; 01A9 _ 6A, 3C
        push    0                                       ; 01AB _ 6A, 00
        push    dword [ebp-10H]                         ; 01AD _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01B0 _ FF. 75, F4
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01BB _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01BE _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 01C1 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01C4 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01C7 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01CA _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01CD _ 8B. 45, F0
        sub     eax, 47                                 ; 01D0 _ 83. E8, 2F
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ebx                                     ; 01D6 _ 53
        push    ecx                                     ; 01D7 _ 51
        push    edx                                     ; 01D8 _ 52
        push    eax                                     ; 01D9 _ 50
        push    15                                      ; 01DA _ 6A, 0F
        push    dword [ebp-10H]                         ; 01DC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01DF _ FF. 75, F4
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01EA _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 01ED _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 01F0 _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 01F3 _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 01F6 _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 01F9 _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 01FC _ 8B. 45, F0
        sub     eax, 47                                 ; 01FF _ 83. E8, 2F
        sub     esp, 4                                  ; 0202 _ 83. EC, 04
        push    ebx                                     ; 0205 _ 53
        push    ecx                                     ; 0206 _ 51
        push    edx                                     ; 0207 _ 52
        push    eax                                     ; 0208 _ 50
        push    15                                      ; 0209 _ 6A, 0F
        push    dword [ebp-10H]                         ; 020B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 020E _ FF. 75, F4
        call    boxfill8                                ; 0211 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0216 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0219 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 021C _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 021F _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 0222 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 0225 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0228 _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 022B _ 8B. 45, F0
        sub     eax, 47                                 ; 022E _ 83. E8, 2F
        sub     esp, 4                                  ; 0231 _ 83. EC, 04
        push    ebx                                     ; 0234 _ 53
        push    ecx                                     ; 0235 _ 51
        push    edx                                     ; 0236 _ 52
        push    eax                                     ; 0237 _ 50
        push    7                                       ; 0238 _ 6A, 07
        push    dword [ebp-10H]                         ; 023A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 023D _ FF. 75, F4
        call    boxfill8                                ; 0240 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0245 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0248 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 024B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 024E _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 0251 _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 0254 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0257 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 025A _ 8B. 45, F0
        sub     eax, 3                                  ; 025D _ 83. E8, 03
        sub     esp, 4                                  ; 0260 _ 83. EC, 04
        push    ebx                                     ; 0263 _ 53
        push    ecx                                     ; 0264 _ 51
        push    edx                                     ; 0265 _ 52
        push    eax                                     ; 0266 _ 50
        push    7                                       ; 0267 _ 6A, 07
        push    dword [ebp-10H]                         ; 0269 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 026C _ FF. 75, F4
        call    boxfill8                                ; 026F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0274 _ 83. C4, 20
        sub     esp, 8                                  ; 0277 _ 83. EC, 08
        push    14                                      ; 027A _ 6A, 0E
        push    mcursor                                 ; 027C _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 0281 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0286 _ 83. C4, 10
        push    16                                      ; 0289 _ 6A, 10
        push    mcursor                                 ; 028B _ 68, 00000000(d)
        push    80                                      ; 0290 _ 6A, 50
        push    80                                      ; 0292 _ 6A, 50
        push    16                                      ; 0294 _ 6A, 10
        push    16                                      ; 0296 _ 6A, 10
        push    dword [ebp-10H]                         ; 0298 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 029B _ FF. 75, F4
        call    putblock                                ; 029E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02A3 _ 83. C4, 20
        call    io_sti                                  ; 02A6 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 02B0 _ C7. 45, E8, 00000000
?_001:  call    io_cli                                  ; 02B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_046]                      ; 02BC _ A1, 00000148(d)
        test    eax, eax                                ; 02C1 _ 85. C0
        jnz     ?_002                                   ; 02C3 _ 75, 07
        call    io_stihlt                               ; 02C5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02CA _ EB, EB

?_002:  mov     eax, dword [?_044]                      ; 02CC _ A1, 00000140(d)
        mov     al, byte [keybuf+eax]                   ; 02D1 _ 8A. 80, 00000120(d)
        movzx   eax, al                                 ; 02D7 _ 0F B6. C0
        mov     dword [ebp-18H], eax                    ; 02DA _ 89. 45, E8
        mov     eax, dword [?_044]                      ; 02DD _ A1, 00000140(d)
        inc     eax                                     ; 02E2 _ 40
        and     eax, 8000001FH                          ; 02E3 _ 25, 8000001F
        test    eax, eax                                ; 02E8 _ 85. C0
        jns     ?_003                                   ; 02EA _ 79, 05
        dec     eax                                     ; 02EC _ 48
        or      eax, 0FFFFFFE0H                         ; 02ED _ 83. C8, E0
        inc     eax                                     ; 02F0 _ 40
?_003:  mov     dword [?_044], eax                      ; 02F1 _ A3, 00000140(d)
        call    io_sti                                  ; 02F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_046]                      ; 02FB _ A1, 00000148(d)
        dec     eax                                     ; 0300 _ 48
        mov     dword [?_046], eax                      ; 0301 _ A3, 00000148(d)
        mov     eax, dword [ebp-18H]                    ; 0306 _ 8B. 45, E8
        movzx   eax, al                                 ; 0309 _ 0F B6. C0
        sub     esp, 12                                 ; 030C _ 83. EC, 0C
        push    eax                                     ; 030F _ 50
        call    charToHexStr                            ; 0310 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0315 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0318 _ 89. 45, E4
        mov     eax, dword [showPos.1586]               ; 031B _ A1, 0000014C(d)
        sub     esp, 8                                  ; 0320 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0323 _ FF. 75, E4
        push    7                                       ; 0326 _ 6A, 07
        push    0                                       ; 0328 _ 6A, 00
        push    eax                                     ; 032A _ 50
        push    dword [ebp-10H]                         ; 032B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 032E _ FF. 75, F4
        call    showString                              ; 0331 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0336 _ 83. C4, 20
        mov     eax, dword [showPos.1586]               ; 0339 _ A1, 0000014C(d)
        add     eax, 32                                 ; 033E _ 83. C0, 20
        mov     dword [showPos.1586], eax               ; 0341 _ A3, 0000014C(d)
        jmp     ?_001                                   ; 0346 _ E9, FFFFFF6C
; CMain End of function

initBootInfo:; Function begin
        push    ebp                                     ; 034B _ 55
        mov     ebp, esp                                ; 034C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 034E _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0351 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0357 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 035A _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0360 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0363 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0369 _ 90
        pop     ebp                                     ; 036A _ 5D
        ret                                             ; 036B _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 036C _ 55
        mov     ebp, esp                                ; 036D _ 89. E5
        sub     esp, 24                                 ; 036F _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0372 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0375 _ 88. 45, F4
        jmp     ?_005                                   ; 0378 _ EB, 35

?_004:  mov     eax, dword [ebp+1CH]                    ; 037A _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 037D _ 8A. 00
        movzx   eax, al                                 ; 037F _ 0F B6. C0
        shl     eax, 4                                  ; 0382 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0385 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 038B _ 0F BE. 45, F4
        sub     esp, 8                                  ; 038F _ 83. EC, 08
        push    edx                                     ; 0392 _ 52
        push    eax                                     ; 0393 _ 50
        push    dword [ebp+14H]                         ; 0394 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0397 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 039A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 039D _ FF. 75, 08
        call    showFont8                               ; 03A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03A5 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 03A8 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 03AC _ FF. 45, 1C
?_005:  mov     eax, dword [ebp+1CH]                    ; 03AF _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 03B2 _ 8A. 00
        test    al, al                                  ; 03B4 _ 84. C0
        jnz     ?_004                                   ; 03B6 _ 75, C2
        nop                                             ; 03B8 _ 90
        nop                                             ; 03B9 _ 90
        leave                                           ; 03BA _ C9
        ret                                             ; 03BB _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 03BC _ 55
        mov     ebp, esp                                ; 03BD _ 89. E5
        sub     esp, 8                                  ; 03BF _ 83. EC, 08
        sub     esp, 4                                  ; 03C2 _ 83. EC, 04
        push    table_rgb.1605                          ; 03C5 _ 68, 00000020(d)
        push    15                                      ; 03CA _ 6A, 0F
        push    0                                       ; 03CC _ 6A, 00
        call    set_palette                             ; 03CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D3 _ 83. C4, 10
        nop                                             ; 03D6 _ 90
        leave                                           ; 03D7 _ C9
        ret                                             ; 03D8 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03D9 _ 55
        mov     ebp, esp                                ; 03DA _ 89. E5
        sub     esp, 24                                 ; 03DC _ 83. EC, 18
        call    io_load_eflags                          ; 03DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 03E4 _ 89. 45, F0
        call    io_cli                                  ; 03E7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03EC _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03EF _ FF. 75, 08
        push    968                                     ; 03F2 _ 68, 000003C8
        call    io_out8                                 ; 03F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FC _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03FF _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0402 _ 89. 45, F4
        jmp     ?_007                                   ; 0405 _ EB, 5F

?_006:  mov     eax, dword [ebp+10H]                    ; 0407 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 040A _ 8A. 00
        shr     al, 2                                   ; 040C _ C0. E8, 02
        movzx   eax, al                                 ; 040F _ 0F B6. C0
        sub     esp, 8                                  ; 0412 _ 83. EC, 08
        push    eax                                     ; 0415 _ 50
        push    969                                     ; 0416 _ 68, 000003C9
        call    io_out8                                 ; 041B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0420 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0423 _ 8B. 45, 10
        inc     eax                                     ; 0426 _ 40
        mov     al, byte [eax]                          ; 0427 _ 8A. 00
        shr     al, 2                                   ; 0429 _ C0. E8, 02
        movzx   eax, al                                 ; 042C _ 0F B6. C0
        sub     esp, 8                                  ; 042F _ 83. EC, 08
        push    eax                                     ; 0432 _ 50
        push    969                                     ; 0433 _ 68, 000003C9
        call    io_out8                                 ; 0438 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0440 _ 8B. 45, 10
        add     eax, 2                                  ; 0443 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0446 _ 8A. 00
        shr     al, 2                                   ; 0448 _ C0. E8, 02
        movzx   eax, al                                 ; 044B _ 0F B6. C0
        sub     esp, 8                                  ; 044E _ 83. EC, 08
        push    eax                                     ; 0451 _ 50
        push    969                                     ; 0452 _ 68, 000003C9
        call    io_out8                                 ; 0457 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 045C _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 045F _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0463 _ FF. 45, F4
?_007:  mov     eax, dword [ebp-0CH]                    ; 0466 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0469 _ 3B. 45, 0C
        jle     ?_006                                   ; 046C _ 7E, 99
        sub     esp, 12                                 ; 046E _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0471 _ FF. 75, F0
        call    io_store_eflags                         ; 0474 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0479 _ 83. C4, 10
        nop                                             ; 047C _ 90
        leave                                           ; 047D _ C9
        ret                                             ; 047E _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 047F _ 55
        mov     ebp, esp                                ; 0480 _ 89. E5
        sub     esp, 20                                 ; 0482 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0485 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0488 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 048B _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 048E _ 89. 45, F8
        jmp     ?_011                                   ; 0491 _ EB, 30

?_008:  mov     eax, dword [ebp+14H]                    ; 0493 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0496 _ 89. 45, FC
        jmp     ?_010                                   ; 0499 _ EB, 1D

?_009:  mov     eax, dword [ebp-8H]                     ; 049B _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 049E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04A2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 04A4 _ 8B. 45, FC
        add     eax, edx                                ; 04A7 _ 01. D0
        mov     edx, eax                                ; 04A9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04AB _ 8B. 45, 08
        add     edx, eax                                ; 04AE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 04B0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 04B3 _ 88. 02
        inc     dword [ebp-4H]                          ; 04B5 _ FF. 45, FC
?_010:  mov     eax, dword [ebp-4H]                     ; 04B8 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 04BB _ 3B. 45, 1C
        jle     ?_009                                   ; 04BE _ 7E, DB
        inc     dword [ebp-8H]                          ; 04C0 _ FF. 45, F8
?_011:  mov     eax, dword [ebp-8H]                     ; 04C3 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 04C6 _ 3B. 45, 20
        jle     ?_008                                   ; 04C9 _ 7E, C8
        nop                                             ; 04CB _ 90
        nop                                             ; 04CC _ 90
        leave                                           ; 04CD _ C9
        ret                                             ; 04CE _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 04CF _ 55
        mov     ebp, esp                                ; 04D0 _ 89. E5
        sub     esp, 20                                 ; 04D2 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04D5 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04D8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04DB _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 04E2 _ E9, 00000162

?_012:  mov     edx, dword [ebp-4H]                     ; 04E7 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 04EA _ 8B. 45, 1C
        add     eax, edx                                ; 04ED _ 01. D0
        mov     al, byte [eax]                          ; 04EF _ 8A. 00
        mov     byte [ebp-5H], al                       ; 04F1 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 04F4 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 04F8 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 04FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04FD _ 8B. 45, FC
        add     eax, edx                                ; 0500 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0502 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0506 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0508 _ 8B. 45, 10
        add     eax, edx                                ; 050B _ 01. D0
        mov     edx, eax                                ; 050D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 050F _ 8B. 45, 08
        add     edx, eax                                ; 0512 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0514 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0517 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 0519 _ 0F BE. 45, FB
        and     eax, 40H                                ; 051D _ 83. E0, 40
        test    eax, eax                                ; 0520 _ 85. C0
        jz      ?_014                                   ; 0522 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0524 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0527 _ 8B. 45, FC
        add     eax, edx                                ; 052A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 052C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0530 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0532 _ 8B. 45, 10
        add     eax, edx                                ; 0535 _ 01. D0
        lea     edx, [eax+1H]                           ; 0537 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 053A _ 8B. 45, 08
        add     edx, eax                                ; 053D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 053F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0542 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0544 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0548 _ 83. E0, 20
        test    eax, eax                                ; 054B _ 85. C0
        jz      ?_015                                   ; 054D _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 054F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0552 _ 8B. 45, FC
        add     eax, edx                                ; 0555 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0557 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 055B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 055D _ 8B. 45, 10
        add     eax, edx                                ; 0560 _ 01. D0
        lea     edx, [eax+2H]                           ; 0562 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0565 _ 8B. 45, 08
        add     edx, eax                                ; 0568 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 056A _ 8A. 45, EC
        mov     byte [edx], al                          ; 056D _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 056F _ 0F BE. 45, FB
        and     eax, 10H                                ; 0573 _ 83. E0, 10
        test    eax, eax                                ; 0576 _ 85. C0
        jz      ?_016                                   ; 0578 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 057A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 057D _ 8B. 45, FC
        add     eax, edx                                ; 0580 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0582 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0586 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0588 _ 8B. 45, 10
        add     eax, edx                                ; 058B _ 01. D0
        lea     edx, [eax+3H]                           ; 058D _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0590 _ 8B. 45, 08
        add     edx, eax                                ; 0593 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0595 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0598 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 059A _ 0F BE. 45, FB
        and     eax, 08H                                ; 059E _ 83. E0, 08
        test    eax, eax                                ; 05A1 _ 85. C0
        jz      ?_017                                   ; 05A3 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 05A5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05A8 _ 8B. 45, FC
        add     eax, edx                                ; 05AB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05AD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05B1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05B3 _ 8B. 45, 10
        add     eax, edx                                ; 05B6 _ 01. D0
        lea     edx, [eax+4H]                           ; 05B8 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05BB _ 8B. 45, 08
        add     edx, eax                                ; 05BE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 05C0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 05C3 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 05C5 _ 0F BE. 45, FB
        and     eax, 04H                                ; 05C9 _ 83. E0, 04
        test    eax, eax                                ; 05CC _ 85. C0
        jz      ?_018                                   ; 05CE _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 05D0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05D3 _ 8B. 45, FC
        add     eax, edx                                ; 05D6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05D8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05DC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05DE _ 8B. 45, 10
        add     eax, edx                                ; 05E1 _ 01. D0
        lea     edx, [eax+5H]                           ; 05E3 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 05E6 _ 8B. 45, 08
        add     edx, eax                                ; 05E9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 05EB _ 8A. 45, EC
        mov     byte [edx], al                          ; 05EE _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 05F0 _ 0F BE. 45, FB
        and     eax, 02H                                ; 05F4 _ 83. E0, 02
        test    eax, eax                                ; 05F7 _ 85. C0
        jz      ?_019                                   ; 05F9 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 05FB _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05FE _ 8B. 45, FC
        add     eax, edx                                ; 0601 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0603 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0607 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0609 _ 8B. 45, 10
        add     eax, edx                                ; 060C _ 01. D0
        lea     edx, [eax+6H]                           ; 060E _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0611 _ 8B. 45, 08
        add     edx, eax                                ; 0614 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0616 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0619 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 061B _ 0F BE. 45, FB
        and     eax, 01H                                ; 061F _ 83. E0, 01
        test    eax, eax                                ; 0622 _ 85. C0
        jz      ?_020                                   ; 0624 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0626 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0629 _ 8B. 45, FC
        add     eax, edx                                ; 062C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 062E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0632 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0634 _ 8B. 45, 10
        add     eax, edx                                ; 0637 _ 01. D0
        lea     edx, [eax+7H]                           ; 0639 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 063C _ 8B. 45, 08
        add     edx, eax                                ; 063F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0641 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0644 _ 88. 02
?_020:  inc     dword [ebp-4H]                          ; 0646 _ FF. 45, FC
?_021:  cmp     dword [ebp-4H], 15                      ; 0649 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 064D _ 0F 8E, FFFFFE94
        nop                                             ; 0653 _ 90
        nop                                             ; 0654 _ 90
        leave                                           ; 0655 _ C9
        ret                                             ; 0656 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0657 _ 55
        mov     ebp, esp                                ; 0658 _ 89. E5
        sub     esp, 20                                 ; 065A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 065D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0660 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0663 _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 066A _ E9, 000000AB

?_022:  mov     dword [ebp-4H], 0                       ; 066F _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0676 _ E9, 00000092

?_023:  mov     eax, dword [ebp-8H]                     ; 067B _ 8B. 45, F8
        shl     eax, 4                                  ; 067E _ C1. E0, 04
        mov     edx, eax                                ; 0681 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0683 _ 8B. 45, FC
        add     eax, edx                                ; 0686 _ 01. D0
        add     eax, cursor.1652                        ; 0688 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 068D _ 8A. 00
        cmp     al, 42                                  ; 068F _ 3C, 2A
        jnz     ?_024                                   ; 0691 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0693 _ 8B. 45, F8
        shl     eax, 4                                  ; 0696 _ C1. E0, 04
        mov     edx, eax                                ; 0699 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 069B _ 8B. 45, FC
        add     eax, edx                                ; 069E _ 01. D0
        mov     edx, eax                                ; 06A0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06A2 _ 8B. 45, 08
        add     eax, edx                                ; 06A5 _ 01. D0
        mov     byte [eax], 0                           ; 06A7 _ C6. 00, 00
?_024:  mov     eax, dword [ebp-8H]                     ; 06AA _ 8B. 45, F8
        shl     eax, 4                                  ; 06AD _ C1. E0, 04
        mov     edx, eax                                ; 06B0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06B2 _ 8B. 45, FC
        add     eax, edx                                ; 06B5 _ 01. D0
        add     eax, cursor.1652                        ; 06B7 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 06BC _ 8A. 00
        cmp     al, 79                                  ; 06BE _ 3C, 4F
        jnz     ?_025                                   ; 06C0 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 06C2 _ 8B. 45, F8
        shl     eax, 4                                  ; 06C5 _ C1. E0, 04
        mov     edx, eax                                ; 06C8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06CA _ 8B. 45, FC
        add     eax, edx                                ; 06CD _ 01. D0
        mov     edx, eax                                ; 06CF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06D1 _ 8B. 45, 08
        add     eax, edx                                ; 06D4 _ 01. D0
        mov     byte [eax], 7                           ; 06D6 _ C6. 00, 07
?_025:  mov     eax, dword [ebp-8H]                     ; 06D9 _ 8B. 45, F8
        shl     eax, 4                                  ; 06DC _ C1. E0, 04
        mov     edx, eax                                ; 06DF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06E1 _ 8B. 45, FC
        add     eax, edx                                ; 06E4 _ 01. D0
        add     eax, cursor.1652                        ; 06E6 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 06EB _ 8A. 00
        cmp     al, 46                                  ; 06ED _ 3C, 2E
        jnz     ?_026                                   ; 06EF _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 06F1 _ 8B. 45, F8
        shl     eax, 4                                  ; 06F4 _ C1. E0, 04
        mov     edx, eax                                ; 06F7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06F9 _ 8B. 45, FC
        add     eax, edx                                ; 06FC _ 01. D0
        mov     edx, eax                                ; 06FE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0700 _ 8B. 45, 08
        add     edx, eax                                ; 0703 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0705 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0708 _ 88. 02
?_026:  inc     dword [ebp-4H]                          ; 070A _ FF. 45, FC
?_027:  cmp     dword [ebp-4H], 15                      ; 070D _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 0711 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0717 _ FF. 45, F8
?_028:  cmp     dword [ebp-8H], 15                      ; 071A _ 83. 7D, F8, 0F
        jle     ?_022                                   ; 071E _ 0F 8E, FFFFFF4B
        nop                                             ; 0724 _ 90
        nop                                             ; 0725 _ 90
        leave                                           ; 0726 _ C9
        ret                                             ; 0727 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0728 _ 55
        mov     ebp, esp                                ; 0729 _ 89. E5
        push    ebx                                     ; 072B _ 53
        sub     esp, 16                                 ; 072C _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 072F _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 0736 _ EB, 4D

?_029:  mov     dword [ebp-8H], 0                       ; 0738 _ C7. 45, F8, 00000000
        jmp     ?_031                                   ; 073F _ EB, 39

?_030:  mov     eax, dword [ebp-0CH]                    ; 0741 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0744 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0748 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 074A _ 8B. 45, F8
        add     eax, edx                                ; 074D _ 01. D0
        mov     edx, eax                                ; 074F _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0751 _ 8B. 45, 20
        add     eax, edx                                ; 0754 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0756 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0759 _ 8B. 55, F4
        add     edx, ecx                                ; 075C _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 075E _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0762 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0765 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0768 _ 01. D9
        add     edx, ecx                                ; 076A _ 01. CA
        mov     ecx, edx                                ; 076C _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 076E _ 8B. 55, 08
        add     edx, ecx                                ; 0771 _ 01. CA
        mov     al, byte [eax]                          ; 0773 _ 8A. 00
        mov     byte [edx], al                          ; 0775 _ 88. 02
        inc     dword [ebp-8H]                          ; 0777 _ FF. 45, F8
?_031:  mov     eax, dword [ebp-8H]                     ; 077A _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 077D _ 3B. 45, 10
        jl      ?_030                                   ; 0780 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0782 _ FF. 45, F4
?_032:  mov     eax, dword [ebp-0CH]                    ; 0785 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0788 _ 3B. 45, 14
        jl      ?_029                                   ; 078B _ 7C, AB
        nop                                             ; 078D _ 90
        nop                                             ; 078E _ 90
        add     esp, 16                                 ; 078F _ 83. C4, 10
        pop     ebx                                     ; 0792 _ 5B
        pop     ebp                                     ; 0793 _ 5D
        ret                                             ; 0794 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0795 _ 55
        mov     ebp, esp                                ; 0796 _ 89. E5
        sub     esp, 24                                 ; 0798 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 079B _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 07A0 _ 89. 45, F4
        mov     eax, dword [?_042]                      ; 07A3 _ A1, 00000104(d)
        cwde                                            ; 07A8 _ 98
        mov     dword [ebp-10H], eax                    ; 07A9 _ 89. 45, F0
        mov     ax, word [?_043]                        ; 07AC _ 66: A1, 00000106(d)
        cwde                                            ; 07B2 _ 98
        mov     dword [ebp-14H], eax                    ; 07B3 _ 89. 45, EC
        sub     esp, 8                                  ; 07B6 _ 83. EC, 08
        push    33                                      ; 07B9 _ 6A, 21
        push    32                                      ; 07BB _ 6A, 20
        call    io_out8                                 ; 07BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07C2 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 07C5 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 07C9 _ 83. EC, 0C
        push    96                                      ; 07CC _ 6A, 60
        call    io_in8                                  ; 07CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D3 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 07D6 _ 88. 45, EB
        mov     eax, dword [?_046]                      ; 07D9 _ A1, 00000148(d)
        cmp     eax, 31                                 ; 07DE _ 83. F8, 1F
        jg      ?_034                                   ; 07E1 _ 7F, 32
        mov     eax, dword [?_045]                      ; 07E3 _ A1, 00000144(d)
        mov     dl, byte [ebp-15H]                      ; 07E8 _ 8A. 55, EB
        mov     byte [keybuf+eax], dl                   ; 07EB _ 88. 90, 00000120(d)
        mov     eax, dword [?_046]                      ; 07F1 _ A1, 00000148(d)
        inc     eax                                     ; 07F6 _ 40
        mov     dword [?_046], eax                      ; 07F7 _ A3, 00000148(d)
        mov     eax, dword [?_045]                      ; 07FC _ A1, 00000144(d)
        inc     eax                                     ; 0801 _ 40
        and     eax, 8000001FH                          ; 0802 _ 25, 8000001F
        test    eax, eax                                ; 0807 _ 85. C0
        jns     ?_033                                   ; 0809 _ 79, 05
        dec     eax                                     ; 080B _ 48
        or      eax, 0FFFFFFE0H                         ; 080C _ 83. C8, E0
        inc     eax                                     ; 080F _ 40
?_033:  mov     dword [?_045], eax                      ; 0810 _ A3, 00000144(d)
?_034:  nop                                             ; 0815 _ 90
        leave                                           ; 0816 _ C9
        ret                                             ; 0817 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0818 _ 55
        mov     ebp, esp                                ; 0819 _ 89. E5
        sub     esp, 4                                  ; 081B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 081E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0821 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0824 _ 80. 7D, FC, 09
        jle     ?_035                                   ; 0828 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 082A _ 8A. 45, FC
        add     eax, 55                                 ; 082D _ 83. C0, 37
        jmp     ?_036                                   ; 0830 _ EB, 06

?_035:  mov     al, byte [ebp-4H]                       ; 0832 _ 8A. 45, FC
        add     eax, 48                                 ; 0835 _ 83. C0, 30
?_036:  leave                                           ; 0838 _ C9
        ret                                             ; 0839 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 083A _ 55
        mov     ebp, esp                                ; 083B _ 89. E5
        sub     esp, 20                                 ; 083D _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0840 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0843 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0846 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 084D _ 8A. 45, EC
        and     eax, 0FH                                ; 0850 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0853 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0856 _ 0F BE. 45, FB
        push    eax                                     ; 085A _ 50
        call    charToHexVal                            ; 085B _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0860 _ 83. C4, 04
        mov     byte [?_041], al                        ; 0863 _ A2, 00000013(d)
        mov     al, byte [ebp-14H]                      ; 0868 _ 8A. 45, EC
        shr     al, 4                                   ; 086B _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 086E _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0871 _ 8A. 45, EC
        movsx   eax, al                                 ; 0874 _ 0F BE. C0
        push    eax                                     ; 0877 _ 50
        call    charToHexVal                            ; 0878 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 087D _ 83. C4, 04
        mov     byte [?_040], al                        ; 0880 _ A2, 00000012(d)
        mov     eax, keyval                             ; 0885 _ B8, 00000010(d)
        leave                                           ; 088A _ C9
        ret                                             ; 088B _ C3
; charToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 088C _ 55
        mov     ebp, esp                                ; 088D _ 89. E5
        sub     esp, 8                                  ; 088F _ 83. EC, 08
?_037:  sub     esp, 12                                 ; 0892 _ 83. EC, 0C
        push    100                                     ; 0895 _ 6A, 64
        call    io_in8                                  ; 0897 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 089C _ 83. C4, 10
        and     eax, 02H                                ; 089F _ 83. E0, 02
        test    eax, eax                                ; 08A2 _ 85. C0
        jz      ?_038                                   ; 08A4 _ 74, 02
        jmp     ?_037                                   ; 08A6 _ EB, EA

?_038:  nop                                             ; 08A8 _ 90
        nop                                             ; 08A9 _ 90
        leave                                           ; 08AA _ C9
        ret                                             ; 08AB _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 08AC _ 55
        mov     ebp, esp                                ; 08AD _ 89. E5
        sub     esp, 8                                  ; 08AF _ 83. EC, 08
        call    wait_KBC_sendready                      ; 08B2 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08B7 _ 83. EC, 08
        push    96                                      ; 08BA _ 6A, 60
        push    100                                     ; 08BC _ 6A, 64
        call    io_out8                                 ; 08BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08C3 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 08C6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08CB _ 83. EC, 08
        push    71                                      ; 08CE _ 6A, 47
        push    96                                      ; 08D0 _ 6A, 60
        call    io_out8                                 ; 08D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D7 _ 83. C4, 10
        nop                                             ; 08DA _ 90
        leave                                           ; 08DB _ C9
        ret                                             ; 08DC _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 08DD _ 55
        mov     ebp, esp                                ; 08DE _ 89. E5
        sub     esp, 8                                  ; 08E0 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 08E3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08E8 _ 83. EC, 08
        push    212                                     ; 08EB _ 68, 000000D4
        push    100                                     ; 08F0 _ 6A, 64
        call    io_out8                                 ; 08F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08F7 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 08FA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08FF _ 83. EC, 08
        push    244                                     ; 0902 _ 68, 000000F4
        push    96                                      ; 0907 _ 6A, 60
        call    io_out8                                 ; 0909 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 090E _ 83. C4, 10
        nop                                             ; 0911 _ 90
        leave                                           ; 0912 _ C9
        ret                                             ; 0913 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0914 _ 55
        mov     ebp, esp                                ; 0915 _ 89. E5
        sub     esp, 24                                 ; 0917 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 091A _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 091F _ 89. 45, F4
        mov     eax, dword [?_042]                      ; 0922 _ A1, 00000104(d)
        cwde                                            ; 0927 _ 98
        mov     dword [ebp-10H], eax                    ; 0928 _ 89. 45, F0
        mov     ax, word [?_043]                        ; 092B _ 66: A1, 00000106(d)
        cwde                                            ; 0931 _ 98
        mov     dword [ebp-14H], eax                    ; 0932 _ 89. 45, EC
        sub     esp, 8                                  ; 0935 _ 83. EC, 08
        push    ?_047                                   ; 0938 _ 68, 00000000(d)
        push    7                                       ; 093D _ 6A, 07
        push    0                                       ; 093F _ 6A, 00
        push    0                                       ; 0941 _ 6A, 00
        push    dword [ebp-10H]                         ; 0943 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0946 _ FF. 75, F4
        call    showString                              ; 0949 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 094E _ 83. C4, 20
?_039:  call    io_hlt                                  ; 0951 _ E8, FFFFFFFC(rel)
        jmp     ?_039                                   ; 0956 _ EB, F9
; intHandlerForMouse End of function

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_040:  db 00H                                          ; 0012 _ .

?_041:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1605:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1652:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0060 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0068 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0070 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0078 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0080 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 00E0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 00F0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0100 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0108 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0110 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0118 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0128 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0138 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0148 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0158 _ .....***


mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_042:                                                  ; dword
        resb    2                                       ; 0104

?_043:  resw    13                                      ; 0106

keybuf:                                                 ; byte
        resb    32                                      ; 0120

?_044:  resd    1                                       ; 0140

?_045:  resd    1                                       ; 0144

?_046:  resd    1                                       ; 0148

showPos.1586:                                           ; dword
        resd    1                                       ; 014C

?_047:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4DH, 6FH, 75H       ; 0000 _ PS/2 Mou
        db 73H, 65H, 20H, 48H, 61H, 6EH, 64H, 6CH       ; 0008 _ se Handl
        db 65H, 72H, 00H                                ; 0010 _ er.


