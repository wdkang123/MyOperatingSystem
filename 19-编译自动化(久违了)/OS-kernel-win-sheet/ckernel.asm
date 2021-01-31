; Disassembly of file: ckernel.o
; Sat Jan 30 14:31:52 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 36                                 ; 0004 _ 83. EC, 24
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-10H], eax                    ; 001C _ 89. 45, F0
        mov     eax, dword [?_126]                      ; 001F _ A1, 00000004(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 000000F8(d)
        mov     ax, word [?_127]                        ; 002A _ 66: A1, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ysize], eax                      ; 0031 _ A3, 000000FC(d)
        mov     dword [ebp-14H], 0                      ; 0036 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 003D _ C7. 45, E8, 00000000
        sub     esp, 4                                  ; 0044 _ 83. EC, 04
        push    keybuf                                  ; 0047 _ 68, 00000040(d)
        push    32                                      ; 004C _ 6A, 20
        push    keyinfo                                 ; 004E _ 68, 00000008(d)
        call    fifo8_init                              ; 0053 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0058 _ 83. C4, 10
        sub     esp, 4                                  ; 005B _ 83. EC, 04
        push    mousebuf                                ; 005E _ 68, 00000060(d)
        push    128                                     ; 0063 _ 68, 00000080
        push    mouseinfo                               ; 0068 _ 68, 00000020(d)
        call    fifo8_init                              ; 006D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0072 _ 83. C4, 10
        call    init_palette                            ; 0075 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 007A _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0084 _ 89. 45, E4
        call    get_adr_buffer                          ; 0087 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 008C _ 89. 45, E0
        mov     eax, dword [memman]                     ; 008F _ A1, 00000000(d)
        sub     esp, 12                                 ; 0094 _ 83. EC, 0C
        push    eax                                     ; 0097 _ 50
        call    memman_init                             ; 0098 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009D _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00A0 _ A1, 00000000(d)
        sub     esp, 4                                  ; 00A5 _ 83. EC, 04
        push    1072594944                              ; 00A8 _ 68, 3FEE8000
        push    16809984                                ; 00AD _ 68, 01008000
        push    eax                                     ; 00B2 _ 50
        call    memman_free                             ; 00B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00B8 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00BB _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 00C1 _ 8B. 15, 000000F8(d)
        mov     eax, dword [memman]                     ; 00C7 _ A1, 00000000(d)
        push    ecx                                     ; 00CC _ 51
        push    edx                                     ; 00CD _ 52
        push    dword [ebp-10H]                         ; 00CE _ FF. 75, F0
        push    eax                                     ; 00D1 _ 50
        call    shtctl_init                             ; 00D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D7 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 00DA _ 89. 45, DC
        sub     esp, 12                                 ; 00DD _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 00E0 _ FF. 75, DC
        call    sheet_alloc                             ; 00E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E8 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 00EB _ 89. 45, EC
        sub     esp, 12                                 ; 00EE _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 00F1 _ FF. 75, DC
        call    sheet_alloc                             ; 00F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F9 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 00FC _ 89. 45, E8
        mov     edx, dword [xsize]                      ; 00FF _ 8B. 15, 000000F8(d)
        mov     eax, dword [ysize]                      ; 0105 _ A1, 000000FC(d)
        imul    edx, eax                                ; 010A _ 0F AF. D0
        mov     eax, dword [memman]                     ; 010D _ A1, 00000000(d)
        sub     esp, 8                                  ; 0112 _ 83. EC, 08
        push    edx                                     ; 0115 _ 52
        push    eax                                     ; 0116 _ 50
        call    memman_alloc_4k                         ; 0117 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011C _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 011F _ A3, 00000100(d)
        mov     ecx, dword [ysize]                      ; 0124 _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 012A _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 0130 _ A1, 00000100(d)
        sub     esp, 12                                 ; 0135 _ 83. EC, 0C
        push    99                                      ; 0138 _ 6A, 63
        push    ecx                                     ; 013A _ 51
        push    edx                                     ; 013B _ 52
        push    eax                                     ; 013C _ 50
        push    dword [ebp-14H]                         ; 013D _ FF. 75, EC
        call    sheet_setbuf                            ; 0140 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0145 _ 83. C4, 20
        sub     esp, 12                                 ; 0148 _ 83. EC, 0C
        push    99                                      ; 014B _ 6A, 63
        push    16                                      ; 014D _ 6A, 10
        push    16                                      ; 014F _ 6A, 10
        push    buf_mouse                               ; 0151 _ 68, 00000120(d)
        push    dword [ebp-18H]                         ; 0156 _ FF. 75, E8
        call    sheet_setbuf                            ; 0159 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 015E _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0161 _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 0167 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 016D _ A1, 00000100(d)
        sub     esp, 4                                  ; 0172 _ 83. EC, 04
        push    ecx                                     ; 0175 _ 51
        push    edx                                     ; 0176 _ 52
        push    eax                                     ; 0177 _ 50
        call    init_screen8                            ; 0178 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 017D _ 83. C4, 10
        sub     esp, 8                                  ; 0180 _ 83. EC, 08
        push    99                                      ; 0183 _ 6A, 63
        push    buf_mouse                               ; 0185 _ 68, 00000120(d)
        call    init_mouse_cursor                       ; 018A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 018F _ 83. C4, 10
        push    0                                       ; 0192 _ 6A, 00
        push    0                                       ; 0194 _ 6A, 00
        push    dword [ebp-14H]                         ; 0196 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 0199 _ FF. 75, DC
        call    sheet_slide                             ; 019C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A1 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01A4 _ A1, 000000F8(d)
        sub     eax, 16                                 ; 01A9 _ 83. E8, 10
        mov     edx, eax                                ; 01AC _ 89. C2
        shr     edx, 31                                 ; 01AE _ C1. EA, 1F
        add     eax, edx                                ; 01B1 _ 01. D0
        sar     eax, 1                                  ; 01B3 _ D1. F8
        mov     dword [mx], eax                         ; 01B5 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01BA _ A1, 000000FC(d)
        sub     eax, 44                                 ; 01BF _ 83. E8, 2C
        mov     edx, eax                                ; 01C2 _ 89. C2
        shr     edx, 31                                 ; 01C4 _ C1. EA, 1F
        add     eax, edx                                ; 01C7 _ 01. D0
        sar     eax, 1                                  ; 01C9 _ D1. F8
        mov     dword [my], eax                         ; 01CB _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 01D0 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 01D6 _ A1, 000000F0(d)
        push    edx                                     ; 01DB _ 52
        push    eax                                     ; 01DC _ 50
        push    dword [ebp-18H]                         ; 01DD _ FF. 75, E8
        push    dword [ebp-24H]                         ; 01E0 _ FF. 75, DC
        call    sheet_slide                             ; 01E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01E8 _ 83. C4, 10
        sub     esp, 4                                  ; 01EB _ 83. EC, 04
        push    0                                       ; 01EE _ 6A, 00
        push    dword [ebp-14H]                         ; 01F0 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 01F3 _ FF. 75, DC
        call    sheet_updown                            ; 01F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01FB _ 83. C4, 10
        sub     esp, 4                                  ; 01FE _ 83. EC, 04
        push    1                                       ; 0201 _ 6A, 01
        push    dword [ebp-18H]                         ; 0203 _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0206 _ FF. 75, DC
        call    sheet_updown                            ; 0209 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 020E _ 83. C4, 10
        call    io_sti                                  ; 0211 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0216 _ 83. EC, 0C
        push    mdec                                    ; 0219 _ 68, 000000E0(d)
        call    enable_mouse                            ; 021E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0223 _ 83. C4, 10
        mov     dword [ebp-28H], 0                      ; 0226 _ C7. 45, D8, 00000000
        mov     dword [ebp-0CH], 0                      ; 022D _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 0234 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0239 _ 83. EC, 0C
        push    keyinfo                                 ; 023C _ 68, 00000008(d)
        call    fifo8_status                            ; 0241 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0246 _ 83. C4, 10
        mov     ebx, eax                                ; 0249 _ 89. C3
        sub     esp, 12                                 ; 024B _ 83. EC, 0C
        push    mouseinfo                               ; 024E _ 68, 00000020(d)
        call    fifo8_status                            ; 0253 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0258 _ 83. C4, 10
        add     eax, ebx                                ; 025B _ 01. D8
        test    eax, eax                                ; 025D _ 85. C0
        jnz near      ?_002                                   ; 025f _ 75, 07
        call    io_stihlt                               ; 0261 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0266 _ EB, CC

?_002:  sub     esp, 12                                 ; 0268 _ 83. EC, 0C
        push    keyinfo                                 ; 026B _ 68, 00000008(d)
        call    fifo8_status                            ; 0270 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0275 _ 83. C4, 10
        test    eax, eax                                ; 0278 _ 85. C0
        jz near       ?_004                                   ; 027a _ 74, 76
        call    io_sti                                  ; 027C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0281 _ 83. EC, 0C
        push    keyinfo                                 ; 0284 _ 68, 00000008(d)
        call    fifo8_get                               ; 0289 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 028E _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0291 _ 89. 45, D8
        cmp     dword [ebp-28H], 28                     ; 0294 _ 83. 7D, D8, 1C
        jnz near      ?_001                                   ; 0298 _ 75, 9a
        mov     ecx, dword [xsize]                      ; 029A _ 8B. 0D, 000000F8(d)
        mov     edx, dword [buf_back]                   ; 02A0 _ 8B. 15, 00000100(d)
        mov     ebx, dword [ebp-0CH]                    ; 02A6 _ 8B. 5D, F4
        mov     eax, ebx                                ; 02A9 _ 89. D8
        shl     eax, 2                                  ; 02AB _ C1. E0, 02
        add     eax, ebx                                ; 02AE _ 01. D8
        shl     eax, 2                                  ; 02B0 _ C1. E0, 02
        mov     ebx, eax                                ; 02B3 _ 89. C3
        mov     eax, dword [ebp-20H]                    ; 02B5 _ 8B. 45, E0
        add     eax, ebx                                ; 02B8 _ 01. D8
        sub     esp, 12                                 ; 02BA _ 83. EC, 0C
        push    7                                       ; 02BD _ 6A, 07
        push    ecx                                     ; 02BF _ 51
        push    dword [ebp-0CH]                         ; 02C0 _ FF. 75, F4
        push    edx                                     ; 02C3 _ 52
        push    eax                                     ; 02C4 _ 50
        call    showMemoryInfo                          ; 02C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02CA _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 02CD _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 02D0 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 02D3 _ 3B. 45, E4
        jle near      ?_003                                   ; 02d6 _ 7e, 07
        mov     dword [ebp-0CH], 0                      ; 02D8 _ C7. 45, F4, 00000000
?_003:  sub     esp, 12                                 ; 02DF _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 02E2 _ FF. 75, DC
        call    sheet_refresh                           ; 02E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EA _ 83. C4, 10
        jmp     ?_001                                   ; 02ED _ E9, FFFFFF42

