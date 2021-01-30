; Disassembly of file: write_vga_desktop.o
; Fri Jan 29 14:11:59 2021
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
        mov     eax, dword [?_046]                      ; 001F _ A1, 00000104(d)
        cwde                                            ; 0024 _ 98
        mov     dword [ebp-10H], eax                    ; 0025 _ 89. 45, F0
        mov     ax, word [?_047]                        ; 0028 _ 66: A1, 00000106(d)
        cwde                                            ; 002E _ 98
        mov     dword [ebp-14H], eax                    ; 002F _ 89. 45, EC
        sub     esp, 4                                  ; 0032 _ 83. EC, 04
        push    keybuf                                  ; 0035 _ 68, 00000140(d)
        push    32                                      ; 003A _ 6A, 20
        push    keyinfo                                 ; 003C _ 68, 00000108(d)
        call    fifo8_init                              ; 0041 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0046 _ 83. C4, 10
        sub     esp, 4                                  ; 0049 _ 83. EC, 04
        push    mousebuf                                ; 004C _ 68, 00000160(d)
        push    128                                     ; 0051 _ 68, 00000080
        push    mouseinfo                               ; 0056 _ 68, 00000120(d)
        call    fifo8_init                              ; 005B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0060 _ 83. C4, 10
        call    init_palette                            ; 0063 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0068 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 006D _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 0070 _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 0073 _ 8B. 45, F0
        dec     eax                                     ; 0076 _ 48
        sub     esp, 4                                  ; 0077 _ 83. EC, 04
        push    edx                                     ; 007A _ 52
        push    eax                                     ; 007B _ 50
        push    0                                       ; 007C _ 6A, 00
        push    0                                       ; 007E _ 6A, 00
        push    14                                      ; 0080 _ 6A, 0E
        push    dword [ebp-10H]                         ; 0082 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0085 _ FF. 75, F4
        call    boxfill8                                ; 0088 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 008D _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0090 _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 0093 _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 0096 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0099 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 009C _ 8B. 45, EC
        sub     eax, 28                                 ; 009F _ 83. E8, 1C
        sub     esp, 4                                  ; 00A2 _ 83. EC, 04
        push    ecx                                     ; 00A5 _ 51
        push    edx                                     ; 00A6 _ 52
        push    eax                                     ; 00A7 _ 50
        push    0                                       ; 00A8 _ 6A, 00
        push    8                                       ; 00AA _ 6A, 08
        push    dword [ebp-10H]                         ; 00AC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00AF _ FF. 75, F4
        call    boxfill8                                ; 00B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00B7 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00BA _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 00BD _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 00C0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00C3 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00C6 _ 8B. 45, EC
        sub     eax, 27                                 ; 00C9 _ 83. E8, 1B
        sub     esp, 4                                  ; 00CC _ 83. EC, 04
        push    ecx                                     ; 00CF _ 51
        push    edx                                     ; 00D0 _ 52
        push    eax                                     ; 00D1 _ 50
        push    0                                       ; 00D2 _ 6A, 00
        push    7                                       ; 00D4 _ 6A, 07
        push    dword [ebp-10H]                         ; 00D6 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00D9 _ FF. 75, F4
        call    boxfill8                                ; 00DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00E1 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00E4 _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00E7 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00EA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00ED _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00F0 _ 8B. 45, EC
        sub     eax, 26                                 ; 00F3 _ 83. E8, 1A
        sub     esp, 4                                  ; 00F6 _ 83. EC, 04
        push    ecx                                     ; 00F9 _ 51
        push    edx                                     ; 00FA _ 52
        push    eax                                     ; 00FB _ 50
        push    0                                       ; 00FC _ 6A, 00
        push    8                                       ; 00FE _ 6A, 08
        push    dword [ebp-10H]                         ; 0100 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0103 _ FF. 75, F4
        call    boxfill8                                ; 0106 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 010B _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 010E _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0111 _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 0114 _ 8B. 45, EC
        sub     eax, 24                                 ; 0117 _ 83. E8, 18
        sub     esp, 4                                  ; 011A _ 83. EC, 04
        push    edx                                     ; 011D _ 52
        push    59                                      ; 011E _ 6A, 3B
        push    eax                                     ; 0120 _ 50
        push    3                                       ; 0121 _ 6A, 03
        push    7                                       ; 0123 _ 6A, 07
        push    dword [ebp-10H]                         ; 0125 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0128 _ FF. 75, F4
        call    boxfill8                                ; 012B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0130 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0133 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0136 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0139 _ 8B. 45, EC
        sub     eax, 24                                 ; 013C _ 83. E8, 18
        sub     esp, 4                                  ; 013F _ 83. EC, 04
        push    edx                                     ; 0142 _ 52
        push    2                                       ; 0143 _ 6A, 02
        push    eax                                     ; 0145 _ 50
        push    2                                       ; 0146 _ 6A, 02
        push    7                                       ; 0148 _ 6A, 07
        push    dword [ebp-10H]                         ; 014A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 014D _ FF. 75, F4
        call    boxfill8                                ; 0150 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0155 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0158 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 015B _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 015E _ 8B. 45, EC
        sub     eax, 4                                  ; 0161 _ 83. E8, 04
        sub     esp, 4                                  ; 0164 _ 83. EC, 04
        push    edx                                     ; 0167 _ 52
        push    59                                      ; 0168 _ 6A, 3B
        push    eax                                     ; 016A _ 50
        push    3                                       ; 016B _ 6A, 03
        push    15                                      ; 016D _ 6A, 0F
        push    dword [ebp-10H]                         ; 016F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0172 _ FF. 75, F4
        call    boxfill8                                ; 0175 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 017A _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 017D _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 0180 _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 0183 _ 8B. 45, EC
        sub     eax, 23                                 ; 0186 _ 83. E8, 17
        sub     esp, 4                                  ; 0189 _ 83. EC, 04
        push    edx                                     ; 018C _ 52
        push    59                                      ; 018D _ 6A, 3B
        push    eax                                     ; 018F _ 50
        push    59                                      ; 0190 _ 6A, 3B
        push    15                                      ; 0192 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0194 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0197 _ FF. 75, F4
        call    boxfill8                                ; 019A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 019F _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01A2 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01A5 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 01A8 _ 8B. 45, EC
        sub     eax, 3                                  ; 01AB _ 83. E8, 03
        sub     esp, 4                                  ; 01AE _ 83. EC, 04
        push    edx                                     ; 01B1 _ 52
        push    59                                      ; 01B2 _ 6A, 3B
        push    eax                                     ; 01B4 _ 50
        push    2                                       ; 01B5 _ 6A, 02
        push    0                                       ; 01B7 _ 6A, 00
        push    dword [ebp-10H]                         ; 01B9 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01BC _ FF. 75, F4
        call    boxfill8                                ; 01BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01C4 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01C7 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01CA _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 01CD _ 8B. 45, EC
        sub     eax, 24                                 ; 01D0 _ 83. E8, 18
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    edx                                     ; 01D6 _ 52
        push    60                                      ; 01D7 _ 6A, 3C
        push    eax                                     ; 01D9 _ 50
        push    60                                      ; 01DA _ 6A, 3C
        push    0                                       ; 01DC _ 6A, 00
        push    dword [ebp-10H]                         ; 01DE _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01E1 _ FF. 75, F4
        call    boxfill8                                ; 01E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E9 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01EC _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01EF _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 01F2 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01F5 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01F8 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01FB _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01FE _ 8B. 45, F0
        sub     eax, 47                                 ; 0201 _ 83. E8, 2F
        sub     esp, 4                                  ; 0204 _ 83. EC, 04
        push    ebx                                     ; 0207 _ 53
        push    ecx                                     ; 0208 _ 51
        push    edx                                     ; 0209 _ 52
        push    eax                                     ; 020A _ 50
        push    15                                      ; 020B _ 6A, 0F
        push    dword [ebp-10H]                         ; 020D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0210 _ FF. 75, F4
        call    boxfill8                                ; 0213 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0218 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 021B _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 021E _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 0221 _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 0224 _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 0227 _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 022A _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 022D _ 8B. 45, F0
        sub     eax, 47                                 ; 0230 _ 83. E8, 2F
        sub     esp, 4                                  ; 0233 _ 83. EC, 04
        push    ebx                                     ; 0236 _ 53
        push    ecx                                     ; 0237 _ 51
        push    edx                                     ; 0238 _ 52
        push    eax                                     ; 0239 _ 50
        push    15                                      ; 023A _ 6A, 0F
        push    dword [ebp-10H]                         ; 023C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 023F _ FF. 75, F4
        call    boxfill8                                ; 0242 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0247 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 024A _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 024D _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 0250 _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 0253 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 0256 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0259 _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 025C _ 8B. 45, F0
        sub     eax, 47                                 ; 025F _ 83. E8, 2F
        sub     esp, 4                                  ; 0262 _ 83. EC, 04
        push    ebx                                     ; 0265 _ 53
        push    ecx                                     ; 0266 _ 51
        push    edx                                     ; 0267 _ 52
        push    eax                                     ; 0268 _ 50
        push    7                                       ; 0269 _ 6A, 07
        push    dword [ebp-10H]                         ; 026B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 026E _ FF. 75, F4
        call    boxfill8                                ; 0271 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0276 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0279 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 027C _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 027F _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 0282 _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 0285 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0288 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 028B _ 8B. 45, F0
        sub     eax, 3                                  ; 028E _ 83. E8, 03
        sub     esp, 4                                  ; 0291 _ 83. EC, 04
        push    ebx                                     ; 0294 _ 53
        push    ecx                                     ; 0295 _ 51
        push    edx                                     ; 0296 _ 52
        push    eax                                     ; 0297 _ 50
        push    7                                       ; 0298 _ 6A, 07
        push    dword [ebp-10H]                         ; 029A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 029D _ FF. 75, F4
        call    boxfill8                                ; 02A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02A5 _ 83. C4, 20
        sub     esp, 8                                  ; 02A8 _ 83. EC, 08
        push    14                                      ; 02AB _ 6A, 0E
        push    mcursor                                 ; 02AD _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 02B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B7 _ 83. C4, 10
        push    16                                      ; 02BA _ 6A, 10
        push    mcursor                                 ; 02BC _ 68, 00000000(d)
        push    80                                      ; 02C1 _ 6A, 50
        push    80                                      ; 02C3 _ 6A, 50
        push    16                                      ; 02C5 _ 6A, 10
        push    16                                      ; 02C7 _ 6A, 10
        push    dword [ebp-10H]                         ; 02C9 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 02CC _ FF. 75, F4
        call    putblock                                ; 02CF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D4 _ 83. C4, 20
        call    io_sti                                  ; 02D7 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 02E1 _ C7. 45, E8, 00000000
