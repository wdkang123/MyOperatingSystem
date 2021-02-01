; Disassembly of file: ckernel.o
; Sat Jan 30 17:35:22 2021
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
        mov     eax, dword [?_141]                      ; 001F _ A1, 00000004(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 000000F8(d)
        mov     ax, word [?_142]                        ; 002A _ 66: A1, 00000006(d)
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
        sub     esp, 8                                  ; 01EB _ 83. EC, 08
        push    ?_129                                   ; 01EE _ 68, 00000000(d)
        push    dword [ebp-24H]                         ; 01F3 _ FF. 75, DC
        call    message_box                             ; 01F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01FB _ 83. C4, 10
        sub     esp, 4                                  ; 01FE _ 83. EC, 04
        push    0                                       ; 0201 _ 6A, 00
        push    dword [ebp-14H]                         ; 0203 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 0206 _ FF. 75, DC
        call    sheet_updown                            ; 0209 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 020E _ 83. C4, 10
        sub     esp, 4                                  ; 0211 _ 83. EC, 04
        push    1                                       ; 0214 _ 6A, 01
        push    dword [ebp-18H]                         ; 0216 _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0219 _ FF. 75, DC
        call    sheet_updown                            ; 021C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0221 _ 83. C4, 10
        call    io_sti                                  ; 0224 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0229 _ 83. EC, 0C
        push    mdec                                    ; 022C _ 68, 000000E0(d)
        call    enable_mouse                            ; 0231 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0236 _ 83. C4, 10
        mov     dword [ebp-28H], 0                      ; 0239 _ C7. 45, D8, 00000000
        mov     dword [ebp-0CH], 0                      ; 0240 _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 0247 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 024C _ 83. EC, 0C
        push    keyinfo                                 ; 024F _ 68, 00000008(d)
        call    fifo8_status                            ; 0254 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0259 _ 83. C4, 10
        mov     ebx, eax                                ; 025C _ 89. C3
        sub     esp, 12                                 ; 025E _ 83. EC, 0C
        push    mouseinfo                               ; 0261 _ 68, 00000020(d)
        call    fifo8_status                            ; 0266 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026B _ 83. C4, 10
        add     eax, ebx                                ; 026E _ 01. D8
        test    eax, eax                                ; 0270 _ 85. C0
        jnz near      ?_002                                   ; 0272 _ 75, 07
        call    io_stihlt                               ; 0274 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0279 _ EB, CC

?_002:  sub     esp, 12                                 ; 027B _ 83. EC, 0C
        push    keyinfo                                 ; 027E _ 68, 00000008(d)
        call    fifo8_status                            ; 0283 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0288 _ 83. C4, 10
        test    eax, eax                                ; 028B _ 85. C0
        jz near       ?_003                                   ; 028d _ 74, 72
        call    io_sti                                  ; 028F _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0294 _ 83. EC, 0C
        push    keyinfo                                 ; 0297 _ 68, 00000008(d)
        call    fifo8_get                               ; 029C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A1 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 02A4 _ 89. 45, D8
        cmp     dword [ebp-28H], 28                     ; 02A7 _ 83. 7D, D8, 1C
        jnz near      ?_001                                   ; 02ab _ 75, 9a
        mov     ecx, dword [xsize]                      ; 02AD _ 8B. 0D, 000000F8(d)
        mov     edx, dword [buf_back]                   ; 02B3 _ 8B. 15, 00000100(d)
        mov     ebx, dword [ebp-0CH]                    ; 02B9 _ 8B. 5D, F4
        mov     eax, ebx                                ; 02BC _ 89. D8
        shl     eax, 2                                  ; 02BE _ C1. E0, 02
        add     eax, ebx                                ; 02C1 _ 01. D8
        shl     eax, 2                                  ; 02C3 _ C1. E0, 02
        mov     ebx, eax                                ; 02C6 _ 89. C3
        mov     eax, dword [ebp-20H]                    ; 02C8 _ 8B. 45, E0
        add     eax, ebx                                ; 02CB _ 01. D8
        sub     esp, 4                                  ; 02CD _ 83. EC, 04
        push    7                                       ; 02D0 _ 6A, 07
        push    ecx                                     ; 02D2 _ 51
        push    dword [ebp-0CH]                         ; 02D3 _ FF. 75, F4
        push    edx                                     ; 02D6 _ 52
        push    eax                                     ; 02D7 _ 50
        push    dword [ebp-14H]                         ; 02D8 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 02DB _ FF. 75, DC
        call    showMemoryInfo                          ; 02DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02E3 _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 02E6 _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 02E9 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 02EC _ 3B. 45, E4
        jle near      ?_001                                   ; 02ef _ 0f 8e, ffffff52
        mov     dword [ebp-0CH], 0                      ; 02F5 _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 02FC _ E9, FFFFFF46

?_003:  sub     esp, 12                                 ; 0301 _ 83. EC, 0C
        push    mouseinfo                               ; 0304 _ 68, 00000020(d)
        call    fifo8_status                            ; 0309 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030E _ 83. C4, 10
        test    eax, eax                                ; 0311 _ 85. C0
        je      ?_001                                   ; 0313 _ 0F 84, FFFFFF2E
        sub     esp, 4                                  ; 0319 _ 83. EC, 04
        push    dword [ebp-18H]                         ; 031C _ FF. 75, E8
        push    dword [ebp-14H]                         ; 031F _ FF. 75, EC
        push    dword [ebp-24H]                         ; 0322 _ FF. 75, DC
        call    show_mouse_info                         ; 0325 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032A _ 83. C4, 10
        jmp     ?_001                                   ; 032D _ E9, FFFFFF15
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0332 _ 55
        mov     ebp, esp                                ; 0333 _ 89. E5
        push    ebx                                     ; 0335 _ 53
        sub     esp, 4                                  ; 0336 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0339 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 033C _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 033F _ 8B. 45, 0C
        dec     eax                                     ; 0342 _ 48
        sub     esp, 4                                  ; 0343 _ 83. EC, 04
        push    edx                                     ; 0346 _ 52
        push    eax                                     ; 0347 _ 50
        push    0                                       ; 0348 _ 6A, 00
        push    0                                       ; 034A _ 6A, 00
        push    14                                      ; 034C _ 6A, 0E
        push    dword [ebp+0CH]                         ; 034E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0351 _ FF. 75, 08
        call    boxfill8                                ; 0354 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0359 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 035C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 035F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0362 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0365 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0368 _ 8B. 45, 10
        sub     eax, 28                                 ; 036B _ 83. E8, 1C
        sub     esp, 4                                  ; 036E _ 83. EC, 04
        push    ecx                                     ; 0371 _ 51
        push    edx                                     ; 0372 _ 52
        push    eax                                     ; 0373 _ 50
        push    0                                       ; 0374 _ 6A, 00
        push    8                                       ; 0376 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0378 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 037B _ FF. 75, 08
        call    boxfill8                                ; 037E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0383 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0386 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0389 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 038C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 038F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0392 _ 8B. 45, 10
        sub     eax, 27                                 ; 0395 _ 83. E8, 1B
        sub     esp, 4                                  ; 0398 _ 83. EC, 04
        push    ecx                                     ; 039B _ 51
        push    edx                                     ; 039C _ 52
        push    eax                                     ; 039D _ 50
        push    0                                       ; 039E _ 6A, 00
        push    7                                       ; 03A0 _ 6A, 07
        push    dword [ebp+0CH]                         ; 03A2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03A5 _ FF. 75, 08
        call    boxfill8                                ; 03A8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03AD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03B0 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03B3 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03B6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03B9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03BC _ 8B. 45, 10
        sub     eax, 26                                 ; 03BF _ 83. E8, 1A
        sub     esp, 4                                  ; 03C2 _ 83. EC, 04
        push    ecx                                     ; 03C5 _ 51
        push    edx                                     ; 03C6 _ 52
        push    eax                                     ; 03C7 _ 50
        push    0                                       ; 03C8 _ 6A, 00
        push    8                                       ; 03CA _ 6A, 08
        push    dword [ebp+0CH]                         ; 03CC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03CF _ FF. 75, 08
        call    boxfill8                                ; 03D2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03D7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03DA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 03DD _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 03E0 _ 8B. 45, 10
        sub     eax, 24                                 ; 03E3 _ 83. E8, 18
        sub     esp, 4                                  ; 03E6 _ 83. EC, 04
        push    edx                                     ; 03E9 _ 52
        push    59                                      ; 03EA _ 6A, 3B
        push    eax                                     ; 03EC _ 50
        push    3                                       ; 03ED _ 6A, 03
        push    7                                       ; 03EF _ 6A, 07
        push    dword [ebp+0CH]                         ; 03F1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03F4 _ FF. 75, 08
        call    boxfill8                                ; 03F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03FC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03FF _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0402 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0405 _ 8B. 45, 10
        sub     eax, 24                                 ; 0408 _ 83. E8, 18
        sub     esp, 4                                  ; 040B _ 83. EC, 04
        push    edx                                     ; 040E _ 52
        push    2                                       ; 040F _ 6A, 02
        push    eax                                     ; 0411 _ 50
        push    2                                       ; 0412 _ 6A, 02
        push    7                                       ; 0414 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0416 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0419 _ FF. 75, 08
        call    boxfill8                                ; 041C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0421 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0424 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0427 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 042A _ 8B. 45, 10
        sub     eax, 4                                  ; 042D _ 83. E8, 04
        sub     esp, 4                                  ; 0430 _ 83. EC, 04
        push    edx                                     ; 0433 _ 52
        push    59                                      ; 0434 _ 6A, 3B
        push    eax                                     ; 0436 _ 50
        push    3                                       ; 0437 _ 6A, 03
        push    15                                      ; 0439 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 043B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 043E _ FF. 75, 08
        call    boxfill8                                ; 0441 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0446 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0449 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 044C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 044F _ 8B. 45, 10
        sub     eax, 23                                 ; 0452 _ 83. E8, 17
        sub     esp, 4                                  ; 0455 _ 83. EC, 04
        push    edx                                     ; 0458 _ 52
        push    59                                      ; 0459 _ 6A, 3B
        push    eax                                     ; 045B _ 50
        push    59                                      ; 045C _ 6A, 3B
        push    15                                      ; 045E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0460 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0463 _ FF. 75, 08
        call    boxfill8                                ; 0466 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 046B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 046E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0471 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0474 _ 8B. 45, 10
        sub     eax, 3                                  ; 0477 _ 83. E8, 03
        sub     esp, 4                                  ; 047A _ 83. EC, 04
        push    edx                                     ; 047D _ 52
        push    59                                      ; 047E _ 6A, 3B
        push    eax                                     ; 0480 _ 50
        push    2                                       ; 0481 _ 6A, 02
        push    0                                       ; 0483 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0485 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0488 _ FF. 75, 08
        call    boxfill8                                ; 048B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0490 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0493 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0496 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0499 _ 8B. 45, 10
        sub     eax, 24                                 ; 049C _ 83. E8, 18
        sub     esp, 4                                  ; 049F _ 83. EC, 04
        push    edx                                     ; 04A2 _ 52
        push    60                                      ; 04A3 _ 6A, 3C
        push    eax                                     ; 04A5 _ 50
        push    60                                      ; 04A6 _ 6A, 3C
        push    0                                       ; 04A8 _ 6A, 00
        push    dword [ebp+0CH]                         ; 04AA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04AD _ FF. 75, 08
        call    boxfill8                                ; 04B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04B5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04B8 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04BB _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04BE _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04C1 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04C4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04C7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04CA _ 8B. 45, 0C
        sub     eax, 47                                 ; 04CD _ 83. E8, 2F
        sub     esp, 4                                  ; 04D0 _ 83. EC, 04
        push    ebx                                     ; 04D3 _ 53
        push    ecx                                     ; 04D4 _ 51
        push    edx                                     ; 04D5 _ 52
        push    eax                                     ; 04D6 _ 50
        push    15                                      ; 04D7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04D9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04DC _ FF. 75, 08
        call    boxfill8                                ; 04DF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04E4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04E7 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 04EA _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 04ED _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 04F0 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 04F3 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 04F6 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 04F9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04FC _ 83. E8, 2F
        sub     esp, 4                                  ; 04FF _ 83. EC, 04
        push    ebx                                     ; 0502 _ 53
        push    ecx                                     ; 0503 _ 51
        push    edx                                     ; 0504 _ 52
        push    eax                                     ; 0505 _ 50
        push    15                                      ; 0506 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0508 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 050B _ FF. 75, 08
        call    boxfill8                                ; 050E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0513 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0516 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0519 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 051C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 051F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0522 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0525 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0528 _ 8B. 45, 0C
        sub     eax, 47                                 ; 052B _ 83. E8, 2F
        sub     esp, 4                                  ; 052E _ 83. EC, 04
        push    ebx                                     ; 0531 _ 53
        push    ecx                                     ; 0532 _ 51
        push    edx                                     ; 0533 _ 52
        push    eax                                     ; 0534 _ 50
        push    7                                       ; 0535 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0537 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 053A _ FF. 75, 08
        call    boxfill8                                ; 053D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0542 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0545 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0548 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 054B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 054E _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0551 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0554 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0557 _ 8B. 45, 0C
        sub     eax, 3                                  ; 055A _ 83. E8, 03
        sub     esp, 4                                  ; 055D _ 83. EC, 04
        push    ebx                                     ; 0560 _ 53
        push    ecx                                     ; 0561 _ 51
        push    edx                                     ; 0562 _ 52
        push    eax                                     ; 0563 _ 50
        push    7                                       ; 0564 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0566 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0569 _ FF. 75, 08
        call    boxfill8                                ; 056C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0571 _ 83. C4, 20
        nop                                             ; 0574 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0575 _ 8B. 5D, FC
        leave                                           ; 0578 _ C9
        ret                                             ; 0579 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 057A _ 55
        mov     ebp, esp                                ; 057B _ 89. E5
        sub     esp, 8                                  ; 057D _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 0580 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0583 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0586 _ A1, 000000F0(d)
        add     eax, edx                                ; 058B _ 01. D0
        mov     dword [mx], eax                         ; 058D _ A3, 000000F0(d)
        mov     eax, dword [ebp+10H]                    ; 0592 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0595 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0598 _ A1, 000000F4(d)
        add     eax, edx                                ; 059D _ 01. D0
        mov     dword [my], eax                         ; 059F _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 05A4 _ A1, 000000F0(d)
        test    eax, eax                                ; 05A9 _ 85. C0
        jns     ?_004                                   ; 05AB _ 79, 0A
        mov     dword [mx], 0                           ; 05AD _ C7. 05, 000000F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 05B7 _ A1, 000000F4(d)
        test    eax, eax                                ; 05BC _ 85. C0
        jns     ?_005                                   ; 05BE _ 79, 0A
        mov     dword [my], 0                           ; 05C0 _ C7. 05, 000000F4(d), 00000000
?_005:  mov     edx, dword [xsize]                      ; 05CA _ 8B. 15, 000000F8(d)
        mov     eax, dword [mx]                         ; 05D0 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 05D5 _ 39. C2
        jg  near      ?_006                                   ; 05d7 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 05D9 _ A1, 000000F8(d)
        dec     eax                                     ; 05DE _ 48
        mov     dword [mx], eax                         ; 05DF _ A3, 000000F0(d)
?_006:  mov     edx, dword [ysize]                      ; 05E4 _ 8B. 15, 000000FC(d)
        mov     eax, dword [my]                         ; 05EA _ A1, 000000F4(d)
        cmp     edx, eax                                ; 05EF _ 39. C2
        jg  near      ?_007                                   ; 05f1 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 05F3 _ A1, 000000FC(d)
        dec     eax                                     ; 05F8 _ 48
        mov     dword [my], eax                         ; 05F9 _ A3, 000000F4(d)
?_007:  sub     esp, 8                                  ; 05FE _ 83. EC, 08
        push    ?_130                                   ; 0601 _ 68, 00000008(d)
        push    7                                       ; 0606 _ 6A, 07
        push    0                                       ; 0608 _ 6A, 00
        push    0                                       ; 060A _ 6A, 00
        push    dword [ebp+0CH]                         ; 060C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 060F _ FF. 75, 08
        call    showString                              ; 0612 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0617 _ 83. C4, 20
        nop                                             ; 061A _ 90
        leave                                           ; 061B _ C9
        ret                                             ; 061C _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 061D _ 55
        mov     ebp, esp                                ; 061E _ 89. E5
        sub     esp, 24                                 ; 0620 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0623 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0628 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 062B _ C6. 45, F3, 00
        call    io_sti                                  ; 062F _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0634 _ 83. EC, 0C
        push    mouseinfo                               ; 0637 _ 68, 00000020(d)
        call    fifo8_get                               ; 063C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0641 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0644 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0647 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 064B _ 83. EC, 08
        push    eax                                     ; 064E _ 50
        push    mdec                                    ; 064F _ 68, 000000E0(d)
        call    mouse_decode                            ; 0654 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0659 _ 83. C4, 10
        test    eax, eax                                ; 065C _ 85. C0
        jz near       ?_008                                   ; 065e _ 74, 31
        sub     esp, 4                                  ; 0660 _ 83. EC, 04
        push    mdec                                    ; 0663 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0668 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 066B _ FF. 75, 08
        call    computeMousePosition                    ; 066E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0673 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0676 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 067C _ A1, 000000F0(d)
        push    edx                                     ; 0681 _ 52
        push    eax                                     ; 0682 _ 50
        push    dword [ebp+10H]                         ; 0683 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0686 _ FF. 75, 08
        call    sheet_slide                             ; 0689 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068E _ 83. C4, 10
?_008:  nop                                             ; 0691 _ 90
        leave                                           ; 0692 _ C9
        ret                                             ; 0693 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0694 _ 55
        mov     ebp, esp                                ; 0695 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0697 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 069A _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 06A0 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 06A3 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 06A9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 06AC _ 66: C7. 40, 06, 00C8
        nop                                             ; 06B2 _ 90
        pop     ebp                                     ; 06B3 _ 5D
        ret                                             ; 06B4 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 06B5 _ 55
        mov     ebp, esp                                ; 06B6 _ 89. E5
        push    ebx                                     ; 06B8 _ 53
        sub     esp, 36                                 ; 06B9 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 06BC _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 06BF _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 06C2 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 06C5 _ 89. 45, F4
        jmp     ?_010                                   ; 06C8 _ EB, 3C

?_009:  mov     eax, dword [ebp+1CH]                    ; 06CA _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06CD _ 8A. 00
        movzx   eax, al                                 ; 06CF _ 0F B6. C0
        shl     eax, 4                                  ; 06D2 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 06D5 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 06DB _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 06DF _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 06E2 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 06E5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 06E8 _ 8B. 00
        sub     esp, 8                                  ; 06EA _ 83. EC, 08
        push    ebx                                     ; 06ED _ 53
        push    ecx                                     ; 06EE _ 51
        push    dword [ebp+14H]                         ; 06EF _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06F2 _ FF. 75, 10
        push    edx                                     ; 06F5 _ 52
        push    eax                                     ; 06F6 _ 50
        call    showFont8                               ; 06F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06FC _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 06FF _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0703 _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 0706 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0709 _ 8A. 00
        test    al, al                                  ; 070B _ 84. C0
        jnz near      ?_009                                   ; 070d _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 070F _ 8B. 45, 14
        add     eax, 16                                 ; 0712 _ 83. C0, 10
        sub     esp, 8                                  ; 0715 _ 83. EC, 08
        push    eax                                     ; 0718 _ 50
        push    dword [ebp+10H]                         ; 0719 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 071C _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 071F _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0722 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0725 _ FF. 75, 08
        call    sheet_refresh                           ; 0728 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 072D _ 83. C4, 20
        nop                                             ; 0730 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0731 _ 8B. 5D, FC
        leave                                           ; 0734 _ C9
        ret                                             ; 0735 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0736 _ 55
        mov     ebp, esp                                ; 0737 _ 89. E5
        sub     esp, 8                                  ; 0739 _ 83. EC, 08
        sub     esp, 4                                  ; 073C _ 83. EC, 04
        push    table_rgb.1774                          ; 073F _ 68, 00000020(d)
        push    15                                      ; 0744 _ 6A, 0F
        push    0                                       ; 0746 _ 6A, 00
        call    set_palette                             ; 0748 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 074D _ 83. C4, 10
        nop                                             ; 0750 _ 90
        leave                                           ; 0751 _ C9
        ret                                             ; 0752 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0753 _ 55
        mov     ebp, esp                                ; 0754 _ 89. E5
        sub     esp, 24                                 ; 0756 _ 83. EC, 18
        call    io_load_eflags                          ; 0759 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 075E _ 89. 45, F0
        call    io_cli                                  ; 0761 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0766 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0769 _ FF. 75, 08
        push    968                                     ; 076C _ 68, 000003C8
        call    io_out8                                 ; 0771 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0776 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0779 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 077C _ 89. 45, F4
        jmp     ?_012                                   ; 077F _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 0781 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0784 _ 8A. 00
        shr     al, 2                                   ; 0786 _ C0. E8, 02
        movzx   eax, al                                 ; 0789 _ 0F B6. C0
        sub     esp, 8                                  ; 078C _ 83. EC, 08
        push    eax                                     ; 078F _ 50
        push    969                                     ; 0790 _ 68, 000003C9
        call    io_out8                                 ; 0795 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 079A _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 079D _ 8B. 45, 10
        inc     eax                                     ; 07A0 _ 40
        mov     al, byte [eax]                          ; 07A1 _ 8A. 00
        shr     al, 2                                   ; 07A3 _ C0. E8, 02
        movzx   eax, al                                 ; 07A6 _ 0F B6. C0
        sub     esp, 8                                  ; 07A9 _ 83. EC, 08
        push    eax                                     ; 07AC _ 50
        push    969                                     ; 07AD _ 68, 000003C9
        call    io_out8                                 ; 07B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07B7 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07BA _ 8B. 45, 10
        add     eax, 2                                  ; 07BD _ 83. C0, 02
        mov     al, byte [eax]                          ; 07C0 _ 8A. 00
        shr     al, 2                                   ; 07C2 _ C0. E8, 02
        movzx   eax, al                                 ; 07C5 _ 0F B6. C0
        sub     esp, 8                                  ; 07C8 _ 83. EC, 08
        push    eax                                     ; 07CB _ 50
        push    969                                     ; 07CC _ 68, 000003C9
        call    io_out8                                 ; 07D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D6 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 07D9 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 07DD _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 07E0 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 07E3 _ 3B. 45, 0C
        jle near      ?_011                                   ; 07e6 _ 7e, 99
        sub     esp, 12                                 ; 07E8 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 07EB _ FF. 75, F0
        call    io_store_eflags                         ; 07EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07F3 _ 83. C4, 10
        nop                                             ; 07F6 _ 90
        leave                                           ; 07F7 _ C9
        ret                                             ; 07F8 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07F9 _ 55
        mov     ebp, esp                                ; 07FA _ 89. E5
        sub     esp, 20                                 ; 07FC _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07FF _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0802 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0805 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0808 _ 89. 45, F8
        jmp     ?_016                                   ; 080B _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 080D _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0810 _ 89. 45, FC
        jmp     ?_015                                   ; 0813 _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 0815 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0818 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 081C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 081E _ 8B. 45, FC
        add     eax, edx                                ; 0821 _ 01. D0
        mov     edx, eax                                ; 0823 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0825 _ 8B. 45, 08
        add     edx, eax                                ; 0828 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 082A _ 8A. 45, EC
        mov     byte [edx], al                          ; 082D _ 88. 02
        inc     dword [ebp-4H]                          ; 082F _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 0832 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0835 _ 3B. 45, 1C
        jle near      ?_014                                   ; 0838 _ 7e, db
        inc     dword [ebp-8H]                          ; 083A _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 083D _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0840 _ 3B. 45, 20
        jle near      ?_013                                   ; 0843 _ 7e, c8
        nop                                             ; 0845 _ 90
        nop                                             ; 0846 _ 90
        leave                                           ; 0847 _ C9
        ret                                             ; 0848 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0849 _ 55
        mov     ebp, esp                                ; 084A _ 89. E5
        sub     esp, 20                                 ; 084C _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 084F _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0852 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0855 _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 085C _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 0861 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0864 _ 8B. 45, 1C
        add     eax, edx                                ; 0867 _ 01. D0
        mov     al, byte [eax]                          ; 0869 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 086B _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 086E _ 80. 7D, FB, 00
        jns     ?_018                                   ; 0872 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0874 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0877 _ 8B. 45, FC
        add     eax, edx                                ; 087A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 087C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0880 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0882 _ 8B. 45, 10
        add     eax, edx                                ; 0885 _ 01. D0
        mov     edx, eax                                ; 0887 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0889 _ 8B. 45, 08
        add     edx, eax                                ; 088C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 088E _ 8A. 45, EC
        mov     byte [edx], al                          ; 0891 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 0893 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0897 _ 83. E0, 40
        test    eax, eax                                ; 089A _ 85. C0
        jz near       ?_019                                   ; 089c _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 089E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08A1 _ 8B. 45, FC
        add     eax, edx                                ; 08A4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08AA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08AC _ 8B. 45, 10
        add     eax, edx                                ; 08AF _ 01. D0
        lea     edx, [eax+1H]                           ; 08B1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 08B4 _ 8B. 45, 08
        add     edx, eax                                ; 08B7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08B9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08BC _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 08BE _ 0F BE. 45, FB
        and     eax, 20H                                ; 08C2 _ 83. E0, 20
        test    eax, eax                                ; 08C5 _ 85. C0
        jz near       ?_020                                   ; 08c7 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08C9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08CC _ 8B. 45, FC
        add     eax, edx                                ; 08CF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08D1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D7 _ 8B. 45, 10
        add     eax, edx                                ; 08DA _ 01. D0
        lea     edx, [eax+2H]                           ; 08DC _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08DF _ 8B. 45, 08
        add     edx, eax                                ; 08E2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08E4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08E7 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08E9 _ 0F BE. 45, FB
        and     eax, 10H                                ; 08ED _ 83. E0, 10
        test    eax, eax                                ; 08F0 _ 85. C0
        jz near       ?_021                                   ; 08f2 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08F4 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08F7 _ 8B. 45, FC
        add     eax, edx                                ; 08FA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08FC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0900 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0902 _ 8B. 45, 10
        add     eax, edx                                ; 0905 _ 01. D0
        lea     edx, [eax+3H]                           ; 0907 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 090A _ 8B. 45, 08
        add     edx, eax                                ; 090D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 090F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0912 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0914 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0918 _ 83. E0, 08
        test    eax, eax                                ; 091B _ 85. C0
        jz near       ?_022                                   ; 091d _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 091F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0922 _ 8B. 45, FC
        add     eax, edx                                ; 0925 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0927 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 092B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 092D _ 8B. 45, 10
        add     eax, edx                                ; 0930 _ 01. D0
        lea     edx, [eax+4H]                           ; 0932 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0935 _ 8B. 45, 08
        add     edx, eax                                ; 0938 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 093A _ 8A. 45, EC
        mov     byte [edx], al                          ; 093D _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 093F _ 0F BE. 45, FB
        and     eax, 04H                                ; 0943 _ 83. E0, 04
        test    eax, eax                                ; 0946 _ 85. C0
        jz near       ?_023                                   ; 0948 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 094A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 094D _ 8B. 45, FC
        add     eax, edx                                ; 0950 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0952 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0956 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0958 _ 8B. 45, 10
        add     eax, edx                                ; 095B _ 01. D0
        lea     edx, [eax+5H]                           ; 095D _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0960 _ 8B. 45, 08
        add     edx, eax                                ; 0963 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0965 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0968 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 096A _ 0F BE. 45, FB
        and     eax, 02H                                ; 096E _ 83. E0, 02
        test    eax, eax                                ; 0971 _ 85. C0
        jz near       ?_024                                   ; 0973 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0975 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0978 _ 8B. 45, FC
        add     eax, edx                                ; 097B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 097D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0981 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0983 _ 8B. 45, 10
        add     eax, edx                                ; 0986 _ 01. D0
        lea     edx, [eax+6H]                           ; 0988 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 098B _ 8B. 45, 08
        add     edx, eax                                ; 098E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0990 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0993 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0995 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0999 _ 83. E0, 01
        test    eax, eax                                ; 099C _ 85. C0
        jz near       ?_025                                   ; 099e _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 09A0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09A3 _ 8B. 45, FC
        add     eax, edx                                ; 09A6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09A8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09AC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09AE _ 8B. 45, 10
        add     eax, edx                                ; 09B1 _ 01. D0
        lea     edx, [eax+7H]                           ; 09B3 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 09B6 _ 8B. 45, 08
        add     edx, eax                                ; 09B9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09BB _ 8A. 45, EC
        mov     byte [edx], al                          ; 09BE _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 09C0 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 09C3 _ 83. 7D, FC, 0F
        jle near      ?_017                                   ; 09c7 _ 0f 8e, fffffe94
        nop                                             ; 09CD _ 90
        nop                                             ; 09CE _ 90
        leave                                           ; 09CF _ C9
        ret                                             ; 09D0 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09D1 _ 55
        mov     ebp, esp                                ; 09D2 _ 89. E5
        sub     esp, 20                                 ; 09D4 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09D7 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09DA _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09DD _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 09E4 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 09E9 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 09F0 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 09F5 _ 8B. 45, F8
        shl     eax, 4                                  ; 09F8 _ C1. E0, 04
        mov     edx, eax                                ; 09FB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09FD _ 8B. 45, FC
        add     eax, edx                                ; 0A00 _ 01. D0
        add     eax, cursor.1821                        ; 0A02 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A07 _ 8A. 00
        cmp     al, 42                                  ; 0A09 _ 3C, 2A
        jnz near      ?_029                                   ; 0a0b _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A0D _ 8B. 45, F8
        shl     eax, 4                                  ; 0A10 _ C1. E0, 04
        mov     edx, eax                                ; 0A13 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A15 _ 8B. 45, FC
        add     eax, edx                                ; 0A18 _ 01. D0
        mov     edx, eax                                ; 0A1A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A1C _ 8B. 45, 08
        add     eax, edx                                ; 0A1F _ 01. D0
        mov     byte [eax], 0                           ; 0A21 _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0A24 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A27 _ C1. E0, 04
        mov     edx, eax                                ; 0A2A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A2C _ 8B. 45, FC
        add     eax, edx                                ; 0A2F _ 01. D0
        add     eax, cursor.1821                        ; 0A31 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A36 _ 8A. 00
        cmp     al, 79                                  ; 0A38 _ 3C, 4F
        jnz near      ?_030                                   ; 0a3a _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A3C _ 8B. 45, F8
        shl     eax, 4                                  ; 0A3F _ C1. E0, 04
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A44 _ 8B. 45, FC
        add     eax, edx                                ; 0A47 _ 01. D0
        mov     edx, eax                                ; 0A49 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A4B _ 8B. 45, 08
        add     eax, edx                                ; 0A4E _ 01. D0
        mov     byte [eax], 7                           ; 0A50 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 0A53 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A56 _ C1. E0, 04
        mov     edx, eax                                ; 0A59 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A5B _ 8B. 45, FC
        add     eax, edx                                ; 0A5E _ 01. D0
        add     eax, cursor.1821                        ; 0A60 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A65 _ 8A. 00
        cmp     al, 46                                  ; 0A67 _ 3C, 2E
        jnz near      ?_031                                   ; 0a69 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A6B _ 8B. 45, F8
        shl     eax, 4                                  ; 0A6E _ C1. E0, 04
        mov     edx, eax                                ; 0A71 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A73 _ 8B. 45, FC
        add     eax, edx                                ; 0A76 _ 01. D0
        mov     edx, eax                                ; 0A78 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A7A _ 8B. 45, 08
        add     edx, eax                                ; 0A7D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A7F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A82 _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 0A84 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 0A87 _ 83. 7D, FC, 0F
        jle near      ?_028                                   ; 0a8b _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 0A91 _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 0A94 _ 83. 7D, F8, 0F
        jle near      ?_027                                   ; 0a98 _ 0f 8e, ffffff4b
        nop                                             ; 0A9E _ 90
        nop                                             ; 0A9F _ 90
        leave                                           ; 0AA0 _ C9
        ret                                             ; 0AA1 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0AA2 _ 55
        mov     ebp, esp                                ; 0AA3 _ 89. E5
        push    ebx                                     ; 0AA5 _ 53
        sub     esp, 16                                 ; 0AA6 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0AA9 _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0AB0 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0AB2 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0AB9 _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0ABB _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0ABE _ 0F AF. 45, 24
        mov     edx, eax                                ; 0AC2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AC4 _ 8B. 45, F8
        add     eax, edx                                ; 0AC7 _ 01. D0
        mov     edx, eax                                ; 0AC9 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0ACB _ 8B. 45, 20
        add     eax, edx                                ; 0ACE _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0AD0 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0AD3 _ 8B. 55, F4
        add     edx, ecx                                ; 0AD6 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0AD8 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0ADC _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0ADF _ 8B. 4D, F8
        add     ecx, ebx                                ; 0AE2 _ 01. D9
        add     edx, ecx                                ; 0AE4 _ 01. CA
        mov     ecx, edx                                ; 0AE6 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0AE8 _ 8B. 55, 08
        add     edx, ecx                                ; 0AEB _ 01. CA
        mov     al, byte [eax]                          ; 0AED _ 8A. 00
        mov     byte [edx], al                          ; 0AEF _ 88. 02
        inc     dword [ebp-8H]                          ; 0AF1 _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0AF4 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0AF7 _ 3B. 45, 10
        jl      ?_035                                   ; 0AFA _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0AFC _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0AFF _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0B02 _ 3B. 45, 14
        jl      ?_034                                   ; 0B05 _ 7C, AB
        nop                                             ; 0B07 _ 90
        nop                                             ; 0B08 _ 90
        add     esp, 16                                 ; 0B09 _ 83. C4, 10
        pop     ebx                                     ; 0B0C _ 5B
        pop     ebp                                     ; 0B0D _ 5D
        ret                                             ; 0B0E _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0B0F _ 55
        mov     ebp, esp                                ; 0B10 _ 89. E5
        sub     esp, 24                                 ; 0B12 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0B15 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0B1A _ 89. 45, F4
        mov     eax, dword [?_141]                      ; 0B1D _ A1, 00000004(d)
        cwde                                            ; 0B22 _ 98
        mov     dword [ebp-10H], eax                    ; 0B23 _ 89. 45, F0
        mov     ax, word [?_142]                        ; 0B26 _ 66: A1, 00000006(d)
        cwde                                            ; 0B2C _ 98
        mov     dword [ebp-14H], eax                    ; 0B2D _ 89. 45, EC
        sub     esp, 8                                  ; 0B30 _ 83. EC, 08
        push    32                                      ; 0B33 _ 6A, 20
        push    32                                      ; 0B35 _ 6A, 20
        call    io_out8                                 ; 0B37 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B3C _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B3F _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B43 _ 83. EC, 0C
        push    96                                      ; 0B46 _ 6A, 60
        call    io_in8                                  ; 0B48 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4D _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B50 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B53 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B57 _ 83. EC, 08
        push    eax                                     ; 0B5A _ 50
        push    keyinfo                                 ; 0B5B _ 68, 00000008(d)
        call    fifo8_put                               ; 0B60 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B65 _ 83. C4, 10
        nop                                             ; 0B68 _ 90
        leave                                           ; 0B69 _ C9
        ret                                             ; 0B6A _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B6B _ 55
        mov     ebp, esp                                ; 0B6C _ 89. E5
        sub     esp, 4                                  ; 0B6E _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B71 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B74 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B77 _ 80. 7D, FC, 09
        jle near      ?_038                                   ; 0b7b _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 0B7D _ 8A. 45, FC
        add     eax, 55                                 ; 0B80 _ 83. C0, 37
        jmp     ?_039                                   ; 0B83 _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0B85 _ 8A. 45, FC
        add     eax, 48                                 ; 0B88 _ 83. C0, 30
?_039:  leave                                           ; 0B8B _ C9
        ret                                             ; 0B8C _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B8D _ 55
        mov     ebp, esp                                ; 0B8E _ 89. E5
        sub     esp, 20                                 ; 0B90 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B93 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B96 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B99 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0BA0 _ 8A. 45, EC
        and     eax, 0FH                                ; 0BA3 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0BA6 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0BA9 _ 0F BE. 45, FB
        push    eax                                     ; 0BAD _ 50
        call    charToHexVal                            ; 0BAE _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BB3 _ 83. C4, 04
        mov     byte [?_140], al                        ; 0BB6 _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0BBB _ 8A. 45, EC
        shr     al, 4                                   ; 0BBE _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0BC1 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0BC4 _ 8A. 45, EC
        movsx   eax, al                                 ; 0BC7 _ 0F BE. C0
        push    eax                                     ; 0BCA _ 50
        call    charToHexVal                            ; 0BCB _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BD0 _ 83. C4, 04
        mov     byte [?_139], al                        ; 0BD3 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0BD8 _ B8, 00000004(d)
        leave                                           ; 0BDD _ C9
        ret                                             ; 0BDE _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BDF _ 55
        mov     ebp, esp                                ; 0BE0 _ 89. E5
        sub     esp, 16                                 ; 0BE2 _ 83. EC, 10
        mov     byte [str.1869], 48                     ; 0BE5 _ C6. 05, 00000220(d), 30
        mov     byte [?_143], 88                        ; 0BEC _ C6. 05, 00000221(d), 58
        mov     byte [?_144], 0                         ; 0BF3 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-4H], 2                       ; 0BFA _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0C01 _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0C03 _ 8B. 45, FC
        add     eax, str.1869                           ; 0C06 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0C0B _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0C0E _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0C11 _ 83. 7D, FC, 09
        jle near      ?_040                                   ; 0c15 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 0C17 _ C7. 45, F8, 00000009
        jmp     ?_045                                   ; 0C1E _ EB, 41