?_004:  sub     esp, 12                                 ; 02F2 _ 83. EC, 0C
        push    mouseinfo                               ; 02F5 _ 68, 00000020(d)
        call    fifo8_status                            ; 02FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FF _ 83. C4, 10
        test    eax, eax                                ; 0302 _ 85. C0
        je      ?_001                                   ; 0304 _ 0F 84, FFFFFF2A
        sub     esp, 8                                  ; 030A _ 83. EC, 08
        push    dword [ebp-18H]                         ; 030D _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0310 _ FF. 75, DC
        call    show_mouse_info                         ; 0313 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0318 _ 83. C4, 10
        jmp     ?_001                                   ; 031B _ E9, FFFFFF14
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0320 _ 55
        mov     ebp, esp                                ; 0321 _ 89. E5
        push    ebx                                     ; 0323 _ 53
        sub     esp, 4                                  ; 0324 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0327 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 032A _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 032D _ 8B. 45, 0C
        dec     eax                                     ; 0330 _ 48
        sub     esp, 4                                  ; 0331 _ 83. EC, 04
        push    edx                                     ; 0334 _ 52
        push    eax                                     ; 0335 _ 50
        push    0                                       ; 0336 _ 6A, 00
        push    0                                       ; 0338 _ 6A, 00
        push    14                                      ; 033A _ 6A, 0E
        push    dword [ebp+0CH]                         ; 033C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 033F _ FF. 75, 08
        call    boxfill8                                ; 0342 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0347 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 034A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 034D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0350 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0353 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0356 _ 8B. 45, 10
        sub     eax, 28                                 ; 0359 _ 83. E8, 1C
        sub     esp, 4                                  ; 035C _ 83. EC, 04
        push    ecx                                     ; 035F _ 51
        push    edx                                     ; 0360 _ 52
        push    eax                                     ; 0361 _ 50
        push    0                                       ; 0362 _ 6A, 00
        push    8                                       ; 0364 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0366 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0369 _ FF. 75, 08
        call    boxfill8                                ; 036C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0371 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0374 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0377 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 037A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 037D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0380 _ 8B. 45, 10
        sub     eax, 27                                 ; 0383 _ 83. E8, 1B
        sub     esp, 4                                  ; 0386 _ 83. EC, 04
        push    ecx                                     ; 0389 _ 51
        push    edx                                     ; 038A _ 52
        push    eax                                     ; 038B _ 50
        push    0                                       ; 038C _ 6A, 00
        push    7                                       ; 038E _ 6A, 07
        push    dword [ebp+0CH]                         ; 0390 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0393 _ FF. 75, 08
        call    boxfill8                                ; 0396 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 039B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 039E _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03A1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03A4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03A7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03AA _ 8B. 45, 10
        sub     eax, 26                                 ; 03AD _ 83. E8, 1A
        sub     esp, 4                                  ; 03B0 _ 83. EC, 04
        push    ecx                                     ; 03B3 _ 51
        push    edx                                     ; 03B4 _ 52
        push    eax                                     ; 03B5 _ 50
        push    0                                       ; 03B6 _ 6A, 00
        push    8                                       ; 03B8 _ 6A, 08
        push    dword [ebp+0CH]                         ; 03BA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03BD _ FF. 75, 08
        call    boxfill8                                ; 03C0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03C8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 03CB _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 03CE _ 8B. 45, 10
        sub     eax, 24                                 ; 03D1 _ 83. E8, 18
        sub     esp, 4                                  ; 03D4 _ 83. EC, 04
        push    edx                                     ; 03D7 _ 52
        push    59                                      ; 03D8 _ 6A, 3B
        push    eax                                     ; 03DA _ 50
        push    3                                       ; 03DB _ 6A, 03
        push    7                                       ; 03DD _ 6A, 07
        push    dword [ebp+0CH]                         ; 03DF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03E2 _ FF. 75, 08
        call    boxfill8                                ; 03E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03EA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03ED _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03F0 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03F3 _ 8B. 45, 10
        sub     eax, 24                                 ; 03F6 _ 83. E8, 18
        sub     esp, 4                                  ; 03F9 _ 83. EC, 04
        push    edx                                     ; 03FC _ 52
        push    2                                       ; 03FD _ 6A, 02
        push    eax                                     ; 03FF _ 50
        push    2                                       ; 0400 _ 6A, 02
        push    7                                       ; 0402 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0404 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0407 _ FF. 75, 08
        call    boxfill8                                ; 040A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 040F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0412 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0415 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0418 _ 8B. 45, 10
        sub     eax, 4                                  ; 041B _ 83. E8, 04
        sub     esp, 4                                  ; 041E _ 83. EC, 04
        push    edx                                     ; 0421 _ 52
        push    59                                      ; 0422 _ 6A, 3B
        push    eax                                     ; 0424 _ 50
        push    3                                       ; 0425 _ 6A, 03
        push    15                                      ; 0427 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0429 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 042C _ FF. 75, 08
        call    boxfill8                                ; 042F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0434 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0437 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 043A _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 043D _ 8B. 45, 10
        sub     eax, 23                                 ; 0440 _ 83. E8, 17
        sub     esp, 4                                  ; 0443 _ 83. EC, 04
        push    edx                                     ; 0446 _ 52
        push    59                                      ; 0447 _ 6A, 3B
        push    eax                                     ; 0449 _ 50
        push    59                                      ; 044A _ 6A, 3B
        push    15                                      ; 044C _ 6A, 0F
        push    dword [ebp+0CH]                         ; 044E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0451 _ FF. 75, 08
        call    boxfill8                                ; 0454 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0459 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 045C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 045F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0462 _ 8B. 45, 10
        sub     eax, 3                                  ; 0465 _ 83. E8, 03
        sub     esp, 4                                  ; 0468 _ 83. EC, 04
        push    edx                                     ; 046B _ 52
        push    59                                      ; 046C _ 6A, 3B
        push    eax                                     ; 046E _ 50
        push    2                                       ; 046F _ 6A, 02
        push    0                                       ; 0471 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0473 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0476 _ FF. 75, 08
        call    boxfill8                                ; 0479 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 047E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0481 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0484 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0487 _ 8B. 45, 10
        sub     eax, 24                                 ; 048A _ 83. E8, 18
        sub     esp, 4                                  ; 048D _ 83. EC, 04
        push    edx                                     ; 0490 _ 52
        push    60                                      ; 0491 _ 6A, 3C
        push    eax                                     ; 0493 _ 50
        push    60                                      ; 0494 _ 6A, 3C
        push    0                                       ; 0496 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0498 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 049B _ FF. 75, 08
        call    boxfill8                                ; 049E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04A6 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04A9 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04AC _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04AF _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04B2 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B5 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04B8 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04BB _ 83. E8, 2F
        sub     esp, 4                                  ; 04BE _ 83. EC, 04
        push    ebx                                     ; 04C1 _ 53
        push    ecx                                     ; 04C2 _ 51
        push    edx                                     ; 04C3 _ 52
        push    eax                                     ; 04C4 _ 50
        push    15                                      ; 04C5 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04C7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04CA _ FF. 75, 08
        call    boxfill8                                ; 04CD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04D5 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 04D8 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 04DB _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 04DE _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 04E1 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 04E4 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 04E7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04EA _ 83. E8, 2F
        sub     esp, 4                                  ; 04ED _ 83. EC, 04
        push    ebx                                     ; 04F0 _ 53
        push    ecx                                     ; 04F1 _ 51
        push    edx                                     ; 04F2 _ 52
        push    eax                                     ; 04F3 _ 50
        push    15                                      ; 04F4 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04F6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04F9 _ FF. 75, 08
        call    boxfill8                                ; 04FC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0501 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0504 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0507 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 050A _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 050D _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0510 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0513 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0516 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0519 _ 83. E8, 2F
        sub     esp, 4                                  ; 051C _ 83. EC, 04
        push    ebx                                     ; 051F _ 53
        push    ecx                                     ; 0520 _ 51
        push    edx                                     ; 0521 _ 52
        push    eax                                     ; 0522 _ 50
        push    7                                       ; 0523 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0525 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0528 _ FF. 75, 08
        call    boxfill8                                ; 052B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0530 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0533 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0536 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0539 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 053C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 053F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0542 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0545 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0548 _ 83. E8, 03
        sub     esp, 4                                  ; 054B _ 83. EC, 04
        push    ebx                                     ; 054E _ 53
        push    ecx                                     ; 054F _ 51
        push    edx                                     ; 0550 _ 52
        push    eax                                     ; 0551 _ 50
        push    7                                       ; 0552 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0554 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0557 _ FF. 75, 08
        call    boxfill8                                ; 055A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 055F _ 83. C4, 20
        nop                                             ; 0562 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0563 _ 8B. 5D, FC
        leave                                           ; 0566 _ C9
        ret                                             ; 0567 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0568 _ 55
        mov     ebp, esp                                ; 0569 _ 89. E5
        sub     esp, 8                                  ; 056B _ 83. EC, 08
        mov     eax, dword [ebp+8H]                     ; 056E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0571 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0574 _ A1, 000000F0(d)
        add     eax, edx                                ; 0579 _ 01. D0
        mov     dword [mx], eax                         ; 057B _ A3, 000000F0(d)
        mov     eax, dword [ebp+8H]                     ; 0580 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0583 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0586 _ A1, 000000F4(d)
        add     eax, edx                                ; 058B _ 01. D0
        mov     dword [my], eax                         ; 058D _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0592 _ A1, 000000F0(d)
        test    eax, eax                                ; 0597 _ 85. C0
        jns     ?_005                                   ; 0599 _ 79, 0A
        mov     dword [mx], 0                           ; 059B _ C7. 05, 000000F0(d), 00000000
?_005:  mov     eax, dword [my]                         ; 05A5 _ A1, 000000F4(d)
        test    eax, eax                                ; 05AA _ 85. C0
        jns     ?_006                                   ; 05AC _ 79, 0A
        mov     dword [my], 0                           ; 05AE _ C7. 05, 000000F4(d), 00000000
?_006:  mov     eax, dword [xsize]                      ; 05B8 _ A1, 000000F8(d)
        lea     edx, [eax-0FH]                          ; 05BD _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 05C0 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 05C5 _ 39. C2
        jg  near      ?_007                                   ; 05c7 _ 7f, 0d
        mov     eax, dword [xsize]                      ; 05C9 _ A1, 000000F8(d)
        sub     eax, 16                                 ; 05CE _ 83. E8, 10
        mov     dword [mx], eax                         ; 05D1 _ A3, 000000F0(d)
?_007:  mov     eax, dword [ysize]                      ; 05D6 _ A1, 000000FC(d)
        lea     edx, [eax-0FH]                          ; 05DB _ 8D. 50, F1
        mov     eax, dword [my]                         ; 05DE _ A1, 000000F4(d)
        cmp     edx, eax                                ; 05E3 _ 39. C2
        jg  near      ?_008                                   ; 05e5 _ 7f, 0d
        mov     eax, dword [ysize]                      ; 05E7 _ A1, 000000FC(d)
        sub     eax, 16                                 ; 05EC _ 83. E8, 10
        mov     dword [my], eax                         ; 05EF _ A3, 000000F4(d)
