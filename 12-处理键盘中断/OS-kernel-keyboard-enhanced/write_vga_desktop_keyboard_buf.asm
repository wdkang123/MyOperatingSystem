; Disassembly of file: write_vga_desktop_keyboard_buf.o
; Fri Jan 29 12:37:35 2021
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
        mov     eax, dword [?_039]                      ; 001F _ A1, 00000104(d)
        cwde                                            ; 0024 _ 98
        mov     dword [ebp-10H], eax                    ; 0025 _ 89. 45, F0
        mov     ax, word [?_040]                        ; 0028 _ 66: A1, 00000106(d)
        cwde                                            ; 002E _ 98
        mov     dword [ebp-14H], eax                    ; 002F _ 89. 45, EC
        call    init_palette                            ; 0032 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0037 _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 003A _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 003D _ 8B. 45, F0
        dec     eax                                     ; 0040 _ 48
        sub     esp, 4                                  ; 0041 _ 83. EC, 04
        push    edx                                     ; 0044 _ 52
        push    eax                                     ; 0045 _ 50
        push    0                                       ; 0046 _ 6A, 00
        push    0                                       ; 0048 _ 6A, 00
        push    14                                      ; 004A _ 6A, 0E
        push    dword [ebp-10H]                         ; 004C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 004F _ FF. 75, F4
        call    boxfill8                                ; 0052 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0057 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 005A _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 005D _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 0060 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0063 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0066 _ 8B. 45, EC
        sub     eax, 28                                 ; 0069 _ 83. E8, 1C
        sub     esp, 4                                  ; 006C _ 83. EC, 04
        push    ecx                                     ; 006F _ 51
        push    edx                                     ; 0070 _ 52
        push    eax                                     ; 0071 _ 50
        push    0                                       ; 0072 _ 6A, 00
        push    8                                       ; 0074 _ 6A, 08
        push    dword [ebp-10H]                         ; 0076 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0079 _ FF. 75, F4
        call    boxfill8                                ; 007C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0081 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0084 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 0087 _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 008A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 008D _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0090 _ 8B. 45, EC
        sub     eax, 27                                 ; 0093 _ 83. E8, 1B
        sub     esp, 4                                  ; 0096 _ 83. EC, 04
        push    ecx                                     ; 0099 _ 51
        push    edx                                     ; 009A _ 52
        push    eax                                     ; 009B _ 50
        push    0                                       ; 009C _ 6A, 00
        push    7                                       ; 009E _ 6A, 07
        push    dword [ebp-10H]                         ; 00A0 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00A3 _ FF. 75, F4
        call    boxfill8                                ; 00A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00AB _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00AE _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00B1 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00B4 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00B7 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00BA _ 8B. 45, EC
        sub     eax, 26                                 ; 00BD _ 83. E8, 1A
        sub     esp, 4                                  ; 00C0 _ 83. EC, 04
        push    ecx                                     ; 00C3 _ 51
        push    edx                                     ; 00C4 _ 52
        push    eax                                     ; 00C5 _ 50
        push    0                                       ; 00C6 _ 6A, 00
        push    8                                       ; 00C8 _ 6A, 08
        push    dword [ebp-10H]                         ; 00CA _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00CD _ FF. 75, F4
        call    boxfill8                                ; 00D0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00D5 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00D8 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 00DB _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 00DE _ 8B. 45, EC
        sub     eax, 24                                 ; 00E1 _ 83. E8, 18
        sub     esp, 4                                  ; 00E4 _ 83. EC, 04
        push    edx                                     ; 00E7 _ 52
        push    59                                      ; 00E8 _ 6A, 3B
        push    eax                                     ; 00EA _ 50
        push    3                                       ; 00EB _ 6A, 03
        push    7                                       ; 00ED _ 6A, 07
        push    dword [ebp-10H]                         ; 00EF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00F2 _ FF. 75, F4
        call    boxfill8                                ; 00F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FA _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00FD _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0100 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0103 _ 8B. 45, EC
        sub     eax, 24                                 ; 0106 _ 83. E8, 18
        sub     esp, 4                                  ; 0109 _ 83. EC, 04
        push    edx                                     ; 010C _ 52
        push    2                                       ; 010D _ 6A, 02
        push    eax                                     ; 010F _ 50
        push    2                                       ; 0110 _ 6A, 02
        push    7                                       ; 0112 _ 6A, 07
        push    dword [ebp-10H]                         ; 0114 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0117 _ FF. 75, F4
        call    boxfill8                                ; 011A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 011F _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0122 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0125 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0128 _ 8B. 45, EC
        sub     eax, 4                                  ; 012B _ 83. E8, 04
        sub     esp, 4                                  ; 012E _ 83. EC, 04
        push    edx                                     ; 0131 _ 52
        push    59                                      ; 0132 _ 6A, 3B
        push    eax                                     ; 0134 _ 50
        push    3                                       ; 0135 _ 6A, 03
        push    15                                      ; 0137 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0139 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 013C _ FF. 75, F4
        call    boxfill8                                ; 013F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0144 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0147 _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 014A _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 014D _ 8B. 45, EC
        sub     eax, 23                                 ; 0150 _ 83. E8, 17
        sub     esp, 4                                  ; 0153 _ 83. EC, 04
        push    edx                                     ; 0156 _ 52
        push    59                                      ; 0157 _ 6A, 3B
        push    eax                                     ; 0159 _ 50
        push    59                                      ; 015A _ 6A, 3B
        push    15                                      ; 015C _ 6A, 0F
        push    dword [ebp-10H]                         ; 015E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0161 _ FF. 75, F4
        call    boxfill8                                ; 0164 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0169 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 016C _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 016F _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0172 _ 8B. 45, EC
        sub     eax, 3                                  ; 0175 _ 83. E8, 03
        sub     esp, 4                                  ; 0178 _ 83. EC, 04
        push    edx                                     ; 017B _ 52
        push    59                                      ; 017C _ 6A, 3B
        push    eax                                     ; 017E _ 50
        push    2                                       ; 017F _ 6A, 02
        push    0                                       ; 0181 _ 6A, 00
        push    dword [ebp-10H]                         ; 0183 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0186 _ FF. 75, F4
        call    boxfill8                                ; 0189 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 018E _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0191 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0194 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0197 _ 8B. 45, EC
        sub     eax, 24                                 ; 019A _ 83. E8, 18
        sub     esp, 4                                  ; 019D _ 83. EC, 04
        push    edx                                     ; 01A0 _ 52
        push    60                                      ; 01A1 _ 6A, 3C
        push    eax                                     ; 01A3 _ 50
        push    60                                      ; 01A4 _ 6A, 3C
        push    0                                       ; 01A6 _ 6A, 00
        push    dword [ebp-10H]                         ; 01A8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01AB _ FF. 75, F4
        call    boxfill8                                ; 01AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B3 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01B6 _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01B9 _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 01BC _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01BF _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01C2 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01C5 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01C8 _ 8B. 45, F0
        sub     eax, 47                                 ; 01CB _ 83. E8, 2F
        sub     esp, 4                                  ; 01CE _ 83. EC, 04
        push    ebx                                     ; 01D1 _ 53
        push    ecx                                     ; 01D2 _ 51
        push    edx                                     ; 01D3 _ 52
        push    eax                                     ; 01D4 _ 50
        push    15                                      ; 01D5 _ 6A, 0F
        push    dword [ebp-10H]                         ; 01D7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01DA _ FF. 75, F4
        call    boxfill8                                ; 01DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E2 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01E5 _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 01E8 _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 01EB _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 01EE _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 01F1 _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 01F4 _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 01F7 _ 8B. 45, F0
        sub     eax, 47                                 ; 01FA _ 83. E8, 2F
        sub     esp, 4                                  ; 01FD _ 83. EC, 04
        push    ebx                                     ; 0200 _ 53
        push    ecx                                     ; 0201 _ 51
        push    edx                                     ; 0202 _ 52
        push    eax                                     ; 0203 _ 50
        push    15                                      ; 0204 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0206 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0209 _ FF. 75, F4
        call    boxfill8                                ; 020C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0211 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0214 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0217 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 021A _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 021D _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 0220 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0223 _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 0226 _ 8B. 45, F0
        sub     eax, 47                                 ; 0229 _ 83. E8, 2F
        sub     esp, 4                                  ; 022C _ 83. EC, 04
        push    ebx                                     ; 022F _ 53
        push    ecx                                     ; 0230 _ 51
        push    edx                                     ; 0231 _ 52
        push    eax                                     ; 0232 _ 50
        push    7                                       ; 0233 _ 6A, 07
        push    dword [ebp-10H]                         ; 0235 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0238 _ FF. 75, F4
        call    boxfill8                                ; 023B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0240 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0243 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0246 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 0249 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 024C _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 024F _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0252 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 0255 _ 8B. 45, F0
        sub     eax, 3                                  ; 0258 _ 83. E8, 03
        sub     esp, 4                                  ; 025B _ 83. EC, 04
        push    ebx                                     ; 025E _ 53
        push    ecx                                     ; 025F _ 51
        push    edx                                     ; 0260 _ 52
        push    eax                                     ; 0261 _ 50
        push    7                                       ; 0262 _ 6A, 07
        push    dword [ebp-10H]                         ; 0264 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0267 _ FF. 75, F4
        call    boxfill8                                ; 026A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 026F _ 83. C4, 20
        sub     esp, 8                                  ; 0272 _ 83. EC, 08
        push    14                                      ; 0275 _ 6A, 0E
        push    mcursor                                 ; 0277 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 027C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0281 _ 83. C4, 10
        push    16                                      ; 0284 _ 6A, 10
        push    mcursor                                 ; 0286 _ 68, 00000000(d)
        push    80                                      ; 028B _ 6A, 50
        push    80                                      ; 028D _ 6A, 50
        push    16                                      ; 028F _ 6A, 10
        push    16                                      ; 0291 _ 6A, 10
        push    dword [ebp-10H]                         ; 0293 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0296 _ FF. 75, F4
        call    putblock                                ; 0299 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 029E _ 83. C4, 20
        call    io_sti                                  ; 02A1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 02A6 _ C7. 45, E8, 00000000
