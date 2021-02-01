; Disassembly of file: ckernel.o
; Sat Jan 30 19:46:19 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-14H], eax                    ; 001C _ 89. 45, EC
        mov     eax, dword [?_141]                      ; 001F _ A1, 00000004(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 000000F8(d)
        mov     ax, word [?_142]                        ; 002A _ 66: A1, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ysize], eax                      ; 0031 _ A3, 000000FC(d)
        mov     dword [ebp-18H], 0                      ; 0036 _ C7. 45, E8, 00000000
        mov     dword [ebp-1CH], 0                      ; 003D _ C7. 45, E4, 00000000
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
        mov     dword [ebp-20H], eax                    ; 0084 _ 89. 45, E0
        call    get_adr_buffer                          ; 0087 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 008C _ 89. 45, DC
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
        push    dword [ebp-14H]                         ; 00CE _ FF. 75, EC
        push    eax                                     ; 00D1 _ 50
        call    shtctl_init                             ; 00D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D7 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 00DA _ 89. 45, D8
        sub     esp, 12                                 ; 00DD _ 83. EC, 0C
        push    dword [ebp-28H]                         ; 00E0 _ FF. 75, D8
        call    sheet_alloc                             ; 00E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00E8 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 00EB _ 89. 45, E8
        sub     esp, 12                                 ; 00EE _ 83. EC, 0C
        push    dword [ebp-28H]                         ; 00F1 _ FF. 75, D8
        call    sheet_alloc                             ; 00F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F9 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 00FC _ 89. 45, E4
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
        push    dword [ebp-18H]                         ; 013D _ FF. 75, E8
        call    sheet_setbuf                            ; 0140 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0145 _ 83. C4, 20
        sub     esp, 12                                 ; 0148 _ 83. EC, 0C
        push    99                                      ; 014B _ 6A, 63
        push    16                                      ; 014D _ 6A, 10
        push    16                                      ; 014F _ 6A, 10
        push    buf_mouse                               ; 0151 _ 68, 00000120(d)
        push    dword [ebp-1CH]                         ; 0156 _ FF. 75, E4
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
        push    dword [ebp-18H]                         ; 0196 _ FF. 75, E8
        push    dword [ebp-28H]                         ; 0199 _ FF. 75, D8
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
        push    dword [ebp-1CH]                         ; 01DD _ FF. 75, E4
        push    dword [ebp-28H]                         ; 01E0 _ FF. 75, D8
        call    sheet_slide                             ; 01E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01E8 _ 83. C4, 10
        sub     esp, 8                                  ; 01EB _ 83. EC, 08
        push    ?_129                                   ; 01EE _ 68, 00000000(d)
        push    dword [ebp-28H]                         ; 01F3 _ FF. 75, D8
        call    message_box                             ; 01F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01FB _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 01FE _ 89. 45, D4
        sub     esp, 4                                  ; 0201 _ 83. EC, 04
        push    0                                       ; 0204 _ 6A, 00
        push    dword [ebp-18H]                         ; 0206 _ FF. 75, E8
        push    dword [ebp-28H]                         ; 0209 _ FF. 75, D8
        call    sheet_updown                            ; 020C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0211 _ 83. C4, 10
        sub     esp, 4                                  ; 0214 _ 83. EC, 04
        push    1                                       ; 0217 _ 6A, 01
        push    dword [ebp-1CH]                         ; 0219 _ FF. 75, E4
        push    dword [ebp-28H]                         ; 021C _ FF. 75, D8
        call    sheet_updown                            ; 021F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0224 _ 83. C4, 10
        call    io_sti                                  ; 0227 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 022C _ 83. EC, 0C
        push    mdec                                    ; 022F _ 68, 000000E0(d)
        call    enable_mouse                            ; 0234 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0239 _ 83. C4, 10
        mov     dword [ebp-30H], 0                      ; 023C _ C7. 45, D0, 00000000
        mov     dword [ebp-0CH], 0                      ; 0243 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 024A _ C7. 45, F0, 00000000
?_001:  mov     eax, dword [ebp-10H]                    ; 0251 _ 8B. 45, F0
        sub     esp, 12                                 ; 0254 _ 83. EC, 0C
        push    eax                                     ; 0257 _ 50
        call    intToHexStr                             ; 0258 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025D _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0260 _ 89. 45, CC
        inc     dword [ebp-10H]                         ; 0263 _ FF. 45, F0
        mov     eax, dword [ebp-2CH]                    ; 0266 _ 8B. 45, D4
        mov     eax, dword [eax]                        ; 0269 _ 8B. 00
        sub     esp, 4                                  ; 026B _ 83. EC, 04
        push    43                                      ; 026E _ 6A, 2B
        push    119                                     ; 0270 _ 6A, 77
        push    28                                      ; 0272 _ 6A, 1C
        push    40                                      ; 0274 _ 6A, 28
        push    8                                       ; 0276 _ 6A, 08
        push    160                                     ; 0278 _ 68, 000000A0
        push    eax                                     ; 027D _ 50
        call    boxfill8                                ; 027E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0283 _ 83. C4, 20
        sub     esp, 8                                  ; 0286 _ 83. EC, 08
        push    dword [ebp-34H]                         ; 0289 _ FF. 75, CC
        push    0                                       ; 028C _ 6A, 00
        push    28                                      ; 028E _ 6A, 1C
        push    40                                      ; 0290 _ 6A, 28
        push    dword [ebp-2CH]                         ; 0292 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 0295 _ FF. 75, D8
        call    showString                              ; 0298 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 029D _ 83. C4, 20
        call    io_cli                                  ; 02A0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02A5 _ 83. EC, 0C
        push    keyinfo                                 ; 02A8 _ 68, 00000008(d)
        call    fifo8_status                            ; 02AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B2 _ 83. C4, 10
        mov     ebx, eax                                ; 02B5 _ 89. C3
        sub     esp, 12                                 ; 02B7 _ 83. EC, 0C
        push    mouseinfo                               ; 02BA _ 68, 00000020(d)
        call    fifo8_status                            ; 02BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C4 _ 83. C4, 10
        add     eax, ebx                                ; 02C7 _ 01. D8
        test    eax, eax                                ; 02C9 _ 85. C0
        jnz near      ?_002                                   ; 02cb _ 75, 0a
        call    io_sti                                  ; 02CD _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02D2 _ E9, FFFFFF7A

?_002:  sub     esp, 12                                 ; 02D7 _ 83. EC, 0C
        push    keyinfo                                 ; 02DA _ 68, 00000008(d)
        call    fifo8_status                            ; 02DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E4 _ 83. C4, 10
        test    eax, eax                                ; 02E7 _ 85. C0
        jz near       ?_003                                   ; 02e9 _ 74, 76
        call    io_sti                                  ; 02EB _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02F0 _ 83. EC, 0C
        push    keyinfo                                 ; 02F3 _ 68, 00000008(d)
        call    fifo8_get                               ; 02F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FD _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 0300 _ 89. 45, D0
        cmp     dword [ebp-30H], 28                     ; 0303 _ 83. 7D, D0, 1C
        jne near      ?_001                                   ; 0307 _ 0f 85, ffffff44
        mov     ecx, dword [xsize]                      ; 030D _ 8B. 0D, 000000F8(d)
        mov     edx, dword [buf_back]                   ; 0313 _ 8B. 15, 00000100(d)
        mov     ebx, dword [ebp-0CH]                    ; 0319 _ 8B. 5D, F4
        mov     eax, ebx                                ; 031C _ 89. D8
        shl     eax, 2                                  ; 031E _ C1. E0, 02
        add     eax, ebx                                ; 0321 _ 01. D8
        shl     eax, 2                                  ; 0323 _ C1. E0, 02
        mov     ebx, eax                                ; 0326 _ 89. C3
        mov     eax, dword [ebp-24H]                    ; 0328 _ 8B. 45, DC
        add     eax, ebx                                ; 032B _ 01. D8
        sub     esp, 4                                  ; 032D _ 83. EC, 04
        push    7                                       ; 0330 _ 6A, 07
        push    ecx                                     ; 0332 _ 51
        push    dword [ebp-0CH]                         ; 0333 _ FF. 75, F4
        push    edx                                     ; 0336 _ 52
        push    eax                                     ; 0337 _ 50
        push    dword [ebp-18H]                         ; 0338 _ FF. 75, E8
        push    dword [ebp-28H]                         ; 033B _ FF. 75, D8
        call    showMemoryInfo                          ; 033E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0343 _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 0346 _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0349 _ 8B. 45, F4
        cmp     eax, dword [ebp-20H]                    ; 034C _ 3B. 45, E0
        jle near      ?_001                                   ; 034f _ 0f 8e, fffffefc
        mov     dword [ebp-0CH], 0                      ; 0355 _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 035C _ E9, FFFFFEF0

