; Disassembly of file: ckernel.o
; Sat Jan 30 17:18:43 2021
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
        jz near       ?_003                                   ; 027a _ 74, 72
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
        sub     esp, 4                                  ; 02BA _ 83. EC, 04
        push    7                                       ; 02BD _ 6A, 07
        push    ecx                                     ; 02BF _ 51
        push    dword [ebp-0CH]                         ; 02C0 _ FF. 75, F4
        push    edx                                     ; 02C3 _ 52
        push    eax                                     ; 02C4 _ 50
        push    dword [ebp-14H]                         ; 02C5 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 02C8 _ FF. 75, DC
        call    showMemoryInfo                          ; 02CB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D0 _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 02D3 _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 02D6 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 02D9 _ 3B. 45, E4
        jle near      ?_001                                   ; 02dc _ 0f 8e, ffffff52
        mov     dword [ebp-0CH], 0                      ; 02E2 _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 02E9 _ E9, FFFFFF46

?_003:  sub     esp, 12                                 ; 02EE _ 83. EC, 0C
        push    mouseinfo                               ; 02F1 _ 68, 00000020(d)
        call    fifo8_status                            ; 02F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FB _ 83. C4, 10
        test    eax, eax                                ; 02FE _ 85. C0
        je      ?_001                                   ; 0300 _ 0F 84, FFFFFF2E
        sub     esp, 4                                  ; 0306 _ 83. EC, 04
        push    dword [ebp-18H]                         ; 0309 _ FF. 75, E8
        push    dword [ebp-14H]                         ; 030C _ FF. 75, EC
        push    dword [ebp-24H]                         ; 030F _ FF. 75, DC
        call    show_mouse_info                         ; 0312 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0317 _ 83. C4, 10
        jmp     ?_001                                   ; 031A _ E9, FFFFFF15
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 031F _ 55
        mov     ebp, esp                                ; 0320 _ 89. E5
        push    ebx                                     ; 0322 _ 53
        sub     esp, 4                                  ; 0323 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0326 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0329 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 032C _ 8B. 45, 0C
        dec     eax                                     ; 032F _ 48
        sub     esp, 4                                  ; 0330 _ 83. EC, 04
        push    edx                                     ; 0333 _ 52
        push    eax                                     ; 0334 _ 50
        push    0                                       ; 0335 _ 6A, 00
        push    0                                       ; 0337 _ 6A, 00
        push    14                                      ; 0339 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 033B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 033E _ FF. 75, 08
        call    boxfill8                                ; 0341 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0346 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0349 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 034C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 034F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0352 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0355 _ 8B. 45, 10
        sub     eax, 28                                 ; 0358 _ 83. E8, 1C
        sub     esp, 4                                  ; 035B _ 83. EC, 04
        push    ecx                                     ; 035E _ 51
        push    edx                                     ; 035F _ 52
        push    eax                                     ; 0360 _ 50
        push    0                                       ; 0361 _ 6A, 00
        push    8                                       ; 0363 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0365 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0368 _ FF. 75, 08
        call    boxfill8                                ; 036B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0370 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0373 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0376 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0379 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 037C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 037F _ 8B. 45, 10
        sub     eax, 27                                 ; 0382 _ 83. E8, 1B
        sub     esp, 4                                  ; 0385 _ 83. EC, 04
        push    ecx                                     ; 0388 _ 51
        push    edx                                     ; 0389 _ 52
        push    eax                                     ; 038A _ 50
        push    0                                       ; 038B _ 6A, 00
        push    7                                       ; 038D _ 6A, 07
        push    dword [ebp+0CH]                         ; 038F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0392 _ FF. 75, 08
        call    boxfill8                                ; 0395 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 039A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 039D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03A0 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03A3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03A6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03A9 _ 8B. 45, 10
        sub     eax, 26                                 ; 03AC _ 83. E8, 1A
        sub     esp, 4                                  ; 03AF _ 83. EC, 04
        push    ecx                                     ; 03B2 _ 51
        push    edx                                     ; 03B3 _ 52
        push    eax                                     ; 03B4 _ 50
        push    0                                       ; 03B5 _ 6A, 00
        push    8                                       ; 03B7 _ 6A, 08
        push    dword [ebp+0CH]                         ; 03B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03BC _ FF. 75, 08
        call    boxfill8                                ; 03BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03C7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 03CA _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 03CD _ 8B. 45, 10
        sub     eax, 24                                 ; 03D0 _ 83. E8, 18
        sub     esp, 4                                  ; 03D3 _ 83. EC, 04
        push    edx                                     ; 03D6 _ 52
        push    59                                      ; 03D7 _ 6A, 3B
        push    eax                                     ; 03D9 _ 50
        push    3                                       ; 03DA _ 6A, 03
        push    7                                       ; 03DC _ 6A, 07
        push    dword [ebp+0CH]                         ; 03DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03E1 _ FF. 75, 08
        call    boxfill8                                ; 03E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03E9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03EC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03EF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03F2 _ 8B. 45, 10
        sub     eax, 24                                 ; 03F5 _ 83. E8, 18
        sub     esp, 4                                  ; 03F8 _ 83. EC, 04
        push    edx                                     ; 03FB _ 52
        push    2                                       ; 03FC _ 6A, 02
        push    eax                                     ; 03FE _ 50
        push    2                                       ; 03FF _ 6A, 02
        push    7                                       ; 0401 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0403 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0406 _ FF. 75, 08
        call    boxfill8                                ; 0409 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 040E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0411 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0414 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0417 _ 8B. 45, 10
        sub     eax, 4                                  ; 041A _ 83. E8, 04
        sub     esp, 4                                  ; 041D _ 83. EC, 04
        push    edx                                     ; 0420 _ 52
        push    59                                      ; 0421 _ 6A, 3B
        push    eax                                     ; 0423 _ 50
        push    3                                       ; 0424 _ 6A, 03
        push    15                                      ; 0426 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0428 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 042B _ FF. 75, 08
        call    boxfill8                                ; 042E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0433 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0436 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0439 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 043C _ 8B. 45, 10
        sub     eax, 23                                 ; 043F _ 83. E8, 17
        sub     esp, 4                                  ; 0442 _ 83. EC, 04
        push    edx                                     ; 0445 _ 52
        push    59                                      ; 0446 _ 6A, 3B
        push    eax                                     ; 0448 _ 50
        push    59                                      ; 0449 _ 6A, 3B
        push    15                                      ; 044B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 044D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0450 _ FF. 75, 08
        call    boxfill8                                ; 0453 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0458 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 045B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 045E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0461 _ 8B. 45, 10
        sub     eax, 3                                  ; 0464 _ 83. E8, 03
        sub     esp, 4                                  ; 0467 _ 83. EC, 04
        push    edx                                     ; 046A _ 52
        push    59                                      ; 046B _ 6A, 3B
        push    eax                                     ; 046D _ 50
        push    2                                       ; 046E _ 6A, 02
        push    0                                       ; 0470 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0472 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0475 _ FF. 75, 08
        call    boxfill8                                ; 0478 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 047D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0480 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0483 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0486 _ 8B. 45, 10
        sub     eax, 24                                 ; 0489 _ 83. E8, 18
        sub     esp, 4                                  ; 048C _ 83. EC, 04
        push    edx                                     ; 048F _ 52
        push    60                                      ; 0490 _ 6A, 3C
        push    eax                                     ; 0492 _ 50
        push    60                                      ; 0493 _ 6A, 3C
        push    0                                       ; 0495 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0497 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 049A _ FF. 75, 08
        call    boxfill8                                ; 049D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04A5 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04A8 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04AB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04AE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04B1 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B4 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04B7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04BA _ 83. E8, 2F
        sub     esp, 4                                  ; 04BD _ 83. EC, 04
        push    ebx                                     ; 04C0 _ 53
        push    ecx                                     ; 04C1 _ 51
        push    edx                                     ; 04C2 _ 52
        push    eax                                     ; 04C3 _ 50
        push    15                                      ; 04C4 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04C6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04C9 _ FF. 75, 08
        call    boxfill8                                ; 04CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D1 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04D4 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 04D7 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 04DA _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 04DD _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 04E0 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 04E3 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 04E6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04E9 _ 83. E8, 2F
        sub     esp, 4                                  ; 04EC _ 83. EC, 04
        push    ebx                                     ; 04EF _ 53
        push    ecx                                     ; 04F0 _ 51
        push    edx                                     ; 04F1 _ 52
        push    eax                                     ; 04F2 _ 50
        push    15                                      ; 04F3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04F5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04F8 _ FF. 75, 08
        call    boxfill8                                ; 04FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0500 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0503 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0506 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0509 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 050C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 050F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0512 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0515 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0518 _ 83. E8, 2F
        sub     esp, 4                                  ; 051B _ 83. EC, 04
        push    ebx                                     ; 051E _ 53
        push    ecx                                     ; 051F _ 51
        push    edx                                     ; 0520 _ 52
        push    eax                                     ; 0521 _ 50
        push    7                                       ; 0522 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0524 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0527 _ FF. 75, 08
        call    boxfill8                                ; 052A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 052F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0532 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0535 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0538 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 053B _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 053E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0541 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0544 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0547 _ 83. E8, 03
        sub     esp, 4                                  ; 054A _ 83. EC, 04
        push    ebx                                     ; 054D _ 53
        push    ecx                                     ; 054E _ 51
        push    edx                                     ; 054F _ 52
        push    eax                                     ; 0550 _ 50
        push    7                                       ; 0551 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0553 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0556 _ FF. 75, 08
        call    boxfill8                                ; 0559 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 055E _ 83. C4, 20
        nop                                             ; 0561 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0562 _ 8B. 5D, FC
        leave                                           ; 0565 _ C9
        ret                                             ; 0566 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0567 _ 55
        mov     ebp, esp                                ; 0568 _ 89. E5
        sub     esp, 8                                  ; 056A _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 056D _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0570 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0573 _ A1, 000000F0(d)
        add     eax, edx                                ; 0578 _ 01. D0
        mov     dword [mx], eax                         ; 057A _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 057F _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0582 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0585 _ A1, 000000F4(d)
        add     eax, edx                                ; 058A _ 01. D0
        mov     dword [my], eax                         ; 058C _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0591 _ A1, 000000F0(d)
        test    eax, eax                                ; 0596 _ 85. C0
        jns     ?_004                                   ; 0598 _ 79, 0A
        mov     dword [mx], 0                           ; 059A _ C7. 05, 000000F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 05A4 _ A1, 000000F4(d)
        test    eax, eax                                ; 05A9 _ 85. C0
        jns     ?_005                                   ; 05AB _ 79, 0A
        mov     dword [my], 0                           ; 05AD _ C7. 05, 000000F4(d), 00000000