?_008:  mov     edx, dword [xsize]                      ; 05F4 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 05FA _ A1, 00000100(d)
        sub     esp, 4                                  ; 05FF _ 83. EC, 04
        push    15                                      ; 0602 _ 6A, 0F
        push    79                                      ; 0604 _ 6A, 4F
        push    0                                       ; 0606 _ 6A, 00
        push    0                                       ; 0608 _ 6A, 00
        push    14                                      ; 060A _ 6A, 0E
        push    edx                                     ; 060C _ 52
        push    eax                                     ; 060D _ 50
        call    boxfill8                                ; 060E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0613 _ 83. C4, 20
        mov     edx, dword [xsize]                      ; 0616 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 061C _ A1, 00000100(d)
        sub     esp, 8                                  ; 0621 _ 83. EC, 08
        push    ?_117                                   ; 0624 _ 68, 00000000(d)
        push    7                                       ; 0629 _ 6A, 07
        push    0                                       ; 062B _ 6A, 00
        push    0                                       ; 062D _ 6A, 00
        push    edx                                     ; 062F _ 52
        push    eax                                     ; 0630 _ 50
        call    showString                              ; 0631 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0636 _ 83. C4, 20
        nop                                             ; 0639 _ 90
        leave                                           ; 063A _ C9
        ret                                             ; 063B _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 063C _ 55
        mov     ebp, esp                                ; 063D _ 89. E5
        sub     esp, 24                                 ; 063F _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0642 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0647 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 064A _ C6. 45, F3, 00
        call    io_sti                                  ; 064E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0653 _ 83. EC, 0C
        push    mouseinfo                               ; 0656 _ 68, 00000020(d)
        call    fifo8_get                               ; 065B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0660 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0663 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0666 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 066A _ 83. EC, 08
        push    eax                                     ; 066D _ 50
        push    mdec                                    ; 066E _ 68, 000000E0(d)
        call    mouse_decode                            ; 0673 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0678 _ 83. C4, 10
        test    eax, eax                                ; 067B _ 85. C0
        jz near       ?_009                                   ; 067d _ 74, 2b
        sub     esp, 12                                 ; 067F _ 83. EC, 0C
        push    mdec                                    ; 0682 _ 68, 000000E0(d)
        call    computeMousePosition                    ; 0687 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068C _ 83. C4, 10
        mov     edx, dword [my]                         ; 068F _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0695 _ A1, 000000F0(d)
        push    edx                                     ; 069A _ 52
        push    eax                                     ; 069B _ 50
        push    dword [ebp+0CH]                         ; 069C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 069F _ FF. 75, 08
        call    sheet_slide                             ; 06A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A7 _ 83. C4, 10
?_009:  nop                                             ; 06AA _ 90
        leave                                           ; 06AB _ C9
        ret                                             ; 06AC _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 06AD _ 55
        mov     ebp, esp                                ; 06AE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 06B0 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 06B3 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 06B9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 06BC _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 06C2 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 06C5 _ 66: C7. 40, 06, 00C8
        nop                                             ; 06CB _ 90
        pop     ebp                                     ; 06CC _ 5D
        ret                                             ; 06CD _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 06CE _ 55
        mov     ebp, esp                                ; 06CF _ 89. E5
        sub     esp, 24                                 ; 06D1 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 06D4 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 06D7 _ 88. 45, F4
        jmp     ?_011                                   ; 06DA _ EB, 35

?_010:  mov     eax, dword [ebp+1CH]                    ; 06DC _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06DF _ 8A. 00
        movzx   eax, al                                 ; 06E1 _ 0F B6. C0
        shl     eax, 4                                  ; 06E4 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06E7 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06ED _ 0F BE. 45, F4
        sub     esp, 8                                  ; 06F1 _ 83. EC, 08
        push    edx                                     ; 06F4 _ 52
        push    eax                                     ; 06F5 _ 50
        push    dword [ebp+14H]                         ; 06F6 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06F9 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 06FC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06FF _ FF. 75, 08
        call    showFont8                               ; 0702 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0707 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 070A _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 070E _ FF. 45, 1C
?_011:  mov     eax, dword [ebp+1CH]                    ; 0711 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0714 _ 8A. 00
        test    al, al                                  ; 0716 _ 84. C0
        jnz near      ?_010                                   ; 0718 _ 75, c2
        nop                                             ; 071A _ 90
        nop                                             ; 071B _ 90
        leave                                           ; 071C _ C9
        ret                                             ; 071D _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 071E _ 55
        mov     ebp, esp                                ; 071F _ 89. E5
        sub     esp, 8                                  ; 0721 _ 83. EC, 08
        sub     esp, 4                                  ; 0724 _ 83. EC, 04
        push    table_rgb.1756                          ; 0727 _ 68, 00000020(d)
        push    15                                      ; 072C _ 6A, 0F
        push    0                                       ; 072E _ 6A, 00
        call    set_palette                             ; 0730 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0735 _ 83. C4, 10
        nop                                             ; 0738 _ 90
        leave                                           ; 0739 _ C9
        ret                                             ; 073A _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 073B _ 55
        mov     ebp, esp                                ; 073C _ 89. E5
        sub     esp, 24                                 ; 073E _ 83. EC, 18
        call    io_load_eflags                          ; 0741 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0746 _ 89. 45, F0
        call    io_cli                                  ; 0749 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 074E _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0751 _ FF. 75, 08
        push    968                                     ; 0754 _ 68, 000003C8
        call    io_out8                                 ; 0759 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075E _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0761 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0764 _ 89. 45, F4
        jmp     ?_013                                   ; 0767 _ EB, 5F

?_012:  mov     eax, dword [ebp+10H]                    ; 0769 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 076C _ 8A. 00
        shr     al, 2                                   ; 076E _ C0. E8, 02
        movzx   eax, al                                 ; 0771 _ 0F B6. C0
        sub     esp, 8                                  ; 0774 _ 83. EC, 08
        push    eax                                     ; 0777 _ 50
        push    969                                     ; 0778 _ 68, 000003C9
        call    io_out8                                 ; 077D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0782 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0785 _ 8B. 45, 10
        inc     eax                                     ; 0788 _ 40
        mov     al, byte [eax]                          ; 0789 _ 8A. 00
        shr     al, 2                                   ; 078B _ C0. E8, 02
        movzx   eax, al                                 ; 078E _ 0F B6. C0
        sub     esp, 8                                  ; 0791 _ 83. EC, 08
        push    eax                                     ; 0794 _ 50
        push    969                                     ; 0795 _ 68, 000003C9
        call    io_out8                                 ; 079A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 079F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07A2 _ 8B. 45, 10
        add     eax, 2                                  ; 07A5 _ 83. C0, 02
        mov     al, byte [eax]                          ; 07A8 _ 8A. 00
        shr     al, 2                                   ; 07AA _ C0. E8, 02
        movzx   eax, al                                 ; 07AD _ 0F B6. C0
        sub     esp, 8                                  ; 07B0 _ 83. EC, 08
        push    eax                                     ; 07B3 _ 50
        push    969                                     ; 07B4 _ 68, 000003C9
        call    io_out8                                 ; 07B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07BE _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 07C1 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 07C5 _ FF. 45, F4
?_013:  mov     eax, dword [ebp-0CH]                    ; 07C8 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 07CB _ 3B. 45, 0C
        jle near      ?_012                                   ; 07ce _ 7e, 99
        sub     esp, 12                                 ; 07D0 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 07D3 _ FF. 75, F0
        call    io_store_eflags                         ; 07D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DB _ 83. C4, 10
        nop                                             ; 07DE _ 90
        leave                                           ; 07DF _ C9
        ret                                             ; 07E0 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07E1 _ 55
        mov     ebp, esp                                ; 07E2 _ 89. E5
        sub     esp, 20                                 ; 07E4 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07E7 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07EA _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07ED _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 07F0 _ 89. 45, F8
        jmp     ?_017                                   ; 07F3 _ EB, 30

?_014:  mov     eax, dword [ebp+14H]                    ; 07F5 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 07F8 _ 89. 45, FC
        jmp     ?_016                                   ; 07FB _ EB, 1D

?_015:  mov     eax, dword [ebp-8H]                     ; 07FD _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0800 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0804 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0806 _ 8B. 45, FC
        add     eax, edx                                ; 0809 _ 01. D0
        mov     edx, eax                                ; 080B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 080D _ 8B. 45, 08
        add     edx, eax                                ; 0810 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0812 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0815 _ 88. 02
        inc     dword [ebp-4H]                          ; 0817 _ FF. 45, FC
?_016:  mov     eax, dword [ebp-4H]                     ; 081A _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 081D _ 3B. 45, 1C
        jle near      ?_015                                   ; 0820 _ 7e, db
        inc     dword [ebp-8H]                          ; 0822 _ FF. 45, F8
?_017:  mov     eax, dword [ebp-8H]                     ; 0825 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0828 _ 3B. 45, 20
        jle near      ?_014                                   ; 082b _ 7e, c8
        nop                                             ; 082D _ 90
        nop                                             ; 082E _ 90
        leave                                           ; 082F _ C9
        ret                                             ; 0830 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0831 _ 55
        mov     ebp, esp                                ; 0832 _ 89. E5
        sub     esp, 20                                 ; 0834 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0837 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 083A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 083D _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0844 _ E9, 00000162

?_018:  mov     edx, dword [ebp-4H]                     ; 0849 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 084C _ 8B. 45, 1C
        add     eax, edx                                ; 084F _ 01. D0
        mov     al, byte [eax]                          ; 0851 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0853 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0856 _ 80. 7D, FB, 00
        jns     ?_019                                   ; 085A _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 085C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 085F _ 8B. 45, FC
        add     eax, edx                                ; 0862 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0864 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0868 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 086A _ 8B. 45, 10
        add     eax, edx                                ; 086D _ 01. D0
        mov     edx, eax                                ; 086F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0871 _ 8B. 45, 08
        add     edx, eax                                ; 0874 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0876 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0879 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 087B _ 0F BE. 45, FB
        and     eax, 40H                                ; 087F _ 83. E0, 40
        test    eax, eax                                ; 0882 _ 85. C0
        jz near       ?_020                                   ; 0884 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0886 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0889 _ 8B. 45, FC
        add     eax, edx                                ; 088C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 088E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0892 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0894 _ 8B. 45, 10
        add     eax, edx                                ; 0897 _ 01. D0
        lea     edx, [eax+1H]                           ; 0899 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 089C _ 8B. 45, 08
        add     edx, eax                                ; 089F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08A1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08A4 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08A6 _ 0F BE. 45, FB
        and     eax, 20H                                ; 08AA _ 83. E0, 20
        test    eax, eax                                ; 08AD _ 85. C0
        jz near       ?_021                                   ; 08af _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08B1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08B4 _ 8B. 45, FC
        add     eax, edx                                ; 08B7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08BD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08BF _ 8B. 45, 10
        add     eax, edx                                ; 08C2 _ 01. D0
        lea     edx, [eax+2H]                           ; 08C4 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08C7 _ 8B. 45, 08
        add     edx, eax                                ; 08CA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08CC _ 8A. 45, EC
        mov     byte [edx], al                          ; 08CF _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 08D1 _ 0F BE. 45, FB
        and     eax, 10H                                ; 08D5 _ 83. E0, 10
        test    eax, eax                                ; 08D8 _ 85. C0
        jz near       ?_022                                   ; 08da _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08DC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08DF _ 8B. 45, FC
        add     eax, edx                                ; 08E2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08E4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08EA _ 8B. 45, 10
        add     eax, edx                                ; 08ED _ 01. D0
        lea     edx, [eax+3H]                           ; 08EF _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08F2 _ 8B. 45, 08
        add     edx, eax                                ; 08F5 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08F7 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08FA _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 08FC _ 0F BE. 45, FB
        and     eax, 08H                                ; 0900 _ 83. E0, 08
        test    eax, eax                                ; 0903 _ 85. C0
        jz near       ?_023                                   ; 0905 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0907 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 090A _ 8B. 45, FC
        add     eax, edx                                ; 090D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 090F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0913 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0915 _ 8B. 45, 10
        add     eax, edx                                ; 0918 _ 01. D0
        lea     edx, [eax+4H]                           ; 091A _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 091D _ 8B. 45, 08
        add     edx, eax                                ; 0920 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0922 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0925 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0927 _ 0F BE. 45, FB
        and     eax, 04H                                ; 092B _ 83. E0, 04
        test    eax, eax                                ; 092E _ 85. C0
        jz near       ?_024                                   ; 0930 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0932 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0935 _ 8B. 45, FC
        add     eax, edx                                ; 0938 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 093A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 093E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0940 _ 8B. 45, 10
        add     eax, edx                                ; 0943 _ 01. D0
        lea     edx, [eax+5H]                           ; 0945 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0948 _ 8B. 45, 08
        add     edx, eax                                ; 094B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 094D _ 8A. 45, EC
        mov     byte [edx], al                          ; 0950 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0952 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0956 _ 83. E0, 02
        test    eax, eax                                ; 0959 _ 85. C0
        jz near       ?_025                                   ; 095b _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 095D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0960 _ 8B. 45, FC
        add     eax, edx                                ; 0963 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0965 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0969 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 096B _ 8B. 45, 10
        add     eax, edx                                ; 096E _ 01. D0
        lea     edx, [eax+6H]                           ; 0970 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0973 _ 8B. 45, 08
        add     edx, eax                                ; 0976 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0978 _ 8A. 45, EC
        mov     byte [edx], al                          ; 097B _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 097D _ 0F BE. 45, FB
        and     eax, 01H                                ; 0981 _ 83. E0, 01
        test    eax, eax                                ; 0984 _ 85. C0
        jz near       ?_026                                   ; 0986 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0988 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 098B _ 8B. 45, FC
        add     eax, edx                                ; 098E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0990 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0994 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0996 _ 8B. 45, 10
        add     eax, edx                                ; 0999 _ 01. D0
        lea     edx, [eax+7H]                           ; 099B _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 099E _ 8B. 45, 08
        add     edx, eax                                ; 09A1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09A3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09A6 _ 88. 02
