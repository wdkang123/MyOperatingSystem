; Disassembly of file: ckernel.o
; Mon Feb  1 19:51:35 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 176                                ; 0005 _ 81. EC, 000000B0
        sub     esp, 12                                 ; 000B _ 83. EC, 0C
        push    bootInfo                                ; 000E _ 68, 00000000(d)
        call    initBootInfo                            ; 0013 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0018 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 001B _ A1, 00000000(d)
        mov     dword [ebp-20H], eax                    ; 0020 _ 89. 45, E0
        mov     eax, dword [?_193]                      ; 0023 _ A1, 00000004(d)
        cwde                                            ; 0028 _ 98
        mov     dword [xsize], eax                      ; 0029 _ A3, 0000011C(d)
        mov     ax, word [?_194]                        ; 002E _ 66: A1, 00000006(d)
        cwde                                            ; 0034 _ 98
        mov     dword [ysize], eax                      ; 0035 _ A3, 00000120(d)
        call    init_pit                                ; 003A _ E8, FFFFFFFC(rel)
        push    0                                       ; 003F _ 6A, 00
        push    timerbuf                                ; 0041 _ 68, 0000010C(d)
        push    8                                       ; 0046 _ 6A, 08
        push    timerinfo                               ; 0048 _ 68, 000000F0(d)
        call    fifo8_init                              ; 004D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0052 _ 83. C4, 10
        call    timer_alloc                             ; 0055 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 005A _ 89. 45, DC
        sub     esp, 4                                  ; 005D _ 83. EC, 04
        push    10                                      ; 0060 _ 6A, 0A
        push    timerinfo                               ; 0062 _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 0067 _ FF. 75, DC
        call    timer_init                              ; 006A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006F _ 83. C4, 10
        sub     esp, 8                                  ; 0072 _ 83. EC, 08
        push    100                                     ; 0075 _ 6A, 64
        push    dword [ebp-24H]                         ; 0077 _ FF. 75, DC
        call    timer_settime                           ; 007A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007F _ 83. C4, 10
        call    timer_alloc                             ; 0082 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0087 _ 89. 45, D8
        sub     esp, 4                                  ; 008A _ 83. EC, 04
        push    2                                       ; 008D _ 6A, 02
        push    timerinfo                               ; 008F _ 68, 000000F0(d)
        push    dword [ebp-28H]                         ; 0094 _ FF. 75, D8
        call    timer_init                              ; 0097 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009C _ 83. C4, 10
        sub     esp, 8                                  ; 009F _ 83. EC, 08
        push    300                                     ; 00A2 _ 68, 0000012C
        push    dword [ebp-28H]                         ; 00A7 _ FF. 75, D8
        call    timer_settime                           ; 00AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AF _ 83. C4, 10
        call    timer_alloc                             ; 00B2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 00B7 _ 89. 45, D4
        sub     esp, 4                                  ; 00BA _ 83. EC, 04
        push    1                                       ; 00BD _ 6A, 01
        push    timerinfo                               ; 00BF _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 00C4 _ FF. 75, D4
        call    timer_init                              ; 00C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00CC _ 83. C4, 10
        sub     esp, 8                                  ; 00CF _ 83. EC, 08
        push    50                                      ; 00D2 _ 6A, 32
        push    dword [ebp-2CH]                         ; 00D4 _ FF. 75, D4
        call    timer_settime                           ; 00D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DC _ 83. C4, 10
        push    0                                       ; 00DF _ 6A, 00
        push    keybuf                                  ; 00E1 _ 68, 00000040(d)
        push    32                                      ; 00E6 _ 6A, 20
        push    keyinfo                                 ; 00E8 _ 68, 00000008(d)
        call    fifo8_init                              ; 00ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F2 _ 83. C4, 10
        push    0                                       ; 00F5 _ 6A, 00
        push    mousebuf                                ; 00F7 _ 68, 00000060(d)
        push    128                                     ; 00FC _ 68, 00000080
        push    mouseinfo                               ; 0101 _ 68, 00000024(d)
        call    fifo8_init                              ; 0106 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010B _ 83. C4, 10
        call    init_palette                            ; 010E _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0113 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0118 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 011D _ 89. 45, D0
        call    get_adr_buffer                          ; 0120 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0125 _ 89. 45, CC
        mov     eax, dword [memman]                     ; 0128 _ A1, 00000000(d)
        sub     esp, 12                                 ; 012D _ 83. EC, 0C
        push    eax                                     ; 0130 _ 50
        call    memman_init                             ; 0131 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0136 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0139 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013E _ 83. EC, 04
        push    1072594944                              ; 0141 _ 68, 3FEE8000
        push    16809984                                ; 0146 _ 68, 01008000
        push    eax                                     ; 014B _ 50
        call    memman_free                             ; 014C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0151 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0154 _ 8B. 0D, 00000120(d)
        mov     edx, dword [xsize]                      ; 015A _ 8B. 15, 0000011C(d)
        mov     eax, dword [memman]                     ; 0160 _ A1, 00000000(d)
        push    ecx                                     ; 0165 _ 51
        push    edx                                     ; 0166 _ 52
        push    dword [ebp-20H]                         ; 0167 _ FF. 75, E0
        push    eax                                     ; 016A _ 50
        call    shtctl_init                             ; 016B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0170 _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0173 _ A3, 00000244(d)
        mov     eax, dword [shtctl]                     ; 0178 _ A1, 00000244(d)
        sub     esp, 12                                 ; 017D _ 83. EC, 0C
        push    eax                                     ; 0180 _ 50
        call    sheet_alloc                             ; 0181 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0186 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0189 _ A3, 00000248(d)
        mov     eax, dword [shtctl]                     ; 018E _ A1, 00000244(d)
        sub     esp, 12                                 ; 0193 _ 83. EC, 0C
        push    eax                                     ; 0196 _ 50
        call    sheet_alloc                             ; 0197 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019C _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019F _ A3, 0000024C(d)
        mov     edx, dword [xsize]                      ; 01A4 _ 8B. 15, 0000011C(d)
        mov     eax, dword [ysize]                      ; 01AA _ A1, 00000120(d)
        imul    edx, eax                                ; 01AF _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B2 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B7 _ 83. EC, 08
        push    edx                                     ; 01BA _ 52
        push    eax                                     ; 01BB _ 50
        call    memman_alloc_4k                         ; 01BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C1 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C4 _ A3, 00000124(d)
        mov     ebx, dword [ysize]                      ; 01C9 _ 8B. 1D, 00000120(d)
        mov     ecx, dword [xsize]                      ; 01CF _ 8B. 0D, 0000011C(d)
        mov     edx, dword [buf_back]                   ; 01D5 _ 8B. 15, 00000124(d)
        mov     eax, dword [sht_back]                   ; 01DB _ A1, 00000248(d)
        sub     esp, 12                                 ; 01E0 _ 83. EC, 0C
        push    99                                      ; 01E3 _ 6A, 63
        push    ebx                                     ; 01E5 _ 53
        push    ecx                                     ; 01E6 _ 51
        push    edx                                     ; 01E7 _ 52
        push    eax                                     ; 01E8 _ 50
        call    sheet_setbuf                            ; 01E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EE _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01F1 _ A1, 0000024C(d)
        sub     esp, 12                                 ; 01F6 _ 83. EC, 0C
        push    99                                      ; 01F9 _ 6A, 63
        push    16                                      ; 01FB _ 6A, 10
        push    16                                      ; 01FD _ 6A, 10
        push    buf_mouse                               ; 01FF _ 68, 00000140(d)
        push    eax                                     ; 0204 _ 50
        call    sheet_setbuf                            ; 0205 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 020A _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020D _ 8B. 0D, 00000120(d)
        mov     edx, dword [xsize]                      ; 0213 _ 8B. 15, 0000011C(d)
        mov     eax, dword [buf_back]                   ; 0219 _ A1, 00000124(d)
        sub     esp, 4                                  ; 021E _ 83. EC, 04
        push    ecx                                     ; 0221 _ 51
        push    edx                                     ; 0222 _ 52
        push    eax                                     ; 0223 _ 50
        call    init_screen8                            ; 0224 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0229 _ 83. C4, 10
        sub     esp, 8                                  ; 022C _ 83. EC, 08
        push    99                                      ; 022F _ 6A, 63
        push    buf_mouse                               ; 0231 _ 68, 00000140(d)
        call    init_mouse_cursor                       ; 0236 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023B _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023E _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0244 _ A1, 00000244(d)
        push    0                                       ; 0249 _ 6A, 00
        push    0                                       ; 024B _ 6A, 00
        push    edx                                     ; 024D _ 52
        push    eax                                     ; 024E _ 50
        call    sheet_slide                             ; 024F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0254 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0257 _ A1, 0000011C(d)
        sub     eax, 16                                 ; 025C _ 83. E8, 10
        mov     edx, eax                                ; 025F _ 89. C2
        shr     edx, 31                                 ; 0261 _ C1. EA, 1F
        add     eax, edx                                ; 0264 _ 01. D0
        sar     eax, 1                                  ; 0266 _ D1. F8
        mov     dword [mx], eax                         ; 0268 _ A3, 00000114(d)
        mov     eax, dword [ysize]                      ; 026D _ A1, 00000120(d)
        sub     eax, 44                                 ; 0272 _ 83. E8, 2C
        mov     edx, eax                                ; 0275 _ 89. C2
        shr     edx, 31                                 ; 0277 _ C1. EA, 1F
        add     eax, edx                                ; 027A _ 01. D0
        sar     eax, 1                                  ; 027C _ D1. F8
        mov     dword [my], eax                         ; 027E _ A3, 00000118(d)
        mov     ebx, dword [my]                         ; 0283 _ 8B. 1D, 00000118(d)
        mov     ecx, dword [mx]                         ; 0289 _ 8B. 0D, 00000114(d)
        mov     edx, dword [sht_mouse]                  ; 028F _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 0295 _ A1, 00000244(d)
        push    ebx                                     ; 029A _ 53
        push    ecx                                     ; 029B _ 51
        push    edx                                     ; 029C _ 52
        push    eax                                     ; 029D _ 50
        call    sheet_slide                             ; 029E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A3 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A6 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AD _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B4 _ A1, 00000244(d)
        sub     esp, 8                                  ; 02B9 _ 83. EC, 08
        push    ?_182                                   ; 02BC _ 68, 00000000(d)
        push    eax                                     ; 02C1 _ 50
        call    message_box                             ; 02C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C7 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02CA _ A3, 00000240(d)
        mov     edx, dword [sht_back]                   ; 02CF _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 02D5 _ A1, 00000244(d)
        sub     esp, 4                                  ; 02DA _ 83. EC, 04
        push    0                                       ; 02DD _ 6A, 00
        push    edx                                     ; 02DF _ 52
        push    eax                                     ; 02E0 _ 50
        call    sheet_updown                            ; 02E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E6 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E9 _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 02EF _ A1, 00000244(d)
        sub     esp, 4                                  ; 02F4 _ 83. EC, 04
        push    100                                     ; 02F7 _ 6A, 64
        push    edx                                     ; 02F9 _ 52
        push    eax                                     ; 02FA _ 50
        call    sheet_updown                            ; 02FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0300 _ 83. C4, 10
        call    io_sti                                  ; 0303 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0308 _ 83. EC, 0C
        push    mdec                                    ; 030B _ 68, 000000E0(d)
        call    enable_mouse                            ; 0310 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0315 _ 83. C4, 10
        call    get_code32_addr                         ; 0318 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 031D _ 89. 45, C8
        call    get_addr_gdt                            ; 0320 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0325 _ 89. 45, C4
        mov     eax, dword [memman]                     ; 0328 _ A1, 00000000(d)
        sub     esp, 12                                 ; 032D _ 83. EC, 0C
        push    eax                                     ; 0330 _ 50
        call    task_init                               ; 0331 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0336 _ 83. C4, 10
        mov     dword [task_a.1839], eax                ; 0339 _ A3, 00000264(d)
        mov     eax, dword [task_a.1839]                ; 033E _ A1, 00000264(d)
        mov     dword [?_195], eax                      ; 0343 _ A3, 00000020(d)
        call    task_alloc                              ; 0348 _ E8, FFFFFFFC(rel)
        mov     dword [task_b.1840], eax                ; 034D _ A3, 00000268(d)
        mov     eax, dword [task_b.1840]                ; 0352 _ A1, 00000268(d)
        mov     dword [eax+68H], 0                      ; 0357 _ C7. 40, 68, 00000000
        mov     eax, dword [task_b.1840]                ; 035E _ A1, 00000268(d)
        mov     dword [eax+6CH], 1073741824             ; 0363 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-38H]                    ; 036A _ 8B. 45, C8
        neg     eax                                     ; 036D _ F7. D8
        lea     edx, [task_b_main+eax]                  ; 036F _ 8D. 90, 00000000(d)
        mov     eax, dword [task_b.1840]                ; 0375 _ A1, 00000268(d)
        mov     dword [eax+28H], edx                    ; 037A _ 89. 50, 28
        mov     eax, dword [task_b.1840]                ; 037D _ A1, 00000268(d)
        mov     dword [eax+50H], 0                      ; 0382 _ C7. 40, 50, 00000000
        mov     eax, dword [task_b.1840]                ; 0389 _ A1, 00000268(d)
        mov     dword [eax+54H], 8                      ; 038E _ C7. 40, 54, 00000008
        mov     eax, dword [task_b.1840]                ; 0395 _ A1, 00000268(d)
        mov     dword [eax+58H], 32                     ; 039A _ C7. 40, 58, 00000020
        mov     eax, dword [task_b.1840]                ; 03A1 _ A1, 00000268(d)
        mov     dword [eax+5CH], 24                     ; 03A6 _ C7. 40, 5C, 00000018
        mov     eax, dword [task_b.1840]                ; 03AD _ A1, 00000268(d)
        mov     dword [eax+60H], 0                      ; 03B2 _ C7. 40, 60, 00000000
        mov     eax, dword [task_b.1840]                ; 03B9 _ A1, 00000268(d)
        mov     dword [eax+64H], 16                     ; 03BE _ C7. 40, 64, 00000010
        mov     eax, dword [task_b.1840]                ; 03C5 _ A1, 00000268(d)
        sub     esp, 12                                 ; 03CA _ 83. EC, 0C
        push    eax                                     ; 03CD _ 50
        call    task_run                                ; 03CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D3 _ 83. C4, 10
        mov     dword [ebp-40H], 0                      ; 03D6 _ C7. 45, C0, 00000000
        mov     dword [ebp-14H], 0                      ; 03DD _ C7. 45, EC, 00000000
        mov     dword [ebp-44H], 0                      ; 03E4 _ C7. 45, BC, 00000000
        mov     dword [ebp-18H], 0                      ; 03EB _ C7. 45, E8, 00000000
        mov     dword [ebp-1CH], 0                      ; 03F2 _ C7. 45, E4, 00000000
?_001:  call    io_cli                                  ; 03F9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03FE _ 83. EC, 0C
        push    keyinfo                                 ; 0401 _ 68, 00000008(d)
        call    fifo8_status                            ; 0406 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040B _ 83. C4, 10
        mov     ebx, eax                                ; 040E _ 89. C3
        sub     esp, 12                                 ; 0410 _ 83. EC, 0C
        push    mouseinfo                               ; 0413 _ 68, 00000024(d)
        call    fifo8_status                            ; 0418 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 041D _ 83. C4, 10
        add     ebx, eax                                ; 0420 _ 01. C3
        sub     esp, 12                                 ; 0422 _ 83. EC, 0C
        push    timerinfo                               ; 0425 _ 68, 000000F0(d)
        call    fifo8_status                            ; 042A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042F _ 83. C4, 10
        add     eax, ebx                                ; 0432 _ 01. D8
        test    eax, eax                                ; 0434 _ 85. C0
        jnz near      ?_002                                   ; 0436 _ 75, 07
        call    io_sti                                  ; 0438 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 043D _ EB, BA

?_002:  sub     esp, 12                                 ; 043F _ 83. EC, 0C
        push    keyinfo                                 ; 0442 _ 68, 00000008(d)
        call    fifo8_status                            ; 0447 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 044C _ 83. C4, 10
        test    eax, eax                                ; 044F _ 85. C0
        je near       ?_004                                   ; 0451 _ 0f 84, 0000018f
        call    io_sti                                  ; 0457 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 045C _ 83. EC, 0C
        push    keyinfo                                 ; 045F _ 68, 00000008(d)
        call    fifo8_get                               ; 0464 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0469 _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 046C _ 89. 45, C0
        cmp     dword [ebp-40H], 28                     ; 046F _ 83. 7D, C0, 1C
        jnz near      ?_003                                   ; 0473 _ 75, 5c
        mov     ebx, dword [xsize]                      ; 0475 _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [buf_back]                   ; 047B _ 8B. 0D, 00000124(d)
        mov     edx, dword [ebp-14H]                    ; 0481 _ 8B. 55, EC
        mov     eax, edx                                ; 0484 _ 89. D0
        shl     eax, 2                                  ; 0486 _ C1. E0, 02
        add     eax, edx                                ; 0489 _ 01. D0
        shl     eax, 2                                  ; 048B _ C1. E0, 02
        mov     edx, eax                                ; 048E _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 0490 _ 8B. 45, CC
        lea     esi, [edx+eax]                          ; 0493 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0496 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 049C _ A1, 00000244(d)
        sub     esp, 4                                  ; 04A1 _ 83. EC, 04
        push    7                                       ; 04A4 _ 6A, 07
        push    ebx                                     ; 04A6 _ 53
        push    dword [ebp-14H]                         ; 04A7 _ FF. 75, EC
        push    ecx                                     ; 04AA _ 51
        push    esi                                     ; 04AB _ 56
        push    edx                                     ; 04AC _ 52
        push    eax                                     ; 04AD _ 50
        call    showMemoryInfo                          ; 04AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04B3 _ 83. C4, 20
        inc     dword [ebp-14H]                         ; 04B6 _ FF. 45, EC
        mov     eax, dword [ebp-14H]                    ; 04B9 _ 8B. 45, EC
        cmp     eax, dword [ebp-30H]                    ; 04BC _ 3B. 45, D0
        jle near      ?_001                                   ; 04bf _ 0f 8e, ffffff34
        mov     dword [ebp-14H], 0                      ; 04C5 _ C7. 45, EC, 00000000
        jmp     ?_001                                   ; 04CC _ E9, FFFFFF28

?_003:  mov     eax, dword [ebp-40H]                    ; 04D1 _ 8B. 45, C0
        add     eax, keytable                           ; 04D4 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 04D9 _ 8A. 00
        test    al, al                                  ; 04DB _ 84. C0
        je near       ?_001                                   ; 04dd _ 0f 84, ffffff16
        cmp     dword [ebp-0CH], 143                    ; 04E3 _ 81. 7D, F4, 0000008F
        jg  near      ?_001                                   ; 04ea _ 0f 8f, ffffff09
        mov     eax, dword [ebp-0CH]                    ; 04F0 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 04F3 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 04F6 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 04FB _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 04FE _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0503 _ 8B. 00
        sub     esp, 4                                  ; 0505 _ 83. EC, 04
        push    43                                      ; 0508 _ 6A, 2B
        push    ecx                                     ; 050A _ 51
        push    28                                      ; 050B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 050D _ FF. 75, F4
        push    7                                       ; 0510 _ 6A, 07
        push    edx                                     ; 0512 _ 52
        push    eax                                     ; 0513 _ 50
        call    boxfill8                                ; 0514 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0519 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 051C _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 051F _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0522 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0528 _ A1, 00000244(d)
        sub     esp, 8                                  ; 052D _ 83. EC, 08
        push    44                                      ; 0530 _ 6A, 2C
        push    ecx                                     ; 0532 _ 51
        push    28                                      ; 0533 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0535 _ FF. 75, F4
        push    edx                                     ; 0538 _ 52
        push    eax                                     ; 0539 _ 50
        call    sheet_refresh                           ; 053A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 053F _ 83. C4, 20
        mov     eax, dword [ebp-40H]                    ; 0542 _ 8B. 45, C0
        add     eax, keytable                           ; 0545 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 054A _ 8A. 00
        mov     byte [ebp-0B2H], al                     ; 054C _ 88. 85, FFFFFF4E
        mov     byte [ebp-0B1H], 0                      ; 0552 _ C6. 85, FFFFFF4F, 00
        mov     edx, dword [shtMsgBox]                  ; 0559 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 055F _ A1, 00000244(d)
        sub     esp, 8                                  ; 0564 _ 83. EC, 08
        lea     ecx, [ebp-0B2H]                         ; 0567 _ 8D. 8D, FFFFFF4E
        push    ecx                                     ; 056D _ 51
        push    0                                       ; 056E _ 6A, 00
        push    28                                      ; 0570 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0572 _ FF. 75, F4
        push    edx                                     ; 0575 _ 52
        push    eax                                     ; 0576 _ 50
        call    showString                              ; 0577 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 057C _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 057F _ 83. 45, F4, 08
        mov     dword [ebp-1CH], 1                      ; 0583 _ C7. 45, E4, 00000001
        mov     eax, dword [ebp-0CH]                    ; 058A _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 058D _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0590 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0593 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0596 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 059B _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 059E _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 05A3 _ 8B. 00
        sub     esp, 4                                  ; 05A5 _ 83. EC, 04
        push    43                                      ; 05A8 _ 6A, 2B
        push    ebx                                     ; 05AA _ 53
        push    28                                      ; 05AB _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05AD _ FF. 75, F4
        push    ecx                                     ; 05B0 _ 51
        push    edx                                     ; 05B1 _ 52
        push    eax                                     ; 05B2 _ 50
        call    boxfill8                                ; 05B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B8 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 05BB _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 05BE _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 05C1 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 05C7 _ A1, 00000244(d)
        sub     esp, 8                                  ; 05CC _ 83. EC, 08
        push    44                                      ; 05CF _ 6A, 2C
        push    ecx                                     ; 05D1 _ 51
        push    28                                      ; 05D2 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05D4 _ FF. 75, F4
        push    edx                                     ; 05D7 _ 52
        push    eax                                     ; 05D8 _ 50
        call    sheet_refresh                           ; 05D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05DE _ 83. C4, 20
        jmp     ?_001                                   ; 05E1 _ E9, FFFFFE13