?_001:  call    io_cli                                  ; 02AD _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_043]                      ; 02B2 _ A1, 00000148(d)
        test    eax, eax                                ; 02B7 _ 85. C0
        jnz     ?_002                                   ; 02B9 _ 75, 07
        call    io_stihlt                               ; 02BB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02C0 _ EB, EB

?_002:  mov     eax, dword [?_041]                      ; 02C2 _ A1, 00000140(d)
        mov     al, byte [keybuf+eax]                   ; 02C7 _ 8A. 80, 00000120(d)
        movzx   eax, al                                 ; 02CD _ 0F B6. C0
        mov     dword [ebp-18H], eax                    ; 02D0 _ 89. 45, E8
        mov     eax, dword [?_041]                      ; 02D3 _ A1, 00000140(d)
        inc     eax                                     ; 02D8 _ 40
        and     eax, 8000001FH                          ; 02D9 _ 25, 8000001F
        test    eax, eax                                ; 02DE _ 85. C0
        jns     ?_003                                   ; 02E0 _ 79, 05
        dec     eax                                     ; 02E2 _ 48
        or      eax, 0FFFFFFE0H                         ; 02E3 _ 83. C8, E0
        inc     eax                                     ; 02E6 _ 40
?_003:  mov     dword [?_041], eax                      ; 02E7 _ A3, 00000140(d)
        call    io_sti                                  ; 02EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_043]                      ; 02F1 _ A1, 00000148(d)
        dec     eax                                     ; 02F6 _ 48
        mov     dword [?_043], eax                      ; 02F7 _ A3, 00000148(d)
        mov     eax, dword [ebp-18H]                    ; 02FC _ 8B. 45, E8
        movzx   eax, al                                 ; 02FF _ 0F B6. C0
        sub     esp, 12                                 ; 0302 _ 83. EC, 0C
        push    eax                                     ; 0305 _ 50
        call    charToHexStr                            ; 0306 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030B _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 030E _ 89. 45, E4
        mov     eax, dword [showPos.1582]               ; 0311 _ A1, 0000014C(d)
        sub     esp, 8                                  ; 0316 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0319 _ FF. 75, E4
        push    7                                       ; 031C _ 6A, 07
        push    0                                       ; 031E _ 6A, 00
        push    eax                                     ; 0320 _ 50
        push    dword [ebp-10H]                         ; 0321 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0324 _ FF. 75, F4
        call    showString                              ; 0327 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 032C _ 83. C4, 20
        mov     eax, dword [showPos.1582]               ; 032F _ A1, 0000014C(d)
        add     eax, 32                                 ; 0334 _ 83. C0, 20
        mov     dword [showPos.1582], eax               ; 0337 _ A3, 0000014C(d)
        jmp     ?_001                                   ; 033C _ E9, FFFFFF6C