?_042:  mov     eax, dword [ebp+8H]                     ; 0C20 _ 8B. 45, 08
        and     eax, 0FH                                ; 0C23 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C26 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C29 _ 8B. 45, 08
        shr     eax, 4                                  ; 0C2C _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C2F _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C32 _ 83. 7D, F4, 09
        jle near      ?_043                                   ; 0c36 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 0C38 _ 8B. 45, F4
        add     eax, 55                                 ; 0C3B _ 83. C0, 37
        mov     dl, al                                  ; 0C3E _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C40 _ 8B. 45, F8
        add     eax, str.1869                           ; 0C43 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C48 _ 88. 10
        jmp     ?_044                                   ; 0C4A _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0C4C _ 8B. 45, F4
        add     eax, 48                                 ; 0C4F _ 83. C0, 30
        mov     dl, al                                  ; 0C52 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C54 _ 8B. 45, F8
        add     eax, str.1869                           ; 0C57 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C5C _ 88. 10
?_044:  dec     dword [ebp-8H]                          ; 0C5E _ FF. 4D, F8
?_045:  cmp     dword [ebp-8H], 1                       ; 0C61 _ 83. 7D, F8, 01
        jle near      ?_046                                   ; 0c65 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0C67 _ 83. 7D, 08, 00
        jnz near      ?_042                                   ; 0c6b _ 75, b3