?_005:  mov     eax, dword [xsize]                      ; 05B7 _ A1, 000000F8(d)
        lea     edx, [eax-0FH]                          ; 05BC _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 05BF _ A1, 000000F0(d)
        cmp     edx, eax                                ; 05C4 _ 39. C2
        jg  near      ?_006                                   ; 05c6 _ 7f, 0d
        mov     eax, dword [xsize]                      ; 05C8 _ A1, 000000F8(d)
        sub     eax, 16                                 ; 05CD _ 83. E8, 10
        mov     dword [mx], eax                         ; 05D0 _ A3, 000000F0(d)
?_006:  mov     eax, dword [ysize]                      ; 05D5 _ A1, 000000FC(d)
        lea     edx, [eax-0FH]                          ; 05DA _ 8D. 50, F1
        mov     eax, dword [my]                         ; 05DD _ A1, 000000F4(d)
        cmp     edx, eax                                ; 05E2 _ 39. C2
        jg  near      ?_007                                   ; 05e4 _ 7f, 0d
        mov     eax, dword [ysize]                      ; 05E6 _ A1, 000000FC(d)
        sub     eax, 16                                 ; 05EB _ 83. E8, 10
        mov     dword [my], eax                         ; 05EE _ A3, 000000F4(d)
?_007:  sub     esp, 8                                  ; 05F3 _ 83. EC, 08
        push    ?_117                                   ; 05F6 _ 68, 00000000(d)
        push    7                                       ; 05FB _ 6A, 07
        push    0                                       ; 05FD _ 6A, 00
        push    0                                       ; 05FF _ 6A, 00
        push    dword [ebp+0CH]                         ; 0601 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0604 _ FF. 75, 08
        call    showString                              ; 0607 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 060C _ 83. C4, 20
        nop                                             ; 060F _ 90
        leave                                           ; 0610 _ C9
        ret                                             ; 0611 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0612 _ 55
        mov     ebp, esp                                ; 0613 _ 89. E5
        sub     esp, 24                                 ; 0615 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0618 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 061D _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0620 _ C6. 45, F3, 00
        call    io_sti                                  ; 0624 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0629 _ 83. EC, 0C
        push    mouseinfo                               ; 062C _ 68, 00000020(d)
        call    fifo8_get                               ; 0631 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0636 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0639 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 063C _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0640 _ 83. EC, 08
        push    eax                                     ; 0643 _ 50
        push    mdec                                    ; 0644 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0649 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 064E _ 83. C4, 10
        test    eax, eax                                ; 0651 _ 85. C0
        jz near       ?_008                                   ; 0653 _ 74, 31
        sub     esp, 4                                  ; 0655 _ 83. EC, 04
        push    mdec                                    ; 0658 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 065D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0660 _ FF. 75, 08
        call    computeMousePosition                    ; 0663 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0668 _ 83. C4, 10
        mov     edx, dword [my]                         ; 066B _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0671 _ A1, 000000F0(d)
        push    edx                                     ; 0676 _ 52
        push    eax                                     ; 0677 _ 50
        push    dword [ebp+10H]                         ; 0678 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 067B _ FF. 75, 08
        call    sheet_slide                             ; 067E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0683 _ 83. C4, 10
?_008:  nop                                             ; 0686 _ 90
        leave                                           ; 0687 _ C9
        ret                                             ; 0688 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0689 _ 55
        mov     ebp, esp                                ; 068A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 068C _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 068F _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0695 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0698 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 069E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 06A1 _ 66: C7. 40, 06, 00C8
        nop                                             ; 06A7 _ 90
        pop     ebp                                     ; 06A8 _ 5D
        ret                                             ; 06A9 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 06AA _ 55
        mov     ebp, esp                                ; 06AB _ 89. E5
        push    ebx                                     ; 06AD _ 53
        sub     esp, 36                                 ; 06AE _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 06B1 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 06B4 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 06B7 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 06BA _ 89. 45, F4
        jmp     ?_010                                   ; 06BD _ EB, 3C