?_004:  sub     esp, 12                                 ; 05E6 _ 83. EC, 0C
        push    mouseinfo                               ; 05E9 _ 68, 00000024(d)
        call    fifo8_status                            ; 05EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05F3 _ 83. C4, 10
        test    eax, eax                                ; 05F6 _ 85. C0
        jz near       ?_005                                   ; 05f8 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 05FA _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 0600 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0606 _ A1, 00000244(d)
        sub     esp, 4                                  ; 060B _ 83. EC, 04
        push    ecx                                     ; 060E _ 51
        push    edx                                     ; 060F _ 52
        push    eax                                     ; 0610 _ 50
        call    show_mouse_info                         ; 0611 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0616 _ 83. C4, 10
        jmp     ?_001                                   ; 0619 _ E9, FFFFFDDB

?_005:  sub     esp, 12                                 ; 061E _ 83. EC, 0C
        push    timerinfo                               ; 0621 _ 68, 000000F0(d)
        call    fifo8_status                            ; 0626 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 062B _ 83. C4, 10
        test    eax, eax                                ; 062E _ 85. C0
        je near       ?_001                                   ; 0630 _ 0f 84, fffffdc3
        call    io_sti                                  ; 0636 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 063B _ 83. EC, 0C
        push    timerinfo                               ; 063E _ 68, 000000F0(d)
        call    fifo8_get                               ; 0643 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0648 _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 064B _ 89. 45, B8
        cmp     dword [ebp-48H], 10                     ; 064E _ 83. 7D, B8, 0A
        jnz near      ?_006                                   ; 0652 _ 75, 6f
        mov     edx, dword [sht_back]                   ; 0654 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 065A _ A1, 00000244(d)
        sub     esp, 8                                  ; 065F _ 83. EC, 08
        push    ?_183                                   ; 0662 _ 68, 00000008(d)
        push    7                                       ; 0667 _ 6A, 07
        push    144                                     ; 0669 _ 68, 00000090
        push    dword [ebp-18H]                         ; 066E _ FF. 75, E8
        push    edx                                     ; 0671 _ 52
        push    eax                                     ; 0672 _ 50
        call    showString                              ; 0673 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0678 _ 83. C4, 20
        sub     esp, 8                                  ; 067B _ 83. EC, 08
        push    100                                     ; 067E _ 6A, 64
        push    dword [ebp-24H]                         ; 0680 _ FF. 75, DC
        call    timer_settime                           ; 0683 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0688 _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 068B _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 068F _ 83. 7D, E8, 28
        jle near      ?_001                                   ; 0693 _ 0f 8e, fffffd60
        cmp     dword [ebp-1CH], 0                      ; 0699 _ 83. 7D, E4, 00
        jne near      ?_001                                   ; 069d _ 0f 85, fffffd56
        call    io_cli                                  ; 06A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1839]                ; 06A8 _ A1, 00000264(d)
        sub     esp, 12                                 ; 06AD _ 83. EC, 0C
        push    eax                                     ; 06B0 _ 50
        call    task_sleep                              ; 06B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B6 _ 83. C4, 10
        call    io_sti                                  ; 06B9 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 06BE _ E9, FFFFFD36

?_006:  cmp     dword [ebp-48H], 2                      ; 06C3 _ 83. 7D, B8, 02
        jnz near      ?_007                                   ; 06c7 _ 75, 28
        mov     edx, dword [sht_back]                   ; 06C9 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 06CF _ A1, 00000244(d)
        sub     esp, 8                                  ; 06D4 _ 83. EC, 08
        push    ?_184                                   ; 06D7 _ 68, 0000000A(d)
        push    7                                       ; 06DC _ 6A, 07
        push    32                                      ; 06DE _ 6A, 20
        push    0                                       ; 06E0 _ 6A, 00
        push    edx                                     ; 06E2 _ 52
        push    eax                                     ; 06E3 _ 50
        call    showString                              ; 06E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06E9 _ 83. C4, 20
        jmp     ?_001                                   ; 06EC _ E9, FFFFFD08

?_007:  cmp     dword [ebp-48H], 0                      ; 06F1 _ 83. 7D, B8, 00
        jz near       ?_008                                   ; 06f5 _ 74, 1e
        sub     esp, 4                                  ; 06F7 _ 83. EC, 04
        push    0                                       ; 06FA _ 6A, 00
        push    timerinfo                               ; 06FC _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 0701 _ FF. 75, D4
        call    timer_init                              ; 0704 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0709 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 070C _ C7. 45, F0, 00000000
        jmp     ?_009                                   ; 0713 _ EB, 1C

?_008:  sub     esp, 4                                  ; 0715 _ 83. EC, 04
        push    1                                       ; 0718 _ 6A, 01
        push    timerinfo                               ; 071A _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 071F _ FF. 75, D4
        call    timer_init                              ; 0722 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0727 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 072A _ C7. 45, F0, 00000007
?_009:  sub     esp, 8                                  ; 0731 _ 83. EC, 08
        push    50                                      ; 0734 _ 6A, 32
        push    dword [ebp-2CH]                         ; 0736 _ FF. 75, D4
        call    timer_settime                           ; 0739 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 073E _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 0741 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0744 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0747 _ 8B. 45, F0
        movzx   ecx, al                                 ; 074A _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 074D _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0752 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0755 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 075A _ 8B. 00
        sub     esp, 4                                  ; 075C _ 83. EC, 04
        push    43                                      ; 075F _ 6A, 2B
        push    ebx                                     ; 0761 _ 53
        push    28                                      ; 0762 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0764 _ FF. 75, F4
        push    ecx                                     ; 0767 _ 51
        push    edx                                     ; 0768 _ 52
        push    eax                                     ; 0769 _ 50
        call    boxfill8                                ; 076A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 076F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0772 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0775 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0778 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 077E _ A1, 00000244(d)
        sub     esp, 8                                  ; 0783 _ 83. EC, 08
        push    44                                      ; 0786 _ 6A, 2C
        push    ecx                                     ; 0788 _ 51
        push    28                                      ; 0789 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 078B _ FF. 75, F4
        push    edx                                     ; 078E _ 52
        push    eax                                     ; 078F _ 50
        call    sheet_refresh                           ; 0790 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0795 _ 83. C4, 20
        jmp     ?_001                                   ; 0798 _ E9, FFFFFC5C
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 079D _ 55
        mov     ebp, esp                                ; 079E _ 89. E5
        sub     esp, 56                                 ; 07A0 _ 83. EC, 38
        mov     edx, dword [sht_back]                   ; 07A3 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 07A9 _ A1, 00000244(d)
        sub     esp, 8                                  ; 07AE _ 83. EC, 08
        push    ?_185                                   ; 07B1 _ 68, 00000011(d)
        push    7                                       ; 07B6 _ 6A, 07
        push    160                                     ; 07B8 _ 68, 000000A0
        push    0                                       ; 07BD _ 6A, 00
        push    edx                                     ; 07BF _ 52
        push    eax                                     ; 07C0 _ 50
        call    showString                              ; 07C1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07C6 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 07C9 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 0                      ; 07D0 _ C7. 45, EC, 00000000
        push    0                                       ; 07D7 _ 6A, 00
        lea     eax, [ebp-38H]                          ; 07D9 _ 8D. 45, C8
        push    eax                                     ; 07DC _ 50
        push    8                                       ; 07DD _ 6A, 08
        lea     eax, [ebp-30H]                          ; 07DF _ 8D. 45, D0
        push    eax                                     ; 07E2 _ 50
        call    fifo8_init                              ; 07E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07E8 _ 83. C4, 10
        call    timer_alloc                             ; 07EB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 07F0 _ 89. 45, F0
        sub     esp, 4                                  ; 07F3 _ 83. EC, 04
        push    123                                     ; 07F6 _ 6A, 7B
        lea     eax, [ebp-30H]                          ; 07F8 _ 8D. 45, D0
        push    eax                                     ; 07FB _ 50
        push    dword [ebp-10H]                         ; 07FC _ FF. 75, F0
        call    timer_init                              ; 07FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0804 _ 83. C4, 10
        sub     esp, 8                                  ; 0807 _ 83. EC, 08
        push    100                                     ; 080A _ 6A, 64
        push    dword [ebp-10H]                         ; 080C _ FF. 75, F0
        call    timer_settime                           ; 080F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0814 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0817 _ C7. 45, F4, 00000000
?_010:  call    io_cli                                  ; 081E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0823 _ 83. EC, 0C
        lea     eax, [ebp-30H]                          ; 0826 _ 8D. 45, D0
        push    eax                                     ; 0829 _ 50
        call    fifo8_status                            ; 082A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 082F _ 83. C4, 10
        test    eax, eax                                ; 0832 _ 85. C0
        jnz near      ?_011                                   ; 0834 _ 75, 07
        call    io_sti                                  ; 0836 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 083B _ EB, E1

?_011:  sub     esp, 12                                 ; 083D _ 83. EC, 0C
        lea     eax, [ebp-30H]                          ; 0840 _ 8D. 45, D0
        push    eax                                     ; 0843 _ 50
        call    fifo8_get                               ; 0844 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0849 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 084C _ 89. 45, EC
        call    io_sti                                  ; 084F _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 123                    ; 0854 _ 83. 7D, EC, 7B
        jnz near      ?_010                                   ; 0858 _ 75, c4
        mov     edx, dword [sht_back]                   ; 085A _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0860 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0865 _ 83. EC, 08
        push    ?_186                                   ; 0868 _ 68, 0000001E(d)
        push    7                                       ; 086D _ 6A, 07
        push    192                                     ; 086F _ 68, 000000C0
        push    dword [ebp-0CH]                         ; 0874 _ FF. 75, F4
        push    edx                                     ; 0877 _ 52
        push    eax                                     ; 0878 _ 50
        call    showString                              ; 0879 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 087E _ 83. C4, 20
        sub     esp, 8                                  ; 0881 _ 83. EC, 08
        push    100                                     ; 0884 _ 6A, 64
        push    dword [ebp-10H]                         ; 0886 _ FF. 75, F0
        call    timer_settime                           ; 0889 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 088E _ 83. C4, 10
        add     dword [ebp-0CH], 8                      ; 0891 _ 83. 45, F4, 08
        jmp     ?_010                                   ; 0895 _ EB, 87
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0897 _ 55
        mov     ebp, esp                                ; 0898 _ 89. E5
        push    ebx                                     ; 089A _ 53
        sub     esp, 4                                  ; 089B _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 089E _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 08A1 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 08A4 _ 8B. 45, 0C
        dec     eax                                     ; 08A7 _ 48
        sub     esp, 4                                  ; 08A8 _ 83. EC, 04
        push    edx                                     ; 08AB _ 52
        push    eax                                     ; 08AC _ 50
        push    0                                       ; 08AD _ 6A, 00
        push    0                                       ; 08AF _ 6A, 00
        push    14                                      ; 08B1 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 08B3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 08B6 _ FF. 75, 08
        call    boxfill8                                ; 08B9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08BE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 08C1 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 08C4 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 08C7 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 08CA _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 08CD _ 8B. 45, 10
        sub     eax, 28                                 ; 08D0 _ 83. E8, 1C
        sub     esp, 4                                  ; 08D3 _ 83. EC, 04
        push    ecx                                     ; 08D6 _ 51
        push    edx                                     ; 08D7 _ 52
        push    eax                                     ; 08D8 _ 50
        push    0                                       ; 08D9 _ 6A, 00
        push    8                                       ; 08DB _ 6A, 08
        push    dword [ebp+0CH]                         ; 08DD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 08E0 _ FF. 75, 08
        call    boxfill8                                ; 08E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08E8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 08EB _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 08EE _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 08F1 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 08F4 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 08F7 _ 8B. 45, 10
        sub     eax, 27                                 ; 08FA _ 83. E8, 1B
        sub     esp, 4                                  ; 08FD _ 83. EC, 04
        push    ecx                                     ; 0900 _ 51
        push    edx                                     ; 0901 _ 52
        push    eax                                     ; 0902 _ 50
        push    0                                       ; 0903 _ 6A, 00
        push    7                                       ; 0905 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0907 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 090A _ FF. 75, 08
        call    boxfill8                                ; 090D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0912 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0915 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0918 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 091B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 091E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0921 _ 8B. 45, 10
        sub     eax, 26                                 ; 0924 _ 83. E8, 1A
        sub     esp, 4                                  ; 0927 _ 83. EC, 04
        push    ecx                                     ; 092A _ 51
        push    edx                                     ; 092B _ 52
        push    eax                                     ; 092C _ 50
        push    0                                       ; 092D _ 6A, 00
        push    8                                       ; 092F _ 6A, 08
        push    dword [ebp+0CH]                         ; 0931 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0934 _ FF. 75, 08
        call    boxfill8                                ; 0937 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 093C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 093F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0942 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0945 _ 8B. 45, 10
        sub     eax, 24                                 ; 0948 _ 83. E8, 18
        sub     esp, 4                                  ; 094B _ 83. EC, 04
        push    edx                                     ; 094E _ 52
        push    59                                      ; 094F _ 6A, 3B
        push    eax                                     ; 0951 _ 50
        push    3                                       ; 0952 _ 6A, 03
        push    7                                       ; 0954 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0956 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0959 _ FF. 75, 08
        call    boxfill8                                ; 095C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0961 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0964 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0967 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 096A _ 8B. 45, 10
        sub     eax, 24                                 ; 096D _ 83. E8, 18
        sub     esp, 4                                  ; 0970 _ 83. EC, 04
        push    edx                                     ; 0973 _ 52
        push    2                                       ; 0974 _ 6A, 02
        push    eax                                     ; 0976 _ 50
        push    2                                       ; 0977 _ 6A, 02
        push    7                                       ; 0979 _ 6A, 07
        push    dword [ebp+0CH]                         ; 097B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 097E _ FF. 75, 08
        call    boxfill8                                ; 0981 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0986 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0989 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 098C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 098F _ 8B. 45, 10
        sub     eax, 4                                  ; 0992 _ 83. E8, 04
        sub     esp, 4                                  ; 0995 _ 83. EC, 04
        push    edx                                     ; 0998 _ 52
        push    59                                      ; 0999 _ 6A, 3B
        push    eax                                     ; 099B _ 50
        push    3                                       ; 099C _ 6A, 03
        push    15                                      ; 099E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 09A0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 09A3 _ FF. 75, 08
        call    boxfill8                                ; 09A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09AB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 09AE _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 09B1 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 09B4 _ 8B. 45, 10
        sub     eax, 23                                 ; 09B7 _ 83. E8, 17
        sub     esp, 4                                  ; 09BA _ 83. EC, 04
        push    edx                                     ; 09BD _ 52
        push    59                                      ; 09BE _ 6A, 3B
        push    eax                                     ; 09C0 _ 50
        push    59                                      ; 09C1 _ 6A, 3B
        push    15                                      ; 09C3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 09C5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 09C8 _ FF. 75, 08
        call    boxfill8                                ; 09CB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09D0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 09D3 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 09D6 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 09D9 _ 8B. 45, 10
        sub     eax, 3                                  ; 09DC _ 83. E8, 03
        sub     esp, 4                                  ; 09DF _ 83. EC, 04
        push    edx                                     ; 09E2 _ 52
        push    59                                      ; 09E3 _ 6A, 3B
        push    eax                                     ; 09E5 _ 50
        push    2                                       ; 09E6 _ 6A, 02
        push    0                                       ; 09E8 _ 6A, 00
        push    dword [ebp+0CH]                         ; 09EA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 09ED _ FF. 75, 08
        call    boxfill8                                ; 09F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09F5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 09F8 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 09FB _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 09FE _ 8B. 45, 10
        sub     eax, 24                                 ; 0A01 _ 83. E8, 18
        sub     esp, 4                                  ; 0A04 _ 83. EC, 04
        push    edx                                     ; 0A07 _ 52
        push    60                                      ; 0A08 _ 6A, 3C
        push    eax                                     ; 0A0A _ 50
        push    60                                      ; 0A0B _ 6A, 3C
        push    0                                       ; 0A0D _ 6A, 00
        push    dword [ebp+0CH]                         ; 0A0F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A12 _ FF. 75, 08
        call    boxfill8                                ; 0A15 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A1A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0A1D _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0A20 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0A23 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0A26 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0A29 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0A2C _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0A2F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A32 _ 83. E8, 2F
        sub     esp, 4                                  ; 0A35 _ 83. EC, 04
        push    ebx                                     ; 0A38 _ 53
        push    ecx                                     ; 0A39 _ 51
        push    edx                                     ; 0A3A _ 52
        push    eax                                     ; 0A3B _ 50
        push    15                                      ; 0A3C _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0A3E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A41 _ FF. 75, 08
        call    boxfill8                                ; 0A44 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A49 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0A4C _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0A4F _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0A52 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0A55 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0A58 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0A5B _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0A5E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A61 _ 83. E8, 2F
        sub     esp, 4                                  ; 0A64 _ 83. EC, 04
        push    ebx                                     ; 0A67 _ 53
        push    ecx                                     ; 0A68 _ 51
        push    edx                                     ; 0A69 _ 52
        push    eax                                     ; 0A6A _ 50
        push    15                                      ; 0A6B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0A6D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A70 _ FF. 75, 08
        call    boxfill8                                ; 0A73 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A78 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0A7B _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0A7E _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0A81 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0A84 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0A87 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A8A _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0A8D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A90 _ 83. E8, 2F
        sub     esp, 4                                  ; 0A93 _ 83. EC, 04
        push    ebx                                     ; 0A96 _ 53
        push    ecx                                     ; 0A97 _ 51
        push    edx                                     ; 0A98 _ 52
        push    eax                                     ; 0A99 _ 50
        push    7                                       ; 0A9A _ 6A, 07
        push    dword [ebp+0CH]                         ; 0A9C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A9F _ FF. 75, 08
        call    boxfill8                                ; 0AA2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AA7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AAA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0AAD _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0AB0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0AB3 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0AB6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0AB9 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0ABC _ 8B. 45, 0C
        sub     eax, 3                                  ; 0ABF _ 83. E8, 03
        sub     esp, 4                                  ; 0AC2 _ 83. EC, 04
        push    ebx                                     ; 0AC5 _ 53
        push    ecx                                     ; 0AC6 _ 51
        push    edx                                     ; 0AC7 _ 52
        push    eax                                     ; 0AC8 _ 50
        push    7                                       ; 0AC9 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0ACB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0ACE _ FF. 75, 08
        call    boxfill8                                ; 0AD1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AD6 _ 83. C4, 20
        nop                                             ; 0AD9 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0ADA _ 8B. 5D, FC
        leave                                           ; 0ADD _ C9
        ret                                             ; 0ADE _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0ADF _ 55
        mov     ebp, esp                                ; 0AE0 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0AE2 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0AE5 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0AE8 _ A1, 00000114(d)
        add     eax, edx                                ; 0AED _ 01. D0
        mov     dword [mx], eax                         ; 0AEF _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0AF4 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0AF7 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0AFA _ A1, 00000118(d)
        add     eax, edx                                ; 0AFF _ 01. D0
        mov     dword [my], eax                         ; 0B01 _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0B06 _ A1, 00000114(d)
        test    eax, eax                                ; 0B0B _ 85. C0
        jns     ?_012                                   ; 0B0D _ 79, 0A
        mov     dword [mx], 0                           ; 0B0F _ C7. 05, 00000114(d), 00000000
?_012:  mov     eax, dword [my]                         ; 0B19 _ A1, 00000118(d)
        test    eax, eax                                ; 0B1E _ 85. C0
        jns     ?_013                                   ; 0B20 _ 79, 0A
        mov     dword [my], 0                           ; 0B22 _ C7. 05, 00000118(d), 00000000
?_013:  mov     edx, dword [xsize]                      ; 0B2C _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0B32 _ A1, 00000114(d)
        cmp     edx, eax                                ; 0B37 _ 39. C2
        jg  near      ?_014                                   ; 0b39 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 0B3B _ A1, 0000011C(d)
        dec     eax                                     ; 0B40 _ 48
        mov     dword [mx], eax                         ; 0B41 _ A3, 00000114(d)
?_014:  mov     edx, dword [ysize]                      ; 0B46 _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0B4C _ A1, 00000118(d)
        cmp     edx, eax                                ; 0B51 _ 39. C2
        jg  near      ?_015                                   ; 0b53 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 0B55 _ A1, 00000120(d)
        dec     eax                                     ; 0B5A _ 48
        mov     dword [my], eax                         ; 0B5B _ A3, 00000118(d)