?_046:  mov     eax, str.1869                           ; 0C6D _ B8, 00000220(d)
        leave                                           ; 0C72 _ C9
        ret                                             ; 0C73 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C74 _ 55
        mov     ebp, esp                                ; 0C75 _ 89. E5
        sub     esp, 8                                  ; 0C77 _ 83. EC, 08
?_047:  sub     esp, 12                                 ; 0C7A _ 83. EC, 0C
        push    100                                     ; 0C7D _ 6A, 64
        call    io_in8                                  ; 0C7F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C84 _ 83. C4, 10
        and     eax, 02H                                ; 0C87 _ 83. E0, 02
        test    eax, eax                                ; 0C8A _ 85. C0
        jz near       ?_048                                   ; 0c8c _ 74, 02
        jmp     ?_047                                   ; 0C8E _ EB, EA

?_048:  nop                                             ; 0C90 _ 90
        nop                                             ; 0C91 _ 90
        leave                                           ; 0C92 _ C9
        ret                                             ; 0C93 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C94 _ 55
        mov     ebp, esp                                ; 0C95 _ 89. E5
        sub     esp, 8                                  ; 0C97 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C9A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C9F _ 83. EC, 08
        push    96                                      ; 0CA2 _ 6A, 60
        push    100                                     ; 0CA4 _ 6A, 64
        call    io_out8                                 ; 0CA6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CAB _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CAE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CB3 _ 83. EC, 08
        push    71                                      ; 0CB6 _ 6A, 47
        push    96                                      ; 0CB8 _ 6A, 60
        call    io_out8                                 ; 0CBA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CBF _ 83. C4, 10
        nop                                             ; 0CC2 _ 90
        leave                                           ; 0CC3 _ C9
        ret                                             ; 0CC4 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CC5 _ 55
        mov     ebp, esp                                ; 0CC6 _ 89. E5
        sub     esp, 8                                  ; 0CC8 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CCB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CD0 _ 83. EC, 08
        push    212                                     ; 0CD3 _ 68, 000000D4
        push    100                                     ; 0CD8 _ 6A, 64
        call    io_out8                                 ; 0CDA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CDF _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CE2 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CE7 _ 83. EC, 08
        push    244                                     ; 0CEA _ 68, 000000F4
        push    96                                      ; 0CEF _ 6A, 60
        call    io_out8                                 ; 0CF1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CF6 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CF9 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CFC _ C6. 40, 03, 00
        nop                                             ; 0D00 _ 90
        leave                                           ; 0D01 _ C9
        ret                                             ; 0D02 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0D03 _ 55
        mov     ebp, esp                                ; 0D04 _ 89. E5
        sub     esp, 24                                 ; 0D06 _ 83. EC, 18
        sub     esp, 8                                  ; 0D09 _ 83. EC, 08
        push    32                                      ; 0D0C _ 6A, 20
        push    160                                     ; 0D0E _ 68, 000000A0
        call    io_out8                                 ; 0D13 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D18 _ 83. C4, 10
        sub     esp, 8                                  ; 0D1B _ 83. EC, 08
        push    32                                      ; 0D1E _ 6A, 20
        push    32                                      ; 0D20 _ 6A, 20
        call    io_out8                                 ; 0D22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D27 _ 83. C4, 10
        sub     esp, 12                                 ; 0D2A _ 83. EC, 0C
        push    96                                      ; 0D2D _ 6A, 60
        call    io_in8                                  ; 0D2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D34 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D37 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D3A _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D3E _ 83. EC, 08
        push    eax                                     ; 0D41 _ 50
        push    mouseinfo                               ; 0D42 _ 68, 00000020(d)
        call    fifo8_put                               ; 0D47 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D4C _ 83. C4, 10
        nop                                             ; 0D4F _ 90
        leave                                           ; 0D50 _ C9
        ret                                             ; 0D51 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D52 _ 55
        mov     ebp, esp                                ; 0D53 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D55 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D58 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D5B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D5E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D61 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D64 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D66 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D69 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D6C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D6F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D72 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D79 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D7C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D83 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D86 _ C7. 40, 08, 00000000
        nop                                             ; 0D8D _ 90
        pop     ebp                                     ; 0D8E _ 5D
        ret                                             ; 0D8F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D90 _ 55
        mov     ebp, esp                                ; 0D91 _ 89. E5
        sub     esp, 4                                  ; 0D93 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D96 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D99 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D9C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D9F _ 8B. 40, 10
        test    eax, eax                                ; 0DA2 _ 85. C0
        jnz near      ?_049                                   ; 0da4 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0DA6 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0DA9 _ 8B. 40, 14
        or      eax, 01H                                ; 0DAC _ 83. C8, 01
        mov     edx, eax                                ; 0DAF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DB1 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0DB4 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0DB7 _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0DBC _ EB, 4F