?_026:  inc     dword [ebp-4H]                          ; 09A8 _ FF. 45, FC
?_027:  cmp     dword [ebp-4H], 15                      ; 09AB _ 83. 7D, FC, 0F
        jle near      ?_018                                   ; 09af _ 0f 8e, fffffe94
        nop                                             ; 09B5 _ 90
        nop                                             ; 09B6 _ 90
        leave                                           ; 09B7 _ C9
        ret                                             ; 09B8 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09B9 _ 55
        mov     ebp, esp                                ; 09BA _ 89. E5
        sub     esp, 20                                 ; 09BC _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09BF _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09C2 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09C5 _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 09CC _ E9, 000000AB

?_028:  mov     dword [ebp-4H], 0                       ; 09D1 _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 09D8 _ E9, 00000092

?_029:  mov     eax, dword [ebp-8H]                     ; 09DD _ 8B. 45, F8
        shl     eax, 4                                  ; 09E0 _ C1. E0, 04
        mov     edx, eax                                ; 09E3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09E5 _ 8B. 45, FC
        add     eax, edx                                ; 09E8 _ 01. D0
        add     eax, cursor.1803                        ; 09EA _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 09EF _ 8A. 00
        cmp     al, 42                                  ; 09F1 _ 3C, 2A
        jnz near      ?_030                                   ; 09f3 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 09F5 _ 8B. 45, F8
        shl     eax, 4                                  ; 09F8 _ C1. E0, 04
        mov     edx, eax                                ; 09FB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09FD _ 8B. 45, FC
        add     eax, edx                                ; 0A00 _ 01. D0
        mov     edx, eax                                ; 0A02 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A04 _ 8B. 45, 08
        add     eax, edx                                ; 0A07 _ 01. D0
        mov     byte [eax], 0                           ; 0A09 _ C6. 00, 00
?_030:  mov     eax, dword [ebp-8H]                     ; 0A0C _ 8B. 45, F8
        shl     eax, 4                                  ; 0A0F _ C1. E0, 04
        mov     edx, eax                                ; 0A12 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A14 _ 8B. 45, FC
        add     eax, edx                                ; 0A17 _ 01. D0
        add     eax, cursor.1803                        ; 0A19 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A1E _ 8A. 00
        cmp     al, 79                                  ; 0A20 _ 3C, 4F
        jnz near      ?_031                                   ; 0a22 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A24 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A27 _ C1. E0, 04
        mov     edx, eax                                ; 0A2A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A2C _ 8B. 45, FC
        add     eax, edx                                ; 0A2F _ 01. D0
        mov     edx, eax                                ; 0A31 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A33 _ 8B. 45, 08
        add     eax, edx                                ; 0A36 _ 01. D0
        mov     byte [eax], 7                           ; 0A38 _ C6. 00, 07
?_031:  mov     eax, dword [ebp-8H]                     ; 0A3B _ 8B. 45, F8
        shl     eax, 4                                  ; 0A3E _ C1. E0, 04
        mov     edx, eax                                ; 0A41 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A43 _ 8B. 45, FC
        add     eax, edx                                ; 0A46 _ 01. D0
        add     eax, cursor.1803                        ; 0A48 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A4D _ 8A. 00
        cmp     al, 46                                  ; 0A4F _ 3C, 2E
        jnz near      ?_032                                   ; 0a51 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A53 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A56 _ C1. E0, 04
        mov     edx, eax                                ; 0A59 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A5B _ 8B. 45, FC
        add     eax, edx                                ; 0A5E _ 01. D0
        mov     edx, eax                                ; 0A60 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A62 _ 8B. 45, 08
        add     edx, eax                                ; 0A65 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A67 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A6A _ 88. 02
?_032:  inc     dword [ebp-4H]                          ; 0A6C _ FF. 45, FC
?_033:  cmp     dword [ebp-4H], 15                      ; 0A6F _ 83. 7D, FC, 0F
        jle near      ?_029                                   ; 0a73 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 0A79 _ FF. 45, F8
?_034:  cmp     dword [ebp-8H], 15                      ; 0A7C _ 83. 7D, F8, 0F
        jle near      ?_028                                   ; 0a80 _ 0f 8e, ffffff4b
        nop                                             ; 0A86 _ 90
        nop                                             ; 0A87 _ 90
        leave                                           ; 0A88 _ C9
        ret                                             ; 0A89 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A8A _ 55
        mov     ebp, esp                                ; 0A8B _ 89. E5
        push    ebx                                     ; 0A8D _ 53
        sub     esp, 16                                 ; 0A8E _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0A91 _ C7. 45, F4, 00000000
        jmp     ?_038                                   ; 0A98 _ EB, 4D

?_035:  mov     dword [ebp-8H], 0                       ; 0A9A _ C7. 45, F8, 00000000
        jmp     ?_037                                   ; 0AA1 _ EB, 39

?_036:  mov     eax, dword [ebp-0CH]                    ; 0AA3 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0AA6 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0AAA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AAC _ 8B. 45, F8
        add     eax, edx                                ; 0AAF _ 01. D0
        mov     edx, eax                                ; 0AB1 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0AB3 _ 8B. 45, 20
        add     eax, edx                                ; 0AB6 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0AB8 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0ABB _ 8B. 55, F4
        add     edx, ecx                                ; 0ABE _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0AC0 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0AC4 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0AC7 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0ACA _ 01. D9
        add     edx, ecx                                ; 0ACC _ 01. CA
        mov     ecx, edx                                ; 0ACE _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0AD0 _ 8B. 55, 08
        add     edx, ecx                                ; 0AD3 _ 01. CA
        mov     al, byte [eax]                          ; 0AD5 _ 8A. 00
        mov     byte [edx], al                          ; 0AD7 _ 88. 02
        inc     dword [ebp-8H]                          ; 0AD9 _ FF. 45, F8
?_037:  mov     eax, dword [ebp-8H]                     ; 0ADC _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0ADF _ 3B. 45, 10
        jl      ?_036                                   ; 0AE2 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0AE4 _ FF. 45, F4
?_038:  mov     eax, dword [ebp-0CH]                    ; 0AE7 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0AEA _ 3B. 45, 14
        jl      ?_035                                   ; 0AED _ 7C, AB
        nop                                             ; 0AEF _ 90
        nop                                             ; 0AF0 _ 90
        add     esp, 16                                 ; 0AF1 _ 83. C4, 10
        pop     ebx                                     ; 0AF4 _ 5B
        pop     ebp                                     ; 0AF5 _ 5D
        ret                                             ; 0AF6 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0AF7 _ 55
        mov     ebp, esp                                ; 0AF8 _ 89. E5
        sub     esp, 24                                 ; 0AFA _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AFD _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0B02 _ 89. 45, F4
        mov     eax, dword [?_126]                      ; 0B05 _ A1, 00000004(d)
        cwde                                            ; 0B0A _ 98
        mov     dword [ebp-10H], eax                    ; 0B0B _ 89. 45, F0
        mov     ax, word [?_127]                        ; 0B0E _ 66: A1, 00000006(d)
        cwde                                            ; 0B14 _ 98
        mov     dword [ebp-14H], eax                    ; 0B15 _ 89. 45, EC
        sub     esp, 8                                  ; 0B18 _ 83. EC, 08
        push    32                                      ; 0B1B _ 6A, 20
        push    32                                      ; 0B1D _ 6A, 20
        call    io_out8                                 ; 0B1F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B24 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B27 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B2B _ 83. EC, 0C
        push    96                                      ; 0B2E _ 6A, 60
        call    io_in8                                  ; 0B30 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B35 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B38 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B3B _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B3F _ 83. EC, 08
        push    eax                                     ; 0B42 _ 50
        push    keyinfo                                 ; 0B43 _ 68, 00000008(d)
        call    fifo8_put                               ; 0B48 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4D _ 83. C4, 10
        nop                                             ; 0B50 _ 90
        leave                                           ; 0B51 _ C9
        ret                                             ; 0B52 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B53 _ 55
        mov     ebp, esp                                ; 0B54 _ 89. E5
        sub     esp, 4                                  ; 0B56 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B59 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B5C _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B5F _ 80. 7D, FC, 09
        jle near      ?_039                                   ; 0b63 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 0B65 _ 8A. 45, FC
        add     eax, 55                                 ; 0B68 _ 83. C0, 37
        jmp     ?_040                                   ; 0B6B _ EB, 06

?_039:  mov     al, byte [ebp-4H]                       ; 0B6D _ 8A. 45, FC
        add     eax, 48                                 ; 0B70 _ 83. C0, 30
?_040:  leave                                           ; 0B73 _ C9
        ret                                             ; 0B74 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B75 _ 55
        mov     ebp, esp                                ; 0B76 _ 89. E5
        sub     esp, 20                                 ; 0B78 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B7B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B7E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B81 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0B88 _ 8A. 45, EC
        and     eax, 0FH                                ; 0B8B _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B8E _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B91 _ 0F BE. 45, FB
        push    eax                                     ; 0B95 _ 50
        call    charToHexVal                            ; 0B96 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B9B _ 83. C4, 04
        mov     byte [?_125], al                        ; 0B9E _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0BA3 _ 8A. 45, EC
        shr     al, 4                                   ; 0BA6 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0BA9 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0BAC _ 8A. 45, EC
        movsx   eax, al                                 ; 0BAF _ 0F BE. C0
        push    eax                                     ; 0BB2 _ 50
        call    charToHexVal                            ; 0BB3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BB8 _ 83. C4, 04
        mov     byte [?_124], al                        ; 0BBB _ A2, 00000006(d)
        mov     eax, keyval                             ; 0BC0 _ B8, 00000004(d)
        leave                                           ; 0BC5 _ C9
        ret                                             ; 0BC6 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BC7 _ 55
        mov     ebp, esp                                ; 0BC8 _ 89. E5
        sub     esp, 16                                 ; 0BCA _ 83. EC, 10
        mov     byte [str.1851], 48                     ; 0BCD _ C6. 05, 00000220(d), 30
        mov     byte [?_128], 88                        ; 0BD4 _ C6. 05, 00000221(d), 58
        mov     byte [?_129], 0                         ; 0BDB _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-4H], 2                       ; 0BE2 _ C7. 45, FC, 00000002
        jmp     ?_042                                   ; 0BE9 _ EB, 0E

