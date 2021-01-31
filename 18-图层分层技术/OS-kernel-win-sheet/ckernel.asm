; Disassembly of file: ckernel.o
; Sat Jan 30 12:02:10 2021
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
        imul    eax, edx                                ; 010A _ 0F AF. C2
        mov     edx, eax                                ; 010D _ 89. C2
        mov     eax, dword [memman]                     ; 010F _ A1, 00000000(d)
        sub     esp, 8                                  ; 0114 _ 83. EC, 08
        push    edx                                     ; 0117 _ 52
        push    eax                                     ; 0118 _ 50
        call    memman_alloc_4k                         ; 0119 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011E _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 0121 _ A3, 00000100(d)
        mov     ecx, dword [ysize]                      ; 0126 _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 012C _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 0132 _ A1, 00000100(d)
        sub     esp, 12                                 ; 0137 _ 83. EC, 0C
        push    99                                      ; 013A _ 6A, 63
        push    ecx                                     ; 013C _ 51
        push    edx                                     ; 013D _ 52
        push    eax                                     ; 013E _ 50
        push    dword [ebp-14H]                         ; 013F _ FF. 75, EC
        call    sheet_setbuf                            ; 0142 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0147 _ 83. C4, 20
        sub     esp, 12                                 ; 014A _ 83. EC, 0C
        push    99                                      ; 014D _ 6A, 63
        push    16                                      ; 014F _ 6A, 10
        push    16                                      ; 0151 _ 6A, 10
        push    buf_mouse                               ; 0153 _ 68, 00000120(d)
        push    dword [ebp-18H]                         ; 0158 _ FF. 75, E8
        call    sheet_setbuf                            ; 015B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0160 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0163 _ 8B. 0D, 000000FC(d)
        mov     edx, dword [xsize]                      ; 0169 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 016F _ A1, 00000100(d)
        sub     esp, 4                                  ; 0174 _ 83. EC, 04
        push    ecx                                     ; 0177 _ 51
        push    edx                                     ; 0178 _ 52
        push    eax                                     ; 0179 _ 50
        call    init_screen8                            ; 017A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 017F _ 83. C4, 10
        sub     esp, 8                                  ; 0182 _ 83. EC, 08
        push    99                                      ; 0185 _ 6A, 63
        push    buf_mouse                               ; 0187 _ 68, 00000120(d)
        call    init_mouse_cursor                       ; 018C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0191 _ 83. C4, 10
        push    0                                       ; 0194 _ 6A, 00
        push    0                                       ; 0196 _ 6A, 00
        push    dword [ebp-14H]                         ; 0198 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 019B _ FF. 75, DC
        call    sheet_slide                             ; 019E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A3 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01A6 _ A1, 000000F8(d)
        sub     eax, 16                                 ; 01AB _ 83. E8, 10
        mov     edx, eax                                ; 01AE _ 89. C2
        shr     edx, 31                                 ; 01B0 _ C1. EA, 1F
        add     eax, edx                                ; 01B3 _ 01. D0
        sar     eax, 1                                  ; 01B5 _ D1. F8
        mov     dword [mx], eax                         ; 01B7 _ A3, 000000F0(d)
        mov     eax, dword [ysize]                      ; 01BC _ A1, 000000FC(d)
        sub     eax, 44                                 ; 01C1 _ 83. E8, 2C
        mov     edx, eax                                ; 01C4 _ 89. C2
        shr     edx, 31                                 ; 01C6 _ C1. EA, 1F
        add     eax, edx                                ; 01C9 _ 01. D0
        sar     eax, 1                                  ; 01CB _ D1. F8
        mov     dword [my], eax                         ; 01CD _ A3, 000000F4(d)
        mov     edx, dword [my]                         ; 01D2 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 01D8 _ A1, 000000F0(d)
        push    edx                                     ; 01DD _ 52
        push    eax                                     ; 01DE _ 50
        push    dword [ebp-18H]                         ; 01DF _ FF. 75, E8
        push    dword [ebp-24H]                         ; 01E2 _ FF. 75, DC
        call    sheet_slide                             ; 01E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01EA _ 83. C4, 10
        sub     esp, 4                                  ; 01ED _ 83. EC, 04
        push    0                                       ; 01F0 _ 6A, 00
        push    dword [ebp-14H]                         ; 01F2 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 01F5 _ FF. 75, DC
        call    sheet_updown                            ; 01F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01FD _ 83. C4, 10
        sub     esp, 4                                  ; 0200 _ 83. EC, 04
        push    1                                       ; 0203 _ 6A, 01
        push    dword [ebp-18H]                         ; 0205 _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0208 _ FF. 75, DC
        call    sheet_updown                            ; 020B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0210 _ 83. C4, 10
        call    io_sti                                  ; 0213 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0218 _ 83. EC, 0C
        push    mdec                                    ; 021B _ 68, 000000E0(d)
        call    enable_mouse                            ; 0220 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0225 _ 83. C4, 10
        mov     dword [ebp-28H], 0                      ; 0228 _ C7. 45, D8, 00000000
        mov     dword [ebp-0CH], 0                      ; 022F _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 0236 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 023B _ 83. EC, 0C
        push    keyinfo                                 ; 023E _ 68, 00000008(d)
        call    fifo8_status                            ; 0243 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0248 _ 83. C4, 10
        mov     ebx, eax                                ; 024B _ 89. C3
        sub     esp, 12                                 ; 024D _ 83. EC, 0C
        push    mouseinfo                               ; 0250 _ 68, 00000020(d)
        call    fifo8_status                            ; 0255 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 025A _ 83. C4, 10
        add     eax, ebx                                ; 025D _ 01. D8
        test    eax, eax                                ; 025F _ 85. C0
        jnz     ?_002                                   ; 0261 _ 75, 07
        call    io_stihlt                               ; 0263 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0268 _ EB, CC

?_002:  sub     esp, 12                                 ; 026A _ 83. EC, 0C
        push    keyinfo                                 ; 026D _ 68, 00000008(d)
        call    fifo8_status                            ; 0272 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0277 _ 83. C4, 10
        test    eax, eax                                ; 027A _ 85. C0
        jz      ?_004                                   ; 027C _ 74, 76
        call    io_sti                                  ; 027E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0283 _ 83. EC, 0C
        push    keyinfo                                 ; 0286 _ 68, 00000008(d)
        call    fifo8_get                               ; 028B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0290 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0293 _ 89. 45, D8
        cmp     dword [ebp-28H], 28                     ; 0296 _ 83. 7D, D8, 1C
        jnz     ?_001                                   ; 029A _ 75, 9A
        mov     ecx, dword [xsize]                      ; 029C _ 8B. 0D, 000000F8(d)
        mov     edx, dword [buf_back]                   ; 02A2 _ 8B. 15, 00000100(d)
        mov     ebx, dword [ebp-0CH]                    ; 02A8 _ 8B. 5D, F4
        mov     eax, ebx                                ; 02AB _ 89. D8
        shl     eax, 2                                  ; 02AD _ C1. E0, 02
        add     eax, ebx                                ; 02B0 _ 01. D8
        shl     eax, 2                                  ; 02B2 _ C1. E0, 02
        mov     ebx, eax                                ; 02B5 _ 89. C3
        mov     eax, dword [ebp-20H]                    ; 02B7 _ 8B. 45, E0
        add     eax, ebx                                ; 02BA _ 01. D8
        sub     esp, 12                                 ; 02BC _ 83. EC, 0C
        push    7                                       ; 02BF _ 6A, 07
        push    ecx                                     ; 02C1 _ 51
        push    dword [ebp-0CH]                         ; 02C2 _ FF. 75, F4
        push    edx                                     ; 02C5 _ 52
        push    eax                                     ; 02C6 _ 50
        call    showMemoryInfo                          ; 02C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02CC _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 02CF _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 02D2 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 02D5 _ 3B. 45, E4
        jle     ?_003                                   ; 02D8 _ 7E, 07
        mov     dword [ebp-0CH], 0                      ; 02DA _ C7. 45, F4, 00000000
?_003:  sub     esp, 12                                 ; 02E1 _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 02E4 _ FF. 75, DC
        call    sheet_refresh                           ; 02E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02EC _ 83. C4, 10
        jmp     ?_001                                   ; 02EF _ E9, FFFFFF42