?_003:  sub     esp, 12                                 ; 0361 _ 83. EC, 0C
        push    mouseinfo                               ; 0364 _ 68, 00000020(d)
        call    fifo8_status                            ; 0369 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 036E _ 83. C4, 10
        test    eax, eax                                ; 0371 _ 85. C0
        je      ?_001                                   ; 0373 _ 0F 84, FFFFFED8
        sub     esp, 4                                  ; 0379 _ 83. EC, 04
        push    dword [ebp-1CH]                         ; 037C _ FF. 75, E4
        push    dword [ebp-18H]                         ; 037F _ FF. 75, E8
        push    dword [ebp-28H]                         ; 0382 _ FF. 75, D8
        call    show_mouse_info                         ; 0385 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 038A _ 83. C4, 10
        jmp     ?_001                                   ; 038D _ E9, FFFFFEBF
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0392 _ 55
        mov     ebp, esp                                ; 0393 _ 89. E5
        push    ebx                                     ; 0395 _ 53
        sub     esp, 4                                  ; 0396 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0399 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 039C _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 039F _ 8B. 45, 0C
        dec     eax                                     ; 03A2 _ 48
        sub     esp, 4                                  ; 03A3 _ 83. EC, 04
        push    edx                                     ; 03A6 _ 52
        push    eax                                     ; 03A7 _ 50
        push    0                                       ; 03A8 _ 6A, 00
        push    0                                       ; 03AA _ 6A, 00
        push    14                                      ; 03AC _ 6A, 0E
        push    dword [ebp+0CH]                         ; 03AE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03B1 _ FF. 75, 08
        call    boxfill8                                ; 03B4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03B9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03BC _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 03BF _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 03C2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03C5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03C8 _ 8B. 45, 10
        sub     eax, 28                                 ; 03CB _ 83. E8, 1C
        sub     esp, 4                                  ; 03CE _ 83. EC, 04
        push    ecx                                     ; 03D1 _ 51
        push    edx                                     ; 03D2 _ 52
        push    eax                                     ; 03D3 _ 50
        push    0                                       ; 03D4 _ 6A, 00
        push    8                                       ; 03D6 _ 6A, 08
        push    dword [ebp+0CH]                         ; 03D8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03DB _ FF. 75, 08
        call    boxfill8                                ; 03DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03E3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03E6 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 03E9 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 03EC _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03EF _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03F2 _ 8B. 45, 10
        sub     eax, 27                                 ; 03F5 _ 83. E8, 1B
        sub     esp, 4                                  ; 03F8 _ 83. EC, 04
        push    ecx                                     ; 03FB _ 51
        push    edx                                     ; 03FC _ 52
        push    eax                                     ; 03FD _ 50
        push    0                                       ; 03FE _ 6A, 00
        push    7                                       ; 0400 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0402 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0405 _ FF. 75, 08
        call    boxfill8                                ; 0408 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 040D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0410 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0413 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0416 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0419 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 041C _ 8B. 45, 10
        sub     eax, 26                                 ; 041F _ 83. E8, 1A
        sub     esp, 4                                  ; 0422 _ 83. EC, 04
        push    ecx                                     ; 0425 _ 51
        push    edx                                     ; 0426 _ 52
        push    eax                                     ; 0427 _ 50
        push    0                                       ; 0428 _ 6A, 00
        push    8                                       ; 042A _ 6A, 08
        push    dword [ebp+0CH]                         ; 042C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 042F _ FF. 75, 08
        call    boxfill8                                ; 0432 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0437 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 043A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 043D _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0440 _ 8B. 45, 10
        sub     eax, 24                                 ; 0443 _ 83. E8, 18
        sub     esp, 4                                  ; 0446 _ 83. EC, 04
        push    edx                                     ; 0449 _ 52
        push    59                                      ; 044A _ 6A, 3B
        push    eax                                     ; 044C _ 50
        push    3                                       ; 044D _ 6A, 03
        push    7                                       ; 044F _ 6A, 07
        push    dword [ebp+0CH]                         ; 0451 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0454 _ FF. 75, 08
        call    boxfill8                                ; 0457 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 045C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 045F _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0462 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0465 _ 8B. 45, 10
        sub     eax, 24                                 ; 0468 _ 83. E8, 18
        sub     esp, 4                                  ; 046B _ 83. EC, 04
        push    edx                                     ; 046E _ 52
        push    2                                       ; 046F _ 6A, 02
        push    eax                                     ; 0471 _ 50
        push    2                                       ; 0472 _ 6A, 02
        push    7                                       ; 0474 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0476 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0479 _ FF. 75, 08
        call    boxfill8                                ; 047C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0481 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0484 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0487 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 048A _ 8B. 45, 10
        sub     eax, 4                                  ; 048D _ 83. E8, 04
        sub     esp, 4                                  ; 0490 _ 83. EC, 04
        push    edx                                     ; 0493 _ 52
        push    59                                      ; 0494 _ 6A, 3B
        push    eax                                     ; 0496 _ 50
        push    3                                       ; 0497 _ 6A, 03
        push    15                                      ; 0499 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 049B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 049E _ FF. 75, 08
        call    boxfill8                                ; 04A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04A9 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 04AC _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 04AF _ 8B. 45, 10
        sub     eax, 23                                 ; 04B2 _ 83. E8, 17
        sub     esp, 4                                  ; 04B5 _ 83. EC, 04
        push    edx                                     ; 04B8 _ 52
        push    59                                      ; 04B9 _ 6A, 3B
        push    eax                                     ; 04BB _ 50
        push    59                                      ; 04BC _ 6A, 3B
        push    15                                      ; 04BE _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04C3 _ FF. 75, 08
        call    boxfill8                                ; 04C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04CB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04CE _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 04D1 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 04D4 _ 8B. 45, 10
        sub     eax, 3                                  ; 04D7 _ 83. E8, 03
        sub     esp, 4                                  ; 04DA _ 83. EC, 04
        push    edx                                     ; 04DD _ 52
        push    59                                      ; 04DE _ 6A, 3B
        push    eax                                     ; 04E0 _ 50
        push    2                                       ; 04E1 _ 6A, 02
        push    0                                       ; 04E3 _ 6A, 00
        push    dword [ebp+0CH]                         ; 04E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04E8 _ FF. 75, 08
        call    boxfill8                                ; 04EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04F0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04F3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 04F6 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 04F9 _ 8B. 45, 10
        sub     eax, 24                                 ; 04FC _ 83. E8, 18
        sub     esp, 4                                  ; 04FF _ 83. EC, 04
        push    edx                                     ; 0502 _ 52
        push    60                                      ; 0503 _ 6A, 3C
        push    eax                                     ; 0505 _ 50
        push    60                                      ; 0506 _ 6A, 3C
        push    0                                       ; 0508 _ 6A, 00
        push    dword [ebp+0CH]                         ; 050A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 050D _ FF. 75, 08
        call    boxfill8                                ; 0510 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0515 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0518 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 051B _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 051E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0521 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0524 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0527 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 052A _ 8B. 45, 0C
        sub     eax, 47                                 ; 052D _ 83. E8, 2F
        sub     esp, 4                                  ; 0530 _ 83. EC, 04
        push    ebx                                     ; 0533 _ 53
        push    ecx                                     ; 0534 _ 51
        push    edx                                     ; 0535 _ 52
        push    eax                                     ; 0536 _ 50
        push    15                                      ; 0537 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0539 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 053C _ FF. 75, 08
        call    boxfill8                                ; 053F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0544 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0547 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 054A _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 054D _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0550 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0553 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0556 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0559 _ 8B. 45, 0C
        sub     eax, 47                                 ; 055C _ 83. E8, 2F
        sub     esp, 4                                  ; 055F _ 83. EC, 04
        push    ebx                                     ; 0562 _ 53
        push    ecx                                     ; 0563 _ 51
        push    edx                                     ; 0564 _ 52
        push    eax                                     ; 0565 _ 50
        push    15                                      ; 0566 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0568 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 056B _ FF. 75, 08
        call    boxfill8                                ; 056E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0573 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0576 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0579 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 057C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 057F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0582 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0585 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0588 _ 8B. 45, 0C
        sub     eax, 47                                 ; 058B _ 83. E8, 2F
        sub     esp, 4                                  ; 058E _ 83. EC, 04
        push    ebx                                     ; 0591 _ 53
        push    ecx                                     ; 0592 _ 51
        push    edx                                     ; 0593 _ 52
        push    eax                                     ; 0594 _ 50
        push    7                                       ; 0595 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0597 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 059A _ FF. 75, 08
        call    boxfill8                                ; 059D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05A2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 05A5 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 05A8 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 05AB _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 05AE _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 05B1 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05B4 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05B7 _ 8B. 45, 0C
        sub     eax, 3                                  ; 05BA _ 83. E8, 03
        sub     esp, 4                                  ; 05BD _ 83. EC, 04
        push    ebx                                     ; 05C0 _ 53
        push    ecx                                     ; 05C1 _ 51
        push    edx                                     ; 05C2 _ 52
        push    eax                                     ; 05C3 _ 50
        push    7                                       ; 05C4 _ 6A, 07
        push    dword [ebp+0CH]                         ; 05C6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05C9 _ FF. 75, 08
        call    boxfill8                                ; 05CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05D1 _ 83. C4, 20
        nop                                             ; 05D4 _ 90
        mov     ebx, dword [ebp-4H]                     ; 05D5 _ 8B. 5D, FC
        leave                                           ; 05D8 _ C9
        ret                                             ; 05D9 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 05DA _ 55
        mov     ebp, esp                                ; 05DB _ 89. E5
        sub     esp, 8                                  ; 05DD _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 05E0 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 05E3 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 05E6 _ A1, 000000F0(d)
        add     eax, edx                                ; 05EB _ 01. D0
        mov     dword [mx], eax                         ; 05ED _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 05F2 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 05F5 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 05F8 _ A1, 000000F4(d)
        add     eax, edx                                ; 05FD _ 01. D0
        mov     dword [my], eax                         ; 05FF _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0604 _ A1, 000000F0(d)
        test    eax, eax                                ; 0609 _ 85. C0
        jns     ?_004                                   ; 060B _ 79, 0A
        mov     dword [mx], 0                           ; 060D _ C7. 05, 000000F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 0617 _ A1, 000000F4(d)
        test    eax, eax                                ; 061C _ 85. C0
        jns     ?_005                                   ; 061E _ 79, 0A
        mov     dword [my], 0                           ; 0620 _ C7. 05, 000000F4(d), 00000000
?_005:  mov     edx, dword [xsize]                      ; 062A _ 8B. 15, 000000F8(d)
        mov     eax, dword [mx]                         ; 0630 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 0635 _ 39. C2
        jg  near      ?_006                                   ; 0637 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 0639 _ A1, 000000F8(d)
        dec     eax                                     ; 063E _ 48
        mov     dword [mx], eax                         ; 063F _ A3, 000000F0(d)
?_006:  mov     edx, dword [ysize]                      ; 0644 _ 8B. 15, 000000FC(d)
        mov     eax, dword [my]                         ; 064A _ A1, 000000F4(d)
        cmp     edx, eax                                ; 064F _ 39. C2
        jg  near      ?_007                                   ; 0651 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 0653 _ A1, 000000FC(d)
        dec     eax                                     ; 0658 _ 48
        mov     dword [my], eax                         ; 0659 _ A3, 000000F4(d)
?_007:  sub     esp, 8                                  ; 065E _ 83. EC, 08
        push    ?_130                                   ; 0661 _ 68, 00000008(d)
        push    7                                       ; 0666 _ 6A, 07
        push    0                                       ; 0668 _ 6A, 00
        push    0                                       ; 066A _ 6A, 00
        push    dword [ebp+0CH]                         ; 066C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 066F _ FF. 75, 08
        call    showString                              ; 0672 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0677 _ 83. C4, 20
        nop                                             ; 067A _ 90
        leave                                           ; 067B _ C9
        ret                                             ; 067C _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 067D _ 55
        mov     ebp, esp                                ; 067E _ 89. E5
        sub     esp, 24                                 ; 0680 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0683 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0688 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 068B _ C6. 45, F3, 00
        call    io_sti                                  ; 068F _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0694 _ 83. EC, 0C
        push    mouseinfo                               ; 0697 _ 68, 00000020(d)
        call    fifo8_get                               ; 069C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A1 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 06A4 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 06A7 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 06AB _ 83. EC, 08
        push    eax                                     ; 06AE _ 50
        push    mdec                                    ; 06AF _ 68, 000000E0(d)
        call    mouse_decode                            ; 06B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B9 _ 83. C4, 10
        test    eax, eax                                ; 06BC _ 85. C0
        jz near       ?_008                                   ; 06be _ 74, 31
        sub     esp, 4                                  ; 06C0 _ 83. EC, 04
        push    mdec                                    ; 06C3 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 06C8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06CB _ FF. 75, 08
        call    computeMousePosition                    ; 06CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D3 _ 83. C4, 10
        mov     edx, dword [my]                         ; 06D6 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 06DC _ A1, 000000F0(d)
        push    edx                                     ; 06E1 _ 52
        push    eax                                     ; 06E2 _ 50
        push    dword [ebp+10H]                         ; 06E3 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 06E6 _ FF. 75, 08
        call    sheet_slide                             ; 06E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06EE _ 83. C4, 10
?_008:  nop                                             ; 06F1 _ 90
        leave                                           ; 06F2 _ C9
        ret                                             ; 06F3 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 06F4 _ 55
        mov     ebp, esp                                ; 06F5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 06F7 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 06FA _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0700 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0703 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0709 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 070C _ 66: C7. 40, 06, 00C8
        nop                                             ; 0712 _ 90
        pop     ebp                                     ; 0713 _ 5D
        ret                                             ; 0714 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0715 _ 55
        mov     ebp, esp                                ; 0716 _ 89. E5
        push    ebx                                     ; 0718 _ 53
        sub     esp, 36                                 ; 0719 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 071C _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 071F _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0722 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0725 _ 89. 45, F4
        jmp     ?_010                                   ; 0728 _ EB, 3C