?_001:  call    io_cli                                  ; 02E8 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02ED _ 83. EC, 0C
        push    keyinfo                                 ; 02F0 _ 68, 00000108(d)
        call    fifo8_status                            ; 02F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FA _ 83. C4, 10
        mov     ebx, eax                                ; 02FD _ 89. C3
        sub     esp, 12                                 ; 02FF _ 83. EC, 0C
        push    mouseinfo                               ; 0302 _ 68, 00000120(d)
        call    fifo8_status                            ; 0307 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030C _ 83. C4, 10
        add     eax, ebx                                ; 030F _ 01. D8
        test    eax, eax                                ; 0311 _ 85. C0
        jnz     ?_002                                   ; 0313 _ 75, 07
        call    io_stihlt                               ; 0315 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 031A _ EB, CC

?_002:  sub     esp, 12                                 ; 031C _ 83. EC, 0C
        push    keyinfo                                 ; 031F _ 68, 00000108(d)
        call    fifo8_status                            ; 0324 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0329 _ 83. C4, 10
        test    eax, eax                                ; 032C _ 85. C0
        jz      ?_003                                   ; 032E _ 74, 5D
        call    io_sti                                  ; 0330 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0335 _ 83. EC, 0C
        push    keyinfo                                 ; 0338 _ 68, 00000108(d)
        call    fifo8_get                               ; 033D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0342 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0345 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0348 _ 8B. 45, E8
        movzx   eax, al                                 ; 034B _ 0F B6. C0
        sub     esp, 12                                 ; 034E _ 83. EC, 0C
        push    eax                                     ; 0351 _ 50
        call    charToHexStr                            ; 0352 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0357 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 035A _ 89. 45, E4
        mov     eax, dword [showPos.1603]               ; 035D _ A1, 000001E0(d)
        sub     esp, 8                                  ; 0362 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0365 _ FF. 75, E4
        push    7                                       ; 0368 _ 6A, 07
        push    0                                       ; 036A _ 6A, 00
        push    eax                                     ; 036C _ 50
        push    dword [ebp-10H]                         ; 036D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0370 _ FF. 75, F4
        call    showString                              ; 0373 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0378 _ 83. C4, 20
        mov     eax, dword [showPos.1603]               ; 037B _ A1, 000001E0(d)
        add     eax, 32                                 ; 0380 _ 83. C0, 20
        mov     dword [showPos.1603], eax               ; 0383 _ A3, 000001E0(d)
        jmp     ?_001                                   ; 0388 _ E9, FFFFFF5B