?_015:  nop                                             ; 0B60 _ 90
        pop     ebp                                     ; 0B61 _ 5D
        ret                                             ; 0B62 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0B63 _ 55
        mov     ebp, esp                                ; 0B64 _ 89. E5
        sub     esp, 24                                 ; 0B66 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0B69 _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 0B6E _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0B71 _ C6. 45, F3, 00
        call    io_sti                                  ; 0B75 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0B7A _ 83. EC, 0C
        push    mouseinfo                               ; 0B7D _ 68, 00000024(d)
        call    fifo8_get                               ; 0B82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B87 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0B8A _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0B8D _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0B91 _ 83. EC, 08
        push    eax                                     ; 0B94 _ 50
        push    mdec                                    ; 0B95 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0B9A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B9F _ 83. C4, 10
        test    eax, eax                                ; 0BA2 _ 85. C0
        jz near       ?_016                                   ; 0ba4 _ 74, 60
        sub     esp, 4                                  ; 0BA6 _ 83. EC, 04
        push    mdec                                    ; 0BA9 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0BAE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BB1 _ FF. 75, 08
        call    computeMousePosition                    ; 0BB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BB9 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0BBC _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0BC2 _ A1, 00000114(d)
        push    edx                                     ; 0BC7 _ 52
        push    eax                                     ; 0BC8 _ 50
        push    dword [ebp+10H]                         ; 0BC9 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0BCC _ FF. 75, 08
        call    sheet_slide                             ; 0BCF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BD4 _ 83. C4, 10
        mov     eax, dword [?_196]                      ; 0BD7 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0BDC _ 83. E0, 01
        test    eax, eax                                ; 0BDF _ 85. C0
        jz near       ?_016                                   ; 0be1 _ 74, 23
        mov     eax, dword [my]                         ; 0BE3 _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 0BE8 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0BEB _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 0BF0 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0BF3 _ A1, 00000240(d)
        push    ecx                                     ; 0BF8 _ 51
        push    edx                                     ; 0BF9 _ 52
        push    eax                                     ; 0BFA _ 50
        push    dword [ebp+8H]                          ; 0BFB _ FF. 75, 08
        call    sheet_slide                             ; 0BFE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C03 _ 83. C4, 10
?_016:  nop                                             ; 0C06 _ 90
        leave                                           ; 0C07 _ C9
        ret                                             ; 0C08 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0C09 _ 55
        mov     ebp, esp                                ; 0C0A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0C0C _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0C0F _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0C15 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0C18 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0C1E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0C21 _ 66: C7. 40, 06, 01E0
        nop                                             ; 0C27 _ 90
        pop     ebp                                     ; 0C28 _ 5D
        ret                                             ; 0C29 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0C2A _ 55
        mov     ebp, esp                                ; 0C2B _ 89. E5
        push    ebx                                     ; 0C2D _ 53
        sub     esp, 36                                 ; 0C2E _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0C31 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0C34 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0C37 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0C3A _ 89. 45, F4
        jmp     ?_018                                   ; 0C3D _ EB, 3C

?_017:  mov     eax, dword [ebp+1CH]                    ; 0C3F _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0C42 _ 8A. 00
        movzx   eax, al                                 ; 0C44 _ 0F B6. C0
        shl     eax, 4                                  ; 0C47 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0C4A _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0C50 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0C54 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0C57 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0C5A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0C5D _ 8B. 00
        sub     esp, 8                                  ; 0C5F _ 83. EC, 08
        push    ebx                                     ; 0C62 _ 53
        push    ecx                                     ; 0C63 _ 51
        push    dword [ebp+14H]                         ; 0C64 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0C67 _ FF. 75, 10
        push    edx                                     ; 0C6A _ 52
        push    eax                                     ; 0C6B _ 50
        call    showFont8                               ; 0C6C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C71 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0C74 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0C78 _ FF. 45, 1C
?_018:  mov     eax, dword [ebp+1CH]                    ; 0C7B _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0C7E _ 8A. 00
        test    al, al                                  ; 0C80 _ 84. C0
        jnz near      ?_017                                   ; 0c82 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 0C84 _ 8B. 45, 14
        add     eax, 16                                 ; 0C87 _ 83. C0, 10
        sub     esp, 8                                  ; 0C8A _ 83. EC, 08
        push    eax                                     ; 0C8D _ 50
        push    dword [ebp+10H]                         ; 0C8E _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0C91 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0C94 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0C97 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C9A _ FF. 75, 08
        call    sheet_refresh                           ; 0C9D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CA2 _ 83. C4, 20
        nop                                             ; 0CA5 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0CA6 _ 8B. 5D, FC
        leave                                           ; 0CA9 _ C9
        ret                                             ; 0CAA _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0CAB _ 55
        mov     ebp, esp                                ; 0CAC _ 89. E5
        sub     esp, 8                                  ; 0CAE _ 83. EC, 08
        sub     esp, 4                                  ; 0CB1 _ 83. EC, 04
        push    table_rgb.1900                          ; 0CB4 _ 68, 00000080(d)
        push    15                                      ; 0CB9 _ 6A, 0F
        push    0                                       ; 0CBB _ 6A, 00
        call    set_palette                             ; 0CBD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CC2 _ 83. C4, 10
        nop                                             ; 0CC5 _ 90
        leave                                           ; 0CC6 _ C9
        ret                                             ; 0CC7 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0CC8 _ 55
        mov     ebp, esp                                ; 0CC9 _ 89. E5
        sub     esp, 24                                 ; 0CCB _ 83. EC, 18
        call    io_load_eflags                          ; 0CCE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0CD3 _ 89. 45, F0
        call    io_cli                                  ; 0CD6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CDB _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0CDE _ FF. 75, 08
        push    968                                     ; 0CE1 _ 68, 000003C8
        call    io_out8                                 ; 0CE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEB _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CEE _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0CF1 _ 89. 45, F4
        jmp     ?_020                                   ; 0CF4 _ EB, 5F

?_019:  mov     eax, dword [ebp+10H]                    ; 0CF6 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0CF9 _ 8A. 00
        shr     al, 2                                   ; 0CFB _ C0. E8, 02
        movzx   eax, al                                 ; 0CFE _ 0F B6. C0
        sub     esp, 8                                  ; 0D01 _ 83. EC, 08
        push    eax                                     ; 0D04 _ 50
        push    969                                     ; 0D05 _ 68, 000003C9
        call    io_out8                                 ; 0D0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D0F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0D12 _ 8B. 45, 10
        inc     eax                                     ; 0D15 _ 40
        mov     al, byte [eax]                          ; 0D16 _ 8A. 00
        shr     al, 2                                   ; 0D18 _ C0. E8, 02
        movzx   eax, al                                 ; 0D1B _ 0F B6. C0
        sub     esp, 8                                  ; 0D1E _ 83. EC, 08
        push    eax                                     ; 0D21 _ 50
        push    969                                     ; 0D22 _ 68, 000003C9
        call    io_out8                                 ; 0D27 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D2C _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0D2F _ 8B. 45, 10
        add     eax, 2                                  ; 0D32 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0D35 _ 8A. 00
        shr     al, 2                                   ; 0D37 _ C0. E8, 02
        movzx   eax, al                                 ; 0D3A _ 0F B6. C0
        sub     esp, 8                                  ; 0D3D _ 83. EC, 08
        push    eax                                     ; 0D40 _ 50
        push    969                                     ; 0D41 _ 68, 000003C9
        call    io_out8                                 ; 0D46 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D4B _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0D4E _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0D52 _ FF. 45, F4
?_020:  mov     eax, dword [ebp-0CH]                    ; 0D55 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0D58 _ 3B. 45, 0C
        jle near      ?_019                                   ; 0d5b _ 7e, 99
        sub     esp, 12                                 ; 0D5D _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0D60 _ FF. 75, F0
        call    io_store_eflags                         ; 0D63 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D68 _ 83. C4, 10
        nop                                             ; 0D6B _ 90
        leave                                           ; 0D6C _ C9
        ret                                             ; 0D6D _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0D6E _ 55
        mov     ebp, esp                                ; 0D6F _ 89. E5
        sub     esp, 20                                 ; 0D71 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0D74 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0D77 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0D7A _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0D7D _ 89. 45, F8
        jmp     ?_024                                   ; 0D80 _ EB, 30

?_021:  mov     eax, dword [ebp+14H]                    ; 0D82 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0D85 _ 89. 45, FC
        jmp     ?_023                                   ; 0D88 _ EB, 1D

?_022:  mov     eax, dword [ebp-8H]                     ; 0D8A _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0D8D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D91 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D93 _ 8B. 45, FC
        add     eax, edx                                ; 0D96 _ 01. D0
        mov     edx, eax                                ; 0D98 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D9A _ 8B. 45, 08
        add     edx, eax                                ; 0D9D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0D9F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0DA2 _ 88. 02
        inc     dword [ebp-4H]                          ; 0DA4 _ FF. 45, FC
?_023:  mov     eax, dword [ebp-4H]                     ; 0DA7 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0DAA _ 3B. 45, 1C
        jle near      ?_022                                   ; 0dad _ 7e, db
        inc     dword [ebp-8H]                          ; 0DAF _ FF. 45, F8
?_024:  mov     eax, dword [ebp-8H]                     ; 0DB2 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0DB5 _ 3B. 45, 20
        jle near      ?_021                                   ; 0db8 _ 7e, c8
        nop                                             ; 0DBA _ 90
        nop                                             ; 0DBB _ 90
        leave                                           ; 0DBC _ C9
        ret                                             ; 0DBD _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0DBE _ 55
        mov     ebp, esp                                ; 0DBF _ 89. E5
        sub     esp, 20                                 ; 0DC1 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0DC4 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0DC7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0DCA _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0DD1 _ E9, 00000162

?_025:  mov     edx, dword [ebp-4H]                     ; 0DD6 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0DD9 _ 8B. 45, 1C
        add     eax, edx                                ; 0DDC _ 01. D0
        mov     al, byte [eax]                          ; 0DDE _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0DE0 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0DE3 _ 80. 7D, FB, 00
        jns     ?_026                                   ; 0DE7 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0DE9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0DEC _ 8B. 45, FC
        add     eax, edx                                ; 0DEF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0DF1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0DF5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0DF7 _ 8B. 45, 10
        add     eax, edx                                ; 0DFA _ 01. D0
        mov     edx, eax                                ; 0DFC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DFE _ 8B. 45, 08
        add     edx, eax                                ; 0E01 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0E03 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0E06 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0E08 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0E0C _ 83. E0, 40
        test    eax, eax                                ; 0E0F _ 85. C0
        jz near       ?_027                                   ; 0e11 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0E13 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0E16 _ 8B. 45, FC
        add     eax, edx                                ; 0E19 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E1B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E1F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E21 _ 8B. 45, 10
        add     eax, edx                                ; 0E24 _ 01. D0
        lea     edx, [eax+1H]                           ; 0E26 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E29 _ 8B. 45, 08
        add     edx, eax                                ; 0E2C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0E2E _ 8A. 45, EC
        mov     byte [edx], al                          ; 0E31 _ 88. 02
?_027:  movsx   eax, byte [ebp-5H]                      ; 0E33 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0E37 _ 83. E0, 20
        test    eax, eax                                ; 0E3A _ 85. C0
        jz near       ?_028                                   ; 0e3c _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0E3E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0E41 _ 8B. 45, FC
        add     eax, edx                                ; 0E44 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E46 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E4A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E4C _ 8B. 45, 10
        add     eax, edx                                ; 0E4F _ 01. D0
        lea     edx, [eax+2H]                           ; 0E51 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0E54 _ 8B. 45, 08
        add     edx, eax                                ; 0E57 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0E59 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0E5C _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0E5E _ 0F BE. 45, FB
        and     eax, 10H                                ; 0E62 _ 83. E0, 10
        test    eax, eax                                ; 0E65 _ 85. C0
        jz near       ?_029                                   ; 0e67 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0E69 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0E6C _ 8B. 45, FC
        add     eax, edx                                ; 0E6F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E71 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E75 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E77 _ 8B. 45, 10
        add     eax, edx                                ; 0E7A _ 01. D0
        lea     edx, [eax+3H]                           ; 0E7C _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0E7F _ 8B. 45, 08
        add     edx, eax                                ; 0E82 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0E84 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0E87 _ 88. 02
?_029:  movsx   eax, byte [ebp-5H]                      ; 0E89 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0E8D _ 83. E0, 08
        test    eax, eax                                ; 0E90 _ 85. C0
        jz near       ?_030                                   ; 0e92 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0E94 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0E97 _ 8B. 45, FC
        add     eax, edx                                ; 0E9A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E9C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EA0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EA2 _ 8B. 45, 10
        add     eax, edx                                ; 0EA5 _ 01. D0
        lea     edx, [eax+4H]                           ; 0EA7 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EAA _ 8B. 45, 08
        add     edx, eax                                ; 0EAD _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0EAF _ 8A. 45, EC
        mov     byte [edx], al                          ; 0EB2 _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 0EB4 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0EB8 _ 83. E0, 04
        test    eax, eax                                ; 0EBB _ 85. C0
        jz near       ?_031                                   ; 0ebd _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0EBF _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0EC2 _ 8B. 45, FC
        add     eax, edx                                ; 0EC5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EC7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0ECB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0ECD _ 8B. 45, 10
        add     eax, edx                                ; 0ED0 _ 01. D0
        lea     edx, [eax+5H]                           ; 0ED2 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0ED5 _ 8B. 45, 08
        add     edx, eax                                ; 0ED8 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0EDA _ 8A. 45, EC
        mov     byte [edx], al                          ; 0EDD _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 0EDF _ 0F BE. 45, FB
        and     eax, 02H                                ; 0EE3 _ 83. E0, 02
        test    eax, eax                                ; 0EE6 _ 85. C0
        jz near       ?_032                                   ; 0ee8 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0EEA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0EED _ 8B. 45, FC
        add     eax, edx                                ; 0EF0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EF2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EF6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EF8 _ 8B. 45, 10
        add     eax, edx                                ; 0EFB _ 01. D0
        lea     edx, [eax+6H]                           ; 0EFD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0F00 _ 8B. 45, 08
        add     edx, eax                                ; 0F03 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0F05 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0F08 _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 0F0A _ 0F BE. 45, FB
        and     eax, 01H                                ; 0F0E _ 83. E0, 01
        test    eax, eax                                ; 0F11 _ 85. C0
        jz near       ?_033                                   ; 0f13 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0F15 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0F18 _ 8B. 45, FC
        add     eax, edx                                ; 0F1B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F1D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F21 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F23 _ 8B. 45, 10
        add     eax, edx                                ; 0F26 _ 01. D0
        lea     edx, [eax+7H]                           ; 0F28 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0F2B _ 8B. 45, 08
        add     edx, eax                                ; 0F2E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0F30 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0F33 _ 88. 02
?_033:  inc     dword [ebp-4H]                          ; 0F35 _ FF. 45, FC
?_034:  cmp     dword [ebp-4H], 15                      ; 0F38 _ 83. 7D, FC, 0F
        jle near      ?_025                                   ; 0f3c _ 0f 8e, fffffe94
        nop                                             ; 0F42 _ 90
        nop                                             ; 0F43 _ 90
        leave                                           ; 0F44 _ C9
        ret                                             ; 0F45 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0F46 _ 55
        mov     ebp, esp                                ; 0F47 _ 89. E5
        sub     esp, 20                                 ; 0F49 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0F4C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0F4F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0F52 _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 0F59 _ E9, 000000AB

?_035:  mov     dword [ebp-4H], 0                       ; 0F5E _ C7. 45, FC, 00000000
        jmp     ?_040                                   ; 0F65 _ E9, 00000092

?_036:  mov     eax, dword [ebp-8H]                     ; 0F6A _ 8B. 45, F8
        shl     eax, 4                                  ; 0F6D _ C1. E0, 04
        mov     edx, eax                                ; 0F70 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0F72 _ 8B. 45, FC
        add     eax, edx                                ; 0F75 _ 01. D0
        add     eax, cursor.1947                        ; 0F77 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0F7C _ 8A. 00
        cmp     al, 42                                  ; 0F7E _ 3C, 2A
        jnz near      ?_037                                   ; 0f80 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0F82 _ 8B. 45, F8
        shl     eax, 4                                  ; 0F85 _ C1. E0, 04
        mov     edx, eax                                ; 0F88 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0F8A _ 8B. 45, FC
        add     eax, edx                                ; 0F8D _ 01. D0
        mov     edx, eax                                ; 0F8F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F91 _ 8B. 45, 08
        add     eax, edx                                ; 0F94 _ 01. D0
        mov     byte [eax], 0                           ; 0F96 _ C6. 00, 00
?_037:  mov     eax, dword [ebp-8H]                     ; 0F99 _ 8B. 45, F8
        shl     eax, 4                                  ; 0F9C _ C1. E0, 04
        mov     edx, eax                                ; 0F9F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FA1 _ 8B. 45, FC
        add     eax, edx                                ; 0FA4 _ 01. D0
        add     eax, cursor.1947                        ; 0FA6 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0FAB _ 8A. 00
        cmp     al, 79                                  ; 0FAD _ 3C, 4F
        jnz near      ?_038                                   ; 0faf _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0FB1 _ 8B. 45, F8
        shl     eax, 4                                  ; 0FB4 _ C1. E0, 04
        mov     edx, eax                                ; 0FB7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FB9 _ 8B. 45, FC
        add     eax, edx                                ; 0FBC _ 01. D0
        mov     edx, eax                                ; 0FBE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FC0 _ 8B. 45, 08
        add     eax, edx                                ; 0FC3 _ 01. D0
        mov     byte [eax], 7                           ; 0FC5 _ C6. 00, 07
?_038:  mov     eax, dword [ebp-8H]                     ; 0FC8 _ 8B. 45, F8
        shl     eax, 4                                  ; 0FCB _ C1. E0, 04
        mov     edx, eax                                ; 0FCE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FD0 _ 8B. 45, FC
        add     eax, edx                                ; 0FD3 _ 01. D0
        add     eax, cursor.1947                        ; 0FD5 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0FDA _ 8A. 00
        cmp     al, 46                                  ; 0FDC _ 3C, 2E
        jnz near      ?_039                                   ; 0fde _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0FE0 _ 8B. 45, F8
        shl     eax, 4                                  ; 0FE3 _ C1. E0, 04
        mov     edx, eax                                ; 0FE6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FE8 _ 8B. 45, FC
        add     eax, edx                                ; 0FEB _ 01. D0
        mov     edx, eax                                ; 0FED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FEF _ 8B. 45, 08
        add     edx, eax                                ; 0FF2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0FF4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0FF7 _ 88. 02
?_039:  inc     dword [ebp-4H]                          ; 0FF9 _ FF. 45, FC
?_040:  cmp     dword [ebp-4H], 15                      ; 0FFC _ 83. 7D, FC, 0F
        jle near      ?_036                                   ; 1000 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 1006 _ FF. 45, F8
?_041:  cmp     dword [ebp-8H], 15                      ; 1009 _ 83. 7D, F8, 0F
        jle near      ?_035                                   ; 100d _ 0f 8e, ffffff4b
        nop                                             ; 1013 _ 90
        nop                                             ; 1014 _ 90
        leave                                           ; 1015 _ C9
        ret                                             ; 1016 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1017 _ 55
        mov     ebp, esp                                ; 1018 _ 89. E5
        push    ebx                                     ; 101A _ 53
        sub     esp, 16                                 ; 101B _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 101E _ C7. 45, F4, 00000000
        jmp     ?_045                                   ; 1025 _ EB, 4D

?_042:  mov     dword [ebp-8H], 0                       ; 1027 _ C7. 45, F8, 00000000
        jmp     ?_044                                   ; 102E _ EB, 39

?_043:  mov     eax, dword [ebp-0CH]                    ; 1030 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1033 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1037 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1039 _ 8B. 45, F8
        add     eax, edx                                ; 103C _ 01. D0
        mov     edx, eax                                ; 103E _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 1040 _ 8B. 45, 20
        add     eax, edx                                ; 1043 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1045 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 1048 _ 8B. 55, F4
        add     edx, ecx                                ; 104B _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 104D _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 1051 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1054 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1057 _ 01. D9
        add     edx, ecx                                ; 1059 _ 01. CA
        mov     ecx, edx                                ; 105B _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 105D _ 8B. 55, 08
        add     edx, ecx                                ; 1060 _ 01. CA
        mov     al, byte [eax]                          ; 1062 _ 8A. 00
        mov     byte [edx], al                          ; 1064 _ 88. 02
        inc     dword [ebp-8H]                          ; 1066 _ FF. 45, F8
?_044:  mov     eax, dword [ebp-8H]                     ; 1069 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 106C _ 3B. 45, 10
        jl      ?_043                                   ; 106F _ 7C, BF
        inc     dword [ebp-0CH]                         ; 1071 _ FF. 45, F4
?_045:  mov     eax, dword [ebp-0CH]                    ; 1074 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1077 _ 3B. 45, 14
        jl      ?_042                                   ; 107A _ 7C, AB
        nop                                             ; 107C _ 90
        nop                                             ; 107D _ 90
        add     esp, 16                                 ; 107E _ 83. C4, 10
        pop     ebx                                     ; 1081 _ 5B
        pop     ebp                                     ; 1082 _ 5D
        ret                                             ; 1083 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1084 _ 55
        mov     ebp, esp                                ; 1085 _ 89. E5
        sub     esp, 24                                 ; 1087 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 108A _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 108F _ 89. 45, F4
        mov     eax, dword [?_193]                      ; 1092 _ A1, 00000004(d)
        cwde                                            ; 1097 _ 98
        mov     dword [ebp-10H], eax                    ; 1098 _ 89. 45, F0
        mov     ax, word [?_194]                        ; 109B _ 66: A1, 00000006(d)
        cwde                                            ; 10A1 _ 98
        mov     dword [ebp-14H], eax                    ; 10A2 _ 89. 45, EC
        sub     esp, 8                                  ; 10A5 _ 83. EC, 08
        push    32                                      ; 10A8 _ 6A, 20
        push    32                                      ; 10AA _ 6A, 20
        call    io_out8                                 ; 10AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10B1 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 10B4 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 10B8 _ 83. EC, 0C
        push    96                                      ; 10BB _ 6A, 60
        call    io_in8                                  ; 10BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10C2 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 10C5 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 10C8 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 10CC _ 83. EC, 08
        push    eax                                     ; 10CF _ 50
        push    keyinfo                                 ; 10D0 _ 68, 00000008(d)
        call    fifo8_put                               ; 10D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10DA _ 83. C4, 10
        nop                                             ; 10DD _ 90
        leave                                           ; 10DE _ C9
        ret                                             ; 10DF _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 10E0 _ 55
        mov     ebp, esp                                ; 10E1 _ 89. E5
        sub     esp, 4                                  ; 10E3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 10E6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 10E9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 10EC _ 80. 7D, FC, 09
        jle near      ?_046                                   ; 10f0 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 10F2 _ 8A. 45, FC
        add     eax, 55                                 ; 10F5 _ 83. C0, 37
        jmp     ?_047                                   ; 10F8 _ EB, 06