?_009:  mov     eax, dword [ebp+1CH]                    ; 072A _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 072D _ 8A. 00
        movzx   eax, al                                 ; 072F _ 0F B6. C0
        shl     eax, 4                                  ; 0732 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0735 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 073B _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 073F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0742 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0745 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0748 _ 8B. 00
        sub     esp, 8                                  ; 074A _ 83. EC, 08
        push    ebx                                     ; 074D _ 53
        push    ecx                                     ; 074E _ 51
        push    dword [ebp+14H]                         ; 074F _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0752 _ FF. 75, 10
        push    edx                                     ; 0755 _ 52
        push    eax                                     ; 0756 _ 50
        call    showFont8                               ; 0757 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 075C _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 075F _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0763 _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 0766 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0769 _ 8A. 00
        test    al, al                                  ; 076B _ 84. C0
        jnz near      ?_009                                   ; 076d _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 076F _ 8B. 45, 14
        add     eax, 16                                 ; 0772 _ 83. C0, 10
        sub     esp, 8                                  ; 0775 _ 83. EC, 08
        push    eax                                     ; 0778 _ 50
        push    dword [ebp+10H]                         ; 0779 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 077C _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 077F _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0782 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0785 _ FF. 75, 08
        call    sheet_refresh                           ; 0788 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 078D _ 83. C4, 20
        nop                                             ; 0790 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0791 _ 8B. 5D, FC
        leave                                           ; 0794 _ C9
        ret                                             ; 0795 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0796 _ 55
        mov     ebp, esp                                ; 0797 _ 89. E5
        sub     esp, 8                                  ; 0799 _ 83. EC, 08
        sub     esp, 4                                  ; 079C _ 83. EC, 04
        push    table_rgb.1775                          ; 079F _ 68, 00000020(d)
        push    15                                      ; 07A4 _ 6A, 0F
        push    0                                       ; 07A6 _ 6A, 00
        call    set_palette                             ; 07A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AD _ 83. C4, 10
        nop                                             ; 07B0 _ 90
        leave                                           ; 07B1 _ C9
        ret                                             ; 07B2 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 07B3 _ 55
        mov     ebp, esp                                ; 07B4 _ 89. E5
        sub     esp, 24                                 ; 07B6 _ 83. EC, 18
        call    io_load_eflags                          ; 07B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 07BE _ 89. 45, F0
        call    io_cli                                  ; 07C1 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 07C6 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 07C9 _ FF. 75, 08
        push    968                                     ; 07CC _ 68, 000003C8
        call    io_out8                                 ; 07D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D6 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 07D9 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 07DC _ 89. 45, F4
        jmp     ?_012                                   ; 07DF _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 07E1 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 07E4 _ 8A. 00
        shr     al, 2                                   ; 07E6 _ C0. E8, 02
        movzx   eax, al                                 ; 07E9 _ 0F B6. C0
        sub     esp, 8                                  ; 07EC _ 83. EC, 08
        push    eax                                     ; 07EF _ 50
        push    969                                     ; 07F0 _ 68, 000003C9
        call    io_out8                                 ; 07F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FA _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07FD _ 8B. 45, 10
        inc     eax                                     ; 0800 _ 40
        mov     al, byte [eax]                          ; 0801 _ 8A. 00
        shr     al, 2                                   ; 0803 _ C0. E8, 02
        movzx   eax, al                                 ; 0806 _ 0F B6. C0
        sub     esp, 8                                  ; 0809 _ 83. EC, 08
        push    eax                                     ; 080C _ 50
        push    969                                     ; 080D _ 68, 000003C9
        call    io_out8                                 ; 0812 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0817 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 081A _ 8B. 45, 10
        add     eax, 2                                  ; 081D _ 83. C0, 02
        mov     al, byte [eax]                          ; 0820 _ 8A. 00
        shr     al, 2                                   ; 0822 _ C0. E8, 02
        movzx   eax, al                                 ; 0825 _ 0F B6. C0
        sub     esp, 8                                  ; 0828 _ 83. EC, 08
        push    eax                                     ; 082B _ 50
        push    969                                     ; 082C _ 68, 000003C9
        call    io_out8                                 ; 0831 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0836 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0839 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 083D _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 0840 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0843 _ 3B. 45, 0C
        jle near      ?_011                                   ; 0846 _ 7e, 99
        sub     esp, 12                                 ; 0848 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 084B _ FF. 75, F0
        call    io_store_eflags                         ; 084E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0853 _ 83. C4, 10
        nop                                             ; 0856 _ 90
        leave                                           ; 0857 _ C9
        ret                                             ; 0858 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0859 _ 55
        mov     ebp, esp                                ; 085A _ 89. E5
        sub     esp, 20                                 ; 085C _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 085F _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0862 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0865 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0868 _ 89. 45, F8
        jmp     ?_016                                   ; 086B _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 086D _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0870 _ 89. 45, FC
        jmp     ?_015                                   ; 0873 _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 0875 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0878 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 087C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 087E _ 8B. 45, FC
        add     eax, edx                                ; 0881 _ 01. D0
        mov     edx, eax                                ; 0883 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0885 _ 8B. 45, 08
        add     edx, eax                                ; 0888 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 088A _ 8A. 45, EC
        mov     byte [edx], al                          ; 088D _ 88. 02
        inc     dword [ebp-4H]                          ; 088F _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 0892 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0895 _ 3B. 45, 1C
        jle near      ?_014                                   ; 0898 _ 7e, db
        inc     dword [ebp-8H]                          ; 089A _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 089D _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 08A0 _ 3B. 45, 20
        jle near      ?_013                                   ; 08a3 _ 7e, c8
        nop                                             ; 08A5 _ 90
        nop                                             ; 08A6 _ 90
        leave                                           ; 08A7 _ C9
        ret                                             ; 08A8 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 08A9 _ 55
        mov     ebp, esp                                ; 08AA _ 89. E5
        sub     esp, 20                                 ; 08AC _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 08AF _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 08B2 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 08B5 _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 08BC _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 08C1 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 08C4 _ 8B. 45, 1C
        add     eax, edx                                ; 08C7 _ 01. D0
        mov     al, byte [eax]                          ; 08C9 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 08CB _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 08CE _ 80. 7D, FB, 00
        jns     ?_018                                   ; 08D2 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 08D4 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08D7 _ 8B. 45, FC
        add     eax, edx                                ; 08DA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08DC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08E2 _ 8B. 45, 10
        add     eax, edx                                ; 08E5 _ 01. D0
        mov     edx, eax                                ; 08E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08E9 _ 8B. 45, 08
        add     edx, eax                                ; 08EC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08EE _ 8A. 45, EC
        mov     byte [edx], al                          ; 08F1 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 08F3 _ 0F BE. 45, FB
        and     eax, 40H                                ; 08F7 _ 83. E0, 40
        test    eax, eax                                ; 08FA _ 85. C0
        jz near       ?_019                                   ; 08fc _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08FE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0901 _ 8B. 45, FC
        add     eax, edx                                ; 0904 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0906 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 090A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 090C _ 8B. 45, 10
        add     eax, edx                                ; 090F _ 01. D0
        lea     edx, [eax+1H]                           ; 0911 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0914 _ 8B. 45, 08
        add     edx, eax                                ; 0917 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0919 _ 8A. 45, EC
        mov     byte [edx], al                          ; 091C _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 091E _ 0F BE. 45, FB
        and     eax, 20H                                ; 0922 _ 83. E0, 20
        test    eax, eax                                ; 0925 _ 85. C0
        jz near       ?_020                                   ; 0927 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0929 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 092C _ 8B. 45, FC
        add     eax, edx                                ; 092F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0931 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0935 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0937 _ 8B. 45, 10
        add     eax, edx                                ; 093A _ 01. D0
        lea     edx, [eax+2H]                           ; 093C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 093F _ 8B. 45, 08
        add     edx, eax                                ; 0942 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0944 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0947 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0949 _ 0F BE. 45, FB
        and     eax, 10H                                ; 094D _ 83. E0, 10
        test    eax, eax                                ; 0950 _ 85. C0
        jz near       ?_021                                   ; 0952 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0954 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0957 _ 8B. 45, FC
        add     eax, edx                                ; 095A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 095C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0960 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0962 _ 8B. 45, 10
        add     eax, edx                                ; 0965 _ 01. D0
        lea     edx, [eax+3H]                           ; 0967 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 096A _ 8B. 45, 08
        add     edx, eax                                ; 096D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 096F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0972 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0974 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0978 _ 83. E0, 08
        test    eax, eax                                ; 097B _ 85. C0
        jz near       ?_022                                   ; 097d _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 097F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0982 _ 8B. 45, FC
        add     eax, edx                                ; 0985 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0987 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 098B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 098D _ 8B. 45, 10
        add     eax, edx                                ; 0990 _ 01. D0
        lea     edx, [eax+4H]                           ; 0992 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0995 _ 8B. 45, 08
        add     edx, eax                                ; 0998 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 099A _ 8A. 45, EC
        mov     byte [edx], al                          ; 099D _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 099F _ 0F BE. 45, FB
        and     eax, 04H                                ; 09A3 _ 83. E0, 04
        test    eax, eax                                ; 09A6 _ 85. C0
        jz near       ?_023                                   ; 09a8 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 09AA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09AD _ 8B. 45, FC
        add     eax, edx                                ; 09B0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09B2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09B6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09B8 _ 8B. 45, 10
        add     eax, edx                                ; 09BB _ 01. D0
        lea     edx, [eax+5H]                           ; 09BD _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 09C0 _ 8B. 45, 08
        add     edx, eax                                ; 09C3 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09C5 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09C8 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 09CA _ 0F BE. 45, FB
        and     eax, 02H                                ; 09CE _ 83. E0, 02
        test    eax, eax                                ; 09D1 _ 85. C0
        jz near       ?_024                                   ; 09d3 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 09D5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09D8 _ 8B. 45, FC
        add     eax, edx                                ; 09DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09E3 _ 8B. 45, 10
        add     eax, edx                                ; 09E6 _ 01. D0
        lea     edx, [eax+6H]                           ; 09E8 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 09EB _ 8B. 45, 08
        add     edx, eax                                ; 09EE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09F0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09F3 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 09F5 _ 0F BE. 45, FB
        and     eax, 01H                                ; 09F9 _ 83. E0, 01
        test    eax, eax                                ; 09FC _ 85. C0
        jz near       ?_025                                   ; 09fe _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0A00 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A03 _ 8B. 45, FC
        add     eax, edx                                ; 0A06 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A08 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A0C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A0E _ 8B. 45, 10
        add     eax, edx                                ; 0A11 _ 01. D0
        lea     edx, [eax+7H]                           ; 0A13 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0A16 _ 8B. 45, 08
        add     edx, eax                                ; 0A19 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A1B _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A1E _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 0A20 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 0A23 _ 83. 7D, FC, 0F
        jle near      ?_017                                   ; 0a27 _ 0f 8e, fffffe94
        nop                                             ; 0A2D _ 90
        nop                                             ; 0A2E _ 90
        leave                                           ; 0A2F _ C9
        ret                                             ; 0A30 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 20                                 ; 0A34 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0A37 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0A3A _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0A3D _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0A44 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 0A49 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0A50 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 0A55 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A58 _ C1. E0, 04
        mov     edx, eax                                ; 0A5B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A5D _ 8B. 45, FC
        add     eax, edx                                ; 0A60 _ 01. D0
        add     eax, cursor.1822                        ; 0A62 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A67 _ 8A. 00
        cmp     al, 42                                  ; 0A69 _ 3C, 2A
        jnz near      ?_029                                   ; 0a6b _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A6D _ 8B. 45, F8
        shl     eax, 4                                  ; 0A70 _ C1. E0, 04
        mov     edx, eax                                ; 0A73 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A75 _ 8B. 45, FC
        add     eax, edx                                ; 0A78 _ 01. D0
        mov     edx, eax                                ; 0A7A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A7C _ 8B. 45, 08
        add     eax, edx                                ; 0A7F _ 01. D0
        mov     byte [eax], 0                           ; 0A81 _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0A84 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A87 _ C1. E0, 04
        mov     edx, eax                                ; 0A8A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A8C _ 8B. 45, FC
        add     eax, edx                                ; 0A8F _ 01. D0
        add     eax, cursor.1822                        ; 0A91 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A96 _ 8A. 00
        cmp     al, 79                                  ; 0A98 _ 3C, 4F
        jnz near      ?_030                                   ; 0a9a _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A9C _ 8B. 45, F8
        shl     eax, 4                                  ; 0A9F _ C1. E0, 04
        mov     edx, eax                                ; 0AA2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AA4 _ 8B. 45, FC
        add     eax, edx                                ; 0AA7 _ 01. D0
        mov     edx, eax                                ; 0AA9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0AAB _ 8B. 45, 08
        add     eax, edx                                ; 0AAE _ 01. D0
        mov     byte [eax], 7                           ; 0AB0 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 0AB3 _ 8B. 45, F8
        shl     eax, 4                                  ; 0AB6 _ C1. E0, 04
        mov     edx, eax                                ; 0AB9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0ABB _ 8B. 45, FC
        add     eax, edx                                ; 0ABE _ 01. D0
        add     eax, cursor.1822                        ; 0AC0 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0AC5 _ 8A. 00
        cmp     al, 46                                  ; 0AC7 _ 3C, 2E
        jnz near      ?_031                                   ; 0ac9 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0ACB _ 8B. 45, F8
        shl     eax, 4                                  ; 0ACE _ C1. E0, 04
        mov     edx, eax                                ; 0AD1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AD3 _ 8B. 45, FC
        add     eax, edx                                ; 0AD6 _ 01. D0
        mov     edx, eax                                ; 0AD8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ADA _ 8B. 45, 08
        add     edx, eax                                ; 0ADD _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0ADF _ 8A. 45, EC
        mov     byte [edx], al                          ; 0AE2 _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 0AE4 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 0AE7 _ 83. 7D, FC, 0F
        jle near      ?_028                                   ; 0aeb _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 0AF1 _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 0AF4 _ 83. 7D, F8, 0F
        jle near      ?_027                                   ; 0af8 _ 0f 8e, ffffff4b
        nop                                             ; 0AFE _ 90
        nop                                             ; 0AFF _ 90
        leave                                           ; 0B00 _ C9
        ret                                             ; 0B01 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0B02 _ 55
        mov     ebp, esp                                ; 0B03 _ 89. E5
        push    ebx                                     ; 0B05 _ 53
        sub     esp, 16                                 ; 0B06 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0B09 _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0B10 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0B12 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0B19 _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0B1B _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0B1E _ 0F AF. 45, 24
        mov     edx, eax                                ; 0B22 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B24 _ 8B. 45, F8
        add     eax, edx                                ; 0B27 _ 01. D0
        mov     edx, eax                                ; 0B29 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0B2B _ 8B. 45, 20
        add     eax, edx                                ; 0B2E _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0B30 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0B33 _ 8B. 55, F4
        add     edx, ecx                                ; 0B36 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0B38 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0B3C _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0B3F _ 8B. 4D, F8
        add     ecx, ebx                                ; 0B42 _ 01. D9
        add     edx, ecx                                ; 0B44 _ 01. CA
        mov     ecx, edx                                ; 0B46 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0B48 _ 8B. 55, 08
        add     edx, ecx                                ; 0B4B _ 01. CA
        mov     al, byte [eax]                          ; 0B4D _ 8A. 00
        mov     byte [edx], al                          ; 0B4F _ 88. 02
        inc     dword [ebp-8H]                          ; 0B51 _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0B54 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0B57 _ 3B. 45, 10
        jl      ?_035                                   ; 0B5A _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0B5C _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0B5F _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0B62 _ 3B. 45, 14
        jl      ?_034                                   ; 0B65 _ 7C, AB
        nop                                             ; 0B67 _ 90
        nop                                             ; 0B68 _ 90
        add     esp, 16                                 ; 0B69 _ 83. C4, 10
        pop     ebx                                     ; 0B6C _ 5B
        pop     ebp                                     ; 0B6D _ 5D
        ret                                             ; 0B6E _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0B6F _ 55
        mov     ebp, esp                                ; 0B70 _ 89. E5
        sub     esp, 24                                 ; 0B72 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0B75 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0B7A _ 89. 45, F4
        mov     eax, dword [?_141]                      ; 0B7D _ A1, 00000004(d)
        cwde                                            ; 0B82 _ 98
        mov     dword [ebp-10H], eax                    ; 0B83 _ 89. 45, F0
        mov     ax, word [?_142]                        ; 0B86 _ 66: A1, 00000006(d)
        cwde                                            ; 0B8C _ 98
        mov     dword [ebp-14H], eax                    ; 0B8D _ 89. 45, EC
        sub     esp, 8                                  ; 0B90 _ 83. EC, 08
        push    32                                      ; 0B93 _ 6A, 20
        push    32                                      ; 0B95 _ 6A, 20
        call    io_out8                                 ; 0B97 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B9C _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B9F _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0BA3 _ 83. EC, 0C
        push    96                                      ; 0BA6 _ 6A, 60
        call    io_in8                                  ; 0BA8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BAD _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0BB0 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0BB3 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0BB7 _ 83. EC, 08
        push    eax                                     ; 0BBA _ 50
        push    keyinfo                                 ; 0BBB _ 68, 00000008(d)
        call    fifo8_put                               ; 0BC0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BC5 _ 83. C4, 10
        nop                                             ; 0BC8 _ 90
        leave                                           ; 0BC9 _ C9
        ret                                             ; 0BCA _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0BCB _ 55
        mov     ebp, esp                                ; 0BCC _ 89. E5
        sub     esp, 4                                  ; 0BCE _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0BD1 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0BD4 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0BD7 _ 80. 7D, FC, 09
        jle near      ?_038                                   ; 0bdb _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 0BDD _ 8A. 45, FC
        add     eax, 55                                 ; 0BE0 _ 83. C0, 37
        jmp     ?_039                                   ; 0BE3 _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0BE5 _ 8A. 45, FC
        add     eax, 48                                 ; 0BE8 _ 83. C0, 30