?_003:  sub     esp, 12                                 ; 038D _ 83. EC, 0C
        push    mouseinfo                               ; 0390 _ 68, 00000120(d)
        call    fifo8_status                            ; 0395 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039A _ 83. C4, 10
        test    eax, eax                                ; 039D _ 85. C0
        je      ?_001                                   ; 039F _ 0F 84, FFFFFF43
        call    show_mouse_info                         ; 03A5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03AA _ E9, FFFFFF39
; CMain End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 03AF _ 55
        mov     ebp, esp                                ; 03B0 _ 89. E5
        sub     esp, 40                                 ; 03B2 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 03B5 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 03BA _ 89. 45, F4
        mov     eax, dword [?_046]                      ; 03BD _ A1, 00000104(d)
        cwde                                            ; 03C2 _ 98
        mov     dword [ebp-10H], eax                    ; 03C3 _ 89. 45, F0
        mov     ax, word [?_047]                        ; 03C6 _ 66: A1, 00000106(d)
        cwde                                            ; 03CC _ 98
        mov     dword [ebp-14H], eax                    ; 03CD _ 89. 45, EC
        mov     byte [ebp-15H], 0                       ; 03D0 _ C6. 45, EB, 00
        call    io_sti                                  ; 03D4 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03D9 _ 83. EC, 0C
        push    mouseinfo                               ; 03DC _ 68, 00000120(d)
        call    fifo8_get                               ; 03E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E6 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 03E9 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 03EC _ 0F B6. 45, EB
        sub     esp, 12                                 ; 03F0 _ 83. EC, 0C
        push    eax                                     ; 03F3 _ 50
        call    charToHexStr                            ; 03F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F9 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 03FC _ 89. 45, E4
        mov     eax, dword [mousePos.1612]              ; 03FF _ A1, 00000018(d)
        cmp     eax, 256                                ; 0404 _ 3D, 00000100
        jg      ?_004                                   ; 0409 _ 7F, 2B
        mov     eax, dword [mousePos.1612]              ; 040B _ A1, 00000018(d)
        sub     esp, 8                                  ; 0410 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0413 _ FF. 75, E4
        push    7                                       ; 0416 _ 6A, 07
        push    16                                      ; 0418 _ 6A, 10
        push    eax                                     ; 041A _ 50
        push    dword [ebp-10H]                         ; 041B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 041E _ FF. 75, F4
        call    showString                              ; 0421 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0426 _ 83. C4, 20
        mov     eax, dword [mousePos.1612]              ; 0429 _ A1, 00000018(d)
        add     eax, 32                                 ; 042E _ 83. C0, 20
        mov     dword [mousePos.1612], eax              ; 0431 _ A3, 00000018(d)
?_004:  nop                                             ; 0436 _ 90
        leave                                           ; 0437 _ C9
        ret                                             ; 0438 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0439 _ 55
        mov     ebp, esp                                ; 043A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 043C _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 043F _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0445 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0448 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 044E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0451 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0457 _ 90
        pop     ebp                                     ; 0458 _ 5D
        ret                                             ; 0459 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 045A _ 55
        mov     ebp, esp                                ; 045B _ 89. E5
        sub     esp, 24                                 ; 045D _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0460 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0463 _ 88. 45, F4
        jmp     ?_006                                   ; 0466 _ EB, 35

?_005:  mov     eax, dword [ebp+1CH]                    ; 0468 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 046B _ 8A. 00
        movzx   eax, al                                 ; 046D _ 0F B6. C0
        shl     eax, 4                                  ; 0470 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0473 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0479 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 047D _ 83. EC, 08
        push    edx                                     ; 0480 _ 52
        push    eax                                     ; 0481 _ 50
        push    dword [ebp+14H]                         ; 0482 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0485 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0488 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 048B _ FF. 75, 08
        call    showFont8                               ; 048E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0493 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0496 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 049A _ FF. 45, 1C