?_041:  mov     eax, dword [ebp-4H]                     ; 0BEB _ 8B. 45, FC
        add     eax, str.1851                           ; 0BEE _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0BF3 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0BF6 _ FF. 45, FC
?_042:  cmp     dword [ebp-4H], 9                       ; 0BF9 _ 83. 7D, FC, 09
        jle near      ?_041                                   ; 0bfd _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 0BFF _ C7. 45, F8, 00000009
        jmp     ?_046                                   ; 0C06 _ EB, 41

?_043:  mov     eax, dword [ebp+8H]                     ; 0C08 _ 8B. 45, 08
        and     eax, 0FH                                ; 0C0B _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C0E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C11 _ 8B. 45, 08
        shr     eax, 4                                  ; 0C14 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C17 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C1A _ 83. 7D, F4, 09
        jle near      ?_044                                   ; 0c1e _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 0C20 _ 8B. 45, F4
        add     eax, 55                                 ; 0C23 _ 83. C0, 37
        mov     dl, al                                  ; 0C26 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C28 _ 8B. 45, F8
        add     eax, str.1851                           ; 0C2B _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C30 _ 88. 10
        jmp     ?_045                                   ; 0C32 _ EB, 12

?_044:  mov     eax, dword [ebp-0CH]                    ; 0C34 _ 8B. 45, F4
        add     eax, 48                                 ; 0C37 _ 83. C0, 30
        mov     dl, al                                  ; 0C3A _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C3C _ 8B. 45, F8
        add     eax, str.1851                           ; 0C3F _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C44 _ 88. 10
?_045:  dec     dword [ebp-8H]                          ; 0C46 _ FF. 4D, F8
?_046:  cmp     dword [ebp-8H], 1                       ; 0C49 _ 83. 7D, F8, 01
        jle near      ?_047                                   ; 0c4d _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0C4F _ 83. 7D, 08, 00
        jnz near      ?_043                                   ; 0c53 _ 75, b3
?_047:  mov     eax, str.1851                           ; 0C55 _ B8, 00000220(d)
        leave                                           ; 0C5A _ C9
        ret                                             ; 0C5B _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C5C _ 55
        mov     ebp, esp                                ; 0C5D _ 89. E5
        sub     esp, 8                                  ; 0C5F _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0C62 _ 83. EC, 0C
        push    100                                     ; 0C65 _ 6A, 64
        call    io_in8                                  ; 0C67 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C6C _ 83. C4, 10
        and     eax, 02H                                ; 0C6F _ 83. E0, 02
        test    eax, eax                                ; 0C72 _ 85. C0
        jz near       ?_049                                   ; 0c74 _ 74, 02
        jmp     ?_048                                   ; 0C76 _ EB, EA

?_049:  nop                                             ; 0C78 _ 90
        nop                                             ; 0C79 _ 90
        leave                                           ; 0C7A _ C9
        ret                                             ; 0C7B _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C7C _ 55
        mov     ebp, esp                                ; 0C7D _ 89. E5
        sub     esp, 8                                  ; 0C7F _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C82 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C87 _ 83. EC, 08
        push    96                                      ; 0C8A _ 6A, 60
        push    100                                     ; 0C8C _ 6A, 64
        call    io_out8                                 ; 0C8E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C93 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C96 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C9B _ 83. EC, 08
        push    71                                      ; 0C9E _ 6A, 47
        push    96                                      ; 0CA0 _ 6A, 60
        call    io_out8                                 ; 0CA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA7 _ 83. C4, 10
        nop                                             ; 0CAA _ 90
        leave                                           ; 0CAB _ C9
        ret                                             ; 0CAC _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CAD _ 55
        mov     ebp, esp                                ; 0CAE _ 89. E5
        sub     esp, 8                                  ; 0CB0 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CB3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CB8 _ 83. EC, 08
        push    212                                     ; 0CBB _ 68, 000000D4
        push    100                                     ; 0CC0 _ 6A, 64
        call    io_out8                                 ; 0CC2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CC7 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CCA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CCF _ 83. EC, 08
        push    244                                     ; 0CD2 _ 68, 000000F4
        push    96                                      ; 0CD7 _ 6A, 60
        call    io_out8                                 ; 0CD9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CDE _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CE1 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CE4 _ C6. 40, 03, 00
        nop                                             ; 0CE8 _ 90
        leave                                           ; 0CE9 _ C9
        ret                                             ; 0CEA _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CEB _ 55
        mov     ebp, esp                                ; 0CEC _ 89. E5
        sub     esp, 24                                 ; 0CEE _ 83. EC, 18
        sub     esp, 8                                  ; 0CF1 _ 83. EC, 08
        push    32                                      ; 0CF4 _ 6A, 20
        push    160                                     ; 0CF6 _ 68, 000000A0
        call    io_out8                                 ; 0CFB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D00 _ 83. C4, 10
        sub     esp, 8                                  ; 0D03 _ 83. EC, 08
        push    32                                      ; 0D06 _ 6A, 20
        push    32                                      ; 0D08 _ 6A, 20
        call    io_out8                                 ; 0D0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D0F _ 83. C4, 10
        sub     esp, 12                                 ; 0D12 _ 83. EC, 0C
        push    96                                      ; 0D15 _ 6A, 60
        call    io_in8                                  ; 0D17 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D1C _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D1F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D22 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D26 _ 83. EC, 08
        push    eax                                     ; 0D29 _ 50
        push    mouseinfo                               ; 0D2A _ 68, 00000020(d)
        call    fifo8_put                               ; 0D2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D34 _ 83. C4, 10
        nop                                             ; 0D37 _ 90
        leave                                           ; 0D38 _ C9
        ret                                             ; 0D39 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D3A _ 55
        mov     ebp, esp                                ; 0D3B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D3D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D40 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D43 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D46 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D49 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D4C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D4E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D51 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D54 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D5A _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D61 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D64 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D6B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D6E _ C7. 40, 08, 00000000
        nop                                             ; 0D75 _ 90
        pop     ebp                                     ; 0D76 _ 5D
        ret                                             ; 0D77 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D78 _ 55
        mov     ebp, esp                                ; 0D79 _ 89. E5
        sub     esp, 4                                  ; 0D7B _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D7E _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D81 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D84 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D87 _ 8B. 40, 10
        test    eax, eax                                ; 0D8A _ 85. C0
        jnz near      ?_050                                   ; 0d8c _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D8E _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D91 _ 8B. 40, 14
        or      eax, 01H                                ; 0D94 _ 83. C8, 01
        mov     edx, eax                                ; 0D97 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D99 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D9C _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D9F _ B8, FFFFFFFF
        jmp     ?_052                                   ; 0DA4 _ EB, 4F

?_050:  mov     eax, dword [ebp+8H]                     ; 0DA6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DA9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DAB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DAE _ 8B. 40, 04
        add     edx, eax                                ; 0DB1 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0DB3 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0DB6 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0DB8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DBB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0DBE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DC1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DC4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DC7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DCA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DCD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DD0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DD3 _ 39. C2
        jnz near      ?_051                                   ; 0dd5 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0DD7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DDA _ C7. 40, 04, 00000000
?_051:  mov     eax, dword [ebp+8H]                     ; 0DE1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DE4 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DE7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DEA _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DED _ 89. 50, 10
        mov     eax, 0                                  ; 0DF0 _ B8, 00000000
?_052:  leave                                           ; 0DF5 _ C9
        ret                                             ; 0DF6 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0DF7 _ 55
        mov     ebp, esp                                ; 0DF8 _ 89. E5
        sub     esp, 16                                 ; 0DFA _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0DFD _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E00 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E03 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E06 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E09 _ 39. C2
        jnz near      ?_053                                   ; 0e0b _ 75, 07
        mov     eax, 4294967295                         ; 0E0D _ B8, FFFFFFFF
        jmp     ?_055                                   ; 0E12 _ EB, 50

?_053:  mov     eax, dword [ebp+8H]                     ; 0E14 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E17 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E19 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E1C _ 8B. 40, 08
        add     eax, edx                                ; 0E1F _ 01. D0
        mov     al, byte [eax]                          ; 0E21 _ 8A. 00
        movzx   eax, al                                 ; 0E23 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E26 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E29 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E2C _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E2F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E32 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E35 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E3B _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E3E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E41 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E44 _ 39. C2
        jnz near      ?_054                                   ; 0e46 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0E48 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E4B _ C7. 40, 08, 00000000
?_054:  mov     eax, dword [ebp+8H]                     ; 0E52 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E55 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E58 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E5B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E5E _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E61 _ 8B. 45, FC
?_055:  leave                                           ; 0E64 _ C9
        ret                                             ; 0E65 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E66 _ 55
        mov     ebp, esp                                ; 0E67 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E69 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E6C _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E6F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E72 _ 8B. 40, 10
        sub     edx, eax                                ; 0E75 _ 29. C2
        mov     eax, edx                                ; 0E77 _ 89. D0
        pop     ebp                                     ; 0E79 _ 5D
        ret                                             ; 0E7A _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E7B _ 55
        mov     ebp, esp                                ; 0E7C _ 89. E5
        sub     esp, 4                                  ; 0E7E _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E81 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E84 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E87 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E8A _ 8A. 40, 03
        test    al, al                                  ; 0E8D _ 84. C0
        jnz near      ?_057                                   ; 0e8f _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E91 _ 80. 7D, FC, FA
        jnz near      ?_056                                   ; 0e95 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E97 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E9A _ C6. 40, 03, 01
?_056:  mov     eax, 0                                  ; 0E9E _ B8, 00000000
        jmp     ?_064                                   ; 0EA3 _ E9, 00000104

?_057:  mov     eax, dword [ebp+8H]                     ; 0EA8 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EAB _ 8A. 40, 03
        cmp     al, 1                                   ; 0EAE _ 3C, 01
        jnz near      ?_059                                   ; 0eb0 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0EB2 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EB6 _ 25, 000000C8
        cmp     eax, 8                                  ; 0EBB _ 83. F8, 08
        jnz near      ?_058                                   ; 0ebe _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 0EC0 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EC3 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0EC6 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0EC8 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0ECB _ C6. 40, 03, 02
?_058:  mov     eax, 0                                  ; 0ECF _ B8, 00000000
        jmp     ?_064                                   ; 0ED4 _ E9, 000000D3

?_059:  mov     eax, dword [ebp+8H]                     ; 0ED9 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EDC _ 8A. 40, 03
        cmp     al, 2                                   ; 0EDF _ 3C, 02
        jnz near      ?_060                                   ; 0ee1 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 0EE3 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EE6 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0EE9 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EEC _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EEF _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0EF3 _ B8, 00000000
        jmp     ?_064                                   ; 0EF8 _ E9, 000000AF

?_060:  mov     eax, dword [ebp+8H]                     ; 0EFD _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F00 _ 8A. 40, 03
        cmp     al, 3                                   ; 0F03 _ 3C, 03
        jne near      ?_063                                   ; 0f05 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 0F0B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F0E _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F11 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F14 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F17 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F1B _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F1E _ 8A. 00
        movzx   eax, al                                 ; 0F20 _ 0F B6. C0
        and     eax, 07H                                ; 0F23 _ 83. E0, 07
        mov     edx, eax                                ; 0F26 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F28 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F2B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F2E _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0F31 _ 8A. 40, 01
        movzx   edx, al                                 ; 0F34 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F37 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F3A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F3D _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0F40 _ 8A. 40, 02
        movzx   edx, al                                 ; 0F43 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F46 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F49 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F4C _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F4F _ 8A. 00
        movzx   eax, al                                 ; 0F51 _ 0F B6. C0
        and     eax, 10H                                ; 0F54 _ 83. E0, 10
        test    eax, eax                                ; 0F57 _ 85. C0
        jz near       ?_061                                   ; 0f59 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F5B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F5E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F61 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F66 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F68 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F6B _ 89. 50, 04