; CMain End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0341 _ 55
        mov     ebp, esp                                ; 0342 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0344 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0347 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 034D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0350 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0356 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0359 _ 66: C7. 40, 06, 00C8
        nop                                             ; 035F _ 90
        pop     ebp                                     ; 0360 _ 5D
        ret                                             ; 0361 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0362 _ 55
        mov     ebp, esp                                ; 0363 _ 89. E5
        sub     esp, 24                                 ; 0365 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0368 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 036B _ 88. 45, F4
        jmp     ?_005                                   ; 036E _ EB, 35

?_004:  mov     eax, dword [ebp+1CH]                    ; 0370 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0373 _ 8A. 00
        movzx   eax, al                                 ; 0375 _ 0F B6. C0
        shl     eax, 4                                  ; 0378 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 037B _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0381 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0385 _ 83. EC, 08
        push    edx                                     ; 0388 _ 52
        push    eax                                     ; 0389 _ 50
        push    dword [ebp+14H]                         ; 038A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 038D _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0390 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0393 _ FF. 75, 08
        call    showFont8                               ; 0396 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 039B _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 039E _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 03A2 _ FF. 45, 1C
?_005:  mov     eax, dword [ebp+1CH]                    ; 03A5 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 03A8 _ 8A. 00
        test    al, al                                  ; 03AA _ 84. C0
        jnz     ?_004                                   ; 03AC _ 75, C2
        nop                                             ; 03AE _ 90
        nop                                             ; 03AF _ 90
        leave                                           ; 03B0 _ C9
        ret                                             ; 03B1 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 03B2 _ 55
        mov     ebp, esp                                ; 03B3 _ 89. E5
        sub     esp, 8                                  ; 03B5 _ 83. EC, 08
        sub     esp, 4                                  ; 03B8 _ 83. EC, 04
        push    table_rgb.1601                          ; 03BB _ 68, 00000020(d)
        push    15                                      ; 03C0 _ 6A, 0F
        push    0                                       ; 03C2 _ 6A, 00
        call    set_palette                             ; 03C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C9 _ 83. C4, 10
        nop                                             ; 03CC _ 90
        leave                                           ; 03CD _ C9
        ret                                             ; 03CE _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03CF _ 55
        mov     ebp, esp                                ; 03D0 _ 89. E5
        sub     esp, 24                                 ; 03D2 _ 83. EC, 18
        call    io_load_eflags                          ; 03D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 03DA _ 89. 45, F0
        call    io_cli                                  ; 03DD _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03E2 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03E5 _ FF. 75, 08
        push    968                                     ; 03E8 _ 68, 000003C8
        call    io_out8                                 ; 03ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F2 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03F5 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 03F8 _ 89. 45, F4
        jmp     ?_007                                   ; 03FB _ EB, 5F