?_006:  mov     eax, dword [ebp+1CH]                    ; 049D _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 04A0 _ 8A. 00
        test    al, al                                  ; 04A2 _ 84. C0
        jnz     ?_005                                   ; 04A4 _ 75, C2
        nop                                             ; 04A6 _ 90
        nop                                             ; 04A7 _ 90
        leave                                           ; 04A8 _ C9
        ret                                             ; 04A9 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 04AA _ 55
        mov     ebp, esp                                ; 04AB _ 89. E5
        sub     esp, 8                                  ; 04AD _ 83. EC, 08
        sub     esp, 4                                  ; 04B0 _ 83. EC, 04
        push    table_rgb.1630                          ; 04B3 _ 68, 00000020(d)
        push    15                                      ; 04B8 _ 6A, 0F
        push    0                                       ; 04BA _ 6A, 00
        call    set_palette                             ; 04BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04C1 _ 83. C4, 10
        nop                                             ; 04C4 _ 90
        leave                                           ; 04C5 _ C9
        ret                                             ; 04C6 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 04C7 _ 55
        mov     ebp, esp                                ; 04C8 _ 89. E5
        sub     esp, 24                                 ; 04CA _ 83. EC, 18
        call    io_load_eflags                          ; 04CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 04D2 _ 89. 45, F0
        call    io_cli                                  ; 04D5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 04DA _ 83. EC, 08
        push    dword [ebp+8H]                          ; 04DD _ FF. 75, 08
        push    968                                     ; 04E0 _ 68, 000003C8
        call    io_out8                                 ; 04E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04EA _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 04ED _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 04F0 _ 89. 45, F4
        jmp     ?_008                                   ; 04F3 _ EB, 5F

?_007:  mov     eax, dword [ebp+10H]                    ; 04F5 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 04F8 _ 8A. 00
        shr     al, 2                                   ; 04FA _ C0. E8, 02
        movzx   eax, al                                 ; 04FD _ 0F B6. C0
        sub     esp, 8                                  ; 0500 _ 83. EC, 08
        push    eax                                     ; 0503 _ 50
        push    969                                     ; 0504 _ 68, 000003C9
        call    io_out8                                 ; 0509 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 050E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0511 _ 8B. 45, 10
        inc     eax                                     ; 0514 _ 40
        mov     al, byte [eax]                          ; 0515 _ 8A. 00
        shr     al, 2                                   ; 0517 _ C0. E8, 02
        movzx   eax, al                                 ; 051A _ 0F B6. C0
        sub     esp, 8                                  ; 051D _ 83. EC, 08
        push    eax                                     ; 0520 _ 50
        push    969                                     ; 0521 _ 68, 000003C9
        call    io_out8                                 ; 0526 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 052B _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 052E _ 8B. 45, 10
        add     eax, 2                                  ; 0531 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0534 _ 8A. 00
        shr     al, 2                                   ; 0536 _ C0. E8, 02
        movzx   eax, al                                 ; 0539 _ 0F B6. C0
        sub     esp, 8                                  ; 053C _ 83. EC, 08
        push    eax                                     ; 053F _ 50
        push    969                                     ; 0540 _ 68, 000003C9
        call    io_out8                                 ; 0545 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 054A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 054D _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0551 _ FF. 45, F4
?_008:  mov     eax, dword [ebp-0CH]                    ; 0554 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0557 _ 3B. 45, 0C
        jle     ?_007                                   ; 055A _ 7E, 99
        sub     esp, 12                                 ; 055C _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 055F _ FF. 75, F0
        call    io_store_eflags                         ; 0562 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0567 _ 83. C4, 10
        nop                                             ; 056A _ 90
        leave                                           ; 056B _ C9
        ret                                             ; 056C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 056D _ 55
        mov     ebp, esp                                ; 056E _ 89. E5
        sub     esp, 20                                 ; 0570 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0573 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0576 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0579 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 057C _ 89. 45, F8
        jmp     ?_012                                   ; 057F _ EB, 30

?_009:  mov     eax, dword [ebp+14H]                    ; 0581 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0584 _ 89. 45, FC
        jmp     ?_011                                   ; 0587 _ EB, 1D

?_010:  mov     eax, dword [ebp-8H]                     ; 0589 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 058C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0590 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0592 _ 8B. 45, FC
        add     eax, edx                                ; 0595 _ 01. D0
        mov     edx, eax                                ; 0597 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0599 _ 8B. 45, 08
        add     edx, eax                                ; 059C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 059E _ 8A. 45, EC
        mov     byte [edx], al                          ; 05A1 _ 88. 02
        inc     dword [ebp-4H]                          ; 05A3 _ FF. 45, FC
?_011:  mov     eax, dword [ebp-4H]                     ; 05A6 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 05A9 _ 3B. 45, 1C
        jle     ?_010                                   ; 05AC _ 7E, DB
        inc     dword [ebp-8H]                          ; 05AE _ FF. 45, F8
?_012:  mov     eax, dword [ebp-8H]                     ; 05B1 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 05B4 _ 3B. 45, 20
        jle     ?_009                                   ; 05B7 _ 7E, C8
        nop                                             ; 05B9 _ 90
        nop                                             ; 05BA _ 90
        leave                                           ; 05BB _ C9
        ret                                             ; 05BC _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 05BD _ 55
        mov     ebp, esp                                ; 05BE _ 89. E5
        sub     esp, 20                                 ; 05C0 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 05C3 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 05C6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 05C9 _ C7. 45, FC, 00000000
        jmp     ?_022                                   ; 05D0 _ E9, 00000162