?_004:  sub     esp, 12                                 ; 02F4 _ 83. EC, 0C
        push    mouseinfo                               ; 02F7 _ 68, 00000020(d)
        call    fifo8_status                            ; 02FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0301 _ 83. C4, 10
        test    eax, eax                                ; 0304 _ 85. C0
        je      ?_001                                   ; 0306 _ 0F 84, FFFFFF2A
        sub     esp, 8                                  ; 030C _ 83. EC, 08
        push    dword [ebp-18H]                         ; 030F _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0312 _ FF. 75, DC
        call    show_mouse_info                         ; 0315 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 031A _ 83. C4, 10
        jmp     ?_001                                   ; 031D _ E9, FFFFFF14
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0322 _ 55
        mov     ebp, esp                                ; 0323 _ 89. E5
        push    ebx                                     ; 0325 _ 53
        sub     esp, 4                                  ; 0326 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0329 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 032C _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 032F _ 8B. 45, 0C
        dec     eax                                     ; 0332 _ 48
        sub     esp, 4                                  ; 0333 _ 83. EC, 04
        push    edx                                     ; 0336 _ 52
        push    eax                                     ; 0337 _ 50
        push    0                                       ; 0338 _ 6A, 00
        push    0                                       ; 033A _ 6A, 00
        push    14                                      ; 033C _ 6A, 0E
        push    dword [ebp+0CH]                         ; 033E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0341 _ FF. 75, 08
        call    boxfill8                                ; 0344 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0349 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 034C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 034F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0352 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0355 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0358 _ 8B. 45, 10
        sub     eax, 28                                 ; 035B _ 83. E8, 1C
        sub     esp, 4                                  ; 035E _ 83. EC, 04
        push    ecx                                     ; 0361 _ 51
        push    edx                                     ; 0362 _ 52
        push    eax                                     ; 0363 _ 50
        push    0                                       ; 0364 _ 6A, 00
        push    8                                       ; 0366 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0368 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 036B _ FF. 75, 08
        call    boxfill8                                ; 036E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0373 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0376 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0379 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 037C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 037F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0382 _ 8B. 45, 10
        sub     eax, 27                                 ; 0385 _ 83. E8, 1B
        sub     esp, 4                                  ; 0388 _ 83. EC, 04
        push    ecx                                     ; 038B _ 51
        push    edx                                     ; 038C _ 52
        push    eax                                     ; 038D _ 50
        push    0                                       ; 038E _ 6A, 00
        push    7                                       ; 0390 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0392 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0395 _ FF. 75, 08
        call    boxfill8                                ; 0398 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 039D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03A0 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 03A3 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 03A6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 03A9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 03AC _ 8B. 45, 10
        sub     eax, 26                                 ; 03AF _ 83. E8, 1A
        sub     esp, 4                                  ; 03B2 _ 83. EC, 04
        push    ecx                                     ; 03B5 _ 51
        push    edx                                     ; 03B6 _ 52
        push    eax                                     ; 03B7 _ 50
        push    0                                       ; 03B8 _ 6A, 00
        push    8                                       ; 03BA _ 6A, 08
        push    dword [ebp+0CH]                         ; 03BC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03BF _ FF. 75, 08
        call    boxfill8                                ; 03C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03CA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 03CD _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 03D0 _ 8B. 45, 10
        sub     eax, 24                                 ; 03D3 _ 83. E8, 18
        sub     esp, 4                                  ; 03D6 _ 83. EC, 04
        push    edx                                     ; 03D9 _ 52
        push    59                                      ; 03DA _ 6A, 3B
        push    eax                                     ; 03DC _ 50
        push    3                                       ; 03DD _ 6A, 03
        push    7                                       ; 03DF _ 6A, 07
        push    dword [ebp+0CH]                         ; 03E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 03E4 _ FF. 75, 08
        call    boxfill8                                ; 03E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03EC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 03EF _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 03F2 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 03F5 _ 8B. 45, 10
        sub     eax, 24                                 ; 03F8 _ 83. E8, 18
        sub     esp, 4                                  ; 03FB _ 83. EC, 04
        push    edx                                     ; 03FE _ 52
        push    2                                       ; 03FF _ 6A, 02
        push    eax                                     ; 0401 _ 50
        push    2                                       ; 0402 _ 6A, 02
        push    7                                       ; 0404 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0406 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0409 _ FF. 75, 08
        call    boxfill8                                ; 040C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0411 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0414 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0417 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 041A _ 8B. 45, 10
        sub     eax, 4                                  ; 041D _ 83. E8, 04
        sub     esp, 4                                  ; 0420 _ 83. EC, 04
        push    edx                                     ; 0423 _ 52
        push    59                                      ; 0424 _ 6A, 3B
        push    eax                                     ; 0426 _ 50
        push    3                                       ; 0427 _ 6A, 03
        push    15                                      ; 0429 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 042B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 042E _ FF. 75, 08
        call    boxfill8                                ; 0431 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0436 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0439 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 043C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 043F _ 8B. 45, 10
        sub     eax, 23                                 ; 0442 _ 83. E8, 17
        sub     esp, 4                                  ; 0445 _ 83. EC, 04
        push    edx                                     ; 0448 _ 52
        push    59                                      ; 0449 _ 6A, 3B
        push    eax                                     ; 044B _ 50
        push    59                                      ; 044C _ 6A, 3B
        push    15                                      ; 044E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0450 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0453 _ FF. 75, 08
        call    boxfill8                                ; 0456 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 045B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 045E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0461 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0464 _ 8B. 45, 10
        sub     eax, 3                                  ; 0467 _ 83. E8, 03
        sub     esp, 4                                  ; 046A _ 83. EC, 04
        push    edx                                     ; 046D _ 52
        push    59                                      ; 046E _ 6A, 3B
        push    eax                                     ; 0470 _ 50
        push    2                                       ; 0471 _ 6A, 02
        push    0                                       ; 0473 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0475 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0478 _ FF. 75, 08
        call    boxfill8                                ; 047B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0480 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0483 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0486 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0489 _ 8B. 45, 10
        sub     eax, 24                                 ; 048C _ 83. E8, 18
        sub     esp, 4                                  ; 048F _ 83. EC, 04
        push    edx                                     ; 0492 _ 52
        push    60                                      ; 0493 _ 6A, 3C
        push    eax                                     ; 0495 _ 50
        push    60                                      ; 0496 _ 6A, 3C
        push    0                                       ; 0498 _ 6A, 00
        push    dword [ebp+0CH]                         ; 049A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 049D _ FF. 75, 08
        call    boxfill8                                ; 04A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04A8 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 04AB _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 04AE _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 04B1 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 04B4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04B7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 04BA _ 8B. 45, 0C
        sub     eax, 47                                 ; 04BD _ 83. E8, 2F
        sub     esp, 4                                  ; 04C0 _ 83. EC, 04
        push    ebx                                     ; 04C3 _ 53
        push    ecx                                     ; 04C4 _ 51
        push    edx                                     ; 04C5 _ 52
        push    eax                                     ; 04C6 _ 50
        push    15                                      ; 04C7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04C9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04CC _ FF. 75, 08
        call    boxfill8                                ; 04CF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04D4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04D7 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 04DA _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 04DD _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 04E0 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 04E3 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 04E6 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 04E9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 04EC _ 83. E8, 2F
        sub     esp, 4                                  ; 04EF _ 83. EC, 04
        push    ebx                                     ; 04F2 _ 53
        push    ecx                                     ; 04F3 _ 51
        push    edx                                     ; 04F4 _ 52
        push    eax                                     ; 04F5 _ 50
        push    15                                      ; 04F6 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 04F8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04FB _ FF. 75, 08
        call    boxfill8                                ; 04FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0503 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0506 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0509 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 050C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 050F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0512 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0515 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0518 _ 8B. 45, 0C
        sub     eax, 47                                 ; 051B _ 83. E8, 2F
        sub     esp, 4                                  ; 051E _ 83. EC, 04
        push    ebx                                     ; 0521 _ 53
        push    ecx                                     ; 0522 _ 51
        push    edx                                     ; 0523 _ 52
        push    eax                                     ; 0524 _ 50
        push    7                                       ; 0525 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0527 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 052A _ FF. 75, 08
        call    boxfill8                                ; 052D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0532 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0535 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0538 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 053B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 053E _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0541 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0544 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0547 _ 8B. 45, 0C
        sub     eax, 3                                  ; 054A _ 83. E8, 03
        sub     esp, 4                                  ; 054D _ 83. EC, 04
        push    ebx                                     ; 0550 _ 53
        push    ecx                                     ; 0551 _ 51
        push    edx                                     ; 0552 _ 52
        push    eax                                     ; 0553 _ 50
        push    7                                       ; 0554 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0556 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0559 _ FF. 75, 08
        call    boxfill8                                ; 055C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0561 _ 83. C4, 20
        nop                                             ; 0564 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0565 _ 8B. 5D, FC
        leave                                           ; 0568 _ C9
        ret                                             ; 0569 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 056A _ 55
        mov     ebp, esp                                ; 056B _ 89. E5
        sub     esp, 8                                  ; 056D _ 83. EC, 08
        mov     eax, dword [ebp+8H]                     ; 0570 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0573 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0576 _ A1, 000000F0(d)
        add     eax, edx                                ; 057B _ 01. D0
        mov     dword [mx], eax                         ; 057D _ A3, 000000F0(d)
        mov     eax, dword [ebp+8H]                     ; 0582 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0585 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0588 _ A1, 000000F4(d)
        add     eax, edx                                ; 058D _ 01. D0
        mov     dword [my], eax                         ; 058F _ A3, 000000F4(d)
        mov     eax, dword [mx]                         ; 0594 _ A1, 000000F0(d)
        test    eax, eax                                ; 0599 _ 85. C0
        jns     ?_005                                   ; 059B _ 79, 0A
        mov     dword [mx], 0                           ; 059D _ C7. 05, 000000F0(d), 00000000
?_005:  mov     eax, dword [my]                         ; 05A7 _ A1, 000000F4(d)
        test    eax, eax                                ; 05AC _ 85. C0
        jns     ?_006                                   ; 05AE _ 79, 0A
        mov     dword [my], 0                           ; 05B0 _ C7. 05, 000000F4(d), 00000000
?_006:  mov     eax, dword [xsize]                      ; 05BA _ A1, 000000F8(d)
        lea     edx, [eax-0FH]                          ; 05BF _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 05C2 _ A1, 000000F0(d)
        cmp     edx, eax                                ; 05C7 _ 39. C2
        jg      ?_007                                   ; 05C9 _ 7F, 0D
        mov     eax, dword [xsize]                      ; 05CB _ A1, 000000F8(d)
        sub     eax, 16                                 ; 05D0 _ 83. E8, 10
        mov     dword [mx], eax                         ; 05D3 _ A3, 000000F0(d)
?_007:  mov     eax, dword [ysize]                      ; 05D8 _ A1, 000000FC(d)
        lea     edx, [eax-0FH]                          ; 05DD _ 8D. 50, F1
        mov     eax, dword [my]                         ; 05E0 _ A1, 000000F4(d)
        cmp     edx, eax                                ; 05E5 _ 39. C2
        jg      ?_008                                   ; 05E7 _ 7F, 0D
        mov     eax, dword [ysize]                      ; 05E9 _ A1, 000000FC(d)
        sub     eax, 16                                 ; 05EE _ 83. E8, 10
        mov     dword [my], eax                         ; 05F1 _ A3, 000000F4(d)
?_008:  mov     edx, dword [xsize]                      ; 05F6 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 05FC _ A1, 00000100(d)
        sub     esp, 4                                  ; 0601 _ 83. EC, 04
        push    15                                      ; 0604 _ 6A, 0F
        push    79                                      ; 0606 _ 6A, 4F
        push    0                                       ; 0608 _ 6A, 00
        push    0                                       ; 060A _ 6A, 00
        push    14                                      ; 060C _ 6A, 0E
        push    edx                                     ; 060E _ 52
        push    eax                                     ; 060F _ 50
        call    boxfill8                                ; 0610 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0615 _ 83. C4, 20
        mov     edx, dword [xsize]                      ; 0618 _ 8B. 15, 000000F8(d)
        mov     eax, dword [buf_back]                   ; 061E _ A1, 00000100(d)
        sub     esp, 8                                  ; 0623 _ 83. EC, 08
        push    ?_117                                   ; 0626 _ 68, 00000000(d)
        push    7                                       ; 062B _ 6A, 07
        push    0                                       ; 062D _ 6A, 00
        push    0                                       ; 062F _ 6A, 00
        push    edx                                     ; 0631 _ 52
        push    eax                                     ; 0632 _ 50
        call    showString                              ; 0633 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0638 _ 83. C4, 20
        nop                                             ; 063B _ 90
        leave                                           ; 063C _ C9
        ret                                             ; 063D _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 063E _ 55
        mov     ebp, esp                                ; 063F _ 89. E5
        sub     esp, 24                                 ; 0641 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0644 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0649 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 064C _ C6. 45, F3, 00
        call    io_sti                                  ; 0650 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0655 _ 83. EC, 0C
        push    mouseinfo                               ; 0658 _ 68, 00000020(d)
        call    fifo8_get                               ; 065D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0662 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0665 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0668 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 066C _ 83. EC, 08
        push    eax                                     ; 066F _ 50
        push    mdec                                    ; 0670 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0675 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 067A _ 83. C4, 10
        test    eax, eax                                ; 067D _ 85. C0
        jz      ?_009                                   ; 067F _ 74, 2B
        sub     esp, 12                                 ; 0681 _ 83. EC, 0C
        push    mdec                                    ; 0684 _ 68, 000000E0(d)
        call    computeMousePosition                    ; 0689 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068E _ 83. C4, 10
        mov     edx, dword [my]                         ; 0691 _ 8B. 15, 000000F4(d)
        mov     eax, dword [mx]                         ; 0697 _ A1, 000000F0(d)
        push    edx                                     ; 069C _ 52
        push    eax                                     ; 069D _ 50
        push    dword [ebp+0CH]                         ; 069E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06A1 _ FF. 75, 08
        call    sheet_slide                             ; 06A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A9 _ 83. C4, 10