?_039:  leave                                           ; 0BEB _ C9
        ret                                             ; 0BEC _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0BED _ 55
        mov     ebp, esp                                ; 0BEE _ 89. E5
        sub     esp, 20                                 ; 0BF0 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0BF3 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0BF6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0BF9 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0C00 _ 8A. 45, EC
        and     eax, 0FH                                ; 0C03 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0C06 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0C09 _ 0F BE. 45, FB
        push    eax                                     ; 0C0D _ 50
        call    charToHexVal                            ; 0C0E _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0C13 _ 83. C4, 04
        mov     byte [?_140], al                        ; 0C16 _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0C1B _ 8A. 45, EC
        shr     al, 4                                   ; 0C1E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0C21 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0C24 _ 8A. 45, EC
        movsx   eax, al                                 ; 0C27 _ 0F BE. C0
        push    eax                                     ; 0C2A _ 50
        call    charToHexVal                            ; 0C2B _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0C30 _ 83. C4, 04
        mov     byte [?_139], al                        ; 0C33 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0C38 _ B8, 00000004(d)
        leave                                           ; 0C3D _ C9
        ret                                             ; 0C3E _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0C3F _ 55
        mov     ebp, esp                                ; 0C40 _ 89. E5
        sub     esp, 16                                 ; 0C42 _ 83. EC, 10
        mov     byte [str.1870], 48                     ; 0C45 _ C6. 05, 00000220(d), 30
        mov     byte [?_143], 88                        ; 0C4C _ C6. 05, 00000221(d), 58
        mov     byte [?_144], 0                         ; 0C53 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-4H], 2                       ; 0C5A _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0C61 _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0C63 _ 8B. 45, FC
        add     eax, str.1870                           ; 0C66 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0C6B _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0C6E _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0C71 _ 83. 7D, FC, 09
        jle near      ?_040                                   ; 0c75 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 0C77 _ C7. 45, F8, 00000009
        jmp     ?_045                                   ; 0C7E _ EB, 41

?_042:  mov     eax, dword [ebp+8H]                     ; 0C80 _ 8B. 45, 08
        and     eax, 0FH                                ; 0C83 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C86 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C89 _ 8B. 45, 08
        shr     eax, 4                                  ; 0C8C _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C8F _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C92 _ 83. 7D, F4, 09
        jle near      ?_043                                   ; 0c96 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 0C98 _ 8B. 45, F4
        add     eax, 55                                 ; 0C9B _ 83. C0, 37
        mov     dl, al                                  ; 0C9E _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0CA0 _ 8B. 45, F8
        add     eax, str.1870                           ; 0CA3 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0CA8 _ 88. 10
        jmp     ?_044                                   ; 0CAA _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0CAC _ 8B. 45, F4
        add     eax, 48                                 ; 0CAF _ 83. C0, 30
        mov     dl, al                                  ; 0CB2 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0CB4 _ 8B. 45, F8
        add     eax, str.1870                           ; 0CB7 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0CBC _ 88. 10
?_044:  dec     dword [ebp-8H]                          ; 0CBE _ FF. 4D, F8
?_045:  cmp     dword [ebp-8H], 1                       ; 0CC1 _ 83. 7D, F8, 01
        jle near      ?_046                                   ; 0cc5 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0CC7 _ 83. 7D, 08, 00
        jnz near      ?_042                                   ; 0ccb _ 75, b3
?_046:  mov     eax, str.1870                           ; 0CCD _ B8, 00000220(d)
        leave                                           ; 0CD2 _ C9
        ret                                             ; 0CD3 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0CD4 _ 55
        mov     ebp, esp                                ; 0CD5 _ 89. E5
        sub     esp, 8                                  ; 0CD7 _ 83. EC, 08
?_047:  sub     esp, 12                                 ; 0CDA _ 83. EC, 0C
        push    100                                     ; 0CDD _ 6A, 64
        call    io_in8                                  ; 0CDF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CE4 _ 83. C4, 10
        and     eax, 02H                                ; 0CE7 _ 83. E0, 02
        test    eax, eax                                ; 0CEA _ 85. C0
        jz near       ?_048                                   ; 0cec _ 74, 02
        jmp     ?_047                                   ; 0CEE _ EB, EA

?_048:  nop                                             ; 0CF0 _ 90
        nop                                             ; 0CF1 _ 90
        leave                                           ; 0CF2 _ C9
        ret                                             ; 0CF3 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0CF4 _ 55
        mov     ebp, esp                                ; 0CF5 _ 89. E5
        sub     esp, 8                                  ; 0CF7 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CFA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CFF _ 83. EC, 08
        push    96                                      ; 0D02 _ 6A, 60
        push    100                                     ; 0D04 _ 6A, 64
        call    io_out8                                 ; 0D06 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D0B _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0D0E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D13 _ 83. EC, 08
        push    71                                      ; 0D16 _ 6A, 47
        push    96                                      ; 0D18 _ 6A, 60
        call    io_out8                                 ; 0D1A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D1F _ 83. C4, 10
        nop                                             ; 0D22 _ 90
        leave                                           ; 0D23 _ C9
        ret                                             ; 0D24 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0D25 _ 55
        mov     ebp, esp                                ; 0D26 _ 89. E5
        sub     esp, 8                                  ; 0D28 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0D2B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D30 _ 83. EC, 08
        push    212                                     ; 0D33 _ 68, 000000D4
        push    100                                     ; 0D38 _ 6A, 64
        call    io_out8                                 ; 0D3A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D3F _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0D42 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D47 _ 83. EC, 08
        push    244                                     ; 0D4A _ 68, 000000F4
        push    96                                      ; 0D4F _ 6A, 60
        call    io_out8                                 ; 0D51 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D56 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0D59 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0D5C _ C6. 40, 03, 00
        nop                                             ; 0D60 _ 90
        leave                                           ; 0D61 _ C9
        ret                                             ; 0D62 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0D63 _ 55
        mov     ebp, esp                                ; 0D64 _ 89. E5
        sub     esp, 24                                 ; 0D66 _ 83. EC, 18
        sub     esp, 8                                  ; 0D69 _ 83. EC, 08
        push    32                                      ; 0D6C _ 6A, 20
        push    160                                     ; 0D6E _ 68, 000000A0
        call    io_out8                                 ; 0D73 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D78 _ 83. C4, 10
        sub     esp, 8                                  ; 0D7B _ 83. EC, 08
        push    32                                      ; 0D7E _ 6A, 20
        push    32                                      ; 0D80 _ 6A, 20
        call    io_out8                                 ; 0D82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D87 _ 83. C4, 10
        sub     esp, 12                                 ; 0D8A _ 83. EC, 0C
        push    96                                      ; 0D8D _ 6A, 60
        call    io_in8                                  ; 0D8F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D94 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D97 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D9A _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D9E _ 83. EC, 08
        push    eax                                     ; 0DA1 _ 50
        push    mouseinfo                               ; 0DA2 _ 68, 00000020(d)
        call    fifo8_put                               ; 0DA7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DAC _ 83. C4, 10
        nop                                             ; 0DAF _ 90
        leave                                           ; 0DB0 _ C9
        ret                                             ; 0DB1 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0DB2 _ 55
        mov     ebp, esp                                ; 0DB3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DB5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0DB8 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0DBB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DBE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0DC1 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0DC4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0DC6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0DC9 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0DCC _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0DCF _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0DD2 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0DD9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DDC _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0DE3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0DE6 _ C7. 40, 08, 00000000
        nop                                             ; 0DED _ 90
        pop     ebp                                     ; 0DEE _ 5D
        ret                                             ; 0DEF _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0DF0 _ 55
        mov     ebp, esp                                ; 0DF1 _ 89. E5
        sub     esp, 4                                  ; 0DF3 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0DF6 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0DF9 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DFC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DFF _ 8B. 40, 10
        test    eax, eax                                ; 0E02 _ 85. C0
        jnz near      ?_049                                   ; 0e04 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0E06 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0E09 _ 8B. 40, 14
        or      eax, 01H                                ; 0E0C _ 83. C8, 01
        mov     edx, eax                                ; 0E0F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E11 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0E14 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0E17 _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0E1C _ EB, 4F

?_049:  mov     eax, dword [ebp+8H]                     ; 0E1E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E21 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E23 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E26 _ 8B. 40, 04
        add     edx, eax                                ; 0E29 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0E2B _ 8A. 45, FC
        mov     byte [edx], al                          ; 0E2E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0E30 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E33 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0E36 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E39 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0E3C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0E3F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0E42 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0E45 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E48 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E4B _ 39. C2
        jnz near      ?_050                                   ; 0e4d _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0E4F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0E52 _ C7. 40, 04, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0E59 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E5C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0E5F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0E62 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E65 _ 89. 50, 10
        mov     eax, 0                                  ; 0E68 _ B8, 00000000
?_051:  leave                                           ; 0E6D _ C9
        ret                                             ; 0E6E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0E6F _ 55
        mov     ebp, esp                                ; 0E70 _ 89. E5
        sub     esp, 16                                 ; 0E72 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0E75 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E78 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E7B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E7E _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E81 _ 39. C2
        jnz near      ?_052                                   ; 0e83 _ 75, 07
        mov     eax, 4294967295                         ; 0E85 _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0E8A _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0E8C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E8F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E91 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E94 _ 8B. 40, 08
        add     eax, edx                                ; 0E97 _ 01. D0
        mov     al, byte [eax]                          ; 0E99 _ 8A. 00
        movzx   eax, al                                 ; 0E9B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E9E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0EA1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0EA4 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0EA7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EAA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EAD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0EB0 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0EB3 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0EB6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0EB9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0EBC _ 39. C2
        jnz near      ?_053                                   ; 0ebe _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0EC0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0EC3 _ C7. 40, 08, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0ECA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0ECD _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0ED0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0ED3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0ED6 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0ED9 _ 8B. 45, FC