?_006:  mov     eax, dword [ebp+10H]                    ; 03FD _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0400 _ 8A. 00
        shr     al, 2                                   ; 0402 _ C0. E8, 02
        movzx   eax, al                                 ; 0405 _ 0F B6. C0
        sub     esp, 8                                  ; 0408 _ 83. EC, 08
        push    eax                                     ; 040B _ 50
        push    969                                     ; 040C _ 68, 000003C9
        call    io_out8                                 ; 0411 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0416 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0419 _ 8B. 45, 10
        inc     eax                                     ; 041C _ 40
        mov     al, byte [eax]                          ; 041D _ 8A. 00
        shr     al, 2                                   ; 041F _ C0. E8, 02
        movzx   eax, al                                 ; 0422 _ 0F B6. C0
        sub     esp, 8                                  ; 0425 _ 83. EC, 08
        push    eax                                     ; 0428 _ 50
        push    969                                     ; 0429 _ 68, 000003C9
        call    io_out8                                 ; 042E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0433 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0436 _ 8B. 45, 10
        add     eax, 2                                  ; 0439 _ 83. C0, 02
        mov     al, byte [eax]                          ; 043C _ 8A. 00
        shr     al, 2                                   ; 043E _ C0. E8, 02
        movzx   eax, al                                 ; 0441 _ 0F B6. C0
        sub     esp, 8                                  ; 0444 _ 83. EC, 08
        push    eax                                     ; 0447 _ 50
        push    969                                     ; 0448 _ 68, 000003C9
        call    io_out8                                 ; 044D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0452 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0455 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0459 _ FF. 45, F4
?_007:  mov     eax, dword [ebp-0CH]                    ; 045C _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 045F _ 3B. 45, 0C
        jle     ?_006                                   ; 0462 _ 7E, 99
        sub     esp, 12                                 ; 0464 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0467 _ FF. 75, F0
        call    io_store_eflags                         ; 046A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 046F _ 83. C4, 10
        nop                                             ; 0472 _ 90
        leave                                           ; 0473 _ C9
        ret                                             ; 0474 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0475 _ 55
        mov     ebp, esp                                ; 0476 _ 89. E5
        sub     esp, 20                                 ; 0478 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 047B _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 047E _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0481 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0484 _ 89. 45, F8
        jmp     ?_011                                   ; 0487 _ EB, 30