?_009:  mov     eax, dword [ebp+1CH]                    ; 06BF _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06C2 _ 8A. 00
        movzx   eax, al                                 ; 06C4 _ 0F B6. C0
        shl     eax, 4                                  ; 06C7 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 06CA _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 06D0 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 06D4 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 06D7 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 06DA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 06DD _ 8B. 00
        sub     esp, 8                                  ; 06DF _ 83. EC, 08
        push    ebx                                     ; 06E2 _ 53
        push    ecx                                     ; 06E3 _ 51
        push    dword [ebp+14H]                         ; 06E4 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06E7 _ FF. 75, 10
        push    edx                                     ; 06EA _ 52
        push    eax                                     ; 06EB _ 50
        call    showFont8                               ; 06EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06F1 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 06F4 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 06F8 _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 06FB _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06FE _ 8A. 00
        test    al, al                                  ; 0700 _ 84. C0
        jnz near      ?_009                                   ; 0702 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 0704 _ 8B. 45, 14
        add     eax, 16                                 ; 0707 _ 83. C0, 10
        sub     esp, 8                                  ; 070A _ 83. EC, 08
        push    eax                                     ; 070D _ 50
        push    dword [ebp+10H]                         ; 070E _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0711 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0714 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0717 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 071A _ FF. 75, 08
        call    sheet_refresh                           ; 071D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0722 _ 83. C4, 20
        nop                                             ; 0725 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0726 _ 8B. 5D, FC
        leave                                           ; 0729 _ C9
        ret                                             ; 072A _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 072B _ 55
        mov     ebp, esp                                ; 072C _ 89. E5
        sub     esp, 8                                  ; 072E _ 83. EC, 08
        sub     esp, 4                                  ; 0731 _ 83. EC, 04
        push    table_rgb.1767                          ; 0734 _ 68, 00000020(d)
        push    15                                      ; 0739 _ 6A, 0F
        push    0                                       ; 073B _ 6A, 00
        call    set_palette                             ; 073D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0742 _ 83. C4, 10
        nop                                             ; 0745 _ 90
        leave                                           ; 0746 _ C9
        ret                                             ; 0747 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0748 _ 55
        mov     ebp, esp                                ; 0749 _ 89. E5
        sub     esp, 24                                 ; 074B _ 83. EC, 18
        call    io_load_eflags                          ; 074E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0753 _ 89. 45, F0
        call    io_cli                                  ; 0756 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 075B _ 83. EC, 08
        push    dword [ebp+8H]                          ; 075E _ FF. 75, 08
        push    968                                     ; 0761 _ 68, 000003C8
        call    io_out8                                 ; 0766 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 076B _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 076E _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0771 _ 89. 45, F4
        jmp     ?_012                                   ; 0774 _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 0776 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0779 _ 8A. 00
        shr     al, 2                                   ; 077B _ C0. E8, 02
        movzx   eax, al                                 ; 077E _ 0F B6. C0
        sub     esp, 8                                  ; 0781 _ 83. EC, 08
        push    eax                                     ; 0784 _ 50
        push    969                                     ; 0785 _ 68, 000003C9
        call    io_out8                                 ; 078A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0792 _ 8B. 45, 10
        inc     eax                                     ; 0795 _ 40
        mov     al, byte [eax]                          ; 0796 _ 8A. 00
        shr     al, 2                                   ; 0798 _ C0. E8, 02
        movzx   eax, al                                 ; 079B _ 0F B6. C0
        sub     esp, 8                                  ; 079E _ 83. EC, 08
        push    eax                                     ; 07A1 _ 50
        push    969                                     ; 07A2 _ 68, 000003C9
        call    io_out8                                 ; 07A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07AF _ 8B. 45, 10
        add     eax, 2                                  ; 07B2 _ 83. C0, 02
        mov     al, byte [eax]                          ; 07B5 _ 8A. 00
        shr     al, 2                                   ; 07B7 _ C0. E8, 02
        movzx   eax, al                                 ; 07BA _ 0F B6. C0
        sub     esp, 8                                  ; 07BD _ 83. EC, 08
        push    eax                                     ; 07C0 _ 50
        push    969                                     ; 07C1 _ 68, 000003C9
        call    io_out8                                 ; 07C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07CB _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 07CE _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 07D2 _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 07D5 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 07D8 _ 3B. 45, 0C
        jle near      ?_011                                   ; 07db _ 7e, 99
        sub     esp, 12                                 ; 07DD _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 07E0 _ FF. 75, F0
        call    io_store_eflags                         ; 07E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07E8 _ 83. C4, 10
        nop                                             ; 07EB _ 90
        leave                                           ; 07EC _ C9
        ret                                             ; 07ED _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07EE _ 55
        mov     ebp, esp                                ; 07EF _ 89. E5
        sub     esp, 20                                 ; 07F1 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07F4 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07F7 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07FA _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 07FD _ 89. 45, F8
        jmp     ?_016                                   ; 0800 _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 0802 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0805 _ 89. 45, FC
        jmp     ?_015                                   ; 0808 _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 080A _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 080D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0811 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0813 _ 8B. 45, FC
        add     eax, edx                                ; 0816 _ 01. D0
        mov     edx, eax                                ; 0818 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 081A _ 8B. 45, 08
        add     edx, eax                                ; 081D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 081F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0822 _ 88. 02
        inc     dword [ebp-4H]                          ; 0824 _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 0827 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 082A _ 3B. 45, 1C
        jle near      ?_014                                   ; 082d _ 7e, db
        inc     dword [ebp-8H]                          ; 082F _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 0832 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0835 _ 3B. 45, 20
        jle near      ?_013                                   ; 0838 _ 7e, c8
        nop                                             ; 083A _ 90
        nop                                             ; 083B _ 90
        leave                                           ; 083C _ C9
        ret                                             ; 083D _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 083E _ 55
        mov     ebp, esp                                ; 083F _ 89. E5
        sub     esp, 20                                 ; 0841 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0844 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0847 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 084A _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0851 _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 0856 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0859 _ 8B. 45, 1C
        add     eax, edx                                ; 085C _ 01. D0
        mov     al, byte [eax]                          ; 085E _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0860 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0863 _ 80. 7D, FB, 00
        jns     ?_018                                   ; 0867 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0869 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 086C _ 8B. 45, FC
        add     eax, edx                                ; 086F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0871 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0875 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0877 _ 8B. 45, 10
        add     eax, edx                                ; 087A _ 01. D0
        mov     edx, eax                                ; 087C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 087E _ 8B. 45, 08
        add     edx, eax                                ; 0881 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0883 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0886 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0888 _ 0F BE. 45, FB
        and     eax, 40H                                ; 088C _ 83. E0, 40
        test    eax, eax                                ; 088F _ 85. C0
        jz near       ?_019                                   ; 0891 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0893 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0896 _ 8B. 45, FC
        add     eax, edx                                ; 0899 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 089B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 089F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A1 _ 8B. 45, 10
        add     eax, edx                                ; 08A4 _ 01. D0
        lea     edx, [eax+1H]                           ; 08A6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 08A9 _ 8B. 45, 08
        add     edx, eax                                ; 08AC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08AE _ 8A. 45, EC
        mov     byte [edx], al                          ; 08B1 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 08B3 _ 0F BE. 45, FB
        and     eax, 20H                                ; 08B7 _ 83. E0, 20
        test    eax, eax                                ; 08BA _ 85. C0
        jz near       ?_020                                   ; 08bc _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08BE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08C1 _ 8B. 45, FC
        add     eax, edx                                ; 08C4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08CC _ 8B. 45, 10
        add     eax, edx                                ; 08CF _ 01. D0
        lea     edx, [eax+2H]                           ; 08D1 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08D4 _ 8B. 45, 08
        add     edx, eax                                ; 08D7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08D9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08DC _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08DE _ 0F BE. 45, FB
        and     eax, 10H                                ; 08E2 _ 83. E0, 10
        test    eax, eax                                ; 08E5 _ 85. C0
        jz near       ?_021                                   ; 08e7 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08E9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08EC _ 8B. 45, FC
        add     eax, edx                                ; 08EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08F7 _ 8B. 45, 10
        add     eax, edx                                ; 08FA _ 01. D0
        lea     edx, [eax+3H]                           ; 08FC _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08FF _ 8B. 45, 08
        add     edx, eax                                ; 0902 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0904 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0907 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0909 _ 0F BE. 45, FB
        and     eax, 08H                                ; 090D _ 83. E0, 08
        test    eax, eax                                ; 0910 _ 85. C0
        jz near       ?_022                                   ; 0912 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0914 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0917 _ 8B. 45, FC
        add     eax, edx                                ; 091A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 091C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0920 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0922 _ 8B. 45, 10
        add     eax, edx                                ; 0925 _ 01. D0
        lea     edx, [eax+4H]                           ; 0927 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 092A _ 8B. 45, 08
        add     edx, eax                                ; 092D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 092F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0932 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0934 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0938 _ 83. E0, 04
        test    eax, eax                                ; 093B _ 85. C0
        jz near       ?_023                                   ; 093d _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 093F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0942 _ 8B. 45, FC
        add     eax, edx                                ; 0945 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0947 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 094B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 094D _ 8B. 45, 10
        add     eax, edx                                ; 0950 _ 01. D0
        lea     edx, [eax+5H]                           ; 0952 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0955 _ 8B. 45, 08
        add     edx, eax                                ; 0958 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 095A _ 8A. 45, EC
        mov     byte [edx], al                          ; 095D _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 095F _ 0F BE. 45, FB
        and     eax, 02H                                ; 0963 _ 83. E0, 02
        test    eax, eax                                ; 0966 _ 85. C0
        jz near       ?_024                                   ; 0968 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 096A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 096D _ 8B. 45, FC
        add     eax, edx                                ; 0970 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0972 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0976 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0978 _ 8B. 45, 10
        add     eax, edx                                ; 097B _ 01. D0
        lea     edx, [eax+6H]                           ; 097D _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0980 _ 8B. 45, 08
        add     edx, eax                                ; 0983 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0985 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0988 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 098A _ 0F BE. 45, FB
        and     eax, 01H                                ; 098E _ 83. E0, 01
        test    eax, eax                                ; 0991 _ 85. C0
        jz near       ?_025                                   ; 0993 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0995 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0998 _ 8B. 45, FC
        add     eax, edx                                ; 099B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 099D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09A1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09A3 _ 8B. 45, 10
        add     eax, edx                                ; 09A6 _ 01. D0
        lea     edx, [eax+7H]                           ; 09A8 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 09AB _ 8B. 45, 08
        add     edx, eax                                ; 09AE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09B0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09B3 _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 09B5 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 09B8 _ 83. 7D, FC, 0F
        jle near      ?_017                                   ; 09bc _ 0f 8e, fffffe94
        nop                                             ; 09C2 _ 90
        nop                                             ; 09C3 _ 90
        leave                                           ; 09C4 _ C9
        ret                                             ; 09C5 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09C6 _ 55
        mov     ebp, esp                                ; 09C7 _ 89. E5
        sub     esp, 20                                 ; 09C9 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09CC _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09CF _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09D2 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 09D9 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 09DE _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 09E5 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 09EA _ 8B. 45, F8
        shl     eax, 4                                  ; 09ED _ C1. E0, 04
        mov     edx, eax                                ; 09F0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F2 _ 8B. 45, FC
        add     eax, edx                                ; 09F5 _ 01. D0
        add     eax, cursor.1814                        ; 09F7 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 09FC _ 8A. 00
        cmp     al, 42                                  ; 09FE _ 3C, 2A
        jnz near      ?_029                                   ; 0a00 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A02 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A05 _ C1. E0, 04
        mov     edx, eax                                ; 0A08 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A0A _ 8B. 45, FC
        add     eax, edx                                ; 0A0D _ 01. D0
        mov     edx, eax                                ; 0A0F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A11 _ 8B. 45, 08
        add     eax, edx                                ; 0A14 _ 01. D0
        mov     byte [eax], 0                           ; 0A16 _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0A19 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A1C _ C1. E0, 04
        mov     edx, eax                                ; 0A1F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A21 _ 8B. 45, FC
        add     eax, edx                                ; 0A24 _ 01. D0
        add     eax, cursor.1814                        ; 0A26 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A2B _ 8A. 00
        cmp     al, 79                                  ; 0A2D _ 3C, 4F
        jnz near      ?_030                                   ; 0a2f _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A31 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A34 _ C1. E0, 04
        mov     edx, eax                                ; 0A37 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A39 _ 8B. 45, FC
        add     eax, edx                                ; 0A3C _ 01. D0
        mov     edx, eax                                ; 0A3E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A40 _ 8B. 45, 08
        add     eax, edx                                ; 0A43 _ 01. D0
        mov     byte [eax], 7                           ; 0A45 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 0A48 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A4B _ C1. E0, 04
        mov     edx, eax                                ; 0A4E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A50 _ 8B. 45, FC
        add     eax, edx                                ; 0A53 _ 01. D0
        add     eax, cursor.1814                        ; 0A55 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A5A _ 8A. 00
        cmp     al, 46                                  ; 0A5C _ 3C, 2E
        jnz near      ?_031                                   ; 0a5e _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A60 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A63 _ C1. E0, 04
        mov     edx, eax                                ; 0A66 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A68 _ 8B. 45, FC
        add     eax, edx                                ; 0A6B _ 01. D0
        mov     edx, eax                                ; 0A6D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A6F _ 8B. 45, 08
        add     edx, eax                                ; 0A72 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A74 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A77 _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 0A79 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 0A7C _ 83. 7D, FC, 0F
        jle near      ?_028                                   ; 0a80 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 0A86 _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 0A89 _ 83. 7D, F8, 0F
        jle near      ?_027                                   ; 0a8d _ 0f 8e, ffffff4b
        nop                                             ; 0A93 _ 90
        nop                                             ; 0A94 _ 90
        leave                                           ; 0A95 _ C9
        ret                                             ; 0A96 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A97 _ 55
        mov     ebp, esp                                ; 0A98 _ 89. E5
        push    ebx                                     ; 0A9A _ 53
        sub     esp, 16                                 ; 0A9B _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0A9E _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0AA5 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0AA7 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0AAE _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0AB0 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0AB3 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0AB7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AB9 _ 8B. 45, F8
        add     eax, edx                                ; 0ABC _ 01. D0
        mov     edx, eax                                ; 0ABE _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0AC0 _ 8B. 45, 20
        add     eax, edx                                ; 0AC3 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0AC5 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0AC8 _ 8B. 55, F4
        add     edx, ecx                                ; 0ACB _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0ACD _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0AD1 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0AD4 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0AD7 _ 01. D9
        add     edx, ecx                                ; 0AD9 _ 01. CA
        mov     ecx, edx                                ; 0ADB _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0ADD _ 8B. 55, 08
        add     edx, ecx                                ; 0AE0 _ 01. CA
        mov     al, byte [eax]                          ; 0AE2 _ 8A. 00
        mov     byte [edx], al                          ; 0AE4 _ 88. 02
        inc     dword [ebp-8H]                          ; 0AE6 _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0AE9 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0AEC _ 3B. 45, 10
        jl      ?_035                                   ; 0AEF _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0AF1 _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0AF4 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0AF7 _ 3B. 45, 14
        jl      ?_034                                   ; 0AFA _ 7C, AB
        nop                                             ; 0AFC _ 90
        nop                                             ; 0AFD _ 90
        add     esp, 16                                 ; 0AFE _ 83. C4, 10
        pop     ebx                                     ; 0B01 _ 5B
        pop     ebp                                     ; 0B02 _ 5D
        ret                                             ; 0B03 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0B04 _ 55
        mov     ebp, esp                                ; 0B05 _ 89. E5
        sub     esp, 24                                 ; 0B07 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0B0A _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0B0F _ 89. 45, F4
        mov     eax, dword [?_126]                      ; 0B12 _ A1, 00000004(d)
        cwde                                            ; 0B17 _ 98
        mov     dword [ebp-10H], eax                    ; 0B18 _ 89. 45, F0
        mov     ax, word [?_127]                        ; 0B1B _ 66: A1, 00000006(d)
        cwde                                            ; 0B21 _ 98
        mov     dword [ebp-14H], eax                    ; 0B22 _ 89. 45, EC
        sub     esp, 8                                  ; 0B25 _ 83. EC, 08
        push    32                                      ; 0B28 _ 6A, 20
        push    32                                      ; 0B2A _ 6A, 20
        call    io_out8                                 ; 0B2C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B31 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B34 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B38 _ 83. EC, 0C
        push    96                                      ; 0B3B _ 6A, 60
        call    io_in8                                  ; 0B3D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B42 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B45 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B48 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B4C _ 83. EC, 08
        push    eax                                     ; 0B4F _ 50
        push    keyinfo                                 ; 0B50 _ 68, 00000008(d)
        call    fifo8_put                               ; 0B55 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B5A _ 83. C4, 10
        nop                                             ; 0B5D _ 90
        leave                                           ; 0B5E _ C9
        ret                                             ; 0B5F _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B60 _ 55
        mov     ebp, esp                                ; 0B61 _ 89. E5
        sub     esp, 4                                  ; 0B63 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B66 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B69 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B6C _ 80. 7D, FC, 09
        jle near      ?_038                                   ; 0b70 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 0B72 _ 8A. 45, FC
        add     eax, 55                                 ; 0B75 _ 83. C0, 37
        jmp     ?_039                                   ; 0B78 _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0B7A _ 8A. 45, FC
        add     eax, 48                                 ; 0B7D _ 83. C0, 30