?_046:  mov     al, byte [ebp-4H]                       ; 10FA _ 8A. 45, FC
        add     eax, 48                                 ; 10FD _ 83. C0, 30
?_047:  leave                                           ; 1100 _ C9
        ret                                             ; 1101 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1102 _ 55
        mov     ebp, esp                                ; 1103 _ 89. E5
        sub     esp, 20                                 ; 1105 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 1108 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 110B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 110E _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1115 _ 8A. 45, EC
        and     eax, 0FH                                ; 1118 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 111B _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 111E _ 0F BE. 45, FB
        push    eax                                     ; 1122 _ 50
        call    charToHexVal                            ; 1123 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1128 _ 83. C4, 04
        mov     byte [?_192], al                        ; 112B _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 1130 _ 8A. 45, EC
        shr     al, 4                                   ; 1133 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1136 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 1139 _ 8A. 45, EC
        movsx   eax, al                                 ; 113C _ 0F BE. C0
        push    eax                                     ; 113F _ 50
        call    charToHexVal                            ; 1140 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1145 _ 83. C4, 04
        mov     byte [?_191], al                        ; 1148 _ A2, 00000076(d)
        mov     eax, keyval                             ; 114D _ B8, 00000074(d)
        leave                                           ; 1152 _ C9
        ret                                             ; 1153 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1154 _ 55
        mov     ebp, esp                                ; 1155 _ 89. E5
        sub     esp, 16                                 ; 1157 _ 83. EC, 10
        mov     byte [str.1995], 48                     ; 115A _ C6. 05, 0000026C(d), 30
        mov     byte [?_197], 88                        ; 1161 _ C6. 05, 0000026D(d), 58
        mov     byte [?_198], 0                         ; 1168 _ C6. 05, 00000276(d), 00
        mov     dword [ebp-4H], 2                       ; 116F _ C7. 45, FC, 00000002
        jmp     ?_049                                   ; 1176 _ EB, 0E

?_048:  mov     eax, dword [ebp-4H]                     ; 1178 _ 8B. 45, FC
        add     eax, str.1995                           ; 117B _ 05, 0000026C(d)
        mov     byte [eax], 48                          ; 1180 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1183 _ FF. 45, FC
?_049:  cmp     dword [ebp-4H], 9                       ; 1186 _ 83. 7D, FC, 09
        jle near      ?_048                                   ; 118a _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 118C _ C7. 45, F8, 00000009
        jmp     ?_053                                   ; 1193 _ EB, 41

?_050:  mov     eax, dword [ebp+8H]                     ; 1195 _ 8B. 45, 08
        and     eax, 0FH                                ; 1198 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 119B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 119E _ 8B. 45, 08
        shr     eax, 4                                  ; 11A1 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 11A4 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 11A7 _ 83. 7D, F4, 09
        jle near      ?_051                                   ; 11ab _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 11AD _ 8B. 45, F4
        add     eax, 55                                 ; 11B0 _ 83. C0, 37
        mov     dl, al                                  ; 11B3 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 11B5 _ 8B. 45, F8
        add     eax, str.1995                           ; 11B8 _ 05, 0000026C(d)
        mov     byte [eax], dl                          ; 11BD _ 88. 10
        jmp     ?_052                                   ; 11BF _ EB, 12

?_051:  mov     eax, dword [ebp-0CH]                    ; 11C1 _ 8B. 45, F4
        add     eax, 48                                 ; 11C4 _ 83. C0, 30
        mov     dl, al                                  ; 11C7 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 11C9 _ 8B. 45, F8
        add     eax, str.1995                           ; 11CC _ 05, 0000026C(d)
        mov     byte [eax], dl                          ; 11D1 _ 88. 10
?_052:  dec     dword [ebp-8H]                          ; 11D3 _ FF. 4D, F8
?_053:  cmp     dword [ebp-8H], 1                       ; 11D6 _ 83. 7D, F8, 01
        jle near      ?_054                                   ; 11da _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 11DC _ 83. 7D, 08, 00
        jnz near      ?_050                                   ; 11e0 _ 75, b3
?_054:  mov     eax, str.1995                           ; 11E2 _ B8, 0000026C(d)
        leave                                           ; 11E7 _ C9
        ret                                             ; 11E8 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 11E9 _ 55
        mov     ebp, esp                                ; 11EA _ 89. E5
        sub     esp, 8                                  ; 11EC _ 83. EC, 08
?_055:  sub     esp, 12                                 ; 11EF _ 83. EC, 0C
        push    100                                     ; 11F2 _ 6A, 64
        call    io_in8                                  ; 11F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F9 _ 83. C4, 10
        and     eax, 02H                                ; 11FC _ 83. E0, 02
        test    eax, eax                                ; 11FF _ 85. C0
        jz near       ?_056                                   ; 1201 _ 74, 02
        jmp     ?_055                                   ; 1203 _ EB, EA

?_056:  nop                                             ; 1205 _ 90
        nop                                             ; 1206 _ 90
        leave                                           ; 1207 _ C9
        ret                                             ; 1208 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1209 _ 55
        mov     ebp, esp                                ; 120A _ 89. E5
        sub     esp, 8                                  ; 120C _ 83. EC, 08
        call    wait_KBC_sendready                      ; 120F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1214 _ 83. EC, 08
        push    96                                      ; 1217 _ 6A, 60
        push    100                                     ; 1219 _ 6A, 64
        call    io_out8                                 ; 121B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1220 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1223 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1228 _ 83. EC, 08
        push    71                                      ; 122B _ 6A, 47
        push    96                                      ; 122D _ 6A, 60
        call    io_out8                                 ; 122F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1234 _ 83. C4, 10
        nop                                             ; 1237 _ 90
        leave                                           ; 1238 _ C9
        ret                                             ; 1239 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 123A _ 55
        mov     ebp, esp                                ; 123B _ 89. E5
        sub     esp, 8                                  ; 123D _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1240 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1245 _ 83. EC, 08
        push    212                                     ; 1248 _ 68, 000000D4
        push    100                                     ; 124D _ 6A, 64
        call    io_out8                                 ; 124F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1254 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1257 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 125C _ 83. EC, 08
        push    244                                     ; 125F _ 68, 000000F4
        push    96                                      ; 1264 _ 6A, 60
        call    io_out8                                 ; 1266 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 126B _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 126E _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 1271 _ C6. 40, 03, 00
        nop                                             ; 1275 _ 90
        leave                                           ; 1276 _ C9
        ret                                             ; 1277 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1278 _ 55
        mov     ebp, esp                                ; 1279 _ 89. E5
        sub     esp, 24                                 ; 127B _ 83. EC, 18
        sub     esp, 8                                  ; 127E _ 83. EC, 08
        push    32                                      ; 1281 _ 6A, 20
        push    160                                     ; 1283 _ 68, 000000A0
        call    io_out8                                 ; 1288 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 128D _ 83. C4, 10
        sub     esp, 8                                  ; 1290 _ 83. EC, 08
        push    32                                      ; 1293 _ 6A, 20
        push    32                                      ; 1295 _ 6A, 20
        call    io_out8                                 ; 1297 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 129C _ 83. C4, 10
        sub     esp, 12                                 ; 129F _ 83. EC, 0C
        push    96                                      ; 12A2 _ 6A, 60
        call    io_in8                                  ; 12A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12A9 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 12AC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 12AF _ 0F B6. 45, F7
        sub     esp, 8                                  ; 12B3 _ 83. EC, 08
        push    eax                                     ; 12B6 _ 50
        push    mouseinfo                               ; 12B7 _ 68, 00000024(d)
        call    fifo8_put                               ; 12BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12C1 _ 83. C4, 10
        nop                                             ; 12C4 _ 90
        leave                                           ; 12C5 _ C9
        ret                                             ; 12C6 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 12C7 _ 55
        mov     ebp, esp                                ; 12C8 _ 89. E5
        sub     esp, 4                                  ; 12CA _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 12CD _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 12D0 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 12D3 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 12D6 _ 8A. 40, 03
        test    al, al                                  ; 12D9 _ 84. C0
        jnz near      ?_058                                   ; 12db _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 12DD _ 80. 7D, FC, FA
        jnz near      ?_057                                   ; 12e1 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 12E3 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 12E6 _ C6. 40, 03, 01
?_057:  mov     eax, 0                                  ; 12EA _ B8, 00000000
        jmp     ?_065                                   ; 12EF _ E9, 00000104

?_058:  mov     eax, dword [ebp+8H]                     ; 12F4 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 12F7 _ 8A. 40, 03
        cmp     al, 1                                   ; 12FA _ 3C, 01
        jnz near      ?_060                                   ; 12fc _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 12FE _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1302 _ 25, 000000C8
        cmp     eax, 8                                  ; 1307 _ 83. F8, 08
        jnz near      ?_059                                   ; 130a _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 130C _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 130F _ 8A. 55, FC
        mov     byte [eax], dl                          ; 1312 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1314 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1317 _ C6. 40, 03, 02
?_059:  mov     eax, 0                                  ; 131B _ B8, 00000000
        jmp     ?_065                                   ; 1320 _ E9, 000000D3

?_060:  mov     eax, dword [ebp+8H]                     ; 1325 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1328 _ 8A. 40, 03
        cmp     al, 2                                   ; 132B _ 3C, 02
        jnz near      ?_061                                   ; 132d _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 132F _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1332 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1335 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1338 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 133B _ C6. 40, 03, 03
        mov     eax, 0                                  ; 133F _ B8, 00000000
        jmp     ?_065                                   ; 1344 _ E9, 000000AF

?_061:  mov     eax, dword [ebp+8H]                     ; 1349 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 134C _ 8A. 40, 03
        cmp     al, 3                                   ; 134F _ 3C, 03
        jne near      ?_064                                   ; 1351 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 1357 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 135A _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 135D _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1360 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1363 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1367 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 136A _ 8A. 00
        movzx   eax, al                                 ; 136C _ 0F B6. C0
        and     eax, 07H                                ; 136F _ 83. E0, 07
        mov     edx, eax                                ; 1372 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1374 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1377 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 137A _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 137D _ 8A. 40, 01
        movzx   edx, al                                 ; 1380 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1383 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1386 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1389 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 138C _ 8A. 40, 02
        movzx   edx, al                                 ; 138F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1392 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1395 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1398 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 139B _ 8A. 00
        movzx   eax, al                                 ; 139D _ 0F B6. C0
        and     eax, 10H                                ; 13A0 _ 83. E0, 10
        test    eax, eax                                ; 13A3 _ 85. C0
        jz near       ?_062                                   ; 13a5 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 13A7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 13AA _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 13AD _ 0D, FFFFFF00
        mov     edx, eax                                ; 13B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13B4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 13B7 _ 89. 50, 04
?_062:  mov     eax, dword [ebp+8H]                     ; 13BA _ 8B. 45, 08
        mov     al, byte [eax]                          ; 13BD _ 8A. 00
        movzx   eax, al                                 ; 13BF _ 0F B6. C0
        and     eax, 20H                                ; 13C2 _ 83. E0, 20
        test    eax, eax                                ; 13C5 _ 85. C0
        jz near       ?_063                                   ; 13c7 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 13C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 13CC _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 13CF _ 0D, FFFFFF00
        mov     edx, eax                                ; 13D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13D6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 13D9 _ 89. 50, 08
?_063:  mov     eax, dword [ebp+8H]                     ; 13DC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 13DF _ 8B. 40, 08
        neg     eax                                     ; 13E2 _ F7. D8
        mov     edx, eax                                ; 13E4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13E6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 13E9 _ 89. 50, 08
        mov     eax, 1                                  ; 13EC _ B8, 00000001
        jmp     ?_065                                   ; 13F1 _ EB, 05

?_064:  mov     eax, 4294967295                         ; 13F3 _ B8, FFFFFFFF
?_065:  leave                                           ; 13F8 _ C9
        ret                                             ; 13F9 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 13FA _ 55
        mov     ebp, esp                                ; 13FB _ 89. E5
        sub     esp, 40                                 ; 13FD _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 1400 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1407 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 140E _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1415 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 141C _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 1422 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1425 _ 8B. 00
        sub     esp, 4                                  ; 1427 _ 83. EC, 04
        push    edx                                     ; 142A _ 52
        push    dword [ebp+1CH]                         ; 142B _ FF. 75, 1C
        push    eax                                     ; 142E _ 50
        call    init_screen8                            ; 142F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1434 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1437 _ 8B. 45, 20
        movsx   eax, al                                 ; 143A _ 0F BE. C0
        sub     esp, 8                                  ; 143D _ 83. EC, 08
        push    ?_187                                   ; 1440 _ 68, 00000020(d)
        push    eax                                     ; 1445 _ 50
        push    dword [ebp-10H]                         ; 1446 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1449 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 144C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 144F _ FF. 75, 08
        call    showString                              ; 1452 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1457 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 145A _ 8B. 45, 18
        sub     esp, 12                                 ; 145D _ 83. EC, 0C
        push    eax                                     ; 1460 _ 50
        call    intToHexStr                             ; 1461 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1466 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1469 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 146C _ 8B. 45, 20
        movsx   eax, al                                 ; 146F _ 0F BE. C0
        sub     esp, 8                                  ; 1472 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1475 _ FF. 75, E4
        push    eax                                     ; 1478 _ 50
        push    dword [ebp-10H]                         ; 1479 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 147C _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 147F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1482 _ FF. 75, 08
        call    showString                              ; 1485 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 148A _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 148D _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1491 _ 8B. 45, 20
        movsx   eax, al                                 ; 1494 _ 0F BE. C0
        sub     esp, 8                                  ; 1497 _ 83. EC, 08
        push    ?_188                                   ; 149A _ 68, 0000002A(d)
        push    eax                                     ; 149F _ 50
        push    dword [ebp-10H]                         ; 14A0 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 14A3 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 14A6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14A9 _ FF. 75, 08
        call    showString                              ; 14AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14B1 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 14B4 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 14B7 _ 8B. 00
        sub     esp, 12                                 ; 14B9 _ 83. EC, 0C
        push    eax                                     ; 14BC _ 50
        call    intToHexStr                             ; 14BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14C2 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 14C5 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 14C8 _ 8B. 45, 20
        movsx   eax, al                                 ; 14CB _ 0F BE. C0
        sub     esp, 8                                  ; 14CE _ 83. EC, 08
        push    dword [ebp-20H]                         ; 14D1 _ FF. 75, E0
        push    eax                                     ; 14D4 _ 50
        push    dword [ebp-10H]                         ; 14D5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 14D8 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 14DB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 14DE _ FF. 75, 08
        call    showString                              ; 14E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 14E6 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 14E9 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 14ED _ 8B. 45, 20
        movsx   eax, al                                 ; 14F0 _ 0F BE. C0
        sub     esp, 8                                  ; 14F3 _ 83. EC, 08
        push    ?_189                                   ; 14F6 _ 68, 00000036(d)
        push    eax                                     ; 14FB _ 50
        push    dword [ebp-10H]                         ; 14FC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 14FF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1502 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1505 _ FF. 75, 08
        call    showString                              ; 1508 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 150D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1510 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1513 _ 8B. 40, 04
        sub     esp, 12                                 ; 1516 _ 83. EC, 0C
        push    eax                                     ; 1519 _ 50
        call    intToHexStr                             ; 151A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 151F _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1522 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1525 _ 8B. 45, 20
        movsx   eax, al                                 ; 1528 _ 0F BE. C0
        sub     esp, 8                                  ; 152B _ 83. EC, 08
        push    dword [ebp-24H]                         ; 152E _ FF. 75, DC
        push    eax                                     ; 1531 _ 50
        push    dword [ebp-10H]                         ; 1532 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1535 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1538 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 153B _ FF. 75, 08
        call    showString                              ; 153E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1543 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1546 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 154A _ 8B. 45, 20
        movsx   eax, al                                 ; 154D _ 0F BE. C0
        sub     esp, 8                                  ; 1550 _ 83. EC, 08
        push    ?_190                                   ; 1553 _ 68, 00000042(d)
        push    eax                                     ; 1558 _ 50
        push    dword [ebp-10H]                         ; 1559 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 155C _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 155F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1562 _ FF. 75, 08
        call    showString                              ; 1565 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 156A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 156D _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1570 _ 8B. 40, 08
        sub     esp, 12                                 ; 1573 _ 83. EC, 0C
        push    eax                                     ; 1576 _ 50
        call    intToHexStr                             ; 1577 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 157C _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 157F _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1582 _ 8B. 45, 20
        movsx   eax, al                                 ; 1585 _ 0F BE. C0
        sub     esp, 8                                  ; 1588 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 158B _ FF. 75, D8
        push    eax                                     ; 158E _ 50
        push    dword [ebp-10H]                         ; 158F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1592 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1595 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1598 _ FF. 75, 08
        call    showString                              ; 159B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15A0 _ 83. C4, 20
        nop                                             ; 15A3 _ 90
        leave                                           ; 15A4 _ C9
        ret                                             ; 15A5 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 15A6 _ 55
        mov     ebp, esp                                ; 15A7 _ 89. E5
        sub     esp, 24                                 ; 15A9 _ 83. EC, 18
        sub     esp, 12                                 ; 15AC _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 15AF _ FF. 75, 08
        call    sheet_alloc                             ; 15B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15B7 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 15BA _ 89. 45, F4
        mov     eax, dword [memman]                     ; 15BD _ A1, 00000000(d)
        sub     esp, 8                                  ; 15C2 _ 83. EC, 08
        push    10880                                   ; 15C5 _ 68, 00002A80
        push    eax                                     ; 15CA _ 50
        call    memman_alloc_4k                         ; 15CB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15D0 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 15D3 _ 89. 45, F0
        sub     esp, 12                                 ; 15D6 _ 83. EC, 0C
        push    -1                                      ; 15D9 _ 6A, FF
        push    68                                      ; 15DB _ 6A, 44
        push    160                                     ; 15DD _ 68, 000000A0
        push    dword [ebp-10H]                         ; 15E2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 15E5 _ FF. 75, F4
        call    sheet_setbuf                            ; 15E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 15ED _ 83. C4, 20
        sub     esp, 4                                  ; 15F0 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 15F3 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 15F6 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 15F9 _ FF. 75, 08
        call    make_window8                            ; 15FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1601 _ 83. C4, 10
        sub     esp, 8                                  ; 1604 _ 83. EC, 08
        push    7                                       ; 1607 _ 6A, 07
        push    16                                      ; 1609 _ 6A, 10
        push    144                                     ; 160B _ 68, 00000090
        push    28                                      ; 1610 _ 6A, 1C
        push    8                                       ; 1612 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1614 _ FF. 75, F4
        call    make_textbox8                           ; 1617 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 161C _ 83. C4, 20
        push    72                                      ; 161F _ 6A, 48
        push    160                                     ; 1621 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 1626 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1629 _ FF. 75, 08
        call    sheet_slide                             ; 162C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1631 _ 83. C4, 10
        sub     esp, 4                                  ; 1634 _ 83. EC, 04
        push    2                                       ; 1637 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1639 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 163C _ FF. 75, 08
        call    sheet_updown                            ; 163F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1644 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1647 _ 8B. 45, F4
        leave                                           ; 164A _ C9
        ret                                             ; 164B _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 164C _ 55
        mov     ebp, esp                                ; 164D _ 89. E5
        push    ebx                                     ; 164F _ 53
        sub     esp, 36                                 ; 1650 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1653 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1656 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1659 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 165C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 165F _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1662 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1665 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1668 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 166B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 166E _ 8B. 00
        push    0                                       ; 1670 _ 6A, 00
        push    edx                                     ; 1672 _ 52
        push    0                                       ; 1673 _ 6A, 00
        push    0                                       ; 1675 _ 6A, 00
        push    8                                       ; 1677 _ 6A, 08
        push    dword [ebp-18H]                         ; 1679 _ FF. 75, E8
        push    eax                                     ; 167C _ 50
        call    boxfill8                                ; 167D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1682 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1685 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1688 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 168B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 168E _ 8B. 00
        push    1                                       ; 1690 _ 6A, 01
        push    edx                                     ; 1692 _ 52
        push    1                                       ; 1693 _ 6A, 01
        push    1                                       ; 1695 _ 6A, 01
        push    7                                       ; 1697 _ 6A, 07
        push    dword [ebp-18H]                         ; 1699 _ FF. 75, E8
        push    eax                                     ; 169C _ 50
        call    boxfill8                                ; 169D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16A2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 16A5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 16A8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 16AB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16AE _ 8B. 00
        push    edx                                     ; 16B0 _ 52
        push    0                                       ; 16B1 _ 6A, 00
        push    0                                       ; 16B3 _ 6A, 00
        push    0                                       ; 16B5 _ 6A, 00
        push    8                                       ; 16B7 _ 6A, 08
        push    dword [ebp-18H]                         ; 16B9 _ FF. 75, E8
        push    eax                                     ; 16BC _ 50
        call    boxfill8                                ; 16BD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16C2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 16C5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 16C8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 16CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16CE _ 8B. 00
        push    edx                                     ; 16D0 _ 52
        push    1                                       ; 16D1 _ 6A, 01
        push    1                                       ; 16D3 _ 6A, 01
        push    1                                       ; 16D5 _ 6A, 01
        push    7                                       ; 16D7 _ 6A, 07
        push    dword [ebp-18H]                         ; 16D9 _ FF. 75, E8
        push    eax                                     ; 16DC _ 50
        call    boxfill8                                ; 16DD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 16E2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 16E5 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 16E8 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 16EB _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 16EE _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 16F1 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 16F4 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 16F7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16FA _ 8B. 00
        push    ebx                                     ; 16FC _ 53
        push    ecx                                     ; 16FD _ 51
        push    1                                       ; 16FE _ 6A, 01
        push    edx                                     ; 1700 _ 52
        push    15                                      ; 1701 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1703 _ FF. 75, E8
        push    eax                                     ; 1706 _ 50
        call    boxfill8                                ; 1707 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 170C _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 170F _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1712 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1715 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1718 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 171B _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 171E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1721 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1724 _ 8B. 00
        push    ebx                                     ; 1726 _ 53
        push    ecx                                     ; 1727 _ 51
        push    0                                       ; 1728 _ 6A, 00
        push    edx                                     ; 172A _ 52
        push    0                                       ; 172B _ 6A, 00
        push    dword [ebp-18H]                         ; 172D _ FF. 75, E8
        push    eax                                     ; 1730 _ 50
        call    boxfill8                                ; 1731 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1736 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1739 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 173C _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 173F _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1742 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1745 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1748 _ 8B. 00
        push    ecx                                     ; 174A _ 51
        push    edx                                     ; 174B _ 52
        push    2                                       ; 174C _ 6A, 02
        push    2                                       ; 174E _ 6A, 02
        push    8                                       ; 1750 _ 6A, 08
        push    dword [ebp-18H]                         ; 1752 _ FF. 75, E8
        push    eax                                     ; 1755 _ 50
        call    boxfill8                                ; 1756 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 175B _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 175E _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1761 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1764 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1767 _ 8B. 00
        push    20                                      ; 1769 _ 6A, 14
        push    edx                                     ; 176B _ 52
        push    3                                       ; 176C _ 6A, 03
        push    3                                       ; 176E _ 6A, 03
        push    12                                      ; 1770 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1772 _ FF. 75, E8
        push    eax                                     ; 1775 _ 50
        call    boxfill8                                ; 1776 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 177B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 177E _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1781 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1784 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1787 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 178A _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 178D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1790 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1793 _ 8B. 00
        push    ebx                                     ; 1795 _ 53
        push    ecx                                     ; 1796 _ 51
        push    edx                                     ; 1797 _ 52
        push    1                                       ; 1798 _ 6A, 01
        push    15                                      ; 179A _ 6A, 0F
        push    dword [ebp-18H]                         ; 179C _ FF. 75, E8
        push    eax                                     ; 179F _ 50
        call    boxfill8                                ; 17A0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 17A5 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 17A8 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 17AB _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 17AE _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 17B1 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 17B4 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 17B7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 17BA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 17BD _ 8B. 00
        push    ebx                                     ; 17BF _ 53
        push    ecx                                     ; 17C0 _ 51
        push    edx                                     ; 17C1 _ 52
        push    0                                       ; 17C2 _ 6A, 00
        push    0                                       ; 17C4 _ 6A, 00
        push    dword [ebp-18H]                         ; 17C6 _ FF. 75, E8
        push    eax                                     ; 17C9 _ 50
        call    boxfill8                                ; 17CA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 17CF _ 83. C4, 1C
        sub     esp, 8                                  ; 17D2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 17D5 _ FF. 75, 10
        push    7                                       ; 17D8 _ 6A, 07
        push    4                                       ; 17DA _ 6A, 04
        push    24                                      ; 17DC _ 6A, 18
        push    dword [ebp+0CH]                         ; 17DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17E1 _ FF. 75, 08
        call    showString                              ; 17E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17E9 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 17EC _ C7. 45, F0, 00000000
        jmp     ?_073                                   ; 17F3 _ EB, 7F