?_061:  mov     eax, dword [ebp+8H]                     ; 0F6E _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F71 _ 8A. 00
        movzx   eax, al                                 ; 0F73 _ 0F B6. C0
        and     eax, 20H                                ; 0F76 _ 83. E0, 20
        test    eax, eax                                ; 0F79 _ 85. C0
        jz near       ?_062                                   ; 0f7b _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F7D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F80 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F83 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F88 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F8A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F8D _ 89. 50, 08
?_062:  mov     eax, dword [ebp+8H]                     ; 0F90 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F93 _ 8B. 40, 08
        neg     eax                                     ; 0F96 _ F7. D8
        mov     edx, eax                                ; 0F98 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F9A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F9D _ 89. 50, 08
        mov     eax, 1                                  ; 0FA0 _ B8, 00000001
        jmp     ?_064                                   ; 0FA5 _ EB, 05

?_063:  mov     eax, 4294967295                         ; 0FA7 _ B8, FFFFFFFF
?_064:  leave                                           ; 0FAC _ C9
        ret                                             ; 0FAD _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FAE _ 55
        mov     ebp, esp                                ; 0FAF _ 89. E5
        sub     esp, 56                                 ; 0FB1 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0FB4 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0FBB _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0FC2 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0FC9 _ C7. 45, E8, 00000050
        push    100                                     ; 0FD0 _ 6A, 64
        push    dword [ebp+14H]                         ; 0FD2 _ FF. 75, 14
        push    0                                       ; 0FD5 _ 6A, 00
        push    0                                       ; 0FD7 _ 6A, 00
        push    14                                      ; 0FD9 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FDB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FDE _ FF. 75, 0C
        call    boxfill8                                ; 0FE1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FE6 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FE9 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FEC _ 0F BE. C0
        sub     esp, 8                                  ; 0FEF _ 83. EC, 08
        push    ?_118                                   ; 0FF2 _ 68, 0000000B(d)
        push    eax                                     ; 0FF7 _ 50
        push    dword [ebp-10H]                         ; 0FF8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0FFB _ FF. 75, F4
        push    dword [ebp+14H]                         ; 0FFE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1001 _ FF. 75, 0C
        call    showString                              ; 1004 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1009 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 100C _ 8B. 45, 10
        sub     esp, 12                                 ; 100F _ 83. EC, 0C
        push    eax                                     ; 1012 _ 50
        call    intToHexStr                             ; 1013 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1018 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 101B _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 101E _ 8B. 45, 18
        movsx   eax, al                                 ; 1021 _ 0F BE. C0
        sub     esp, 8                                  ; 1024 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1027 _ FF. 75, E4
        push    eax                                     ; 102A _ 50
        push    dword [ebp-10H]                         ; 102B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 102E _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1031 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1034 _ FF. 75, 0C
        call    showString                              ; 1037 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 103C _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 103F _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1043 _ 8B. 45, 18
        movsx   eax, al                                 ; 1046 _ 0F BE. C0
        sub     esp, 8                                  ; 1049 _ 83. EC, 08
        push    ?_119                                   ; 104C _ 68, 00000015(d)
        push    eax                                     ; 1051 _ 50
        push    dword [ebp-10H]                         ; 1052 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1055 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1058 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 105B _ FF. 75, 0C
        call    showString                              ; 105E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1063 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1066 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1069 _ 8B. 00
        sub     esp, 12                                 ; 106B _ 83. EC, 0C
        push    eax                                     ; 106E _ 50
        call    intToHexStr                             ; 106F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1074 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1077 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 107A _ 8B. 45, 18
        movsx   eax, al                                 ; 107D _ 0F BE. C0
        sub     esp, 8                                  ; 1080 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1083 _ FF. 75, E0
        push    eax                                     ; 1086 _ 50
        push    dword [ebp-10H]                         ; 1087 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 108A _ FF. 75, EC
        push    dword [ebp+14H]                         ; 108D _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1090 _ FF. 75, 0C
        call    showString                              ; 1093 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1098 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 109B _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 109F _ 8B. 45, 18
        movsx   eax, al                                 ; 10A2 _ 0F BE. C0
        sub     esp, 8                                  ; 10A5 _ 83. EC, 08
        push    ?_120                                   ; 10A8 _ 68, 00000021(d)
        push    eax                                     ; 10AD _ 50
        push    dword [ebp-10H]                         ; 10AE _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10B1 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 10B4 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10B7 _ FF. 75, 0C
        call    showString                              ; 10BA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10BF _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10C2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10C5 _ 8B. 40, 04
        sub     esp, 12                                 ; 10C8 _ 83. EC, 0C
        push    eax                                     ; 10CB _ 50
        call    intToHexStr                             ; 10CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10D1 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 10D4 _ 89. 45, DC
        mov     eax, dword [ebp+18H]                    ; 10D7 _ 8B. 45, 18
        movsx   eax, al                                 ; 10DA _ 0F BE. C0
        sub     esp, 8                                  ; 10DD _ 83. EC, 08
        push    dword [ebp-24H]                         ; 10E0 _ FF. 75, DC
        push    eax                                     ; 10E3 _ 50
        push    dword [ebp-10H]                         ; 10E4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10E7 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 10EA _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10ED _ FF. 75, 0C
        call    showString                              ; 10F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10F5 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10F8 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 10FC _ 8B. 45, 18
        movsx   eax, al                                 ; 10FF _ 0F BE. C0
        sub     esp, 8                                  ; 1102 _ 83. EC, 08
        push    ?_121                                   ; 1105 _ 68, 0000002D(d)
        push    eax                                     ; 110A _ 50
        push    dword [ebp-10H]                         ; 110B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 110E _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1111 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1114 _ FF. 75, 0C
        call    showString                              ; 1117 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 111C _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 111F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1122 _ 8B. 40, 08
        sub     esp, 12                                 ; 1125 _ 83. EC, 0C
        push    eax                                     ; 1128 _ 50
        call    intToHexStr                             ; 1129 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 112E _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1131 _ 89. 45, D8
        mov     eax, dword [ebp+18H]                    ; 1134 _ 8B. 45, 18
        movsx   eax, al                                 ; 1137 _ 0F BE. C0
        sub     esp, 8                                  ; 113A _ 83. EC, 08
        push    dword [ebp-28H]                         ; 113D _ FF. 75, D8
        push    eax                                     ; 1140 _ 50
        push    dword [ebp-10H]                         ; 1141 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1144 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1147 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 114A _ FF. 75, 0C
        call    showString                              ; 114D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1152 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1155 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1159 _ 8B. 45, 18
        movsx   eax, al                                 ; 115C _ 0F BE. C0
        sub     esp, 8                                  ; 115F _ 83. EC, 08
        push    ?_122                                   ; 1162 _ 68, 00000039(d)
        push    eax                                     ; 1167 _ 50
        push    dword [ebp-10H]                         ; 1168 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 116B _ FF. 75, F4
        push    dword [ebp+14H]                         ; 116E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1171 _ FF. 75, 0C
        call    showString                              ; 1174 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1179 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 117C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 117F _ 8B. 40, 0C
        sub     esp, 12                                 ; 1182 _ 83. EC, 0C
        push    eax                                     ; 1185 _ 50
        call    intToHexStr                             ; 1186 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 118B _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 118E _ 89. 45, D4
        mov     eax, dword [ebp+18H]                    ; 1191 _ 8B. 45, 18
        movsx   eax, al                                 ; 1194 _ 0F BE. C0
        sub     esp, 8                                  ; 1197 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 119A _ FF. 75, D4
        push    eax                                     ; 119D _ 50
        push    dword [ebp-10H]                         ; 119E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11A1 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 11A4 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11A7 _ FF. 75, 0C
        call    showString                              ; 11AA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11AF _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11B2 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 11B6 _ 8B. 45, 18
        movsx   eax, al                                 ; 11B9 _ 0F BE. C0
        sub     esp, 8                                  ; 11BC _ 83. EC, 08
        push    ?_123                                   ; 11BF _ 68, 00000046(d)
        push    eax                                     ; 11C4 _ 50
        push    dword [ebp-10H]                         ; 11C5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11C8 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 11CB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11CE _ FF. 75, 0C
        call    showString                              ; 11D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11D6 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11D9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11DC _ 8B. 40, 10
        sub     esp, 12                                 ; 11DF _ 83. EC, 0C
        push    eax                                     ; 11E2 _ 50
        call    intToHexStr                             ; 11E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11E8 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 11EB _ 89. 45, D0
        mov     eax, dword [ebp+18H]                    ; 11EE _ 8B. 45, 18
        movsx   eax, al                                 ; 11F1 _ 0F BE. C0
        sub     esp, 8                                  ; 11F4 _ 83. EC, 08
        push    dword [ebp-30H]                         ; 11F7 _ FF. 75, D0
        push    eax                                     ; 11FA _ 50
        push    dword [ebp-10H]                         ; 11FB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11FE _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1201 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1204 _ FF. 75, 0C
        call    showString                              ; 1207 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 120C _ 83. C4, 20
        nop                                             ; 120F _ 90
        leave                                           ; 1210 _ C9
        ret                                             ; 1211 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 1212 _ 55
        mov     ebp, esp                                ; 1213 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1215 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1218 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 121E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1221 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1228 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 122B _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1232 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1235 _ C7. 40, 0C, 00000000
        nop                                             ; 123C _ 90
        pop     ebp                                     ; 123D _ 5D
        ret                                             ; 123E _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 123F _ 55
        mov     ebp, esp                                ; 1240 _ 89. E5
        sub     esp, 16                                 ; 1242 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1245 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 124C _ C7. 45, FC, 00000000
        jmp     ?_066                                   ; 1253 _ EB, 13

?_065:  mov     eax, dword [ebp+8H]                     ; 1255 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1258 _ 8B. 55, FC
        add     edx, 2                                  ; 125B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 125E _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1262 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1265 _ FF. 45, FC
?_066:  mov     eax, dword [ebp+8H]                     ; 1268 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 126B _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 126D _ 39. 45, FC
        jc near       ?_065                                   ; 1270 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1272 _ 8B. 45, F8
        leave                                           ; 1275 _ C9
        ret                                             ; 1276 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1277 _ 55
        mov     ebp, esp                                ; 1278 _ 89. E5
        sub     esp, 16                                 ; 127A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 127D _ C7. 45, FC, 00000000
        jmp     ?_070                                   ; 1284 _ E9, 00000084

?_067:  mov     eax, dword [ebp+8H]                     ; 1289 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 128C _ 8B. 55, FC
        add     edx, 2                                  ; 128F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1292 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1296 _ 39. 45, 0C
        ja      ?_069                                   ; 1299 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 129B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 129E _ 8B. 55, FC
        add     edx, 2                                  ; 12A1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12A4 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 12A7 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 12AA _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12AD _ 8B. 55, FC
        add     edx, 2                                  ; 12B0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 12B3 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 12B6 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 12B9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 12BC _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12BF _ 8B. 55, FC
        add     edx, 2                                  ; 12C2 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 12C5 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 12C8 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12CB _ 8B. 55, FC
        add     edx, 2                                  ; 12CE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12D1 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 12D5 _ 2B. 45, 0C
        mov     edx, eax                                ; 12D8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12DA _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 12DD _ 8B. 4D, FC
        add     ecx, 2                                  ; 12E0 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12E3 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12E7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12EA _ 8B. 55, FC
        add     edx, 2                                  ; 12ED _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12F0 _ 8B. 44 D0, 04
        test    eax, eax                                ; 12F4 _ 85. C0
        jnz near      ?_068                                   ; 12f6 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 12F8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12FB _ 8B. 00
        lea     edx, [eax-1H]                           ; 12FD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1300 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1303 _ 89. 10