?_054:  leave                                           ; 0EDC _ C9
        ret                                             ; 0EDD _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0EDE _ 55
        mov     ebp, esp                                ; 0EDF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0EE1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0EE4 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0EE7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0EEA _ 8B. 40, 10
        sub     edx, eax                                ; 0EED _ 29. C2
        mov     eax, edx                                ; 0EEF _ 89. D0
        pop     ebp                                     ; 0EF1 _ 5D
        ret                                             ; 0EF2 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0EF3 _ 55
        mov     ebp, esp                                ; 0EF4 _ 89. E5
        sub     esp, 4                                  ; 0EF6 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0EF9 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0EFC _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0EFF _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F02 _ 8A. 40, 03
        test    al, al                                  ; 0F05 _ 84. C0
        jnz near      ?_056                                   ; 0f07 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0F09 _ 80. 7D, FC, FA
        jnz near      ?_055                                   ; 0f0d _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0F0F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F12 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 0F16 _ B8, 00000000
        jmp     ?_063                                   ; 0F1B _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 0F20 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F23 _ 8A. 40, 03
        cmp     al, 1                                   ; 0F26 _ 3C, 01
        jnz near      ?_058                                   ; 0f28 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0F2A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0F2E _ 25, 000000C8
        cmp     eax, 8                                  ; 0F33 _ 83. F8, 08
        jnz near      ?_057                                   ; 0f36 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 0F38 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F3B _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0F3E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0F40 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0F43 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 0F47 _ B8, 00000000
        jmp     ?_063                                   ; 0F4C _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 0F51 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F54 _ 8A. 40, 03
        cmp     al, 2                                   ; 0F57 _ 3C, 02
        jnz near      ?_059                                   ; 0f59 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 0F5B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F5E _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0F61 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F64 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0F67 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F6B _ B8, 00000000
        jmp     ?_063                                   ; 0F70 _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 0F75 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F78 _ 8A. 40, 03
        cmp     al, 3                                   ; 0F7B _ 3C, 03
        jne near      ?_062                                   ; 0f7d _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 0F83 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F86 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F89 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F8C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F8F _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F93 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F96 _ 8A. 00
        movzx   eax, al                                 ; 0F98 _ 0F B6. C0
        and     eax, 07H                                ; 0F9B _ 83. E0, 07
        mov     edx, eax                                ; 0F9E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FA0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0FA3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0FA6 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0FA9 _ 8A. 40, 01
        movzx   edx, al                                 ; 0FAC _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0FAF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0FB2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0FB5 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0FB8 _ 8A. 40, 02
        movzx   edx, al                                 ; 0FBB _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0FBE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FC1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0FC4 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0FC7 _ 8A. 00
        movzx   eax, al                                 ; 0FC9 _ 0F B6. C0
        and     eax, 10H                                ; 0FCC _ 83. E0, 10
        test    eax, eax                                ; 0FCF _ 85. C0
        jz near       ?_060                                   ; 0fd1 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0FD3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0FD6 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0FD9 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0FDE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FE0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0FE3 _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 0FE6 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0FE9 _ 8A. 00
        movzx   eax, al                                 ; 0FEB _ 0F B6. C0
        and     eax, 20H                                ; 0FEE _ 83. E0, 20
        test    eax, eax                                ; 0FF1 _ 85. C0
        jz near       ?_061                                   ; 0ff3 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0FF5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FF8 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0FFB _ 0D, FFFFFF00
        mov     edx, eax                                ; 1000 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1002 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1005 _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 1008 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 100B _ 8B. 40, 08
        neg     eax                                     ; 100E _ F7. D8
        mov     edx, eax                                ; 1010 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1012 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1015 _ 89. 50, 08
        mov     eax, 1                                  ; 1018 _ B8, 00000001
        jmp     ?_063                                   ; 101D _ EB, 05

?_062:  mov     eax, 4294967295                         ; 101F _ B8, FFFFFFFF
?_063:  leave                                           ; 1024 _ C9
        ret                                             ; 1025 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1026 _ 55
        mov     ebp, esp                                ; 1027 _ 89. E5
        sub     esp, 56                                 ; 1029 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 102C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1033 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 103A _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1041 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 1048 _ 8B. 15, 000000FC(d)
        mov     eax, dword [ebp+0CH]                    ; 104E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1051 _ 8B. 00
        sub     esp, 4                                  ; 1053 _ 83. EC, 04
        push    edx                                     ; 1056 _ 52
        push    dword [ebp+1CH]                         ; 1057 _ FF. 75, 1C
        push    eax                                     ; 105A _ 50
        call    init_screen8                            ; 105B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1060 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1063 _ 8B. 45, 20
        movsx   eax, al                                 ; 1066 _ 0F BE. C0
        sub     esp, 8                                  ; 1069 _ 83. EC, 08
        push    ?_131                                   ; 106C _ 68, 0000001F(d)
        push    eax                                     ; 1071 _ 50
        push    dword [ebp-10H]                         ; 1072 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1075 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1078 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 107B _ FF. 75, 08
        call    showString                              ; 107E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1083 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1086 _ 8B. 45, 18
        sub     esp, 12                                 ; 1089 _ 83. EC, 0C
        push    eax                                     ; 108C _ 50
        call    intToHexStr                             ; 108D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1092 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1095 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1098 _ 8B. 45, 20
        movsx   eax, al                                 ; 109B _ 0F BE. C0
        sub     esp, 8                                  ; 109E _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 10A1 _ FF. 75, E4
        push    eax                                     ; 10A4 _ 50
        push    dword [ebp-10H]                         ; 10A5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10A8 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 10AB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AE _ FF. 75, 08
        call    showString                              ; 10B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B6 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10B9 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 10BD _ 8B. 45, 20
        movsx   eax, al                                 ; 10C0 _ 0F BE. C0
        sub     esp, 8                                  ; 10C3 _ 83. EC, 08
        push    ?_132                                   ; 10C6 _ 68, 00000029(d)
        push    eax                                     ; 10CB _ 50
        push    dword [ebp-10H]                         ; 10CC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10CF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 10D2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10D5 _ FF. 75, 08
        call    showString                              ; 10D8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10DD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10E0 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 10E3 _ 8B. 00
        sub     esp, 12                                 ; 10E5 _ 83. EC, 0C
        push    eax                                     ; 10E8 _ 50
        call    intToHexStr                             ; 10E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10EE _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 10F1 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 10F4 _ 8B. 45, 20
        movsx   eax, al                                 ; 10F7 _ 0F BE. C0
        sub     esp, 8                                  ; 10FA _ 83. EC, 08
        push    dword [ebp-20H]                         ; 10FD _ FF. 75, E0
        push    eax                                     ; 1100 _ 50
        push    dword [ebp-10H]                         ; 1101 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1104 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1107 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 110A _ FF. 75, 08
        call    showString                              ; 110D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1112 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1115 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1119 _ 8B. 45, 20
        movsx   eax, al                                 ; 111C _ 0F BE. C0
        sub     esp, 8                                  ; 111F _ 83. EC, 08
        push    ?_133                                   ; 1122 _ 68, 00000035(d)
        push    eax                                     ; 1127 _ 50
        push    dword [ebp-10H]                         ; 1128 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 112B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 112E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1131 _ FF. 75, 08
        call    showString                              ; 1134 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1139 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 113C _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 113F _ 8B. 40, 04
        sub     esp, 12                                 ; 1142 _ 83. EC, 0C
        push    eax                                     ; 1145 _ 50
        call    intToHexStr                             ; 1146 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 114B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 114E _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1151 _ 8B. 45, 20
        movsx   eax, al                                 ; 1154 _ 0F BE. C0
        sub     esp, 8                                  ; 1157 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 115A _ FF. 75, DC
        push    eax                                     ; 115D _ 50
        push    dword [ebp-10H]                         ; 115E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1161 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1164 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1167 _ FF. 75, 08
        call    showString                              ; 116A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 116F _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1172 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1176 _ 8B. 45, 20
        movsx   eax, al                                 ; 1179 _ 0F BE. C0
        sub     esp, 8                                  ; 117C _ 83. EC, 08
        push    ?_134                                   ; 117F _ 68, 00000041(d)
        push    eax                                     ; 1184 _ 50
        push    dword [ebp-10H]                         ; 1185 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1188 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 118B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 118E _ FF. 75, 08
        call    showString                              ; 1191 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1196 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1199 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 119C _ 8B. 40, 08
        sub     esp, 12                                 ; 119F _ 83. EC, 0C
        push    eax                                     ; 11A2 _ 50
        call    intToHexStr                             ; 11A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11A8 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 11AB _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 11AE _ 8B. 45, 20
        movsx   eax, al                                 ; 11B1 _ 0F BE. C0
        sub     esp, 8                                  ; 11B4 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 11B7 _ FF. 75, D8
        push    eax                                     ; 11BA _ 50
        push    dword [ebp-10H]                         ; 11BB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11BE _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 11C1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C4 _ FF. 75, 08
        call    showString                              ; 11C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11CC _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11CF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 11D3 _ 8B. 45, 20
        movsx   eax, al                                 ; 11D6 _ 0F BE. C0
        sub     esp, 8                                  ; 11D9 _ 83. EC, 08
        push    ?_135                                   ; 11DC _ 68, 0000004D(d)
        push    eax                                     ; 11E1 _ 50
        push    dword [ebp-10H]                         ; 11E2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11E5 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 11E8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11EB _ FF. 75, 08
        call    showString                              ; 11EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11F3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 11F6 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 11F9 _ 8B. 40, 0C
        sub     esp, 12                                 ; 11FC _ 83. EC, 0C
        push    eax                                     ; 11FF _ 50
        call    intToHexStr                             ; 1200 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1205 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 1208 _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 120B _ 8B. 45, 20
        movsx   eax, al                                 ; 120E _ 0F BE. C0
        sub     esp, 8                                  ; 1211 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 1214 _ FF. 75, D4
        push    eax                                     ; 1217 _ 50
        push    dword [ebp-10H]                         ; 1218 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 121B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 121E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1221 _ FF. 75, 08
        call    showString                              ; 1224 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1229 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 122C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1230 _ 8B. 45, 20
        movsx   eax, al                                 ; 1233 _ 0F BE. C0
        sub     esp, 8                                  ; 1236 _ 83. EC, 08
        push    ?_136                                   ; 1239 _ 68, 0000005A(d)
        push    eax                                     ; 123E _ 50
        push    dword [ebp-10H]                         ; 123F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1242 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1245 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1248 _ FF. 75, 08
        call    showString                              ; 124B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1250 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1253 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1256 _ 8B. 40, 10
        sub     esp, 12                                 ; 1259 _ 83. EC, 0C
        push    eax                                     ; 125C _ 50
        call    intToHexStr                             ; 125D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1262 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 1265 _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 1268 _ 8B. 45, 20
        movsx   eax, al                                 ; 126B _ 0F BE. C0
        sub     esp, 8                                  ; 126E _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1271 _ FF. 75, D0
        push    eax                                     ; 1274 _ 50
        push    dword [ebp-10H]                         ; 1275 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1278 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 127B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 127E _ FF. 75, 08
        call    showString                              ; 1281 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1286 _ 83. C4, 20
        nop                                             ; 1289 _ 90
        leave                                           ; 128A _ C9
        ret                                             ; 128B _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 128C _ 55
        mov     ebp, esp                                ; 128D _ 89. E5
        sub     esp, 24                                 ; 128F _ 83. EC, 18
        sub     esp, 12                                 ; 1292 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1295 _ FF. 75, 08
        call    sheet_alloc                             ; 1298 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 129D _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 12A0 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 12A3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 12A8 _ 83. EC, 08
        push    10880                                   ; 12AB _ 68, 00002A80
        push    eax                                     ; 12B0 _ 50
        call    memman_alloc_4k                         ; 12B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12B6 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 12B9 _ 89. 45, F0
        sub     esp, 12                                 ; 12BC _ 83. EC, 0C
        push    -1                                      ; 12BF _ 6A, FF
        push    68                                      ; 12C1 _ 6A, 44
        push    160                                     ; 12C3 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 12C8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 12CB _ FF. 75, F4
        call    sheet_setbuf                            ; 12CE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12D3 _ 83. C4, 20
        sub     esp, 4                                  ; 12D6 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 12D9 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 12DC _ FF. 75, F4
        push    dword [ebp+8H]                          ; 12DF _ FF. 75, 08
        call    make_window8                            ; 12E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12E7 _ 83. C4, 10
        sub     esp, 8                                  ; 12EA _ 83. EC, 08
        push    ?_137                                   ; 12ED _ 68, 00000061(d)
        push    0                                       ; 12F2 _ 6A, 00
        push    28                                      ; 12F4 _ 6A, 1C
        push    24                                      ; 12F6 _ 6A, 18
        push    dword [ebp-0CH]                         ; 12F8 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 12FB _ FF. 75, 08
        call    showString                              ; 12FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1303 _ 83. C4, 20
        sub     esp, 8                                  ; 1306 _ 83. EC, 08
        push    ?_138                                   ; 1309 _ 68, 0000006C(d)
        push    0                                       ; 130E _ 6A, 00
        push    44                                      ; 1310 _ 6A, 2C
        push    24                                      ; 1312 _ 6A, 18
        push    dword [ebp-0CH]                         ; 1314 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1317 _ FF. 75, 08
        call    showString                              ; 131A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 131F _ 83. C4, 20
        push    72                                      ; 1322 _ 6A, 48
        push    80                                      ; 1324 _ 6A, 50
        push    dword [ebp-0CH]                         ; 1326 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1329 _ FF. 75, 08
        call    sheet_slide                             ; 132C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1331 _ 83. C4, 10
        sub     esp, 4                                  ; 1334 _ 83. EC, 04
        push    2                                       ; 1337 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1339 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 133C _ FF. 75, 08
        call    sheet_updown                            ; 133F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1344 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1347 _ 8B. 45, F4
        leave                                           ; 134A _ C9
        ret                                             ; 134B _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 134C _ 55
        mov     ebp, esp                                ; 134D _ 89. E5
        push    ebx                                     ; 134F _ 53
        sub     esp, 36                                 ; 1350 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1353 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1356 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1359 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 135C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 135F _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1362 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1365 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1368 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 136B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 136E _ 8B. 00
        push    0                                       ; 1370 _ 6A, 00
        push    edx                                     ; 1372 _ 52
        push    0                                       ; 1373 _ 6A, 00
        push    0                                       ; 1375 _ 6A, 00
        push    8                                       ; 1377 _ 6A, 08
        push    dword [ebp-18H]                         ; 1379 _ FF. 75, E8
        push    eax                                     ; 137C _ 50
        call    boxfill8                                ; 137D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1382 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1385 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1388 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 138B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 138E _ 8B. 00
        push    1                                       ; 1390 _ 6A, 01
        push    edx                                     ; 1392 _ 52
        push    1                                       ; 1393 _ 6A, 01
        push    1                                       ; 1395 _ 6A, 01
        push    7                                       ; 1397 _ 6A, 07
        push    dword [ebp-18H]                         ; 1399 _ FF. 75, E8
        push    eax                                     ; 139C _ 50
        call    boxfill8                                ; 139D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13A2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13A5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 13A8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13AB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13AE _ 8B. 00
        push    edx                                     ; 13B0 _ 52
        push    0                                       ; 13B1 _ 6A, 00
        push    0                                       ; 13B3 _ 6A, 00
        push    0                                       ; 13B5 _ 6A, 00
        push    8                                       ; 13B7 _ 6A, 08
        push    dword [ebp-18H]                         ; 13B9 _ FF. 75, E8
        push    eax                                     ; 13BC _ 50
        call    boxfill8                                ; 13BD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13C2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13C5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 13C8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13CE _ 8B. 00
        push    edx                                     ; 13D0 _ 52
        push    1                                       ; 13D1 _ 6A, 01
        push    1                                       ; 13D3 _ 6A, 01
        push    1                                       ; 13D5 _ 6A, 01
        push    7                                       ; 13D7 _ 6A, 07
        push    dword [ebp-18H]                         ; 13D9 _ FF. 75, E8
        push    eax                                     ; 13DC _ 50
        call    boxfill8                                ; 13DD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13E2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13E5 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 13E8 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 13EB _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 13EE _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 13F1 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 13F4 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 13F7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13FA _ 8B. 00
        push    ebx                                     ; 13FC _ 53
        push    ecx                                     ; 13FD _ 51
        push    1                                       ; 13FE _ 6A, 01
        push    edx                                     ; 1400 _ 52
        push    15                                      ; 1401 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1403 _ FF. 75, E8
        push    eax                                     ; 1406 _ 50
        call    boxfill8                                ; 1407 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 140C _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 140F _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1412 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1415 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1418 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 141B _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 141E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1421 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1424 _ 8B. 00
        push    ebx                                     ; 1426 _ 53
        push    ecx                                     ; 1427 _ 51
        push    0                                       ; 1428 _ 6A, 00
        push    edx                                     ; 142A _ 52
        push    0                                       ; 142B _ 6A, 00
        push    dword [ebp-18H]                         ; 142D _ FF. 75, E8
        push    eax                                     ; 1430 _ 50
        call    boxfill8                                ; 1431 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1436 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1439 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 143C _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 143F _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1442 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1445 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1448 _ 8B. 00
        push    ecx                                     ; 144A _ 51
        push    edx                                     ; 144B _ 52
        push    2                                       ; 144C _ 6A, 02
        push    2                                       ; 144E _ 6A, 02
        push    8                                       ; 1450 _ 6A, 08
        push    dword [ebp-18H]                         ; 1452 _ FF. 75, E8
        push    eax                                     ; 1455 _ 50
        call    boxfill8                                ; 1456 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 145B _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 145E _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1461 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1464 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1467 _ 8B. 00
        push    20                                      ; 1469 _ 6A, 14
        push    edx                                     ; 146B _ 52
        push    3                                       ; 146C _ 6A, 03
        push    3                                       ; 146E _ 6A, 03
        push    12                                      ; 1470 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1472 _ FF. 75, E8
        push    eax                                     ; 1475 _ 50
        call    boxfill8                                ; 1476 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 147B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 147E _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1481 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1484 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1487 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 148A _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 148D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1490 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1493 _ 8B. 00
        push    ebx                                     ; 1495 _ 53
        push    ecx                                     ; 1496 _ 51
        push    edx                                     ; 1497 _ 52
        push    1                                       ; 1498 _ 6A, 01
        push    15                                      ; 149A _ 6A, 0F
        push    dword [ebp-18H]                         ; 149C _ FF. 75, E8
        push    eax                                     ; 149F _ 50
        call    boxfill8                                ; 14A0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14A5 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 14A8 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 14AB _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 14AE _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 14B1 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 14B4 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 14B7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14BA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BD _ 8B. 00
        push    ebx                                     ; 14BF _ 53
        push    ecx                                     ; 14C0 _ 51
        push    edx                                     ; 14C1 _ 52
        push    0                                       ; 14C2 _ 6A, 00
        push    0                                       ; 14C4 _ 6A, 00
        push    dword [ebp-18H]                         ; 14C6 _ FF. 75, E8
        push    eax                                     ; 14C9 _ 50
        call    boxfill8                                ; 14CA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14CF _ 83. C4, 1C
        sub     esp, 8                                  ; 14D2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 14D5 _ FF. 75, 10
        push    7                                       ; 14D8 _ 6A, 07
        push    4                                       ; 14DA _ 6A, 04
        push    24                                      ; 14DC _ 6A, 18
        push    dword [ebp+0CH]                         ; 14DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14E1 _ FF. 75, 08
        call    showString                              ; 14E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14E9 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 14EC _ C7. 45, F0, 00000000
        jmp     ?_071                                   ; 14F3 _ EB, 7F