?_013:  mov     edx, dword [ebp-4H]                     ; 05D5 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 05D8 _ 8B. 45, 1C
        add     eax, edx                                ; 05DB _ 01. D0
        mov     al, byte [eax]                          ; 05DD _ 8A. 00
        mov     byte [ebp-5H], al                       ; 05DF _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 05E2 _ 80. 7D, FB, 00
        jns     ?_014                                   ; 05E6 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 05E8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05EB _ 8B. 45, FC
        add     eax, edx                                ; 05EE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05F0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05F4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05F6 _ 8B. 45, 10
        add     eax, edx                                ; 05F9 _ 01. D0
        mov     edx, eax                                ; 05FB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 05FD _ 8B. 45, 08
        add     edx, eax                                ; 0600 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0602 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0605 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0607 _ 0F BE. 45, FB
        and     eax, 40H                                ; 060B _ 83. E0, 40
        test    eax, eax                                ; 060E _ 85. C0
        jz      ?_015                                   ; 0610 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0612 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0615 _ 8B. 45, FC
        add     eax, edx                                ; 0618 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 061A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 061E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0620 _ 8B. 45, 10
        add     eax, edx                                ; 0623 _ 01. D0
        lea     edx, [eax+1H]                           ; 0625 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0628 _ 8B. 45, 08
        add     edx, eax                                ; 062B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 062D _ 8A. 45, EC
        mov     byte [edx], al                          ; 0630 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0632 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0636 _ 83. E0, 20
        test    eax, eax                                ; 0639 _ 85. C0
        jz      ?_016                                   ; 063B _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 063D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0640 _ 8B. 45, FC
        add     eax, edx                                ; 0643 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0645 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0649 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 064B _ 8B. 45, 10
        add     eax, edx                                ; 064E _ 01. D0
        lea     edx, [eax+2H]                           ; 0650 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0653 _ 8B. 45, 08
        add     edx, eax                                ; 0656 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0658 _ 8A. 45, EC
        mov     byte [edx], al                          ; 065B _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 065D _ 0F BE. 45, FB
        and     eax, 10H                                ; 0661 _ 83. E0, 10
        test    eax, eax                                ; 0664 _ 85. C0
        jz      ?_017                                   ; 0666 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0668 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 066B _ 8B. 45, FC
        add     eax, edx                                ; 066E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0670 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0674 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0676 _ 8B. 45, 10
        add     eax, edx                                ; 0679 _ 01. D0
        lea     edx, [eax+3H]                           ; 067B _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 067E _ 8B. 45, 08
        add     edx, eax                                ; 0681 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0683 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0686 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 0688 _ 0F BE. 45, FB
        and     eax, 08H                                ; 068C _ 83. E0, 08
        test    eax, eax                                ; 068F _ 85. C0
        jz      ?_018                                   ; 0691 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0693 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0696 _ 8B. 45, FC
        add     eax, edx                                ; 0699 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 069B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 069F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06A1 _ 8B. 45, 10
        add     eax, edx                                ; 06A4 _ 01. D0
        lea     edx, [eax+4H]                           ; 06A6 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 06A9 _ 8B. 45, 08
        add     edx, eax                                ; 06AC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 06AE _ 8A. 45, EC
        mov     byte [edx], al                          ; 06B1 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 06B3 _ 0F BE. 45, FB
        and     eax, 04H                                ; 06B7 _ 83. E0, 04
        test    eax, eax                                ; 06BA _ 85. C0
        jz      ?_019                                   ; 06BC _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 06BE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06C1 _ 8B. 45, FC
        add     eax, edx                                ; 06C4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06CC _ 8B. 45, 10
        add     eax, edx                                ; 06CF _ 01. D0
        lea     edx, [eax+5H]                           ; 06D1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 06D4 _ 8B. 45, 08
        add     edx, eax                                ; 06D7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 06D9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 06DC _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 06DE _ 0F BE. 45, FB
        and     eax, 02H                                ; 06E2 _ 83. E0, 02
        test    eax, eax                                ; 06E5 _ 85. C0
        jz      ?_020                                   ; 06E7 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 06E9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 06EC _ 8B. 45, FC
        add     eax, edx                                ; 06EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 06F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 06F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 06F7 _ 8B. 45, 10
        add     eax, edx                                ; 06FA _ 01. D0
        lea     edx, [eax+6H]                           ; 06FC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 06FF _ 8B. 45, 08
        add     edx, eax                                ; 0702 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0704 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0707 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0709 _ 0F BE. 45, FB
        and     eax, 01H                                ; 070D _ 83. E0, 01
        test    eax, eax                                ; 0710 _ 85. C0
        jz      ?_021                                   ; 0712 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0714 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0717 _ 8B. 45, FC
        add     eax, edx                                ; 071A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 071C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0720 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0722 _ 8B. 45, 10
        add     eax, edx                                ; 0725 _ 01. D0
        lea     edx, [eax+7H]                           ; 0727 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 072A _ 8B. 45, 08
        add     edx, eax                                ; 072D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 072F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0732 _ 88. 02
?_021:  inc     dword [ebp-4H]                          ; 0734 _ FF. 45, FC
?_022:  cmp     dword [ebp-4H], 15                      ; 0737 _ 83. 7D, FC, 0F
        jle     ?_013                                   ; 073B _ 0F 8E, FFFFFE94
        nop                                             ; 0741 _ 90
        nop                                             ; 0742 _ 90
        leave                                           ; 0743 _ C9
        ret                                             ; 0744 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0745 _ 55
        mov     ebp, esp                                ; 0746 _ 89. E5
        sub     esp, 20                                 ; 0748 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 074B _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 074E _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0751 _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 0758 _ E9, 000000AB