?_008:  mov     eax, dword [ebp+14H]                    ; 0489 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 048C _ 89. 45, FC
        jmp     ?_010                                   ; 048F _ EB, 1D

?_009:  mov     eax, dword [ebp-8H]                     ; 0491 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0494 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0498 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 049A _ 8B. 45, FC
        add     eax, edx                                ; 049D _ 01. D0
        mov     edx, eax                                ; 049F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04A1 _ 8B. 45, 08
        add     edx, eax                                ; 04A4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 04A6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 04A9 _ 88. 02
        inc     dword [ebp-4H]                          ; 04AB _ FF. 45, FC
?_010:  mov     eax, dword [ebp-4H]                     ; 04AE _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 04B1 _ 3B. 45, 1C
        jle     ?_009                                   ; 04B4 _ 7E, DB
        inc     dword [ebp-8H]                          ; 04B6 _ FF. 45, F8
?_011:  mov     eax, dword [ebp-8H]                     ; 04B9 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 04BC _ 3B. 45, 20
        jle     ?_008                                   ; 04BF _ 7E, C8
        nop                                             ; 04C1 _ 90
        nop                                             ; 04C2 _ 90
        leave                                           ; 04C3 _ C9
        ret                                             ; 04C4 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 04C5 _ 55
        mov     ebp, esp                                ; 04C6 _ 89. E5
        sub     esp, 20                                 ; 04C8 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04CB _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04CE _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04D1 _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 04D8 _ E9, 00000162

?_012:  mov     edx, dword [ebp-4H]                     ; 04DD _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 04E0 _ 8B. 45, 1C
        add     eax, edx                                ; 04E3 _ 01. D0
        mov     al, byte [eax]                          ; 04E5 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 04E7 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 04EA _ 80. 7D, FB, 00
        jns     ?_013                                   ; 04EE _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 04F0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04F3 _ 8B. 45, FC
        add     eax, edx                                ; 04F6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04F8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04FC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 04FE _ 8B. 45, 10
        add     eax, edx                                ; 0501 _ 01. D0
        mov     edx, eax                                ; 0503 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0505 _ 8B. 45, 08
        add     edx, eax                                ; 0508 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 050A _ 8A. 45, EC
        mov     byte [edx], al                          ; 050D _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 050F _ 0F BE. 45, FB
        and     eax, 40H                                ; 0513 _ 83. E0, 40
        test    eax, eax                                ; 0516 _ 85. C0
        jz      ?_014                                   ; 0518 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 051A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 051D _ 8B. 45, FC
        add     eax, edx                                ; 0520 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0522 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0526 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0528 _ 8B. 45, 10
        add     eax, edx                                ; 052B _ 01. D0
        lea     edx, [eax+1H]                           ; 052D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0530 _ 8B. 45, 08
        add     edx, eax                                ; 0533 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0535 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0538 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 053A _ 0F BE. 45, FB
        and     eax, 20H                                ; 053E _ 83. E0, 20
        test    eax, eax                                ; 0541 _ 85. C0
        jz      ?_015                                   ; 0543 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0545 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0548 _ 8B. 45, FC
        add     eax, edx                                ; 054B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 054D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0551 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0553 _ 8B. 45, 10
        add     eax, edx                                ; 0556 _ 01. D0
        lea     edx, [eax+2H]                           ; 0558 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 055B _ 8B. 45, 08
        add     edx, eax                                ; 055E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0560 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0563 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0565 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0569 _ 83. E0, 10
        test    eax, eax                                ; 056C _ 85. C0
        jz      ?_016                                   ; 056E _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0570 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0573 _ 8B. 45, FC
        add     eax, edx                                ; 0576 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0578 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 057C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 057E _ 8B. 45, 10
        add     eax, edx                                ; 0581 _ 01. D0
        lea     edx, [eax+3H]                           ; 0583 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0586 _ 8B. 45, 08
        add     edx, eax                                ; 0589 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 058B _ 8A. 45, EC
        mov     byte [edx], al                          ; 058E _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0590 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0594 _ 83. E0, 08
        test    eax, eax                                ; 0597 _ 85. C0
        jz      ?_017                                   ; 0599 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 059B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 059E _ 8B. 45, FC
        add     eax, edx                                ; 05A1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05A3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05A7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05A9 _ 8B. 45, 10
        add     eax, edx                                ; 05AC _ 01. D0
        lea     edx, [eax+4H]                           ; 05AE _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05B1 _ 8B. 45, 08
        add     edx, eax                                ; 05B4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 05B6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 05B9 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 05BB _ 0F BE. 45, FB
        and     eax, 04H                                ; 05BF _ 83. E0, 04
        test    eax, eax                                ; 05C2 _ 85. C0
        jz      ?_018                                   ; 05C4 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 05C6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05C9 _ 8B. 45, FC
        add     eax, edx                                ; 05CC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05CE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05D2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05D4 _ 8B. 45, 10
        add     eax, edx                                ; 05D7 _ 01. D0
        lea     edx, [eax+5H]                           ; 05D9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 05DC _ 8B. 45, 08
        add     edx, eax                                ; 05DF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 05E1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 05E4 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 05E6 _ 0F BE. 45, FB
        and     eax, 02H                                ; 05EA _ 83. E0, 02
        test    eax, eax                                ; 05ED _ 85. C0
        jz      ?_019                                   ; 05EF _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 05F1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05F4 _ 8B. 45, FC
        add     eax, edx                                ; 05F7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05F9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05FD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05FF _ 8B. 45, 10
        add     eax, edx                                ; 0602 _ 01. D0
        lea     edx, [eax+6H]                           ; 0604 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0607 _ 8B. 45, 08
        add     edx, eax                                ; 060A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 060C _ 8A. 45, EC
        mov     byte [edx], al                          ; 060F _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0611 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0615 _ 83. E0, 01
        test    eax, eax                                ; 0618 _ 85. C0
        jz      ?_020                                   ; 061A _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 061C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 061F _ 8B. 45, FC
        add     eax, edx                                ; 0622 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0624 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0628 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 062A _ 8B. 45, 10
        add     eax, edx                                ; 062D _ 01. D0
        lea     edx, [eax+7H]                           ; 062F _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0632 _ 8B. 45, 08
        add     edx, eax                                ; 0635 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0637 _ 8A. 45, EC
        mov     byte [edx], al                          ; 063A _ 88. 02