?_064:  mov     dword [ebp-0CH], 0                      ; 14F5 _ C7. 45, F4, 00000000
        jmp     ?_070                                   ; 14FC _ EB, 6D

?_065:  mov     eax, dword [ebp-10H]                    ; 14FE _ 8B. 45, F0
        shl     eax, 4                                  ; 1501 _ C1. E0, 04
        mov     edx, eax                                ; 1504 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1506 _ 8B. 45, F4
        add     eax, edx                                ; 1509 _ 01. D0
        add     eax, closebtn.1950                      ; 150B _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 1510 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1512 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1515 _ 80. 7D, EF, 40
        jnz near      ?_066                                   ; 1519 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 151B _ C6. 45, EF, 00
        jmp     ?_069                                   ; 151F _ EB, 1C

?_066:  cmp     byte [ebp-11H], 36                      ; 1521 _ 80. 7D, EF, 24
        jnz near      ?_067                                   ; 1525 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1527 _ C6. 45, EF, 0F
        jmp     ?_069                                   ; 152B _ EB, 10

?_067:  cmp     byte [ebp-11H], 81                      ; 152D _ 80. 7D, EF, 51
        jnz near      ?_068                                   ; 1531 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1533 _ C6. 45, EF, 08
        jmp     ?_069                                   ; 1537 _ EB, 04

?_068:  mov     byte [ebp-11H], 7                       ; 1539 _ C6. 45, EF, 07
?_069:  mov     eax, dword [ebp+0CH]                    ; 153D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1540 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1542 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1545 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1548 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 154B _ 8B. 40, 04
        imul    ecx, eax                                ; 154E _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1551 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1554 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1557 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 155A _ 8B. 45, F4
        add     eax, ebx                                ; 155D _ 01. D8
        add     eax, ecx                                ; 155F _ 01. C8
        add     edx, eax                                ; 1561 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1563 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1566 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1568 _ FF. 45, F4
?_070:  cmp     dword [ebp-0CH], 15                     ; 156B _ 83. 7D, F4, 0F
        jle near      ?_065                                   ; 156f _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1571 _ FF. 45, F0
?_071:  cmp     dword [ebp-10H], 13                     ; 1574 _ 83. 7D, F0, 0D
        jle near      ?_064                                   ; 1578 _ 0f 8e, ffffff77
        nop                                             ; 157E _ 90
        mov     ebx, dword [ebp-4H]                     ; 157F _ 8B. 5D, FC
        leave                                           ; 1582 _ C9
        ret                                             ; 1583 _ C3
; make_window8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1584 _ 55
        mov     ebp, esp                                ; 1585 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1587 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 158A _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1590 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1593 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 159A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 159D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 15A4 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 15A7 _ C7. 40, 0C, 00000000
        nop                                             ; 15AE _ 90
        pop     ebp                                     ; 15AF _ 5D
        ret                                             ; 15B0 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 15B1 _ 55
        mov     ebp, esp                                ; 15B2 _ 89. E5
        sub     esp, 16                                 ; 15B4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 15B7 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 15BE _ C7. 45, FC, 00000000
        jmp     ?_073                                   ; 15C5 _ EB, 13

?_072:  mov     eax, dword [ebp+8H]                     ; 15C7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15CA _ 8B. 55, FC
        add     edx, 2                                  ; 15CD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15D0 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 15D4 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 15D7 _ FF. 45, FC
?_073:  mov     eax, dword [ebp+8H]                     ; 15DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15DD _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 15DF _ 39. 45, FC
        jc near       ?_072                                   ; 15e2 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 15E4 _ 8B. 45, F8
        leave                                           ; 15E7 _ C9
        ret                                             ; 15E8 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 15E9 _ 55
        mov     ebp, esp                                ; 15EA _ 89. E5
        sub     esp, 16                                 ; 15EC _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 15EF _ C7. 45, FC, 00000000
        jmp     ?_077                                   ; 15F6 _ E9, 00000084

?_074:  mov     eax, dword [ebp+8H]                     ; 15FB _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15FE _ 8B. 55, FC
        add     edx, 2                                  ; 1601 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1604 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1608 _ 39. 45, 0C
        ja      ?_076                                   ; 160B _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 160D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1610 _ 8B. 55, FC
        add     edx, 2                                  ; 1613 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1616 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1619 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 161C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 161F _ 8B. 55, FC
        add     edx, 2                                  ; 1622 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1625 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1628 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 162B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 162E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1631 _ 8B. 55, FC
        add     edx, 2                                  ; 1634 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1637 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 163A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 163D _ 8B. 55, FC
        add     edx, 2                                  ; 1640 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1643 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1647 _ 2B. 45, 0C
        mov     edx, eax                                ; 164A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 164C _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 164F _ 8B. 4D, FC
        add     ecx, 2                                  ; 1652 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1655 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1659 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 165C _ 8B. 55, FC
        add     edx, 2                                  ; 165F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1662 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1666 _ 85. C0
        jnz near      ?_075                                   ; 1668 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 166A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 166D _ 8B. 00
        lea     edx, [eax-1H]                           ; 166F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1672 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1675 _ 89. 10
?_075:  mov     eax, dword [ebp-8H]                     ; 1677 _ 8B. 45, F8
        jmp     ?_078                                   ; 167A _ EB, 16

?_076:  inc     dword [ebp-4H]                          ; 167C _ FF. 45, FC
?_077:  mov     eax, dword [ebp+8H]                     ; 167F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1682 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1684 _ 39. 45, FC
        jc near       ?_074                                   ; 1687 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 168D _ B8, 00000000
?_078:  leave                                           ; 1692 _ C9
        ret                                             ; 1693 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1694 _ 55
        mov     ebp, esp                                ; 1695 _ 89. E5
        push    ebx                                     ; 1697 _ 53
        sub     esp, 16                                 ; 1698 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 169B _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 16A2 _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 16A4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16A7 _ 8B. 55, F8
        add     edx, 2                                  ; 16AA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16AD _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 16B0 _ 39. 45, 0C
        jc near       ?_081                                   ; 16b3 _ 72, 0f
        inc     dword [ebp-8H]                          ; 16B5 _ FF. 45, F8
?_080:  mov     eax, dword [ebp+8H]                     ; 16B8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16BB _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 16BD _ 39. 45, F8
        jl      ?_079                                   ; 16C0 _ 7C, E2
        jmp     ?_082                                   ; 16C2 _ EB, 01

?_081:  nop                                             ; 16C4 _ 90
?_082:  cmp     dword [ebp-8H], 0                       ; 16C5 _ 83. 7D, F8, 00
        jle near      ?_084                                   ; 16c9 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 16CF _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16D2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16D5 _ 8B. 45, 08
        add     edx, 2                                  ; 16D8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 16DB _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 16DE _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 16E1 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 16E4 _ 8B. 45, 08
        add     ecx, 2                                  ; 16E7 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16EA _ 8B. 44 C8, 04
        add     eax, edx                                ; 16EE _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 16F0 _ 39. 45, 0C
        jne near      ?_084                                   ; 16f3 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 16F9 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16FC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16FF _ 8B. 45, 08
        add     edx, 2                                  ; 1702 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1705 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1709 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 170C _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 170F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1712 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1715 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1718 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 171B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 171F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1722 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1724 _ 39. 45, F8
        jge near      ?_083                                   ; 1727 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 1729 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 172C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 172F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1732 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1735 _ 8B. 55, F8
        add     edx, 2                                  ; 1738 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 173B _ 8B. 04 D0
        cmp     ecx, eax                                ; 173E _ 39. C1
        jnz near      ?_083                                   ; 1740 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 1742 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1745 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1748 _ 8B. 45, 08
        add     edx, 2                                  ; 174B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 174E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1752 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1755 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1758 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 175B _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 175F _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1762 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1765 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1768 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 176B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 176E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1772 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1775 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1777 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 177A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 177D _ 89. 10