?_039:  leave                                           ; 0B80 _ C9
        ret                                             ; 0B81 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B82 _ 55
        mov     ebp, esp                                ; 0B83 _ 89. E5
        sub     esp, 20                                 ; 0B85 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B88 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B8B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B8E _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0B95 _ 8A. 45, EC
        and     eax, 0FH                                ; 0B98 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B9B _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B9E _ 0F BE. 45, FB
        push    eax                                     ; 0BA2 _ 50
        call    charToHexVal                            ; 0BA3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BA8 _ 83. C4, 04
        mov     byte [?_125], al                        ; 0BAB _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0BB0 _ 8A. 45, EC
        shr     al, 4                                   ; 0BB3 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0BB6 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0BB9 _ 8A. 45, EC
        movsx   eax, al                                 ; 0BBC _ 0F BE. C0
        push    eax                                     ; 0BBF _ 50
        call    charToHexVal                            ; 0BC0 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BC5 _ 83. C4, 04
        mov     byte [?_124], al                        ; 0BC8 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0BCD _ B8, 00000004(d)
        leave                                           ; 0BD2 _ C9
        ret                                             ; 0BD3 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BD4 _ 55
        mov     ebp, esp                                ; 0BD5 _ 89. E5
        sub     esp, 16                                 ; 0BD7 _ 83. EC, 10
        mov     byte [str.1862], 48                     ; 0BDA _ C6. 05, 00000220(d), 30
        mov     byte [?_128], 88                        ; 0BE1 _ C6. 05, 00000221(d), 58
        mov     byte [?_129], 0                         ; 0BE8 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-4H], 2                       ; 0BEF _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0BF6 _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0BF8 _ 8B. 45, FC
        add     eax, str.1862                           ; 0BFB _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0C00 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0C03 _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0C06 _ 83. 7D, FC, 09
        jle near      ?_040                                   ; 0c0a _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 0C0C _ C7. 45, F8, 00000009
        jmp     ?_045                                   ; 0C13 _ EB, 41

?_042:  mov     eax, dword [ebp+8H]                     ; 0C15 _ 8B. 45, 08
        and     eax, 0FH                                ; 0C18 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C1B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C1E _ 8B. 45, 08
        shr     eax, 4                                  ; 0C21 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C24 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C27 _ 83. 7D, F4, 09
        jle near      ?_043                                   ; 0c2b _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 0C2D _ 8B. 45, F4
        add     eax, 55                                 ; 0C30 _ 83. C0, 37
        mov     dl, al                                  ; 0C33 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C35 _ 8B. 45, F8
        add     eax, str.1862                           ; 0C38 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C3D _ 88. 10
        jmp     ?_044                                   ; 0C3F _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0C41 _ 8B. 45, F4
        add     eax, 48                                 ; 0C44 _ 83. C0, 30
        mov     dl, al                                  ; 0C47 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C49 _ 8B. 45, F8
        add     eax, str.1862                           ; 0C4C _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C51 _ 88. 10
?_044:  dec     dword [ebp-8H]                          ; 0C53 _ FF. 4D, F8
?_045:  cmp     dword [ebp-8H], 1                       ; 0C56 _ 83. 7D, F8, 01
        jle near      ?_046                                   ; 0c5a _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0C5C _ 83. 7D, 08, 00
        jnz near      ?_042                                   ; 0c60 _ 75, b3
?_046:  mov     eax, str.1862                           ; 0C62 _ B8, 00000220(d)
        leave                                           ; 0C67 _ C9
        ret                                             ; 0C68 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C69 _ 55
        mov     ebp, esp                                ; 0C6A _ 89. E5
        sub     esp, 8                                  ; 0C6C _ 83. EC, 08
?_047:  sub     esp, 12                                 ; 0C6F _ 83. EC, 0C
        push    100                                     ; 0C72 _ 6A, 64
        call    io_in8                                  ; 0C74 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C79 _ 83. C4, 10
        and     eax, 02H                                ; 0C7C _ 83. E0, 02
        test    eax, eax                                ; 0C7F _ 85. C0
        jz near       ?_048                                   ; 0c81 _ 74, 02
        jmp     ?_047                                   ; 0C83 _ EB, EA

?_048:  nop                                             ; 0C85 _ 90
        nop                                             ; 0C86 _ 90
        leave                                           ; 0C87 _ C9
        ret                                             ; 0C88 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C89 _ 55
        mov     ebp, esp                                ; 0C8A _ 89. E5
        sub     esp, 8                                  ; 0C8C _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C8F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C94 _ 83. EC, 08
        push    96                                      ; 0C97 _ 6A, 60
        push    100                                     ; 0C99 _ 6A, 64
        call    io_out8                                 ; 0C9B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA0 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CA3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CA8 _ 83. EC, 08
        push    71                                      ; 0CAB _ 6A, 47
        push    96                                      ; 0CAD _ 6A, 60
        call    io_out8                                 ; 0CAF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB4 _ 83. C4, 10
        nop                                             ; 0CB7 _ 90
        leave                                           ; 0CB8 _ C9
        ret                                             ; 0CB9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CBA _ 55
        mov     ebp, esp                                ; 0CBB _ 89. E5
        sub     esp, 8                                  ; 0CBD _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CC0 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CC5 _ 83. EC, 08
        push    212                                     ; 0CC8 _ 68, 000000D4
        push    100                                     ; 0CCD _ 6A, 64
        call    io_out8                                 ; 0CCF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD4 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CD7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CDC _ 83. EC, 08
        push    244                                     ; 0CDF _ 68, 000000F4
        push    96                                      ; 0CE4 _ 6A, 60
        call    io_out8                                 ; 0CE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEB _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CEE _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CF1 _ C6. 40, 03, 00
        nop                                             ; 0CF5 _ 90
        leave                                           ; 0CF6 _ C9
        ret                                             ; 0CF7 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CF8 _ 55
        mov     ebp, esp                                ; 0CF9 _ 89. E5
        sub     esp, 24                                 ; 0CFB _ 83. EC, 18
        sub     esp, 8                                  ; 0CFE _ 83. EC, 08
        push    32                                      ; 0D01 _ 6A, 20
        push    160                                     ; 0D03 _ 68, 000000A0
        call    io_out8                                 ; 0D08 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D0D _ 83. C4, 10
        sub     esp, 8                                  ; 0D10 _ 83. EC, 08
        push    32                                      ; 0D13 _ 6A, 20
        push    32                                      ; 0D15 _ 6A, 20
        call    io_out8                                 ; 0D17 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D1C _ 83. C4, 10
        sub     esp, 12                                 ; 0D1F _ 83. EC, 0C
        push    96                                      ; 0D22 _ 6A, 60
        call    io_in8                                  ; 0D24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D29 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D2C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D2F _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D33 _ 83. EC, 08
        push    eax                                     ; 0D36 _ 50
        push    mouseinfo                               ; 0D37 _ 68, 00000020(d)
        call    fifo8_put                               ; 0D3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D41 _ 83. C4, 10
        nop                                             ; 0D44 _ 90
        leave                                           ; 0D45 _ C9
        ret                                             ; 0D46 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D47 _ 55
        mov     ebp, esp                                ; 0D48 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D4A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D4D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D50 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D53 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D56 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D59 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D5B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D5E _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D61 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D64 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D67 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D6E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D71 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D7B _ C7. 40, 08, 00000000
        nop                                             ; 0D82 _ 90
        pop     ebp                                     ; 0D83 _ 5D
        ret                                             ; 0D84 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D85 _ 55
        mov     ebp, esp                                ; 0D86 _ 89. E5
        sub     esp, 4                                  ; 0D88 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D8B _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D8E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D91 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D94 _ 8B. 40, 10
        test    eax, eax                                ; 0D97 _ 85. C0
        jnz near      ?_049                                   ; 0d99 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D9B _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D9E _ 8B. 40, 14
        or      eax, 01H                                ; 0DA1 _ 83. C8, 01
        mov     edx, eax                                ; 0DA4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DA6 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0DA9 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0DAC _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0DB1 _ EB, 4F

?_049:  mov     eax, dword [ebp+8H]                     ; 0DB3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DB6 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DB8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DBB _ 8B. 40, 04
        add     edx, eax                                ; 0DBE _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0DC0 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0DC3 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0DC5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DC8 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0DCB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DCE _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DD1 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DD4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DD7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DDA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DDD _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DE0 _ 39. C2
        jnz near      ?_050                                   ; 0de2 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0DE4 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DE7 _ C7. 40, 04, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0DEE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DF1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DF4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DF7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DFA _ 89. 50, 10
        mov     eax, 0                                  ; 0DFD _ B8, 00000000
?_051:  leave                                           ; 0E02 _ C9
        ret                                             ; 0E03 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0E04 _ 55
        mov     ebp, esp                                ; 0E05 _ 89. E5
        sub     esp, 16                                 ; 0E07 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0E0A _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E0D _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E10 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E13 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E16 _ 39. C2
        jnz near      ?_052                                   ; 0e18 _ 75, 07
        mov     eax, 4294967295                         ; 0E1A _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0E1F _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0E21 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E24 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E26 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E29 _ 8B. 40, 08
        add     eax, edx                                ; 0E2C _ 01. D0
        mov     al, byte [eax]                          ; 0E2E _ 8A. 00
        movzx   eax, al                                 ; 0E30 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E33 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E36 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E39 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E3C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E3F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E42 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E45 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E48 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E4B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E4E _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E51 _ 39. C2
        jnz near      ?_053                                   ; 0e53 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0E55 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E58 _ C7. 40, 08, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0E5F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E62 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E65 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E68 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E6B _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E6E _ 8B. 45, FC