?_009:  nop                                             ; 06AC _ 90
        leave                                           ; 06AD _ C9
        ret                                             ; 06AE _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 06AF _ 55
        mov     ebp, esp                                ; 06B0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 06B2 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 06B5 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 06BB _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 06BE _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 06C4 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 06C7 _ 66: C7. 40, 06, 00C8
        nop                                             ; 06CD _ 90
        pop     ebp                                     ; 06CE _ 5D
        ret                                             ; 06CF _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 06D0 _ 55
        mov     ebp, esp                                ; 06D1 _ 89. E5
        sub     esp, 24                                 ; 06D3 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 06D6 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 06D9 _ 88. 45, F4
        jmp     ?_011                                   ; 06DC _ EB, 35

?_010:  mov     eax, dword [ebp+1CH]                    ; 06DE _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06E1 _ 8A. 00
        movzx   eax, al                                 ; 06E3 _ 0F B6. C0
        shl     eax, 4                                  ; 06E6 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06E9 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06EF _ 0F BE. 45, F4
        sub     esp, 8                                  ; 06F3 _ 83. EC, 08
        push    edx                                     ; 06F6 _ 52
        push    eax                                     ; 06F7 _ 50
        push    dword [ebp+14H]                         ; 06F8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06FB _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 06FE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0701 _ FF. 75, 08
        call    showFont8                               ; 0704 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0709 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 070C _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0710 _ FF. 45, 1C
?_011:  mov     eax, dword [ebp+1CH]                    ; 0713 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0716 _ 8A. 00
        test    al, al                                  ; 0718 _ 84. C0
        jnz     ?_010                                   ; 071A _ 75, C2
        nop                                             ; 071C _ 90
        nop                                             ; 071D _ 90
        leave                                           ; 071E _ C9
        ret                                             ; 071F _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0720 _ 55
        mov     ebp, esp                                ; 0721 _ 89. E5
        sub     esp, 8                                  ; 0723 _ 83. EC, 08
        sub     esp, 4                                  ; 0726 _ 83. EC, 04
        push    table_rgb.1752                          ; 0729 _ 68, 00000020(d)
        push    15                                      ; 072E _ 6A, 0F
        push    0                                       ; 0730 _ 6A, 00
        call    set_palette                             ; 0732 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0737 _ 83. C4, 10
        nop                                             ; 073A _ 90
        leave                                           ; 073B _ C9
        ret                                             ; 073C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 073D _ 55
        mov     ebp, esp                                ; 073E _ 89. E5
        sub     esp, 24                                 ; 0740 _ 83. EC, 18
        call    io_load_eflags                          ; 0743 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0748 _ 89. 45, F0
        call    io_cli                                  ; 074B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0750 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0753 _ FF. 75, 08
        push    968                                     ; 0756 _ 68, 000003C8
        call    io_out8                                 ; 075B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0760 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0763 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0766 _ 89. 45, F4
        jmp     ?_013                                   ; 0769 _ EB, 5F

?_012:  mov     eax, dword [ebp+10H]                    ; 076B _ 8B. 45, 10
        mov     al, byte [eax]                          ; 076E _ 8A. 00
        shr     al, 2                                   ; 0770 _ C0. E8, 02
        movzx   eax, al                                 ; 0773 _ 0F B6. C0
        sub     esp, 8                                  ; 0776 _ 83. EC, 08
        push    eax                                     ; 0779 _ 50
        push    969                                     ; 077A _ 68, 000003C9
        call    io_out8                                 ; 077F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0784 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0787 _ 8B. 45, 10
        inc     eax                                     ; 078A _ 40
        mov     al, byte [eax]                          ; 078B _ 8A. 00
        shr     al, 2                                   ; 078D _ C0. E8, 02
        movzx   eax, al                                 ; 0790 _ 0F B6. C0
        sub     esp, 8                                  ; 0793 _ 83. EC, 08
        push    eax                                     ; 0796 _ 50
        push    969                                     ; 0797 _ 68, 000003C9
        call    io_out8                                 ; 079C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07A1 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07A4 _ 8B. 45, 10
        add     eax, 2                                  ; 07A7 _ 83. C0, 02
        mov     al, byte [eax]                          ; 07AA _ 8A. 00
        shr     al, 2                                   ; 07AC _ C0. E8, 02
        movzx   eax, al                                 ; 07AF _ 0F B6. C0
        sub     esp, 8                                  ; 07B2 _ 83. EC, 08
        push    eax                                     ; 07B5 _ 50
        push    969                                     ; 07B6 _ 68, 000003C9
        call    io_out8                                 ; 07BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07C0 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 07C3 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 07C7 _ FF. 45, F4
?_013:  mov     eax, dword [ebp-0CH]                    ; 07CA _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 07CD _ 3B. 45, 0C
        jle     ?_012                                   ; 07D0 _ 7E, 99
        sub     esp, 12                                 ; 07D2 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 07D5 _ FF. 75, F0
        call    io_store_eflags                         ; 07D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DD _ 83. C4, 10
        nop                                             ; 07E0 _ 90
        leave                                           ; 07E1 _ C9
        ret                                             ; 07E2 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07E3 _ 55
        mov     ebp, esp                                ; 07E4 _ 89. E5
        sub     esp, 20                                 ; 07E6 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07E9 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07EC _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07EF _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 07F2 _ 89. 45, F8
        jmp     ?_017                                   ; 07F5 _ EB, 30

?_014:  mov     eax, dword [ebp+14H]                    ; 07F7 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 07FA _ 89. 45, FC
        jmp     ?_016                                   ; 07FD _ EB, 1D

?_015:  mov     eax, dword [ebp-8H]                     ; 07FF _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0802 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0806 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0808 _ 8B. 45, FC
        add     eax, edx                                ; 080B _ 01. D0
        mov     edx, eax                                ; 080D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 080F _ 8B. 45, 08
        add     edx, eax                                ; 0812 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0814 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0817 _ 88. 02
        inc     dword [ebp-4H]                          ; 0819 _ FF. 45, FC
?_016:  mov     eax, dword [ebp-4H]                     ; 081C _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 081F _ 3B. 45, 1C
        jle     ?_015                                   ; 0822 _ 7E, DB
        inc     dword [ebp-8H]                          ; 0824 _ FF. 45, F8
?_017:  mov     eax, dword [ebp-8H]                     ; 0827 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 082A _ 3B. 45, 20
        jle     ?_014                                   ; 082D _ 7E, C8
        nop                                             ; 082F _ 90
        nop                                             ; 0830 _ 90
        leave                                           ; 0831 _ C9
        ret                                             ; 0832 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0833 _ 55
        mov     ebp, esp                                ; 0834 _ 89. E5
        sub     esp, 20                                 ; 0836 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0839 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 083C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 083F _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0846 _ E9, 00000162

?_018:  mov     edx, dword [ebp-4H]                     ; 084B _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 084E _ 8B. 45, 1C
        add     eax, edx                                ; 0851 _ 01. D0
        mov     al, byte [eax]                          ; 0853 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0855 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0858 _ 80. 7D, FB, 00
        jns     ?_019                                   ; 085C _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 085E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0861 _ 8B. 45, FC
        add     eax, edx                                ; 0864 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0866 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 086A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 086C _ 8B. 45, 10
        add     eax, edx                                ; 086F _ 01. D0
        mov     edx, eax                                ; 0871 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0873 _ 8B. 45, 08
        add     edx, eax                                ; 0876 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0878 _ 8A. 45, EC
        mov     byte [edx], al                          ; 087B _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 087D _ 0F BE. 45, FB
        and     eax, 40H                                ; 0881 _ 83. E0, 40
        test    eax, eax                                ; 0884 _ 85. C0
        jz      ?_020                                   ; 0886 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0888 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 088B _ 8B. 45, FC
        add     eax, edx                                ; 088E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0890 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0894 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0896 _ 8B. 45, 10
        add     eax, edx                                ; 0899 _ 01. D0
        lea     edx, [eax+1H]                           ; 089B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 089E _ 8B. 45, 08
        add     edx, eax                                ; 08A1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08A3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08A6 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08A8 _ 0F BE. 45, FB
        and     eax, 20H                                ; 08AC _ 83. E0, 20
        test    eax, eax                                ; 08AF _ 85. C0
        jz      ?_021                                   ; 08B1 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08B3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08B6 _ 8B. 45, FC
        add     eax, edx                                ; 08B9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08BB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08BF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08C1 _ 8B. 45, 10
        add     eax, edx                                ; 08C4 _ 01. D0
        lea     edx, [eax+2H]                           ; 08C6 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08C9 _ 8B. 45, 08
        add     edx, eax                                ; 08CC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08CE _ 8A. 45, EC
        mov     byte [edx], al                          ; 08D1 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 08D3 _ 0F BE. 45, FB
        and     eax, 10H                                ; 08D7 _ 83. E0, 10
        test    eax, eax                                ; 08DA _ 85. C0
        jz      ?_022                                   ; 08DC _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08DE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08E1 _ 8B. 45, FC
        add     eax, edx                                ; 08E4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08E6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08EA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08EC _ 8B. 45, 10
        add     eax, edx                                ; 08EF _ 01. D0
        lea     edx, [eax+3H]                           ; 08F1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08F4 _ 8B. 45, 08
        add     edx, eax                                ; 08F7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08F9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08FC _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 08FE _ 0F BE. 45, FB
        and     eax, 08H                                ; 0902 _ 83. E0, 08
        test    eax, eax                                ; 0905 _ 85. C0
        jz      ?_023                                   ; 0907 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0909 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 090C _ 8B. 45, FC
        add     eax, edx                                ; 090F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0911 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0915 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0917 _ 8B. 45, 10
        add     eax, edx                                ; 091A _ 01. D0
        lea     edx, [eax+4H]                           ; 091C _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 091F _ 8B. 45, 08
        add     edx, eax                                ; 0922 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0924 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0927 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0929 _ 0F BE. 45, FB
        and     eax, 04H                                ; 092D _ 83. E0, 04
        test    eax, eax                                ; 0930 _ 85. C0
        jz      ?_024                                   ; 0932 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0934 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0937 _ 8B. 45, FC
        add     eax, edx                                ; 093A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 093C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0940 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0942 _ 8B. 45, 10
        add     eax, edx                                ; 0945 _ 01. D0
        lea     edx, [eax+5H]                           ; 0947 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 094A _ 8B. 45, 08
        add     edx, eax                                ; 094D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 094F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0952 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0954 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0958 _ 83. E0, 02
        test    eax, eax                                ; 095B _ 85. C0
        jz      ?_025                                   ; 095D _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 095F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0962 _ 8B. 45, FC
        add     eax, edx                                ; 0965 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0967 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 096B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 096D _ 8B. 45, 10
        add     eax, edx                                ; 0970 _ 01. D0
        lea     edx, [eax+6H]                           ; 0972 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0975 _ 8B. 45, 08
        add     edx, eax                                ; 0978 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 097A _ 8A. 45, EC
        mov     byte [edx], al                          ; 097D _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 097F _ 0F BE. 45, FB
        and     eax, 01H                                ; 0983 _ 83. E0, 01
        test    eax, eax                                ; 0986 _ 85. C0
        jz      ?_026                                   ; 0988 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 098A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 098D _ 8B. 45, FC
        add     eax, edx                                ; 0990 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0992 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0996 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0998 _ 8B. 45, 10
        add     eax, edx                                ; 099B _ 01. D0
        lea     edx, [eax+7H]                           ; 099D _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 09A0 _ 8B. 45, 08
        add     edx, eax                                ; 09A3 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09A5 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09A8 _ 88. 02