?_049:  mov     eax, dword [ebp+8H]                     ; 0DBE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DC1 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DC3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DC6 _ 8B. 40, 04
        add     edx, eax                                ; 0DC9 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0DCB _ 8A. 45, FC
        mov     byte [edx], al                          ; 0DCE _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0DD0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DD3 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0DD6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DD9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DDC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DDF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DE2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DE5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DE8 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DEB _ 39. C2
        jnz near      ?_050                                   ; 0ded _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0DEF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DF2 _ C7. 40, 04, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0DF9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DFC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DFF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0E02 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E05 _ 89. 50, 10
        mov     eax, 0                                  ; 0E08 _ B8, 00000000
?_051:  leave                                           ; 0E0D _ C9
        ret                                             ; 0E0E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0E0F _ 55
        mov     ebp, esp                                ; 0E10 _ 89. E5
        sub     esp, 16                                 ; 0E12 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0E15 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E18 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E1B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E1E _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E21 _ 39. C2
        jnz near      ?_052                                   ; 0e23 _ 75, 07
        mov     eax, 4294967295                         ; 0E25 _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0E2A _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0E2C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E2F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E31 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E34 _ 8B. 40, 08
        add     eax, edx                                ; 0E37 _ 01. D0
        mov     al, byte [eax]                          ; 0E39 _ 8A. 00
        movzx   eax, al                                 ; 0E3B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E3E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E41 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E44 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E47 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E4A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E4D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E50 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E53 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E56 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E59 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E5C _ 39. C2
        jnz near      ?_053                                   ; 0e5e _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 0E60 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E63 _ C7. 40, 08, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0E6A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E6D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E70 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E73 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E76 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E79 _ 8B. 45, FC
?_054:  leave                                           ; 0E7C _ C9
        ret                                             ; 0E7D _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E7E _ 55
        mov     ebp, esp                                ; 0E7F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E81 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E84 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E87 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E8A _ 8B. 40, 10
        sub     edx, eax                                ; 0E8D _ 29. C2
        mov     eax, edx                                ; 0E8F _ 89. D0
        pop     ebp                                     ; 0E91 _ 5D
        ret                                             ; 0E92 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E93 _ 55
        mov     ebp, esp                                ; 0E94 _ 89. E5
        sub     esp, 4                                  ; 0E96 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E99 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E9C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E9F _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EA2 _ 8A. 40, 03
        test    al, al                                  ; 0EA5 _ 84. C0
        jnz near      ?_056                                   ; 0ea7 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0EA9 _ 80. 7D, FC, FA
        jnz near      ?_055                                   ; 0ead _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0EAF _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EB2 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 0EB6 _ B8, 00000000
        jmp     ?_063                                   ; 0EBB _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 0EC0 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EC3 _ 8A. 40, 03
        cmp     al, 1                                   ; 0EC6 _ 3C, 01
        jnz near      ?_058                                   ; 0ec8 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0ECA _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0ECE _ 25, 000000C8
        cmp     eax, 8                                  ; 0ED3 _ 83. F8, 08
        jnz near      ?_057                                   ; 0ed6 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 0ED8 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EDB _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0EDE _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0EE0 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0EE3 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 0EE7 _ B8, 00000000
        jmp     ?_063                                   ; 0EEC _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 0EF1 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EF4 _ 8A. 40, 03
        cmp     al, 2                                   ; 0EF7 _ 3C, 02
        jnz near      ?_059                                   ; 0ef9 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 0EFB _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EFE _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0F01 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0F04 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0F07 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F0B _ B8, 00000000
        jmp     ?_063                                   ; 0F10 _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 0F15 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F18 _ 8A. 40, 03
        cmp     al, 3                                   ; 0F1B _ 3C, 03
        jne near      ?_062                                   ; 0f1d _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 0F23 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F26 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F29 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F2C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F2F _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F33 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F36 _ 8A. 00
        movzx   eax, al                                 ; 0F38 _ 0F B6. C0
        and     eax, 07H                                ; 0F3B _ 83. E0, 07
        mov     edx, eax                                ; 0F3E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F40 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F43 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F46 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0F49 _ 8A. 40, 01
        movzx   edx, al                                 ; 0F4C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F4F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F52 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F55 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0F58 _ 8A. 40, 02
        movzx   edx, al                                 ; 0F5B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F5E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F61 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F64 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F67 _ 8A. 00
        movzx   eax, al                                 ; 0F69 _ 0F B6. C0
        and     eax, 10H                                ; 0F6C _ 83. E0, 10
        test    eax, eax                                ; 0F6F _ 85. C0
        jz near       ?_060                                   ; 0f71 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F73 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F76 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F79 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F7E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F80 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F83 _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 0F86 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F89 _ 8A. 00
        movzx   eax, al                                 ; 0F8B _ 0F B6. C0
        and     eax, 20H                                ; 0F8E _ 83. E0, 20
        test    eax, eax                                ; 0F91 _ 85. C0
        jz near       ?_061                                   ; 0f93 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F95 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F98 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F9B _ 0D, FFFFFF00
        mov     edx, eax                                ; 0FA0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FA2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FA5 _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 0FA8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FAB _ 8B. 40, 08
        neg     eax                                     ; 0FAE _ F7. D8
        mov     edx, eax                                ; 0FB0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FB2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FB5 _ 89. 50, 08
        mov     eax, 1                                  ; 0FB8 _ B8, 00000001
        jmp     ?_063                                   ; 0FBD _ EB, 05