?_066:  mov     dword [ebp-0CH], 0                      ; 17F5 _ C7. 45, F4, 00000000
        jmp     ?_072                                   ; 17FC _ EB, 6D

?_067:  mov     eax, dword [ebp-10H]                    ; 17FE _ 8B. 45, F0
        shl     eax, 4                                  ; 1801 _ C1. E0, 04
        mov     edx, eax                                ; 1804 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1806 _ 8B. 45, F4
        add     eax, edx                                ; 1809 _ 01. D0
        add     eax, closebtn.2057                      ; 180B _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1810 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1812 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1815 _ 80. 7D, EF, 40
        jnz near      ?_068                                   ; 1819 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 181B _ C6. 45, EF, 00
        jmp     ?_071                                   ; 181F _ EB, 1C

?_068:  cmp     byte [ebp-11H], 36                      ; 1821 _ 80. 7D, EF, 24
        jnz near      ?_069                                   ; 1825 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1827 _ C6. 45, EF, 0F
        jmp     ?_071                                   ; 182B _ EB, 10

?_069:  cmp     byte [ebp-11H], 81                      ; 182D _ 80. 7D, EF, 51
        jnz near      ?_070                                   ; 1831 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1833 _ C6. 45, EF, 08
        jmp     ?_071                                   ; 1837 _ EB, 04

?_070:  mov     byte [ebp-11H], 7                       ; 1839 _ C6. 45, EF, 07
?_071:  mov     eax, dword [ebp+0CH]                    ; 183D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1840 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1842 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1845 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1848 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 184B _ 8B. 40, 04
        imul    ecx, eax                                ; 184E _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1851 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1854 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1857 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 185A _ 8B. 45, F4
        add     eax, ebx                                ; 185D _ 01. D8
        add     eax, ecx                                ; 185F _ 01. C8
        add     edx, eax                                ; 1861 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1863 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1866 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1868 _ FF. 45, F4
?_072:  cmp     dword [ebp-0CH], 15                     ; 186B _ 83. 7D, F4, 0F
        jle near      ?_067                                   ; 186f _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1871 _ FF. 45, F0
?_073:  cmp     dword [ebp-10H], 13                     ; 1874 _ 83. 7D, F0, 0D
        jle near      ?_066                                   ; 1878 _ 0f 8e, ffffff77
        nop                                             ; 187E _ 90
        mov     ebx, dword [ebp-4H]                     ; 187F _ 8B. 5D, FC
        leave                                           ; 1882 _ C9
        ret                                             ; 1883 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1884 _ 55
        mov     ebp, esp                                ; 1885 _ 89. E5
        push    edi                                     ; 1887 _ 57
        push    esi                                     ; 1888 _ 56
        push    ebx                                     ; 1889 _ 53
        sub     esp, 16                                 ; 188A _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 188D _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1890 _ 8B. 45, 14
        add     eax, edx                                ; 1893 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1895 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1898 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 189B _ 8B. 45, 18
        add     eax, edx                                ; 189E _ 01. D0
        mov     dword [ebp-14H], eax                    ; 18A0 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 18A3 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 18A6 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 18A9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 18AC _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 18AF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18B2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18B5 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 18B8 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 18BB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18BE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18C1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18C4 _ 8B. 00
        push    edi                                     ; 18C6 _ 57
        push    esi                                     ; 18C7 _ 56
        push    ebx                                     ; 18C8 _ 53
        push    ecx                                     ; 18C9 _ 51
        push    15                                      ; 18CA _ 6A, 0F
        push    edx                                     ; 18CC _ 52
        push    eax                                     ; 18CD _ 50
        call    boxfill8                                ; 18CE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18D3 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 18D6 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 18D9 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18DC _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18DF _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18E2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18E5 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18E8 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18EB _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18EE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18F1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18F4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18F7 _ 8B. 00
        push    edi                                     ; 18F9 _ 57
        push    esi                                     ; 18FA _ 56
        push    ebx                                     ; 18FB _ 53
        push    ecx                                     ; 18FC _ 51
        push    15                                      ; 18FD _ 6A, 0F
        push    edx                                     ; 18FF _ 52
        push    eax                                     ; 1900 _ 50
        call    boxfill8                                ; 1901 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1906 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1909 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 190C _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 190F _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1912 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1915 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1918 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 191B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 191E _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1921 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1924 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1927 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 192A _ 8B. 00
        push    edi                                     ; 192C _ 57
        push    esi                                     ; 192D _ 56
        push    ebx                                     ; 192E _ 53
        push    ecx                                     ; 192F _ 51
        push    7                                       ; 1930 _ 6A, 07
        push    edx                                     ; 1932 _ 52
        push    eax                                     ; 1933 _ 50
        call    boxfill8                                ; 1934 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1939 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 193C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 193F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1942 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1945 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1948 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 194B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 194E _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1951 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1954 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1957 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 195A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 195D _ 8B. 00
        push    edi                                     ; 195F _ 57
        push    esi                                     ; 1960 _ 56
        push    ebx                                     ; 1961 _ 53
        push    ecx                                     ; 1962 _ 51
        push    7                                       ; 1963 _ 6A, 07
        push    edx                                     ; 1965 _ 52
        push    eax                                     ; 1966 _ 50
        call    boxfill8                                ; 1967 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 196C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 196F _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1972 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1975 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1978 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 197B _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 197E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1981 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1984 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1987 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 198A _ 8B. 00
        push    esi                                     ; 198C _ 56
        push    dword [ebp-10H]                         ; 198D _ FF. 75, F0
        push    ebx                                     ; 1990 _ 53
        push    ecx                                     ; 1991 _ 51
        push    0                                       ; 1992 _ 6A, 00
        push    edx                                     ; 1994 _ 52
        push    eax                                     ; 1995 _ 50
        call    boxfill8                                ; 1996 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 199B _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 199E _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 19A1 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 19A4 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 19A7 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 19AA _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 19AD _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 19B0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19B3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19B9 _ 8B. 00
        push    dword [ebp-14H]                         ; 19BB _ FF. 75, EC
        push    esi                                     ; 19BE _ 56
        push    ebx                                     ; 19BF _ 53
        push    ecx                                     ; 19C0 _ 51
        push    0                                       ; 19C1 _ 6A, 00
        push    edx                                     ; 19C3 _ 52
        push    eax                                     ; 19C4 _ 50
        call    boxfill8                                ; 19C5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19CA _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 19CD _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19D0 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 19D3 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 19D6 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 19D9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 19DC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 19DF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19E2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19E5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19E8 _ 8B. 00
        push    esi                                     ; 19EA _ 56
        push    dword [ebp-10H]                         ; 19EB _ FF. 75, F0
        push    ebx                                     ; 19EE _ 53
        push    ecx                                     ; 19EF _ 51
        push    8                                       ; 19F0 _ 6A, 08
        push    edx                                     ; 19F2 _ 52
        push    eax                                     ; 19F3 _ 50
        call    boxfill8                                ; 19F4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19F9 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 19FC _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 19FF _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1A02 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A05 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A08 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A0B _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1A0E _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A11 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A14 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A17 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A1A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A1D _ 8B. 00
        push    edi                                     ; 1A1F _ 57
        push    esi                                     ; 1A20 _ 56
        push    ebx                                     ; 1A21 _ 53
        push    ecx                                     ; 1A22 _ 51
        push    8                                       ; 1A23 _ 6A, 08
        push    edx                                     ; 1A25 _ 52
        push    eax                                     ; 1A26 _ 50
        call    boxfill8                                ; 1A27 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A2C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1A2F _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1A32 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1A35 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1A38 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1A3B _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1A3E _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1A41 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A44 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A47 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A4A _ 8B. 00
        push    dword [ebp-14H]                         ; 1A4C _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1A4F _ FF. 75, F0
        push    esi                                     ; 1A52 _ 56
        push    ebx                                     ; 1A53 _ 53
        push    ecx                                     ; 1A54 _ 51
        push    edx                                     ; 1A55 _ 52
        push    eax                                     ; 1A56 _ 50
        call    boxfill8                                ; 1A57 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A5C _ 83. C4, 1C
        nop                                             ; 1A5F _ 90
        lea     esp, [ebp-0CH]                          ; 1A60 _ 8D. 65, F4
        pop     ebx                                     ; 1A63 _ 5B
        pop     esi                                     ; 1A64 _ 5E
        pop     edi                                     ; 1A65 _ 5F
        pop     ebp                                     ; 1A66 _ 5D
        ret                                             ; 1A67 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1A68 _ 55
        mov     ebp, esp                                ; 1A69 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A6B _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1A6E _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A74 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1A77 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A7E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1A81 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A88 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1A8B _ C7. 40, 0C, 00000000
        nop                                             ; 1A92 _ 90
        pop     ebp                                     ; 1A93 _ 5D
        ret                                             ; 1A94 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1A95 _ 55
        mov     ebp, esp                                ; 1A96 _ 89. E5
        sub     esp, 16                                 ; 1A98 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1A9B _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1AA2 _ C7. 45, FC, 00000000
        jmp     ?_075                                   ; 1AA9 _ EB, 13

?_074:  mov     eax, dword [ebp+8H]                     ; 1AAB _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1AAE _ 8B. 55, FC
        add     edx, 2                                  ; 1AB1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1AB4 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1AB8 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1ABB _ FF. 45, FC
?_075:  mov     eax, dword [ebp+8H]                     ; 1ABE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AC1 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1AC3 _ 39. 45, FC
        jc near       ?_074                                   ; 1ac6 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1AC8 _ 8B. 45, F8
        leave                                           ; 1ACB _ C9
        ret                                             ; 1ACC _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1ACD _ 55
        mov     ebp, esp                                ; 1ACE _ 89. E5
        sub     esp, 16                                 ; 1AD0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1AD3 _ C7. 45, FC, 00000000
        jmp     ?_079                                   ; 1ADA _ E9, 00000084

?_076:  mov     eax, dword [ebp+8H]                     ; 1ADF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1AE2 _ 8B. 55, FC
        add     edx, 2                                  ; 1AE5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1AE8 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1AEC _ 39. 45, 0C
        ja      ?_078                                   ; 1AEF _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1AF1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1AF4 _ 8B. 55, FC
        add     edx, 2                                  ; 1AF7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1AFA _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1AFD _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1B00 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1B03 _ 8B. 55, FC
        add     edx, 2                                  ; 1B06 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1B09 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1B0C _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1B0F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1B12 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1B15 _ 8B. 55, FC
        add     edx, 2                                  ; 1B18 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1B1B _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1B1E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1B21 _ 8B. 55, FC
        add     edx, 2                                  ; 1B24 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1B27 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1B2B _ 2B. 45, 0C
        mov     edx, eax                                ; 1B2E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1B30 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1B33 _ 8B. 4D, FC
        add     ecx, 2                                  ; 1B36 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1B39 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1B3D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1B40 _ 8B. 55, FC
        add     edx, 2                                  ; 1B43 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1B46 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1B4A _ 85. C0
        jnz near      ?_077                                   ; 1b4c _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 1B4E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B51 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1B53 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B56 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1B59 _ 89. 10
?_077:  mov     eax, dword [ebp-8H]                     ; 1B5B _ 8B. 45, F8
        jmp     ?_080                                   ; 1B5E _ EB, 16

?_078:  inc     dword [ebp-4H]                          ; 1B60 _ FF. 45, FC
?_079:  mov     eax, dword [ebp+8H]                     ; 1B63 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B66 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1B68 _ 39. 45, FC
        jc near       ?_076                                   ; 1b6b _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 1B71 _ B8, 00000000
?_080:  leave                                           ; 1B76 _ C9
        ret                                             ; 1B77 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1B78 _ 55
        mov     ebp, esp                                ; 1B79 _ 89. E5
        push    ebx                                     ; 1B7B _ 53
        sub     esp, 16                                 ; 1B7C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1B7F _ C7. 45, F8, 00000000
        jmp     ?_082                                   ; 1B86 _ EB, 14

?_081:  mov     eax, dword [ebp+8H]                     ; 1B88 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1B8B _ 8B. 55, F8
        add     edx, 2                                  ; 1B8E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1B91 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1B94 _ 39. 45, 0C
        jc near       ?_083                                   ; 1b97 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1B99 _ FF. 45, F8
?_082:  mov     eax, dword [ebp+8H]                     ; 1B9C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B9F _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1BA1 _ 39. 45, F8
        jl      ?_081                                   ; 1BA4 _ 7C, E2
        jmp     ?_084                                   ; 1BA6 _ EB, 01

?_083:  nop                                             ; 1BA8 _ 90
?_084:  cmp     dword [ebp-8H], 0                       ; 1BA9 _ 83. 7D, F8, 00
        jle near      ?_086                                   ; 1bad _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 1BB3 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1BB6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1BB9 _ 8B. 45, 08
        add     edx, 2                                  ; 1BBC _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1BBF _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1BC2 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1BC5 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1BC8 _ 8B. 45, 08
        add     ecx, 2                                  ; 1BCB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1BCE _ 8B. 44 C8, 04
        add     eax, edx                                ; 1BD2 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1BD4 _ 39. 45, 0C
        jne near      ?_086                                   ; 1bd7 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1BDD _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1BE0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1BE3 _ 8B. 45, 08
        add     edx, 2                                  ; 1BE6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1BE9 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1BED _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1BF0 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1BF3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1BF6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1BF9 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1BFC _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1BFF _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1C03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C06 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1C08 _ 39. 45, F8
        jge near      ?_085                                   ; 1c0b _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 1C0D _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1C10 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1C13 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C16 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C19 _ 8B. 55, F8
        add     edx, 2                                  ; 1C1C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1C1F _ 8B. 04 D0
        cmp     ecx, eax                                ; 1C22 _ 39. C1
        jnz near      ?_085                                   ; 1c24 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 1C26 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1C29 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1C2C _ 8B. 45, 08
        add     edx, 2                                  ; 1C2F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1C32 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1C36 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1C39 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1C3C _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1C3F _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1C43 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1C46 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1C49 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C4C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1C4F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1C52 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1C56 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C59 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1C5B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1C5E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1C61 _ 89. 10
?_085:  mov     eax, 0                                  ; 1C63 _ B8, 00000000
        jmp     ?_092                                   ; 1C68 _ E9, 0000011B

?_086:  mov     eax, dword [ebp+8H]                     ; 1C6D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C70 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1C72 _ 39. 45, F8
        jge near      ?_087                                   ; 1c75 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1C77 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1C7A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1C7D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C80 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C83 _ 8B. 55, F8
        add     edx, 2                                  ; 1C86 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1C89 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1C8C _ 39. C1
        jnz near      ?_087                                   ; 1c8e _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1C90 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C93 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1C96 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1C99 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1C9C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1C9F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CA2 _ 8B. 55, F8
        add     edx, 2                                  ; 1CA5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1CA8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1CAC _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1CAF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1CB2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CB5 _ 8B. 55, F8
        add     edx, 2                                  ; 1CB8 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1CBB _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1CBF _ B8, 00000000
        jmp     ?_092                                   ; 1CC4 _ E9, 000000BF

?_087:  mov     eax, dword [ebp+8H]                     ; 1CC9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CCC _ 8B. 00
        cmp     eax, 4095                               ; 1CCE _ 3D, 00000FFF
        jg  near      ?_091                                   ; 1cd3 _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1CD9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CDC _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1CDE _ 89. 45, F4
        jmp     ?_089                                   ; 1CE1 _ EB, 27

?_088:  mov     eax, dword [ebp-0CH]                    ; 1CE3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CE6 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1CE9 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1CEC _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1CEF _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1CF2 _ 8B. 45, 08
        add     edx, 2                                  ; 1CF5 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1CF8 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1CFB _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1CFD _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1D00 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1D03 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1D07 _ FF. 4D, F4
?_089:  mov     eax, dword [ebp-0CH]                    ; 1D0A _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1D0D _ 3B. 45, F8
        jg  near      ?_088                                   ; 1d10 _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 1D12 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D15 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1D17 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1D1A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D1D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1D1F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D22 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D25 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D28 _ 8B. 00
        cmp     edx, eax                                ; 1D2A _ 39. C2
        jge near      ?_090                                   ; 1d2c _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 1D2E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1D31 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1D33 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1D36 _ 89. 50, 04
?_090:  mov     eax, dword [ebp+8H]                     ; 1D39 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D3C _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1D3F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1D42 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1D45 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1D48 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D4B _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1D4E _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1D51 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1D54 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1D58 _ B8, 00000000
        jmp     ?_092                                   ; 1D5D _ EB, 29

?_091:  mov     eax, dword [ebp+8H]                     ; 1D5F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1D62 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1D65 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1D68 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1D6B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1D6E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1D71 _ 8B. 40, 08
        mov     edx, eax                                ; 1D74 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1D76 _ 8B. 45, 10
        add     eax, edx                                ; 1D79 _ 01. D0
        mov     edx, eax                                ; 1D7B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D7D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1D80 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1D83 _ B8, FFFFFFFF
?_092:  add     esp, 16                                 ; 1D88 _ 83. C4, 10
        pop     ebx                                     ; 1D8B _ 5B
        pop     ebp                                     ; 1D8C _ 5D
        ret                                             ; 1D8D _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1D8E _ 55
        mov     ebp, esp                                ; 1D8F _ 89. E5
        sub     esp, 16                                 ; 1D91 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1D94 _ 8B. 45, 0C
        add     eax, 4095                               ; 1D97 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1D9C _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1DA1 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1DA4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1DA7 _ FF. 75, 08
        call    memman_alloc                            ; 1DAA _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1DAF _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1DB2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1DB5 _ 8B. 45, FC
        leave                                           ; 1DB8 _ C9
        ret                                             ; 1DB9 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1DBA _ 55
        mov     ebp, esp                                ; 1DBB _ 89. E5
        sub     esp, 16                                 ; 1DBD _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1DC0 _ 8B. 45, 10
        add     eax, 4095                               ; 1DC3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1DC8 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1DCD _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1DD0 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1DD3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1DD6 _ FF. 75, 08
        call    memman_free                             ; 1DD9 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1DDE _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1DE1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1DE4 _ 8B. 45, FC
        leave                                           ; 1DE7 _ C9
        ret                                             ; 1DE8 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1DE9 _ 55
        mov     ebp, esp                                ; 1DEA _ 89. E5
        sub     esp, 24                                 ; 1DEC _ 83. EC, 18
        sub     esp, 8                                  ; 1DEF _ 83. EC, 08
        push    9232                                    ; 1DF2 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1DF7 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1DFA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1DFF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1E02 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1E05 _ 83. 7D, F0, 00
        jnz near      ?_093                                   ; 1e09 _ 75, 0a
        mov     eax, 0                                  ; 1E0B _ B8, 00000000
        jmp     ?_097                                   ; 1E10 _ E9, 00000099