?_083:  mov     eax, 0                                  ; 177F _ B8, 00000000
        jmp     ?_090                                   ; 1784 _ E9, 0000011B

?_084:  mov     eax, dword [ebp+8H]                     ; 1789 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 178C _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 178E _ 39. 45, F8
        jge near      ?_085                                   ; 1791 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1793 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1796 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1799 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 179C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 179F _ 8B. 55, F8
        add     edx, 2                                  ; 17A2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 17A5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 17A8 _ 39. C1
        jnz near      ?_085                                   ; 17aa _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 17AC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 17AF _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 17B2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17B5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17B8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 17BB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 17BE _ 8B. 55, F8
        add     edx, 2                                  ; 17C1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 17C4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 17C8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 17CB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 17CE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 17D1 _ 8B. 55, F8
        add     edx, 2                                  ; 17D4 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 17D7 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 17DB _ B8, 00000000
        jmp     ?_090                                   ; 17E0 _ E9, 000000BF

?_085:  mov     eax, dword [ebp+8H]                     ; 17E5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17E8 _ 8B. 00
        cmp     eax, 4095                               ; 17EA _ 3D, 00000FFF
        jg  near      ?_089                                   ; 17ef _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 17F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17F8 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 17FA _ 89. 45, F4
        jmp     ?_087                                   ; 17FD _ EB, 27

?_086:  mov     eax, dword [ebp-0CH]                    ; 17FF _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1802 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1805 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1808 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 180B _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 180E _ 8B. 45, 08
        add     edx, 2                                  ; 1811 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1814 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1817 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1819 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 181C _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 181F _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1823 _ FF. 4D, F4
?_087:  mov     eax, dword [ebp-0CH]                    ; 1826 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1829 _ 3B. 45, F8
        jg  near      ?_086                                   ; 182c _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 182E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1831 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1833 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1836 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1839 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 183B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 183E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1841 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1844 _ 8B. 00
        cmp     edx, eax                                ; 1846 _ 39. C2
        jge near      ?_088                                   ; 1848 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 184A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 184D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 184F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1852 _ 89. 50, 04
?_088:  mov     eax, dword [ebp+8H]                     ; 1855 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1858 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 185B _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 185E _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1861 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1864 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1867 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 186A _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 186D _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1870 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1874 _ B8, 00000000
        jmp     ?_090                                   ; 1879 _ EB, 29

?_089:  mov     eax, dword [ebp+8H]                     ; 187B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 187E _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1881 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1884 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1887 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 188A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 188D _ 8B. 40, 08
        mov     edx, eax                                ; 1890 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1892 _ 8B. 45, 10
        add     eax, edx                                ; 1895 _ 01. D0
        mov     edx, eax                                ; 1897 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1899 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 189C _ 89. 50, 08
        mov     eax, 4294967295                         ; 189F _ B8, FFFFFFFF
?_090:  add     esp, 16                                 ; 18A4 _ 83. C4, 10
        pop     ebx                                     ; 18A7 _ 5B
        pop     ebp                                     ; 18A8 _ 5D
        ret                                             ; 18A9 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 18AA _ 55
        mov     ebp, esp                                ; 18AB _ 89. E5
        sub     esp, 16                                 ; 18AD _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 18B0 _ 8B. 45, 0C
        add     eax, 4095                               ; 18B3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18B8 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 18BD _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 18C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18C3 _ FF. 75, 08
        call    memman_alloc                            ; 18C6 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 18CB _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 18CE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 18D1 _ 8B. 45, FC
        leave                                           ; 18D4 _ C9
        ret                                             ; 18D5 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 18D6 _ 55
        mov     ebp, esp                                ; 18D7 _ 89. E5
        sub     esp, 16                                 ; 18D9 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 18DC _ 8B. 45, 10
        add     eax, 4095                               ; 18DF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 18E4 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 18E9 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 18EC _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 18EF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18F2 _ FF. 75, 08
        call    memman_free                             ; 18F5 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 18FA _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 18FD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1900 _ 8B. 45, FC
        leave                                           ; 1903 _ C9
        ret                                             ; 1904 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1905 _ 55
        mov     ebp, esp                                ; 1906 _ 89. E5
        sub     esp, 24                                 ; 1908 _ 83. EC, 18
        sub     esp, 8                                  ; 190B _ 83. EC, 08
        push    9232                                    ; 190E _ 68, 00002410
        push    dword [ebp+8H]                          ; 1913 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1916 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 191B _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 191E _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1921 _ 83. 7D, F0, 00
        jnz near      ?_091                                   ; 1925 _ 75, 07
        mov     eax, 0                                  ; 1927 _ B8, 00000000
        jmp     ?_094                                   ; 192C _ EB, 53

?_091:  mov     eax, dword [ebp-10H]                    ; 192E _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 1931 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1934 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 1936 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1939 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 193C _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 193F _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 1942 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1945 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1948 _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 194B _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 1952 _ C7. 45, F4, 00000000
        jmp     ?_093                                   ; 1959 _ EB, 1A

?_092:  mov     eax, dword [ebp-10H]                    ; 195B _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 195E _ 8B. 55, F4
        add     edx, 33                                 ; 1961 _ 83. C2, 21
        shl     edx, 5                                  ; 1964 _ C1. E2, 05
        add     eax, edx                                ; 1967 _ 01. D0
        add     eax, 12                                 ; 1969 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 196C _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1972 _ FF. 45, F4
?_093:  cmp     dword [ebp-0CH], 255                    ; 1975 _ 81. 7D, F4, 000000FF
        jle near      ?_092                                   ; 197c _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 197E _ 8B. 45, F0
?_094:  leave                                           ; 1981 _ C9
        ret                                             ; 1982 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1983 _ 55
        mov     ebp, esp                                ; 1984 _ 89. E5
        sub     esp, 16                                 ; 1986 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1989 _ C7. 45, FC, 00000000
        jmp     ?_097                                   ; 1990 _ EB, 56

?_095:  mov     eax, dword [ebp+8H]                     ; 1992 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1995 _ 8B. 55, FC
        add     edx, 33                                 ; 1998 _ 83. C2, 21
        shl     edx, 5                                  ; 199B _ C1. E2, 05
        add     eax, edx                                ; 199E _ 01. D0
        add     eax, 12                                 ; 19A0 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 19A3 _ 8B. 00
        test    eax, eax                                ; 19A5 _ 85. C0
        jnz near      ?_096                                   ; 19a7 _ 75, 3c
        mov     eax, dword [ebp-4H]                     ; 19A9 _ 8B. 45, FC
        shl     eax, 5                                  ; 19AC _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 19AF _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 19B5 _ 8B. 45, 08
        add     eax, edx                                ; 19B8 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 19BA _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 19BD _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 19C0 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 19C3 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 19C6 _ 8B. 55, F8
        mov     dword [eax+ecx*4], edx                  ; 19C9 _ 89. 14 88
        mov     eax, dword [ebp-8H]                     ; 19CC _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 19CF _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 19D6 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 19D9 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 19E0 _ 8B. 45, F8
        jmp     ?_098                                   ; 19E3 _ EB, 11

?_096:  inc     dword [ebp-4H]                          ; 19E5 _ FF. 45, FC
?_097:  cmp     dword [ebp-4H], 255                     ; 19E8 _ 81. 7D, FC, 000000FF
        jle near      ?_095                                   ; 19ef _ 7e, a1
        mov     eax, 0                                  ; 19F1 _ B8, 00000000
?_098:  leave                                           ; 19F6 _ C9
        ret                                             ; 19F7 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 19F8 _ 55
        mov     ebp, esp                                ; 19F9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 19FB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 19FE _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1A01 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A03 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A06 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1A09 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A0C _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1A0F _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1A12 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A15 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1A18 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1A1B _ 89. 50, 14
        nop                                             ; 1A1E _ 90
        pop     ebp                                     ; 1A1F _ 5D
        ret                                             ; 1A20 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1A21 _ 55
        mov     ebp, esp                                ; 1A22 _ 89. E5
        push    ebx                                     ; 1A24 _ 53
        sub     esp, 20                                 ; 1A25 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A28 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1A2B _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 1A2E _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 1A31 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A34 _ 8B. 40, 0C
        inc     eax                                     ; 1A37 _ 40
        cmp     dword [ebp+10H], eax                    ; 1A38 _ 39. 45, 10
        jle near      ?_099                                   ; 1a3b _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 1A3D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A40 _ 8B. 40, 0C
        inc     eax                                     ; 1A43 _ 40
        mov     dword [ebp+10H], eax                    ; 1A44 _ 89. 45, 10
?_099:  cmp     dword [ebp+10H], -1                     ; 1A47 _ 83. 7D, 10, FF
        jge near      ?_100                                   ; 1a4b _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 1A4D _ C7. 45, 10, FFFFFFFF
?_100:  mov     eax, dword [ebp+0CH]                    ; 1A54 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1A57 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1A5A _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 1A5D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1A60 _ 3B. 45, 10
        jle near      ?_108                                   ; 1a63 _ 0f 8e, 000000f5
        cmp     dword [ebp+10H], 0                      ; 1A69 _ 83. 7D, 10, 00
        js      ?_103                                   ; 1A6D _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 1A6F _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1A72 _ 89. 45, F4
        jmp     ?_102                                   ; 1A75 _ EB, 30

?_101:  mov     eax, dword [ebp-0CH]                    ; 1A77 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A7A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A7D _ 8B. 45, 08
        add     edx, 4                                  ; 1A80 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A83 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A86 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1A89 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1A8C _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A8F _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A92 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A95 _ 8B. 55, F4
        add     edx, 4                                  ; 1A98 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A9B _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1A9E _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1AA1 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1AA4 _ FF. 4D, F4
?_102:  mov     eax, dword [ebp-0CH]                    ; 1AA7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1AAA _ 3B. 45, 10
        jg  near      ?_101                                   ; 1aad _ 7f, c8
        mov     eax, dword [ebp+8H]                     ; 1AAF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1AB2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1AB5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1AB8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1ABB _ 89. 14 88
        jmp     ?_107                                   ; 1ABE _ EB, 5D

?_103:  mov     eax, dword [ebp+8H]                     ; 1AC0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AC3 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1AC6 _ 39. 45, F0
        jge near      ?_106                                   ; 1ac9 _ 7d, 43
        mov     eax, dword [ebp-10H]                    ; 1ACB _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1ACE _ 89. 45, F4
        jmp     ?_105                                   ; 1AD1 _ EB, 30

?_104:  mov     eax, dword [ebp-0CH]                    ; 1AD3 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1AD6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AD9 _ 8B. 45, 08
        add     edx, 4                                  ; 1ADC _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1ADF _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1AE2 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1AE5 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1AE8 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1AEB _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1AEE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AF1 _ 8B. 55, F4
        add     edx, 4                                  ; 1AF4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1AF7 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1AFA _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1AFD _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1B00 _ FF. 45, F4
?_105:  mov     eax, dword [ebp+8H]                     ; 1B03 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B06 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1B09 _ 39. 45, F4
        jl      ?_104                                   ; 1B0C _ 7C, C5
?_106:  mov     eax, dword [ebp+8H]                     ; 1B0E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B11 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1B14 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B17 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1B1A _ 89. 50, 0C
?_107:  mov     eax, dword [ebp+0CH]                    ; 1B1D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B20 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B23 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B26 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B29 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B2C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B2F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B32 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B35 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B38 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B3B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B3E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B41 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B44 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1B47 _ 83. EC, 0C
        push    ebx                                     ; 1B4A _ 53
        push    ecx                                     ; 1B4B _ 51
        push    edx                                     ; 1B4C _ 52
        push    eax                                     ; 1B4D _ 50
        push    dword [ebp+8H]                          ; 1B4E _ FF. 75, 08
        call    sheet_refreshsub                        ; 1B51 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B56 _ 83. C4, 20
        jmp     ?_115                                   ; 1B59 _ E9, 00000104

?_108:  mov     eax, dword [ebp-10H]                    ; 1B5E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1B61 _ 3B. 45, 10
        jge near      ?_115                                   ; 1b64 _ 0f 8d, 000000f8
        cmp     dword [ebp-10H], 0                      ; 1B6A _ 83. 7D, F0, 00
        js      ?_111                                   ; 1B6E _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 1B70 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1B73 _ 89. 45, F4
        jmp     ?_110                                   ; 1B76 _ EB, 30

?_109:  mov     eax, dword [ebp-0CH]                    ; 1B78 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1B7B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B7E _ 8B. 45, 08
        add     edx, 4                                  ; 1B81 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B84 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B87 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1B8A _ 8B. 4D, F4
        add     ecx, 4                                  ; 1B8D _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B90 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B93 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B96 _ 8B. 55, F4
        add     edx, 4                                  ; 1B99 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B9C _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1B9F _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1BA2 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1BA5 _ FF. 45, F4