?_062:  mov     eax, 4294967295                         ; 0FBF _ B8, FFFFFFFF
?_063:  leave                                           ; 0FC4 _ C9
        ret                                             ; 0FC5 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FC6 _ 55
        mov     ebp, esp                                ; 0FC7 _ 89. E5
        sub     esp, 56                                 ; 0FC9 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0FCC _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0FD3 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0FDA _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0FE1 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 0FE8 _ 8B. 15, 000000FC(d)
        mov     eax, dword [ebp+0CH]                    ; 0FEE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0FF1 _ 8B. 00
        sub     esp, 4                                  ; 0FF3 _ 83. EC, 04
        push    edx                                     ; 0FF6 _ 52
        push    dword [ebp+1CH]                         ; 0FF7 _ FF. 75, 1C
        push    eax                                     ; 0FFA _ 50
        call    init_screen8                            ; 0FFB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1000 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1003 _ 8B. 45, 20
        movsx   eax, al                                 ; 1006 _ 0F BE. C0
        sub     esp, 8                                  ; 1009 _ 83. EC, 08
        push    ?_131                                   ; 100C _ 68, 0000001F(d)
        push    eax                                     ; 1011 _ 50
        push    dword [ebp-10H]                         ; 1012 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1015 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1018 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 101B _ FF. 75, 08
        call    showString                              ; 101E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1023 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1026 _ 8B. 45, 18
        sub     esp, 12                                 ; 1029 _ 83. EC, 0C
        push    eax                                     ; 102C _ 50
        call    intToHexStr                             ; 102D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1032 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1035 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1038 _ 8B. 45, 20
        movsx   eax, al                                 ; 103B _ 0F BE. C0
        sub     esp, 8                                  ; 103E _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1041 _ FF. 75, E4
        push    eax                                     ; 1044 _ 50
        push    dword [ebp-10H]                         ; 1045 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1048 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 104B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 104E _ FF. 75, 08
        call    showString                              ; 1051 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1056 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1059 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 105D _ 8B. 45, 20
        movsx   eax, al                                 ; 1060 _ 0F BE. C0
        sub     esp, 8                                  ; 1063 _ 83. EC, 08
        push    ?_132                                   ; 1066 _ 68, 00000029(d)
        push    eax                                     ; 106B _ 50
        push    dword [ebp-10H]                         ; 106C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 106F _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1072 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1075 _ FF. 75, 08
        call    showString                              ; 1078 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 107D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1080 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1083 _ 8B. 00
        sub     esp, 12                                 ; 1085 _ 83. EC, 0C
        push    eax                                     ; 1088 _ 50
        call    intToHexStr                             ; 1089 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 108E _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1091 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1094 _ 8B. 45, 20
        movsx   eax, al                                 ; 1097 _ 0F BE. C0
        sub     esp, 8                                  ; 109A _ 83. EC, 08
        push    dword [ebp-20H]                         ; 109D _ FF. 75, E0
        push    eax                                     ; 10A0 _ 50
        push    dword [ebp-10H]                         ; 10A1 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10A4 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 10A7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AA _ FF. 75, 08
        call    showString                              ; 10AD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B2 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10B5 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 10B9 _ 8B. 45, 20
        movsx   eax, al                                 ; 10BC _ 0F BE. C0
        sub     esp, 8                                  ; 10BF _ 83. EC, 08
        push    ?_133                                   ; 10C2 _ 68, 00000035(d)
        push    eax                                     ; 10C7 _ 50
        push    dword [ebp-10H]                         ; 10C8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10CB _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 10CE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10D1 _ FF. 75, 08
        call    showString                              ; 10D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10D9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10DC _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 10DF _ 8B. 40, 04
        sub     esp, 12                                 ; 10E2 _ 83. EC, 0C
        push    eax                                     ; 10E5 _ 50
        call    intToHexStr                             ; 10E6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10EB _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 10EE _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 10F1 _ 8B. 45, 20
        movsx   eax, al                                 ; 10F4 _ 0F BE. C0
        sub     esp, 8                                  ; 10F7 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 10FA _ FF. 75, DC
        push    eax                                     ; 10FD _ 50
        push    dword [ebp-10H]                         ; 10FE _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1101 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1104 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1107 _ FF. 75, 08
        call    showString                              ; 110A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 110F _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1112 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1116 _ 8B. 45, 20
        movsx   eax, al                                 ; 1119 _ 0F BE. C0
        sub     esp, 8                                  ; 111C _ 83. EC, 08
        push    ?_134                                   ; 111F _ 68, 00000041(d)
        push    eax                                     ; 1124 _ 50
        push    dword [ebp-10H]                         ; 1125 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1128 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 112B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 112E _ FF. 75, 08
        call    showString                              ; 1131 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1136 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1139 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 113C _ 8B. 40, 08
        sub     esp, 12                                 ; 113F _ 83. EC, 0C
        push    eax                                     ; 1142 _ 50
        call    intToHexStr                             ; 1143 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1148 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 114B _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 114E _ 8B. 45, 20
        movsx   eax, al                                 ; 1151 _ 0F BE. C0
        sub     esp, 8                                  ; 1154 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1157 _ FF. 75, D8
        push    eax                                     ; 115A _ 50
        push    dword [ebp-10H]                         ; 115B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 115E _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1161 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1164 _ FF. 75, 08
        call    showString                              ; 1167 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 116C _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 116F _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1173 _ 8B. 45, 20
        movsx   eax, al                                 ; 1176 _ 0F BE. C0
        sub     esp, 8                                  ; 1179 _ 83. EC, 08
        push    ?_135                                   ; 117C _ 68, 0000004D(d)
        push    eax                                     ; 1181 _ 50
        push    dword [ebp-10H]                         ; 1182 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1185 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1188 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 118B _ FF. 75, 08
        call    showString                              ; 118E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1193 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1196 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1199 _ 8B. 40, 0C
        sub     esp, 12                                 ; 119C _ 83. EC, 0C
        push    eax                                     ; 119F _ 50
        call    intToHexStr                             ; 11A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11A5 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 11A8 _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 11AB _ 8B. 45, 20
        movsx   eax, al                                 ; 11AE _ 0F BE. C0
        sub     esp, 8                                  ; 11B1 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 11B4 _ FF. 75, D4
        push    eax                                     ; 11B7 _ 50
        push    dword [ebp-10H]                         ; 11B8 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11BB _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 11BE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C1 _ FF. 75, 08
        call    showString                              ; 11C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11C9 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11CC _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 11D0 _ 8B. 45, 20
        movsx   eax, al                                 ; 11D3 _ 0F BE. C0
        sub     esp, 8                                  ; 11D6 _ 83. EC, 08
        push    ?_136                                   ; 11D9 _ 68, 0000005A(d)
        push    eax                                     ; 11DE _ 50
        push    dword [ebp-10H]                         ; 11DF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11E2 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 11E5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11E8 _ FF. 75, 08
        call    showString                              ; 11EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11F0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 11F3 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 11F6 _ 8B. 40, 10
        sub     esp, 12                                 ; 11F9 _ 83. EC, 0C
        push    eax                                     ; 11FC _ 50
        call    intToHexStr                             ; 11FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1202 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 1205 _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 1208 _ 8B. 45, 20
        movsx   eax, al                                 ; 120B _ 0F BE. C0
        sub     esp, 8                                  ; 120E _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1211 _ FF. 75, D0
        push    eax                                     ; 1214 _ 50
        push    dword [ebp-10H]                         ; 1215 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1218 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 121B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 121E _ FF. 75, 08
        call    showString                              ; 1221 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1226 _ 83. C4, 20
        nop                                             ; 1229 _ 90
        leave                                           ; 122A _ C9
        ret                                             ; 122B _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 122C _ 55
        mov     ebp, esp                                ; 122D _ 89. E5
        sub     esp, 24                                 ; 122F _ 83. EC, 18
        sub     esp, 12                                 ; 1232 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1235 _ FF. 75, 08
        call    sheet_alloc                             ; 1238 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 123D _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1240 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1243 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1248 _ 83. EC, 08
        push    10880                                   ; 124B _ 68, 00002A80
        push    eax                                     ; 1250 _ 50
        call    memman_alloc_4k                         ; 1251 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1256 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1259 _ 89. 45, F0
        sub     esp, 12                                 ; 125C _ 83. EC, 0C
        push    -1                                      ; 125F _ 6A, FF
        push    68                                      ; 1261 _ 6A, 44
        push    160                                     ; 1263 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1268 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 126B _ FF. 75, F4
        call    sheet_setbuf                            ; 126E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1273 _ 83. C4, 20
        sub     esp, 4                                  ; 1276 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1279 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 127C _ FF. 75, F4
        push    dword [ebp+8H]                          ; 127F _ FF. 75, 08
        call    make_window8                            ; 1282 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1287 _ 83. C4, 10
        sub     esp, 8                                  ; 128A _ 83. EC, 08
        push    ?_137                                   ; 128D _ 68, 00000061(d)
        push    0                                       ; 1292 _ 6A, 00
        push    28                                      ; 1294 _ 6A, 1C
        push    24                                      ; 1296 _ 6A, 18
        push    dword [ebp-0CH]                         ; 1298 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 129B _ FF. 75, 08
        call    showString                              ; 129E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12A3 _ 83. C4, 20
        sub     esp, 8                                  ; 12A6 _ 83. EC, 08
        push    ?_138                                   ; 12A9 _ 68, 0000006C(d)
        push    0                                       ; 12AE _ 6A, 00
        push    44                                      ; 12B0 _ 6A, 2C
        push    24                                      ; 12B2 _ 6A, 18
        push    dword [ebp-0CH]                         ; 12B4 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 12B7 _ FF. 75, 08
        call    showString                              ; 12BA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12BF _ 83. C4, 20
        push    72                                      ; 12C2 _ 6A, 48
        push    80                                      ; 12C4 _ 6A, 50
        push    dword [ebp-0CH]                         ; 12C6 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 12C9 _ FF. 75, 08
        call    sheet_slide                             ; 12CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12D1 _ 83. C4, 10
        sub     esp, 4                                  ; 12D4 _ 83. EC, 04
        push    2                                       ; 12D7 _ 6A, 02
        push    dword [ebp-0CH]                         ; 12D9 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 12DC _ FF. 75, 08
        call    sheet_updown                            ; 12DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12E4 _ 83. C4, 10
        nop                                             ; 12E7 _ 90
        leave                                           ; 12E8 _ C9
        ret                                             ; 12E9 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 12EA _ 55
        mov     ebp, esp                                ; 12EB _ 89. E5
        push    ebx                                     ; 12ED _ 53
        sub     esp, 36                                 ; 12EE _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 12F1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 12F4 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 12F7 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 12FA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 12FD _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1300 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1303 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1306 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1309 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 130C _ 8B. 00
        push    0                                       ; 130E _ 6A, 00
        push    edx                                     ; 1310 _ 52
        push    0                                       ; 1311 _ 6A, 00
        push    0                                       ; 1313 _ 6A, 00
        push    8                                       ; 1315 _ 6A, 08
        push    dword [ebp-18H]                         ; 1317 _ FF. 75, E8
        push    eax                                     ; 131A _ 50
        call    boxfill8                                ; 131B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1320 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1323 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1326 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1329 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 132C _ 8B. 00
        push    1                                       ; 132E _ 6A, 01
        push    edx                                     ; 1330 _ 52
        push    1                                       ; 1331 _ 6A, 01
        push    1                                       ; 1333 _ 6A, 01
        push    7                                       ; 1335 _ 6A, 07
        push    dword [ebp-18H]                         ; 1337 _ FF. 75, E8
        push    eax                                     ; 133A _ 50
        call    boxfill8                                ; 133B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1340 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1343 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1346 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1349 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 134C _ 8B. 00
        push    edx                                     ; 134E _ 52
        push    0                                       ; 134F _ 6A, 00
        push    0                                       ; 1351 _ 6A, 00
        push    0                                       ; 1353 _ 6A, 00
        push    8                                       ; 1355 _ 6A, 08
        push    dword [ebp-18H]                         ; 1357 _ FF. 75, E8
        push    eax                                     ; 135A _ 50
        call    boxfill8                                ; 135B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1360 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1363 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1366 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1369 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 136C _ 8B. 00
        push    edx                                     ; 136E _ 52
        push    1                                       ; 136F _ 6A, 01
        push    1                                       ; 1371 _ 6A, 01
        push    1                                       ; 1373 _ 6A, 01
        push    7                                       ; 1375 _ 6A, 07
        push    dword [ebp-18H]                         ; 1377 _ FF. 75, E8
        push    eax                                     ; 137A _ 50
        call    boxfill8                                ; 137B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1380 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1383 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1386 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1389 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 138C _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 138F _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1392 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1395 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1398 _ 8B. 00
        push    ebx                                     ; 139A _ 53
        push    ecx                                     ; 139B _ 51
        push    1                                       ; 139C _ 6A, 01
        push    edx                                     ; 139E _ 52
        push    15                                      ; 139F _ 6A, 0F
        push    dword [ebp-18H]                         ; 13A1 _ FF. 75, E8
        push    eax                                     ; 13A4 _ 50
        call    boxfill8                                ; 13A5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13AA _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13AD _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 13B0 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 13B3 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 13B6 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 13B9 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 13BC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13BF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13C2 _ 8B. 00
        push    ebx                                     ; 13C4 _ 53
        push    ecx                                     ; 13C5 _ 51
        push    0                                       ; 13C6 _ 6A, 00
        push    edx                                     ; 13C8 _ 52
        push    0                                       ; 13C9 _ 6A, 00
        push    dword [ebp-18H]                         ; 13CB _ FF. 75, E8
        push    eax                                     ; 13CE _ 50
        call    boxfill8                                ; 13CF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13D4 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13D7 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 13DA _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 13DD _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 13E0 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 13E3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13E6 _ 8B. 00
        push    ecx                                     ; 13E8 _ 51
        push    edx                                     ; 13E9 _ 52
        push    2                                       ; 13EA _ 6A, 02
        push    2                                       ; 13EC _ 6A, 02
        push    8                                       ; 13EE _ 6A, 08
        push    dword [ebp-18H]                         ; 13F0 _ FF. 75, E8
        push    eax                                     ; 13F3 _ 50
        call    boxfill8                                ; 13F4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13F9 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 13FC _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 13FF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1402 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1405 _ 8B. 00
        push    20                                      ; 1407 _ 6A, 14
        push    edx                                     ; 1409 _ 52
        push    3                                       ; 140A _ 6A, 03
        push    3                                       ; 140C _ 6A, 03
        push    12                                      ; 140E _ 6A, 0C
        push    dword [ebp-18H]                         ; 1410 _ FF. 75, E8
        push    eax                                     ; 1413 _ 50
        call    boxfill8                                ; 1414 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1419 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 141C _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 141F _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1422 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1425 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 1428 _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 142B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 142E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1431 _ 8B. 00
        push    ebx                                     ; 1433 _ 53
        push    ecx                                     ; 1434 _ 51
        push    edx                                     ; 1435 _ 52
        push    1                                       ; 1436 _ 6A, 01
        push    15                                      ; 1438 _ 6A, 0F
        push    dword [ebp-18H]                         ; 143A _ FF. 75, E8
        push    eax                                     ; 143D _ 50
        call    boxfill8                                ; 143E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1443 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1446 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1449 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 144C _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 144F _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 1452 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1455 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1458 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 145B _ 8B. 00
        push    ebx                                     ; 145D _ 53
        push    ecx                                     ; 145E _ 51
        push    edx                                     ; 145F _ 52
        push    0                                       ; 1460 _ 6A, 00
        push    0                                       ; 1462 _ 6A, 00
        push    dword [ebp-18H]                         ; 1464 _ FF. 75, E8
        push    eax                                     ; 1467 _ 50
        call    boxfill8                                ; 1468 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 146D _ 83. C4, 1C
        sub     esp, 8                                  ; 1470 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1473 _ FF. 75, 10
        push    7                                       ; 1476 _ 6A, 07
        push    4                                       ; 1478 _ 6A, 04
        push    24                                      ; 147A _ 6A, 18
        push    dword [ebp+0CH]                         ; 147C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 147F _ FF. 75, 08
        call    showString                              ; 1482 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1487 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 148A _ C7. 45, F0, 00000000
        jmp     ?_071                                   ; 1491 _ EB, 7F