?_023:  mov     dword [ebp-4H], 0                       ; 075D _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0764 _ E9, 00000092

?_024:  mov     eax, dword [ebp-8H]                     ; 0769 _ 8B. 45, F8
        shl     eax, 4                                  ; 076C _ C1. E0, 04
        mov     edx, eax                                ; 076F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0771 _ 8B. 45, FC
        add     eax, edx                                ; 0774 _ 01. D0
        add     eax, cursor.1677                        ; 0776 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 077B _ 8A. 00
        cmp     al, 42                                  ; 077D _ 3C, 2A
        jnz     ?_025                                   ; 077F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0781 _ 8B. 45, F8
        shl     eax, 4                                  ; 0784 _ C1. E0, 04
        mov     edx, eax                                ; 0787 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0789 _ 8B. 45, FC
        add     eax, edx                                ; 078C _ 01. D0
        mov     edx, eax                                ; 078E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0790 _ 8B. 45, 08
        add     eax, edx                                ; 0793 _ 01. D0
        mov     byte [eax], 0                           ; 0795 _ C6. 00, 00
?_025:  mov     eax, dword [ebp-8H]                     ; 0798 _ 8B. 45, F8
        shl     eax, 4                                  ; 079B _ C1. E0, 04
        mov     edx, eax                                ; 079E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07A0 _ 8B. 45, FC
        add     eax, edx                                ; 07A3 _ 01. D0
        add     eax, cursor.1677                        ; 07A5 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 07AA _ 8A. 00
        cmp     al, 79                                  ; 07AC _ 3C, 4F
        jnz     ?_026                                   ; 07AE _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 07B0 _ 8B. 45, F8
        shl     eax, 4                                  ; 07B3 _ C1. E0, 04
        mov     edx, eax                                ; 07B6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07B8 _ 8B. 45, FC
        add     eax, edx                                ; 07BB _ 01. D0
        mov     edx, eax                                ; 07BD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07BF _ 8B. 45, 08
        add     eax, edx                                ; 07C2 _ 01. D0
        mov     byte [eax], 7                           ; 07C4 _ C6. 00, 07
?_026:  mov     eax, dword [ebp-8H]                     ; 07C7 _ 8B. 45, F8
        shl     eax, 4                                  ; 07CA _ C1. E0, 04
        mov     edx, eax                                ; 07CD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07CF _ 8B. 45, FC
        add     eax, edx                                ; 07D2 _ 01. D0
        add     eax, cursor.1677                        ; 07D4 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 07D9 _ 8A. 00
        cmp     al, 46                                  ; 07DB _ 3C, 2E
        jnz     ?_027                                   ; 07DD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 07DF _ 8B. 45, F8
        shl     eax, 4                                  ; 07E2 _ C1. E0, 04
        mov     edx, eax                                ; 07E5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 07E7 _ 8B. 45, FC
        add     eax, edx                                ; 07EA _ 01. D0
        mov     edx, eax                                ; 07EC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07EE _ 8B. 45, 08
        add     edx, eax                                ; 07F1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 07F3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 07F6 _ 88. 02
?_027:  inc     dword [ebp-4H]                          ; 07F8 _ FF. 45, FC
?_028:  cmp     dword [ebp-4H], 15                      ; 07FB _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 07FF _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0805 _ FF. 45, F8
?_029:  cmp     dword [ebp-8H], 15                      ; 0808 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 080C _ 0F 8E, FFFFFF4B
        nop                                             ; 0812 _ 90
        nop                                             ; 0813 _ 90
        leave                                           ; 0814 _ C9
        ret                                             ; 0815 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0816 _ 55
        mov     ebp, esp                                ; 0817 _ 89. E5
        push    ebx                                     ; 0819 _ 53
        sub     esp, 16                                 ; 081A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 081D _ C7. 45, F4, 00000000
        jmp     ?_033                                   ; 0824 _ EB, 4D

?_030:  mov     dword [ebp-8H], 0                       ; 0826 _ C7. 45, F8, 00000000
        jmp     ?_032                                   ; 082D _ EB, 39

?_031:  mov     eax, dword [ebp-0CH]                    ; 082F _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0832 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0836 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0838 _ 8B. 45, F8
        add     eax, edx                                ; 083B _ 01. D0
        mov     edx, eax                                ; 083D _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 083F _ 8B. 45, 20
        add     eax, edx                                ; 0842 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0844 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0847 _ 8B. 55, F4
        add     edx, ecx                                ; 084A _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 084C _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0850 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0853 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0856 _ 01. D9
        add     edx, ecx                                ; 0858 _ 01. CA
        mov     ecx, edx                                ; 085A _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 085C _ 8B. 55, 08
        add     edx, ecx                                ; 085F _ 01. CA
        mov     al, byte [eax]                          ; 0861 _ 8A. 00
        mov     byte [edx], al                          ; 0863 _ 88. 02
        inc     dword [ebp-8H]                          ; 0865 _ FF. 45, F8
?_032:  mov     eax, dword [ebp-8H]                     ; 0868 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 086B _ 3B. 45, 10
        jl      ?_031                                   ; 086E _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0870 _ FF. 45, F4