?_020:  inc     dword [ebp-4H]                          ; 063C _ FF. 45, FC
?_021:  cmp     dword [ebp-4H], 15                      ; 063F _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 0643 _ 0F 8E, FFFFFE94
        nop                                             ; 0649 _ 90
        nop                                             ; 064A _ 90
        leave                                           ; 064B _ C9
        ret                                             ; 064C _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 064D _ 55
        mov     ebp, esp                                ; 064E _ 89. E5
        sub     esp, 20                                 ; 0650 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0653 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0656 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0659 _ C7. 45, F8, 00000000
        jmp     ?_028                                   ; 0660 _ E9, 000000AB

?_022:  mov     dword [ebp-4H], 0                       ; 0665 _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 066C _ E9, 00000092

?_023:  mov     eax, dword [ebp-8H]                     ; 0671 _ 8B. 45, F8
        shl     eax, 4                                  ; 0674 _ C1. E0, 04
        mov     edx, eax                                ; 0677 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0679 _ 8B. 45, FC
        add     eax, edx                                ; 067C _ 01. D0
        add     eax, cursor.1648                        ; 067E _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0683 _ 8A. 00
        cmp     al, 42                                  ; 0685 _ 3C, 2A
        jnz     ?_024                                   ; 0687 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0689 _ 8B. 45, F8
        shl     eax, 4                                  ; 068C _ C1. E0, 04
        mov     edx, eax                                ; 068F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0691 _ 8B. 45, FC
        add     eax, edx                                ; 0694 _ 01. D0
        mov     edx, eax                                ; 0696 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0698 _ 8B. 45, 08
        add     eax, edx                                ; 069B _ 01. D0
        mov     byte [eax], 0                           ; 069D _ C6. 00, 00
?_024:  mov     eax, dword [ebp-8H]                     ; 06A0 _ 8B. 45, F8
        shl     eax, 4                                  ; 06A3 _ C1. E0, 04
        mov     edx, eax                                ; 06A6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06A8 _ 8B. 45, FC
        add     eax, edx                                ; 06AB _ 01. D0
        add     eax, cursor.1648                        ; 06AD _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 06B2 _ 8A. 00
        cmp     al, 79                                  ; 06B4 _ 3C, 4F
        jnz     ?_025                                   ; 06B6 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 06B8 _ 8B. 45, F8
        shl     eax, 4                                  ; 06BB _ C1. E0, 04
        mov     edx, eax                                ; 06BE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06C0 _ 8B. 45, FC
        add     eax, edx                                ; 06C3 _ 01. D0
        mov     edx, eax                                ; 06C5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06C7 _ 8B. 45, 08
        add     eax, edx                                ; 06CA _ 01. D0
        mov     byte [eax], 7                           ; 06CC _ C6. 00, 07