?_026:  inc     dword [ebp-4H]                          ; 09AA _ FF. 45, FC
?_027:  cmp     dword [ebp-4H], 15                      ; 09AD _ 83. 7D, FC, 0F
        jle     ?_018                                   ; 09B1 _ 0F 8E, FFFFFE94
        nop                                             ; 09B7 _ 90
        nop                                             ; 09B8 _ 90
        leave                                           ; 09B9 _ C9
        ret                                             ; 09BA _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09BB _ 55
        mov     ebp, esp                                ; 09BC _ 89. E5
        sub     esp, 20                                 ; 09BE _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09C1 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09C4 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09C7 _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 09CE _ E9, 000000AB

?_028:  mov     dword [ebp-4H], 0                       ; 09D3 _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 09DA _ E9, 00000092

?_029:  mov     eax, dword [ebp-8H]                     ; 09DF _ 8B. 45, F8
        shl     eax, 4                                  ; 09E2 _ C1. E0, 04
        mov     edx, eax                                ; 09E5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09E7 _ 8B. 45, FC
        add     eax, edx                                ; 09EA _ 01. D0
        add     eax, cursor.1797                        ; 09EC _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 09F1 _ 8A. 00
        cmp     al, 42                                  ; 09F3 _ 3C, 2A
        jnz     ?_030                                   ; 09F5 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 09F7 _ 8B. 45, F8
        shl     eax, 4                                  ; 09FA _ C1. E0, 04
        mov     edx, eax                                ; 09FD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09FF _ 8B. 45, FC
        add     eax, edx                                ; 0A02 _ 01. D0
        mov     edx, eax                                ; 0A04 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A06 _ 8B. 45, 08
        add     eax, edx                                ; 0A09 _ 01. D0
        mov     byte [eax], 0                           ; 0A0B _ C6. 00, 00
?_030:  mov     eax, dword [ebp-8H]                     ; 0A0E _ 8B. 45, F8
        shl     eax, 4                                  ; 0A11 _ C1. E0, 04
        mov     edx, eax                                ; 0A14 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A16 _ 8B. 45, FC
        add     eax, edx                                ; 0A19 _ 01. D0
        add     eax, cursor.1797                        ; 0A1B _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A20 _ 8A. 00
        cmp     al, 79                                  ; 0A22 _ 3C, 4F
        jnz     ?_031                                   ; 0A24 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A26 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A29 _ C1. E0, 04
        mov     edx, eax                                ; 0A2C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A2E _ 8B. 45, FC
        add     eax, edx                                ; 0A31 _ 01. D0
        mov     edx, eax                                ; 0A33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A35 _ 8B. 45, 08
        add     eax, edx                                ; 0A38 _ 01. D0
        mov     byte [eax], 7                           ; 0A3A _ C6. 00, 07
?_031:  mov     eax, dword [ebp-8H]                     ; 0A3D _ 8B. 45, F8
        shl     eax, 4                                  ; 0A40 _ C1. E0, 04
        mov     edx, eax                                ; 0A43 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A45 _ 8B. 45, FC
        add     eax, edx                                ; 0A48 _ 01. D0
        add     eax, cursor.1797                        ; 0A4A _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A4F _ 8A. 00
        cmp     al, 46                                  ; 0A51 _ 3C, 2E
        jnz     ?_032                                   ; 0A53 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A55 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A58 _ C1. E0, 04
        mov     edx, eax                                ; 0A5B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A5D _ 8B. 45, FC
        add     eax, edx                                ; 0A60 _ 01. D0
        mov     edx, eax                                ; 0A62 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A64 _ 8B. 45, 08
        add     edx, eax                                ; 0A67 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A69 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A6C _ 88. 02
?_032:  inc     dword [ebp-4H]                          ; 0A6E _ FF. 45, FC
?_033:  cmp     dword [ebp-4H], 15                      ; 0A71 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0A75 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0A7B _ FF. 45, F8
?_034:  cmp     dword [ebp-8H], 15                      ; 0A7E _ 83. 7D, F8, 0F
        jle     ?_028                                   ; 0A82 _ 0F 8E, FFFFFF4B
        nop                                             ; 0A88 _ 90
        nop                                             ; 0A89 _ 90
        leave                                           ; 0A8A _ C9
        ret                                             ; 0A8B _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A8C _ 55
        mov     ebp, esp                                ; 0A8D _ 89. E5
        push    ebx                                     ; 0A8F _ 53
        sub     esp, 16                                 ; 0A90 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0A93 _ C7. 45, F4, 00000000
        jmp     ?_038                                   ; 0A9A _ EB, 4D

?_035:  mov     dword [ebp-8H], 0                       ; 0A9C _ C7. 45, F8, 00000000
        jmp     ?_037                                   ; 0AA3 _ EB, 39

?_036:  mov     eax, dword [ebp-0CH]                    ; 0AA5 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0AA8 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0AAC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0AAE _ 8B. 45, F8
        add     eax, edx                                ; 0AB1 _ 01. D0
        mov     edx, eax                                ; 0AB3 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0AB5 _ 8B. 45, 20
        add     eax, edx                                ; 0AB8 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0ABA _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0ABD _ 8B. 55, F4
        add     edx, ecx                                ; 0AC0 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0AC2 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0AC6 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0AC9 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0ACC _ 01. D9
        add     edx, ecx                                ; 0ACE _ 01. CA
        mov     ecx, edx                                ; 0AD0 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0AD2 _ 8B. 55, 08
        add     edx, ecx                                ; 0AD5 _ 01. CA
        mov     al, byte [eax]                          ; 0AD7 _ 8A. 00
        mov     byte [edx], al                          ; 0AD9 _ 88. 02
        inc     dword [ebp-8H]                          ; 0ADB _ FF. 45, F8
?_037:  mov     eax, dword [ebp-8H]                     ; 0ADE _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0AE1 _ 3B. 45, 10
        jl      ?_036                                   ; 0AE4 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0AE6 _ FF. 45, F4
?_038:  mov     eax, dword [ebp-0CH]                    ; 0AE9 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0AEC _ 3B. 45, 14
        jl      ?_035                                   ; 0AEF _ 7C, AB
        nop                                             ; 0AF1 _ 90
        nop                                             ; 0AF2 _ 90
        add     esp, 16                                 ; 0AF3 _ 83. C4, 10
        pop     ebx                                     ; 0AF6 _ 5B
        pop     ebp                                     ; 0AF7 _ 5D
        ret                                             ; 0AF8 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0AF9 _ 55
        mov     ebp, esp                                ; 0AFA _ 89. E5
        sub     esp, 24                                 ; 0AFC _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AFF _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0B04 _ 89. 45, F4
        mov     eax, dword [?_126]                      ; 0B07 _ A1, 00000004(d)
        cwde                                            ; 0B0C _ 98
        mov     dword [ebp-10H], eax                    ; 0B0D _ 89. 45, F0
        mov     ax, word [?_127]                        ; 0B10 _ 66: A1, 00000006(d)
        cwde                                            ; 0B16 _ 98
        mov     dword [ebp-14H], eax                    ; 0B17 _ 89. 45, EC
        sub     esp, 8                                  ; 0B1A _ 83. EC, 08
        push    32                                      ; 0B1D _ 6A, 20
        push    32                                      ; 0B1F _ 6A, 20
        call    io_out8                                 ; 0B21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B26 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B29 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B2D _ 83. EC, 0C
        push    96                                      ; 0B30 _ 6A, 60
        call    io_in8                                  ; 0B32 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B37 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B3A _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B3D _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B41 _ 83. EC, 08
        push    eax                                     ; 0B44 _ 50
        push    keyinfo                                 ; 0B45 _ 68, 00000008(d)
        call    fifo8_put                               ; 0B4A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4F _ 83. C4, 10
        nop                                             ; 0B52 _ 90
        leave                                           ; 0B53 _ C9
        ret                                             ; 0B54 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B55 _ 55
        mov     ebp, esp                                ; 0B56 _ 89. E5
        sub     esp, 4                                  ; 0B58 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B5B _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B5E _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B61 _ 80. 7D, FC, 09
        jle     ?_039                                   ; 0B65 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0B67 _ 8A. 45, FC
        add     eax, 55                                 ; 0B6A _ 83. C0, 37
        jmp     ?_040                                   ; 0B6D _ EB, 06

?_039:  mov     al, byte [ebp-4H]                       ; 0B6F _ 8A. 45, FC
        add     eax, 48                                 ; 0B72 _ 83. C0, 30
?_040:  leave                                           ; 0B75 _ C9
        ret                                             ; 0B76 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B77 _ 55
        mov     ebp, esp                                ; 0B78 _ 89. E5
        sub     esp, 20                                 ; 0B7A _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B7D _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B80 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B83 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0B8A _ 8A. 45, EC
        and     eax, 0FH                                ; 0B8D _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B90 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B93 _ 0F BE. 45, FB
        push    eax                                     ; 0B97 _ 50
        call    charToHexVal                            ; 0B98 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B9D _ 83. C4, 04
        mov     byte [?_125], al                        ; 0BA0 _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0BA5 _ 8A. 45, EC
        shr     al, 4                                   ; 0BA8 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0BAB _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0BAE _ 8A. 45, EC
        movsx   eax, al                                 ; 0BB1 _ 0F BE. C0
        push    eax                                     ; 0BB4 _ 50
        call    charToHexVal                            ; 0BB5 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BBA _ 83. C4, 04
        mov     byte [?_124], al                        ; 0BBD _ A2, 00000006(d)
        mov     eax, keyval                             ; 0BC2 _ B8, 00000004(d)
        leave                                           ; 0BC7 _ C9
        ret                                             ; 0BC8 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BC9 _ 55
        mov     ebp, esp                                ; 0BCA _ 89. E5
        sub     esp, 16                                 ; 0BCC _ 83. EC, 10
        mov     byte [str.1842], 48                     ; 0BCF _ C6. 05, 00000220(d), 30
        mov     byte [?_128], 88                        ; 0BD6 _ C6. 05, 00000221(d), 58
        mov     byte [?_129], 0                         ; 0BDD _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-4H], 2                       ; 0BE4 _ C7. 45, FC, 00000002
        jmp     ?_042                                   ; 0BEB _ EB, 0E

?_041:  mov     eax, dword [ebp-4H]                     ; 0BED _ 8B. 45, FC
        add     eax, str.1842                           ; 0BF0 _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0BF5 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0BF8 _ FF. 45, FC
?_042:  cmp     dword [ebp-4H], 9                       ; 0BFB _ 83. 7D, FC, 09
        jle     ?_041                                   ; 0BFF _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 0C01 _ C7. 45, F8, 00000009
        jmp     ?_046                                   ; 0C08 _ EB, 41

?_043:  mov     eax, dword [ebp+8H]                     ; 0C0A _ 8B. 45, 08
        and     eax, 0FH                                ; 0C0D _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C10 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C13 _ 8B. 45, 08
        shr     eax, 4                                  ; 0C16 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C19 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C1C _ 83. 7D, F4, 09
        jle     ?_044                                   ; 0C20 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 0C22 _ 8B. 45, F4
        add     eax, 55                                 ; 0C25 _ 83. C0, 37
        mov     dl, al                                  ; 0C28 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C2A _ 8B. 45, F8
        add     eax, str.1842                           ; 0C2D _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C32 _ 88. 10
        jmp     ?_045                                   ; 0C34 _ EB, 12