?_033:  mov     eax, dword [ebp-0CH]                    ; 0873 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0876 _ 3B. 45, 14
        jl      ?_030                                   ; 0879 _ 7C, AB
        nop                                             ; 087B _ 90
        nop                                             ; 087C _ 90
        add     esp, 16                                 ; 087D _ 83. C4, 10
        pop     ebx                                     ; 0880 _ 5B
        pop     ebp                                     ; 0881 _ 5D
        ret                                             ; 0882 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0883 _ 55
        mov     ebp, esp                                ; 0884 _ 89. E5
        sub     esp, 24                                 ; 0886 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0889 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 088E _ 89. 45, F4
        mov     eax, dword [?_046]                      ; 0891 _ A1, 00000104(d)
        cwde                                            ; 0896 _ 98
        mov     dword [ebp-10H], eax                    ; 0897 _ 89. 45, F0
        mov     ax, word [?_047]                        ; 089A _ 66: A1, 00000106(d)
        cwde                                            ; 08A0 _ 98
        mov     dword [ebp-14H], eax                    ; 08A1 _ 89. 45, EC
        sub     esp, 8                                  ; 08A4 _ 83. EC, 08
        push    32                                      ; 08A7 _ 6A, 20
        push    32                                      ; 08A9 _ 6A, 20
        call    io_out8                                 ; 08AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B0 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 08B3 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 08B7 _ 83. EC, 0C
        push    96                                      ; 08BA _ 6A, 60
        call    io_in8                                  ; 08BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08C1 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 08C4 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 08C7 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 08CB _ 83. EC, 08
        push    eax                                     ; 08CE _ 50
        push    keyinfo                                 ; 08CF _ 68, 00000108(d)
        call    fifo8_put                               ; 08D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D9 _ 83. C4, 10
        nop                                             ; 08DC _ 90
        leave                                           ; 08DD _ C9
        ret                                             ; 08DE _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 08DF _ 55
        mov     ebp, esp                                ; 08E0 _ 89. E5
        sub     esp, 4                                  ; 08E2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 08E5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 08E8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 08EB _ 80. 7D, FC, 09
        jle     ?_034                                   ; 08EF _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 08F1 _ 8A. 45, FC
        add     eax, 55                                 ; 08F4 _ 83. C0, 37
        jmp     ?_035                                   ; 08F7 _ EB, 06

?_034:  mov     al, byte [ebp-4H]                       ; 08F9 _ 8A. 45, FC
        add     eax, 48                                 ; 08FC _ 83. C0, 30
?_035:  leave                                           ; 08FF _ C9
        ret                                             ; 0900 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0901 _ 55
        mov     ebp, esp                                ; 0902 _ 89. E5
        sub     esp, 20                                 ; 0904 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0907 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 090A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 090D _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0914 _ 8A. 45, EC
        and     eax, 0FH                                ; 0917 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 091A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 091D _ 0F BE. 45, FB
        push    eax                                     ; 0921 _ 50
        call    charToHexVal                            ; 0922 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0927 _ 83. C4, 04
        mov     byte [?_045], al                        ; 092A _ A2, 00000013(d)
        mov     al, byte [ebp-14H]                      ; 092F _ 8A. 45, EC
        shr     al, 4                                   ; 0932 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0935 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0938 _ 8A. 45, EC
        movsx   eax, al                                 ; 093B _ 0F BE. C0
        push    eax                                     ; 093E _ 50
        call    charToHexVal                            ; 093F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0944 _ 83. C4, 04
        mov     byte [?_044], al                        ; 0947 _ A2, 00000012(d)
        mov     eax, keyval                             ; 094C _ B8, 00000010(d)
        leave                                           ; 0951 _ C9
        ret                                             ; 0952 _ C3
; charToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0953 _ 55
        mov     ebp, esp                                ; 0954 _ 89. E5
        sub     esp, 8                                  ; 0956 _ 83. EC, 08
?_036:  sub     esp, 12                                 ; 0959 _ 83. EC, 0C
        push    100                                     ; 095C _ 6A, 64
        call    io_in8                                  ; 095E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0963 _ 83. C4, 10
        and     eax, 02H                                ; 0966 _ 83. E0, 02
        test    eax, eax                                ; 0969 _ 85. C0
        jz      ?_037                                   ; 096B _ 74, 02
        jmp     ?_036                                   ; 096D _ EB, EA