?_064:  mov     dword [ebp-0CH], 0                      ; 1493 _ C7. 45, F4, 00000000
        jmp     ?_070                                   ; 149A _ EB, 6D

?_065:  mov     eax, dword [ebp-10H]                    ; 149C _ 8B. 45, F0
        shl     eax, 4                                  ; 149F _ C1. E0, 04
        mov     edx, eax                                ; 14A2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 14A4 _ 8B. 45, F4
        add     eax, edx                                ; 14A7 _ 01. D0
        add     eax, closebtn.1949                      ; 14A9 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 14AE _ 8A. 00
        mov     byte [ebp-11H], al                      ; 14B0 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 14B3 _ 80. 7D, EF, 40
        jnz near      ?_066                                   ; 14b7 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 14B9 _ C6. 45, EF, 00
        jmp     ?_069                                   ; 14BD _ EB, 1C

?_066:  cmp     byte [ebp-11H], 36                      ; 14BF _ 80. 7D, EF, 24
        jnz near      ?_067                                   ; 14c3 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 14C5 _ C6. 45, EF, 0F
        jmp     ?_069                                   ; 14C9 _ EB, 10

?_067:  cmp     byte [ebp-11H], 81                      ; 14CB _ 80. 7D, EF, 51
        jnz near      ?_068                                   ; 14cf _ 75, 06
        mov     byte [ebp-11H], 8                       ; 14D1 _ C6. 45, EF, 08
        jmp     ?_069                                   ; 14D5 _ EB, 04

?_068:  mov     byte [ebp-11H], 7                       ; 14D7 _ C6. 45, EF, 07
?_069:  mov     eax, dword [ebp+0CH]                    ; 14DB _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 14DE _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 14E0 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 14E3 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 14E6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14E9 _ 8B. 40, 04
        imul    ecx, eax                                ; 14EC _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 14EF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 14F2 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 14F5 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 14F8 _ 8B. 45, F4
        add     eax, ebx                                ; 14FB _ 01. D8
        add     eax, ecx                                ; 14FD _ 01. C8
        add     edx, eax                                ; 14FF _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1501 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1504 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1506 _ FF. 45, F4
?_070:  cmp     dword [ebp-0CH], 15                     ; 1509 _ 83. 7D, F4, 0F
        jle near      ?_065                                   ; 150d _ 7e, 8d
        inc     dword [ebp-10H]                         ; 150F _ FF. 45, F0
?_071:  cmp     dword [ebp-10H], 13                     ; 1512 _ 83. 7D, F0, 0D
        jle near      ?_064                                   ; 1516 _ 0f 8e, ffffff77
        nop                                             ; 151C _ 90
        mov     ebx, dword [ebp-4H]                     ; 151D _ 8B. 5D, FC
        leave                                           ; 1520 _ C9
        ret                                             ; 1521 _ C3
; make_window8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1522 _ 55
        mov     ebp, esp                                ; 1523 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1525 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1528 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 152E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1531 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1538 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 153B _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1542 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1545 _ C7. 40, 0C, 00000000
        nop                                             ; 154C _ 90
        pop     ebp                                     ; 154D _ 5D
        ret                                             ; 154E _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 154F _ 55
        mov     ebp, esp                                ; 1550 _ 89. E5
        sub     esp, 16                                 ; 1552 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1555 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 155C _ C7. 45, FC, 00000000
        jmp     ?_073                                   ; 1563 _ EB, 13

?_072:  mov     eax, dword [ebp+8H]                     ; 1565 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1568 _ 8B. 55, FC
        add     edx, 2                                  ; 156B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 156E _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1572 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1575 _ FF. 45, FC
?_073:  mov     eax, dword [ebp+8H]                     ; 1578 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 157B _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 157D _ 39. 45, FC
        jc near       ?_072                                   ; 1580 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1582 _ 8B. 45, F8
        leave                                           ; 1585 _ C9
        ret                                             ; 1586 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1587 _ 55
        mov     ebp, esp                                ; 1588 _ 89. E5
        sub     esp, 16                                 ; 158A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 158D _ C7. 45, FC, 00000000
        jmp     ?_077                                   ; 1594 _ E9, 00000084

?_074:  mov     eax, dword [ebp+8H]                     ; 1599 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 159C _ 8B. 55, FC
        add     edx, 2                                  ; 159F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15A2 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 15A6 _ 39. 45, 0C
        ja      ?_076                                   ; 15A9 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 15AB _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15AE _ 8B. 55, FC
        add     edx, 2                                  ; 15B1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15B4 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 15B7 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 15BA _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15BD _ 8B. 55, FC
        add     edx, 2                                  ; 15C0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 15C3 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 15C6 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 15C9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 15CC _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15CF _ 8B. 55, FC
        add     edx, 2                                  ; 15D2 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 15D5 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 15D8 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15DB _ 8B. 55, FC
        add     edx, 2                                  ; 15DE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 15E1 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 15E5 _ 2B. 45, 0C
        mov     edx, eax                                ; 15E8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15EA _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 15ED _ 8B. 4D, FC
        add     ecx, 2                                  ; 15F0 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 15F3 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 15F7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 15FA _ 8B. 55, FC
        add     edx, 2                                  ; 15FD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1600 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1604 _ 85. C0
        jnz near      ?_075                                   ; 1606 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 1608 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 160B _ 8B. 00
        lea     edx, [eax-1H]                           ; 160D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1610 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1613 _ 89. 10
?_075:  mov     eax, dword [ebp-8H]                     ; 1615 _ 8B. 45, F8
        jmp     ?_078                                   ; 1618 _ EB, 16

?_076:  inc     dword [ebp-4H]                          ; 161A _ FF. 45, FC
?_077:  mov     eax, dword [ebp+8H]                     ; 161D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1620 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1622 _ 39. 45, FC
        jc near       ?_074                                   ; 1625 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 162B _ B8, 00000000
?_078:  leave                                           ; 1630 _ C9
        ret                                             ; 1631 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1632 _ 55
        mov     ebp, esp                                ; 1633 _ 89. E5
        push    ebx                                     ; 1635 _ 53
        sub     esp, 16                                 ; 1636 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1639 _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 1640 _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 1642 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1645 _ 8B. 55, F8
        add     edx, 2                                  ; 1648 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 164B _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 164E _ 39. 45, 0C
        jc near       ?_081                                   ; 1651 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1653 _ FF. 45, F8
?_080:  mov     eax, dword [ebp+8H]                     ; 1656 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1659 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 165B _ 39. 45, F8
        jl      ?_079                                   ; 165E _ 7C, E2
        jmp     ?_082                                   ; 1660 _ EB, 01

?_081:  nop                                             ; 1662 _ 90
?_082:  cmp     dword [ebp-8H], 0                       ; 1663 _ 83. 7D, F8, 00
        jle near      ?_084                                   ; 1667 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 166D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1670 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1673 _ 8B. 45, 08
        add     edx, 2                                  ; 1676 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1679 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 167C _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 167F _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1682 _ 8B. 45, 08
        add     ecx, 2                                  ; 1685 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1688 _ 8B. 44 C8, 04
        add     eax, edx                                ; 168C _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 168E _ 39. 45, 0C
        jne near      ?_084                                   ; 1691 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1697 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 169A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 169D _ 8B. 45, 08
        add     edx, 2                                  ; 16A0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 16A3 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 16A7 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 16AA _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 16AD _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 16B0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16B3 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 16B6 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 16B9 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 16BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16C0 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 16C2 _ 39. 45, F8
        jge near      ?_083                                   ; 16c5 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 16C7 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 16CA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 16CD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16D0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16D3 _ 8B. 55, F8
        add     edx, 2                                  ; 16D6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16D9 _ 8B. 04 D0
        cmp     ecx, eax                                ; 16DC _ 39. C1
        jnz near      ?_083                                   ; 16de _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 16E0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 16E3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 16E6 _ 8B. 45, 08
        add     edx, 2                                  ; 16E9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 16EC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 16F0 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 16F3 _ 8B. 4D, F8
        add     ecx, 2                                  ; 16F6 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 16F9 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 16FD _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1700 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1703 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1706 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1709 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 170C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1710 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1713 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1715 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1718 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 171B _ 89. 10
?_083:  mov     eax, 0                                  ; 171D _ B8, 00000000
        jmp     ?_090                                   ; 1722 _ E9, 0000011B

?_084:  mov     eax, dword [ebp+8H]                     ; 1727 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 172A _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 172C _ 39. 45, F8
        jge near      ?_085                                   ; 172f _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1731 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1734 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1737 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 173A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 173D _ 8B. 55, F8
        add     edx, 2                                  ; 1740 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1743 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1746 _ 39. C1
        jnz near      ?_085                                   ; 1748 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 174A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 174D _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1750 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1753 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1756 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1759 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 175C _ 8B. 55, F8
        add     edx, 2                                  ; 175F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1762 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1766 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1769 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 176C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 176F _ 8B. 55, F8
        add     edx, 2                                  ; 1772 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1775 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1779 _ B8, 00000000
        jmp     ?_090                                   ; 177E _ E9, 000000BF