?_044:  mov     eax, dword [ebp-0CH]                    ; 0C36 _ 8B. 45, F4
        add     eax, 48                                 ; 0C39 _ 83. C0, 30
        mov     dl, al                                  ; 0C3C _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C3E _ 8B. 45, F8
        add     eax, str.1842                           ; 0C41 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C46 _ 88. 10
?_045:  dec     dword [ebp-8H]                          ; 0C48 _ FF. 4D, F8
?_046:  cmp     dword [ebp-8H], 1                       ; 0C4B _ 83. 7D, F8, 01
        jle     ?_047                                   ; 0C4F _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0C51 _ 83. 7D, 08, 00
        jnz     ?_043                                   ; 0C55 _ 75, B3
?_047:  mov     eax, str.1842                           ; 0C57 _ B8, 00000220(d)
        leave                                           ; 0C5C _ C9
        ret                                             ; 0C5D _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C5E _ 55
        mov     ebp, esp                                ; 0C5F _ 89. E5
        sub     esp, 8                                  ; 0C61 _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0C64 _ 83. EC, 0C
        push    100                                     ; 0C67 _ 6A, 64
        call    io_in8                                  ; 0C69 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C6E _ 83. C4, 10
        movzx   eax, al                                 ; 0C71 _ 0F B6. C0
        and     eax, 02H                                ; 0C74 _ 83. E0, 02
        test    eax, eax                                ; 0C77 _ 85. C0
        jz      ?_049                                   ; 0C79 _ 74, 02
        jmp     ?_048                                   ; 0C7B _ EB, E7

?_049:  nop                                             ; 0C7D _ 90
        nop                                             ; 0C7E _ 90
        leave                                           ; 0C7F _ C9
        ret                                             ; 0C80 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C81 _ 55
        mov     ebp, esp                                ; 0C82 _ 89. E5
        sub     esp, 8                                  ; 0C84 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C87 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C8C _ 83. EC, 08
        push    96                                      ; 0C8F _ 6A, 60
        push    100                                     ; 0C91 _ 6A, 64
        call    io_out8                                 ; 0C93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C98 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C9B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CA0 _ 83. EC, 08
        push    71                                      ; 0CA3 _ 6A, 47
        push    96                                      ; 0CA5 _ 6A, 60
        call    io_out8                                 ; 0CA7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CAC _ 83. C4, 10
        nop                                             ; 0CAF _ 90
        leave                                           ; 0CB0 _ C9
        ret                                             ; 0CB1 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CB2 _ 55
        mov     ebp, esp                                ; 0CB3 _ 89. E5
        sub     esp, 8                                  ; 0CB5 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CB8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CBD _ 83. EC, 08
        push    212                                     ; 0CC0 _ 68, 000000D4
        push    100                                     ; 0CC5 _ 6A, 64
        call    io_out8                                 ; 0CC7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CCC _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CCF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CD4 _ 83. EC, 08
        push    244                                     ; 0CD7 _ 68, 000000F4
        push    96                                      ; 0CDC _ 6A, 60
        call    io_out8                                 ; 0CDE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CE3 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CE6 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CE9 _ C6. 40, 03, 00
        nop                                             ; 0CED _ 90
        leave                                           ; 0CEE _ C9
        ret                                             ; 0CEF _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CF0 _ 55
        mov     ebp, esp                                ; 0CF1 _ 89. E5
        sub     esp, 24                                 ; 0CF3 _ 83. EC, 18
        sub     esp, 8                                  ; 0CF6 _ 83. EC, 08
        push    32                                      ; 0CF9 _ 6A, 20
        push    160                                     ; 0CFB _ 68, 000000A0
        call    io_out8                                 ; 0D00 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D05 _ 83. C4, 10
        sub     esp, 8                                  ; 0D08 _ 83. EC, 08
        push    32                                      ; 0D0B _ 6A, 20
        push    32                                      ; 0D0D _ 6A, 20
        call    io_out8                                 ; 0D0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D14 _ 83. C4, 10
        sub     esp, 12                                 ; 0D17 _ 83. EC, 0C
        push    96                                      ; 0D1A _ 6A, 60
        call    io_in8                                  ; 0D1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D21 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D24 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D27 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D2B _ 83. EC, 08
        push    eax                                     ; 0D2E _ 50
        push    mouseinfo                               ; 0D2F _ 68, 00000020(d)
        call    fifo8_put                               ; 0D34 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D39 _ 83. C4, 10
        nop                                             ; 0D3C _ 90
        leave                                           ; 0D3D _ C9
        ret                                             ; 0D3E _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D3F _ 55
        mov     ebp, esp                                ; 0D40 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D42 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D45 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D48 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D4B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D4E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D51 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D53 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D56 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D59 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D5C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D5F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D66 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D69 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D70 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D73 _ C7. 40, 08, 00000000
        nop                                             ; 0D7A _ 90
        pop     ebp                                     ; 0D7B _ 5D
        ret                                             ; 0D7C _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D7D _ 55
        mov     ebp, esp                                ; 0D7E _ 89. E5
        sub     esp, 4                                  ; 0D80 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D83 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D86 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D89 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D8C _ 8B. 40, 10
        test    eax, eax                                ; 0D8F _ 85. C0
        jnz     ?_050                                   ; 0D91 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D93 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D96 _ 8B. 40, 14
        or      eax, 01H                                ; 0D99 _ 83. C8, 01
        mov     edx, eax                                ; 0D9C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D9E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0DA1 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0DA4 _ B8, FFFFFFFF
        jmp     ?_052                                   ; 0DA9 _ EB, 4F

?_050:  mov     eax, dword [ebp+8H]                     ; 0DAB _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DAE _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DB0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DB3 _ 8B. 40, 04
        add     edx, eax                                ; 0DB6 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0DB8 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0DBB _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0DBD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DC0 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0DC3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DC6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DC9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DCC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DCF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DD2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DD5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DD8 _ 39. C2
        jnz     ?_051                                   ; 0DDA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DDC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DDF _ C7. 40, 04, 00000000
?_051:  mov     eax, dword [ebp+8H]                     ; 0DE6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DE9 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DEC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DEF _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DF2 _ 89. 50, 10
        mov     eax, 0                                  ; 0DF5 _ B8, 00000000
?_052:  leave                                           ; 0DFA _ C9
        ret                                             ; 0DFB _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0DFC _ 55
        mov     ebp, esp                                ; 0DFD _ 89. E5
        sub     esp, 16                                 ; 0DFF _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0E02 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E05 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E08 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E0B _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E0E _ 39. C2
        jnz     ?_053                                   ; 0E10 _ 75, 07
        mov     eax, 4294967295                         ; 0E12 _ B8, FFFFFFFF
        jmp     ?_055                                   ; 0E17 _ EB, 50

?_053:  mov     eax, dword [ebp+8H]                     ; 0E19 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E1C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E1E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E21 _ 8B. 40, 08
        add     eax, edx                                ; 0E24 _ 01. D0
        mov     al, byte [eax]                          ; 0E26 _ 8A. 00
        movzx   eax, al                                 ; 0E28 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E2B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E2E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E31 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E34 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E37 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E3A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E3D _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E40 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E43 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E46 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E49 _ 39. C2
        jnz     ?_054                                   ; 0E4B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0E4D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E50 _ C7. 40, 08, 00000000
?_054:  mov     eax, dword [ebp+8H]                     ; 0E57 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E5A _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E5D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E60 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E63 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E66 _ 8B. 45, FC
?_055:  leave                                           ; 0E69 _ C9
        ret                                             ; 0E6A _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E6B _ 55
        mov     ebp, esp                                ; 0E6C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E6E _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E71 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E74 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E77 _ 8B. 40, 10
        sub     edx, eax                                ; 0E7A _ 29. C2
        mov     eax, edx                                ; 0E7C _ 89. D0
        pop     ebp                                     ; 0E7E _ 5D
        ret                                             ; 0E7F _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E80 _ 55
        mov     ebp, esp                                ; 0E81 _ 89. E5
        sub     esp, 4                                  ; 0E83 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E86 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E89 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E8C _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E8F _ 8A. 40, 03
        test    al, al                                  ; 0E92 _ 84. C0
        jnz     ?_057                                   ; 0E94 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E96 _ 80. 7D, FC, FA
        jnz     ?_056                                   ; 0E9A _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E9C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E9F _ C6. 40, 03, 01
?_056:  mov     eax, 0                                  ; 0EA3 _ B8, 00000000
        jmp     ?_064                                   ; 0EA8 _ E9, 00000104

?_057:  mov     eax, dword [ebp+8H]                     ; 0EAD _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EB0 _ 8A. 40, 03
        cmp     al, 1                                   ; 0EB3 _ 3C, 01
        jnz     ?_059                                   ; 0EB5 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0EB7 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EBB _ 25, 000000C8
        cmp     eax, 8                                  ; 0EC0 _ 83. F8, 08
        jnz     ?_058                                   ; 0EC3 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0EC5 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EC8 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0ECB _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0ECD _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0ED0 _ C6. 40, 03, 02
?_058:  mov     eax, 0                                  ; 0ED4 _ B8, 00000000
        jmp     ?_064                                   ; 0ED9 _ E9, 000000D3

?_059:  mov     eax, dword [ebp+8H]                     ; 0EDE _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EE1 _ 8A. 40, 03
        cmp     al, 2                                   ; 0EE4 _ 3C, 02
        jnz     ?_060                                   ; 0EE6 _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0EE8 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EEB _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0EEE _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EF1 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EF4 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0EF8 _ B8, 00000000
        jmp     ?_064                                   ; 0EFD _ E9, 000000AF

?_060:  mov     eax, dword [ebp+8H]                     ; 0F02 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F05 _ 8A. 40, 03
        cmp     al, 3                                   ; 0F08 _ 3C, 03
        jne     ?_063                                   ; 0F0A _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0F10 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F13 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F16 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F19 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F1C _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F20 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F23 _ 8A. 00
        movzx   eax, al                                 ; 0F25 _ 0F B6. C0
        and     eax, 07H                                ; 0F28 _ 83. E0, 07
        mov     edx, eax                                ; 0F2B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F2D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F30 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F33 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0F36 _ 8A. 40, 01
        movzx   edx, al                                 ; 0F39 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F3C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F3F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F42 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0F45 _ 8A. 40, 02
        movzx   edx, al                                 ; 0F48 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F4B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F4E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F51 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F54 _ 8A. 00
        movzx   eax, al                                 ; 0F56 _ 0F B6. C0
        and     eax, 10H                                ; 0F59 _ 83. E0, 10
        test    eax, eax                                ; 0F5C _ 85. C0
        jz      ?_061                                   ; 0F5E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F60 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F63 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F66 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F6B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F6D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F70 _ 89. 50, 04
?_061:  mov     eax, dword [ebp+8H]                     ; 0F73 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F76 _ 8A. 00
        movzx   eax, al                                 ; 0F78 _ 0F B6. C0
        and     eax, 20H                                ; 0F7B _ 83. E0, 20
        test    eax, eax                                ; 0F7E _ 85. C0
        jz      ?_062                                   ; 0F80 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F82 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F85 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F88 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F8D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F8F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F92 _ 89. 50, 08