?_054:  leave                                           ; 0E71 _ C9
        ret                                             ; 0E72 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E73 _ 55
        mov     ebp, esp                                ; 0E74 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E76 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E79 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E7C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E7F _ 8B. 40, 10
        sub     edx, eax                                ; 0E82 _ 29. C2
        mov     eax, edx                                ; 0E84 _ 89. D0
        pop     ebp                                     ; 0E86 _ 5D
        ret                                             ; 0E87 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E88 _ 55
        mov     ebp, esp                                ; 0E89 _ 89. E5
        sub     esp, 4                                  ; 0E8B _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E8E _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E91 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E94 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E97 _ 8A. 40, 03
        test    al, al                                  ; 0E9A _ 84. C0
        jnz near      ?_056                                   ; 0e9c _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E9E _ 80. 7D, FC, FA
        jnz near      ?_055                                   ; 0ea2 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0EA4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EA7 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 0EAB _ B8, 00000000
        jmp     ?_063                                   ; 0EB0 _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 0EB5 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EB8 _ 8A. 40, 03
        cmp     al, 1                                   ; 0EBB _ 3C, 01
        jnz near      ?_058                                   ; 0ebd _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0EBF _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EC3 _ 25, 000000C8
        cmp     eax, 8                                  ; 0EC8 _ 83. F8, 08
        jnz near      ?_057                                   ; 0ecb _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 0ECD _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0ED0 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0ED3 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0ED5 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0ED8 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 0EDC _ B8, 00000000
        jmp     ?_063                                   ; 0EE1 _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 0EE6 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EE9 _ 8A. 40, 03
        cmp     al, 2                                   ; 0EEC _ 3C, 02
        jnz near      ?_059                                   ; 0eee _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 0EF0 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EF3 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0EF6 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EF9 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EFC _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F00 _ B8, 00000000
        jmp     ?_063                                   ; 0F05 _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 0F0A _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F0D _ 8A. 40, 03
        cmp     al, 3                                   ; 0F10 _ 3C, 03
        jne near      ?_062                                   ; 0f12 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 0F18 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F1B _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F1E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F21 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F24 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F28 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F2B _ 8A. 00
        movzx   eax, al                                 ; 0F2D _ 0F B6. C0
        and     eax, 07H                                ; 0F30 _ 83. E0, 07
        mov     edx, eax                                ; 0F33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F35 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F38 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F3B _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0F3E _ 8A. 40, 01
        movzx   edx, al                                 ; 0F41 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F44 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F47 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F4A _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0F4D _ 8A. 40, 02
        movzx   edx, al                                 ; 0F50 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F53 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F56 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F59 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F5C _ 8A. 00
        movzx   eax, al                                 ; 0F5E _ 0F B6. C0
        and     eax, 10H                                ; 0F61 _ 83. E0, 10
        test    eax, eax                                ; 0F64 _ 85. C0
        jz near       ?_060                                   ; 0f66 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F68 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F6B _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F6E _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F73 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F75 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F78 _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 0F7B _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F7E _ 8A. 00
        movzx   eax, al                                 ; 0F80 _ 0F B6. C0
        and     eax, 20H                                ; 0F83 _ 83. E0, 20
        test    eax, eax                                ; 0F86 _ 85. C0
        jz near       ?_061                                   ; 0f88 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F8A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F8D _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F90 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F95 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F97 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F9A _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 0F9D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FA0 _ 8B. 40, 08
        neg     eax                                     ; 0FA3 _ F7. D8
        mov     edx, eax                                ; 0FA5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FA7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FAA _ 89. 50, 08
        mov     eax, 1                                  ; 0FAD _ B8, 00000001
        jmp     ?_063                                   ; 0FB2 _ EB, 05

?_062:  mov     eax, 4294967295                         ; 0FB4 _ B8, FFFFFFFF
?_063:  leave                                           ; 0FB9 _ C9
        ret                                             ; 0FBA _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FBB _ 55
        mov     ebp, esp                                ; 0FBC _ 89. E5
        sub     esp, 56                                 ; 0FBE _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0FC1 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0FC8 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0FCF _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0FD6 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 0FDD _ 8B. 15, 000000FC(d)
        mov     eax, dword [ebp+0CH]                    ; 0FE3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0FE6 _ 8B. 00
        sub     esp, 4                                  ; 0FE8 _ 83. EC, 04
        push    edx                                     ; 0FEB _ 52
        push    dword [ebp+1CH]                         ; 0FEC _ FF. 75, 1C
        push    eax                                     ; 0FEF _ 50
        call    init_screen8                            ; 0FF0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FF5 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0FF8 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FFB _ 0F BE. C0
        sub     esp, 8                                  ; 0FFE _ 83. EC, 08
        push    ?_118                                   ; 1001 _ 68, 00000017(d)
        push    eax                                     ; 1006 _ 50
        push    dword [ebp-10H]                         ; 1007 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 100A _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 100D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1010 _ FF. 75, 08
        call    showString                              ; 1013 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1018 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 101B _ 8B. 45, 18
        sub     esp, 12                                 ; 101E _ 83. EC, 0C
        push    eax                                     ; 1021 _ 50
        call    intToHexStr                             ; 1022 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1027 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 102A _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 102D _ 8B. 45, 20
        movsx   eax, al                                 ; 1030 _ 0F BE. C0
        sub     esp, 8                                  ; 1033 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1036 _ FF. 75, E4
        push    eax                                     ; 1039 _ 50
        push    dword [ebp-10H]                         ; 103A _ FF. 75, F0
        push    dword [ebp-14H]                         ; 103D _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1040 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1043 _ FF. 75, 08
        call    showString                              ; 1046 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 104B _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 104E _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1052 _ 8B. 45, 20
        movsx   eax, al                                 ; 1055 _ 0F BE. C0
        sub     esp, 8                                  ; 1058 _ 83. EC, 08
        push    ?_119                                   ; 105B _ 68, 00000021(d)
        push    eax                                     ; 1060 _ 50
        push    dword [ebp-10H]                         ; 1061 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1064 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1067 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 106A _ FF. 75, 08
        call    showString                              ; 106D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1072 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1075 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1078 _ 8B. 00
        sub     esp, 12                                 ; 107A _ 83. EC, 0C
        push    eax                                     ; 107D _ 50
        call    intToHexStr                             ; 107E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1083 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1086 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1089 _ 8B. 45, 20
        movsx   eax, al                                 ; 108C _ 0F BE. C0
        sub     esp, 8                                  ; 108F _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1092 _ FF. 75, E0
        push    eax                                     ; 1095 _ 50
        push    dword [ebp-10H]                         ; 1096 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1099 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 109C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 109F _ FF. 75, 08
        call    showString                              ; 10A2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10A7 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10AA _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 10AE _ 8B. 45, 20
        movsx   eax, al                                 ; 10B1 _ 0F BE. C0
        sub     esp, 8                                  ; 10B4 _ 83. EC, 08
        push    ?_120                                   ; 10B7 _ 68, 0000002D(d)
        push    eax                                     ; 10BC _ 50
        push    dword [ebp-10H]                         ; 10BD _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10C0 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 10C3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10C6 _ FF. 75, 08
        call    showString                              ; 10C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10CE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10D1 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 10D4 _ 8B. 40, 04
        sub     esp, 12                                 ; 10D7 _ 83. EC, 0C
        push    eax                                     ; 10DA _ 50
        call    intToHexStr                             ; 10DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10E0 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 10E3 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 10E6 _ 8B. 45, 20
        movsx   eax, al                                 ; 10E9 _ 0F BE. C0
        sub     esp, 8                                  ; 10EC _ 83. EC, 08
        push    dword [ebp-24H]                         ; 10EF _ FF. 75, DC
        push    eax                                     ; 10F2 _ 50
        push    dword [ebp-10H]                         ; 10F3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10F6 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 10F9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10FC _ FF. 75, 08
        call    showString                              ; 10FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1104 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1107 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 110B _ 8B. 45, 20
        movsx   eax, al                                 ; 110E _ 0F BE. C0
        sub     esp, 8                                  ; 1111 _ 83. EC, 08
        push    ?_121                                   ; 1114 _ 68, 00000039(d)
        push    eax                                     ; 1119 _ 50
        push    dword [ebp-10H]                         ; 111A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 111D _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1120 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1123 _ FF. 75, 08
        call    showString                              ; 1126 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 112B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 112E _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1131 _ 8B. 40, 08
        sub     esp, 12                                 ; 1134 _ 83. EC, 0C
        push    eax                                     ; 1137 _ 50
        call    intToHexStr                             ; 1138 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 113D _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1140 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1143 _ 8B. 45, 20
        movsx   eax, al                                 ; 1146 _ 0F BE. C0
        sub     esp, 8                                  ; 1149 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 114C _ FF. 75, D8
        push    eax                                     ; 114F _ 50
        push    dword [ebp-10H]                         ; 1150 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1153 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1156 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1159 _ FF. 75, 08
        call    showString                              ; 115C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1161 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1164 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1168 _ 8B. 45, 20
        movsx   eax, al                                 ; 116B _ 0F BE. C0
        sub     esp, 8                                  ; 116E _ 83. EC, 08
        push    ?_122                                   ; 1171 _ 68, 00000045(d)
        push    eax                                     ; 1176 _ 50
        push    dword [ebp-10H]                         ; 1177 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 117A _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 117D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1180 _ FF. 75, 08
        call    showString                              ; 1183 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1188 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 118B _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 118E _ 8B. 40, 0C
        sub     esp, 12                                 ; 1191 _ 83. EC, 0C
        push    eax                                     ; 1194 _ 50
        call    intToHexStr                             ; 1195 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 119A _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 119D _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 11A0 _ 8B. 45, 20
        movsx   eax, al                                 ; 11A3 _ 0F BE. C0
        sub     esp, 8                                  ; 11A6 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 11A9 _ FF. 75, D4
        push    eax                                     ; 11AC _ 50
        push    dword [ebp-10H]                         ; 11AD _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11B0 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 11B3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11B6 _ FF. 75, 08
        call    showString                              ; 11B9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11BE _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11C1 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 11C5 _ 8B. 45, 20
        movsx   eax, al                                 ; 11C8 _ 0F BE. C0
        sub     esp, 8                                  ; 11CB _ 83. EC, 08
        push    ?_123                                   ; 11CE _ 68, 00000052(d)
        push    eax                                     ; 11D3 _ 50
        push    dword [ebp-10H]                         ; 11D4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11D7 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 11DA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11DD _ FF. 75, 08
        call    showString                              ; 11E0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11E5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 11E8 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 11EB _ 8B. 40, 10
        sub     esp, 12                                 ; 11EE _ 83. EC, 0C
        push    eax                                     ; 11F1 _ 50
        call    intToHexStr                             ; 11F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F7 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 11FA _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 11FD _ 8B. 45, 20
        movsx   eax, al                                 ; 1200 _ 0F BE. C0
        sub     esp, 8                                  ; 1203 _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1206 _ FF. 75, D0
        push    eax                                     ; 1209 _ 50
        push    dword [ebp-10H]                         ; 120A _ FF. 75, F0
        push    dword [ebp-14H]                         ; 120D _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1210 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1213 _ FF. 75, 08
        call    showString                              ; 1216 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 121B _ 83. C4, 20
        nop                                             ; 121E _ 90
        leave                                           ; 121F _ C9
        ret                                             ; 1220 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 1221 _ 55
        mov     ebp, esp                                ; 1222 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1224 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1227 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 122D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1230 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1237 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 123A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1241 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1244 _ C7. 40, 0C, 00000000
        nop                                             ; 124B _ 90
        pop     ebp                                     ; 124C _ 5D
        ret                                             ; 124D _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 124E _ 55
        mov     ebp, esp                                ; 124F _ 89. E5
        sub     esp, 16                                 ; 1251 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1254 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 125B _ C7. 45, FC, 00000000
        jmp     ?_065                                   ; 1262 _ EB, 13