?_085:  mov     eax, dword [ebp+8H]                     ; 1783 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1786 _ 8B. 00
        cmp     eax, 4095                               ; 1788 _ 3D, 00000FFF
        jg  near      ?_089                                   ; 178d _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1793 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1796 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1798 _ 89. 45, F4
        jmp     ?_087                                   ; 179B _ EB, 27

?_086:  mov     eax, dword [ebp-0CH]                    ; 179D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 17A0 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 17A3 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 17A6 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 17A9 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 17AC _ 8B. 45, 08
        add     edx, 2                                  ; 17AF _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 17B2 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 17B5 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 17B7 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 17BA _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 17BD _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 17C1 _ FF. 4D, F4
?_087:  mov     eax, dword [ebp-0CH]                    ; 17C4 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 17C7 _ 3B. 45, F8
        jg  near      ?_086                                   ; 17ca _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 17CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17CF _ 8B. 00
        lea     edx, [eax+1H]                           ; 17D1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17D4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 17D7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 17D9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17DC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17DF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17E2 _ 8B. 00
        cmp     edx, eax                                ; 17E4 _ 39. C2
        jge near      ?_088                                   ; 17e6 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 17E8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 17EB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 17ED _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 17F0 _ 89. 50, 04
?_088:  mov     eax, dword [ebp+8H]                     ; 17F3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 17F6 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 17F9 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 17FC _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 17FF _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1802 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1805 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1808 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 180B _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 180E _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1812 _ B8, 00000000
        jmp     ?_090                                   ; 1817 _ EB, 29

?_089:  mov     eax, dword [ebp+8H]                     ; 1819 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 181C _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 181F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1822 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1825 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1828 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 182B _ 8B. 40, 08
        mov     edx, eax                                ; 182E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1830 _ 8B. 45, 10
        add     eax, edx                                ; 1833 _ 01. D0
        mov     edx, eax                                ; 1835 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1837 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 183A _ 89. 50, 08
        mov     eax, 4294967295                         ; 183D _ B8, FFFFFFFF
?_090:  add     esp, 16                                 ; 1842 _ 83. C4, 10
        pop     ebx                                     ; 1845 _ 5B
        pop     ebp                                     ; 1846 _ 5D
        ret                                             ; 1847 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1848 _ 55
        mov     ebp, esp                                ; 1849 _ 89. E5
        sub     esp, 16                                 ; 184B _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 184E _ 8B. 45, 0C
        add     eax, 4095                               ; 1851 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1856 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 185B _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 185E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1861 _ FF. 75, 08
        call    memman_alloc                            ; 1864 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1869 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 186C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 186F _ 8B. 45, FC
        leave                                           ; 1872 _ C9
        ret                                             ; 1873 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1874 _ 55
        mov     ebp, esp                                ; 1875 _ 89. E5
        sub     esp, 16                                 ; 1877 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 187A _ 8B. 45, 10
        add     eax, 4095                               ; 187D _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1882 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1887 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 188A _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 188D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1890 _ FF. 75, 08
        call    memman_free                             ; 1893 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1898 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 189B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 189E _ 8B. 45, FC
        leave                                           ; 18A1 _ C9
        ret                                             ; 18A2 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 18A3 _ 55
        mov     ebp, esp                                ; 18A4 _ 89. E5
        sub     esp, 24                                 ; 18A6 _ 83. EC, 18
        sub     esp, 8                                  ; 18A9 _ 83. EC, 08
        push    9232                                    ; 18AC _ 68, 00002410
        push    dword [ebp+8H]                          ; 18B1 _ FF. 75, 08
        call    memman_alloc_4k                         ; 18B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 18BC _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 18BF _ 83. 7D, F0, 00
        jnz near      ?_091                                   ; 18c3 _ 75, 07
        mov     eax, 0                                  ; 18C5 _ B8, 00000000
        jmp     ?_094                                   ; 18CA _ EB, 53

?_091:  mov     eax, dword [ebp-10H]                    ; 18CC _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 18CF _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 18D2 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 18D4 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 18D7 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 18DA _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 18DD _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 18E0 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 18E3 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 18E6 _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 18E9 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 18F0 _ C7. 45, F4, 00000000
        jmp     ?_093                                   ; 18F7 _ EB, 1A

?_092:  mov     eax, dword [ebp-10H]                    ; 18F9 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 18FC _ 8B. 55, F4
        add     edx, 33                                 ; 18FF _ 83. C2, 21
        shl     edx, 5                                  ; 1902 _ C1. E2, 05
        add     eax, edx                                ; 1905 _ 01. D0
        add     eax, 12                                 ; 1907 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 190A _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1910 _ FF. 45, F4
?_093:  cmp     dword [ebp-0CH], 255                    ; 1913 _ 81. 7D, F4, 000000FF
        jle near      ?_092                                   ; 191a _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 191C _ 8B. 45, F0
?_094:  leave                                           ; 191F _ C9
        ret                                             ; 1920 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1921 _ 55
        mov     ebp, esp                                ; 1922 _ 89. E5
        sub     esp, 16                                 ; 1924 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1927 _ C7. 45, FC, 00000000
        jmp     ?_097                                   ; 192E _ EB, 56

?_095:  mov     eax, dword [ebp+8H]                     ; 1930 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1933 _ 8B. 55, FC
        add     edx, 33                                 ; 1936 _ 83. C2, 21
        shl     edx, 5                                  ; 1939 _ C1. E2, 05
        add     eax, edx                                ; 193C _ 01. D0
        add     eax, 12                                 ; 193E _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1941 _ 8B. 00
        test    eax, eax                                ; 1943 _ 85. C0
        jnz near      ?_096                                   ; 1945 _ 75, 3c
        mov     eax, dword [ebp-4H]                     ; 1947 _ 8B. 45, FC
        shl     eax, 5                                  ; 194A _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 194D _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1953 _ 8B. 45, 08
        add     eax, edx                                ; 1956 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 1958 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 195B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 195E _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1961 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1964 _ 8B. 55, F8
        mov     dword [eax+ecx*4], edx                  ; 1967 _ 89. 14 88
        mov     eax, dword [ebp-8H]                     ; 196A _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 196D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1974 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1977 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 197E _ 8B. 45, F8
        jmp     ?_098                                   ; 1981 _ EB, 11

?_096:  inc     dword [ebp-4H]                          ; 1983 _ FF. 45, FC
?_097:  cmp     dword [ebp-4H], 255                     ; 1986 _ 81. 7D, FC, 000000FF
        jle near      ?_095                                   ; 198d _ 7e, a1
        mov     eax, 0                                  ; 198F _ B8, 00000000
?_098:  leave                                           ; 1994 _ C9
        ret                                             ; 1995 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1996 _ 55
        mov     ebp, esp                                ; 1997 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1999 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 199C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 199F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 19A1 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 19A4 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 19A7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19AA _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 19AD _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 19B0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 19B3 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 19B6 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 19B9 _ 89. 50, 14
        nop                                             ; 19BC _ 90
        pop     ebp                                     ; 19BD _ 5D
        ret                                             ; 19BE _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 19BF _ 55
        mov     ebp, esp                                ; 19C0 _ 89. E5
        push    ebx                                     ; 19C2 _ 53
        sub     esp, 20                                 ; 19C3 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 19C6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 19C9 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 19CC _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 19CF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19D2 _ 8B. 40, 0C
        inc     eax                                     ; 19D5 _ 40
        cmp     dword [ebp+10H], eax                    ; 19D6 _ 39. 45, 10
        jle near      ?_099                                   ; 19d9 _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 19DB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 19DE _ 8B. 40, 0C
        inc     eax                                     ; 19E1 _ 40
        mov     dword [ebp+10H], eax                    ; 19E2 _ 89. 45, 10
?_099:  cmp     dword [ebp+10H], -1                     ; 19E5 _ 83. 7D, 10, FF
        jge near      ?_100                                   ; 19e9 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 19EB _ C7. 45, 10, FFFFFFFF
?_100:  mov     eax, dword [ebp+0CH]                    ; 19F2 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 19F5 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 19F8 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 19FB _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 19FE _ 3B. 45, 10
        jle near      ?_108                                   ; 1a01 _ 0f 8e, 000000f5
        cmp     dword [ebp+10H], 0                      ; 1A07 _ 83. 7D, 10, 00
        js      ?_103                                   ; 1A0B _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 1A0D _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1A10 _ 89. 45, F4
        jmp     ?_102                                   ; 1A13 _ EB, 30

?_101:  mov     eax, dword [ebp-0CH]                    ; 1A15 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A18 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A1B _ 8B. 45, 08
        add     edx, 4                                  ; 1A1E _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A21 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A24 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1A27 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1A2A _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A2D _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A30 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A33 _ 8B. 55, F4
        add     edx, 4                                  ; 1A36 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A39 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1A3C _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1A3F _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1A42 _ FF. 4D, F4
?_102:  mov     eax, dword [ebp-0CH]                    ; 1A45 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1A48 _ 3B. 45, 10
        jg  near      ?_101                                   ; 1a4b _ 7f, c8
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A50 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A53 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A56 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1A59 _ 89. 14 88
        jmp     ?_107                                   ; 1A5C _ EB, 5D

?_103:  mov     eax, dword [ebp+8H]                     ; 1A5E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A61 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1A64 _ 39. 45, F0
        jge near      ?_106                                   ; 1a67 _ 7d, 43
        mov     eax, dword [ebp-10H]                    ; 1A69 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1A6C _ 89. 45, F4
        jmp     ?_105                                   ; 1A6F _ EB, 30

?_104:  mov     eax, dword [ebp-0CH]                    ; 1A71 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1A74 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A77 _ 8B. 45, 08
        add     edx, 4                                  ; 1A7A _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1A7D _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1A80 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1A83 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1A86 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1A89 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1A8C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A8F _ 8B. 55, F4
        add     edx, 4                                  ; 1A92 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1A95 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1A98 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1A9B _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1A9E _ FF. 45, F4
?_105:  mov     eax, dword [ebp+8H]                     ; 1AA1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AA4 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 1AA7 _ 39. 45, F4
        jl      ?_104                                   ; 1AAA _ 7C, C5
?_106:  mov     eax, dword [ebp+8H]                     ; 1AAC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AAF _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 1AB2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1AB5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1AB8 _ 89. 50, 0C
?_107:  mov     eax, dword [ebp+0CH]                    ; 1ABB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1ABE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1AC1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1AC4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1AC7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1ACA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1ACD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1AD0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AD3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1AD6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1AD9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1ADC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1ADF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1AE2 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1AE5 _ 83. EC, 0C
        push    ebx                                     ; 1AE8 _ 53
        push    ecx                                     ; 1AE9 _ 51
        push    edx                                     ; 1AEA _ 52
        push    eax                                     ; 1AEB _ 50
        push    dword [ebp+8H]                          ; 1AEC _ FF. 75, 08
        call    sheet_refreshsub                        ; 1AEF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AF4 _ 83. C4, 20
        jmp     ?_115                                   ; 1AF7 _ E9, 00000104

?_108:  mov     eax, dword [ebp-10H]                    ; 1AFC _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1AFF _ 3B. 45, 10
        jge near      ?_115                                   ; 1b02 _ 0f 8d, 000000f8
        cmp     dword [ebp-10H], 0                      ; 1B08 _ 83. 7D, F0, 00
        js      ?_111                                   ; 1B0C _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 1B0E _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1B11 _ 89. 45, F4
        jmp     ?_110                                   ; 1B14 _ EB, 30

?_109:  mov     eax, dword [ebp-0CH]                    ; 1B16 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1B19 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B1C _ 8B. 45, 08
        add     edx, 4                                  ; 1B1F _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B22 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B25 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1B28 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1B2B _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B2E _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1B31 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B34 _ 8B. 55, F4
        add     edx, 4                                  ; 1B37 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B3A _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1B3D _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1B40 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1B43 _ FF. 45, F4
?_110:  mov     eax, dword [ebp-0CH]                    ; 1B46 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1B49 _ 3B. 45, 10
        jl      ?_109                                   ; 1B4C _ 7C, C8
        mov     eax, dword [ebp+8H]                     ; 1B4E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1B51 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1B54 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1B57 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1B5A _ 89. 14 88
        jmp     ?_114                                   ; 1B5D _ EB, 65

?_111:  mov     eax, dword [ebp+8H]                     ; 1B5F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B62 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1B65 _ 89. 45, F4
        jmp     ?_113                                   ; 1B68 _ EB, 34