?_062:  mov     eax, dword [ebp+8H]                     ; 0F95 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F98 _ 8B. 40, 08
        neg     eax                                     ; 0F9B _ F7. D8
        mov     edx, eax                                ; 0F9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F9F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FA2 _ 89. 50, 08
        mov     eax, 1                                  ; 0FA5 _ B8, 00000001
        jmp     ?_064                                   ; 0FAA _ EB, 05

?_063:  mov     eax, 4294967295                         ; 0FAC _ B8, FFFFFFFF
?_064:  leave                                           ; 0FB1 _ C9
        ret                                             ; 0FB2 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FB3 _ 55
        mov     ebp, esp                                ; 0FB4 _ 89. E5
        sub     esp, 56                                 ; 0FB6 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0FB9 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0FC0 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0FC7 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0FCE _ C7. 45, E8, 00000050
        push    100                                     ; 0FD5 _ 6A, 64
        push    dword [ebp+14H]                         ; 0FD7 _ FF. 75, 14
        push    0                                       ; 0FDA _ 6A, 00
        push    0                                       ; 0FDC _ 6A, 00
        push    14                                      ; 0FDE _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FE0 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FE3 _ FF. 75, 0C
        call    boxfill8                                ; 0FE6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FEB _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FEE _ 8B. 45, 18
        movsx   eax, al                                 ; 0FF1 _ 0F BE. C0
        sub     esp, 8                                  ; 0FF4 _ 83. EC, 08
        push    ?_118                                   ; 0FF7 _ 68, 0000000B(d)
        push    eax                                     ; 0FFC _ 50
        push    dword [ebp-10H]                         ; 0FFD _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1000 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1003 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1006 _ FF. 75, 0C
        call    showString                              ; 1009 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 100E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1011 _ 8B. 45, 10
        sub     esp, 12                                 ; 1014 _ 83. EC, 0C
        push    eax                                     ; 1017 _ 50
        call    intToHexStr                             ; 1018 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 101D _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1020 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 1023 _ 8B. 45, 18
        movsx   eax, al                                 ; 1026 _ 0F BE. C0
        sub     esp, 8                                  ; 1029 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 102C _ FF. 75, E4
        push    eax                                     ; 102F _ 50
        push    dword [ebp-10H]                         ; 1030 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1033 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1036 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1039 _ FF. 75, 0C
        call    showString                              ; 103C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1041 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1044 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1048 _ 8B. 45, 18
        movsx   eax, al                                 ; 104B _ 0F BE. C0
        sub     esp, 8                                  ; 104E _ 83. EC, 08
        push    ?_119                                   ; 1051 _ 68, 00000015(d)
        push    eax                                     ; 1056 _ 50
        push    dword [ebp-10H]                         ; 1057 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 105A _ FF. 75, F4
        push    dword [ebp+14H]                         ; 105D _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1060 _ FF. 75, 0C
        call    showString                              ; 1063 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1068 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 106B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 106E _ 8B. 00
        sub     esp, 12                                 ; 1070 _ 83. EC, 0C
        push    eax                                     ; 1073 _ 50
        call    intToHexStr                             ; 1074 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1079 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 107C _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 107F _ 8B. 45, 18
        movsx   eax, al                                 ; 1082 _ 0F BE. C0
        sub     esp, 8                                  ; 1085 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1088 _ FF. 75, E0
        push    eax                                     ; 108B _ 50
        push    dword [ebp-10H]                         ; 108C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 108F _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1092 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1095 _ FF. 75, 0C
        call    showString                              ; 1098 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 109D _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10A0 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 10A4 _ 8B. 45, 18
        movsx   eax, al                                 ; 10A7 _ 0F BE. C0
        sub     esp, 8                                  ; 10AA _ 83. EC, 08
        push    ?_120                                   ; 10AD _ 68, 00000021(d)
        push    eax                                     ; 10B2 _ 50
        push    dword [ebp-10H]                         ; 10B3 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10B6 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 10B9 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10BC _ FF. 75, 0C
        call    showString                              ; 10BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10C4 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10C7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10CA _ 8B. 40, 04
        sub     esp, 12                                 ; 10CD _ 83. EC, 0C
        push    eax                                     ; 10D0 _ 50
        call    intToHexStr                             ; 10D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10D6 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 10D9 _ 89. 45, DC
        mov     eax, dword [ebp+18H]                    ; 10DC _ 8B. 45, 18
        movsx   eax, al                                 ; 10DF _ 0F BE. C0
        sub     esp, 8                                  ; 10E2 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 10E5 _ FF. 75, DC
        push    eax                                     ; 10E8 _ 50
        push    dword [ebp-10H]                         ; 10E9 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10EC _ FF. 75, EC
        push    dword [ebp+14H]                         ; 10EF _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10F2 _ FF. 75, 0C
        call    showString                              ; 10F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10FA _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10FD _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1101 _ 8B. 45, 18
        movsx   eax, al                                 ; 1104 _ 0F BE. C0
        sub     esp, 8                                  ; 1107 _ 83. EC, 08
        push    ?_121                                   ; 110A _ 68, 0000002D(d)
        push    eax                                     ; 110F _ 50
        push    dword [ebp-10H]                         ; 1110 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1113 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1116 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1119 _ FF. 75, 0C
        call    showString                              ; 111C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1121 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1124 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1127 _ 8B. 40, 08
        sub     esp, 12                                 ; 112A _ 83. EC, 0C
        push    eax                                     ; 112D _ 50
        call    intToHexStr                             ; 112E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1133 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1136 _ 89. 45, D8
        mov     eax, dword [ebp+18H]                    ; 1139 _ 8B. 45, 18
        movsx   eax, al                                 ; 113C _ 0F BE. C0
        sub     esp, 8                                  ; 113F _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1142 _ FF. 75, D8
        push    eax                                     ; 1145 _ 50
        push    dword [ebp-10H]                         ; 1146 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1149 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 114C _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 114F _ FF. 75, 0C
        call    showString                              ; 1152 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1157 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 115A _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 115E _ 8B. 45, 18
        movsx   eax, al                                 ; 1161 _ 0F BE. C0
        sub     esp, 8                                  ; 1164 _ 83. EC, 08
        push    ?_122                                   ; 1167 _ 68, 00000039(d)
        push    eax                                     ; 116C _ 50
        push    dword [ebp-10H]                         ; 116D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1170 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1173 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1176 _ FF. 75, 0C
        call    showString                              ; 1179 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 117E _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1181 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1184 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1187 _ 83. EC, 0C
        push    eax                                     ; 118A _ 50
        call    intToHexStr                             ; 118B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1190 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 1193 _ 89. 45, D4
        mov     eax, dword [ebp+18H]                    ; 1196 _ 8B. 45, 18
        movsx   eax, al                                 ; 1199 _ 0F BE. C0
        sub     esp, 8                                  ; 119C _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 119F _ FF. 75, D4
        push    eax                                     ; 11A2 _ 50
        push    dword [ebp-10H]                         ; 11A3 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11A6 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 11A9 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11AC _ FF. 75, 0C
        call    showString                              ; 11AF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11B4 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11B7 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 11BB _ 8B. 45, 18
        movsx   eax, al                                 ; 11BE _ 0F BE. C0
        sub     esp, 8                                  ; 11C1 _ 83. EC, 08
        push    ?_123                                   ; 11C4 _ 68, 00000046(d)
        push    eax                                     ; 11C9 _ 50
        push    dword [ebp-10H]                         ; 11CA _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11CD _ FF. 75, F4
        push    dword [ebp+14H]                         ; 11D0 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11D3 _ FF. 75, 0C
        call    showString                              ; 11D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11DB _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11DE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11E1 _ 8B. 40, 10
        sub     esp, 12                                 ; 11E4 _ 83. EC, 0C
        push    eax                                     ; 11E7 _ 50
        call    intToHexStr                             ; 11E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11ED _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 11F0 _ 89. 45, D0
        mov     eax, dword [ebp+18H]                    ; 11F3 _ 8B. 45, 18
        movsx   eax, al                                 ; 11F6 _ 0F BE. C0
        sub     esp, 8                                  ; 11F9 _ 83. EC, 08
        push    dword [ebp-30H]                         ; 11FC _ FF. 75, D0
        push    eax                                     ; 11FF _ 50
        push    dword [ebp-10H]                         ; 1200 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1203 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1206 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1209 _ FF. 75, 0C
        call    showString                              ; 120C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1211 _ 83. C4, 20
        nop                                             ; 1214 _ 90
        leave                                           ; 1215 _ C9
        ret                                             ; 1216 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 1217 _ 55
        mov     ebp, esp                                ; 1218 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 121A _ 8B. 45, 08
        mov     dword [eax], 0                          ; 121D _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1223 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1226 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 122D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1230 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1237 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 123A _ C7. 40, 0C, 00000000
        nop                                             ; 1241 _ 90
        pop     ebp                                     ; 1242 _ 5D
        ret                                             ; 1243 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1244 _ 55
        mov     ebp, esp                                ; 1245 _ 89. E5
        sub     esp, 16                                 ; 1247 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 124A _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1251 _ C7. 45, FC, 00000000
        jmp     ?_066                                   ; 1258 _ EB, 13

?_065:  mov     eax, dword [ebp+8H]                     ; 125A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 125D _ 8B. 55, FC
        add     edx, 2                                  ; 1260 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1263 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1267 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 126A _ FF. 45, FC
?_066:  mov     eax, dword [ebp+8H]                     ; 126D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1270 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1272 _ 39. 45, FC
        jc      ?_065                                   ; 1275 _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1277 _ 8B. 45, F8
        leave                                           ; 127A _ C9
        ret                                             ; 127B _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 127C _ 55
        mov     ebp, esp                                ; 127D _ 89. E5
        sub     esp, 16                                 ; 127F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1282 _ C7. 45, FC, 00000000
        jmp     ?_070                                   ; 1289 _ E9, 00000084

?_067:  mov     eax, dword [ebp+8H]                     ; 128E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1291 _ 8B. 55, FC
        add     edx, 2                                  ; 1294 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1297 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 129B _ 39. 45, 0C
        ja      ?_069                                   ; 129E _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 12A0 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12A3 _ 8B. 55, FC
        add     edx, 2                                  ; 12A6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12A9 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 12AC _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 12AF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12B2 _ 8B. 55, FC
        add     edx, 2                                  ; 12B5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 12B8 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 12BB _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 12BE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 12C1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12C4 _ 8B. 55, FC
        add     edx, 2                                  ; 12C7 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 12CA _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 12CD _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12D0 _ 8B. 55, FC
        add     edx, 2                                  ; 12D3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12D6 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 12DA _ 2B. 45, 0C
        mov     edx, eax                                ; 12DD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12DF _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 12E2 _ 8B. 4D, FC
        add     ecx, 2                                  ; 12E5 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12E8 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12EC _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12EF _ 8B. 55, FC
        add     edx, 2                                  ; 12F2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12F5 _ 8B. 44 D0, 04
        test    eax, eax                                ; 12F9 _ 85. C0
        jnz     ?_068                                   ; 12FB _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 12FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1300 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1302 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1305 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1308 _ 89. 10
?_068:  mov     eax, dword [ebp-8H]                     ; 130A _ 8B. 45, F8
        jmp     ?_071                                   ; 130D _ EB, 16