?_064:  mov     eax, dword [ebp+8H]                     ; 1264 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1267 _ 8B. 55, FC
        add     edx, 2                                  ; 126A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 126D _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1271 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1274 _ FF. 45, FC
?_065:  mov     eax, dword [ebp+8H]                     ; 1277 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 127A _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 127C _ 39. 45, FC
        jc near       ?_064                                   ; 127f _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1281 _ 8B. 45, F8
        leave                                           ; 1284 _ C9
        ret                                             ; 1285 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1286 _ 55
        mov     ebp, esp                                ; 1287 _ 89. E5
        sub     esp, 16                                 ; 1289 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 128C _ C7. 45, FC, 00000000
        jmp     ?_069                                   ; 1293 _ E9, 00000084

?_066:  mov     eax, dword [ebp+8H]                     ; 1298 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 129B _ 8B. 55, FC
        add     edx, 2                                  ; 129E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12A1 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 12A5 _ 39. 45, 0C
        ja      ?_068                                   ; 12A8 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 12AA _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12AD _ 8B. 55, FC
        add     edx, 2                                  ; 12B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12B3 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 12B6 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 12B9 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12BC _ 8B. 55, FC
        add     edx, 2                                  ; 12BF _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 12C2 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 12C5 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 12C8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 12CB _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12CE _ 8B. 55, FC
        add     edx, 2                                  ; 12D1 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 12D4 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 12D7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12DA _ 8B. 55, FC
        add     edx, 2                                  ; 12DD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12E0 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 12E4 _ 2B. 45, 0C
        mov     edx, eax                                ; 12E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12E9 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 12EC _ 8B. 4D, FC
        add     ecx, 2                                  ; 12EF _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12F2 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12F6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12F9 _ 8B. 55, FC
        add     edx, 2                                  ; 12FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12FF _ 8B. 44 D0, 04
        test    eax, eax                                ; 1303 _ 85. C0
        jnz near      ?_067                                   ; 1305 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 1307 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 130A _ 8B. 00
        lea     edx, [eax-1H]                           ; 130C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 130F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1312 _ 89. 10
?_067:  mov     eax, dword [ebp-8H]                     ; 1314 _ 8B. 45, F8
        jmp     ?_070                                   ; 1317 _ EB, 16

?_068:  inc     dword [ebp-4H]                          ; 1319 _ FF. 45, FC
?_069:  mov     eax, dword [ebp+8H]                     ; 131C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 131F _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1321 _ 39. 45, FC
        jc near       ?_066                                   ; 1324 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 132A _ B8, 00000000
?_070:  leave                                           ; 132F _ C9
        ret                                             ; 1330 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1331 _ 55
        mov     ebp, esp                                ; 1332 _ 89. E5
        push    ebx                                     ; 1334 _ 53
        sub     esp, 16                                 ; 1335 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1338 _ C7. 45, F8, 00000000
        jmp     ?_072                                   ; 133F _ EB, 14

?_071:  mov     eax, dword [ebp+8H]                     ; 1341 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1344 _ 8B. 55, F8
        add     edx, 2                                  ; 1347 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 134A _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 134D _ 39. 45, 0C
        jc near       ?_073                                   ; 1350 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1352 _ FF. 45, F8
?_072:  mov     eax, dword [ebp+8H]                     ; 1355 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1358 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 135A _ 39. 45, F8
        jl      ?_071                                   ; 135D _ 7C, E2
        jmp     ?_074                                   ; 135F _ EB, 01

?_073:  nop                                             ; 1361 _ 90
?_074:  cmp     dword [ebp-8H], 0                       ; 1362 _ 83. 7D, F8, 00
        jle near      ?_076                                   ; 1366 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 136C _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 136F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1372 _ 8B. 45, 08
        add     edx, 2                                  ; 1375 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1378 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 137B _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 137E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1381 _ 8B. 45, 08
        add     ecx, 2                                  ; 1384 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1387 _ 8B. 44 C8, 04
        add     eax, edx                                ; 138B _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 138D _ 39. 45, 0C
        jne near      ?_076                                   ; 1390 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1396 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1399 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 139C _ 8B. 45, 08
        add     edx, 2                                  ; 139F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13A2 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 13A6 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 13A9 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 13AC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13AF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13B2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13B5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13B8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13BC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13BF _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 13C1 _ 39. 45, F8
        jge near      ?_075                                   ; 13c4 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 13C6 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13C9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13CC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13CF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 13D2 _ 8B. 55, F8
        add     edx, 2                                  ; 13D5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13D8 _ 8B. 04 D0
        cmp     ecx, eax                                ; 13DB _ 39. C1
        jnz near      ?_075                                   ; 13dd _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 13DF _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 13E2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13E5 _ 8B. 45, 08
        add     edx, 2                                  ; 13E8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13EB _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13EF _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 13F2 _ 8B. 4D, F8
        add     ecx, 2                                  ; 13F5 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13F8 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 13FC _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 13FF _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1402 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1405 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1408 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 140B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 140F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1412 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1414 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1417 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 141A _ 89. 10
?_075:  mov     eax, 0                                  ; 141C _ B8, 00000000
        jmp     ?_082                                   ; 1421 _ E9, 0000011B

?_076:  mov     eax, dword [ebp+8H]                     ; 1426 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1429 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 142B _ 39. 45, F8
        jge near      ?_077                                   ; 142e _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1430 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1433 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1436 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1439 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 143C _ 8B. 55, F8
        add     edx, 2                                  ; 143F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1442 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1445 _ 39. C1
        jnz near      ?_077                                   ; 1447 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1449 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 144C _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 144F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1452 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1455 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1458 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 145B _ 8B. 55, F8
        add     edx, 2                                  ; 145E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1461 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1465 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1468 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 146B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 146E _ 8B. 55, F8
        add     edx, 2                                  ; 1471 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1474 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1478 _ B8, 00000000
        jmp     ?_082                                   ; 147D _ E9, 000000BF

?_077:  mov     eax, dword [ebp+8H]                     ; 1482 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1485 _ 8B. 00
        cmp     eax, 4095                               ; 1487 _ 3D, 00000FFF
        jg  near      ?_081                                   ; 148c _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1492 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1495 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1497 _ 89. 45, F4
        jmp     ?_079                                   ; 149A _ EB, 27

?_078:  mov     eax, dword [ebp-0CH]                    ; 149C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 149F _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 14A2 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 14A5 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 14A8 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 14AB _ 8B. 45, 08
        add     edx, 2                                  ; 14AE _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 14B1 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 14B4 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 14B6 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 14B9 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 14BC _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 14C0 _ FF. 4D, F4
?_079:  mov     eax, dword [ebp-0CH]                    ; 14C3 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 14C6 _ 3B. 45, F8
        jg  near      ?_078                                   ; 14c9 _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 14CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14CE _ 8B. 00
        lea     edx, [eax+1H]                           ; 14D0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14D3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 14D6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 14D8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 14DB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14DE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14E1 _ 8B. 00
        cmp     edx, eax                                ; 14E3 _ 39. C2
        jge near      ?_080                                   ; 14e5 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 14E7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 14EA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14EC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14EF _ 89. 50, 04
?_080:  mov     eax, dword [ebp+8H]                     ; 14F2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14F5 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14F8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14FB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14FE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1501 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1504 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1507 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 150A _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 150D _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1511 _ B8, 00000000
        jmp     ?_082                                   ; 1516 _ EB, 29

?_081:  mov     eax, dword [ebp+8H]                     ; 1518 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 151B _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 151E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1521 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1524 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1527 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 152A _ 8B. 40, 08
        mov     edx, eax                                ; 152D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 152F _ 8B. 45, 10
        add     eax, edx                                ; 1532 _ 01. D0
        mov     edx, eax                                ; 1534 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1536 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1539 _ 89. 50, 08
        mov     eax, 4294967295                         ; 153C _ B8, FFFFFFFF