?_093:  mov     eax, dword [ebp+10H]                    ; 1E15 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1E18 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1E1C _ 83. EC, 08
        push    eax                                     ; 1E1F _ 50
        push    dword [ebp+8H]                          ; 1E20 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1E23 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E28 _ 83. C4, 10
        mov     edx, eax                                ; 1E2B _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E2D _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 1E30 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 1E33 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1E36 _ 8B. 40, 04
        test    eax, eax                                ; 1E39 _ 85. C0
        jnz near      ?_094                                   ; 1e3b _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 1E3D _ 8B. 45, F0
        sub     esp, 4                                  ; 1E40 _ 83. EC, 04
        push    9232                                    ; 1E43 _ 68, 00002410
        push    eax                                     ; 1E48 _ 50
        push    dword [ebp+8H]                          ; 1E49 _ FF. 75, 08
        call    memman_free_4k                          ; 1E4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E51 _ 83. C4, 10
        mov     eax, 0                                  ; 1E54 _ B8, 00000000
        jmp     ?_097                                   ; 1E59 _ EB, 53

?_094:  mov     eax, dword [ebp-10H]                    ; 1E5B _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 1E5E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1E61 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 1E63 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1E66 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1E69 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1E6C _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 1E6F _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1E72 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 1E75 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 1E78 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 1E7F _ C7. 45, F4, 00000000
        jmp     ?_096                                   ; 1E86 _ EB, 1A

?_095:  mov     eax, dword [ebp-10H]                    ; 1E88 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 1E8B _ 8B. 55, F4
        add     edx, 33                                 ; 1E8E _ 83. C2, 21
        shl     edx, 5                                  ; 1E91 _ C1. E2, 05
        add     eax, edx                                ; 1E94 _ 01. D0
        add     eax, 16                                 ; 1E96 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1E99 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1E9F _ FF. 45, F4
?_096:  cmp     dword [ebp-0CH], 255                    ; 1EA2 _ 81. 7D, F4, 000000FF
        jle near      ?_095                                   ; 1ea9 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 1EAB _ 8B. 45, F0
?_097:  leave                                           ; 1EAE _ C9
        ret                                             ; 1EAF _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1EB0 _ 55
        mov     ebp, esp                                ; 1EB1 _ 89. E5
        sub     esp, 16                                 ; 1EB3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1EB6 _ C7. 45, FC, 00000000
        jmp     ?_100                                   ; 1EBD _ EB, 5A

?_098:  mov     eax, dword [ebp+8H]                     ; 1EBF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1EC2 _ 8B. 55, FC
        add     edx, 33                                 ; 1EC5 _ 83. C2, 21
        shl     edx, 5                                  ; 1EC8 _ C1. E2, 05
        add     eax, edx                                ; 1ECB _ 01. D0
        add     eax, 16                                 ; 1ECD _ 83. C0, 10
        mov     eax, dword [eax]                        ; 1ED0 _ 8B. 00
        test    eax, eax                                ; 1ED2 _ 85. C0
        jnz near      ?_099                                   ; 1ed4 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 1ED6 _ 8B. 45, FC
        shl     eax, 5                                  ; 1ED9 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1EDC _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1EE2 _ 8B. 45, 08
        add     eax, edx                                ; 1EE5 _ 01. D0
        add     eax, 4                                  ; 1EE7 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 1EEA _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1EED _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1EF0 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1EF3 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1EF6 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 1EF9 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 1EFD _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 1F00 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1F07 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1F0A _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 1F11 _ 8B. 45, F8
        jmp     ?_101                                   ; 1F14 _ EB, 11

?_099:  inc     dword [ebp-4H]                          ; 1F16 _ FF. 45, FC
?_100:  cmp     dword [ebp-4H], 255                     ; 1F19 _ 81. 7D, FC, 000000FF
        jle near      ?_098                                   ; 1f20 _ 7e, 9d
        mov     eax, 0                                  ; 1F22 _ B8, 00000000
?_101:  leave                                           ; 1F27 _ C9
        ret                                             ; 1F28 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1F29 _ 55
        mov     ebp, esp                                ; 1F2A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1F2C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1F2F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1F32 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F34 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F37 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1F3A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F3D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1F40 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1F43 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1F46 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1F49 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1F4C _ 89. 50, 14
        nop                                             ; 1F4F _ 90
        pop     ebp                                     ; 1F50 _ 5D
        ret                                             ; 1F51 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1F52 _ 55
        mov     ebp, esp                                ; 1F53 _ 89. E5
        push    esi                                     ; 1F55 _ 56
        push    ebx                                     ; 1F56 _ 53
        sub     esp, 16                                 ; 1F57 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1F5A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1F5D _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 1F60 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 1F63 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F66 _ 8B. 40, 10
        inc     eax                                     ; 1F69 _ 40
        cmp     dword [ebp+10H], eax                    ; 1F6A _ 39. 45, 10
        jle near      ?_102                                   ; 1f6d _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 1F6F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F72 _ 8B. 40, 10
        inc     eax                                     ; 1F75 _ 40
        mov     dword [ebp+10H], eax                    ; 1F76 _ 89. 45, 10
?_102:  cmp     dword [ebp+10H], -1                     ; 1F79 _ 83. 7D, 10, FF
        jge near      ?_103                                   ; 1f7d _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 1F7F _ C7. 45, 10, FFFFFFFF
?_103:  mov     eax, dword [ebp+0CH]                    ; 1F86 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1F89 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1F8C _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 1F8F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1F92 _ 3B. 45, 10
        jle near      ?_110                                   ; 1f95 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 1F9B _ 83. 7D, 10, 00
        js near       ?_106                                   ; 1f9f _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 1FA5 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1FA8 _ 89. 45, F4
        jmp     ?_105                                   ; 1FAB _ EB, 33

?_104:  mov     eax, dword [ebp-0CH]                    ; 1FAD _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1FB0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1FB3 _ 8B. 45, 08
        add     edx, 4                                  ; 1FB6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1FB9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1FBD _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1FC0 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1FC3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1FC6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1FCA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1FCD _ 8B. 55, F4
        add     edx, 4                                  ; 1FD0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1FD3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1FD7 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1FDA _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1FDD _ FF. 4D, F4
?_105:  mov     eax, dword [ebp-0CH]                    ; 1FE0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1FE3 _ 3B. 45, 10
        jg  near      ?_104                                   ; 1fe6 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 1FE8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1FEB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1FEE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1FF1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1FF4 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1FF8 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1FFB _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1FFE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2001 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2004 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2007 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 200A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 200D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2010 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2013 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2016 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2019 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 201C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 201F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2022 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2025 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2028 _ 83. EC, 08
        push    esi                                     ; 202B _ 56
        push    ebx                                     ; 202C _ 53
        push    ecx                                     ; 202D _ 51
        push    edx                                     ; 202E _ 52
        push    eax                                     ; 202F _ 50
        push    dword [ebp+8H]                          ; 2030 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2033 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2038 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 203B _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 203E _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2041 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2044 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2047 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 204A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 204D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2050 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2053 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2056 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2059 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 205C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 205F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2062 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2065 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2068 _ 8B. 40, 0C
        sub     esp, 4                                  ; 206B _ 83. EC, 04
        push    dword [ebp-10H]                         ; 206E _ FF. 75, F0
        push    esi                                     ; 2071 _ 56
        push    ebx                                     ; 2072 _ 53
        push    ecx                                     ; 2073 _ 51
        push    edx                                     ; 2074 _ 52
        push    eax                                     ; 2075 _ 50
        push    dword [ebp+8H]                          ; 2076 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2079 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 207E _ 83. C4, 20
        jmp     ?_117                                   ; 2081 _ E9, 00000239

?_106:  mov     eax, dword [ebp+8H]                     ; 2086 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2089 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 208C _ 39. 45, F0
        jge near      ?_109                                   ; 208f _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 2091 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2094 _ 89. 45, F4
        jmp     ?_108                                   ; 2097 _ EB, 33

?_107:  mov     eax, dword [ebp-0CH]                    ; 2099 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 209C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 209F _ 8B. 45, 08
        add     edx, 4                                  ; 20A2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 20A5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 20A9 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 20AC _ 8B. 4D, F4
        add     ecx, 4                                  ; 20AF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 20B2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 20B6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 20B9 _ 8B. 55, F4
        add     edx, 4                                  ; 20BC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 20BF _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 20C3 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 20C6 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 20C9 _ FF. 45, F4
?_108:  mov     eax, dword [ebp+8H]                     ; 20CC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20CF _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 20D2 _ 39. 45, F4
        jl      ?_107                                   ; 20D5 _ 7C, C2
?_109:  mov     eax, dword [ebp+8H]                     ; 20D7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20DA _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 20DD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20E0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 20E3 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20E6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 20E9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20EC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 20EF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 20F2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 20F5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 20F8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 20FB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 20FE _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2101 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2104 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2107 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 210A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 210D _ 8B. 40, 0C
        sub     esp, 8                                  ; 2110 _ 83. EC, 08
        push    0                                       ; 2113 _ 6A, 00
        push    ebx                                     ; 2115 _ 53
        push    ecx                                     ; 2116 _ 51
        push    edx                                     ; 2117 _ 52
        push    eax                                     ; 2118 _ 50
        push    dword [ebp+8H]                          ; 2119 _ FF. 75, 08
        call    sheet_refreshmap                        ; 211C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2121 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2124 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 2127 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 212A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 212D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2130 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2133 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2136 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2139 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 213C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 213F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2142 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2145 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2148 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 214B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 214E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2151 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2154 _ 83. EC, 04
        push    esi                                     ; 2157 _ 56
        push    0                                       ; 2158 _ 6A, 00
        push    ebx                                     ; 215A _ 53
        push    ecx                                     ; 215B _ 51
        push    edx                                     ; 215C _ 52
        push    eax                                     ; 215D _ 50
        push    dword [ebp+8H]                          ; 215E _ FF. 75, 08
        call    sheet_refreshsub                        ; 2161 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2166 _ 83. C4, 20
        jmp     ?_117                                   ; 2169 _ E9, 00000151

?_110:  mov     eax, dword [ebp-10H]                    ; 216E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2171 _ 3B. 45, 10
        jge near      ?_117                                   ; 2174 _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 217A _ 83. 7D, F0, 00
        js near       ?_113                                   ; 217e _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2180 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2183 _ 89. 45, F4
        jmp     ?_112                                   ; 2186 _ EB, 33

?_111:  mov     eax, dword [ebp-0CH]                    ; 2188 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 218B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 218E _ 8B. 45, 08
        add     edx, 4                                  ; 2191 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2194 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2198 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 219B _ 8B. 4D, F4
        add     ecx, 4                                  ; 219E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21A1 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21A5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21A8 _ 8B. 55, F4
        add     edx, 4                                  ; 21AB _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21AE _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 21B2 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 21B5 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 21B8 _ FF. 45, F4
?_112:  mov     eax, dword [ebp-0CH]                    ; 21BB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 21BE _ 3B. 45, 10
        jl      ?_111                                   ; 21C1 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 21C3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 21C6 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 21C9 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 21CC _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 21CF _ 89. 54 88, 04
        jmp     ?_116                                   ; 21D3 _ EB, 69

?_113:  mov     eax, dword [ebp+8H]                     ; 21D5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21D8 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 21DB _ 89. 45, F4
        jmp     ?_115                                   ; 21DE _ EB, 37

?_114:  mov     eax, dword [ebp-0CH]                    ; 21E0 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 21E3 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 21E6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21E9 _ 8B. 55, F4
        add     edx, 4                                  ; 21EC _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21EF _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21F3 _ 8B. 45, 08
        add     ecx, 4                                  ; 21F6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21F9 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 21FD _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2200 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2203 _ 8B. 45, 08
        add     edx, 4                                  ; 2206 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2209 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 220D _ 8B. 55, F4
        inc     edx                                     ; 2210 _ 42
        mov     dword [eax+18H], edx                    ; 2211 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2214 _ FF. 4D, F4
?_115:  mov     eax, dword [ebp-0CH]                    ; 2217 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 221A _ 3B. 45, 10
        jge near      ?_114                                   ; 221d _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 221F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2222 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2225 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2228 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 222B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 222F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2232 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2235 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2238 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 223B _ 89. 50, 10
?_116:  mov     eax, dword [ebp+0CH]                    ; 223E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2241 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2244 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2247 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 224A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 224D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2250 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2253 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2256 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2259 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 225C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 225F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2262 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2265 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2268 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 226B _ FF. 75, 10
        push    ebx                                     ; 226E _ 53
        push    ecx                                     ; 226F _ 51
        push    edx                                     ; 2270 _ 52
        push    eax                                     ; 2271 _ 50
        push    dword [ebp+8H]                          ; 2272 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2275 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 227A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 227D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2280 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2283 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2286 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2289 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 228C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 228F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2292 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2295 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2298 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 229B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 229E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22A1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22A4 _ 8B. 40, 0C
        sub     esp, 4                                  ; 22A7 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 22AA _ FF. 75, 10
        push    dword [ebp+10H]                         ; 22AD _ FF. 75, 10
        push    ebx                                     ; 22B0 _ 53
        push    ecx                                     ; 22B1 _ 51
        push    edx                                     ; 22B2 _ 52
        push    eax                                     ; 22B3 _ 50
        push    dword [ebp+8H]                          ; 22B4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 22B7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22BC _ 83. C4, 20
?_117:  nop                                             ; 22BF _ 90
        lea     esp, [ebp-8H]                           ; 22C0 _ 8D. 65, F8
        pop     ebx                                     ; 22C3 _ 5B
        pop     esi                                     ; 22C4 _ 5E
        pop     ebp                                     ; 22C5 _ 5D
        ret                                             ; 22C6 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 22C7 _ 55
        mov     ebp, esp                                ; 22C8 _ 89. E5
        push    edi                                     ; 22CA _ 57
        push    esi                                     ; 22CB _ 56
        push    ebx                                     ; 22CC _ 53
        sub     esp, 28                                 ; 22CD _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 22D0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 22D3 _ 8B. 40, 18
        test    eax, eax                                ; 22D6 _ 85. C0
        js near       ?_118                                   ; 22d8 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 22DA _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 22DD _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 22E0 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 22E3 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 22E6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22E9 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 22EC _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 22EF _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 22F2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22F5 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 22F8 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 22FB _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 22FE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2301 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 2304 _ 8B. 45, 14
        add     edx, eax                                ; 2307 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2309 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 230C _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 230F _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2312 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2315 _ 03. 45, E4
        sub     esp, 4                                  ; 2318 _ 83. EC, 04
        push    ebx                                     ; 231B _ 53
        push    ecx                                     ; 231C _ 51
        push    edi                                     ; 231D _ 57
        push    esi                                     ; 231E _ 56
        push    edx                                     ; 231F _ 52
        push    eax                                     ; 2320 _ 50
        push    dword [ebp+8H]                          ; 2321 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2324 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2329 _ 83. C4, 20
?_118:  mov     eax, 0                                  ; 232C _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2331 _ 8D. 65, F4
        pop     ebx                                     ; 2334 _ 5B
        pop     esi                                     ; 2335 _ 5E
        pop     edi                                     ; 2336 _ 5F
        pop     ebp                                     ; 2337 _ 5D
        ret                                             ; 2338 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2339 _ 55
        mov     ebp, esp                                ; 233A _ 89. E5
        push    esi                                     ; 233C _ 56
        push    ebx                                     ; 233D _ 53
        sub     esp, 16                                 ; 233E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2341 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2344 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2347 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 234A _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 234D _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2350 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2353 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2356 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2359 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 235C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 235F _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2362 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2365 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2368 _ 8B. 40, 18
        test    eax, eax                                ; 236B _ 85. C0
        js near       ?_119                                   ; 236d _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 2373 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2376 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2379 _ 8B. 45, F0
        add     edx, eax                                ; 237C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 237E _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2381 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 2384 _ 8B. 45, F4
        add     eax, ecx                                ; 2387 _ 01. C8
        sub     esp, 8                                  ; 2389 _ 83. EC, 08
        push    0                                       ; 238C _ 6A, 00
        push    edx                                     ; 238E _ 52
        push    eax                                     ; 238F _ 50
        push    dword [ebp-10H]                         ; 2390 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2393 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2396 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2399 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 239E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 23A1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 23A4 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 23A7 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 23AA _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 23AD _ 8B. 55, 14
        add     ecx, edx                                ; 23B0 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 23B2 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 23B5 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 23B8 _ 8B. 55, 10
        add     edx, ebx                                ; 23BB _ 01. DA
        sub     esp, 8                                  ; 23BD _ 83. EC, 08
        push    eax                                     ; 23C0 _ 50
        push    ecx                                     ; 23C1 _ 51
        push    edx                                     ; 23C2 _ 52
        push    dword [ebp+14H]                         ; 23C3 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 23C6 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 23C9 _ FF. 75, 08
        call    sheet_refreshmap                        ; 23CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23D1 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 23D4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 23D7 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 23DA _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 23DD _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 23E0 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 23E3 _ 8B. 45, F0
        add     edx, eax                                ; 23E6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 23E8 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 23EB _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 23EE _ 8B. 45, F4
        add     eax, ebx                                ; 23F1 _ 01. D8
        sub     esp, 4                                  ; 23F3 _ 83. EC, 04
        push    ecx                                     ; 23F6 _ 51
        push    0                                       ; 23F7 _ 6A, 00
        push    edx                                     ; 23F9 _ 52
        push    eax                                     ; 23FA _ 50
        push    dword [ebp-10H]                         ; 23FB _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 23FE _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2401 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2404 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2409 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 240C _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 240F _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2412 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2415 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2418 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 241B _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 241E _ 8B. 4D, 14
        add     ebx, ecx                                ; 2421 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2423 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2426 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2429 _ 8B. 4D, 10
        add     ecx, esi                                ; 242C _ 01. F1
        sub     esp, 4                                  ; 242E _ 83. EC, 04
        push    edx                                     ; 2431 _ 52
        push    eax                                     ; 2432 _ 50
        push    ebx                                     ; 2433 _ 53
        push    ecx                                     ; 2434 _ 51
        push    dword [ebp+14H]                         ; 2435 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2438 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 243B _ FF. 75, 08
        call    sheet_refreshsub                        ; 243E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2443 _ 83. C4, 20
?_119:  nop                                             ; 2446 _ 90
        lea     esp, [ebp-8H]                           ; 2447 _ 8D. 65, F8
        pop     ebx                                     ; 244A _ 5B
        pop     esi                                     ; 244B _ 5E
        pop     ebp                                     ; 244C _ 5D
        ret                                             ; 244D _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 244E _ 55
        mov     ebp, esp                                ; 244F _ 89. E5
        sub     esp, 48                                 ; 2451 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2454 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2457 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2459 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 245C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 245F _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2462 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2465 _ 83. 7D, 0C, 00
        jns     ?_120                                   ; 2469 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 246B _ C7. 45, 0C, 00000000
?_120:  cmp     dword [ebp+10H], 8                      ; 2472 _ 83. 7D, 10, 08
        jg  near      ?_121                                   ; 2476 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 2478 _ C7. 45, 10, 00000000
?_121:  mov     eax, dword [ebp+8H]                     ; 247F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2482 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2485 _ 39. 45, 14
        jle near      ?_122                                   ; 2488 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 248A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 248D _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2490 _ 89. 45, 14
?_122:  mov     eax, dword [ebp+8H]                     ; 2493 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2496 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2499 _ 39. 45, 18
        jle near      ?_123                                   ; 249c _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 249E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24A1 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 24A4 _ 89. 45, 18
?_123:  mov     eax, dword [ebp+1CH]                    ; 24A7 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 24AA _ 89. 45, FC
        jmp     ?_130                                   ; 24AD _ E9, 0000010E

?_124:  mov     eax, dword [ebp+8H]                     ; 24B2 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 24B5 _ 8B. 55, FC
        add     edx, 4                                  ; 24B8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 24BB _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 24BF _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 24C2 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 24C5 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 24C7 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 24CA _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 24CD _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 24D3 _ 8B. 45, E8
        sub     eax, edx                                ; 24D6 _ 29. D0
        sar     eax, 5                                  ; 24D8 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 24DB _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 24DE _ C7. 45, F4, 00000000
        jmp     ?_129                                   ; 24E5 _ E9, 000000C4

?_125:  mov     eax, dword [ebp-18H]                    ; 24EA _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 24ED _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 24F0 _ 8B. 45, F4
        add     eax, edx                                ; 24F3 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 24F5 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 24F8 _ C7. 45, F8, 00000000
        jmp     ?_128                                   ; 24FF _ E9, 00000098