?_025:  mov     eax, dword [ebp-8H]                     ; 06CF _ 8B. 45, F8
        shl     eax, 4                                  ; 06D2 _ C1. E0, 04
        mov     edx, eax                                ; 06D5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06D7 _ 8B. 45, FC
        add     eax, edx                                ; 06DA _ 01. D0
        add     eax, cursor.1648                        ; 06DC _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 06E1 _ 8A. 00
        cmp     al, 46                                  ; 06E3 _ 3C, 2E
        jnz     ?_026                                   ; 06E5 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 06E7 _ 8B. 45, F8
        shl     eax, 4                                  ; 06EA _ C1. E0, 04
        mov     edx, eax                                ; 06ED _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 06EF _ 8B. 45, FC
        add     eax, edx                                ; 06F2 _ 01. D0
        mov     edx, eax                                ; 06F4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06F6 _ 8B. 45, 08
        add     edx, eax                                ; 06F9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 06FB _ 8A. 45, EC
        mov     byte [edx], al                          ; 06FE _ 88. 02
?_026:  inc     dword [ebp-4H]                          ; 0700 _ FF. 45, FC
?_027:  cmp     dword [ebp-4H], 15                      ; 0703 _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 0707 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 070D _ FF. 45, F8
?_028:  cmp     dword [ebp-8H], 15                      ; 0710 _ 83. 7D, F8, 0F
        jle     ?_022                                   ; 0714 _ 0F 8E, FFFFFF4B
        nop                                             ; 071A _ 90
        nop                                             ; 071B _ 90
        leave                                           ; 071C _ C9
        ret                                             ; 071D _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 071E _ 55
        mov     ebp, esp                                ; 071F _ 89. E5
        push    ebx                                     ; 0721 _ 53
        sub     esp, 16                                 ; 0722 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0725 _ C7. 45, F4, 00000000
        jmp     ?_032                                   ; 072C _ EB, 4D

?_029:  mov     dword [ebp-8H], 0                       ; 072E _ C7. 45, F8, 00000000
        jmp     ?_031                                   ; 0735 _ EB, 39

?_030:  mov     eax, dword [ebp-0CH]                    ; 0737 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 073A _ 0F AF. 45, 24
        mov     edx, eax                                ; 073E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0740 _ 8B. 45, F8
        add     eax, edx                                ; 0743 _ 01. D0
        mov     edx, eax                                ; 0745 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0747 _ 8B. 45, 20
        add     eax, edx                                ; 074A _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 074C _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 074F _ 8B. 55, F4
        add     edx, ecx                                ; 0752 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0754 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0758 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 075B _ 8B. 4D, F8
        add     ecx, ebx                                ; 075E _ 01. D9
        add     edx, ecx                                ; 0760 _ 01. CA
        mov     ecx, edx                                ; 0762 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0764 _ 8B. 55, 08
        add     edx, ecx                                ; 0767 _ 01. CA
        mov     al, byte [eax]                          ; 0769 _ 8A. 00
        mov     byte [edx], al                          ; 076B _ 88. 02
        inc     dword [ebp-8H]                          ; 076D _ FF. 45, F8
?_031:  mov     eax, dword [ebp-8H]                     ; 0770 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0773 _ 3B. 45, 10
        jl      ?_030                                   ; 0776 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0778 _ FF. 45, F4