?_082:  add     esp, 16                                 ; 1541 _ 83. C4, 10
        pop     ebx                                     ; 1544 _ 5B
        pop     ebp                                     ; 1545 _ 5D
        ret                                             ; 1546 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1547 _ 55
        mov     ebp, esp                                ; 1548 _ 89. E5
        sub     esp, 16                                 ; 154A _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 154D _ 8B. 45, 0C
        add     eax, 4095                               ; 1550 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1555 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 155A _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 155D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1560 _ FF. 75, 08
        call    memman_alloc                            ; 1563 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1568 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 156B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 156E _ 8B. 45, FC
        leave                                           ; 1571 _ C9
        ret                                             ; 1572 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1573 _ 55
        mov     ebp, esp                                ; 1574 _ 89. E5
        sub     esp, 16                                 ; 1576 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1579 _ 8B. 45, 10
        add     eax, 4095                               ; 157C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1581 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1586 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1589 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 158C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 158F _ FF. 75, 08
        call    memman_free                             ; 1592 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1597 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 159A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 159D _ 8B. 45, FC
        leave                                           ; 15A0 _ C9
        ret                                             ; 15A1 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 15A2 _ 55
        mov     ebp, esp                                ; 15A3 _ 89. E5
        sub     esp, 24                                 ; 15A5 _ 83. EC, 18
        sub     esp, 8                                  ; 15A8 _ 83. EC, 08
        push    9232                                    ; 15AB _ 68, 00002410
        push    dword [ebp+8H]                          ; 15B0 _ FF. 75, 08
        call    memman_alloc_4k                         ; 15B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15B8 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 15BB _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 15BE _ 83. 7D, F0, 00
        jnz near      ?_083                                   ; 15c2 _ 75, 07
        mov     eax, 0                                  ; 15C4 _ B8, 00000000
        jmp     ?_086                                   ; 15C9 _ EB, 53

?_083:  mov     eax, dword [ebp-10H]                    ; 15CB _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 15CE _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 15D1 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 15D3 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 15D6 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 15D9 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 15DC _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 15DF _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 15E2 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 15E5 _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 15E8 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 15EF _ C7. 45, F4, 00000000
        jmp     ?_085                                   ; 15F6 _ EB, 1A

?_084:  mov     eax, dword [ebp-10H]                    ; 15F8 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 15FB _ 8B. 55, F4
        add     edx, 33                                 ; 15FE _ 83. C2, 21
        shl     edx, 5                                  ; 1601 _ C1. E2, 05
        add     eax, edx                                ; 1604 _ 01. D0
        add     eax, 12                                 ; 1606 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 1609 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 160F _ FF. 45, F4
?_085:  cmp     dword [ebp-0CH], 255                    ; 1612 _ 81. 7D, F4, 000000FF
        jle near      ?_084                                   ; 1619 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 161B _ 8B. 45, F0
?_086:  leave                                           ; 161E _ C9
        ret                                             ; 161F _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1620 _ 55
        mov     ebp, esp                                ; 1621 _ 89. E5
        sub     esp, 16                                 ; 1623 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1626 _ C7. 45, FC, 00000000
        jmp     ?_089                                   ; 162D _ EB, 56

?_087:  mov     eax, dword [ebp+8H]                     ; 162F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1632 _ 8B. 55, FC
        add     edx, 33                                 ; 1635 _ 83. C2, 21
        shl     edx, 5                                  ; 1638 _ C1. E2, 05
        add     eax, edx                                ; 163B _ 01. D0
        add     eax, 12                                 ; 163D _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1640 _ 8B. 00
        test    eax, eax                                ; 1642 _ 85. C0
        jnz near      ?_088                                   ; 1644 _ 75, 3c
        mov     eax, dword [ebp-4H]                     ; 1646 _ 8B. 45, FC
        shl     eax, 5                                  ; 1649 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 164C _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1652 _ 8B. 45, 08
        add     eax, edx                                ; 1655 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1657 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 165A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 165D _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1660 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1663 _ 8B. 55, F8
        mov     dword [eax+ecx*4], edx                  ; 1666 _ 89. 14 88
        mov     eax, dword [ebp-8H]                     ; 1669 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 166C _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1673 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1676 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 167D _ 8B. 45, F8
        jmp     ?_090                                   ; 1680 _ EB, 11

?_088:  inc     dword [ebp-4H]                          ; 1682 _ FF. 45, FC
?_089:  cmp     dword [ebp-4H], 255                     ; 1685 _ 81. 7D, FC, 000000FF
        jle near      ?_087                                   ; 168c _ 7e, a1
        mov     eax, 0                                  ; 168E _ B8, 00000000
?_090:  leave                                           ; 1693 _ C9
        ret                                             ; 1694 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1695 _ 55
        mov     ebp, esp                                ; 1696 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1698 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 169B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 169E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 16A0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 16A3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 16A6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16A9 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 16AC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 16AF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 16B2 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 16B5 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 16B8 _ 89. 50, 14
        nop                                             ; 16BB _ 90
        pop     ebp                                     ; 16BC _ 5D
        ret                                             ; 16BD _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 16BE _ 55
        mov     ebp, esp                                ; 16BF _ 89. E5
        push    ebx                                     ; 16C1 _ 53
        sub     esp, 20                                 ; 16C2 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 16C5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 16C8 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 16CB _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 16CE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16D1 _ 8B. 40, 0C
        inc     eax                                     ; 16D4 _ 40
        cmp     dword [ebp+10H], eax                    ; 16D5 _ 39. 45, 10
        jle near      ?_091                                   ; 16d8 _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 16DA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16DD _ 8B. 40, 0C
        inc     eax                                     ; 16E0 _ 40
        mov     dword [ebp+10H], eax                    ; 16E1 _ 89. 45, 10
?_091:  cmp     dword [ebp+10H], -1                     ; 16E4 _ 83. 7D, 10, FF
        jge near      ?_092                                   ; 16e8 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 16EA _ C7. 45, 10, FFFFFFFF
?_092:  mov     eax, dword [ebp+0CH]                    ; 16F1 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 16F4 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 16F7 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 16FA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 16FD _ 3B. 45, 10
        jle near      ?_100                                   ; 1700 _ 0f 8e, 000000f5
        cmp     dword [ebp+10H], 0                      ; 1706 _ 83. 7D, 10, 00
        js      ?_095                                   ; 170A _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 170C _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 170F _ 89. 45, F4
        jmp     ?_094                                   ; 1712 _ EB, 30

?_093:  mov     eax, dword [ebp-0CH]                    ; 1714 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1717 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 171A _ 8B. 45, 08
        add     edx, 4                                  ; 171D _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1720 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1723 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1726 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1729 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 172C _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 172F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1732 _ 8B. 55, F4
        add     edx, 4                                  ; 1735 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1738 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 173B _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 173E _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1741 _ FF. 4D, F4
?_094:  mov     eax, dword [ebp-0CH]                    ; 1744 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1747 _ 3B. 45, 10
        jg  near      ?_093                                   ; 174a _ 7f, c8
        mov     eax, dword [ebp+8H]                     ; 174C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 174F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1752 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1755 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1758 _ 89. 14 88
        jmp     ?_099                                   ; 175B _ EB, 5D

?_095:  mov     eax, dword [ebp+8H]                     ; 175D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1760 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1763 _ 39. 45, F0
        jge near      ?_098                                   ; 1766 _ 7d, 43
        mov     eax, dword [ebp-10H]                    ; 1768 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 176B _ 89. 45, F4
        jmp     ?_097                                   ; 176E _ EB, 30

?_096:  mov     eax, dword [ebp-0CH]                    ; 1770 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1773 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1776 _ 8B. 45, 08
        add     edx, 4                                  ; 1779 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 177C _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 177F _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1782 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1785 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1788 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 178B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 178E _ 8B. 55, F4
        add     edx, 4                                  ; 1791 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1794 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1797 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 179A _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 179D _ FF. 45, F4
?_097:  mov     eax, dword [ebp+8H]                     ; 17A0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17A3 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 17A6 _ 39. 45, F4
        jl      ?_096                                   ; 17A9 _ 7C, C5
?_098:  mov     eax, dword [ebp+8H]                     ; 17AB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17AE _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 17B1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17B4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17B7 _ 89. 50, 0C
?_099:  mov     eax, dword [ebp+0CH]                    ; 17BA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 17BD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 17C0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 17C3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 17C6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 17C9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 17CC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 17CF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 17D2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 17D5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 17D8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 17DB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 17DE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 17E1 _ 8B. 40, 0C
        sub     esp, 12                                 ; 17E4 _ 83. EC, 0C
        push    ebx                                     ; 17E7 _ 53
        push    ecx                                     ; 17E8 _ 51
        push    edx                                     ; 17E9 _ 52
        push    eax                                     ; 17EA _ 50
        push    dword [ebp+8H]                          ; 17EB _ FF. 75, 08
        call    sheet_refreshsub                        ; 17EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17F3 _ 83. C4, 20
        jmp     ?_107                                   ; 17F6 _ E9, 00000104

?_100:  mov     eax, dword [ebp-10H]                    ; 17FB _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 17FE _ 3B. 45, 10
        jge near      ?_107                                   ; 1801 _ 0f 8d, 000000f8
        cmp     dword [ebp-10H], 0                      ; 1807 _ 83. 7D, F0, 00
        js      ?_103                                   ; 180B _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 180D _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1810 _ 89. 45, F4
        jmp     ?_102                                   ; 1813 _ EB, 30

?_101:  mov     eax, dword [ebp-0CH]                    ; 1815 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1818 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 181B _ 8B. 45, 08
        add     edx, 4                                  ; 181E _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1821 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1824 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1827 _ 8B. 4D, F4
        add     ecx, 4                                  ; 182A _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 182D _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1830 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1833 _ 8B. 55, F4
        add     edx, 4                                  ; 1836 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1839 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 183C _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 183F _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1842 _ FF. 45, F4
?_102:  mov     eax, dword [ebp-0CH]                    ; 1845 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1848 _ 3B. 45, 10
        jl      ?_101                                   ; 184B _ 7C, C8
        mov     eax, dword [ebp+8H]                     ; 184D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1850 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1853 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1856 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1859 _ 89. 14 88
        jmp     ?_106                                   ; 185C _ EB, 65

?_103:  mov     eax, dword [ebp+8H]                     ; 185E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1861 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1864 _ 89. 45, F4
        jmp     ?_105                                   ; 1867 _ EB, 34

?_104:  mov     eax, dword [ebp-0CH]                    ; 1869 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 186C _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 186F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1872 _ 8B. 55, F4
        add     edx, 4                                  ; 1875 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1878 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 187B _ 8B. 45, 08
        add     ecx, 4                                  ; 187E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1881 _ 89. 14 88
        mov     eax, dword [ebp-0CH]                    ; 1884 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1887 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 188A _ 8B. 45, 08
        add     edx, 4                                  ; 188D _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1890 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1893 _ 8B. 55, F4
        inc     edx                                     ; 1896 _ 42
        mov     dword [eax+18H], edx                    ; 1897 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 189A _ FF. 4D, F4