?_037:  nop                                             ; 096F _ 90
        nop                                             ; 0970 _ 90
        leave                                           ; 0971 _ C9
        ret                                             ; 0972 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0973 _ 55
        mov     ebp, esp                                ; 0974 _ 89. E5
        sub     esp, 8                                  ; 0976 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0979 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 097E _ 83. EC, 08
        push    96                                      ; 0981 _ 6A, 60
        push    100                                     ; 0983 _ 6A, 64
        call    io_out8                                 ; 0985 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 098A _ 83. C4, 10
        call    wait_KBC_sendready                      ; 098D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0992 _ 83. EC, 08
        push    71                                      ; 0995 _ 6A, 47
        push    96                                      ; 0997 _ 6A, 60
        call    io_out8                                 ; 0999 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 099E _ 83. C4, 10
        nop                                             ; 09A1 _ 90
        leave                                           ; 09A2 _ C9
        ret                                             ; 09A3 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 09A4 _ 55
        mov     ebp, esp                                ; 09A5 _ 89. E5
        sub     esp, 8                                  ; 09A7 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 09AA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09AF _ 83. EC, 08
        push    212                                     ; 09B2 _ 68, 000000D4
        push    100                                     ; 09B7 _ 6A, 64
        call    io_out8                                 ; 09B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BE _ 83. C4, 10
        call    wait_KBC_sendready                      ; 09C1 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 09C6 _ 83. EC, 08
        push    244                                     ; 09C9 _ 68, 000000F4
        push    96                                      ; 09CE _ 6A, 60
        call    io_out8                                 ; 09D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09D5 _ 83. C4, 10
        nop                                             ; 09D8 _ 90
        leave                                           ; 09D9 _ C9
        ret                                             ; 09DA _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 09DB _ 55
        mov     ebp, esp                                ; 09DC _ 89. E5
        sub     esp, 24                                 ; 09DE _ 83. EC, 18
        sub     esp, 8                                  ; 09E1 _ 83. EC, 08
        push    32                                      ; 09E4 _ 6A, 20
        push    160                                     ; 09E6 _ 68, 000000A0
        call    io_out8                                 ; 09EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09F0 _ 83. C4, 10
        sub     esp, 8                                  ; 09F3 _ 83. EC, 08
        push    32                                      ; 09F6 _ 6A, 20
        push    32                                      ; 09F8 _ 6A, 20
        call    io_out8                                 ; 09FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09FF _ 83. C4, 10
        sub     esp, 12                                 ; 0A02 _ 83. EC, 0C
        push    96                                      ; 0A05 _ 6A, 60
        call    io_in8                                  ; 0A07 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0C _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0A0F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0A12 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0A16 _ 83. EC, 08
        push    eax                                     ; 0A19 _ 50
        push    mouseinfo                               ; 0A1A _ 68, 00000120(d)
        call    fifo8_put                               ; 0A1F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A24 _ 83. C4, 10
        nop                                             ; 0A27 _ 90
        leave                                           ; 0A28 _ C9
        ret                                             ; 0A29 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0A2A _ 55
        mov     ebp, esp                                ; 0A2B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A2D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A30 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0A33 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A36 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0A39 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0A3C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A3E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0A41 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0A44 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A47 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0A4A _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A51 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0A54 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0A5B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A5E _ C7. 40, 08, 00000000
        nop                                             ; 0A65 _ 90
        pop     ebp                                     ; 0A66 _ 5D
        ret                                             ; 0A67 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0A68 _ 55
        mov     ebp, esp                                ; 0A69 _ 89. E5
        sub     esp, 4                                  ; 0A6B _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0A6E _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0A71 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A74 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A77 _ 8B. 40, 10
        test    eax, eax                                ; 0A7A _ 85. C0
        jnz     ?_038                                   ; 0A7C _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0A7E _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0A81 _ 8B. 40, 14
        or      eax, 01H                                ; 0A84 _ 83. C8, 01
        mov     edx, eax                                ; 0A87 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A89 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0A8C _ 89. 50, 14
        mov     eax, 4294967295                         ; 0A8F _ B8, FFFFFFFF
        jmp     ?_040                                   ; 0A94 _ EB, 4F

?_038:  mov     eax, dword [ebp+8H]                     ; 0A96 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A99 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A9B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0A9E _ 8B. 40, 04
        add     edx, eax                                ; 0AA1 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0AA3 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0AA6 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0AA8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0AAB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0AAE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0AB1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0AB4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AB7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0ABA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0ABD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AC0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AC3 _ 39. C2
        jnz     ?_039                                   ; 0AC5 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0AC7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0ACA _ C7. 40, 04, 00000000
?_039:  mov     eax, dword [ebp+8H]                     ; 0AD1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0AD4 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0AD7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0ADA _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0ADD _ 89. 50, 10
        mov     eax, 0                                  ; 0AE0 _ B8, 00000000
?_040:  leave                                           ; 0AE5 _ C9
        ret                                             ; 0AE6 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0AE7 _ 55
        mov     ebp, esp                                ; 0AE8 _ 89. E5
        sub     esp, 16                                 ; 0AEA _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0AED _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0AF0 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0AF6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0AF9 _ 39. C2
        jnz     ?_041                                   ; 0AFB _ 75, 07
        mov     eax, 4294967295                         ; 0AFD _ B8, FFFFFFFF
        jmp     ?_043                                   ; 0B02 _ EB, 50

?_041:  mov     eax, dword [ebp+8H]                     ; 0B04 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0B07 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0B09 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B0C _ 8B. 40, 08
        add     eax, edx                                ; 0B0F _ 01. D0
        mov     al, byte [eax]                          ; 0B11 _ 8A. 00
        movzx   eax, al                                 ; 0B13 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0B16 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0B19 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0B1C _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0B1F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B22 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0B25 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B28 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0B2B _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0B2E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0B31 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0B34 _ 39. C2
        jnz     ?_042                                   ; 0B36 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0B38 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0B3B _ C7. 40, 08, 00000000
?_042:  mov     eax, dword [ebp+8H]                     ; 0B42 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B45 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0B48 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B4B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0B4E _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0B51 _ 8B. 45, FC
?_043:  leave                                           ; 0B54 _ C9
        ret                                             ; 0B55 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0B56 _ 55
        mov     ebp, esp                                ; 0B57 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0B59 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0B5C _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0B5F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0B62 _ 8B. 40, 10
        sub     edx, eax                                ; 0B65 _ 29. C2
        mov     eax, edx                                ; 0B67 _ 89. D0
        pop     ebp                                     ; 0B69 _ 5D
        ret                                             ; 0B6A _ C3
; fifo8_status End of function


fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_044:  db 00H                                          ; 0012 _ .

?_045:  db 00H, 00H, 00H, 00H, 00H                      ; 0013 _ .....

mousePos.1612:                                          ; dword
        dd 00000010H, 00000000H                         ; 0018 _ 16 0 

table_rgb.1630:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1677:                                            ; byte
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

?_046:                                                  ; dword
        resb    2                                       ; 0104

?_047:  resw    1                                       ; 0106

keyinfo:                                                ; byte
        resb    24                                      ; 0108

mouseinfo:                                              ; byte
        resb    32                                      ; 0120

keybuf:                                                 ; yword
        resb    32                                      ; 0140

mousebuf:                                               ; byte
        resb    128                                     ; 0160

showPos.1603:                                           ; dword
        resd    1                                       ; 01E0