?_032:  mov     eax, dword [ebp-0CH]                    ; 077B _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 077E _ 3B. 45, 14
        jl      ?_029                                   ; 0781 _ 7C, AB
        nop                                             ; 0783 _ 90
        nop                                             ; 0784 _ 90
        add     esp, 16                                 ; 0785 _ 83. C4, 10
        pop     ebx                                     ; 0788 _ 5B
        pop     ebp                                     ; 0789 _ 5D
        ret                                             ; 078A _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 078B _ 55
        mov     ebp, esp                                ; 078C _ 89. E5
        sub     esp, 24                                 ; 078E _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0791 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0796 _ 89. 45, F4
        mov     eax, dword [?_039]                      ; 0799 _ A1, 00000104(d)
        cwde                                            ; 079E _ 98
        mov     dword [ebp-10H], eax                    ; 079F _ 89. 45, F0
        mov     ax, word [?_040]                        ; 07A2 _ 66: A1, 00000106(d)
        cwde                                            ; 07A8 _ 98
        mov     dword [ebp-14H], eax                    ; 07A9 _ 89. 45, EC
        sub     esp, 8                                  ; 07AC _ 83. EC, 08
        push    33                                      ; 07AF _ 6A, 21
        push    32                                      ; 07B1 _ 6A, 20
        call    io_out8                                 ; 07B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07B8 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 07BB _ C6. 45, EB, 00
        sub     esp, 12                                 ; 07BF _ 83. EC, 0C
        push    96                                      ; 07C2 _ 6A, 60
        call    io_in8                                  ; 07C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07C9 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 07CC _ 88. 45, EB
        mov     eax, dword [?_043]                      ; 07CF _ A1, 00000148(d)
        cmp     eax, 31                                 ; 07D4 _ 83. F8, 1F
        jg      ?_034                                   ; 07D7 _ 7F, 32
        mov     eax, dword [?_042]                      ; 07D9 _ A1, 00000144(d)
        mov     dl, byte [ebp-15H]                      ; 07DE _ 8A. 55, EB
        mov     byte [keybuf+eax], dl                   ; 07E1 _ 88. 90, 00000120(d)
        mov     eax, dword [?_043]                      ; 07E7 _ A1, 00000148(d)
        inc     eax                                     ; 07EC _ 40
        mov     dword [?_043], eax                      ; 07ED _ A3, 00000148(d)
        mov     eax, dword [?_042]                      ; 07F2 _ A1, 00000144(d)
        inc     eax                                     ; 07F7 _ 40
        and     eax, 8000001FH                          ; 07F8 _ 25, 8000001F
        test    eax, eax                                ; 07FD _ 85. C0
        jns     ?_033                                   ; 07FF _ 79, 05
        dec     eax                                     ; 0801 _ 48
        or      eax, 0FFFFFFE0H                         ; 0802 _ 83. C8, E0
        inc     eax                                     ; 0805 _ 40
?_033:  mov     dword [?_042], eax                      ; 0806 _ A3, 00000144(d)
?_034:  nop                                             ; 080B _ 90
        leave                                           ; 080C _ C9
        ret                                             ; 080D _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 080E _ 55
        mov     ebp, esp                                ; 080F _ 89. E5
        sub     esp, 4                                  ; 0811 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0814 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0817 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 081A _ 80. 7D, FC, 09
        jle     ?_035                                   ; 081E _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0820 _ 8A. 45, FC
        add     eax, 55                                 ; 0823 _ 83. C0, 37
        jmp     ?_036                                   ; 0826 _ EB, 06

?_035:  mov     al, byte [ebp-4H]                       ; 0828 _ 8A. 45, FC
        add     eax, 48                                 ; 082B _ 83. C0, 30
?_036:  leave                                           ; 082E _ C9
        ret                                             ; 082F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0830 _ 55
        mov     ebp, esp                                ; 0831 _ 89. E5
        sub     esp, 20                                 ; 0833 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0836 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0839 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 083C _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0843 _ 8A. 45, EC
        and     eax, 0FH                                ; 0846 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0849 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 084C _ 0F BE. 45, FB
        push    eax                                     ; 0850 _ 50
        call    charToHexVal                            ; 0851 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0856 _ 83. C4, 04
        mov     byte [?_038], al                        ; 0859 _ A2, 00000013(d)
        mov     al, byte [ebp-14H]                      ; 085E _ 8A. 45, EC
        shr     al, 4                                   ; 0861 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0864 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0867 _ 8A. 45, EC
        movsx   eax, al                                 ; 086A _ 0F BE. C0
        push    eax                                     ; 086D _ 50
        call    charToHexVal                            ; 086E _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0873 _ 83. C4, 04
        mov     byte [?_037], al                        ; 0876 _ A2, 00000012(d)
        mov     eax, keyval                             ; 087B _ B8, 00000010(d)
        leave                                           ; 0880 _ C9
        ret                                             ; 0881 _ C3
; charToHexStr End of function


fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_037:  db 00H                                          ; 0012 _ .

?_038:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1601:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1648:                                            ; byte
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

?_039:                                                  ; dword
        resb    2                                       ; 0104

?_040:  resw    13                                      ; 0106

keybuf:                                                 ; byte
        resb    32                                      ; 0120

?_041:  resd    1                                       ; 0140

?_042:  resd    1                                       ; 0144

?_043:  resd    1                                       ; 0148

showPos.1582:                                           ; dword
        resd    1                                       ; 014C