?_068:  mov     eax, dword [ebp-8H]                     ; 1305 _ 8B. 45, F8
        jmp     ?_071                                   ; 1308 _ EB, 16

?_069:  inc     dword [ebp-4H]                          ; 130A _ FF. 45, FC
?_070:  mov     eax, dword [ebp+8H]                     ; 130D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1310 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1312 _ 39. 45, FC
        jc near       ?_067                                   ; 1315 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 131B _ B8, 00000000
?_071:  leave                                           ; 1320 _ C9
        ret                                             ; 1321 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1322 _ 55
        mov     ebp, esp                                ; 1323 _ 89. E5
        push    ebx                                     ; 1325 _ 53
        sub     esp, 16                                 ; 1326 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1329 _ C7. 45, F8, 00000000
        jmp     ?_073                                   ; 1330 _ EB, 14

?_072:  mov     eax, dword [ebp+8H]                     ; 1332 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1335 _ 8B. 55, F8
        add     edx, 2                                  ; 1338 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 133B _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 133E _ 39. 45, 0C
        jc near       ?_074                                   ; 1341 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1343 _ FF. 45, F8
?_073:  mov     eax, dword [ebp+8H]                     ; 1346 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1349 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 134B _ 39. 45, F8
        jl      ?_072                                   ; 134E _ 7C, E2
        jmp     ?_075                                   ; 1350 _ EB, 01

?_074:  nop                                             ; 1352 _ 90
?_075:  cmp     dword [ebp-8H], 0                       ; 1353 _ 83. 7D, F8, 00
        jle near      ?_077                                   ; 1357 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 135D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1360 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1363 _ 8B. 45, 08
        add     edx, 2                                  ; 1366 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1369 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 136C _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 136F _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1372 _ 8B. 45, 08
        add     ecx, 2                                  ; 1375 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1378 _ 8B. 44 C8, 04
        add     eax, edx                                ; 137C _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 137E _ 39. 45, 0C
        jne near      ?_077                                   ; 1381 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1387 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 138A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 138D _ 8B. 45, 08
        add     edx, 2                                  ; 1390 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1393 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1397 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 139A _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 139D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13A0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13A3 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13A6 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13A9 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13AD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13B0 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 13B2 _ 39. 45, F8
        jge near      ?_076                                   ; 13b5 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 13B7 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13BA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13BD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13C0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 13C3 _ 8B. 55, F8
        add     edx, 2                                  ; 13C6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13C9 _ 8B. 04 D0
        cmp     ecx, eax                                ; 13CC _ 39. C1
        jnz near      ?_076                                   ; 13ce _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 13D0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 13D3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13D6 _ 8B. 45, 08
        add     edx, 2                                  ; 13D9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13DC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13E0 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 13E3 _ 8B. 4D, F8
        add     ecx, 2                                  ; 13E6 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13E9 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 13ED _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 13F0 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 13F3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13F6 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13F9 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13FC _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1400 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1403 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1405 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1408 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 140B _ 89. 10
?_076:  mov     eax, 0                                  ; 140D _ B8, 00000000
        jmp     ?_083                                   ; 1412 _ E9, 0000011B

?_077:  mov     eax, dword [ebp+8H]                     ; 1417 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 141A _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 141C _ 39. 45, F8
        jge near      ?_078                                   ; 141f _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1421 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1424 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1427 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 142A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 142D _ 8B. 55, F8
        add     edx, 2                                  ; 1430 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1433 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1436 _ 39. C1
        jnz near      ?_078                                   ; 1438 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 143A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 143D _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1440 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1443 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1446 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1449 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 144C _ 8B. 55, F8
        add     edx, 2                                  ; 144F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1452 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1456 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1459 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 145C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 145F _ 8B. 55, F8
        add     edx, 2                                  ; 1462 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1465 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1469 _ B8, 00000000
        jmp     ?_083                                   ; 146E _ E9, 000000BF

?_078:  mov     eax, dword [ebp+8H]                     ; 1473 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1476 _ 8B. 00
        cmp     eax, 4095                               ; 1478 _ 3D, 00000FFF
        jg  near      ?_082                                   ; 147d _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1483 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1486 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1488 _ 89. 45, F4
        jmp     ?_080                                   ; 148B _ EB, 27

?_079:  mov     eax, dword [ebp-0CH]                    ; 148D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1490 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1493 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1496 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1499 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 149C _ 8B. 45, 08
        add     edx, 2                                  ; 149F _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 14A2 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 14A5 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 14A7 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 14AA _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 14AD _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 14B1 _ FF. 4D, F4
?_080:  mov     eax, dword [ebp-0CH]                    ; 14B4 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 14B7 _ 3B. 45, F8
        jg  near      ?_079                                   ; 14ba _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 14BC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14BF _ 8B. 00
        lea     edx, [eax+1H]                           ; 14C1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14C4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 14C7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 14C9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 14CC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14CF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14D2 _ 8B. 00
        cmp     edx, eax                                ; 14D4 _ 39. C2
        jge near      ?_081                                   ; 14d6 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 14D8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 14DB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14DD _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14E0 _ 89. 50, 04
?_081:  mov     eax, dword [ebp+8H]                     ; 14E3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14E6 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14E9 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14EC _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14EF _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 14F2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14F5 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14F8 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 14FB _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 14FE _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1502 _ B8, 00000000
        jmp     ?_083                                   ; 1507 _ EB, 29

?_082:  mov     eax, dword [ebp+8H]                     ; 1509 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 150C _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 150F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1512 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1515 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1518 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 151B _ 8B. 40, 08
        mov     edx, eax                                ; 151E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1520 _ 8B. 45, 10
        add     eax, edx                                ; 1523 _ 01. D0
        mov     edx, eax                                ; 1525 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1527 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 152A _ 89. 50, 08
        mov     eax, 4294967295                         ; 152D _ B8, FFFFFFFF
?_083:  add     esp, 16                                 ; 1532 _ 83. C4, 10
        pop     ebx                                     ; 1535 _ 5B
        pop     ebp                                     ; 1536 _ 5D
        ret                                             ; 1537 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1538 _ 55
        mov     ebp, esp                                ; 1539 _ 89. E5
        sub     esp, 16                                 ; 153B _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 153E _ 8B. 45, 0C
        add     eax, 4095                               ; 1541 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1546 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 154B _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 154E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1551 _ FF. 75, 08
        call    memman_alloc                            ; 1554 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1559 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 155C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 155F _ 8B. 45, FC
        leave                                           ; 1562 _ C9
        ret                                             ; 1563 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1564 _ 55
        mov     ebp, esp                                ; 1565 _ 89. E5
        sub     esp, 16                                 ; 1567 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 156A _ 8B. 45, 10
        add     eax, 4095                               ; 156D _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1572 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1577 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 157A _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 157D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1580 _ FF. 75, 08
        call    memman_free                             ; 1583 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1588 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 158B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 158E _ 8B. 45, FC
        leave                                           ; 1591 _ C9
        ret                                             ; 1592 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1593 _ 55
        mov     ebp, esp                                ; 1594 _ 89. E5
        sub     esp, 24                                 ; 1596 _ 83. EC, 18
        sub     esp, 8                                  ; 1599 _ 83. EC, 08
        push    9232                                    ; 159C _ 68, 00002410
        push    dword [ebp+8H]                          ; 15A1 _ FF. 75, 08
        call    memman_alloc_4k                         ; 15A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15A9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 15AC _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 15AF _ 83. 7D, F0, 00
        jnz near      ?_084                                   ; 15b3 _ 75, 07
        mov     eax, 0                                  ; 15B5 _ B8, 00000000
        jmp     ?_087                                   ; 15BA _ EB, 53

?_084:  mov     eax, dword [ebp-10H]                    ; 15BC _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 15BF _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 15C2 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 15C4 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 15C7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 15CA _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 15CD _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 15D0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 15D3 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 15D6 _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 15D9 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 15E0 _ C7. 45, F4, 00000000
        jmp     ?_086                                   ; 15E7 _ EB, 1A

?_085:  mov     eax, dword [ebp-10H]                    ; 15E9 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 15EC _ 8B. 55, F4
        add     edx, 33                                 ; 15EF _ 83. C2, 21
        shl     edx, 5                                  ; 15F2 _ C1. E2, 05
        add     eax, edx                                ; 15F5 _ 01. D0
        add     eax, 12                                 ; 15F7 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 15FA _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1600 _ FF. 45, F4
?_086:  cmp     dword [ebp-0CH], 255                    ; 1603 _ 81. 7D, F4, 000000FF
        jle near      ?_085                                   ; 160a _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 160C _ 8B. 45, F0
?_087:  leave                                           ; 160F _ C9
        ret                                             ; 1610 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1611 _ 55
        mov     ebp, esp                                ; 1612 _ 89. E5
        sub     esp, 16                                 ; 1614 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1617 _ C7. 45, FC, 00000000
        jmp     ?_090                                   ; 161E _ EB, 56

?_088:  mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1623 _ 8B. 55, FC
        add     edx, 33                                 ; 1626 _ 83. C2, 21
        shl     edx, 5                                  ; 1629 _ C1. E2, 05
        add     eax, edx                                ; 162C _ 01. D0
        add     eax, 12                                 ; 162E _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1631 _ 8B. 00
        test    eax, eax                                ; 1633 _ 85. C0
        jnz near      ?_089                                   ; 1635 _ 75, 3c
        mov     eax, dword [ebp-4H]                     ; 1637 _ 8B. 45, FC
        shl     eax, 5                                  ; 163A _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 163D _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1643 _ 8B. 45, 08
        add     eax, edx                                ; 1646 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1648 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 164B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 164E _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1651 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1654 _ 8B. 55, F8
        mov     dword [eax+ecx*4], edx                  ; 1657 _ 89. 14 88
        mov     eax, dword [ebp-8H]                     ; 165A _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 165D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1664 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1667 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 166E _ 8B. 45, F8
        jmp     ?_091                                   ; 1671 _ EB, 11

?_089:  inc     dword [ebp-4H]                          ; 1673 _ FF. 45, FC
?_090:  cmp     dword [ebp-4H], 255                     ; 1676 _ 81. 7D, FC, 000000FF
        jle near      ?_088                                   ; 167d _ 7e, a1
        mov     eax, 0                                  ; 167F _ B8, 00000000
?_091:  leave                                           ; 1684 _ C9
        ret                                             ; 1685 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1686 _ 55
        mov     ebp, esp                                ; 1687 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1689 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 168C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 168F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1691 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1694 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1697 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 169A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 169D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 16A0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 16A3 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 16A6 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 16A9 _ 89. 50, 14
        nop                                             ; 16AC _ 90
        pop     ebp                                     ; 16AD _ 5D
        ret                                             ; 16AE _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 16AF _ 55
        mov     ebp, esp                                ; 16B0 _ 89. E5
        sub     esp, 24                                 ; 16B2 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 16B5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 16B8 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 16BB _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 16BE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16C1 _ 8B. 40, 0C
        inc     eax                                     ; 16C4 _ 40
        cmp     dword [ebp+10H], eax                    ; 16C5 _ 39. 45, 10
        jle near      ?_092                                   ; 16c8 _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 16CA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16CD _ 8B. 40, 0C
        inc     eax                                     ; 16D0 _ 40
        mov     dword [ebp+10H], eax                    ; 16D1 _ 89. 45, 10