?_112:  mov     eax, dword [ebp-0CH]                    ; 1B6A _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 1B6D _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1B70 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1B73 _ 8B. 55, F4
        add     edx, 4                                  ; 1B76 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1B79 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1B7C _ 8B. 45, 08
        add     ecx, 4                                  ; 1B7F _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1B82 _ 89. 14 88
        mov     eax, dword [ebp-0CH]                    ; 1B85 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1B88 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B8B _ 8B. 45, 08
        add     edx, 4                                  ; 1B8E _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1B91 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1B94 _ 8B. 55, F4
        inc     edx                                     ; 1B97 _ 42
        mov     dword [eax+18H], edx                    ; 1B98 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1B9B _ FF. 4D, F4
?_113:  mov     eax, dword [ebp-0CH]                    ; 1B9E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1BA1 _ 3B. 45, 10
        jge near      ?_112                                   ; 1ba4 _ 7d, c4
        mov     eax, dword [ebp+8H]                     ; 1BA6 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1BA9 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1BAC _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1BAF _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1BB2 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1BB5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BB8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1BBB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BBE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1BC1 _ 89. 50, 0C
?_114:  mov     eax, dword [ebp+0CH]                    ; 1BC4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BC7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BCA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1BCD _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1BD0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1BD3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1BD6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1BD9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BDC _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1BDF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1BE2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1BE5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1BE8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1BEB _ 8B. 40, 0C
        sub     esp, 12                                 ; 1BEE _ 83. EC, 0C
        push    ebx                                     ; 1BF1 _ 53
        push    ecx                                     ; 1BF2 _ 51
        push    edx                                     ; 1BF3 _ 52
        push    eax                                     ; 1BF4 _ 50
        push    dword [ebp+8H]                          ; 1BF5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1BF8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BFD _ 83. C4, 20
?_115:  nop                                             ; 1C00 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1C01 _ 8B. 5D, FC
        leave                                           ; 1C04 _ C9
        ret                                             ; 1C05 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1C06 _ 55
        mov     ebp, esp                                ; 1C07 _ 89. E5
        push    esi                                     ; 1C09 _ 56
        push    ebx                                     ; 1C0A _ 53
        mov     eax, dword [ebp+0CH]                    ; 1C0B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1C0E _ 8B. 40, 18
        test    eax, eax                                ; 1C11 _ 85. C0
        js      ?_116                                   ; 1C13 _ 78, 40
        mov     eax, dword [ebp+0CH]                    ; 1C15 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C18 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1C1B _ 8B. 45, 1C
        lea     ebx, [edx+eax]                          ; 1C1E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C21 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C24 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1C27 _ 8B. 45, 18
        lea     ecx, [edx+eax]                          ; 1C2A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C2D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C30 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1C33 _ 8B. 45, 14
        add     edx, eax                                ; 1C36 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1C38 _ 8B. 45, 0C
        mov     esi, dword [eax+0CH]                    ; 1C3B _ 8B. 70, 0C
        mov     eax, dword [ebp+10H]                    ; 1C3E _ 8B. 45, 10
        add     eax, esi                                ; 1C41 _ 01. F0
        sub     esp, 12                                 ; 1C43 _ 83. EC, 0C
        push    ebx                                     ; 1C46 _ 53
        push    ecx                                     ; 1C47 _ 51
        push    edx                                     ; 1C48 _ 52
        push    eax                                     ; 1C49 _ 50
        push    dword [ebp+8H]                          ; 1C4A _ FF. 75, 08
        call    sheet_refreshsub                        ; 1C4D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C52 _ 83. C4, 20
?_116:  mov     eax, 0                                  ; 1C55 _ B8, 00000000
        lea     esp, [ebp-8H]                           ; 1C5A _ 8D. 65, F8
        pop     ebx                                     ; 1C5D _ 5B
        pop     esi                                     ; 1C5E _ 5E
        pop     ebp                                     ; 1C5F _ 5D
        ret                                             ; 1C60 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1C61 _ 55
        mov     ebp, esp                                ; 1C62 _ 89. E5
        sub     esp, 24                                 ; 1C64 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1C67 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1C6A _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1C6D _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1C70 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1C73 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1C76 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1C79 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1C7C _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1C7F _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C82 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1C85 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1C88 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C8B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1C8E _ 8B. 40, 18
        test    eax, eax                                ; 1C91 _ 85. C0
        js      ?_117                                   ; 1C93 _ 78, 58
        mov     eax, dword [ebp+0CH]                    ; 1C95 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1C98 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1C9B _ 8B. 45, F0
        add     edx, eax                                ; 1C9E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1CA0 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1CA3 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 1CA6 _ 8B. 45, F4
        add     eax, ecx                                ; 1CA9 _ 01. C8
        sub     esp, 12                                 ; 1CAB _ 83. EC, 0C
        push    edx                                     ; 1CAE _ 52
        push    eax                                     ; 1CAF _ 50
        push    dword [ebp-10H]                         ; 1CB0 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1CB3 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1CB6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CB9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CBE _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1CC1 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1CC4 _ 8B. 50, 08
        mov     eax, dword [ebp+14H]                    ; 1CC7 _ 8B. 45, 14
        add     edx, eax                                ; 1CCA _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1CCC _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1CCF _ 8B. 48, 04
        mov     eax, dword [ebp+10H]                    ; 1CD2 _ 8B. 45, 10
        add     eax, ecx                                ; 1CD5 _ 01. C8
        sub     esp, 12                                 ; 1CD7 _ 83. EC, 0C
        push    edx                                     ; 1CDA _ 52
        push    eax                                     ; 1CDB _ 50
        push    dword [ebp+14H]                         ; 1CDC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1CDF _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1CE2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CE5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CEA _ 83. C4, 20
?_117:  nop                                             ; 1CED _ 90
        leave                                           ; 1CEE _ C9
        ret                                             ; 1CEF _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1CF0 _ 55
        mov     ebp, esp                                ; 1CF1 _ 89. E5
        sub     esp, 48                                 ; 1CF3 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1CF6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CF9 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 1CFB _ 89. 45, F0
        cmp     dword [ebp+0CH], 0                      ; 1CFE _ 83. 7D, 0C, 00
        jns     ?_118                                   ; 1D02 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 1D04 _ C7. 45, 0C, 00000000
?_118:  cmp     dword [ebp+10H], 8                      ; 1D0B _ 83. 7D, 10, 08
        jg  near      ?_119                                   ; 1d0f _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 1D11 _ C7. 45, 10, 00000000
?_119:  mov     eax, dword [ebp+8H]                     ; 1D18 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1D1B _ 8B. 40, 04
        cmp     dword [ebp+14H], eax                    ; 1D1E _ 39. 45, 14
        jle near      ?_120                                   ; 1d21 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 1D23 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1D26 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 1D29 _ 89. 45, 14
?_120:  mov     eax, dword [ebp+8H]                     ; 1D2C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1D2F _ 8B. 40, 08
        cmp     dword [ebp+18H], eax                    ; 1D32 _ 39. 45, 18
        jle near      ?_121                                   ; 1d35 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 1D37 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1D3A _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 1D3D _ 89. 45, 18
?_121:  mov     dword [ebp-4H], 0                       ; 1D40 _ C7. 45, FC, 00000000
        jmp     ?_128                                   ; 1D47 _ E9, 000000D7

?_122:  mov     eax, dword [ebp+8H]                     ; 1D4C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D4F _ 8B. 55, FC
        add     edx, 4                                  ; 1D52 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1D55 _ 8B. 04 90
        mov     dword [ebp-14H], eax                    ; 1D58 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 1D5B _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 1D5E _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 1D60 _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 1D63 _ C7. 45, F4, 00000000
        jmp     ?_127                                   ; 1D6A _ E9, 000000A2

?_123:  mov     eax, dword [ebp-14H]                    ; 1D6F _ 8B. 45, EC
        mov     edx, dword [eax+10H]                    ; 1D72 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 1D75 _ 8B. 45, F4
        add     eax, edx                                ; 1D78 _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 1D7A _ 89. 45, E4
        mov     dword [ebp-8H], 0                       ; 1D7D _ C7. 45, F8, 00000000
        jmp     ?_126                                   ; 1D84 _ EB, 79

?_124:  mov     eax, dword [ebp-14H]                    ; 1D86 _ 8B. 45, EC
        mov     edx, dword [eax+0CH]                    ; 1D89 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 1D8C _ 8B. 45, F8
        add     eax, edx                                ; 1D8F _ 01. D0
        mov     dword [ebp-20H], eax                    ; 1D91 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 1D94 _ 8B. 45, 0C
        cmp     eax, dword [ebp-20H]                    ; 1D97 _ 3B. 45, E0
        jg  near      ?_125                                   ; 1d9a _ 7f, 60
        mov     eax, dword [ebp-20H]                    ; 1D9C _ 8B. 45, E0
        cmp     eax, dword [ebp+14H]                    ; 1D9F _ 3B. 45, 14
        jge near      ?_125                                   ; 1da2 _ 7d, 58
        mov     eax, dword [ebp+10H]                    ; 1DA4 _ 8B. 45, 10
        cmp     eax, dword [ebp-1CH]                    ; 1DA7 _ 3B. 45, E4
        jg  near      ?_125                                   ; 1daa _ 7f, 50
        mov     eax, dword [ebp-1CH]                    ; 1DAC _ 8B. 45, E4
        cmp     eax, dword [ebp+18H]                    ; 1DAF _ 3B. 45, 18
        jge near      ?_125                                   ; 1db2 _ 7d, 48
        mov     eax, dword [ebp-14H]                    ; 1DB4 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1DB7 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1DBA _ 0F AF. 45, F4
        mov     edx, eax                                ; 1DBE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1DC0 _ 8B. 45, F8
        add     eax, edx                                ; 1DC3 _ 01. D0
        mov     edx, eax                                ; 1DC5 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1DC7 _ 8B. 45, E8
        add     eax, edx                                ; 1DCA _ 01. D0
        mov     al, byte [eax]                          ; 1DCC _ 8A. 00
        mov     byte [ebp-21H], al                      ; 1DCE _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1DD1 _ 0F B6. 55, DF
        mov     eax, dword [ebp-14H]                    ; 1DD5 _ 8B. 45, EC
        mov     eax, dword [eax+14H]                    ; 1DD8 _ 8B. 40, 14
        cmp     edx, eax                                ; 1DDB _ 39. C2
        jz near       ?_125                                   ; 1ddd _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 1DDF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DE2 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 1DE5 _ 0F AF. 45, E4
        mov     edx, eax                                ; 1DE9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1DEB _ 8B. 45, E0
        add     eax, edx                                ; 1DEE _ 01. D0
        mov     edx, eax                                ; 1DF0 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1DF2 _ 8B. 45, F0
        add     edx, eax                                ; 1DF5 _ 01. C2
        mov     al, byte [ebp-21H]                      ; 1DF7 _ 8A. 45, DF
        mov     byte [edx], al                          ; 1DFA _ 88. 02
?_125:  inc     dword [ebp-8H]                          ; 1DFC _ FF. 45, F8
?_126:  mov     eax, dword [ebp-14H]                    ; 1DFF _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1E02 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 1E05 _ 39. 45, F8
        jl      ?_124                                   ; 1E08 _ 0F 8C, FFFFFF78
        inc     dword [ebp-0CH]                         ; 1E0E _ FF. 45, F4
?_127:  mov     eax, dword [ebp-14H]                    ; 1E11 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1E14 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 1E17 _ 39. 45, F4
        jl      ?_123                                   ; 1E1A _ 0F 8C, FFFFFF4F
        inc     dword [ebp-4H]                          ; 1E20 _ FF. 45, FC
?_128:  mov     eax, dword [ebp+8H]                     ; 1E23 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E26 _ 8B. 40, 0C
        cmp     dword [ebp-4H], eax                     ; 1E29 _ 39. 45, FC
        jle near      ?_122                                   ; 1e2c _ 0f 8e, ffffff1a
        nop                                             ; 1E32 _ 90
        nop                                             ; 1E33 _ 90
        leave                                           ; 1E34 _ C9
        ret                                             ; 1E35 _ C3
; sheet_refreshsub End of function



?_129:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 6EH, 00H       ; 0000 _ windown.

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

table_rgb.1774:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1821:                                            ; byte
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

closebtn.1949:                                          ; byte
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

str.1869:                                               ; byte
        resb    1                                       ; 0220

?_143:  resb    9                                       ; 0221

?_144:  resb    1                                       ; 022A