?_105:  mov     eax, dword [ebp-0CH]                    ; 189D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 18A0 _ 3B. 45, 10
        jge near      ?_104                                   ; 18a3 _ 7d, c4
        mov     eax, dword [ebp+8H]                     ; 18A5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 18A8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 18AB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 18AE _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 18B1 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 18B4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 18B7 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 18BA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18BD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 18C0 _ 89. 50, 0C
?_106:  mov     eax, dword [ebp+0CH]                    ; 18C3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 18C6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 18C9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 18CC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 18CF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 18D2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 18D5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 18D8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 18DB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 18DE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 18E1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 18E4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 18E7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 18EA _ 8B. 40, 0C
        sub     esp, 12                                 ; 18ED _ 83. EC, 0C
        push    ebx                                     ; 18F0 _ 53
        push    ecx                                     ; 18F1 _ 51
        push    edx                                     ; 18F2 _ 52
        push    eax                                     ; 18F3 _ 50
        push    dword [ebp+8H]                          ; 18F4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 18F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18FC _ 83. C4, 20
?_107:  nop                                             ; 18FF _ 90
        mov     ebx, dword [ebp-4H]                     ; 1900 _ 8B. 5D, FC
        leave                                           ; 1903 _ C9
        ret                                             ; 1904 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1905 _ 55
        mov     ebp, esp                                ; 1906 _ 89. E5
        push    esi                                     ; 1908 _ 56
        push    ebx                                     ; 1909 _ 53
        mov     eax, dword [ebp+0CH]                    ; 190A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 190D _ 8B. 40, 18
        test    eax, eax                                ; 1910 _ 85. C0
        js      ?_108                                   ; 1912 _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 1914 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1917 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 191A _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 191D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1920 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1923 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1926 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1929 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 192C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 192F _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1932 _ 8B. 45, 14
        add     edx, eax                                ; 1935 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1937 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 193A _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 193D _ 8B. 45, 10
        add     eax, esi                                ; 1940 _ 01. F0
        sub     esp, 12                                 ; 1942 _ 83. EC, 0C
        push    ebx                                     ; 1945 _ 53
        push    ecx                                     ; 1946 _ 51
        push    edx                                     ; 1947 _ 52
        push    eax                                     ; 1948 _ 50
        push    dword [ebp+8H]                          ; 1949 _ FF. 75, 08
        call    sheet_refreshsub                        ; 194C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1951 _ 83. C4, 20
?_108:  mov     eax, 0                                  ; 1954 _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1959 _ 8D. 65, F8
        pop     ebx                                     ; 195C _ 5B
        pop     esi                                     ; 195D _ 5E
        pop     ebp                                     ; 195E _ 5D
        ret                                             ; 195F _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1960 _ 55
        mov     ebp, esp                                ; 1961 _ 89. E5
        sub     esp, 24                                 ; 1963 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1966 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1969 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 196C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 196F _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1972 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1975 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1978 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 197B _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 197E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1981 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1984 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1987 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 198A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 198D _ 8B. 40, 18
        test    eax, eax                                ; 1990 _ 85. C0
        js      ?_109                                   ; 1992 _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 1994 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1997 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 199A _ 8B. 45, F0
        add     edx, eax                                ; 199D _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 199F _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 19A2 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 19A5 _ 8B. 45, F4
        add     eax, ecx                                ; 19A8 _ 01. C8
        sub     esp, 12                                 ; 19AA _ 83. EC, 0C
        push    edx                                     ; 19AD _ 52
        push    eax                                     ; 19AE _ 50
        push    dword [ebp-10H]                         ; 19AF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 19B2 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 19B5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 19B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19BD _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 19C0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 19C3 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 19C6 _ 8B. 45, 14
        add     edx, eax                                ; 19C9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 19CB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 19CE _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 19D1 _ 8B. 45, 10
        add     eax, ecx                                ; 19D4 _ 01. C8
        sub     esp, 12                                 ; 19D6 _ 83. EC, 0C
        push    edx                                     ; 19D9 _ 52
        push    eax                                     ; 19DA _ 50
        push    dword [ebp+14H]                         ; 19DB _ FF. 75, 14
        push    dword [ebp+10H]                         ; 19DE _ FF. 75, 10
        push    dword [ebp+8H]                          ; 19E1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 19E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19E9 _ 83. C4, 20
?_109:  nop                                             ; 19EC _ 90
        leave                                           ; 19ED _ C9
        ret                                             ; 19EE _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 19EF _ 55
        mov     ebp, esp                                ; 19F0 _ 89. E5
        sub     esp, 48                                 ; 19F2 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 19F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19F8 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 19FA _ 89. 45, F0
        mov     dword [ebp-4H], 0                       ; 19FD _ C7. 45, FC, 00000000
        jmp     ?_116                                   ; 1A04 _ E9, 000000D7

?_110:  mov     eax, dword [ebp+8H]                     ; 1A09 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1A0C _ 8B. 55, FC
        add     edx, 4                                  ; 1A0F _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A12 _ 8B. 04 90
        mov     dword [ebp-14H], eax                    ; 1A15 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 1A18 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 1A1B _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 1A1D _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 1A20 _ C7. 45, F4, 00000000
        jmp     ?_115                                   ; 1A27 _ E9, 000000A2

?_111:  mov     eax, dword [ebp-14H]                    ; 1A2C _ 8B. 45, EC
        mov     edx, dword [eax+10H]                    ; 1A2F _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 1A32 _ 8B. 45, F4
        add     eax, edx                                ; 1A35 _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 1A37 _ 89. 45, E4
        mov     dword [ebp-8H], 0                       ; 1A3A _ C7. 45, F8, 00000000
        jmp     ?_114                                   ; 1A41 _ EB, 79

?_112:  mov     eax, dword [ebp-14H]                    ; 1A43 _ 8B. 45, EC
        mov     edx, dword [eax+0CH]                    ; 1A46 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 1A49 _ 8B. 45, F8
        add     eax, edx                                ; 1A4C _ 01. D0
        mov     dword [ebp-20H], eax                    ; 1A4E _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 1A51 _ 8B. 45, 0C
        cmp     eax, dword [ebp-20H]                    ; 1A54 _ 3B. 45, E0
        jg  near      ?_113                                   ; 1a57 _ 7f, 60
        mov     eax, dword [ebp-20H]                    ; 1A59 _ 8B. 45, E0
        cmp     eax, dword [ebp+14H]                    ; 1A5C _ 3B. 45, 14
        jge near      ?_113                                   ; 1a5f _ 7d, 58
        mov     eax, dword [ebp+10H]                    ; 1A61 _ 8B. 45, 10
        cmp     eax, dword [ebp-1CH]                    ; 1A64 _ 3B. 45, E4
        jg  near      ?_113                                   ; 1a67 _ 7f, 50
        mov     eax, dword [ebp-1CH]                    ; 1A69 _ 8B. 45, E4
        cmp     eax, dword [ebp+18H]                    ; 1A6C _ 3B. 45, 18
        jge near      ?_113                                   ; 1a6f _ 7d, 48
        mov     eax, dword [ebp-14H]                    ; 1A71 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1A74 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1A77 _ 0F AF. 45, F4
        mov     edx, eax                                ; 1A7B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1A7D _ 8B. 45, F8
        add     eax, edx                                ; 1A80 _ 01. D0
        mov     edx, eax                                ; 1A82 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1A84 _ 8B. 45, E8
        add     eax, edx                                ; 1A87 _ 01. D0
        mov     al, byte [eax]                          ; 1A89 _ 8A. 00
        mov     byte [ebp-21H], al                      ; 1A8B _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1A8E _ 0F B6. 55, DF
        mov     eax, dword [ebp-14H]                    ; 1A92 _ 8B. 45, EC
        mov     eax, dword [eax+14H]                    ; 1A95 _ 8B. 40, 14
        cmp     edx, eax                                ; 1A98 _ 39. C2
        jz near       ?_113                                   ; 1a9a _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 1A9C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A9F _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 1AA2 _ 0F AF. 45, E4
        mov     edx, eax                                ; 1AA6 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1AA8 _ 8B. 45, E0
        add     eax, edx                                ; 1AAB _ 01. D0
        mov     edx, eax                                ; 1AAD _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1AAF _ 8B. 45, F0
        add     edx, eax                                ; 1AB2 _ 01. C2
        mov     al, byte [ebp-21H]                      ; 1AB4 _ 8A. 45, DF
        mov     byte [edx], al                          ; 1AB7 _ 88. 02
?_113:  inc     dword [ebp-8H]                          ; 1AB9 _ FF. 45, F8
?_114:  mov     eax, dword [ebp-14H]                    ; 1ABC _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1ABF _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 1AC2 _ 39. 45, F8
        jl      ?_112                                   ; 1AC5 _ 0F 8C, FFFFFF78
        inc     dword [ebp-0CH]                         ; 1ACB _ FF. 45, F4
?_115:  mov     eax, dword [ebp-14H]                    ; 1ACE _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1AD1 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 1AD4 _ 39. 45, F4
        jl      ?_111                                   ; 1AD7 _ 0F 8C, FFFFFF4F
        inc     dword [ebp-4H]                          ; 1ADD _ FF. 45, FC
?_116:  mov     eax, dword [ebp+8H]                     ; 1AE0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AE3 _ 8B. 40, 0C
        cmp     dword [ebp-4H], eax                     ; 1AE6 _ 39. 45, FC
        jle near      ?_110                                   ; 1ae9 _ 0f 8e, ffffff1a
        nop                                             ; 1AEF _ 90
        nop                                             ; 1AF0 _ 90
        leave                                           ; 1AF1 _ C9
        ret                                             ; 1AF2 _ C3
; sheet_refreshsub End of function



?_117:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0000 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0008 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0010 _ howing.

?_118:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0017 _ page is:
        db 20H, 00H                                     ; 001F _  .

?_119:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0021 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0029 _ L: .

?_120:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002D _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0035 _ H: .

?_121:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0039 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0041 _ w: .

?_122:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0045 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004D _ gh: .

?_123:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0052 _ type: .



memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_124:  db 00H                                          ; 0006 _ .

?_125:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1767:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1814:                                            ; byte
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

str.1862:                                               ; byte
        resb    1                                       ; 0220

?_128:  resb    9                                       ; 0221

?_129:  resb    1                                       ; 022A