?_126:  mov     eax, dword [ebp-18H]                    ; 2504 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2507 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 250A _ 8B. 45, F8
        add     eax, edx                                ; 250D _ 01. D0
        mov     dword [ebp-28H], eax                    ; 250F _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2512 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2515 _ 3B. 45, D8
        jg  near      ?_127                                   ; 2518 _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 251A _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 251D _ 3B. 45, 14
        jge near      ?_127                                   ; 2520 _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2522 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2525 _ 3B. 45, DC
        jg  near      ?_127                                   ; 2528 _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 252A _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 252D _ 3B. 45, 18
        jge near      ?_127                                   ; 2530 _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2532 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2535 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2538 _ 0F AF. 45, F4
        mov     edx, eax                                ; 253C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 253E _ 8B. 45, F8
        add     eax, edx                                ; 2541 _ 01. D0
        mov     edx, eax                                ; 2543 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2545 _ 8B. 45, E4
        add     eax, edx                                ; 2548 _ 01. D0
        mov     al, byte [eax]                          ; 254A _ 8A. 00
        mov     byte [ebp-29H], al                      ; 254C _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 254F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2552 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2555 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2559 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 255B _ 8B. 45, D8
        add     eax, edx                                ; 255E _ 01. D0
        mov     edx, eax                                ; 2560 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2562 _ 8B. 45, EC
        add     eax, edx                                ; 2565 _ 01. D0
        mov     al, byte [eax]                          ; 2567 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2569 _ 38. 45, E3
        jnz near      ?_127                                   ; 256c _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 256E _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2572 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2575 _ 8B. 40, 14
        cmp     edx, eax                                ; 2578 _ 39. C2
        jz near       ?_127                                   ; 257a _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 257C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 257F _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2582 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2586 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2588 _ 8B. 45, D8
        add     eax, edx                                ; 258B _ 01. D0
        mov     edx, eax                                ; 258D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 258F _ 8B. 45, F0
        add     edx, eax                                ; 2592 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2594 _ 8A. 45, D7
        mov     byte [edx], al                          ; 2597 _ 88. 02
?_127:  inc     dword [ebp-8H]                          ; 2599 _ FF. 45, F8
?_128:  mov     eax, dword [ebp-18H]                    ; 259C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 259F _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 25A2 _ 39. 45, F8
        jl      ?_126                                   ; 25A5 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 25AB _ FF. 45, F4
?_129:  mov     eax, dword [ebp-18H]                    ; 25AE _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 25B1 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 25B4 _ 39. 45, F4
        jl      ?_125                                   ; 25B7 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 25BD _ FF. 45, FC
?_130:  mov     eax, dword [ebp-4H]                     ; 25C0 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 25C3 _ 3B. 45, 20
        jle near      ?_124                                   ; 25c6 _ 0f 8e, fffffee6
        nop                                             ; 25CC _ 90
        nop                                             ; 25CD _ 90
        leave                                           ; 25CE _ C9
        ret                                             ; 25CF _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 25D0 _ 55
        mov     ebp, esp                                ; 25D1 _ 89. E5
        sub     esp, 64                                 ; 25D3 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 25D6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 25D9 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 25DC _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 25DF _ 83. 7D, 0C, 00
        jns     ?_131                                   ; 25E3 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 25E5 _ C7. 45, 0C, 00000000
?_131:  cmp     dword [ebp+10H], 0                      ; 25EC _ 83. 7D, 10, 00
        jns     ?_132                                   ; 25F0 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 25F2 _ C7. 45, 10, 00000000
?_132:  mov     eax, dword [ebp+8H]                     ; 25F9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 25FC _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 25FF _ 39. 45, 14
        jle near      ?_133                                   ; 2602 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2604 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2607 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 260A _ 89. 45, 14
?_133:  mov     eax, dword [ebp+8H]                     ; 260D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2610 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2613 _ 39. 45, 18
        jle near      ?_134                                   ; 2616 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2618 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 261B _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 261E _ 89. 45, 18
?_134:  mov     eax, dword [ebp+1CH]                    ; 2621 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2624 _ 89. 45, FC
        jmp     ?_145                                   ; 2627 _ E9, 00000137

?_135:  mov     eax, dword [ebp+8H]                     ; 262C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 262F _ 8B. 55, FC
        add     edx, 4                                  ; 2632 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2635 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2639 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 263C _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 263F _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2645 _ 8B. 45, DC
        sub     eax, edx                                ; 2648 _ 29. D0
        sar     eax, 5                                  ; 264A _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 264D _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2650 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2653 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2655 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2658 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 265B _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 265E _ 8B. 55, 0C
        sub     edx, eax                                ; 2661 _ 29. C2
        mov     eax, edx                                ; 2663 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2665 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2668 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 266B _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 266E _ 8B. 55, 10
        sub     edx, eax                                ; 2671 _ 29. C2
        mov     eax, edx                                ; 2673 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2675 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2678 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 267B _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 267E _ 8B. 55, 14
        sub     edx, eax                                ; 2681 _ 29. C2
        mov     eax, edx                                ; 2683 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2685 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2688 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 268B _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 268E _ 8B. 55, 18
        sub     edx, eax                                ; 2691 _ 29. C2
        mov     eax, edx                                ; 2693 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2695 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2698 _ 83. 7D, F0, 00
        jns     ?_136                                   ; 269C _ 79, 07
        mov     dword [ebp-10H], 0                      ; 269E _ C7. 45, F0, 00000000
?_136:  cmp     dword [ebp-14H], 0                      ; 26A5 _ 83. 7D, EC, 00
        jns     ?_137                                   ; 26A9 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 26AB _ C7. 45, EC, 00000000
?_137:  mov     eax, dword [ebp-24H]                    ; 26B2 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 26B5 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 26B8 _ 39. 45, E8
        jle near      ?_138                                   ; 26bb _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 26BD _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 26C0 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 26C3 _ 89. 45, E8
?_138:  mov     eax, dword [ebp-24H]                    ; 26C6 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 26C9 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 26CC _ 39. 45, E4
        jle near      ?_139                                   ; 26cf _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 26D1 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 26D4 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 26D7 _ 89. 45, E4
?_139:  mov     eax, dword [ebp-14H]                    ; 26DA _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 26DD _ 89. 45, F4
        jmp     ?_144                                   ; 26E0 _ EB, 76

?_140:  mov     eax, dword [ebp-24H]                    ; 26E2 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 26E5 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 26E8 _ 8B. 45, F4
        add     eax, edx                                ; 26EB _ 01. D0
        mov     dword [ebp-30H], eax                    ; 26ED _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 26F0 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 26F3 _ 89. 45, F8
        jmp     ?_143                                   ; 26F6 _ EB, 55

?_141:  mov     eax, dword [ebp-24H]                    ; 26F8 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 26FB _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 26FE _ 8B. 45, F8
        add     eax, edx                                ; 2701 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2703 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2706 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2709 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 270C _ 0F AF. 45, F4
        mov     edx, eax                                ; 2710 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2712 _ 8B. 45, F8
        add     eax, edx                                ; 2715 _ 01. D0
        mov     edx, eax                                ; 2717 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2719 _ 8B. 45, D4
        add     eax, edx                                ; 271C _ 01. D0
        mov     al, byte [eax]                          ; 271E _ 8A. 00
        movzx   edx, al                                 ; 2720 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2723 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2726 _ 8B. 40, 14
        cmp     edx, eax                                ; 2729 _ 39. C2
        jz near       ?_142                                   ; 272b _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 272D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2730 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2733 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2737 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2739 _ 8B. 45, CC
        add     eax, edx                                ; 273C _ 01. D0
        mov     edx, eax                                ; 273E _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2740 _ 8B. 45, E0
        add     edx, eax                                ; 2743 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2745 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2748 _ 88. 02
?_142:  inc     dword [ebp-8H]                          ; 274A _ FF. 45, F8
?_143:  mov     eax, dword [ebp-8H]                     ; 274D _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2750 _ 3B. 45, E8
        jl      ?_141                                   ; 2753 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2755 _ FF. 45, F4
?_144:  mov     eax, dword [ebp-0CH]                    ; 2758 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 275B _ 3B. 45, E4
        jl      ?_140                                   ; 275E _ 7C, 82
        inc     dword [ebp-4H]                          ; 2760 _ FF. 45, FC
?_145:  mov     eax, dword [ebp+8H]                     ; 2763 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2766 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2769 _ 39. 45, FC
        jle near      ?_135                                   ; 276c _ 0f 8e, fffffeba
        nop                                             ; 2772 _ 90
        leave                                           ; 2773 _ C9
        ret                                             ; 2774 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2775 _ 55
        mov     ebp, esp                                ; 2776 _ 89. E5
        sub     esp, 24                                 ; 2778 _ 83. EC, 18
        sub     esp, 8                                  ; 277B _ 83. EC, 08
        push    52                                      ; 277E _ 6A, 34
        push    67                                      ; 2780 _ 6A, 43
        call    io_out8                                 ; 2782 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2787 _ 83. C4, 10
        sub     esp, 8                                  ; 278A _ 83. EC, 08
        push    156                                     ; 278D _ 68, 0000009C
        push    64                                      ; 2792 _ 6A, 40
        call    io_out8                                 ; 2794 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2799 _ 83. C4, 10
        sub     esp, 8                                  ; 279C _ 83. EC, 08
        push    46                                      ; 279F _ 6A, 2E
        push    64                                      ; 27A1 _ 6A, 40
        call    io_out8                                 ; 27A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 27A8 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 27AB _ C7. 05, 00000280(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 27B5 _ C7. 45, F4, 00000000
        jmp     ?_147                                   ; 27BC _ EB, 25

?_146:  mov     eax, dword [ebp-0CH]                    ; 27BE _ 8B. 45, F4
        shl     eax, 4                                  ; 27C1 _ C1. E0, 04
        add     eax, ?_200                              ; 27C4 _ 05, 00000288(d)
        mov     dword [eax], 0                          ; 27C9 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 27CF _ 8B. 45, F4
        shl     eax, 4                                  ; 27D2 _ C1. E0, 04
        add     eax, ?_201                              ; 27D5 _ 05, 0000028C(d)
        mov     dword [eax], 0                          ; 27DA _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 27E0 _ FF. 45, F4
?_147:  cmp     dword [ebp-0CH], 499                    ; 27E3 _ 81. 7D, F4, 000001F3
        jle near      ?_146                                   ; 27ea _ 7e, d2
        nop                                             ; 27EC _ 90
        nop                                             ; 27ED _ 90
        leave                                           ; 27EE _ C9
        ret                                             ; 27EF _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 27F0 _ 55
        mov     ebp, esp                                ; 27F1 _ 89. E5
        sub     esp, 16                                 ; 27F3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 27F6 _ C7. 45, FC, 00000000
        jmp     ?_150                                   ; 27FD _ EB, 35

?_148:  mov     eax, dword [ebp-4H]                     ; 27FF _ 8B. 45, FC
        shl     eax, 4                                  ; 2802 _ C1. E0, 04
        add     eax, ?_200                              ; 2805 _ 05, 00000288(d)
        mov     eax, dword [eax]                        ; 280A _ 8B. 00
        test    eax, eax                                ; 280C _ 85. C0
        jnz near      ?_149                                   ; 280e _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2810 _ 8B. 45, FC
        shl     eax, 4                                  ; 2813 _ C1. E0, 04
        add     eax, ?_200                              ; 2816 _ 05, 00000288(d)
        mov     dword [eax], 1                          ; 281B _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2821 _ 8B. 45, FC
        shl     eax, 4                                  ; 2824 _ C1. E0, 04
        add     eax, timerctl                           ; 2827 _ 05, 00000280(d)
        add     eax, 4                                  ; 282C _ 83. C0, 04
        jmp     ?_151                                   ; 282F _ EB, 11

?_149:  inc     dword [ebp-4H]                          ; 2831 _ FF. 45, FC
?_150:  cmp     dword [ebp-4H], 499                     ; 2834 _ 81. 7D, FC, 000001F3
        jle near      ?_148                                   ; 283b _ 7e, c2
        mov     eax, 0                                  ; 283D _ B8, 00000000
?_151:  leave                                           ; 2842 _ C9
        ret                                             ; 2843 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2844 _ 55
        mov     ebp, esp                                ; 2845 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2847 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 284A _ C7. 40, 04, 00000000
        nop                                             ; 2851 _ 90
        pop     ebp                                     ; 2852 _ 5D
        ret                                             ; 2853 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2854 _ 55
        mov     ebp, esp                                ; 2855 _ 89. E5
        sub     esp, 4                                  ; 2857 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 285A _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 285D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2860 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2863 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2866 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2869 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 286C _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 286F _ 88. 50, 0C
        nop                                             ; 2872 _ 90
        leave                                           ; 2873 _ C9
        ret                                             ; 2874 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2875 _ 55
        mov     ebp, esp                                ; 2876 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2878 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 287B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 287E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2880 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2883 _ C7. 40, 04, 00000002
        nop                                             ; 288A _ 90
        pop     ebp                                     ; 288B _ 5D
        ret                                             ; 288C _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 288D _ 55
        mov     ebp, esp                                ; 288E _ 89. E5
        sub     esp, 24                                 ; 2890 _ 83. EC, 18
        sub     esp, 8                                  ; 2893 _ 83. EC, 08
        push    32                                      ; 2896 _ 6A, 20
        push    32                                      ; 2898 _ 6A, 20
        call    io_out8                                 ; 289A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 289F _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 28A2 _ A1, 00000280(d)
        inc     eax                                     ; 28A7 _ 40
        mov     dword [timerctl], eax                   ; 28A8 _ A3, 00000280(d)
        mov     byte [ebp-0DH], 0                       ; 28AD _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 28B1 _ C7. 45, F4, 00000000
        jmp     ?_155                                   ; 28B8 _ E9, 000000A8

?_152:  mov     eax, dword [ebp-0CH]                    ; 28BD _ 8B. 45, F4
        shl     eax, 4                                  ; 28C0 _ C1. E0, 04
        add     eax, ?_200                              ; 28C3 _ 05, 00000288(d)
        mov     eax, dword [eax]                        ; 28C8 _ 8B. 00
        cmp     eax, 2                                  ; 28CA _ 83. F8, 02
        jne near      ?_153                                   ; 28cd _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 28D3 _ 8B. 45, F4
        shl     eax, 4                                  ; 28D6 _ C1. E0, 04
        add     eax, ?_199                              ; 28D9 _ 05, 00000284(d)
        mov     eax, dword [eax]                        ; 28DE _ 8B. 00
        lea     edx, [eax-1H]                           ; 28E0 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 28E3 _ 8B. 45, F4
        shl     eax, 4                                  ; 28E6 _ C1. E0, 04
        add     eax, ?_199                              ; 28E9 _ 05, 00000284(d)
        mov     dword [eax], edx                        ; 28EE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 28F0 _ 8B. 45, F4
        shl     eax, 4                                  ; 28F3 _ C1. E0, 04
        add     eax, ?_199                              ; 28F6 _ 05, 00000284(d)
        mov     eax, dword [eax]                        ; 28FB _ 8B. 00
        test    eax, eax                                ; 28FD _ 85. C0
        jnz near      ?_153                                   ; 28ff _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2901 _ 8B. 45, F4
        shl     eax, 4                                  ; 2904 _ C1. E0, 04
        add     eax, ?_200                              ; 2907 _ 05, 00000288(d)
        mov     dword [eax], 1                          ; 290C _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2912 _ 8B. 45, F4
        shl     eax, 4                                  ; 2915 _ C1. E0, 04
        add     eax, ?_202                              ; 2918 _ 05, 00000290(d)
        mov     al, byte [eax]                          ; 291D _ 8A. 00
        movzx   edx, al                                 ; 291F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2922 _ 8B. 45, F4
        shl     eax, 4                                  ; 2925 _ C1. E0, 04
        add     eax, ?_201                              ; 2928 _ 05, 0000028C(d)
        mov     eax, dword [eax]                        ; 292D _ 8B. 00
        sub     esp, 8                                  ; 292F _ 83. EC, 08
        push    edx                                     ; 2932 _ 52
        push    eax                                     ; 2933 _ 50
        call    fifo8_put                               ; 2934 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2939 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 293C _ 8B. 45, F4
        shl     eax, 4                                  ; 293F _ C1. E0, 04
        add     eax, timerctl                           ; 2942 _ 05, 00000280(d)
        lea     edx, [eax+4H]                           ; 2947 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 294A _ A1, 00000000(d)
        cmp     edx, eax                                ; 294F _ 39. C2
        jnz near      ?_153                                   ; 2951 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2953 _ C6. 45, F3, 01
?_153:  cmp     byte [ebp-0DH], 0                       ; 2957 _ 80. 7D, F3, 00
        jz near       ?_154                                   ; 295b _ 74, 05
        call    task_switch                             ; 295D _ E8, FFFFFFFC(rel)
?_154:  inc     dword [ebp-0CH]                         ; 2962 _ FF. 45, F4
?_155:  cmp     dword [ebp-0CH], 499                    ; 2965 _ 81. 7D, F4, 000001F3
        jle near      ?_152                                   ; 296c _ 0f 8e, ffffff4b
        nop                                             ; 2972 _ 90
        leave                                           ; 2973 _ C9
        ret                                             ; 2974 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2975 _ 55
        mov     ebp, esp                                ; 2976 _ 89. E5
        mov     eax, timerctl                           ; 2978 _ B8, 00000280(d)
        pop     ebp                                     ; 297D _ 5D
        ret                                             ; 297E _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 297F _ 55
        mov     ebp, esp                                ; 2980 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2982 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2985 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2988 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 298B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 298E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2991 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2993 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2996 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2999 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 299C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 299F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 29A6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 29A9 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 29B0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 29B3 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 29BA _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 29BD _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 29C0 _ 89. 50, 18
        nop                                             ; 29C3 _ 90
        pop     ebp                                     ; 29C4 _ 5D
        ret                                             ; 29C5 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 29C6 _ 55
        mov     ebp, esp                                ; 29C7 _ 89. E5
        sub     esp, 24                                 ; 29C9 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 29CC _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 29CF _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 29D2 _ 83. 7D, 08, 00
        jnz near      ?_156                                   ; 29d6 _ 75, 0a
        mov     eax, 4294967295                         ; 29D8 _ B8, FFFFFFFF
        jmp     ?_160                                   ; 29DD _ E9, 0000009B

?_156:  mov     eax, dword [ebp+8H]                     ; 29E2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 29E5 _ 8B. 40, 10
        test    eax, eax                                ; 29E8 _ 85. C0
        jnz near      ?_157                                   ; 29ea _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 29EC _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 29EF _ 8B. 40, 14
        or      eax, 01H                                ; 29F2 _ 83. C8, 01
        mov     edx, eax                                ; 29F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 29F7 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 29FA _ 89. 50, 14
        mov     eax, 4294967295                         ; 29FD _ B8, FFFFFFFF
        jmp     ?_160                                   ; 2A02 _ EB, 79

?_157:  mov     eax, dword [ebp+8H]                     ; 2A04 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2A07 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2A09 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A0C _ 8B. 40, 04
        add     edx, eax                                ; 2A0F _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2A11 _ 8A. 45, F4
        mov     byte [edx], al                          ; 2A14 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2A16 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A19 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2A1C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A1F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2A22 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A25 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2A28 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A2B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A2E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2A31 _ 39. C2
        jnz near      ?_158                                   ; 2a33 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2A35 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A38 _ C7. 40, 04, 00000000
?_158:  mov     eax, dword [ebp+8H]                     ; 2A3F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A42 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2A45 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2A48 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2A4B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2A4E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A51 _ 8B. 40, 18
        test    eax, eax                                ; 2A54 _ 85. C0
        jz near       ?_159                                   ; 2a56 _ 74, 20
        mov     eax, dword [ebp+8H]                     ; 2A58 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A5B _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2A5E _ 8B. 40, 04
        cmp     eax, 2                                  ; 2A61 _ 83. F8, 02
        jz near       ?_159                                   ; 2a64 _ 74, 12
        mov     eax, dword [ebp+8H]                     ; 2A66 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A69 _ 8B. 40, 18
        sub     esp, 12                                 ; 2A6C _ 83. EC, 0C
        push    eax                                     ; 2A6F _ 50
        call    task_run                                ; 2A70 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A75 _ 83. C4, 10
?_159:  mov     eax, 0                                  ; 2A78 _ B8, 00000000
?_160:  leave                                           ; 2A7D _ C9
        ret                                             ; 2A7E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2A7F _ 55
        mov     ebp, esp                                ; 2A80 _ 89. E5
        sub     esp, 16                                 ; 2A82 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2A85 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2A88 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2A8B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A8E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2A91 _ 39. C2
        jnz near      ?_161                                   ; 2a93 _ 75, 07
        mov     eax, 4294967295                         ; 2A95 _ B8, FFFFFFFF
        jmp     ?_163                                   ; 2A9A _ EB, 50

?_161:  mov     eax, dword [ebp+8H]                     ; 2A9C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2A9F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2AA1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AA4 _ 8B. 40, 08
        add     eax, edx                                ; 2AA7 _ 01. D0
        mov     al, byte [eax]                          ; 2AA9 _ 8A. 00
        movzx   eax, al                                 ; 2AAB _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2AAE _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2AB1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AB4 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2AB7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2ABA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2ABD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2AC0 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2AC3 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2AC6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AC9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2ACC _ 39. C2
        jnz near      ?_162                                   ; 2ace _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2AD0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2AD3 _ C7. 40, 08, 00000000
?_162:  mov     eax, dword [ebp+8H]                     ; 2ADA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2ADD _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2AE0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2AE3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2AE6 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2AE9 _ 8B. 45, FC
?_163:  leave                                           ; 2AEC _ C9
        ret                                             ; 2AED _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2AEE _ 55
        mov     ebp, esp                                ; 2AEF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AF1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2AF4 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2AF7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2AFA _ 8B. 40, 10
        sub     edx, eax                                ; 2AFD _ 29. C2
        mov     eax, edx                                ; 2AFF _ 89. D0
        pop     ebp                                     ; 2B01 _ 5D
        ret                                             ; 2B02 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2B03 _ 55
        mov     ebp, esp                                ; 2B04 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2B06 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_164                                   ; 2B0D _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2B0F _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2B16 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2B19 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2B1C _ 89. 45, 0C
?_164:  mov     eax, dword [ebp+0CH]                    ; 2B1F _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2B22 _ 8B. 55, 08
        mov     word [edx], ax                          ; 2B25 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2B28 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2B2B _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2B2E _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2B32 _ 8B. 45, 10
        sar     eax, 16                                 ; 2B35 _ C1. F8, 10
        mov     dl, al                                  ; 2B38 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2B3A _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2B3D _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2B40 _ 8B. 45, 14
        mov     dl, al                                  ; 2B43 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2B45 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2B48 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2B4B _ 8B. 45, 0C
        shr     eax, 16                                 ; 2B4E _ C1. E8, 10
        and     eax, 0FH                                ; 2B51 _ 83. E0, 0F
        mov     dl, al                                  ; 2B54 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2B56 _ 8B. 45, 14
        sar     eax, 8                                  ; 2B59 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2B5C _ 83. E0, F0
        or      eax, edx                                ; 2B5F _ 09. D0
        mov     dl, al                                  ; 2B61 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2B63 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2B66 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2B69 _ 8B. 45, 10
        shr     eax, 24                                 ; 2B6C _ C1. E8, 18
        mov     dl, al                                  ; 2B6F _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2B71 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2B74 _ 88. 50, 07
        nop                                             ; 2B77 _ 90
        pop     ebp                                     ; 2B78 _ 5D
        ret                                             ; 2B79 _ C3
; set_segmdesc End of function

task_init:; Function begin
        push    ebp                                     ; 2B7A _ 55
        mov     ebp, esp                                ; 2B7B _ 89. E5
        push    ebx                                     ; 2B7D _ 53
        sub     esp, 20                                 ; 2B7E _ 83. EC, 14
        call    get_addr_gdt                            ; 2B81 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2B86 _ 89. 45, F0
        sub     esp, 8                                  ; 2B89 _ 83. EC, 08
        push    240                                     ; 2B8C _ 68, 000000F0
        push    dword [ebp+8H]                          ; 2B91 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2B94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B99 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2B9C _ A3, 000021C8(d)
        mov     dword [ebp-0CH], 0                      ; 2BA1 _ C7. 45, F4, 00000000
        jmp     ?_166                                   ; 2BA8 _ E9, 00000091

?_165:  mov     ecx, dword [taskctl]                    ; 2BAD _ 8B. 0D, 000021C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2BB3 _ 8B. 55, F4
        mov     eax, edx                                ; 2BB6 _ 89. D0
        add     eax, eax                                ; 2BB8 _ 01. C0
        add     eax, edx                                ; 2BBA _ 01. D0
        add     eax, eax                                ; 2BBC _ 01. C0
        add     eax, edx                                ; 2BBE _ 01. D0
        shl     eax, 4                                  ; 2BC0 _ C1. E0, 04
        add     eax, ecx                                ; 2BC3 _ 01. C8
        add     eax, 20                                 ; 2BC5 _ 83. C0, 14
        mov     dword [eax], 0                          ; 2BC8 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2BCE _ 8B. 45, F4
        add     eax, 7                                  ; 2BD1 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 2BD4 _ 8B. 1D, 000021C8(d)
        lea     ecx, [eax*8]                            ; 2BDA _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2BE1 _ 8B. 55, F4
        mov     eax, edx                                ; 2BE4 _ 89. D0
        add     eax, eax                                ; 2BE6 _ 01. C0
        add     eax, edx                                ; 2BE8 _ 01. D0
        add     eax, eax                                ; 2BEA _ 01. C0
        add     eax, edx                                ; 2BEC _ 01. D0
        shl     eax, 4                                  ; 2BEE _ C1. E0, 04
        add     eax, ebx                                ; 2BF1 _ 01. D8
        add     eax, 16                                 ; 2BF3 _ 83. C0, 10
        mov     dword [eax], ecx                        ; 2BF6 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 2BF8 _ 8B. 0D, 000021C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2BFE _ 8B. 55, F4
        mov     eax, edx                                ; 2C01 _ 89. D0
        add     eax, eax                                ; 2C03 _ 01. C0
        add     eax, edx                                ; 2C05 _ 01. D0
        add     eax, eax                                ; 2C07 _ 01. C0
        add     eax, edx                                ; 2C09 _ 01. D0
        shl     eax, 4                                  ; 2C0B _ C1. E0, 04
        add     eax, 16                                 ; 2C0E _ 83. C0, 10
        add     eax, ecx                                ; 2C11 _ 01. C8
        add     eax, 8                                  ; 2C13 _ 83. C0, 08
        mov     edx, eax                                ; 2C16 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2C18 _ 8B. 45, F4
        add     eax, 7                                  ; 2C1B _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 2C1E _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 2C25 _ 8B. 45, F0
        add     eax, ecx                                ; 2C28 _ 01. C8
        push    137                                     ; 2C2A _ 68, 00000089
        push    edx                                     ; 2C2F _ 52
        push    103                                     ; 2C30 _ 6A, 67
        push    eax                                     ; 2C32 _ 50
        call    set_segmdesc                            ; 2C33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C38 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 2C3B _ FF. 45, F4
?_166:  cmp     dword [ebp-0CH], 1                      ; 2C3E _ 83. 7D, F4, 01
        jle near      ?_165                                   ; 2c42 _ 0f 8e, ffffff65
        call    task_alloc                              ; 2C48 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2C4D _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2C50 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 2C53 _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 2C5A _ A1, 000021C8(d)
        mov     dword [eax], 1                          ; 2C5F _ C7. 00, 00000001
        mov     eax, dword [taskctl]                    ; 2C65 _ A1, 000021C8(d)
        mov     dword [eax+4H], 0                       ; 2C6A _ C7. 40, 04, 00000000
        mov     eax, dword [taskctl]                    ; 2C71 _ A1, 000021C8(d)
        mov     edx, dword [ebp-14H]                    ; 2C76 _ 8B. 55, EC
        mov     dword [eax+8H], edx                     ; 2C79 _ 89. 50, 08
        mov     eax, dword [ebp-14H]                    ; 2C7C _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 2C7F _ 8B. 00
        sub     esp, 12                                 ; 2C81 _ 83. EC, 0C
        push    eax                                     ; 2C84 _ 50
        call    load_tr                                 ; 2C85 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C8A _ 83. C4, 10
        call    timer_alloc                             ; 2C8D _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 2C92 _ A3, 000021C4(d)
        mov     eax, dword [task_timer]                 ; 2C97 _ A1, 000021C4(d)
        sub     esp, 8                                  ; 2C9C _ 83. EC, 08
        push    100                                     ; 2C9F _ 6A, 64
        push    eax                                     ; 2CA1 _ 50
        call    timer_settime                           ; 2CA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CA7 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 2CAA _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 2CAD _ 8B. 5D, FC
        leave                                           ; 2CB0 _ C9
        ret                                             ; 2CB1 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 2CB2 _ 55
        mov     ebp, esp                                ; 2CB3 _ 89. E5
        sub     esp, 16                                 ; 2CB5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2CB8 _ C7. 45, FC, 00000000
        jmp     ?_169                                   ; 2CBF _ E9, 000000F0

?_167:  mov     ecx, dword [taskctl]                    ; 2CC4 _ 8B. 0D, 000021C8(d)
        mov     edx, dword [ebp-4H]                     ; 2CCA _ 8B. 55, FC
        mov     eax, edx                                ; 2CCD _ 89. D0
        add     eax, eax                                ; 2CCF _ 01. C0
        add     eax, edx                                ; 2CD1 _ 01. D0
        add     eax, eax                                ; 2CD3 _ 01. C0
        add     eax, edx                                ; 2CD5 _ 01. D0
        shl     eax, 4                                  ; 2CD7 _ C1. E0, 04
        add     eax, ecx                                ; 2CDA _ 01. C8
        add     eax, 20                                 ; 2CDC _ 83. C0, 14
        mov     eax, dword [eax]                        ; 2CDF _ 8B. 00
        test    eax, eax                                ; 2CE1 _ 85. C0
        jne near      ?_168                                   ; 2ce3 _ 0f 85, 000000c8
        mov     ecx, dword [taskctl]                    ; 2CE9 _ 8B. 0D, 000021C8(d)
        mov     edx, dword [ebp-4H]                     ; 2CEF _ 8B. 55, FC
        mov     eax, edx                                ; 2CF2 _ 89. D0
        add     eax, eax                                ; 2CF4 _ 01. C0
        add     eax, edx                                ; 2CF6 _ 01. D0
        add     eax, eax                                ; 2CF8 _ 01. C0
        add     eax, edx                                ; 2CFA _ 01. D0
        shl     eax, 4                                  ; 2CFC _ C1. E0, 04
        add     eax, 16                                 ; 2CFF _ 83. C0, 10
        add     eax, ecx                                ; 2D02 _ 01. C8
        mov     dword [ebp-8H], eax                     ; 2D04 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 2D07 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 2D0A _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 2D11 _ 8B. 45, F8
        mov     dword [eax+2CH], 514                    ; 2D14 _ C7. 40, 2C, 00000202
        mov     eax, dword [ebp-8H]                     ; 2D1B _ 8B. 45, F8
        mov     dword [eax+30H], 0                      ; 2D1E _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D25 _ 8B. 45, F8
        mov     dword [eax+34H], 0                      ; 2D28 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D2F _ 8B. 45, F8
        mov     dword [eax+38H], 0                      ; 2D32 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D39 _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 2D3C _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D43 _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 2D46 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-4H]                     ; 2D4D _ 8B. 45, FC
        inc     eax                                     ; 2D50 _ 40
        shl     eax, 9                                  ; 2D51 _ C1. E0, 09
        mov     edx, eax                                ; 2D54 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2D56 _ 8B. 45, F8
        mov     dword [eax+40H], edx                    ; 2D59 _ 89. 50, 40
        mov     eax, dword [ebp-8H]                     ; 2D5C _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 2D5F _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D66 _ 8B. 45, F8
        mov     dword [eax+4CH], 0                      ; 2D69 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D70 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 2D73 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D7A _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 2D7D _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D84 _ 8B. 45, F8
        mov     dword [eax+60H], 0                      ; 2D87 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D8E _ 8B. 45, F8
        mov     dword [eax+64H], 0                      ; 2D91 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-8H]                     ; 2D98 _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 2D9B _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 2DA2 _ 8B. 45, F8
        mov     dword [eax+6CH], 1073741824             ; 2DA5 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-8H]                     ; 2DAC _ 8B. 45, F8
        jmp     ?_170                                   ; 2DAF _ EB, 12