?_069:  inc     dword [ebp-4H]                          ; 130F _ FF. 45, FC
?_070:  mov     eax, dword [ebp+8H]                     ; 1312 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1315 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1317 _ 39. 45, FC
        jc      ?_067                                   ; 131A _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 1320 _ B8, 00000000
?_071:  leave                                           ; 1325 _ C9
        ret                                             ; 1326 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1327 _ 55
        mov     ebp, esp                                ; 1328 _ 89. E5
        push    ebx                                     ; 132A _ 53
        sub     esp, 16                                 ; 132B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 132E _ C7. 45, F8, 00000000
        jmp     ?_073                                   ; 1335 _ EB, 14

?_072:  mov     eax, dword [ebp+8H]                     ; 1337 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 133A _ 8B. 55, F8
        add     edx, 2                                  ; 133D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1340 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1343 _ 39. 45, 0C
        jc      ?_074                                   ; 1346 _ 72, 0F
        inc     dword [ebp-8H]                          ; 1348 _ FF. 45, F8
?_073:  mov     eax, dword [ebp+8H]                     ; 134B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 134E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1350 _ 39. 45, F8
        jl      ?_072                                   ; 1353 _ 7C, E2
        jmp     ?_075                                   ; 1355 _ EB, 01

?_074:  nop                                             ; 1357 _ 90
?_075:  cmp     dword [ebp-8H], 0                       ; 1358 _ 83. 7D, F8, 00
        jle     ?_077                                   ; 135C _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 1362 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1365 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1368 _ 8B. 45, 08
        add     edx, 2                                  ; 136B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 136E _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1371 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1374 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1377 _ 8B. 45, 08
        add     ecx, 2                                  ; 137A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 137D _ 8B. 44 C8, 04
        add     eax, edx                                ; 1381 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1383 _ 39. 45, 0C
        jne     ?_077                                   ; 1386 _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 138C _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 138F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1392 _ 8B. 45, 08
        add     edx, 2                                  ; 1395 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1398 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 139C _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 139F _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 13A2 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13A5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13A8 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13AB _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13AE _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13B2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13B5 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 13B7 _ 39. 45, F8
        jge     ?_076                                   ; 13BA _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 13BC _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13BF _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13C2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13C5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 13C8 _ 8B. 55, F8
        add     edx, 2                                  ; 13CB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13CE _ 8B. 04 D0
        cmp     ecx, eax                                ; 13D1 _ 39. C1
        jnz     ?_076                                   ; 13D3 _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 13D5 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 13D8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13DB _ 8B. 45, 08
        add     edx, 2                                  ; 13DE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13E1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13E5 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 13E8 _ 8B. 4D, F8
        add     ecx, 2                                  ; 13EB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13EE _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 13F2 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 13F5 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 13F8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13FB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13FE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1401 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1405 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1408 _ 8B. 00
        lea     edx, [eax-1H]                           ; 140A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 140D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1410 _ 89. 10
?_076:  mov     eax, 0                                  ; 1412 _ B8, 00000000
        jmp     ?_083                                   ; 1417 _ E9, 0000011B

?_077:  mov     eax, dword [ebp+8H]                     ; 141C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 141F _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1421 _ 39. 45, F8
        jge     ?_078                                   ; 1424 _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 1426 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1429 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 142C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 142F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1432 _ 8B. 55, F8
        add     edx, 2                                  ; 1435 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1438 _ 8B. 04 D0
        cmp     ecx, eax                                ; 143B _ 39. C1
        jnz     ?_078                                   ; 143D _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 143F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1442 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1445 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1448 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 144B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 144E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1451 _ 8B. 55, F8
        add     edx, 2                                  ; 1454 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1457 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 145B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 145E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1461 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1464 _ 8B. 55, F8
        add     edx, 2                                  ; 1467 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 146A _ 89. 4C D0, 04
        mov     eax, 0                                  ; 146E _ B8, 00000000
        jmp     ?_083                                   ; 1473 _ E9, 000000BF

?_078:  mov     eax, dword [ebp+8H]                     ; 1478 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 147B _ 8B. 00
        cmp     eax, 4095                               ; 147D _ 3D, 00000FFF
        jg      ?_082                                   ; 1482 _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 1488 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 148B _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 148D _ 89. 45, F4
        jmp     ?_080                                   ; 1490 _ EB, 27

?_079:  mov     eax, dword [ebp-0CH]                    ; 1492 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1495 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1498 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 149B _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 149E _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 14A1 _ 8B. 45, 08
        add     edx, 2                                  ; 14A4 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 14A7 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 14AA _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 14AC _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 14AF _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 14B2 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 14B6 _ FF. 4D, F4
?_080:  mov     eax, dword [ebp-0CH]                    ; 14B9 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 14BC _ 3B. 45, F8
        jg      ?_079                                   ; 14BF _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 14C1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14C4 _ 8B. 00
        lea     edx, [eax+1H]                           ; 14C6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14C9 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 14CC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 14CE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 14D1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14D4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14D7 _ 8B. 00
        cmp     edx, eax                                ; 14D9 _ 39. C2
        jge     ?_081                                   ; 14DB _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 14DD _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 14E0 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14E2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14E5 _ 89. 50, 04
?_081:  mov     eax, dword [ebp+8H]                     ; 14E8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14EB _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14EE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14F1 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14F4 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 14F7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14FA _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14FD _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1500 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1503 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1507 _ B8, 00000000
        jmp     ?_083                                   ; 150C _ EB, 29

?_082:  mov     eax, dword [ebp+8H]                     ; 150E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1511 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1514 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1517 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 151A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 151D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1520 _ 8B. 40, 08
        mov     edx, eax                                ; 1523 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1525 _ 8B. 45, 10
        add     eax, edx                                ; 1528 _ 01. D0
        mov     edx, eax                                ; 152A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 152C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 152F _ 89. 50, 08
        mov     eax, 4294967295                         ; 1532 _ B8, FFFFFFFF
?_083:  add     esp, 16                                 ; 1537 _ 83. C4, 10
        pop     ebx                                     ; 153A _ 5B
        pop     ebp                                     ; 153B _ 5D
        ret                                             ; 153C _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 153D _ 55
        mov     ebp, esp                                ; 153E _ 89. E5
        sub     esp, 16                                 ; 1540 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1543 _ 8B. 45, 0C
        add     eax, 4095                               ; 1546 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 154B _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1550 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1553 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1556 _ FF. 75, 08
        call    memman_alloc                            ; 1559 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 155E _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1561 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1564 _ 8B. 45, FC
        leave                                           ; 1567 _ C9
        ret                                             ; 1568 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1569 _ 55
        mov     ebp, esp                                ; 156A _ 89. E5
        sub     esp, 16                                 ; 156C _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 156F _ 8B. 45, 10
        add     eax, 4095                               ; 1572 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1577 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 157C _ 89. 45, 10
        push    dword [ebp+10H]                         ; 157F _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1582 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1585 _ FF. 75, 08
        call    memman_free                             ; 1588 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 158D _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1590 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1593 _ 8B. 45, FC
        leave                                           ; 1596 _ C9
        ret                                             ; 1597 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1598 _ 55
        mov     ebp, esp                                ; 1599 _ 89. E5
        sub     esp, 24                                 ; 159B _ 83. EC, 18
        sub     esp, 8                                  ; 159E _ 83. EC, 08
        push    9232                                    ; 15A1 _ 68, 00002410
        push    dword [ebp+8H]                          ; 15A6 _ FF. 75, 08
        call    memman_alloc_4k                         ; 15A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15AE _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 15B1 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 15B4 _ 83. 7D, F0, 00
        jnz     ?_084                                   ; 15B8 _ 75, 07
        mov     eax, 0                                  ; 15BA _ B8, 00000000
        jmp     ?_087                                   ; 15BF _ EB, 53

?_084:  mov     eax, dword [ebp-10H]                    ; 15C1 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 15C4 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 15C7 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 15C9 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 15CC _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 15CF _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 15D2 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 15D5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 15D8 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 15DB _ 8B. 45, F0
        mov     dword [eax+0CH], -1                     ; 15DE _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 15E5 _ C7. 45, F4, 00000000
        jmp     ?_086                                   ; 15EC _ EB, 1A

?_085:  mov     eax, dword [ebp-10H]                    ; 15EE _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 15F1 _ 8B. 55, F4
        add     edx, 33                                 ; 15F4 _ 83. C2, 21
        shl     edx, 5                                  ; 15F7 _ C1. E2, 05
        add     eax, edx                                ; 15FA _ 01. D0
        add     eax, 12                                 ; 15FC _ 83. C0, 0C
        mov     dword [eax], 0                          ; 15FF _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1605 _ FF. 45, F4
?_086:  cmp     dword [ebp-0CH], 255                    ; 1608 _ 81. 7D, F4, 000000FF
        jle     ?_085                                   ; 160F _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 1611 _ 8B. 45, F0
?_087:  leave                                           ; 1614 _ C9
        ret                                             ; 1615 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1616 _ 55
        mov     ebp, esp                                ; 1617 _ 89. E5
        sub     esp, 16                                 ; 1619 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 161C _ C7. 45, FC, 00000000
        jmp     ?_090                                   ; 1623 _ EB, 56

?_088:  mov     eax, dword [ebp+8H]                     ; 1625 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1628 _ 8B. 55, FC
        add     edx, 33                                 ; 162B _ 83. C2, 21
        shl     edx, 5                                  ; 162E _ C1. E2, 05
        add     eax, edx                                ; 1631 _ 01. D0
        add     eax, 12                                 ; 1633 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 1636 _ 8B. 00
        test    eax, eax                                ; 1638 _ 85. C0
        jnz     ?_089                                   ; 163A _ 75, 3C
        mov     eax, dword [ebp-4H]                     ; 163C _ 8B. 45, FC
        shl     eax, 5                                  ; 163F _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1642 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1648 _ 8B. 45, 08
        add     eax, edx                                ; 164B _ 01. D0
        mov     dword [ebp-8H], eax                     ; 164D _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1650 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1653 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1656 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1659 _ 8B. 55, F8
        mov     dword [eax+ecx*4], edx                  ; 165C _ 89. 14 88
        mov     eax, dword [ebp-8H]                     ; 165F _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 1662 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1669 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 166C _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 1673 _ 8B. 45, F8
        jmp     ?_091                                   ; 1676 _ EB, 11

?_089:  inc     dword [ebp-4H]                          ; 1678 _ FF. 45, FC
?_090:  cmp     dword [ebp-4H], 255                     ; 167B _ 81. 7D, FC, 000000FF
        jle     ?_088                                   ; 1682 _ 7E, A1
        mov     eax, 0                                  ; 1684 _ B8, 00000000
?_091:  leave                                           ; 1689 _ C9
        ret                                             ; 168A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 168B _ 55
        mov     ebp, esp                                ; 168C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 168E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1691 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1694 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1696 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1699 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 169C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 169F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 16A2 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 16A5 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 16A8 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 16AB _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 16AE _ 89. 50, 14
        nop                                             ; 16B1 _ 90
        pop     ebp                                     ; 16B2 _ 5D
        ret                                             ; 16B3 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 16B4 _ 55
        mov     ebp, esp                                ; 16B5 _ 89. E5
        sub     esp, 24                                 ; 16B7 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 16BA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 16BD _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 16C0 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 16C3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16C6 _ 8B. 40, 0C
        inc     eax                                     ; 16C9 _ 40
        cmp     dword [ebp+10H], eax                    ; 16CA _ 39. 45, 10
        jle     ?_092                                   ; 16CD _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 16CF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 16D2 _ 8B. 40, 0C
        inc     eax                                     ; 16D5 _ 40
        mov     dword [ebp+10H], eax                    ; 16D6 _ 89. 45, 10