?_110:  mov     eax, dword [ebp-0CH]                    ; 1BA8 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1BAB _ 3B. 45, 10
        jl      ?_109                                   ; 1BAE _ 7C, C8
        mov     eax, dword [ebp+8H]                     ; 1BB0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1BB3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1BB6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1BB9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1BBC _ 89. 14 88
        jmp     ?_114                                   ; 1BBF _ EB, 65

?_111:  mov     eax, dword [ebp+8H]                     ; 1BC1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BC4 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1BC7 _ 89. 45, F4
        jmp     ?_113                                   ; 1BCA _ EB, 34

?_112:  mov     eax, dword [ebp-0CH]                    ; 1BCC _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 1BCF _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1BD2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BD5 _ 8B. 55, F4
        add     edx, 4                                  ; 1BD8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1BDB _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1BDE _ 8B. 45, 08
        add     ecx, 4                                  ; 1BE1 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1BE4 _ 89. 14 88
        mov     eax, dword [ebp-0CH]                    ; 1BE7 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1BEA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BED _ 8B. 45, 08
        add     edx, 4                                  ; 1BF0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1BF3 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1BF6 _ 8B. 55, F4
        inc     edx                                     ; 1BF9 _ 42
        mov     dword [eax+18H], edx                    ; 1BFA _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1BFD _ FF. 4D, F4
?_113:  mov     eax, dword [ebp-0CH]                    ; 1C00 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1C03 _ 3B. 45, 10
        jge near      ?_112                                   ; 1c06 _ 7d, c4
        mov     eax, dword [ebp+8H]                     ; 1C08 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C0B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C0E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C11 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1C14 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1C17 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1C1A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1C1D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C20 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C23 _ 89. 50, 0C
?_114:  mov     eax, dword [ebp+0CH]                    ; 1C26 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C29 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C2C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C2F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C32 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C35 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C38 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C3B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C3E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1C41 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C44 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C47 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C4A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C4D _ 8B. 40, 0C
        sub     esp, 12                                 ; 1C50 _ 83. EC, 0C
        push    ebx                                     ; 1C53 _ 53
        push    ecx                                     ; 1C54 _ 51
        push    edx                                     ; 1C55 _ 52
        push    eax                                     ; 1C56 _ 50
        push    dword [ebp+8H]                          ; 1C57 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1C5A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C5F _ 83. C4, 20
?_115:  nop                                             ; 1C62 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1C63 _ 8B. 5D, FC
        leave                                           ; 1C66 _ C9
        ret                                             ; 1C67 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1C68 _ 55
        mov     ebp, esp                                ; 1C69 _ 89. E5
        push    esi                                     ; 1C6B _ 56
        push    ebx                                     ; 1C6C _ 53
        mov     eax, dword [ebp+0CH]                    ; 1C6D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1C70 _ 8B. 40, 18
        test    eax, eax                                ; 1C73 _ 85. C0
        js      ?_116                                   ; 1C75 _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 1C77 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C7A _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1C7D _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1C80 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C83 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C86 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1C89 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1C8C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C8F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C92 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1C95 _ 8B. 45, 14
        add     edx, eax                                ; 1C98 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C9A _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1C9D _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1CA0 _ 8B. 45, 10
        add     eax, esi                                ; 1CA3 _ 01. F0
        sub     esp, 12                                 ; 1CA5 _ 83. EC, 0C
        push    ebx                                     ; 1CA8 _ 53
        push    ecx                                     ; 1CA9 _ 51
        push    edx                                     ; 1CAA _ 52
        push    eax                                     ; 1CAB _ 50
        push    dword [ebp+8H]                          ; 1CAC _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CAF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CB4 _ 83. C4, 20
?_116:  mov     eax, 0                                  ; 1CB7 _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1CBC _ 8D. 65, F8
        pop     ebx                                     ; 1CBF _ 5B
        pop     esi                                     ; 1CC0 _ 5E
        pop     ebp                                     ; 1CC1 _ 5D
        ret                                             ; 1CC2 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1CC3 _ 55
        mov     ebp, esp                                ; 1CC4 _ 89. E5
        sub     esp, 24                                 ; 1CC6 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1CC9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CCC _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1CCF _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1CD2 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1CD5 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1CD8 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1CDB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1CDE _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1CE1 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CE4 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1CE7 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1CEA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CED _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1CF0 _ 8B. 40, 18
        test    eax, eax                                ; 1CF3 _ 85. C0
        js      ?_117                                   ; 1CF5 _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 1CF7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1CFA _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1CFD _ 8B. 45, F0
        add     edx, eax                                ; 1D00 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D02 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1D05 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 1D08 _ 8B. 45, F4
        add     eax, ecx                                ; 1D0B _ 01. C8
        sub     esp, 12                                 ; 1D0D _ 83. EC, 0C
        push    edx                                     ; 1D10 _ 52
        push    eax                                     ; 1D11 _ 50
        push    dword [ebp-10H]                         ; 1D12 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1D15 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1D18 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D1B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D20 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1D23 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1D26 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1D29 _ 8B. 45, 14
        add     edx, eax                                ; 1D2C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D2E _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1D31 _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1D34 _ 8B. 45, 10
        add     eax, ecx                                ; 1D37 _ 01. C8
        sub     esp, 12                                 ; 1D39 _ 83. EC, 0C
        push    edx                                     ; 1D3C _ 52
        push    eax                                     ; 1D3D _ 50
        push    dword [ebp+14H]                         ; 1D3E _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1D41 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1D44 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D47 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D4C _ 83. C4, 20
?_117:  nop                                             ; 1D4F _ 90
        leave                                           ; 1D50 _ C9
        ret                                             ; 1D51 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1D52 _ 55
        mov     ebp, esp                                ; 1D53 _ 89. E5
        sub     esp, 48                                 ; 1D55 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1D58 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D5B _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 1D5D _ 89. 45, F0
        cmp     dword [ebp+0CH], 0                      ; 1D60 _ 83. 7D, 0C, 00
        jns     ?_118                                   ; 1D64 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 1D66 _ C7. 45, 0C, 00000000
?_118:  cmp     dword [ebp+10H], 8                      ; 1D6D _ 83. 7D, 10, 08
        jg  near      ?_119                                   ; 1d71 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 1D73 _ C7. 45, 10, 00000000
?_119:  mov     eax, dword [ebp+8H]                     ; 1D7A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1D7D _ 8B. 40, 04
        cmp     dword [ebp+14H], eax                    ; 1D80 _ 39. 45, 14
        jle near      ?_120                                   ; 1d83 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 1D85 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1D88 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 1D8B _ 89. 45, 14
?_120:  mov     eax, dword [ebp+8H]                     ; 1D8E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1D91 _ 8B. 40, 08
        cmp     dword [ebp+18H], eax                    ; 1D94 _ 39. 45, 18
        jle near      ?_121                                   ; 1d97 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 1D99 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1D9C _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 1D9F _ 89. 45, 18
?_121:  mov     dword [ebp-4H], 0                       ; 1DA2 _ C7. 45, FC, 00000000
        jmp     ?_128                                   ; 1DA9 _ E9, 000000D7

?_122:  mov     eax, dword [ebp+8H]                     ; 1DAE _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1DB1 _ 8B. 55, FC
        add     edx, 4                                  ; 1DB4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1DB7 _ 8B. 04 90
        mov     dword [ebp-14H], eax                    ; 1DBA _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 1DBD _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 1DC0 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 1DC2 _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 1DC5 _ C7. 45, F4, 00000000
        jmp     ?_127                                   ; 1DCC _ E9, 000000A2

?_123:  mov     eax, dword [ebp-14H]                    ; 1DD1 _ 8B. 45, EC
        mov     edx, dword [eax+10H]                    ; 1DD4 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 1DD7 _ 8B. 45, F4
        add     eax, edx                                ; 1DDA _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 1DDC _ 89. 45, E4
        mov     dword [ebp-8H], 0                       ; 1DDF _ C7. 45, F8, 00000000
        jmp     ?_126                                   ; 1DE6 _ EB, 79

?_124:  mov     eax, dword [ebp-14H]                    ; 1DE8 _ 8B. 45, EC
        mov     edx, dword [eax+0CH]                    ; 1DEB _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 1DEE _ 8B. 45, F8
        add     eax, edx                                ; 1DF1 _ 01. D0
        mov     dword [ebp-20H], eax                    ; 1DF3 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 1DF6 _ 8B. 45, 0C
        cmp     eax, dword [ebp-20H]                    ; 1DF9 _ 3B. 45, E0
        jg  near      ?_125                                   ; 1dfc _ 7f, 60
        mov     eax, dword [ebp-20H]                    ; 1DFE _ 8B. 45, E0
        cmp     eax, dword [ebp+14H]                    ; 1E01 _ 3B. 45, 14
        jge near      ?_125                                   ; 1e04 _ 7d, 58
        mov     eax, dword [ebp+10H]                    ; 1E06 _ 8B. 45, 10
        cmp     eax, dword [ebp-1CH]                    ; 1E09 _ 3B. 45, E4
        jg  near      ?_125                                   ; 1e0c _ 7f, 50
        mov     eax, dword [ebp-1CH]                    ; 1E0E _ 8B. 45, E4
        cmp     eax, dword [ebp+18H]                    ; 1E11 _ 3B. 45, 18
        jge near      ?_125                                   ; 1e14 _ 7d, 48
        mov     eax, dword [ebp-14H]                    ; 1E16 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1E19 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1E1C _ 0F AF. 45, F4
        mov     edx, eax                                ; 1E20 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1E22 _ 8B. 45, F8
        add     eax, edx                                ; 1E25 _ 01. D0
        mov     edx, eax                                ; 1E27 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1E29 _ 8B. 45, E8
        add     eax, edx                                ; 1E2C _ 01. D0
        mov     al, byte [eax]                          ; 1E2E _ 8A. 00
        mov     byte [ebp-21H], al                      ; 1E30 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1E33 _ 0F B6. 55, DF
        mov     eax, dword [ebp-14H]                    ; 1E37 _ 8B. 45, EC
        mov     eax, dword [eax+14H]                    ; 1E3A _ 8B. 40, 14
        cmp     edx, eax                                ; 1E3D _ 39. C2
        jz near       ?_125                                   ; 1e3f _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 1E41 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E44 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 1E47 _ 0F AF. 45, E4
        mov     edx, eax                                ; 1E4B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1E4D _ 8B. 45, E0
        add     eax, edx                                ; 1E50 _ 01. D0
        mov     edx, eax                                ; 1E52 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E54 _ 8B. 45, F0
        add     edx, eax                                ; 1E57 _ 01. C2
        mov     al, byte [ebp-21H]                      ; 1E59 _ 8A. 45, DF
        mov     byte [edx], al                          ; 1E5C _ 88. 02
?_125:  inc     dword [ebp-8H]                          ; 1E5E _ FF. 45, F8
?_126:  mov     eax, dword [ebp-14H]                    ; 1E61 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1E64 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 1E67 _ 39. 45, F8
        jl      ?_124                                   ; 1E6A _ 0F 8C, FFFFFF78
        inc     dword [ebp-0CH]                         ; 1E70 _ FF. 45, F4
?_127:  mov     eax, dword [ebp-14H]                    ; 1E73 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1E76 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 1E79 _ 39. 45, F4
        jl      ?_123                                   ; 1E7C _ 0F 8C, FFFFFF4F
        inc     dword [ebp-4H]                          ; 1E82 _ FF. 45, FC
?_128:  mov     eax, dword [ebp+8H]                     ; 1E85 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E88 _ 8B. 40, 0C
        cmp     dword [ebp-4H], eax                     ; 1E8B _ 39. 45, FC
        jle near      ?_122                                   ; 1e8e _ 0f 8e, ffffff1a
        nop                                             ; 1E94 _ 90
        nop                                             ; 1E95 _ 90
        leave                                           ; 1E96 _ C9
        ret                                             ; 1E97 _ C3
; sheet_refreshsub End of function



?_129:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_130:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0008 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 0010 _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0018 _ howing.

?_131:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001F _ page is:
        db 20H, 00H                                     ; 0027 _  .

?_132:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0029 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0031 _ L: .

?_133:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0035 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003D _ H: .

?_134:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0041 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0049 _ w: .

?_135:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004D _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0055 _ gh: .

?_136:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 005A _ type: .

?_137:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0061 _ Welcome 
        db 74H, 6FH, 00H                                ; 0069 _ to.

?_138:                                                  ; byte
        db 4DH, 79H, 4FH, 53H, 00H                      ; 006C _ MyOS.



memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_139:  db 00H                                          ; 0006 _ .

?_140:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1775:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1822:                                            ; byte
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

closebtn.1950:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_141:                                                  ; dword
        resb    2                                       ; 0004

?_142:  resw    1                                       ; 0006

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

str.1870:                                               ; byte
        resb    1                                       ; 0220

?_143:  resb    9                                       ; 0221

?_144:  resb    1                                       ; 022A