?_168:  inc     dword [ebp-4H]                          ; 2DB1 _ FF. 45, FC
?_169:  cmp     dword [ebp-4H], 1                       ; 2DB4 _ 83. 7D, FC, 01
        jle near      ?_167                                   ; 2db8 _ 0f 8e, ffffff06
        mov     eax, 0                                  ; 2DBE _ B8, 00000000
?_170:  leave                                           ; 2DC3 _ C9
        ret                                             ; 2DC4 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 2DC5 _ 55
        mov     ebp, esp                                ; 2DC6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2DC8 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2DCB _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 2DD2 _ A1, 000021C8(d)
        mov     edx, dword [taskctl]                    ; 2DD7 _ 8B. 15, 000021C8(d)
        mov     edx, dword [edx]                        ; 2DDD _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 2DDF _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 2DE2 _ 89. 4C 90, 08
        mov     eax, dword [taskctl]                    ; 2DE6 _ A1, 000021C8(d)
        mov     edx, dword [eax]                        ; 2DEB _ 8B. 10
        inc     edx                                     ; 2DED _ 42
        mov     dword [eax], edx                        ; 2DEE _ 89. 10
        nop                                             ; 2DF0 _ 90
        pop     ebp                                     ; 2DF1 _ 5D
        ret                                             ; 2DF2 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 2DF3 _ 55
        mov     ebp, esp                                ; 2DF4 _ 89. E5
        sub     esp, 8                                  ; 2DF6 _ 83. EC, 08
        mov     eax, dword [task_timer]                 ; 2DF9 _ A1, 000021C4(d)
        sub     esp, 8                                  ; 2DFE _ 83. EC, 08
        push    100                                     ; 2E01 _ 6A, 64
        push    eax                                     ; 2E03 _ 50
        call    timer_settime                           ; 2E04 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E09 _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 2E0C _ A1, 000021C8(d)
        mov     eax, dword [eax]                        ; 2E11 _ 8B. 00
        cmp     eax, 1                                  ; 2E13 _ 83. F8, 01
        jle near      ?_172                                   ; 2e16 _ 7e, 4e
        mov     eax, dword [taskctl]                    ; 2E18 _ A1, 000021C8(d)
        mov     edx, dword [eax+4H]                     ; 2E1D _ 8B. 50, 04
        inc     edx                                     ; 2E20 _ 42
        mov     dword [eax+4H], edx                     ; 2E21 _ 89. 50, 04
        mov     eax, dword [taskctl]                    ; 2E24 _ A1, 000021C8(d)
        mov     edx, dword [eax+4H]                     ; 2E29 _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 2E2C _ A1, 000021C8(d)
        mov     eax, dword [eax]                        ; 2E31 _ 8B. 00
        cmp     edx, eax                                ; 2E33 _ 39. C2
        jnz near      ?_171                                   ; 2e35 _ 75, 0c
        mov     eax, dword [taskctl]                    ; 2E37 _ A1, 000021C8(d)
        mov     dword [eax+4H], 0                       ; 2E3C _ C7. 40, 04, 00000000
?_171:  mov     eax, dword [taskctl]                    ; 2E43 _ A1, 000021C8(d)
        mov     edx, dword [taskctl]                    ; 2E48 _ 8B. 15, 000021C8(d)
        mov     edx, dword [edx+4H]                     ; 2E4E _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 2E51 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 2E55 _ 8B. 00
        sub     esp, 8                                  ; 2E57 _ 83. EC, 08
        push    eax                                     ; 2E5A _ 50
        push    0                                       ; 2E5B _ 6A, 00
        call    farjmp                                  ; 2E5D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E62 _ 83. C4, 10
        nop                                             ; 2E65 _ 90
?_172:  nop                                             ; 2E66 _ 90
        leave                                           ; 2E67 _ C9
        ret                                             ; 2E68 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 2E69 _ 55
        mov     ebp, esp                                ; 2E6A _ 89. E5
        sub     esp, 24                                 ; 2E6C _ 83. EC, 18
        mov     byte [ebp-0DH], 0                       ; 2E6F _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 2E73 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E76 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2E79 _ 83. F8, 02
        jne near      ?_181                                   ; 2e7c _ 0f 85, 000000e9
        mov     eax, dword [taskctl]                    ; 2E82 _ A1, 000021C8(d)
        mov     edx, dword [taskctl]                    ; 2E87 _ 8B. 15, 000021C8(d)
        mov     edx, dword [edx+4H]                     ; 2E8D _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 2E90 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 2E94 _ 39. 45, 08
        jnz near      ?_173                                   ; 2e97 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2E99 _ C6. 45, F3, 01
?_173:  mov     dword [ebp-0CH], 0                      ; 2E9D _ C7. 45, F4, 00000000
        jmp     ?_175                                   ; 2EA4 _ EB, 14

?_174:  mov     eax, dword [taskctl]                    ; 2EA6 _ A1, 000021C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2EAB _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 2EAE _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 2EB2 _ 39. 45, 08
        jz near       ?_176                                   ; 2eb5 _ 74, 11
        inc     dword [ebp-0CH]                         ; 2EB7 _ FF. 45, F4
?_175:  mov     eax, dword [taskctl]                    ; 2EBA _ A1, 000021C8(d)
        mov     eax, dword [eax]                        ; 2EBF _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 2EC1 _ 39. 45, F4
        jl      ?_174                                   ; 2EC4 _ 7C, E0
        jmp     ?_177                                   ; 2EC6 _ EB, 01

?_176:  nop                                             ; 2EC8 _ 90
?_177:  mov     eax, dword [taskctl]                    ; 2EC9 _ A1, 000021C8(d)
        mov     edx, dword [eax]                        ; 2ECE _ 8B. 10
        dec     edx                                     ; 2ED0 _ 4A
        mov     dword [eax], edx                        ; 2ED1 _ 89. 10
        mov     eax, dword [taskctl]                    ; 2ED3 _ A1, 000021C8(d)
        mov     eax, dword [eax+4H]                     ; 2ED8 _ 8B. 40, 04
        cmp     dword [ebp-0CH], eax                    ; 2EDB _ 39. 45, F4
        jge near      ?_179                                   ; 2ede _ 7d, 2d
        mov     eax, dword [taskctl]                    ; 2EE0 _ A1, 000021C8(d)
        mov     edx, dword [eax+4H]                     ; 2EE5 _ 8B. 50, 04
        dec     edx                                     ; 2EE8 _ 4A
        mov     dword [eax+4H], edx                     ; 2EE9 _ 89. 50, 04
        jmp     ?_179                                   ; 2EEC _ EB, 1F

?_178:  mov     edx, dword [taskctl]                    ; 2EEE _ 8B. 15, 000021C8(d)
        mov     eax, dword [ebp-0CH]                    ; 2EF4 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 2EF7 _ 8D. 48, 01
        mov     eax, dword [taskctl]                    ; 2EFA _ A1, 000021C8(d)
        mov     ecx, dword [edx+ecx*4+8H]               ; 2EFF _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 2F03 _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 2F06 _ 89. 4C 90, 08
        inc     dword [ebp-0CH]                         ; 2F0A _ FF. 45, F4
?_179:  mov     eax, dword [taskctl]                    ; 2F0D _ A1, 000021C8(d)
        mov     eax, dword [eax]                        ; 2F12 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 2F14 _ 39. 45, F4
        jl      ?_178                                   ; 2F17 _ 7C, D5
        mov     eax, dword [ebp+8H]                     ; 2F19 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 2F1C _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 2F23 _ 80. 7D, F3, 00
        jz near       ?_181                                   ; 2f27 _ 74, 42
        mov     eax, dword [taskctl]                    ; 2F29 _ A1, 000021C8(d)
        mov     edx, dword [eax+4H]                     ; 2F2E _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 2F31 _ A1, 000021C8(d)
        mov     eax, dword [eax]                        ; 2F36 _ 8B. 00
        cmp     edx, eax                                ; 2F38 _ 39. C2
        jl      ?_180                                   ; 2F3A _ 7C, 0C
        mov     eax, dword [taskctl]                    ; 2F3C _ A1, 000021C8(d)
        mov     dword [eax+4H], 0                       ; 2F41 _ C7. 40, 04, 00000000
?_180:  mov     eax, dword [taskctl]                    ; 2F48 _ A1, 000021C8(d)
        mov     edx, dword [taskctl]                    ; 2F4D _ 8B. 15, 000021C8(d)
        mov     edx, dword [edx+4H]                     ; 2F53 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 2F56 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 2F5A _ 8B. 00
        sub     esp, 8                                  ; 2F5C _ 83. EC, 08
        push    eax                                     ; 2F5F _ 50
        push    0                                       ; 2F60 _ 6A, 00
        call    farjmp                                  ; 2F62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F67 _ 83. C4, 10
        nop                                             ; 2F6A _ 90
?_181:  nop                                             ; 2F6B _ 90
        leave                                           ; 2F6C _ C9
        ret                                             ; 2F6D _ C3
; task_sleep End of function



?_182:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_183:                                                  ; byte
        db 41H, 00H                                     ; 0008 _ A.

?_184:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 000A _ 3[sec].

?_185:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_186:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_187:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_188:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_189:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_190:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0042 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 004A _ w: .



memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH                           ; 0070 _ 230.

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0074 _ 0X

?_191:  db 00H                                          ; 0076 _ .

?_192:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1900:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1947:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 00C0 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 00C8 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00D8 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0100 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0110 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0120 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0130 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0140 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0150 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0168 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0178 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0188 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0198 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 01A8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 01B8 _ .....***

closebtn.2057:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 01C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0200 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0210 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0220 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0230 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0238 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0240 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0248 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0250 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0258 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0260 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0268 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0280 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0288 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0290 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0298 _ @@@@@@@@



bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_193:                                                  ; dword
        resb    2                                       ; 0004

?_194:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_195:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_196:  resd    1                                       ; 00EC

timerinfo:                                              ; byte
        resb    28                                      ; 00F0

timerbuf: resq  1                                       ; 010C

mx:     resd    1                                       ; 0114

my:     resd    1                                       ; 0118

xsize:  resd    1                                       ; 011C

ysize:  resd    1                                       ; 0120

buf_back: resd  7                                       ; 0124

buf_mouse:                                              ; byte
        resb    256                                     ; 0140

shtMsgBox:                                              ; dword
        resd    1                                       ; 0240

shtctl: resd    1                                       ; 0244

sht_back: resd  1                                       ; 0248

sht_mouse:                                              ; dword
        resd    1                                       ; 024C

task_b: resd    1                                       ; 0250

g_timer_b:                                              ; oword
        resb    16                                      ; 0254

task_a.1839:                                            ; dword
        resd    1                                       ; 0264

task_b.1840:                                            ; dword
        resd    1                                       ; 0268

str.1995:                                               ; byte
        resb    1                                       ; 026C

?_197:  resb    9                                       ; 026D

?_198:  resb    10                                      ; 0276

timerctl:                                               ; byte
        resd    1                                       ; 0280

?_199:                                                  ; byte
        resb    4                                       ; 0284

?_200:                                                  ; byte
        resb    4                                       ; 0288

?_201:                                                  ; byte
        resb    4                                       ; 028C

?_202:                                                  ; byte
        resb    7988                                    ; 0290

task_timer:                                             ; dword
        resd    1                                       ; 21C4

taskctl: resd   1                                       ; 21C8