?_092:  cmp     dword [ebp+10H], -1                     ; 16D9 _ 83. 7D, 10, FF
        jge     ?_093                                   ; 16DD _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 16DF _ C7. 45, 10, FFFFFFFF
?_093:  mov     eax, dword [ebp+0CH]                    ; 16E6 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 16E9 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 16EC _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 16EF _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 16F2 _ 3B. 45, 10
        jle     ?_101                                   ; 16F5 _ 0F 8E, 000000C7
        cmp     dword [ebp+10H], 0                      ; 16FB _ 83. 7D, 10, 00
        js      ?_096                                   ; 16FF _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 1701 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1704 _ 89. 45, F4
        jmp     ?_095                                   ; 1707 _ EB, 30

?_094:  mov     eax, dword [ebp-0CH]                    ; 1709 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 170C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 170F _ 8B. 45, 08
        add     edx, 4                                  ; 1712 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1715 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1718 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 171B _ 8B. 4D, F4
        add     ecx, 4                                  ; 171E _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1721 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1724 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1727 _ 8B. 55, F4
        add     edx, 4                                  ; 172A _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 172D _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1730 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1733 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1736 _ FF. 4D, F4
?_095:  mov     eax, dword [ebp-0CH]                    ; 1739 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 173C _ 3B. 45, 10
        jg      ?_094                                   ; 173F _ 7F, C8
        mov     eax, dword [ebp+8H]                     ; 1741 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1744 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1747 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 174A _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 174D _ 89. 14 88
        jmp     ?_100                                   ; 1750 _ EB, 5D

?_096:  mov     eax, dword [ebp+8H]                     ; 1752 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1755 _ 8B. 40, 0C
        cmp     dword [ebp-10H], eax                    ; 1758 _ 39. 45, F0
        jge     ?_099                                   ; 175B _ 7D, 43
        mov     eax, dword [ebp-10H]                    ; 175D _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1760 _ 89. 45, F4
        jmp     ?_098                                   ; 1763 _ EB, 30

?_097:  mov     eax, dword [ebp-0CH]                    ; 1765 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1768 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 176B _ 8B. 45, 08
        add     edx, 4                                  ; 176E _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 1771 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1774 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1777 _ 8B. 4D, F4
        add     ecx, 4                                  ; 177A _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 177D _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 1780 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1783 _ 8B. 55, F4
        add     edx, 4                                  ; 1786 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1789 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 178C _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 178F _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1792 _ FF. 45, F4
?_098:  mov     eax, dword [ebp+8H]                     ; 1795 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1798 _ 8B. 40, 0C
        cmp     dword [ebp-0CH], eax                    ; 179B _ 39. 45, F4
        jl      ?_097                                   ; 179E _ 7C, C5
?_099:  mov     eax, dword [ebp+8H]                     ; 17A0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 17A3 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 17A6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 17A9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17AC _ 89. 50, 0C
?_100:  sub     esp, 12                                 ; 17AF _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 17B2 _ FF. 75, 08
        call    sheet_refresh                           ; 17B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17BA _ 83. C4, 10
        jmp     ?_108                                   ; 17BD _ E9, 000000D6

?_101:  mov     eax, dword [ebp-10H]                    ; 17C2 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 17C5 _ 3B. 45, 10
        jge     ?_108                                   ; 17C8 _ 0F 8D, 000000CA
        cmp     dword [ebp-10H], 0                      ; 17CE _ 83. 7D, F0, 00
        js      ?_104                                   ; 17D2 _ 78, 51
        mov     eax, dword [ebp-10H]                    ; 17D4 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 17D7 _ 89. 45, F4
        jmp     ?_103                                   ; 17DA _ EB, 30

?_102:  mov     eax, dword [ebp-0CH]                    ; 17DC _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 17DF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17E2 _ 8B. 45, 08
        add     edx, 4                                  ; 17E5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 17E8 _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 17EB _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 17EE _ 8B. 4D, F4
        add     ecx, 4                                  ; 17F1 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 17F4 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 17F7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 17FA _ 8B. 55, F4
        add     edx, 4                                  ; 17FD _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1800 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 1803 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1806 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1809 _ FF. 45, F4
?_103:  mov     eax, dword [ebp-0CH]                    ; 180C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 180F _ 3B. 45, 10
        jl      ?_102                                   ; 1812 _ 7C, C8
        mov     eax, dword [ebp+8H]                     ; 1814 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1817 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 181A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 181D _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1820 _ 89. 14 88
        jmp     ?_107                                   ; 1823 _ EB, 65

?_104:  mov     eax, dword [ebp+8H]                     ; 1825 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1828 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 182B _ 89. 45, F4
        jmp     ?_106                                   ; 182E _ EB, 34

?_105:  mov     eax, dword [ebp-0CH]                    ; 1830 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 1833 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1836 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1839 _ 8B. 55, F4
        add     edx, 4                                  ; 183C _ 83. C2, 04
        mov     edx, dword [eax+edx*4]                  ; 183F _ 8B. 14 90
        mov     eax, dword [ebp+8H]                     ; 1842 _ 8B. 45, 08
        add     ecx, 4                                  ; 1845 _ 83. C1, 04
        mov     dword [eax+ecx*4], edx                  ; 1848 _ 89. 14 88
        mov     eax, dword [ebp-0CH]                    ; 184B _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 184E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1851 _ 8B. 45, 08
        add     edx, 4                                  ; 1854 _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 1857 _ 8B. 04 90
        mov     edx, dword [ebp-0CH]                    ; 185A _ 8B. 55, F4
        inc     edx                                     ; 185D _ 42
        mov     dword [eax+18H], edx                    ; 185E _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1861 _ FF. 4D, F4
?_106:  mov     eax, dword [ebp-0CH]                    ; 1864 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1867 _ 3B. 45, 10
        jge     ?_105                                   ; 186A _ 7D, C4
        mov     eax, dword [ebp+8H]                     ; 186C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 186F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1872 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1875 _ 8B. 55, 0C
        mov     dword [eax+ecx*4], edx                  ; 1878 _ 89. 14 88
        mov     eax, dword [ebp+8H]                     ; 187B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 187E _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1881 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1884 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1887 _ 89. 50, 0C
?_107:  sub     esp, 12                                 ; 188A _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 188D _ FF. 75, 08
        call    sheet_refresh                           ; 1890 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1895 _ 83. C4, 10
?_108:  nop                                             ; 1898 _ 90
        leave                                           ; 1899 _ C9
        ret                                             ; 189A _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 189B _ 55
        mov     ebp, esp                                ; 189C _ 89. E5
        sub     esp, 48                                 ; 189E _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 18A1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18A4 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 18A6 _ 89. 45, F0
        mov     dword [ebp-4H], 0                       ; 18A9 _ C7. 45, FC, 00000000
        jmp     ?_115                                   ; 18B0 _ E9, 000000B0

?_109:  mov     eax, dword [ebp+8H]                     ; 18B5 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 18B8 _ 8B. 55, FC
        add     edx, 4                                  ; 18BB _ 83. C2, 04
        mov     eax, dword [eax+edx*4]                  ; 18BE _ 8B. 04 90
        mov     dword [ebp-14H], eax                    ; 18C1 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 18C4 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 18C7 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 18C9 _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 18CC _ C7. 45, F4, 00000000
        jmp     ?_114                                   ; 18D3 _ EB, 7E

?_110:  mov     eax, dword [ebp-14H]                    ; 18D5 _ 8B. 45, EC
        mov     edx, dword [eax+10H]                    ; 18D8 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 18DB _ 8B. 45, F4
        add     eax, edx                                ; 18DE _ 01. D0
        mov     dword [ebp-1CH], eax                    ; 18E0 _ 89. 45, E4
        mov     dword [ebp-8H], 0                       ; 18E3 _ C7. 45, F8, 00000000
        jmp     ?_113                                   ; 18EA _ EB, 59

?_111:  mov     eax, dword [ebp-14H]                    ; 18EC _ 8B. 45, EC
        mov     edx, dword [eax+0CH]                    ; 18EF _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 18F2 _ 8B. 45, F8
        add     eax, edx                                ; 18F5 _ 01. D0
        mov     dword [ebp-20H], eax                    ; 18F7 _ 89. 45, E0
        mov     eax, dword [ebp-14H]                    ; 18FA _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 18FD _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1900 _ 0F AF. 45, F4
        mov     edx, eax                                ; 1904 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1906 _ 8B. 45, F8
        add     eax, edx                                ; 1909 _ 01. D0
        mov     edx, eax                                ; 190B _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 190D _ 8B. 45, E8
        add     eax, edx                                ; 1910 _ 01. D0
        mov     al, byte [eax]                          ; 1912 _ 8A. 00
        mov     byte [ebp-21H], al                      ; 1914 _ 88. 45, DF
        movzx   edx, byte [ebp-21H]                     ; 1917 _ 0F B6. 55, DF
        mov     eax, dword [ebp-14H]                    ; 191B _ 8B. 45, EC
        mov     eax, dword [eax+14H]                    ; 191E _ 8B. 40, 14
        cmp     edx, eax                                ; 1921 _ 39. C2
        jz      ?_112                                   ; 1923 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 1925 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1928 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 192B _ 0F AF. 45, E4
        mov     edx, eax                                ; 192F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 1931 _ 8B. 45, E0
        add     eax, edx                                ; 1934 _ 01. D0
        mov     edx, eax                                ; 1936 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1938 _ 8B. 45, F0
        add     edx, eax                                ; 193B _ 01. C2
        mov     al, byte [ebp-21H]                      ; 193D _ 8A. 45, DF
        mov     byte [edx], al                          ; 1940 _ 88. 02
?_112:  inc     dword [ebp-8H]                          ; 1942 _ FF. 45, F8
?_113:  mov     eax, dword [ebp-14H]                    ; 1945 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 1948 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 194B _ 39. 45, F8
        jl      ?_111                                   ; 194E _ 7C, 9C
        inc     dword [ebp-0CH]                         ; 1950 _ FF. 45, F4
?_114:  mov     eax, dword [ebp-14H]                    ; 1953 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1956 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 1959 _ 39. 45, F4
        jl      ?_110                                   ; 195C _ 0F 8C, FFFFFF73
        inc     dword [ebp-4H]                          ; 1962 _ FF. 45, FC
?_115:  mov     eax, dword [ebp+8H]                     ; 1965 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1968 _ 8B. 40, 0C
        cmp     dword [ebp-4H], eax                     ; 196B _ 39. 45, FC
        jle     ?_109                                   ; 196E _ 0F 8E, FFFFFF41
        mov     eax, 0                                  ; 1974 _ B8, 00000000
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

table_rgb.1752:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1797:                                            ; byte
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

str.1842:                                               ; byte
        resb    1                                       ; 0220

?_128:  resb    9                                       ; 0221

?_129:  resb    1                                       ; 022A