?_092:  cmp     dword [ebp+10H], -1                     ; 16D4 _ 83. 7D, 10, FF
        jge near      ?_093                                   ; 16d8 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 16DA _ C7. 45, 10, FFFFFFFF
?_093:  mov     eax, dword [ebp+0CH]                    ; 16E1 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 16E4 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 16E7 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 16EA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 16ED _ 3B. 45, 10
        jle near      ?_101                                   ; 16f0 _ 0f 8e, 000000c7
        cmp     dword [ebp+10H], 0                      ; 16F6 _ 83. 7D, 10, 00
        js      ?_096                                   ; 16FA _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 16FC _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 16FF _ 89. 45, F4
        jmp     ?_095                                   ; 1702 _ EB, 30

?_094:  mov     eax, dword [ebp-0CH]                    ; 1704 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1707 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 170A _ 8B. 45, 08
        add     edx, 4                                  ; 170D _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1710 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1713 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1716 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1719 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 171C _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 171F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1722 _ 8B. 55, F4
        add     edx, 4                                  ; 1725 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1728 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 172B _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 172E _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1731 _ FF. 4D, F4
?_095:  mov     eax, dword [ebp-0CH]                    ; 1734 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1737 _ 3B. 45, 10
        jg  near      ?_094                                   ; 173a _ 7f, c8
        mov     eax, dword [ebp+8H]                     ; 173C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 173F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1742 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1745 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1748 _ 89. 14 88
        jmp     ?_100                                   ; 174B _ EB, 5D

?_096:  mov     eax, dword [ebp+8H]                     ; 174D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1750 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1753 _ 39. 45, F0
        jge near      ?_099                                   ; 1756 _ 7d, 43
        mov     eax, dword [ebp-10H]                    ; 1758 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 175B _ 89. 45, F4
        jmp     ?_098                                   ; 175E _ EB, 30

?_097:  mov     eax, dword [ebp-0CH]                    ; 1760 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1763 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1766 _ 8B. 45, 08
        add     edx, 4                                  ; 1769 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 176C _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 176F _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1772 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1775 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1778 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 177B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 177E _ 8B. 55, F4
        add     edx, 4                                  ; 1781 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1784 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1787 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 178A _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 178D _ FF. 45, F4
?_098:  mov     eax, dword [ebp+8H]                     ; 1790 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1793 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1796 _ 39. 45, F4
        jl      ?_097                                   ; 1799 _ 7C, C5
?_099:  mov     eax, dword [ebp+8H]                     ; 179B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 179E _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 17A1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17A4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17A7 _ 89. 50, 0C
?_100:  sub     esp, 12                                 ; 17AA _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 17AD _ FF. 75, 08
        call    sheet_refresh                           ; 17B0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17B5 _ 83. C4, 10
        jmp     ?_108                                   ; 17B8 _ E9, 000000D6

?_101:  mov     eax, dword [ebp-10H]                    ; 17BD _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 17C0 _ 3B. 45, 10
        jge near      ?_108                                   ; 17c3 _ 0f 8d, 000000ca
        cmp     dword [ebp-10H], 0                      ; 17C9 _ 83. 7D, F0, 00
        js      ?_104                                   ; 17CD _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 17CF _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 17D2 _ 89. 45, F4
        jmp     ?_103                                   ; 17D5 _ EB, 30

?_102:  mov     eax, dword [ebp-0CH]                    ; 17D7 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 17DA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17DD _ 8B. 45, 08
        add     edx, 4                                  ; 17E0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 17E3 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 17E6 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 17E9 _ 8B. 4D, F4
        add     ecx, 4                                  ; 17EC _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 17EF _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 17F2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17F5 _ 8B. 55, F4
        add     edx, 4                                  ; 17F8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 17FB _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 17FE _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1801 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1804 _ FF. 45, F4
?_103:  mov     eax, dword [ebp-0CH]                    ; 1807 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 180A _ 3B. 45, 10
        jl      ?_102                                   ; 180D _ 7C, C8
        mov     eax, dword [ebp+8H]                     ; 180F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1812 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1815 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1818 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 181B _ 89. 14 88
        jmp     ?_107                                   ; 181E _ EB, 65

?_104:  mov     eax, dword [ebp+8H]                     ; 1820 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1823 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1826 _ 89. 45, F4
        jmp     ?_106                                   ; 1829 _ EB, 34

?_105:  mov     eax, dword [ebp-0CH]                    ; 182B _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 182E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1831 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1834 _ 8B. 55, F4
        add     edx, 4                                  ; 1837 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 183A _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 183D _ 8B. 45, 08
        add     ecx, 4                                  ; 1840 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1843 _ 89. 14 88
        mov     eax, dword [ebp-0CH]                    ; 1846 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1849 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 184C _ 8B. 45, 08
        add     edx, 4                                  ; 184F _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1852 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1855 _ 8B. 55, F4
        inc     edx                                     ; 1858 _ 42
        mov     dword [eax+18H], edx                    ; 1859 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 185C _ FF. 4D, F4
?_106:  mov     eax, dword [ebp-0CH]                    ; 185F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1862 _ 3B. 45, 10
        jge near      ?_105                                   ; 1865 _ 7d, c4
        mov     eax, dword [ebp+8H]                     ; 1867 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 186A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 186D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1870 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1873 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1876 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1879 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 187C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 187F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1882 _ 89. 50, 0C
?_107:  sub     esp, 12                                 ; 1885 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1888 _ FF. 75, 08
        call    sheet_refresh                           ; 188B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1890 _ 83. C4, 10
?_108:  nop                                             ; 1893 _ 90
        leave                                           ; 1894 _ C9
        ret                                             ; 1895 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1896 _ 55
        mov     ebp, esp                                ; 1897 _ 89. E5
        sub     esp, 48                                 ; 1899 _ 83. EC, 30
        mov     dword [ebp-10H], 0                      ; 189C _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 18A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18A6 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 18A8 _ 89. 45, EC
        mov     dword [ebp-4H], 0                       ; 18AB _ C7. 45, FC, 00000000
        jmp     ?_115                                   ; 18B2 _ E9, 000000B0

?_109:  mov     eax, dword [ebp+8H]                     ; 18B7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 18BA _ 8B. 55, FC
        add     edx, 4                                  ; 18BD _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 18C0 _ 8B. 04 90
        mov     dword [ebp-18H], eax                    ; 18C3 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 18C6 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 18C9 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 18CB _ 89. 45, E4
        mov     dword [ebp-0CH], 0                      ; 18CE _ C7. 45, F4, 00000000
        jmp     ?_114                                   ; 18D5 _ EB, 7E

?_110:  mov     eax, dword [ebp-18H]                    ; 18D7 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 18DA _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 18DD _ 8B. 45, F4
        add     eax, edx                                ; 18E0 _ 01. D0
        mov     dword [ebp-20H], eax                    ; 18E2 _ 89. 45, E0
        mov     dword [ebp-8H], 0                       ; 18E5 _ C7. 45, F8, 00000000
        jmp     ?_113                                   ; 18EC _ EB, 59

?_111:  mov     eax, dword [ebp-18H]                    ; 18EE _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 18F1 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 18F4 _ 8B. 45, F8
        add     eax, edx                                ; 18F7 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 18F9 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 18FC _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 18FF _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1902 _ 0F AF. 45, F4
        mov     edx, eax                                ; 1906 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1908 _ 8B. 45, F8
        add     eax, edx                                ; 190B _ 01. D0
        mov     edx, eax                                ; 190D _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 190F _ 8B. 45, E4
        add     eax, edx                                ; 1912 _ 01. D0
        mov     al, byte [eax]                          ; 1914 _ 8A. 00
        mov     byte [ebp-25H], al                      ; 1916 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 1919 _ 0F B6. 55, DB
        mov     eax, dword [ebp-18H]                    ; 191D _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 1920 _ 8B. 40, 14
        cmp     edx, eax                                ; 1923 _ 39. C2
        jz near       ?_112                                   ; 1925 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 1927 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 192A _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 192D _ 0F AF. 45, E0
        mov     edx, eax                                ; 1931 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1933 _ 8B. 45, DC
        add     eax, edx                                ; 1936 _ 01. D0
        mov     edx, eax                                ; 1938 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 193A _ 8B. 45, EC
        add     edx, eax                                ; 193D _ 01. C2
        mov     al, byte [ebp-25H]                      ; 193F _ 8A. 45, DB
        mov     byte [edx], al                          ; 1942 _ 88. 02
?_112:  inc     dword [ebp-8H]                          ; 1944 _ FF. 45, F8
?_113:  mov     eax, dword [ebp-18H]                    ; 1947 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 194A _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 194D _ 39. 45, F8
        jl      ?_111                                   ; 1950 _ 7C, 9C
        inc     dword [ebp-0CH]                         ; 1952 _ FF. 45, F4
?_114:  mov     eax, dword [ebp-18H]                    ; 1955 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 1958 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 195B _ 39. 45, F4
        jl      ?_110                                   ; 195E _ 0F 8C, FFFFFF73
        inc     dword [ebp-4H]                          ; 1964 _ FF. 45, FC
?_115:  mov     eax, dword [ebp+8H]                     ; 1967 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 196A _ 8B. 40, 0C
        cmp     dword [ebp-4H], eax                     ; 196D _ 39. 45, FC
        jle near      ?_109                                   ; 1970 _ 0f 8e, ffffff41
        mov     eax, dword [ebp-10H]                    ; 1976 _ 8B. 45, F0
        leave                                           ; 1979 _ C9
        ret                                             ; 197A _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 197B _ 55
        mov     ebp, esp                                ; 197C _ 89. E5
        mov     eax, dword [ebp+0CH]                    ; 197E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1981 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1984 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1987 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 198A _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 198D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1990 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1993 _ 8B. 40, 18
        test    eax, eax                                ; 1996 _ 85. C0
        js      ?_116                                   ; 1998 _ 78, 0B
        push    dword [ebp+8H]                          ; 199A _ FF. 75, 08
        call    sheet_refresh                           ; 199D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 19A2 _ 83. C4, 04
?_116:  nop                                             ; 19A5 _ 90
        leave                                           ; 19A6 _ C9
        ret                                             ; 19A7 _ C3
; sheet_slide End of function



?_117:                                                  ; byte
        db 6DH, 6FH, 75H, 73H, 65H, 20H, 6DH, 6FH       ; 0000 _ mouse mo
        db 76H, 65H, 00H                                ; 0008 _ ve.

?_118:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 000B _ page is:
        db 20H, 00H                                     ; 0013 _  .

?_119:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0015 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 001D _ L: .

?_120:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0029 _ H: .

?_121:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 002D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0035 _ w: .

?_122:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0039 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0041 _ gh: .

?_123:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0046 _ type: .



memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_124:  db 00H                                          ; 0006 _ .

?_125:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1756:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1803:                                            ; byte
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



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_126:                                                  ; dword
        resb    2                                       ; 0004

?_127:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    16                                      ; 00E0

mx:     resd    1                                       ; 00F0

my:     resd    1                                       ; 00F4

xsize:  resd    1                                       ; 00F8

ysize:  resd    1                                       ; 00FC

buf_back: resd  8                                       ; 0100

buf_mouse:                                              ; byte
        resb    256                                     ; 0120

str.1851:                                               ; byte
        resb    1                                       ; 0220

?_128:  resb    9                                       ; 0221

?_129:  resb    1                                       ; 022A


