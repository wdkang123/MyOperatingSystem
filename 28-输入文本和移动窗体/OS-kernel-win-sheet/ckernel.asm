; Disassembly of file: ckernel.o
; Mon Feb  1 16:38:50 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 68                                 ; 0004 _ 83. EC, 44
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-18H], eax                    ; 001C _ 89. 45, E8
        mov     eax, dword [?_170]                      ; 001F _ A1, 00000004(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 00000118(d)
        mov     ax, word [?_171]                        ; 002A _ 66: A1, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ysize], eax                      ; 0031 _ A3, 0000011C(d)
        mov     dword [ebp-1CH], 0                      ; 0036 _ C7. 45, E4, 00000000
        mov     dword [ebp-20H], 0                      ; 003D _ C7. 45, E0, 00000000
        call    init_pit                                ; 0044 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 0049 _ 83. EC, 04
        push    timerbuf                                ; 004C _ 68, 00000108(d)
        push    8                                       ; 0051 _ 6A, 08
        push    timerinfo                               ; 0053 _ 68, 000000F0(d)
        call    fifo8_init                              ; 0058 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 005D _ 83. C4, 10
        call    timer_alloc                             ; 0060 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0065 _ 89. 45, DC
        sub     esp, 4                                  ; 0068 _ 83. EC, 04
        push    10                                      ; 006B _ 6A, 0A
        push    timerinfo                               ; 006D _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 0072 _ FF. 75, DC
        call    timer_init                              ; 0075 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007A _ 83. C4, 10
        sub     esp, 8                                  ; 007D _ 83. EC, 08
        push    500                                     ; 0080 _ 68, 000001F4
        push    dword [ebp-24H]                         ; 0085 _ FF. 75, DC
        call    timer_settime                           ; 0088 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008D _ 83. C4, 10
        call    timer_alloc                             ; 0090 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0095 _ 89. 45, D8
        sub     esp, 4                                  ; 0098 _ 83. EC, 04
        push    2                                       ; 009B _ 6A, 02
        push    timerinfo                               ; 009D _ 68, 000000F0(d)
        push    dword [ebp-28H]                         ; 00A2 _ FF. 75, D8
        call    timer_init                              ; 00A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AA _ 83. C4, 10
        sub     esp, 8                                  ; 00AD _ 83. EC, 08
        push    300                                     ; 00B0 _ 68, 0000012C
        push    dword [ebp-28H]                         ; 00B5 _ FF. 75, D8
        call    timer_settime                           ; 00B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00BD _ 83. C4, 10
        call    timer_alloc                             ; 00C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 00C5 _ 89. 45, D4
        sub     esp, 4                                  ; 00C8 _ 83. EC, 04
        push    1                                       ; 00CB _ 6A, 01
        push    timerinfo                               ; 00CD _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 00D2 _ FF. 75, D4
        call    timer_init                              ; 00D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DA _ 83. C4, 10
        sub     esp, 8                                  ; 00DD _ 83. EC, 08
        push    50                                      ; 00E0 _ 6A, 32
        push    dword [ebp-2CH]                         ; 00E2 _ FF. 75, D4
        call    timer_settime                           ; 00E5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EA _ 83. C4, 10
        sub     esp, 4                                  ; 00ED _ 83. EC, 04
        push    keybuf                                  ; 00F0 _ 68, 00000040(d)
        push    32                                      ; 00F5 _ 6A, 20
        push    keyinfo                                 ; 00F7 _ 68, 00000008(d)
        call    fifo8_init                              ; 00FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0101 _ 83. C4, 10
        sub     esp, 4                                  ; 0104 _ 83. EC, 04
        push    mousebuf                                ; 0107 _ 68, 00000060(d)
        push    128                                     ; 010C _ 68, 00000080
        push    mouseinfo                               ; 0111 _ 68, 00000020(d)
        call    fifo8_init                              ; 0116 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011B _ 83. C4, 10
        call    init_palette                            ; 011E _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0123 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0128 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 012D _ 89. 45, D0
        call    get_adr_buffer                          ; 0130 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0135 _ 89. 45, CC
        mov     eax, dword [memman]                     ; 0138 _ A1, 00000000(d)
        sub     esp, 12                                 ; 013D _ 83. EC, 0C
        push    eax                                     ; 0140 _ 50
        call    memman_init                             ; 0141 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0146 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0149 _ A1, 00000000(d)
        sub     esp, 4                                  ; 014E _ 83. EC, 04
        push    1072594944                              ; 0151 _ 68, 3FEE8000
        push    16809984                                ; 0156 _ 68, 01008000
        push    eax                                     ; 015B _ 50
        call    memman_free                             ; 015C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0161 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0164 _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 016A _ 8B. 15, 00000118(d)
        mov     eax, dword [memman]                     ; 0170 _ A1, 00000000(d)
        push    ecx                                     ; 0175 _ 51
        push    edx                                     ; 0176 _ 52
        push    dword [ebp-18H]                         ; 0177 _ FF. 75, E8
        push    eax                                     ; 017A _ 50
        call    shtctl_init                             ; 017B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0180 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 0183 _ 89. 45, C8
        sub     esp, 12                                 ; 0186 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 0189 _ FF. 75, C8
        call    sheet_alloc                             ; 018C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0191 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0194 _ 89. 45, E4
        sub     esp, 12                                 ; 0197 _ 83. EC, 0C
        push    dword [ebp-38H]                         ; 019A _ FF. 75, C8
        call    sheet_alloc                             ; 019D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01A2 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 01A5 _ 89. 45, E0
        mov     edx, dword [xsize]                      ; 01A8 _ 8B. 15, 00000118(d)
        mov     eax, dword [ysize]                      ; 01AE _ A1, 0000011C(d)
        imul    edx, eax                                ; 01B3 _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B6 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01BB _ 83. EC, 08
        push    edx                                     ; 01BE _ 52
        push    eax                                     ; 01BF _ 50
        call    memman_alloc_4k                         ; 01C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C5 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C8 _ A3, 00000120(d)
        mov     ecx, dword [ysize]                      ; 01CD _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 01D3 _ 8B. 15, 00000118(d)
        mov     eax, dword [buf_back]                   ; 01D9 _ A1, 00000120(d)
        sub     esp, 12                                 ; 01DE _ 83. EC, 0C
        push    99                                      ; 01E1 _ 6A, 63
        push    ecx                                     ; 01E3 _ 51
        push    edx                                     ; 01E4 _ 52
        push    eax                                     ; 01E5 _ 50
        push    dword [ebp-1CH]                         ; 01E6 _ FF. 75, E4
        call    sheet_setbuf                            ; 01E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EE _ 83. C4, 20
        sub     esp, 12                                 ; 01F1 _ 83. EC, 0C
        push    99                                      ; 01F4 _ 6A, 63
        push    16                                      ; 01F6 _ 6A, 10
        push    16                                      ; 01F8 _ 6A, 10
        push    buf_mouse                               ; 01FA _ 68, 00000140(d)
        push    dword [ebp-20H]                         ; 01FF _ FF. 75, E0
        call    sheet_setbuf                            ; 0202 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0207 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020A _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 0210 _ 8B. 15, 00000118(d)
        mov     eax, dword [buf_back]                   ; 0216 _ A1, 00000120(d)
        sub     esp, 4                                  ; 021B _ 83. EC, 04
        push    ecx                                     ; 021E _ 51
        push    edx                                     ; 021F _ 52
        push    eax                                     ; 0220 _ 50
        call    init_screen8                            ; 0221 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0226 _ 83. C4, 10
        sub     esp, 8                                  ; 0229 _ 83. EC, 08
        push    99                                      ; 022C _ 6A, 63
        push    buf_mouse                               ; 022E _ 68, 00000140(d)
        call    init_mouse_cursor                       ; 0233 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0238 _ 83. C4, 10
        push    0                                       ; 023B _ 6A, 00
        push    0                                       ; 023D _ 6A, 00
        push    dword [ebp-1CH]                         ; 023F _ FF. 75, E4
        push    dword [ebp-38H]                         ; 0242 _ FF. 75, C8
        call    sheet_slide                             ; 0245 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 024A _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 024D _ A1, 00000118(d)
        sub     eax, 16                                 ; 0252 _ 83. E8, 10
        mov     edx, eax                                ; 0255 _ 89. C2
        shr     edx, 31                                 ; 0257 _ C1. EA, 1F
        add     eax, edx                                ; 025A _ 01. D0
        sar     eax, 1                                  ; 025C _ D1. F8
        mov     dword [mx], eax                         ; 025E _ A3, 00000110(d)
        mov     eax, dword [ysize]                      ; 0263 _ A1, 0000011C(d)
        sub     eax, 44                                 ; 0268 _ 83. E8, 2C
        mov     edx, eax                                ; 026B _ 89. C2
        shr     edx, 31                                 ; 026D _ C1. EA, 1F
        add     eax, edx                                ; 0270 _ 01. D0
        sar     eax, 1                                  ; 0272 _ D1. F8
        mov     dword [my], eax                         ; 0274 _ A3, 00000114(d)
        mov     edx, dword [my]                         ; 0279 _ 8B. 15, 00000114(d)
        mov     eax, dword [mx]                         ; 027F _ A1, 00000110(d)
        push    edx                                     ; 0284 _ 52
        push    eax                                     ; 0285 _ 50
        push    dword [ebp-20H]                         ; 0286 _ FF. 75, E0
        push    dword [ebp-38H]                         ; 0289 _ FF. 75, C8
        call    sheet_slide                             ; 028C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0291 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 0294 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 029B _ C7. 45, F0, 00000007
        sub     esp, 8                                  ; 02A2 _ 83. EC, 08
        push    ?_159                                   ; 02A5 _ 68, 00000000(d)
        push    dword [ebp-38H]                         ; 02AA _ FF. 75, C8
        call    message_box                             ; 02AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02B2 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02B5 _ A3, 00000240(d)
        sub     esp, 4                                  ; 02BA _ 83. EC, 04
        push    0                                       ; 02BD _ 6A, 00
        push    dword [ebp-1CH]                         ; 02BF _ FF. 75, E4
        push    dword [ebp-38H]                         ; 02C2 _ FF. 75, C8
        call    sheet_updown                            ; 02C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02CA _ 83. C4, 10
        sub     esp, 4                                  ; 02CD _ 83. EC, 04
        push    100                                     ; 02D0 _ 6A, 64
        push    dword [ebp-20H]                         ; 02D2 _ FF. 75, E0
        push    dword [ebp-38H]                         ; 02D5 _ FF. 75, C8
        call    sheet_updown                            ; 02D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02DD _ 83. C4, 10
        call    io_sti                                  ; 02E0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02E5 _ 83. EC, 0C
        push    mdec                                    ; 02E8 _ 68, 000000E0(d)
        call    enable_mouse                            ; 02ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F2 _ 83. C4, 10
        mov     dword [ebp-3CH], 0                      ; 02F5 _ C7. 45, C4, 00000000
        mov     dword [ebp-14H], 0                      ; 02FC _ C7. 45, EC, 00000000
?_001:  call    io_cli                                  ; 0303 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0308 _ 83. EC, 0C
        push    keyinfo                                 ; 030B _ 68, 00000008(d)
        call    fifo8_status                            ; 0310 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0315 _ 83. C4, 10
        mov     ebx, eax                                ; 0318 _ 89. C3
        sub     esp, 12                                 ; 031A _ 83. EC, 0C
        push    mouseinfo                               ; 031D _ 68, 00000020(d)
        call    fifo8_status                            ; 0322 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0327 _ 83. C4, 10
        add     ebx, eax                                ; 032A _ 01. C3
        sub     esp, 12                                 ; 032C _ 83. EC, 0C
        push    timerinfo                               ; 032F _ 68, 000000F0(d)
        call    fifo8_status                            ; 0334 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0339 _ 83. C4, 10
        add     eax, ebx                                ; 033C _ 01. D8
        test    eax, eax                                ; 033E _ 85. C0
        jnz near      ?_002                                   ; 0340 _ 75, 07
        call    io_sti                                  ; 0342 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0347 _ EB, BA

?_002:  sub     esp, 12                                 ; 0349 _ 83. EC, 0C
        push    keyinfo                                 ; 034C _ 68, 00000008(d)
        call    fifo8_status                            ; 0351 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0356 _ 83. C4, 10
        test    eax, eax                                ; 0359 _ 85. C0
        je near       ?_004                                   ; 035b _ 0f 84, 0000016b
        call    io_sti                                  ; 0361 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0366 _ 83. EC, 0C
        push    keyinfo                                 ; 0369 _ 68, 00000008(d)
        call    fifo8_get                               ; 036E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0373 _ 83. C4, 10
        mov     dword [ebp-3CH], eax                    ; 0376 _ 89. 45, C4
        cmp     dword [ebp-3CH], 28                     ; 0379 _ 83. 7D, C4, 1C
        jnz near      ?_003                                   ; 037d _ 75, 54
        mov     ecx, dword [xsize]                      ; 037F _ 8B. 0D, 00000118(d)
        mov     edx, dword [buf_back]                   ; 0385 _ 8B. 15, 00000120(d)
        mov     ebx, dword [ebp-14H]                    ; 038B _ 8B. 5D, EC
        mov     eax, ebx                                ; 038E _ 89. D8
        shl     eax, 2                                  ; 0390 _ C1. E0, 02
        add     eax, ebx                                ; 0393 _ 01. D8
        shl     eax, 2                                  ; 0395 _ C1. E0, 02
        mov     ebx, eax                                ; 0398 _ 89. C3
        mov     eax, dword [ebp-34H]                    ; 039A _ 8B. 45, CC
        add     eax, ebx                                ; 039D _ 01. D8
        sub     esp, 4                                  ; 039F _ 83. EC, 04
        push    7                                       ; 03A2 _ 6A, 07
        push    ecx                                     ; 03A4 _ 51
        push    dword [ebp-14H]                         ; 03A5 _ FF. 75, EC
        push    edx                                     ; 03A8 _ 52
        push    eax                                     ; 03A9 _ 50
        push    dword [ebp-1CH]                         ; 03AA _ FF. 75, E4
        push    dword [ebp-38H]                         ; 03AD _ FF. 75, C8
        call    showMemoryInfo                          ; 03B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03B5 _ 83. C4, 20
        inc     dword [ebp-14H]                         ; 03B8 _ FF. 45, EC
        mov     eax, dword [ebp-14H]                    ; 03BB _ 8B. 45, EC
        cmp     eax, dword [ebp-30H]                    ; 03BE _ 3B. 45, D0
        jle near      ?_001                                   ; 03c1 _ 0f 8e, ffffff3c
        mov     dword [ebp-14H], 0                      ; 03C7 _ C7. 45, EC, 00000000
        jmp     ?_001                                   ; 03CE _ E9, FFFFFF30

?_003:  mov     eax, dword [ebp-3CH]                    ; 03D3 _ 8B. 45, C4
        add     eax, keytable                           ; 03D6 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 03DB _ 8A. 00
        test    al, al                                  ; 03DD _ 84. C0
        je near       ?_001                                   ; 03df _ 0f 84, ffffff1e
        cmp     dword [ebp-0CH], 143                    ; 03E5 _ 81. 7D, F4, 0000008F
        jg  near      ?_001                                   ; 03ec _ 0f 8f, ffffff11
        mov     eax, dword [ebp-0CH]                    ; 03F2 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 03F5 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 03F8 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 03FD _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0400 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0405 _ 8B. 00
        sub     esp, 4                                  ; 0407 _ 83. EC, 04
        push    43                                      ; 040A _ 6A, 2B
        push    ecx                                     ; 040C _ 51
        push    28                                      ; 040D _ 6A, 1C
        push    dword [ebp-0CH]                         ; 040F _ FF. 75, F4
        push    7                                       ; 0412 _ 6A, 07
        push    edx                                     ; 0414 _ 52
        push    eax                                     ; 0415 _ 50
        call    boxfill8                                ; 0416 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 041B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 041E _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0421 _ 8D. 50, 08
        mov     eax, dword [shtMsgBox]                  ; 0424 _ A1, 00000240(d)
        sub     esp, 8                                  ; 0429 _ 83. EC, 08
        push    44                                      ; 042C _ 6A, 2C
        push    edx                                     ; 042E _ 52
        push    28                                      ; 042F _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0431 _ FF. 75, F4
        push    eax                                     ; 0434 _ 50
        push    dword [ebp-38H]                         ; 0435 _ FF. 75, C8
        call    sheet_refresh                           ; 0438 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 043D _ 83. C4, 20
        mov     eax, dword [ebp-3CH]                    ; 0440 _ 8B. 45, C4
        add     eax, keytable                           ; 0443 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0448 _ 8A. 00
        mov     byte [ebp-42H], al                      ; 044A _ 88. 45, BE
        mov     byte [ebp-41H], 0                       ; 044D _ C6. 45, BF, 00
        mov     eax, dword [shtMsgBox]                  ; 0451 _ A1, 00000240(d)
        sub     esp, 8                                  ; 0456 _ 83. EC, 08
        lea     edx, [ebp-42H]                          ; 0459 _ 8D. 55, BE
        push    edx                                     ; 045C _ 52
        push    0                                       ; 045D _ 6A, 00
        push    28                                      ; 045F _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0461 _ FF. 75, F4
        push    eax                                     ; 0464 _ 50
        push    dword [ebp-38H]                         ; 0465 _ FF. 75, C8
        call    showString                              ; 0468 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 046D _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0470 _ 83. 45, F4, 08
        mov     eax, dword [ebp-0CH]                    ; 0474 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0477 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 047A _ 8B. 45, F0
        movzx   ecx, al                                 ; 047D _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0480 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0485 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0488 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 048D _ 8B. 00
        sub     esp, 4                                  ; 048F _ 83. EC, 04
        push    43                                      ; 0492 _ 6A, 2B
        push    ebx                                     ; 0494 _ 53
        push    28                                      ; 0495 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0497 _ FF. 75, F4
        push    ecx                                     ; 049A _ 51
        push    edx                                     ; 049B _ 52
        push    eax                                     ; 049C _ 50
        call    boxfill8                                ; 049D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A2 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 04A5 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 04A8 _ 8D. 50, 08
        mov     eax, dword [shtMsgBox]                  ; 04AB _ A1, 00000240(d)
        sub     esp, 8                                  ; 04B0 _ 83. EC, 08
        push    44                                      ; 04B3 _ 6A, 2C
        push    edx                                     ; 04B5 _ 52
        push    28                                      ; 04B6 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 04B8 _ FF. 75, F4
        push    eax                                     ; 04BB _ 50
        push    dword [ebp-38H]                         ; 04BC _ FF. 75, C8
        call    sheet_refresh                           ; 04BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04C4 _ 83. C4, 20
        jmp     ?_001                                   ; 04C7 _ E9, FFFFFE37

?_004:  sub     esp, 12                                 ; 04CC _ 83. EC, 0C
        push    mouseinfo                               ; 04CF _ 68, 00000020(d)
        call    fifo8_status                            ; 04D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D9 _ 83. C4, 10
        test    eax, eax                                ; 04DC _ 85. C0
        jz near       ?_005                                   ; 04de _ 74, 19
        sub     esp, 4                                  ; 04E0 _ 83. EC, 04
        push    dword [ebp-20H]                         ; 04E3 _ FF. 75, E0
        push    dword [ebp-1CH]                         ; 04E6 _ FF. 75, E4
        push    dword [ebp-38H]                         ; 04E9 _ FF. 75, C8
        call    show_mouse_info                         ; 04EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F1 _ 83. C4, 10
        jmp     ?_001                                   ; 04F4 _ E9, FFFFFE0A

?_005:  sub     esp, 12                                 ; 04F9 _ 83. EC, 0C
        push    timerinfo                               ; 04FC _ 68, 000000F0(d)
        call    fifo8_status                            ; 0501 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0506 _ 83. C4, 10
        test    eax, eax                                ; 0509 _ 85. C0
        je near       ?_001                                   ; 050b _ 0f 84, fffffdf2
        call    io_sti                                  ; 0511 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0516 _ 83. EC, 0C
        push    timerinfo                               ; 0519 _ 68, 000000F0(d)
        call    fifo8_get                               ; 051E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0523 _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 0526 _ 89. 45, C0
        cmp     dword [ebp-40H], 10                     ; 0529 _ 83. 7D, C0, 0A
        jnz near      ?_006                                   ; 052d _ 75, 21
        sub     esp, 8                                  ; 052F _ 83. EC, 08
        push    ?_160                                   ; 0532 _ 68, 00000008(d)
        push    7                                       ; 0537 _ 6A, 07
        push    0                                       ; 0539 _ 6A, 00
        push    0                                       ; 053B _ 6A, 00
        push    dword [ebp-1CH]                         ; 053D _ FF. 75, E4
        push    dword [ebp-38H]                         ; 0540 _ FF. 75, C8
        call    showString                              ; 0543 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0548 _ 83. C4, 20
        jmp     ?_001                                   ; 054B _ E9, FFFFFDB3

?_006:  cmp     dword [ebp-40H], 2                      ; 0550 _ 83. 7D, C0, 02
        jnz near      ?_007                                   ; 0554 _ 75, 21
        sub     esp, 8                                  ; 0556 _ 83. EC, 08
        push    ?_161                                   ; 0559 _ 68, 00000014(d)
        push    7                                       ; 055E _ 6A, 07
        push    16                                      ; 0560 _ 6A, 10
        push    0                                       ; 0562 _ 6A, 00
        push    dword [ebp-1CH]                         ; 0564 _ FF. 75, E4
        push    dword [ebp-38H]                         ; 0567 _ FF. 75, C8
        call    showString                              ; 056A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056F _ 83. C4, 20
        jmp     ?_001                                   ; 0572 _ E9, FFFFFD8C

?_007:  cmp     dword [ebp-40H], 0                      ; 0577 _ 83. 7D, C0, 00
        jz near       ?_008                                   ; 057b _ 74, 1e
        sub     esp, 4                                  ; 057D _ 83. EC, 04
        push    0                                       ; 0580 _ 6A, 00
        push    timerinfo                               ; 0582 _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 0587 _ FF. 75, D4
        call    timer_init                              ; 058A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 058F _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0592 _ C7. 45, F0, 00000000
        jmp     ?_009                                   ; 0599 _ EB, 1C

?_008:  sub     esp, 4                                  ; 059B _ 83. EC, 04
        push    1                                       ; 059E _ 6A, 01
        push    timerinfo                               ; 05A0 _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 05A5 _ FF. 75, D4
        call    timer_init                              ; 05A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05AD _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 05B0 _ C7. 45, F0, 00000007
?_009:  sub     esp, 8                                  ; 05B7 _ 83. EC, 08
        push    50                                      ; 05BA _ 6A, 32
        push    dword [ebp-2CH]                         ; 05BC _ FF. 75, D4
        call    timer_settime                           ; 05BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 05C7 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 05CA _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 05CD _ 8B. 45, F0
        movzx   ecx, al                                 ; 05D0 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 05D3 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 05D8 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 05DB _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 05E0 _ 8B. 00
        sub     esp, 4                                  ; 05E2 _ 83. EC, 04
        push    43                                      ; 05E5 _ 6A, 2B
        push    ebx                                     ; 05E7 _ 53
        push    28                                      ; 05E8 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05EA _ FF. 75, F4
        push    ecx                                     ; 05ED _ 51
        push    edx                                     ; 05EE _ 52
        push    eax                                     ; 05EF _ 50
        call    boxfill8                                ; 05F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F5 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 05F8 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 05FB _ 8D. 50, 08
        mov     eax, dword [shtMsgBox]                  ; 05FE _ A1, 00000240(d)
        sub     esp, 8                                  ; 0603 _ 83. EC, 08
        push    44                                      ; 0606 _ 6A, 2C
        push    edx                                     ; 0608 _ 52
        push    28                                      ; 0609 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 060B _ FF. 75, F4
        push    eax                                     ; 060E _ 50
        push    dword [ebp-38H]                         ; 060F _ FF. 75, C8
        call    sheet_refresh                           ; 0612 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0617 _ 83. C4, 20
        jmp     ?_001                                   ; 061A _ E9, FFFFFCE4
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 061F _ 55
        mov     ebp, esp                                ; 0620 _ 89. E5
        push    ebx                                     ; 0622 _ 53
        sub     esp, 4                                  ; 0623 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0626 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0629 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 062C _ 8B. 45, 0C
        dec     eax                                     ; 062F _ 48
        sub     esp, 4                                  ; 0630 _ 83. EC, 04
        push    edx                                     ; 0633 _ 52
        push    eax                                     ; 0634 _ 50
        push    0                                       ; 0635 _ 6A, 00
        push    0                                       ; 0637 _ 6A, 00
        push    14                                      ; 0639 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 063B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 063E _ FF. 75, 08
        call    boxfill8                                ; 0641 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0646 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0649 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 064C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 064F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0652 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0655 _ 8B. 45, 10
        sub     eax, 28                                 ; 0658 _ 83. E8, 1C
        sub     esp, 4                                  ; 065B _ 83. EC, 04
        push    ecx                                     ; 065E _ 51
        push    edx                                     ; 065F _ 52
        push    eax                                     ; 0660 _ 50
        push    0                                       ; 0661 _ 6A, 00
        push    8                                       ; 0663 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0665 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0668 _ FF. 75, 08
        call    boxfill8                                ; 066B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0670 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0673 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0676 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0679 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 067C _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 067F _ 8B. 45, 10
        sub     eax, 27                                 ; 0682 _ 83. E8, 1B
        sub     esp, 4                                  ; 0685 _ 83. EC, 04
        push    ecx                                     ; 0688 _ 51
        push    edx                                     ; 0689 _ 52
        push    eax                                     ; 068A _ 50
        push    0                                       ; 068B _ 6A, 00
        push    7                                       ; 068D _ 6A, 07
        push    dword [ebp+0CH]                         ; 068F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0692 _ FF. 75, 08
        call    boxfill8                                ; 0695 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 069A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 069D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 06A0 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 06A3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 06A6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 06A9 _ 8B. 45, 10
        sub     eax, 26                                 ; 06AC _ 83. E8, 1A
        sub     esp, 4                                  ; 06AF _ 83. EC, 04
        push    ecx                                     ; 06B2 _ 51
        push    edx                                     ; 06B3 _ 52
        push    eax                                     ; 06B4 _ 50
        push    0                                       ; 06B5 _ 6A, 00
        push    8                                       ; 06B7 _ 6A, 08
        push    dword [ebp+0CH]                         ; 06B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06BC _ FF. 75, 08
        call    boxfill8                                ; 06BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06C4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 06C7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 06CA _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 06CD _ 8B. 45, 10
        sub     eax, 24                                 ; 06D0 _ 83. E8, 18
        sub     esp, 4                                  ; 06D3 _ 83. EC, 04
        push    edx                                     ; 06D6 _ 52
        push    59                                      ; 06D7 _ 6A, 3B
        push    eax                                     ; 06D9 _ 50
        push    3                                       ; 06DA _ 6A, 03
        push    7                                       ; 06DC _ 6A, 07
        push    dword [ebp+0CH]                         ; 06DE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06E1 _ FF. 75, 08
        call    boxfill8                                ; 06E4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06E9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 06EC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 06EF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 06F2 _ 8B. 45, 10
        sub     eax, 24                                 ; 06F5 _ 83. E8, 18
        sub     esp, 4                                  ; 06F8 _ 83. EC, 04
        push    edx                                     ; 06FB _ 52
        push    2                                       ; 06FC _ 6A, 02
        push    eax                                     ; 06FE _ 50
        push    2                                       ; 06FF _ 6A, 02
        push    7                                       ; 0701 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0703 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0706 _ FF. 75, 08
        call    boxfill8                                ; 0709 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 070E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0711 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0714 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0717 _ 8B. 45, 10
        sub     eax, 4                                  ; 071A _ 83. E8, 04
        sub     esp, 4                                  ; 071D _ 83. EC, 04
        push    edx                                     ; 0720 _ 52
        push    59                                      ; 0721 _ 6A, 3B
        push    eax                                     ; 0723 _ 50
        push    3                                       ; 0724 _ 6A, 03
        push    15                                      ; 0726 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0728 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 072B _ FF. 75, 08
        call    boxfill8                                ; 072E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0733 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0736 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0739 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 073C _ 8B. 45, 10
        sub     eax, 23                                 ; 073F _ 83. E8, 17
        sub     esp, 4                                  ; 0742 _ 83. EC, 04
        push    edx                                     ; 0745 _ 52
        push    59                                      ; 0746 _ 6A, 3B
        push    eax                                     ; 0748 _ 50
        push    59                                      ; 0749 _ 6A, 3B
        push    15                                      ; 074B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 074D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0750 _ FF. 75, 08
        call    boxfill8                                ; 0753 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0758 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 075B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 075E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0761 _ 8B. 45, 10
        sub     eax, 3                                  ; 0764 _ 83. E8, 03
        sub     esp, 4                                  ; 0767 _ 83. EC, 04
        push    edx                                     ; 076A _ 52
        push    59                                      ; 076B _ 6A, 3B
        push    eax                                     ; 076D _ 50
        push    2                                       ; 076E _ 6A, 02
        push    0                                       ; 0770 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0772 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0775 _ FF. 75, 08
        call    boxfill8                                ; 0778 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 077D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0780 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0783 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0786 _ 8B. 45, 10
        sub     eax, 24                                 ; 0789 _ 83. E8, 18
        sub     esp, 4                                  ; 078C _ 83. EC, 04
        push    edx                                     ; 078F _ 52
        push    60                                      ; 0790 _ 6A, 3C
        push    eax                                     ; 0792 _ 50
        push    60                                      ; 0793 _ 6A, 3C
        push    0                                       ; 0795 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0797 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 079A _ FF. 75, 08
        call    boxfill8                                ; 079D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07A2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 07A5 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 07A8 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 07AB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 07AE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 07B1 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 07B4 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 07B7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 07BA _ 83. E8, 2F
        sub     esp, 4                                  ; 07BD _ 83. EC, 04
        push    ebx                                     ; 07C0 _ 53
        push    ecx                                     ; 07C1 _ 51
        push    edx                                     ; 07C2 _ 52
        push    eax                                     ; 07C3 _ 50
        push    15                                      ; 07C4 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 07C6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07C9 _ FF. 75, 08
        call    boxfill8                                ; 07CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07D1 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 07D4 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 07D7 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 07DA _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 07DD _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 07E0 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 07E3 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 07E6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 07E9 _ 83. E8, 2F
        sub     esp, 4                                  ; 07EC _ 83. EC, 04
        push    ebx                                     ; 07EF _ 53
        push    ecx                                     ; 07F0 _ 51
        push    edx                                     ; 07F1 _ 52
        push    eax                                     ; 07F2 _ 50
        push    15                                      ; 07F3 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 07F5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07F8 _ FF. 75, 08
        call    boxfill8                                ; 07FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0800 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0803 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0806 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0809 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 080C _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 080F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0812 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0815 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0818 _ 83. E8, 2F
        sub     esp, 4                                  ; 081B _ 83. EC, 04
        push    ebx                                     ; 081E _ 53
        push    ecx                                     ; 081F _ 51
        push    edx                                     ; 0820 _ 52
        push    eax                                     ; 0821 _ 50
        push    7                                       ; 0822 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0824 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0827 _ FF. 75, 08
        call    boxfill8                                ; 082A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 082F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0832 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0835 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0838 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 083B _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 083E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0841 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0844 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0847 _ 83. E8, 03
        sub     esp, 4                                  ; 084A _ 83. EC, 04
        push    ebx                                     ; 084D _ 53
        push    ecx                                     ; 084E _ 51
        push    edx                                     ; 084F _ 52
        push    eax                                     ; 0850 _ 50
        push    7                                       ; 0851 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0853 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0856 _ FF. 75, 08
        call    boxfill8                                ; 0859 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 085E _ 83. C4, 20
        nop                                             ; 0861 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0862 _ 8B. 5D, FC
        leave                                           ; 0865 _ C9
        ret                                             ; 0866 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0867 _ 55
        mov     ebp, esp                                ; 0868 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 086A _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 086D _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0870 _ A1, 00000110(d)
        add     eax, edx                                ; 0875 _ 01. D0
        mov     dword [mx], eax                         ; 0877 _ A3, 00000110(d)
        mov     eax, dword [ebp+10H]                    ; 087C _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 087F _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0882 _ A1, 00000114(d)
        add     eax, edx                                ; 0887 _ 01. D0
        mov     dword [my], eax                         ; 0889 _ A3, 00000114(d)
        mov     eax, dword [mx]                         ; 088E _ A1, 00000110(d)
        test    eax, eax                                ; 0893 _ 85. C0
        jns     ?_010                                   ; 0895 _ 79, 0A
        mov     dword [mx], 0                           ; 0897 _ C7. 05, 00000110(d), 00000000
?_010:  mov     eax, dword [my]                         ; 08A1 _ A1, 00000114(d)
        test    eax, eax                                ; 08A6 _ 85. C0
        jns     ?_011                                   ; 08A8 _ 79, 0A
        mov     dword [my], 0                           ; 08AA _ C7. 05, 00000114(d), 00000000
?_011:  mov     edx, dword [xsize]                      ; 08B4 _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 08BA _ A1, 00000110(d)
        cmp     edx, eax                                ; 08BF _ 39. C2
        jg  near      ?_012                                   ; 08c1 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 08C3 _ A1, 00000118(d)
        dec     eax                                     ; 08C8 _ 48
        mov     dword [mx], eax                         ; 08C9 _ A3, 00000110(d)
?_012:  mov     edx, dword [ysize]                      ; 08CE _ 8B. 15, 0000011C(d)
        mov     eax, dword [my]                         ; 08D4 _ A1, 00000114(d)
        cmp     edx, eax                                ; 08D9 _ 39. C2
        jg  near      ?_013                                   ; 08db _ 7f, 0b
        mov     eax, dword [ysize]                      ; 08DD _ A1, 0000011C(d)
        dec     eax                                     ; 08E2 _ 48
        mov     dword [my], eax                         ; 08E3 _ A3, 00000114(d)
?_013:  nop                                             ; 08E8 _ 90
        pop     ebp                                     ; 08E9 _ 5D
        ret                                             ; 08EA _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 08EB _ 55
        mov     ebp, esp                                ; 08EC _ 89. E5
        sub     esp, 24                                 ; 08EE _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 08F1 _ A1, 00000120(d)
        mov     dword [ebp-0CH], eax                    ; 08F6 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 08F9 _ C6. 45, F3, 00
        call    io_sti                                  ; 08FD _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0902 _ 83. EC, 0C
        push    mouseinfo                               ; 0905 _ 68, 00000020(d)
        call    fifo8_get                               ; 090A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 090F _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0912 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0915 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0919 _ 83. EC, 08
        push    eax                                     ; 091C _ 50
        push    mdec                                    ; 091D _ 68, 000000E0(d)
        call    mouse_decode                            ; 0922 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0927 _ 83. C4, 10
        test    eax, eax                                ; 092A _ 85. C0
        jz near       ?_014                                   ; 092c _ 74, 60
        sub     esp, 4                                  ; 092E _ 83. EC, 04
        push    mdec                                    ; 0931 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0936 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0939 _ FF. 75, 08
        call    computeMousePosition                    ; 093C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0941 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0944 _ 8B. 15, 00000114(d)
        mov     eax, dword [mx]                         ; 094A _ A1, 00000110(d)
        push    edx                                     ; 094F _ 52
        push    eax                                     ; 0950 _ 50
        push    dword [ebp+10H]                         ; 0951 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0954 _ FF. 75, 08
        call    sheet_slide                             ; 0957 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095C _ 83. C4, 10
        mov     eax, dword [?_172]                      ; 095F _ A1, 000000EC(d)
        and     eax, 01H                                ; 0964 _ 83. E0, 01
        test    eax, eax                                ; 0967 _ 85. C0
        jz near       ?_014                                   ; 0969 _ 74, 23
        mov     eax, dword [my]                         ; 096B _ A1, 00000114(d)
        lea     ecx, [eax-8H]                           ; 0970 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0973 _ A1, 00000110(d)
        lea     edx, [eax-50H]                          ; 0978 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 097B _ A1, 00000240(d)
        push    ecx                                     ; 0980 _ 51
        push    edx                                     ; 0981 _ 52
        push    eax                                     ; 0982 _ 50
        push    dword [ebp+8H]                          ; 0983 _ FF. 75, 08
        call    sheet_slide                             ; 0986 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 098B _ 83. C4, 10
?_014:  nop                                             ; 098E _ 90
        leave                                           ; 098F _ C9
        ret                                             ; 0990 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0991 _ 55
        mov     ebp, esp                                ; 0992 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0994 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0997 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 099D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 09A0 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 09A6 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 09A9 _ 66: C7. 40, 06, 01E0
        nop                                             ; 09AF _ 90
        pop     ebp                                     ; 09B0 _ 5D
        ret                                             ; 09B1 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 09B2 _ 55
        mov     ebp, esp                                ; 09B3 _ 89. E5
        push    ebx                                     ; 09B5 _ 53
        sub     esp, 36                                 ; 09B6 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 09B9 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 09BC _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 09BF _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 09C2 _ 89. 45, F4
        jmp     ?_016                                   ; 09C5 _ EB, 3C

?_015:  mov     eax, dword [ebp+1CH]                    ; 09C7 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 09CA _ 8A. 00
        movzx   eax, al                                 ; 09CC _ 0F B6. C0
        shl     eax, 4                                  ; 09CF _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 09D2 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 09D8 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 09DC _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09DF _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09E2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09E5 _ 8B. 00
        sub     esp, 8                                  ; 09E7 _ 83. EC, 08
        push    ebx                                     ; 09EA _ 53
        push    ecx                                     ; 09EB _ 51
        push    dword [ebp+14H]                         ; 09EC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 09EF _ FF. 75, 10
        push    edx                                     ; 09F2 _ 52
        push    eax                                     ; 09F3 _ 50
        call    showFont8                               ; 09F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09F9 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 09FC _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0A00 _ FF. 45, 1C
?_016:  mov     eax, dword [ebp+1CH]                    ; 0A03 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0A06 _ 8A. 00
        test    al, al                                  ; 0A08 _ 84. C0
        jnz near      ?_015                                   ; 0a0a _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 0A0C _ 8B. 45, 14
        add     eax, 16                                 ; 0A0F _ 83. C0, 10
        sub     esp, 8                                  ; 0A12 _ 83. EC, 08
        push    eax                                     ; 0A15 _ 50
        push    dword [ebp+10H]                         ; 0A16 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0A19 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0A1C _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0A1F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A22 _ FF. 75, 08
        call    sheet_refresh                           ; 0A25 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A2A _ 83. C4, 20
        nop                                             ; 0A2D _ 90
        mov     ebx, dword [ebp-4H]                     ; 0A2E _ 8B. 5D, FC
        leave                                           ; 0A31 _ C9
        ret                                             ; 0A32 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0A33 _ 55
        mov     ebp, esp                                ; 0A34 _ 89. E5
        sub     esp, 8                                  ; 0A36 _ 83. EC, 08
        sub     esp, 4                                  ; 0A39 _ 83. EC, 04
        push    table_rgb.1816                          ; 0A3C _ 68, 00000080(d)
        push    15                                      ; 0A41 _ 6A, 0F
        push    0                                       ; 0A43 _ 6A, 00
        call    set_palette                             ; 0A45 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A4A _ 83. C4, 10
        nop                                             ; 0A4D _ 90
        leave                                           ; 0A4E _ C9
        ret                                             ; 0A4F _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0A50 _ 55
        mov     ebp, esp                                ; 0A51 _ 89. E5
        sub     esp, 24                                 ; 0A53 _ 83. EC, 18
        call    io_load_eflags                          ; 0A56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0A5B _ 89. 45, F0
        call    io_cli                                  ; 0A5E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0A63 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0A66 _ FF. 75, 08
        push    968                                     ; 0A69 _ 68, 000003C8
        call    io_out8                                 ; 0A6E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A73 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0A76 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0A79 _ 89. 45, F4
        jmp     ?_018                                   ; 0A7C _ EB, 5F

?_017:  mov     eax, dword [ebp+10H]                    ; 0A7E _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0A81 _ 8A. 00
        shr     al, 2                                   ; 0A83 _ C0. E8, 02
        movzx   eax, al                                 ; 0A86 _ 0F B6. C0
        sub     esp, 8                                  ; 0A89 _ 83. EC, 08
        push    eax                                     ; 0A8C _ 50
        push    969                                     ; 0A8D _ 68, 000003C9
        call    io_out8                                 ; 0A92 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A97 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0A9A _ 8B. 45, 10
        inc     eax                                     ; 0A9D _ 40
        mov     al, byte [eax]                          ; 0A9E _ 8A. 00
        shr     al, 2                                   ; 0AA0 _ C0. E8, 02
        movzx   eax, al                                 ; 0AA3 _ 0F B6. C0
        sub     esp, 8                                  ; 0AA6 _ 83. EC, 08
        push    eax                                     ; 0AA9 _ 50
        push    969                                     ; 0AAA _ 68, 000003C9
        call    io_out8                                 ; 0AAF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB4 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0AB7 _ 8B. 45, 10
        add     eax, 2                                  ; 0ABA _ 83. C0, 02
        mov     al, byte [eax]                          ; 0ABD _ 8A. 00
        shr     al, 2                                   ; 0ABF _ C0. E8, 02
        movzx   eax, al                                 ; 0AC2 _ 0F B6. C0
        sub     esp, 8                                  ; 0AC5 _ 83. EC, 08
        push    eax                                     ; 0AC8 _ 50
        push    969                                     ; 0AC9 _ 68, 000003C9
        call    io_out8                                 ; 0ACE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AD3 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0AD6 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0ADA _ FF. 45, F4
?_018:  mov     eax, dword [ebp-0CH]                    ; 0ADD _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0AE0 _ 3B. 45, 0C
        jle near      ?_017                                   ; 0ae3 _ 7e, 99
        sub     esp, 12                                 ; 0AE5 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0AE8 _ FF. 75, F0
        call    io_store_eflags                         ; 0AEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF0 _ 83. C4, 10
        nop                                             ; 0AF3 _ 90
        leave                                           ; 0AF4 _ C9
        ret                                             ; 0AF5 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0AF6 _ 55
        mov     ebp, esp                                ; 0AF7 _ 89. E5
        sub     esp, 20                                 ; 0AF9 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0AFC _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0AFF _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B02 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0B05 _ 89. 45, F8
        jmp     ?_022                                   ; 0B08 _ EB, 30

?_019:  mov     eax, dword [ebp+14H]                    ; 0B0A _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0B0D _ 89. 45, FC
        jmp     ?_021                                   ; 0B10 _ EB, 1D

?_020:  mov     eax, dword [ebp-8H]                     ; 0B12 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0B15 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B19 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B1B _ 8B. 45, FC
        add     eax, edx                                ; 0B1E _ 01. D0
        mov     edx, eax                                ; 0B20 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B22 _ 8B. 45, 08
        add     edx, eax                                ; 0B25 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0B27 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0B2A _ 88. 02
        inc     dword [ebp-4H]                          ; 0B2C _ FF. 45, FC
?_021:  mov     eax, dword [ebp-4H]                     ; 0B2F _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0B32 _ 3B. 45, 1C
        jle near      ?_020                                   ; 0b35 _ 7e, db
        inc     dword [ebp-8H]                          ; 0B37 _ FF. 45, F8
?_022:  mov     eax, dword [ebp-8H]                     ; 0B3A _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0B3D _ 3B. 45, 20
        jle near      ?_019                                   ; 0b40 _ 7e, c8
        nop                                             ; 0B42 _ 90
        nop                                             ; 0B43 _ 90
        leave                                           ; 0B44 _ C9
        ret                                             ; 0B45 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0B46 _ 55
        mov     ebp, esp                                ; 0B47 _ 89. E5
        sub     esp, 20                                 ; 0B49 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0B4C _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0B4F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B52 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0B59 _ E9, 00000162

?_023:  mov     edx, dword [ebp-4H]                     ; 0B5E _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0B61 _ 8B. 45, 1C
        add     eax, edx                                ; 0B64 _ 01. D0
        mov     al, byte [eax]                          ; 0B66 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0B68 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0B6B _ 80. 7D, FB, 00
        jns     ?_024                                   ; 0B6F _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0B71 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0B74 _ 8B. 45, FC
        add     eax, edx                                ; 0B77 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B79 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B7D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B7F _ 8B. 45, 10
        add     eax, edx                                ; 0B82 _ 01. D0
        mov     edx, eax                                ; 0B84 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B86 _ 8B. 45, 08
        add     edx, eax                                ; 0B89 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0B8B _ 8A. 45, EC
        mov     byte [edx], al                          ; 0B8E _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0B90 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0B94 _ 83. E0, 40
        test    eax, eax                                ; 0B97 _ 85. C0
        jz near       ?_025                                   ; 0b99 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0B9B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0B9E _ 8B. 45, FC
        add     eax, edx                                ; 0BA1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BA3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BA7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BA9 _ 8B. 45, 10
        add     eax, edx                                ; 0BAC _ 01. D0
        lea     edx, [eax+1H]                           ; 0BAE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BB1 _ 8B. 45, 08
        add     edx, eax                                ; 0BB4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0BB6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0BB9 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0BBB _ 0F BE. 45, FB
        and     eax, 20H                                ; 0BBF _ 83. E0, 20
        test    eax, eax                                ; 0BC2 _ 85. C0
        jz near       ?_026                                   ; 0bc4 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0BC6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0BC9 _ 8B. 45, FC
        add     eax, edx                                ; 0BCC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BCE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BD2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BD4 _ 8B. 45, 10
        add     eax, edx                                ; 0BD7 _ 01. D0
        lea     edx, [eax+2H]                           ; 0BD9 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BDC _ 8B. 45, 08
        add     edx, eax                                ; 0BDF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0BE1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0BE4 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0BE6 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0BEA _ 83. E0, 10
        test    eax, eax                                ; 0BED _ 85. C0
        jz near       ?_027                                   ; 0bef _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0BF1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0BF4 _ 8B. 45, FC
        add     eax, edx                                ; 0BF7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BF9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BFD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BFF _ 8B. 45, 10
        add     eax, edx                                ; 0C02 _ 01. D0
        lea     edx, [eax+3H]                           ; 0C04 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0C07 _ 8B. 45, 08
        add     edx, eax                                ; 0C0A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0C0C _ 8A. 45, EC
        mov     byte [edx], al                          ; 0C0F _ 88. 02
?_027:  movsx   eax, byte [ebp-5H]                      ; 0C11 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0C15 _ 83. E0, 08
        test    eax, eax                                ; 0C18 _ 85. C0
        jz near       ?_028                                   ; 0c1a _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0C1C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0C1F _ 8B. 45, FC
        add     eax, edx                                ; 0C22 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C24 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C28 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C2A _ 8B. 45, 10
        add     eax, edx                                ; 0C2D _ 01. D0
        lea     edx, [eax+4H]                           ; 0C2F _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C32 _ 8B. 45, 08
        add     edx, eax                                ; 0C35 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0C37 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0C3A _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0C3C _ 0F BE. 45, FB
        and     eax, 04H                                ; 0C40 _ 83. E0, 04
        test    eax, eax                                ; 0C43 _ 85. C0
        jz near       ?_029                                   ; 0c45 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0C47 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0C4A _ 8B. 45, FC
        add     eax, edx                                ; 0C4D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C4F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C53 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C55 _ 8B. 45, 10
        add     eax, edx                                ; 0C58 _ 01. D0
        lea     edx, [eax+5H]                           ; 0C5A _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0C5D _ 8B. 45, 08
        add     edx, eax                                ; 0C60 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0C62 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0C65 _ 88. 02
?_029:  movsx   eax, byte [ebp-5H]                      ; 0C67 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0C6B _ 83. E0, 02
        test    eax, eax                                ; 0C6E _ 85. C0
        jz near       ?_030                                   ; 0c70 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0C72 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0C75 _ 8B. 45, FC
        add     eax, edx                                ; 0C78 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C7A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C7E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C80 _ 8B. 45, 10
        add     eax, edx                                ; 0C83 _ 01. D0
        lea     edx, [eax+6H]                           ; 0C85 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0C88 _ 8B. 45, 08
        add     edx, eax                                ; 0C8B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0C8D _ 8A. 45, EC
        mov     byte [edx], al                          ; 0C90 _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 0C92 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0C96 _ 83. E0, 01
        test    eax, eax                                ; 0C99 _ 85. C0
        jz near       ?_031                                   ; 0c9b _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0C9D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0CA0 _ 8B. 45, FC
        add     eax, edx                                ; 0CA3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CA5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CA9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CAB _ 8B. 45, 10
        add     eax, edx                                ; 0CAE _ 01. D0
        lea     edx, [eax+7H]                           ; 0CB0 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0CB3 _ 8B. 45, 08
        add     edx, eax                                ; 0CB6 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0CB8 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0CBB _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 0CBD _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 0CC0 _ 83. 7D, FC, 0F
        jle near      ?_023                                   ; 0cc4 _ 0f 8e, fffffe94
        nop                                             ; 0CCA _ 90
        nop                                             ; 0CCB _ 90
        leave                                           ; 0CCC _ C9
        ret                                             ; 0CCD _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0CCE _ 55
        mov     ebp, esp                                ; 0CCF _ 89. E5
        sub     esp, 20                                 ; 0CD1 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0CD4 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0CD7 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0CDA _ C7. 45, F8, 00000000
        jmp     ?_039                                   ; 0CE1 _ E9, 000000AB

?_033:  mov     dword [ebp-4H], 0                       ; 0CE6 _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0CED _ E9, 00000092

?_034:  mov     eax, dword [ebp-8H]                     ; 0CF2 _ 8B. 45, F8
        shl     eax, 4                                  ; 0CF5 _ C1. E0, 04
        mov     edx, eax                                ; 0CF8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0CFA _ 8B. 45, FC
        add     eax, edx                                ; 0CFD _ 01. D0
        add     eax, cursor.1863                        ; 0CFF _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0D04 _ 8A. 00
        cmp     al, 42                                  ; 0D06 _ 3C, 2A
        jnz near      ?_035                                   ; 0d08 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0D0A _ 8B. 45, F8
        shl     eax, 4                                  ; 0D0D _ C1. E0, 04
        mov     edx, eax                                ; 0D10 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D12 _ 8B. 45, FC
        add     eax, edx                                ; 0D15 _ 01. D0
        mov     edx, eax                                ; 0D17 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D19 _ 8B. 45, 08
        add     eax, edx                                ; 0D1C _ 01. D0
        mov     byte [eax], 0                           ; 0D1E _ C6. 00, 00
?_035:  mov     eax, dword [ebp-8H]                     ; 0D21 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D24 _ C1. E0, 04
        mov     edx, eax                                ; 0D27 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D29 _ 8B. 45, FC
        add     eax, edx                                ; 0D2C _ 01. D0
        add     eax, cursor.1863                        ; 0D2E _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0D33 _ 8A. 00
        cmp     al, 79                                  ; 0D35 _ 3C, 4F
        jnz near      ?_036                                   ; 0d37 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0D39 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D3C _ C1. E0, 04
        mov     edx, eax                                ; 0D3F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D41 _ 8B. 45, FC
        add     eax, edx                                ; 0D44 _ 01. D0
        mov     edx, eax                                ; 0D46 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D48 _ 8B. 45, 08
        add     eax, edx                                ; 0D4B _ 01. D0
        mov     byte [eax], 7                           ; 0D4D _ C6. 00, 07
?_036:  mov     eax, dword [ebp-8H]                     ; 0D50 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D53 _ C1. E0, 04
        mov     edx, eax                                ; 0D56 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D58 _ 8B. 45, FC
        add     eax, edx                                ; 0D5B _ 01. D0
        add     eax, cursor.1863                        ; 0D5D _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 0D62 _ 8A. 00
        cmp     al, 46                                  ; 0D64 _ 3C, 2E
        jnz near      ?_037                                   ; 0d66 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0D68 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D6B _ C1. E0, 04
        mov     edx, eax                                ; 0D6E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D70 _ 8B. 45, FC
        add     eax, edx                                ; 0D73 _ 01. D0
        mov     edx, eax                                ; 0D75 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D77 _ 8B. 45, 08
        add     edx, eax                                ; 0D7A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0D7C _ 8A. 45, EC
        mov     byte [edx], al                          ; 0D7F _ 88. 02
?_037:  inc     dword [ebp-4H]                          ; 0D81 _ FF. 45, FC
?_038:  cmp     dword [ebp-4H], 15                      ; 0D84 _ 83. 7D, FC, 0F
        jle near      ?_034                                   ; 0d88 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 0D8E _ FF. 45, F8
?_039:  cmp     dword [ebp-8H], 15                      ; 0D91 _ 83. 7D, F8, 0F
        jle near      ?_033                                   ; 0d95 _ 0f 8e, ffffff4b
        nop                                             ; 0D9B _ 90
        nop                                             ; 0D9C _ 90
        leave                                           ; 0D9D _ C9
        ret                                             ; 0D9E _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0D9F _ 55
        mov     ebp, esp                                ; 0DA0 _ 89. E5
        push    ebx                                     ; 0DA2 _ 53
        sub     esp, 16                                 ; 0DA3 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0DA6 _ C7. 45, F4, 00000000
        jmp     ?_043                                   ; 0DAD _ EB, 4D

?_040:  mov     dword [ebp-8H], 0                       ; 0DAF _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 0DB6 _ EB, 39

?_041:  mov     eax, dword [ebp-0CH]                    ; 0DB8 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0DBB _ 0F AF. 45, 24
        mov     edx, eax                                ; 0DBF _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0DC1 _ 8B. 45, F8
        add     eax, edx                                ; 0DC4 _ 01. D0
        mov     edx, eax                                ; 0DC6 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0DC8 _ 8B. 45, 20
        add     eax, edx                                ; 0DCB _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0DCD _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0DD0 _ 8B. 55, F4
        add     edx, ecx                                ; 0DD3 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0DD5 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0DD9 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0DDC _ 8B. 4D, F8
        add     ecx, ebx                                ; 0DDF _ 01. D9
        add     edx, ecx                                ; 0DE1 _ 01. CA
        mov     ecx, edx                                ; 0DE3 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0DE5 _ 8B. 55, 08
        add     edx, ecx                                ; 0DE8 _ 01. CA
        mov     al, byte [eax]                          ; 0DEA _ 8A. 00
        mov     byte [edx], al                          ; 0DEC _ 88. 02
        inc     dword [ebp-8H]                          ; 0DEE _ FF. 45, F8
?_042:  mov     eax, dword [ebp-8H]                     ; 0DF1 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0DF4 _ 3B. 45, 10
        jl      ?_041                                   ; 0DF7 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0DF9 _ FF. 45, F4
?_043:  mov     eax, dword [ebp-0CH]                    ; 0DFC _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0DFF _ 3B. 45, 14
        jl      ?_040                                   ; 0E02 _ 7C, AB
        nop                                             ; 0E04 _ 90
        nop                                             ; 0E05 _ 90
        add     esp, 16                                 ; 0E06 _ 83. C4, 10
        pop     ebx                                     ; 0E09 _ 5B
        pop     ebp                                     ; 0E0A _ 5D
        ret                                             ; 0E0B _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0E0C _ 55
        mov     ebp, esp                                ; 0E0D _ 89. E5
        sub     esp, 24                                 ; 0E0F _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0E12 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0E17 _ 89. 45, F4
        mov     eax, dword [?_170]                      ; 0E1A _ A1, 00000004(d)
        cwde                                            ; 0E1F _ 98
        mov     dword [ebp-10H], eax                    ; 0E20 _ 89. 45, F0
        mov     ax, word [?_171]                        ; 0E23 _ 66: A1, 00000006(d)
        cwde                                            ; 0E29 _ 98
        mov     dword [ebp-14H], eax                    ; 0E2A _ 89. 45, EC
        sub     esp, 8                                  ; 0E2D _ 83. EC, 08
        push    32                                      ; 0E30 _ 6A, 20
        push    32                                      ; 0E32 _ 6A, 20
        call    io_out8                                 ; 0E34 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E39 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0E3C _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0E40 _ 83. EC, 0C
        push    96                                      ; 0E43 _ 6A, 60
        call    io_in8                                  ; 0E45 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E4A _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0E4D _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0E50 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0E54 _ 83. EC, 08
        push    eax                                     ; 0E57 _ 50
        push    keyinfo                                 ; 0E58 _ 68, 00000008(d)
        call    fifo8_put                               ; 0E5D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E62 _ 83. C4, 10
        nop                                             ; 0E65 _ 90
        leave                                           ; 0E66 _ C9
        ret                                             ; 0E67 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0E68 _ 55
        mov     ebp, esp                                ; 0E69 _ 89. E5
        sub     esp, 4                                  ; 0E6B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0E6E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0E71 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0E74 _ 80. 7D, FC, 09
        jle near      ?_044                                   ; 0e78 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 0E7A _ 8A. 45, FC
        add     eax, 55                                 ; 0E7D _ 83. C0, 37
        jmp     ?_045                                   ; 0E80 _ EB, 06

?_044:  mov     al, byte [ebp-4H]                       ; 0E82 _ 8A. 45, FC
        add     eax, 48                                 ; 0E85 _ 83. C0, 30
?_045:  leave                                           ; 0E88 _ C9
        ret                                             ; 0E89 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0E8A _ 55
        mov     ebp, esp                                ; 0E8B _ 89. E5
        sub     esp, 20                                 ; 0E8D _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0E90 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0E93 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0E96 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0E9D _ 8A. 45, EC
        and     eax, 0FH                                ; 0EA0 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0EA3 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0EA6 _ 0F BE. 45, FB
        push    eax                                     ; 0EAA _ 50
        call    charToHexVal                            ; 0EAB _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0EB0 _ 83. C4, 04
        mov     byte [?_169], al                        ; 0EB3 _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 0EB8 _ 8A. 45, EC
        shr     al, 4                                   ; 0EBB _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0EBE _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0EC1 _ 8A. 45, EC
        movsx   eax, al                                 ; 0EC4 _ 0F BE. C0
        push    eax                                     ; 0EC7 _ 50
        call    charToHexVal                            ; 0EC8 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0ECD _ 83. C4, 04
        mov     byte [?_168], al                        ; 0ED0 _ A2, 00000076(d)
        mov     eax, keyval                             ; 0ED5 _ B8, 00000074(d)
        leave                                           ; 0EDA _ C9
        ret                                             ; 0EDB _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0EDC _ 55
        mov     ebp, esp                                ; 0EDD _ 89. E5
        sub     esp, 16                                 ; 0EDF _ 83. EC, 10
        mov     byte [str.1911], 48                     ; 0EE2 _ C6. 05, 00000244(d), 30
        mov     byte [?_173], 88                        ; 0EE9 _ C6. 05, 00000245(d), 58
        mov     byte [?_174], 0                         ; 0EF0 _ C6. 05, 0000024E(d), 00
        mov     dword [ebp-4H], 2                       ; 0EF7 _ C7. 45, FC, 00000002
        jmp     ?_047                                   ; 0EFE _ EB, 0E

?_046:  mov     eax, dword [ebp-4H]                     ; 0F00 _ 8B. 45, FC
        add     eax, str.1911                           ; 0F03 _ 05, 00000244(d)
        mov     byte [eax], 48                          ; 0F08 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0F0B _ FF. 45, FC
?_047:  cmp     dword [ebp-4H], 9                       ; 0F0E _ 83. 7D, FC, 09
        jle near      ?_046                                   ; 0f12 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 0F14 _ C7. 45, F8, 00000009
        jmp     ?_051                                   ; 0F1B _ EB, 41

?_048:  mov     eax, dword [ebp+8H]                     ; 0F1D _ 8B. 45, 08
        and     eax, 0FH                                ; 0F20 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0F23 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0F26 _ 8B. 45, 08
        shr     eax, 4                                  ; 0F29 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0F2C _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0F2F _ 83. 7D, F4, 09
        jle near      ?_049                                   ; 0f33 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 0F35 _ 8B. 45, F4
        add     eax, 55                                 ; 0F38 _ 83. C0, 37
        mov     dl, al                                  ; 0F3B _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0F3D _ 8B. 45, F8
        add     eax, str.1911                           ; 0F40 _ 05, 00000244(d)
        mov     byte [eax], dl                          ; 0F45 _ 88. 10
        jmp     ?_050                                   ; 0F47 _ EB, 12

?_049:  mov     eax, dword [ebp-0CH]                    ; 0F49 _ 8B. 45, F4
        add     eax, 48                                 ; 0F4C _ 83. C0, 30
        mov     dl, al                                  ; 0F4F _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0F51 _ 8B. 45, F8
        add     eax, str.1911                           ; 0F54 _ 05, 00000244(d)
        mov     byte [eax], dl                          ; 0F59 _ 88. 10
?_050:  dec     dword [ebp-8H]                          ; 0F5B _ FF. 4D, F8
?_051:  cmp     dword [ebp-8H], 1                       ; 0F5E _ 83. 7D, F8, 01
        jle near      ?_052                                   ; 0f62 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 0F64 _ 83. 7D, 08, 00
        jnz near      ?_048                                   ; 0f68 _ 75, b3
?_052:  mov     eax, str.1911                           ; 0F6A _ B8, 00000244(d)
        leave                                           ; 0F6F _ C9
        ret                                             ; 0F70 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0F71 _ 55
        mov     ebp, esp                                ; 0F72 _ 89. E5
        sub     esp, 8                                  ; 0F74 _ 83. EC, 08
?_053:  sub     esp, 12                                 ; 0F77 _ 83. EC, 0C
        push    100                                     ; 0F7A _ 6A, 64
        call    io_in8                                  ; 0F7C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F81 _ 83. C4, 10
        and     eax, 02H                                ; 0F84 _ 83. E0, 02
        test    eax, eax                                ; 0F87 _ 85. C0
        jz near       ?_054                                   ; 0f89 _ 74, 02
        jmp     ?_053                                   ; 0F8B _ EB, EA

?_054:  nop                                             ; 0F8D _ 90
        nop                                             ; 0F8E _ 90
        leave                                           ; 0F8F _ C9
        ret                                             ; 0F90 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0F91 _ 55
        mov     ebp, esp                                ; 0F92 _ 89. E5
        sub     esp, 8                                  ; 0F94 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0F97 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F9C _ 83. EC, 08
        push    96                                      ; 0F9F _ 6A, 60
        push    100                                     ; 0FA1 _ 6A, 64
        call    io_out8                                 ; 0FA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FA8 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0FAB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0FB0 _ 83. EC, 08
        push    71                                      ; 0FB3 _ 6A, 47
        push    96                                      ; 0FB5 _ 6A, 60
        call    io_out8                                 ; 0FB7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FBC _ 83. C4, 10
        nop                                             ; 0FBF _ 90
        leave                                           ; 0FC0 _ C9
        ret                                             ; 0FC1 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0FC2 _ 55
        mov     ebp, esp                                ; 0FC3 _ 89. E5
        sub     esp, 8                                  ; 0FC5 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0FC8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0FCD _ 83. EC, 08
        push    212                                     ; 0FD0 _ 68, 000000D4
        push    100                                     ; 0FD5 _ 6A, 64
        call    io_out8                                 ; 0FD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FDC _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0FDF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0FE4 _ 83. EC, 08
        push    244                                     ; 0FE7 _ 68, 000000F4
        push    96                                      ; 0FEC _ 6A, 60
        call    io_out8                                 ; 0FEE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FF3 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0FF6 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0FF9 _ C6. 40, 03, 00
        nop                                             ; 0FFD _ 90
        leave                                           ; 0FFE _ C9
        ret                                             ; 0FFF _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1000 _ 55
        mov     ebp, esp                                ; 1001 _ 89. E5
        sub     esp, 24                                 ; 1003 _ 83. EC, 18
        sub     esp, 8                                  ; 1006 _ 83. EC, 08
        push    32                                      ; 1009 _ 6A, 20
        push    160                                     ; 100B _ 68, 000000A0
        call    io_out8                                 ; 1010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1015 _ 83. C4, 10
        sub     esp, 8                                  ; 1018 _ 83. EC, 08
        push    32                                      ; 101B _ 6A, 20
        push    32                                      ; 101D _ 6A, 20
        call    io_out8                                 ; 101F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1024 _ 83. C4, 10
        sub     esp, 12                                 ; 1027 _ 83. EC, 0C
        push    96                                      ; 102A _ 6A, 60
        call    io_in8                                  ; 102C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1031 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 1034 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1037 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 103B _ 83. EC, 08
        push    eax                                     ; 103E _ 50
        push    mouseinfo                               ; 103F _ 68, 00000020(d)
        call    fifo8_put                               ; 1044 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1049 _ 83. C4, 10
        nop                                             ; 104C _ 90
        leave                                           ; 104D _ C9
        ret                                             ; 104E _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 104F _ 55
        mov     ebp, esp                                ; 1050 _ 89. E5
        sub     esp, 4                                  ; 1052 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1055 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1058 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 105B _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 105E _ 8A. 40, 03
        test    al, al                                  ; 1061 _ 84. C0
        jnz near      ?_056                                   ; 1063 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1065 _ 80. 7D, FC, FA
        jnz near      ?_055                                   ; 1069 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 106B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 106E _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 1072 _ B8, 00000000
        jmp     ?_063                                   ; 1077 _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 107C _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 107F _ 8A. 40, 03
        cmp     al, 1                                   ; 1082 _ 3C, 01
        jnz near      ?_058                                   ; 1084 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 1086 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 108A _ 25, 000000C8
        cmp     eax, 8                                  ; 108F _ 83. F8, 08
        jnz near      ?_057                                   ; 1092 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 1094 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1097 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 109A _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 109C _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 109F _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 10A3 _ B8, 00000000
        jmp     ?_063                                   ; 10A8 _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 10AD _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 10B0 _ 8A. 40, 03
        cmp     al, 2                                   ; 10B3 _ 3C, 02
        jnz near      ?_059                                   ; 10b5 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 10B7 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 10BA _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 10BD _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 10C0 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 10C3 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 10C7 _ B8, 00000000
        jmp     ?_063                                   ; 10CC _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 10D1 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 10D4 _ 8A. 40, 03
        cmp     al, 3                                   ; 10D7 _ 3C, 03
        jne near      ?_062                                   ; 10d9 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 10DF _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 10E2 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 10E5 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 10E8 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 10EB _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 10EF _ 8B. 45, 08
        mov     al, byte [eax]                          ; 10F2 _ 8A. 00
        movzx   eax, al                                 ; 10F4 _ 0F B6. C0
        and     eax, 07H                                ; 10F7 _ 83. E0, 07
        mov     edx, eax                                ; 10FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10FC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 10FF _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1102 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 1105 _ 8A. 40, 01
        movzx   edx, al                                 ; 1108 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 110B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 110E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1111 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 1114 _ 8A. 40, 02
        movzx   edx, al                                 ; 1117 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 111A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 111D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1120 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1123 _ 8A. 00
        movzx   eax, al                                 ; 1125 _ 0F B6. C0
        and     eax, 10H                                ; 1128 _ 83. E0, 10
        test    eax, eax                                ; 112B _ 85. C0
        jz near       ?_060                                   ; 112d _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 112F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1132 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1135 _ 0D, FFFFFF00
        mov     edx, eax                                ; 113A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 113C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 113F _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 1142 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1145 _ 8A. 00
        movzx   eax, al                                 ; 1147 _ 0F B6. C0
        and     eax, 20H                                ; 114A _ 83. E0, 20
        test    eax, eax                                ; 114D _ 85. C0
        jz near       ?_061                                   ; 114f _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1151 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1154 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1157 _ 0D, FFFFFF00
        mov     edx, eax                                ; 115C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 115E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1161 _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 1164 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1167 _ 8B. 40, 08
        neg     eax                                     ; 116A _ F7. D8
        mov     edx, eax                                ; 116C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 116E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1171 _ 89. 50, 08
        mov     eax, 1                                  ; 1174 _ B8, 00000001
        jmp     ?_063                                   ; 1179 _ EB, 05

?_062:  mov     eax, 4294967295                         ; 117B _ B8, FFFFFFFF
?_063:  leave                                           ; 1180 _ C9
        ret                                             ; 1181 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1182 _ 55
        mov     ebp, esp                                ; 1183 _ 89. E5
        sub     esp, 56                                 ; 1185 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 1188 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 118F _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1196 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 119D _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 11A4 _ 8B. 15, 0000011C(d)
        mov     eax, dword [ebp+0CH]                    ; 11AA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11AD _ 8B. 00
        sub     esp, 4                                  ; 11AF _ 83. EC, 04
        push    edx                                     ; 11B2 _ 52
        push    dword [ebp+1CH]                         ; 11B3 _ FF. 75, 1C
        push    eax                                     ; 11B6 _ 50
        call    init_screen8                            ; 11B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11BC _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 11BF _ 8B. 45, 20
        movsx   eax, al                                 ; 11C2 _ 0F BE. C0
        sub     esp, 8                                  ; 11C5 _ 83. EC, 08
        push    ?_162                                   ; 11C8 _ 68, 0000001B(d)
        push    eax                                     ; 11CD _ 50
        push    dword [ebp-10H]                         ; 11CE _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11D1 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 11D4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11D7 _ FF. 75, 08
        call    showString                              ; 11DA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11DF _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 11E2 _ 8B. 45, 18
        sub     esp, 12                                 ; 11E5 _ 83. EC, 0C
        push    eax                                     ; 11E8 _ 50
        call    intToHexStr                             ; 11E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11EE _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 11F1 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 11F4 _ 8B. 45, 20
        movsx   eax, al                                 ; 11F7 _ 0F BE. C0
        sub     esp, 8                                  ; 11FA _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 11FD _ FF. 75, E4
        push    eax                                     ; 1200 _ 50
        push    dword [ebp-10H]                         ; 1201 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1204 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1207 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 120A _ FF. 75, 08
        call    showString                              ; 120D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1212 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1215 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1219 _ 8B. 45, 20
        movsx   eax, al                                 ; 121C _ 0F BE. C0
        sub     esp, 8                                  ; 121F _ 83. EC, 08
        push    ?_163                                   ; 1222 _ 68, 00000025(d)
        push    eax                                     ; 1227 _ 50
        push    dword [ebp-10H]                         ; 1228 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 122B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 122E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1231 _ FF. 75, 08
        call    showString                              ; 1234 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1239 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 123C _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 123F _ 8B. 00
        sub     esp, 12                                 ; 1241 _ 83. EC, 0C
        push    eax                                     ; 1244 _ 50
        call    intToHexStr                             ; 1245 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 124A _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 124D _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1250 _ 8B. 45, 20
        movsx   eax, al                                 ; 1253 _ 0F BE. C0
        sub     esp, 8                                  ; 1256 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1259 _ FF. 75, E0
        push    eax                                     ; 125C _ 50
        push    dword [ebp-10H]                         ; 125D _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1260 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1263 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1266 _ FF. 75, 08
        call    showString                              ; 1269 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 126E _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1271 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1275 _ 8B. 45, 20
        movsx   eax, al                                 ; 1278 _ 0F BE. C0
        sub     esp, 8                                  ; 127B _ 83. EC, 08
        push    ?_164                                   ; 127E _ 68, 00000031(d)
        push    eax                                     ; 1283 _ 50
        push    dword [ebp-10H]                         ; 1284 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1287 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 128A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 128D _ FF. 75, 08
        call    showString                              ; 1290 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1295 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1298 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 129B _ 8B. 40, 04
        sub     esp, 12                                 ; 129E _ 83. EC, 0C
        push    eax                                     ; 12A1 _ 50
        call    intToHexStr                             ; 12A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12A7 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 12AA _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 12AD _ 8B. 45, 20
        movsx   eax, al                                 ; 12B0 _ 0F BE. C0
        sub     esp, 8                                  ; 12B3 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 12B6 _ FF. 75, DC
        push    eax                                     ; 12B9 _ 50
        push    dword [ebp-10H]                         ; 12BA _ FF. 75, F0
        push    dword [ebp-14H]                         ; 12BD _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 12C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12C3 _ FF. 75, 08
        call    showString                              ; 12C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12CB _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 12CE _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 12D2 _ 8B. 45, 20
        movsx   eax, al                                 ; 12D5 _ 0F BE. C0
        sub     esp, 8                                  ; 12D8 _ 83. EC, 08
        push    ?_165                                   ; 12DB _ 68, 0000003D(d)
        push    eax                                     ; 12E0 _ 50
        push    dword [ebp-10H]                         ; 12E1 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 12E4 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 12E7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12EA _ FF. 75, 08
        call    showString                              ; 12ED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12F2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 12F5 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 12F8 _ 8B. 40, 08
        sub     esp, 12                                 ; 12FB _ 83. EC, 0C
        push    eax                                     ; 12FE _ 50
        call    intToHexStr                             ; 12FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1304 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1307 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 130A _ 8B. 45, 20
        movsx   eax, al                                 ; 130D _ 0F BE. C0
        sub     esp, 8                                  ; 1310 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1313 _ FF. 75, D8
        push    eax                                     ; 1316 _ 50
        push    dword [ebp-10H]                         ; 1317 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 131A _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 131D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1320 _ FF. 75, 08
        call    showString                              ; 1323 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1328 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 132B _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 132F _ 8B. 45, 20
        movsx   eax, al                                 ; 1332 _ 0F BE. C0
        sub     esp, 8                                  ; 1335 _ 83. EC, 08
        push    ?_166                                   ; 1338 _ 68, 00000049(d)
        push    eax                                     ; 133D _ 50
        push    dword [ebp-10H]                         ; 133E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1341 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1344 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1347 _ FF. 75, 08
        call    showString                              ; 134A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 134F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1352 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1355 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1358 _ 83. EC, 0C
        push    eax                                     ; 135B _ 50
        call    intToHexStr                             ; 135C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1361 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 1364 _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 1367 _ 8B. 45, 20
        movsx   eax, al                                 ; 136A _ 0F BE. C0
        sub     esp, 8                                  ; 136D _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 1370 _ FF. 75, D4
        push    eax                                     ; 1373 _ 50
        push    dword [ebp-10H]                         ; 1374 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1377 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 137A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 137D _ FF. 75, 08
        call    showString                              ; 1380 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1385 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1388 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 138C _ 8B. 45, 20
        movsx   eax, al                                 ; 138F _ 0F BE. C0
        sub     esp, 8                                  ; 1392 _ 83. EC, 08
        push    ?_167                                   ; 1395 _ 68, 00000056(d)
        push    eax                                     ; 139A _ 50
        push    dword [ebp-10H]                         ; 139B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 139E _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 13A1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13A4 _ FF. 75, 08
        call    showString                              ; 13A7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13AC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 13AF _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 13B2 _ 8B. 40, 10
        sub     esp, 12                                 ; 13B5 _ 83. EC, 0C
        push    eax                                     ; 13B8 _ 50
        call    intToHexStr                             ; 13B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13BE _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 13C1 _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 13C4 _ 8B. 45, 20
        movsx   eax, al                                 ; 13C7 _ 0F BE. C0
        sub     esp, 8                                  ; 13CA _ 83. EC, 08
        push    dword [ebp-30H]                         ; 13CD _ FF. 75, D0
        push    eax                                     ; 13D0 _ 50
        push    dword [ebp-10H]                         ; 13D1 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 13D4 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 13D7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 13DA _ FF. 75, 08
        call    showString                              ; 13DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 13E2 _ 83. C4, 20
        nop                                             ; 13E5 _ 90
        leave                                           ; 13E6 _ C9
        ret                                             ; 13E7 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 13E8 _ 55
        mov     ebp, esp                                ; 13E9 _ 89. E5
        sub     esp, 24                                 ; 13EB _ 83. EC, 18
        sub     esp, 12                                 ; 13EE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 13F1 _ FF. 75, 08
        call    sheet_alloc                             ; 13F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13F9 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 13FC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 13FF _ A1, 00000000(d)
        sub     esp, 8                                  ; 1404 _ 83. EC, 08
        push    10880                                   ; 1407 _ 68, 00002A80
        push    eax                                     ; 140C _ 50
        call    memman_alloc_4k                         ; 140D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1412 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1415 _ 89. 45, F0
        sub     esp, 12                                 ; 1418 _ 83. EC, 0C
        push    -1                                      ; 141B _ 6A, FF
        push    68                                      ; 141D _ 6A, 44
        push    160                                     ; 141F _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1424 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1427 _ FF. 75, F4
        call    sheet_setbuf                            ; 142A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 142F _ 83. C4, 20
        sub     esp, 4                                  ; 1432 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1435 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1438 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 143B _ FF. 75, 08
        call    make_window8                            ; 143E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1443 _ 83. C4, 10
        sub     esp, 8                                  ; 1446 _ 83. EC, 08
        push    7                                       ; 1449 _ 6A, 07
        push    16                                      ; 144B _ 6A, 10
        push    144                                     ; 144D _ 68, 00000090
        push    28                                      ; 1452 _ 6A, 1C
        push    8                                       ; 1454 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1456 _ FF. 75, F4
        call    make_textbox8                           ; 1459 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 145E _ 83. C4, 20
        push    72                                      ; 1461 _ 6A, 48
        push    80                                      ; 1463 _ 6A, 50
        push    dword [ebp-0CH]                         ; 1465 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1468 _ FF. 75, 08
        call    sheet_slide                             ; 146B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1470 _ 83. C4, 10
        sub     esp, 4                                  ; 1473 _ 83. EC, 04
        push    2                                       ; 1476 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1478 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 147B _ FF. 75, 08
        call    sheet_updown                            ; 147E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1483 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1486 _ 8B. 45, F4
        leave                                           ; 1489 _ C9
        ret                                             ; 148A _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 148B _ 55
        mov     ebp, esp                                ; 148C _ 89. E5
        push    ebx                                     ; 148E _ 53
        sub     esp, 36                                 ; 148F _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1492 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1495 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1498 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 149B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 149E _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 14A1 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 14A4 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 14A7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14AA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14AD _ 8B. 00
        push    0                                       ; 14AF _ 6A, 00
        push    edx                                     ; 14B1 _ 52
        push    0                                       ; 14B2 _ 6A, 00
        push    0                                       ; 14B4 _ 6A, 00
        push    8                                       ; 14B6 _ 6A, 08
        push    dword [ebp-18H]                         ; 14B8 _ FF. 75, E8
        push    eax                                     ; 14BB _ 50
        call    boxfill8                                ; 14BC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14C1 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 14C4 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 14C7 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 14CA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14CD _ 8B. 00
        push    1                                       ; 14CF _ 6A, 01
        push    edx                                     ; 14D1 _ 52
        push    1                                       ; 14D2 _ 6A, 01
        push    1                                       ; 14D4 _ 6A, 01
        push    7                                       ; 14D6 _ 6A, 07
        push    dword [ebp-18H]                         ; 14D8 _ FF. 75, E8
        push    eax                                     ; 14DB _ 50
        call    boxfill8                                ; 14DC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 14E1 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 14E4 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 14E7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14EA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14ED _ 8B. 00
        push    edx                                     ; 14EF _ 52
        push    0                                       ; 14F0 _ 6A, 00
        push    0                                       ; 14F2 _ 6A, 00
        push    0                                       ; 14F4 _ 6A, 00
        push    8                                       ; 14F6 _ 6A, 08
        push    dword [ebp-18H]                         ; 14F8 _ FF. 75, E8
        push    eax                                     ; 14FB _ 50
        call    boxfill8                                ; 14FC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1501 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1504 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1507 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 150A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 150D _ 8B. 00
        push    edx                                     ; 150F _ 52
        push    1                                       ; 1510 _ 6A, 01
        push    1                                       ; 1512 _ 6A, 01
        push    1                                       ; 1514 _ 6A, 01
        push    7                                       ; 1516 _ 6A, 07
        push    dword [ebp-18H]                         ; 1518 _ FF. 75, E8
        push    eax                                     ; 151B _ 50
        call    boxfill8                                ; 151C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1521 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1524 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1527 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 152A _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 152D _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 1530 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1533 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1536 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1539 _ 8B. 00
        push    ebx                                     ; 153B _ 53
        push    ecx                                     ; 153C _ 51
        push    1                                       ; 153D _ 6A, 01
        push    edx                                     ; 153F _ 52
        push    15                                      ; 1540 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1542 _ FF. 75, E8
        push    eax                                     ; 1545 _ 50
        call    boxfill8                                ; 1546 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 154B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 154E _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1551 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1554 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1557 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 155A _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 155D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1560 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1563 _ 8B. 00
        push    ebx                                     ; 1565 _ 53
        push    ecx                                     ; 1566 _ 51
        push    0                                       ; 1567 _ 6A, 00
        push    edx                                     ; 1569 _ 52
        push    0                                       ; 156A _ 6A, 00
        push    dword [ebp-18H]                         ; 156C _ FF. 75, E8
        push    eax                                     ; 156F _ 50
        call    boxfill8                                ; 1570 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1575 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1578 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 157B _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 157E _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1581 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1584 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1587 _ 8B. 00
        push    ecx                                     ; 1589 _ 51
        push    edx                                     ; 158A _ 52
        push    2                                       ; 158B _ 6A, 02
        push    2                                       ; 158D _ 6A, 02
        push    8                                       ; 158F _ 6A, 08
        push    dword [ebp-18H]                         ; 1591 _ FF. 75, E8
        push    eax                                     ; 1594 _ 50
        call    boxfill8                                ; 1595 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 159A _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 159D _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 15A0 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 15A3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15A6 _ 8B. 00
        push    20                                      ; 15A8 _ 6A, 14
        push    edx                                     ; 15AA _ 52
        push    3                                       ; 15AB _ 6A, 03
        push    3                                       ; 15AD _ 6A, 03
        push    12                                      ; 15AF _ 6A, 0C
        push    dword [ebp-18H]                         ; 15B1 _ FF. 75, E8
        push    eax                                     ; 15B4 _ 50
        call    boxfill8                                ; 15B5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15BA _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 15BD _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 15C0 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 15C3 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 15C6 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 15C9 _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 15CC _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 15CF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15D2 _ 8B. 00
        push    ebx                                     ; 15D4 _ 53
        push    ecx                                     ; 15D5 _ 51
        push    edx                                     ; 15D6 _ 52
        push    1                                       ; 15D7 _ 6A, 01
        push    15                                      ; 15D9 _ 6A, 0F
        push    dword [ebp-18H]                         ; 15DB _ FF. 75, E8
        push    eax                                     ; 15DE _ 50
        call    boxfill8                                ; 15DF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 15E4 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 15E7 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 15EA _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 15ED _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 15F0 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 15F3 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 15F6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 15F9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15FC _ 8B. 00
        push    ebx                                     ; 15FE _ 53
        push    ecx                                     ; 15FF _ 51
        push    edx                                     ; 1600 _ 52
        push    0                                       ; 1601 _ 6A, 00
        push    0                                       ; 1603 _ 6A, 00
        push    dword [ebp-18H]                         ; 1605 _ FF. 75, E8
        push    eax                                     ; 1608 _ 50
        call    boxfill8                                ; 1609 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 160E _ 83. C4, 1C
        sub     esp, 8                                  ; 1611 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1614 _ FF. 75, 10
        push    7                                       ; 1617 _ 6A, 07
        push    4                                       ; 1619 _ 6A, 04
        push    24                                      ; 161B _ 6A, 18
        push    dword [ebp+0CH]                         ; 161D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1620 _ FF. 75, 08
        call    showString                              ; 1623 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1628 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 162B _ C7. 45, F0, 00000000
        jmp     ?_071                                   ; 1632 _ EB, 7F

?_064:  mov     dword [ebp-0CH], 0                      ; 1634 _ C7. 45, F4, 00000000
        jmp     ?_070                                   ; 163B _ EB, 6D

?_065:  mov     eax, dword [ebp-10H]                    ; 163D _ 8B. 45, F0
        shl     eax, 4                                  ; 1640 _ C1. E0, 04
        mov     edx, eax                                ; 1643 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1645 _ 8B. 45, F4
        add     eax, edx                                ; 1648 _ 01. D0
        add     eax, closebtn.1975                      ; 164A _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 164F _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1651 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1654 _ 80. 7D, EF, 40
        jnz near      ?_066                                   ; 1658 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 165A _ C6. 45, EF, 00
        jmp     ?_069                                   ; 165E _ EB, 1C

?_066:  cmp     byte [ebp-11H], 36                      ; 1660 _ 80. 7D, EF, 24
        jnz near      ?_067                                   ; 1664 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1666 _ C6. 45, EF, 0F
        jmp     ?_069                                   ; 166A _ EB, 10

?_067:  cmp     byte [ebp-11H], 81                      ; 166C _ 80. 7D, EF, 51
        jnz near      ?_068                                   ; 1670 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1672 _ C6. 45, EF, 08
        jmp     ?_069                                   ; 1676 _ EB, 04

?_068:  mov     byte [ebp-11H], 7                       ; 1678 _ C6. 45, EF, 07
?_069:  mov     eax, dword [ebp+0CH]                    ; 167C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 167F _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1681 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1684 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1687 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 168A _ 8B. 40, 04
        imul    ecx, eax                                ; 168D _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1690 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1693 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1696 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1699 _ 8B. 45, F4
        add     eax, ebx                                ; 169C _ 01. D8
        add     eax, ecx                                ; 169E _ 01. C8
        add     edx, eax                                ; 16A0 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 16A2 _ 8A. 45, EF
        mov     byte [edx], al                          ; 16A5 _ 88. 02
        inc     dword [ebp-0CH]                         ; 16A7 _ FF. 45, F4
?_070:  cmp     dword [ebp-0CH], 15                     ; 16AA _ 83. 7D, F4, 0F
        jle near      ?_065                                   ; 16ae _ 7e, 8d
        inc     dword [ebp-10H]                         ; 16B0 _ FF. 45, F0
?_071:  cmp     dword [ebp-10H], 13                     ; 16B3 _ 83. 7D, F0, 0D
        jle near      ?_064                                   ; 16b7 _ 0f 8e, ffffff77
        nop                                             ; 16BD _ 90
        mov     ebx, dword [ebp-4H]                     ; 16BE _ 8B. 5D, FC
        leave                                           ; 16C1 _ C9
        ret                                             ; 16C2 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 16C3 _ 55
        mov     ebp, esp                                ; 16C4 _ 89. E5
        push    edi                                     ; 16C6 _ 57
        push    esi                                     ; 16C7 _ 56
        push    ebx                                     ; 16C8 _ 53
        sub     esp, 16                                 ; 16C9 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 16CC _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 16CF _ 8B. 45, 14
        add     eax, edx                                ; 16D2 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 16D4 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 16D7 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 16DA _ 8B. 45, 18
        add     eax, edx                                ; 16DD _ 01. D0
        mov     dword [ebp-14H], eax                    ; 16DF _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 16E2 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 16E5 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 16E8 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 16EB _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 16EE _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 16F1 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 16F4 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 16F7 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 16FA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16FD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1700 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1703 _ 8B. 00
        push    edi                                     ; 1705 _ 57
        push    esi                                     ; 1706 _ 56
        push    ebx                                     ; 1707 _ 53
        push    ecx                                     ; 1708 _ 51
        push    15                                      ; 1709 _ 6A, 0F
        push    edx                                     ; 170B _ 52
        push    eax                                     ; 170C _ 50
        call    boxfill8                                ; 170D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1712 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1715 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1718 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 171B _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 171E _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1721 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1724 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1727 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 172A _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 172D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1730 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1733 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1736 _ 8B. 00
        push    edi                                     ; 1738 _ 57
        push    esi                                     ; 1739 _ 56
        push    ebx                                     ; 173A _ 53
        push    ecx                                     ; 173B _ 51
        push    15                                      ; 173C _ 6A, 0F
        push    edx                                     ; 173E _ 52
        push    eax                                     ; 173F _ 50
        call    boxfill8                                ; 1740 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1745 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1748 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 174B _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 174E _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1751 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1754 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1757 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 175A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 175D _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1760 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1763 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1766 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1769 _ 8B. 00
        push    edi                                     ; 176B _ 57
        push    esi                                     ; 176C _ 56
        push    ebx                                     ; 176D _ 53
        push    ecx                                     ; 176E _ 51
        push    7                                       ; 176F _ 6A, 07
        push    edx                                     ; 1771 _ 52
        push    eax                                     ; 1772 _ 50
        call    boxfill8                                ; 1773 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1778 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 177B _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 177E _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1781 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1784 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1787 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 178A _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 178D _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1790 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1793 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1796 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1799 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 179C _ 8B. 00
        push    edi                                     ; 179E _ 57
        push    esi                                     ; 179F _ 56
        push    ebx                                     ; 17A0 _ 53
        push    ecx                                     ; 17A1 _ 51
        push    7                                       ; 17A2 _ 6A, 07
        push    edx                                     ; 17A4 _ 52
        push    eax                                     ; 17A5 _ 50
        call    boxfill8                                ; 17A6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 17AB _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 17AE _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 17B1 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 17B4 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 17B7 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 17BA _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 17BD _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 17C0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17C3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17C6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17C9 _ 8B. 00
        push    esi                                     ; 17CB _ 56
        push    dword [ebp-10H]                         ; 17CC _ FF. 75, F0
        push    ebx                                     ; 17CF _ 53
        push    ecx                                     ; 17D0 _ 51
        push    0                                       ; 17D1 _ 6A, 00
        push    edx                                     ; 17D3 _ 52
        push    eax                                     ; 17D4 _ 50
        call    boxfill8                                ; 17D5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 17DA _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 17DD _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 17E0 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 17E3 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 17E6 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 17E9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 17EC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 17EF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17F2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17F8 _ 8B. 00
        push    dword [ebp-14H]                         ; 17FA _ FF. 75, EC
        push    esi                                     ; 17FD _ 56
        push    ebx                                     ; 17FE _ 53
        push    ecx                                     ; 17FF _ 51
        push    0                                       ; 1800 _ 6A, 00
        push    edx                                     ; 1802 _ 52
        push    eax                                     ; 1803 _ 50
        call    boxfill8                                ; 1804 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1809 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 180C _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 180F _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1812 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1815 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1818 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 181B _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 181E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1821 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1824 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1827 _ 8B. 00
        push    esi                                     ; 1829 _ 56
        push    dword [ebp-10H]                         ; 182A _ FF. 75, F0
        push    ebx                                     ; 182D _ 53
        push    ecx                                     ; 182E _ 51
        push    8                                       ; 182F _ 6A, 08
        push    edx                                     ; 1831 _ 52
        push    eax                                     ; 1832 _ 50
        call    boxfill8                                ; 1833 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1838 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 183B _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 183E _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1841 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1844 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1847 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 184A _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 184D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1850 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1853 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1856 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1859 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 185C _ 8B. 00
        push    edi                                     ; 185E _ 57
        push    esi                                     ; 185F _ 56
        push    ebx                                     ; 1860 _ 53
        push    ecx                                     ; 1861 _ 51
        push    8                                       ; 1862 _ 6A, 08
        push    edx                                     ; 1864 _ 52
        push    eax                                     ; 1865 _ 50
        call    boxfill8                                ; 1866 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 186B _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 186E _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1871 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1874 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1877 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 187A _ 8B. 45, 1C
        movzx   ecx, al                                 ; 187D _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1880 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1883 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1886 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1889 _ 8B. 00
        push    dword [ebp-14H]                         ; 188B _ FF. 75, EC
        push    dword [ebp-10H]                         ; 188E _ FF. 75, F0
        push    esi                                     ; 1891 _ 56
        push    ebx                                     ; 1892 _ 53
        push    ecx                                     ; 1893 _ 51
        push    edx                                     ; 1894 _ 52
        push    eax                                     ; 1895 _ 50
        call    boxfill8                                ; 1896 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 189B _ 83. C4, 1C
        nop                                             ; 189E _ 90
        lea     esp, [ebp-0CH]                          ; 189F _ 8D. 65, F4
        pop     ebx                                     ; 18A2 _ 5B
        pop     esi                                     ; 18A3 _ 5E
        pop     edi                                     ; 18A4 _ 5F
        pop     ebp                                     ; 18A5 _ 5D
        ret                                             ; 18A6 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 18A7 _ 55
        mov     ebp, esp                                ; 18A8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 18AA _ 8B. 45, 08
        mov     dword [eax], 0                          ; 18AD _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 18B3 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 18B6 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 18BD _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 18C0 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 18C7 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 18CA _ C7. 40, 0C, 00000000
        nop                                             ; 18D1 _ 90
        pop     ebp                                     ; 18D2 _ 5D
        ret                                             ; 18D3 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 18D4 _ 55
        mov     ebp, esp                                ; 18D5 _ 89. E5
        sub     esp, 16                                 ; 18D7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 18DA _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 18E1 _ C7. 45, FC, 00000000
        jmp     ?_073                                   ; 18E8 _ EB, 13

?_072:  mov     eax, dword [ebp+8H]                     ; 18EA _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 18ED _ 8B. 55, FC
        add     edx, 2                                  ; 18F0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 18F3 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 18F7 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 18FA _ FF. 45, FC
?_073:  mov     eax, dword [ebp+8H]                     ; 18FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1900 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1902 _ 39. 45, FC
        jc near       ?_072                                   ; 1905 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1907 _ 8B. 45, F8
        leave                                           ; 190A _ C9
        ret                                             ; 190B _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 190C _ 55
        mov     ebp, esp                                ; 190D _ 89. E5
        sub     esp, 16                                 ; 190F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1912 _ C7. 45, FC, 00000000
        jmp     ?_077                                   ; 1919 _ E9, 00000084

?_074:  mov     eax, dword [ebp+8H]                     ; 191E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1921 _ 8B. 55, FC
        add     edx, 2                                  ; 1924 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1927 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 192B _ 39. 45, 0C
        ja      ?_076                                   ; 192E _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1930 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1933 _ 8B. 55, FC
        add     edx, 2                                  ; 1936 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1939 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 193C _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 193F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1942 _ 8B. 55, FC
        add     edx, 2                                  ; 1945 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1948 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 194B _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 194E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1951 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1954 _ 8B. 55, FC
        add     edx, 2                                  ; 1957 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 195A _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 195D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1960 _ 8B. 55, FC
        add     edx, 2                                  ; 1963 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1966 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 196A _ 2B. 45, 0C
        mov     edx, eax                                ; 196D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 196F _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1972 _ 8B. 4D, FC
        add     ecx, 2                                  ; 1975 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1978 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 197C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 197F _ 8B. 55, FC
        add     edx, 2                                  ; 1982 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1985 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1989 _ 85. C0
        jnz near      ?_075                                   ; 198b _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 198D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1990 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1992 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1995 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1998 _ 89. 10
?_075:  mov     eax, dword [ebp-8H]                     ; 199A _ 8B. 45, F8
        jmp     ?_078                                   ; 199D _ EB, 16

?_076:  inc     dword [ebp-4H]                          ; 199F _ FF. 45, FC
?_077:  mov     eax, dword [ebp+8H]                     ; 19A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19A5 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 19A7 _ 39. 45, FC
        jc near       ?_074                                   ; 19aa _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 19B0 _ B8, 00000000
?_078:  leave                                           ; 19B5 _ C9
        ret                                             ; 19B6 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 19B7 _ 55
        mov     ebp, esp                                ; 19B8 _ 89. E5
        push    ebx                                     ; 19BA _ 53
        sub     esp, 16                                 ; 19BB _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 19BE _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 19C5 _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 19C7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 19CA _ 8B. 55, F8
        add     edx, 2                                  ; 19CD _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 19D0 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 19D3 _ 39. 45, 0C
        jc near       ?_081                                   ; 19d6 _ 72, 0f
        inc     dword [ebp-8H]                          ; 19D8 _ FF. 45, F8
?_080:  mov     eax, dword [ebp+8H]                     ; 19DB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19DE _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 19E0 _ 39. 45, F8
        jl      ?_079                                   ; 19E3 _ 7C, E2
        jmp     ?_082                                   ; 19E5 _ EB, 01

?_081:  nop                                             ; 19E7 _ 90
?_082:  cmp     dword [ebp-8H], 0                       ; 19E8 _ 83. 7D, F8, 00
        jle near      ?_084                                   ; 19ec _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 19F2 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 19F5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19F8 _ 8B. 45, 08
        add     edx, 2                                  ; 19FB _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 19FE _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1A01 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1A04 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1A07 _ 8B. 45, 08
        add     ecx, 2                                  ; 1A0A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1A0D _ 8B. 44 C8, 04
        add     eax, edx                                ; 1A11 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1A13 _ 39. 45, 0C
        jne near      ?_084                                   ; 1a16 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1A1C _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1A1F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A22 _ 8B. 45, 08
        add     edx, 2                                  ; 1A25 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A28 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1A2C _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1A2F _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1A32 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A35 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A38 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1A3B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A3E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A42 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A45 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1A47 _ 39. 45, F8
        jge near      ?_083                                   ; 1a4a _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 1A4C _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1A4F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1A52 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A55 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1A58 _ 8B. 55, F8
        add     edx, 2                                  ; 1A5B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1A5E _ 8B. 04 D0
        cmp     ecx, eax                                ; 1A61 _ 39. C1
        jnz near      ?_083                                   ; 1a63 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 1A65 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1A68 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A6B _ 8B. 45, 08
        add     edx, 2                                  ; 1A6E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1A71 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A75 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1A78 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1A7B _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1A7E _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1A82 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1A85 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1A88 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1A8B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1A8E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1A91 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1A95 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A98 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1A9A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1AA0 _ 89. 10
?_083:  mov     eax, 0                                  ; 1AA2 _ B8, 00000000
        jmp     ?_090                                   ; 1AA7 _ E9, 0000011B

?_084:  mov     eax, dword [ebp+8H]                     ; 1AAC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AAF _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1AB1 _ 39. 45, F8
        jge near      ?_085                                   ; 1ab4 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1AB6 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1AB9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1ABC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1ABF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1AC2 _ 8B. 55, F8
        add     edx, 2                                  ; 1AC5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1AC8 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1ACB _ 39. C1
        jnz near      ?_085                                   ; 1acd _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1ACF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1AD2 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1AD5 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1AD8 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1ADB _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1ADE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1AE1 _ 8B. 55, F8
        add     edx, 2                                  ; 1AE4 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1AE7 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1AEB _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1AEE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1AF1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1AF4 _ 8B. 55, F8
        add     edx, 2                                  ; 1AF7 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1AFA _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1AFE _ B8, 00000000
        jmp     ?_090                                   ; 1B03 _ E9, 000000BF

?_085:  mov     eax, dword [ebp+8H]                     ; 1B08 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B0B _ 8B. 00
        cmp     eax, 4095                               ; 1B0D _ 3D, 00000FFF
        jg  near      ?_089                                   ; 1b12 _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1B18 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B1B _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1B1D _ 89. 45, F4
        jmp     ?_087                                   ; 1B20 _ EB, 27

?_086:  mov     eax, dword [ebp-0CH]                    ; 1B22 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B25 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1B28 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1B2B _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1B2E _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1B31 _ 8B. 45, 08
        add     edx, 2                                  ; 1B34 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1B37 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1B3A _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1B3C _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1B3F _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1B42 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1B46 _ FF. 4D, F4
?_087:  mov     eax, dword [ebp-0CH]                    ; 1B49 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1B4C _ 3B. 45, F8
        jg  near      ?_086                                   ; 1b4f _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 1B51 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B54 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1B56 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B59 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1B5C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1B5E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B61 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B64 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B67 _ 8B. 00
        cmp     edx, eax                                ; 1B69 _ 39. C2
        jge near      ?_088                                   ; 1b6b _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 1B6D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1B70 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1B72 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1B75 _ 89. 50, 04
?_088:  mov     eax, dword [ebp+8H]                     ; 1B78 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1B7B _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1B7E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1B81 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1B84 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1B87 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1B8A _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1B8D _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1B90 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1B93 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1B97 _ B8, 00000000
        jmp     ?_090                                   ; 1B9C _ EB, 29

?_089:  mov     eax, dword [ebp+8H]                     ; 1B9E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1BA1 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1BA4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BA7 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1BAA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1BAD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1BB0 _ 8B. 40, 08
        mov     edx, eax                                ; 1BB3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1BB5 _ 8B. 45, 10
        add     eax, edx                                ; 1BB8 _ 01. D0
        mov     edx, eax                                ; 1BBA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1BBC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1BBF _ 89. 50, 08
        mov     eax, 4294967295                         ; 1BC2 _ B8, FFFFFFFF
?_090:  add     esp, 16                                 ; 1BC7 _ 83. C4, 10
        pop     ebx                                     ; 1BCA _ 5B
        pop     ebp                                     ; 1BCB _ 5D
        ret                                             ; 1BCC _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1BCD _ 55
        mov     ebp, esp                                ; 1BCE _ 89. E5
        sub     esp, 16                                 ; 1BD0 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1BD3 _ 8B. 45, 0C
        add     eax, 4095                               ; 1BD6 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1BDB _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1BE0 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1BE3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1BE6 _ FF. 75, 08
        call    memman_alloc                            ; 1BE9 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1BEE _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1BF1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1BF4 _ 8B. 45, FC
        leave                                           ; 1BF7 _ C9
        ret                                             ; 1BF8 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1BF9 _ 55
        mov     ebp, esp                                ; 1BFA _ 89. E5
        sub     esp, 16                                 ; 1BFC _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1BFF _ 8B. 45, 10
        add     eax, 4095                               ; 1C02 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1C07 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1C0C _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1C0F _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1C12 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1C15 _ FF. 75, 08
        call    memman_free                             ; 1C18 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1C1D _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1C20 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1C23 _ 8B. 45, FC
        leave                                           ; 1C26 _ C9
        ret                                             ; 1C27 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1C28 _ 55
        mov     ebp, esp                                ; 1C29 _ 89. E5
        sub     esp, 24                                 ; 1C2B _ 83. EC, 18
        sub     esp, 8                                  ; 1C2E _ 83. EC, 08
        push    9232                                    ; 1C31 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1C36 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1C39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C3E _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1C41 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1C44 _ 83. 7D, F0, 00
        jnz near      ?_091                                   ; 1c48 _ 75, 0a
        mov     eax, 0                                  ; 1C4A _ B8, 00000000
        jmp     ?_095                                   ; 1C4F _ E9, 00000099

?_091:  mov     eax, dword [ebp+10H]                    ; 1C54 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1C57 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1C5B _ 83. EC, 08
        push    eax                                     ; 1C5E _ 50
        push    dword [ebp+8H]                          ; 1C5F _ FF. 75, 08
        call    memman_alloc_4k                         ; 1C62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C67 _ 83. C4, 10
        mov     edx, eax                                ; 1C6A _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1C6C _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 1C6F _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 1C72 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1C75 _ 8B. 40, 04
        test    eax, eax                                ; 1C78 _ 85. C0
        jnz near      ?_092                                   ; 1c7a _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 1C7C _ 8B. 45, F0
        sub     esp, 4                                  ; 1C7F _ 83. EC, 04
        push    9232                                    ; 1C82 _ 68, 00002410
        push    eax                                     ; 1C87 _ 50
        push    dword [ebp+8H]                          ; 1C88 _ FF. 75, 08
        call    memman_free_4k                          ; 1C8B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C90 _ 83. C4, 10
        mov     eax, 0                                  ; 1C93 _ B8, 00000000
        jmp     ?_095                                   ; 1C98 _ EB, 53

?_092:  mov     eax, dword [ebp-10H]                    ; 1C9A _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 1C9D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1CA0 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 1CA2 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1CA5 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 1CA8 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1CAB _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 1CAE _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 1CB1 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 1CB4 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 1CB7 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 1CBE _ C7. 45, F4, 00000000
        jmp     ?_094                                   ; 1CC5 _ EB, 1A

?_093:  mov     eax, dword [ebp-10H]                    ; 1CC7 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 1CCA _ 8B. 55, F4
        add     edx, 33                                 ; 1CCD _ 83. C2, 21
        shl     edx, 5                                  ; 1CD0 _ C1. E2, 05
        add     eax, edx                                ; 1CD3 _ 01. D0
        add     eax, 16                                 ; 1CD5 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1CD8 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 1CDE _ FF. 45, F4
?_094:  cmp     dword [ebp-0CH], 255                    ; 1CE1 _ 81. 7D, F4, 000000FF
        jle near      ?_093                                   ; 1ce8 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 1CEA _ 8B. 45, F0
?_095:  leave                                           ; 1CED _ C9
        ret                                             ; 1CEE _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 1CEF _ 55
        mov     ebp, esp                                ; 1CF0 _ 89. E5
        sub     esp, 16                                 ; 1CF2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CF5 _ C7. 45, FC, 00000000
        jmp     ?_098                                   ; 1CFC _ EB, 5A

?_096:  mov     eax, dword [ebp+8H]                     ; 1CFE _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D01 _ 8B. 55, FC
        add     edx, 33                                 ; 1D04 _ 83. C2, 21
        shl     edx, 5                                  ; 1D07 _ C1. E2, 05
        add     eax, edx                                ; 1D0A _ 01. D0
        add     eax, 16                                 ; 1D0C _ 83. C0, 10
        mov     eax, dword [eax]                        ; 1D0F _ 8B. 00
        test    eax, eax                                ; 1D11 _ 85. C0
        jnz near      ?_097                                   ; 1d13 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 1D15 _ 8B. 45, FC
        shl     eax, 5                                  ; 1D18 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1D1B _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 1D21 _ 8B. 45, 08
        add     eax, edx                                ; 1D24 _ 01. D0
        add     eax, 4                                  ; 1D26 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 1D29 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1D2C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D2F _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 1D32 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1D35 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 1D38 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 1D3C _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 1D3F _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1D46 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1D49 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 1D50 _ 8B. 45, F8
        jmp     ?_099                                   ; 1D53 _ EB, 11

?_097:  inc     dword [ebp-4H]                          ; 1D55 _ FF. 45, FC
?_098:  cmp     dword [ebp-4H], 255                     ; 1D58 _ 81. 7D, FC, 000000FF
        jle near      ?_096                                   ; 1d5f _ 7e, 9d
        mov     eax, 0                                  ; 1D61 _ B8, 00000000
?_099:  leave                                           ; 1D66 _ C9
        ret                                             ; 1D67 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1D68 _ 55
        mov     ebp, esp                                ; 1D69 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1D6B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1D6E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1D71 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1D73 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D76 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1D79 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D7C _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 1D7F _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1D82 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1D85 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1D88 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1D8B _ 89. 50, 14
        nop                                             ; 1D8E _ 90
        pop     ebp                                     ; 1D8F _ 5D
        ret                                             ; 1D90 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 1D91 _ 55
        mov     ebp, esp                                ; 1D92 _ 89. E5
        push    esi                                     ; 1D94 _ 56
        push    ebx                                     ; 1D95 _ 53
        sub     esp, 16                                 ; 1D96 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1D99 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D9C _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 1D9F _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 1DA2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1DA5 _ 8B. 40, 10
        inc     eax                                     ; 1DA8 _ 40
        cmp     dword [ebp+10H], eax                    ; 1DA9 _ 39. 45, 10
        jle near      ?_100                                   ; 1dac _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 1DAE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1DB1 _ 8B. 40, 10
        inc     eax                                     ; 1DB4 _ 40
        mov     dword [ebp+10H], eax                    ; 1DB5 _ 89. 45, 10
?_100:  cmp     dword [ebp+10H], -1                     ; 1DB8 _ 83. 7D, 10, FF
        jge near      ?_101                                   ; 1dbc _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 1DBE _ C7. 45, 10, FFFFFFFF
?_101:  mov     eax, dword [ebp+0CH]                    ; 1DC5 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1DC8 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 1DCB _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 1DCE _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1DD1 _ 3B. 45, 10
        jle near      ?_108                                   ; 1dd4 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 1DDA _ 83. 7D, 10, 00
        js near       ?_104                                   ; 1dde _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 1DE4 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1DE7 _ 89. 45, F4
        jmp     ?_103                                   ; 1DEA _ EB, 33

?_102:  mov     eax, dword [ebp-0CH]                    ; 1DEC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DEF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DF2 _ 8B. 45, 08
        add     edx, 4                                  ; 1DF5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1DF8 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1DFC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1DFF _ 8B. 4D, F4
        add     ecx, 4                                  ; 1E02 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1E05 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1E09 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E0C _ 8B. 55, F4
        add     edx, 4                                  ; 1E0F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1E12 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1E16 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1E19 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1E1C _ FF. 4D, F4
?_103:  mov     eax, dword [ebp-0CH]                    ; 1E1F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1E22 _ 3B. 45, 10
        jg  near      ?_102                                   ; 1e25 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 1E27 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1E2A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1E2D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1E30 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1E33 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1E37 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1E3A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1E3D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E40 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E43 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1E46 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1E49 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1E4C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1E4F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E52 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E55 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1E58 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1E5B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E5E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E61 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1E64 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1E67 _ 83. EC, 08
        push    esi                                     ; 1E6A _ 56
        push    ebx                                     ; 1E6B _ 53
        push    ecx                                     ; 1E6C _ 51
        push    edx                                     ; 1E6D _ 52
        push    eax                                     ; 1E6E _ 50
        push    dword [ebp+8H]                          ; 1E6F _ FF. 75, 08
        call    sheet_refreshmap                        ; 1E72 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E77 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1E7A _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1E7D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1E80 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1E83 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1E86 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1E89 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1E8C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1E8F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1E92 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1E95 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E98 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1E9B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1E9E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1EA1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1EA4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1EA7 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1EAA _ 83. EC, 04
        push    dword [ebp-10H]                         ; 1EAD _ FF. 75, F0
        push    esi                                     ; 1EB0 _ 56
        push    ebx                                     ; 1EB1 _ 53
        push    ecx                                     ; 1EB2 _ 51
        push    edx                                     ; 1EB3 _ 52
        push    eax                                     ; 1EB4 _ 50
        push    dword [ebp+8H]                          ; 1EB5 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1EB8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EBD _ 83. C4, 20
        jmp     ?_115                                   ; 1EC0 _ E9, 00000239

?_104:  mov     eax, dword [ebp+8H]                     ; 1EC5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1EC8 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 1ECB _ 39. 45, F0
        jge near      ?_107                                   ; 1ece _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 1ED0 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1ED3 _ 89. 45, F4
        jmp     ?_106                                   ; 1ED6 _ EB, 33

?_105:  mov     eax, dword [ebp-0CH]                    ; 1ED8 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1EDB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EDE _ 8B. 45, 08
        add     edx, 4                                  ; 1EE1 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1EE4 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1EE8 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1EEB _ 8B. 4D, F4
        add     ecx, 4                                  ; 1EEE _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1EF1 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1EF5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EF8 _ 8B. 55, F4
        add     edx, 4                                  ; 1EFB _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1EFE _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1F02 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1F05 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1F08 _ FF. 45, F4
?_106:  mov     eax, dword [ebp+8H]                     ; 1F0B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F0E _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 1F11 _ 39. 45, F4
        jl      ?_105                                   ; 1F14 _ 7C, C2
?_107:  mov     eax, dword [ebp+8H]                     ; 1F16 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F19 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1F1C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F1F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1F22 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F25 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F28 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F2B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1F2E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1F31 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1F34 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1F37 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F3A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F3D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1F40 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1F43 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F46 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F49 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1F4C _ 8B. 40, 0C
        sub     esp, 8                                  ; 1F4F _ 83. EC, 08
        push    0                                       ; 1F52 _ 6A, 00
        push    ebx                                     ; 1F54 _ 53
        push    ecx                                     ; 1F55 _ 51
        push    edx                                     ; 1F56 _ 52
        push    eax                                     ; 1F57 _ 50
        push    dword [ebp+8H]                          ; 1F58 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1F5B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1F60 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1F63 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 1F66 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1F69 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F6C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F6F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1F72 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1F75 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1F78 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1F7B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F7E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F81 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1F84 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1F87 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1F8A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1F8D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1F90 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1F93 _ 83. EC, 04
        push    esi                                     ; 1F96 _ 56
        push    0                                       ; 1F97 _ 6A, 00
        push    ebx                                     ; 1F99 _ 53
        push    ecx                                     ; 1F9A _ 51
        push    edx                                     ; 1F9B _ 52
        push    eax                                     ; 1F9C _ 50
        push    dword [ebp+8H]                          ; 1F9D _ FF. 75, 08
        call    sheet_refreshsub                        ; 1FA0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1FA5 _ 83. C4, 20
        jmp     ?_115                                   ; 1FA8 _ E9, 00000151

?_108:  mov     eax, dword [ebp-10H]                    ; 1FAD _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1FB0 _ 3B. 45, 10
        jge near      ?_115                                   ; 1fb3 _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 1FB9 _ 83. 7D, F0, 00
        js near       ?_111                                   ; 1fbd _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 1FBF _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1FC2 _ 89. 45, F4
        jmp     ?_110                                   ; 1FC5 _ EB, 33

?_109:  mov     eax, dword [ebp-0CH]                    ; 1FC7 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1FCA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FCD _ 8B. 45, 08
        add     edx, 4                                  ; 1FD0 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1FD3 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1FD7 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1FDA _ 8B. 4D, F4
        add     ecx, 4                                  ; 1FDD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1FE0 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1FE4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1FE7 _ 8B. 55, F4
        add     edx, 4                                  ; 1FEA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1FED _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1FF1 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1FF4 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1FF7 _ FF. 45, F4
?_110:  mov     eax, dword [ebp-0CH]                    ; 1FFA _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1FFD _ 3B. 45, 10
        jl      ?_109                                   ; 2000 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 2002 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2005 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2008 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 200B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 200E _ 89. 54 88, 04
        jmp     ?_114                                   ; 2012 _ EB, 69

?_111:  mov     eax, dword [ebp+8H]                     ; 2014 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2017 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 201A _ 89. 45, F4
        jmp     ?_113                                   ; 201D _ EB, 37

?_112:  mov     eax, dword [ebp-0CH]                    ; 201F _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 2022 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2025 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2028 _ 8B. 55, F4
        add     edx, 4                                  ; 202B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 202E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2032 _ 8B. 45, 08
        add     ecx, 4                                  ; 2035 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2038 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 203C _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 203F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2042 _ 8B. 45, 08
        add     edx, 4                                  ; 2045 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2048 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 204C _ 8B. 55, F4
        inc     edx                                     ; 204F _ 42
        mov     dword [eax+18H], edx                    ; 2050 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2053 _ FF. 4D, F4
?_113:  mov     eax, dword [ebp-0CH]                    ; 2056 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2059 _ 3B. 45, 10
        jge near      ?_112                                   ; 205c _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 205E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2061 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2064 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2067 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 206A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 206E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2071 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2074 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2077 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 207A _ 89. 50, 10
?_114:  mov     eax, dword [ebp+0CH]                    ; 207D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2080 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2083 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2086 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2089 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 208C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 208F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2092 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2095 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2098 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 209B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 209E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20A1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 20A4 _ 8B. 40, 0C
        sub     esp, 8                                  ; 20A7 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 20AA _ FF. 75, 10
        push    ebx                                     ; 20AD _ 53
        push    ecx                                     ; 20AE _ 51
        push    edx                                     ; 20AF _ 52
        push    eax                                     ; 20B0 _ 50
        push    dword [ebp+8H]                          ; 20B1 _ FF. 75, 08
        call    sheet_refreshmap                        ; 20B4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20B9 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 20BC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 20BF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20C2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 20C5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 20C8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 20CB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 20CE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 20D1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 20D4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 20D7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 20DA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 20DD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 20E0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 20E3 _ 8B. 40, 0C
        sub     esp, 4                                  ; 20E6 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 20E9 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 20EC _ FF. 75, 10
        push    ebx                                     ; 20EF _ 53
        push    ecx                                     ; 20F0 _ 51
        push    edx                                     ; 20F1 _ 52
        push    eax                                     ; 20F2 _ 50
        push    dword [ebp+8H]                          ; 20F3 _ FF. 75, 08
        call    sheet_refreshsub                        ; 20F6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 20FB _ 83. C4, 20
?_115:  nop                                             ; 20FE _ 90
        lea     esp, [ebp-8H]                           ; 20FF _ 8D. 65, F8
        pop     ebx                                     ; 2102 _ 5B
        pop     esi                                     ; 2103 _ 5E
        pop     ebp                                     ; 2104 _ 5D
        ret                                             ; 2105 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2106 _ 55
        mov     ebp, esp                                ; 2107 _ 89. E5
        push    edi                                     ; 2109 _ 57
        push    esi                                     ; 210A _ 56
        push    ebx                                     ; 210B _ 53
        sub     esp, 28                                 ; 210C _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 210F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2112 _ 8B. 40, 18
        test    eax, eax                                ; 2115 _ 85. C0
        js near       ?_116                                   ; 2117 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 2119 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 211C _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 211F _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 2122 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 2125 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2128 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 212B _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 212E _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 2131 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2134 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 2137 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 213A _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 213D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2140 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 2143 _ 8B. 45, 14
        add     edx, eax                                ; 2146 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2148 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 214B _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 214E _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2151 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2154 _ 03. 45, E4
        sub     esp, 4                                  ; 2157 _ 83. EC, 04
        push    ebx                                     ; 215A _ 53
        push    ecx                                     ; 215B _ 51
        push    edi                                     ; 215C _ 57
        push    esi                                     ; 215D _ 56
        push    edx                                     ; 215E _ 52
        push    eax                                     ; 215F _ 50
        push    dword [ebp+8H]                          ; 2160 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2163 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2168 _ 83. C4, 20
?_116:  mov     eax, 0                                  ; 216B _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2170 _ 8D. 65, F4
        pop     ebx                                     ; 2173 _ 5B
        pop     esi                                     ; 2174 _ 5E
        pop     edi                                     ; 2175 _ 5F
        pop     ebp                                     ; 2176 _ 5D
        ret                                             ; 2177 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2178 _ 55
        mov     ebp, esp                                ; 2179 _ 89. E5
        push    esi                                     ; 217B _ 56
        push    ebx                                     ; 217C _ 53
        sub     esp, 16                                 ; 217D _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2180 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2183 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2186 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2189 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 218C _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 218F _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2192 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2195 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2198 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 219B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 219E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 21A1 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21A4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21A7 _ 8B. 40, 18
        test    eax, eax                                ; 21AA _ 85. C0
        js near       ?_117                                   ; 21ac _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 21B2 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 21B5 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 21B8 _ 8B. 45, F0
        add     edx, eax                                ; 21BB _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 21BD _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 21C0 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 21C3 _ 8B. 45, F4
        add     eax, ecx                                ; 21C6 _ 01. C8
        sub     esp, 8                                  ; 21C8 _ 83. EC, 08
        push    0                                       ; 21CB _ 6A, 00
        push    edx                                     ; 21CD _ 52
        push    eax                                     ; 21CE _ 50
        push    dword [ebp-10H]                         ; 21CF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 21D2 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 21D5 _ FF. 75, 08
        call    sheet_refreshmap                        ; 21D8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 21DD _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 21E0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21E3 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 21E6 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 21E9 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 21EC _ 8B. 55, 14
        add     ecx, edx                                ; 21EF _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 21F1 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 21F4 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 21F7 _ 8B. 55, 10
        add     edx, ebx                                ; 21FA _ 01. DA
        sub     esp, 8                                  ; 21FC _ 83. EC, 08
        push    eax                                     ; 21FF _ 50
        push    ecx                                     ; 2200 _ 51
        push    edx                                     ; 2201 _ 52
        push    dword [ebp+14H]                         ; 2202 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2205 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2208 _ FF. 75, 08
        call    sheet_refreshmap                        ; 220B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2210 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2213 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2216 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 2219 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 221C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 221F _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2222 _ 8B. 45, F0
        add     edx, eax                                ; 2225 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2227 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 222A _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 222D _ 8B. 45, F4
        add     eax, ebx                                ; 2230 _ 01. D8
        sub     esp, 4                                  ; 2232 _ 83. EC, 04
        push    ecx                                     ; 2235 _ 51
        push    0                                       ; 2236 _ 6A, 00
        push    edx                                     ; 2238 _ 52
        push    eax                                     ; 2239 _ 50
        push    dword [ebp-10H]                         ; 223A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 223D _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2240 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2243 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2248 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 224B _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 224E _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2251 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2254 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2257 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 225A _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 225D _ 8B. 4D, 14
        add     ebx, ecx                                ; 2260 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2262 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2265 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2268 _ 8B. 4D, 10
        add     ecx, esi                                ; 226B _ 01. F1
        sub     esp, 4                                  ; 226D _ 83. EC, 04
        push    edx                                     ; 2270 _ 52
        push    eax                                     ; 2271 _ 50
        push    ebx                                     ; 2272 _ 53
        push    ecx                                     ; 2273 _ 51
        push    dword [ebp+14H]                         ; 2274 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2277 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 227A _ FF. 75, 08
        call    sheet_refreshsub                        ; 227D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2282 _ 83. C4, 20
?_117:  nop                                             ; 2285 _ 90
        lea     esp, [ebp-8H]                           ; 2286 _ 8D. 65, F8
        pop     ebx                                     ; 2289 _ 5B
        pop     esi                                     ; 228A _ 5E
        pop     ebp                                     ; 228B _ 5D
        ret                                             ; 228C _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 228D _ 55
        mov     ebp, esp                                ; 228E _ 89. E5
        sub     esp, 48                                 ; 2290 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2293 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2296 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2298 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 229B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 229E _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 22A1 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 22A4 _ 83. 7D, 0C, 00
        jns     ?_118                                   ; 22A8 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 22AA _ C7. 45, 0C, 00000000
?_118:  cmp     dword [ebp+10H], 8                      ; 22B1 _ 83. 7D, 10, 08
        jg  near      ?_119                                   ; 22b5 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 22B7 _ C7. 45, 10, 00000000
?_119:  mov     eax, dword [ebp+8H]                     ; 22BE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 22C1 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 22C4 _ 39. 45, 14
        jle near      ?_120                                   ; 22c7 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 22C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 22CC _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 22CF _ 89. 45, 14
?_120:  mov     eax, dword [ebp+8H]                     ; 22D2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22D5 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 22D8 _ 39. 45, 18
        jle near      ?_121                                   ; 22db _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 22DD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22E0 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 22E3 _ 89. 45, 18
?_121:  mov     eax, dword [ebp+1CH]                    ; 22E6 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 22E9 _ 89. 45, FC
        jmp     ?_128                                   ; 22EC _ E9, 0000010E

?_122:  mov     eax, dword [ebp+8H]                     ; 22F1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 22F4 _ 8B. 55, FC
        add     edx, 4                                  ; 22F7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22FA _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 22FE _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2301 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2304 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 2306 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 2309 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 230C _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 2312 _ 8B. 45, E8
        sub     eax, edx                                ; 2315 _ 29. D0
        sar     eax, 5                                  ; 2317 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 231A _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 231D _ C7. 45, F4, 00000000
        jmp     ?_127                                   ; 2324 _ E9, 000000C4

?_123:  mov     eax, dword [ebp-18H]                    ; 2329 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 232C _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 232F _ 8B. 45, F4
        add     eax, edx                                ; 2332 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2334 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2337 _ C7. 45, F8, 00000000
        jmp     ?_126                                   ; 233E _ E9, 00000098

?_124:  mov     eax, dword [ebp-18H]                    ; 2343 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2346 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2349 _ 8B. 45, F8
        add     eax, edx                                ; 234C _ 01. D0
        mov     dword [ebp-28H], eax                    ; 234E _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2351 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2354 _ 3B. 45, D8
        jg  near      ?_125                                   ; 2357 _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 2359 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 235C _ 3B. 45, 14
        jge near      ?_125                                   ; 235f _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2361 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2364 _ 3B. 45, DC
        jg  near      ?_125                                   ; 2367 _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 2369 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 236C _ 3B. 45, 18
        jge near      ?_125                                   ; 236f _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2371 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2374 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2377 _ 0F AF. 45, F4
        mov     edx, eax                                ; 237B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 237D _ 8B. 45, F8
        add     eax, edx                                ; 2380 _ 01. D0
        mov     edx, eax                                ; 2382 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2384 _ 8B. 45, E4
        add     eax, edx                                ; 2387 _ 01. D0
        mov     al, byte [eax]                          ; 2389 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 238B _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 238E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2391 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2394 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2398 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 239A _ 8B. 45, D8
        add     eax, edx                                ; 239D _ 01. D0
        mov     edx, eax                                ; 239F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 23A1 _ 8B. 45, EC
        add     eax, edx                                ; 23A4 _ 01. D0
        mov     al, byte [eax]                          ; 23A6 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 23A8 _ 38. 45, E3
        jnz near      ?_125                                   ; 23ab _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 23AD _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 23B1 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 23B4 _ 8B. 40, 14
        cmp     edx, eax                                ; 23B7 _ 39. C2
        jz near       ?_125                                   ; 23b9 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 23BB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23BE _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 23C1 _ 0F AF. 45, DC
        mov     edx, eax                                ; 23C5 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 23C7 _ 8B. 45, D8
        add     eax, edx                                ; 23CA _ 01. D0
        mov     edx, eax                                ; 23CC _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 23CE _ 8B. 45, F0
        add     edx, eax                                ; 23D1 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 23D3 _ 8A. 45, D7
        mov     byte [edx], al                          ; 23D6 _ 88. 02
?_125:  inc     dword [ebp-8H]                          ; 23D8 _ FF. 45, F8
?_126:  mov     eax, dword [ebp-18H]                    ; 23DB _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 23DE _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 23E1 _ 39. 45, F8
        jl      ?_124                                   ; 23E4 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 23EA _ FF. 45, F4
?_127:  mov     eax, dword [ebp-18H]                    ; 23ED _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 23F0 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 23F3 _ 39. 45, F4
        jl      ?_123                                   ; 23F6 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 23FC _ FF. 45, FC
?_128:  mov     eax, dword [ebp-4H]                     ; 23FF _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 2402 _ 3B. 45, 20
        jle near      ?_122                                   ; 2405 _ 0f 8e, fffffee6
        nop                                             ; 240B _ 90
        nop                                             ; 240C _ 90
        leave                                           ; 240D _ C9
        ret                                             ; 240E _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 240F _ 55
        mov     ebp, esp                                ; 2410 _ 89. E5
        sub     esp, 64                                 ; 2412 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2415 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2418 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 241B _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 241E _ 83. 7D, 0C, 00
        jns     ?_129                                   ; 2422 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2424 _ C7. 45, 0C, 00000000
?_129:  cmp     dword [ebp+10H], 0                      ; 242B _ 83. 7D, 10, 00
        jns     ?_130                                   ; 242F _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2431 _ C7. 45, 10, 00000000
?_130:  mov     eax, dword [ebp+8H]                     ; 2438 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 243B _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 243E _ 39. 45, 14
        jle near      ?_131                                   ; 2441 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2443 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2446 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2449 _ 89. 45, 14
?_131:  mov     eax, dword [ebp+8H]                     ; 244C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 244F _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2452 _ 39. 45, 18
        jle near      ?_132                                   ; 2455 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2457 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 245A _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 245D _ 89. 45, 18
?_132:  mov     eax, dword [ebp+1CH]                    ; 2460 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2463 _ 89. 45, FC
        jmp     ?_143                                   ; 2466 _ E9, 00000137

?_133:  mov     eax, dword [ebp+8H]                     ; 246B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 246E _ 8B. 55, FC
        add     edx, 4                                  ; 2471 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2474 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2478 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 247B _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 247E _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2484 _ 8B. 45, DC
        sub     eax, edx                                ; 2487 _ 29. D0
        sar     eax, 5                                  ; 2489 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 248C _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 248F _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2492 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2494 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2497 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 249A _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 249D _ 8B. 55, 0C
        sub     edx, eax                                ; 24A0 _ 29. C2
        mov     eax, edx                                ; 24A2 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 24A4 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 24A7 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 24AA _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 24AD _ 8B. 55, 10
        sub     edx, eax                                ; 24B0 _ 29. C2
        mov     eax, edx                                ; 24B2 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 24B4 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 24B7 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 24BA _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 24BD _ 8B. 55, 14
        sub     edx, eax                                ; 24C0 _ 29. C2
        mov     eax, edx                                ; 24C2 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 24C4 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 24C7 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 24CA _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 24CD _ 8B. 55, 18
        sub     edx, eax                                ; 24D0 _ 29. C2
        mov     eax, edx                                ; 24D2 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 24D4 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 24D7 _ 83. 7D, F0, 00
        jns     ?_134                                   ; 24DB _ 79, 07
        mov     dword [ebp-10H], 0                      ; 24DD _ C7. 45, F0, 00000000
?_134:  cmp     dword [ebp-14H], 0                      ; 24E4 _ 83. 7D, EC, 00
        jns     ?_135                                   ; 24E8 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 24EA _ C7. 45, EC, 00000000
?_135:  mov     eax, dword [ebp-24H]                    ; 24F1 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 24F4 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 24F7 _ 39. 45, E8
        jle near      ?_136                                   ; 24fa _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 24FC _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 24FF _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2502 _ 89. 45, E8
?_136:  mov     eax, dword [ebp-24H]                    ; 2505 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2508 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 250B _ 39. 45, E4
        jle near      ?_137                                   ; 250e _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2510 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2513 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2516 _ 89. 45, E4
?_137:  mov     eax, dword [ebp-14H]                    ; 2519 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 251C _ 89. 45, F4
        jmp     ?_142                                   ; 251F _ EB, 76

?_138:  mov     eax, dword [ebp-24H]                    ; 2521 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2524 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2527 _ 8B. 45, F4
        add     eax, edx                                ; 252A _ 01. D0
        mov     dword [ebp-30H], eax                    ; 252C _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 252F _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2532 _ 89. 45, F8
        jmp     ?_141                                   ; 2535 _ EB, 55

?_139:  mov     eax, dword [ebp-24H]                    ; 2537 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 253A _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 253D _ 8B. 45, F8
        add     eax, edx                                ; 2540 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2542 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2545 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2548 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 254B _ 0F AF. 45, F4
        mov     edx, eax                                ; 254F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2551 _ 8B. 45, F8
        add     eax, edx                                ; 2554 _ 01. D0
        mov     edx, eax                                ; 2556 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2558 _ 8B. 45, D4
        add     eax, edx                                ; 255B _ 01. D0
        mov     al, byte [eax]                          ; 255D _ 8A. 00
        movzx   edx, al                                 ; 255F _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2562 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2565 _ 8B. 40, 14
        cmp     edx, eax                                ; 2568 _ 39. C2
        jz near       ?_140                                   ; 256a _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 256C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 256F _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2572 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2576 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2578 _ 8B. 45, CC
        add     eax, edx                                ; 257B _ 01. D0
        mov     edx, eax                                ; 257D _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 257F _ 8B. 45, E0
        add     edx, eax                                ; 2582 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2584 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2587 _ 88. 02
?_140:  inc     dword [ebp-8H]                          ; 2589 _ FF. 45, F8
?_141:  mov     eax, dword [ebp-8H]                     ; 258C _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 258F _ 3B. 45, E8
        jl      ?_139                                   ; 2592 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2594 _ FF. 45, F4
?_142:  mov     eax, dword [ebp-0CH]                    ; 2597 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 259A _ 3B. 45, E4
        jl      ?_138                                   ; 259D _ 7C, 82
        inc     dword [ebp-4H]                          ; 259F _ FF. 45, FC
?_143:  mov     eax, dword [ebp+8H]                     ; 25A2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25A5 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 25A8 _ 39. 45, FC
        jle near      ?_133                                   ; 25ab _ 0f 8e, fffffeba
        nop                                             ; 25B1 _ 90
        leave                                           ; 25B2 _ C9
        ret                                             ; 25B3 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 25B4 _ 55
        mov     ebp, esp                                ; 25B5 _ 89. E5
        sub     esp, 24                                 ; 25B7 _ 83. EC, 18
        sub     esp, 8                                  ; 25BA _ 83. EC, 08
        push    52                                      ; 25BD _ 6A, 34
        push    67                                      ; 25BF _ 6A, 43
        call    io_out8                                 ; 25C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25C6 _ 83. C4, 10
        sub     esp, 8                                  ; 25C9 _ 83. EC, 08
        push    156                                     ; 25CC _ 68, 0000009C
        push    64                                      ; 25D1 _ 6A, 40
        call    io_out8                                 ; 25D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25D8 _ 83. C4, 10
        sub     esp, 8                                  ; 25DB _ 83. EC, 08
        push    46                                      ; 25DE _ 6A, 2E
        push    64                                      ; 25E0 _ 6A, 40
        call    io_out8                                 ; 25E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25E7 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 25EA _ C7. 05, 00000260(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 25F4 _ C7. 45, F4, 00000000
        jmp     ?_145                                   ; 25FB _ EB, 14

?_144:  mov     eax, dword [ebp-0CH]                    ; 25FD _ 8B. 45, F4
        shl     eax, 4                                  ; 2600 _ C1. E0, 04
        add     eax, ?_176                              ; 2603 _ 05, 00000268(d)
        mov     dword [eax], 0                          ; 2608 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 260E _ FF. 45, F4
?_145:  cmp     dword [ebp-0CH], 499                    ; 2611 _ 81. 7D, F4, 000001F3
        jle near      ?_144                                   ; 2618 _ 7e, e3
        nop                                             ; 261A _ 90
        nop                                             ; 261B _ 90
        leave                                           ; 261C _ C9
        ret                                             ; 261D _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 261E _ 55
        mov     ebp, esp                                ; 261F _ 89. E5
        sub     esp, 16                                 ; 2621 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2624 _ C7. 45, FC, 00000000
        jmp     ?_148                                   ; 262B _ EB, 35

?_146:  mov     eax, dword [ebp-4H]                     ; 262D _ 8B. 45, FC
        shl     eax, 4                                  ; 2630 _ C1. E0, 04
        add     eax, ?_176                              ; 2633 _ 05, 00000268(d)
        mov     eax, dword [eax]                        ; 2638 _ 8B. 00
        test    eax, eax                                ; 263A _ 85. C0
        jnz near      ?_147                                   ; 263c _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 263E _ 8B. 45, FC
        shl     eax, 4                                  ; 2641 _ C1. E0, 04
        add     eax, ?_176                              ; 2644 _ 05, 00000268(d)
        mov     dword [eax], 1                          ; 2649 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 264F _ 8B. 45, FC
        shl     eax, 4                                  ; 2652 _ C1. E0, 04
        add     eax, timerctl                           ; 2655 _ 05, 00000260(d)
        add     eax, 4                                  ; 265A _ 83. C0, 04
        jmp     ?_149                                   ; 265D _ EB, 11

?_147:  inc     dword [ebp-4H]                          ; 265F _ FF. 45, FC
?_148:  cmp     dword [ebp-4H], 499                     ; 2662 _ 81. 7D, FC, 000001F3
        jle near      ?_146                                   ; 2669 _ 7e, c2
        mov     eax, 0                                  ; 266B _ B8, 00000000
?_149:  leave                                           ; 2670 _ C9
        ret                                             ; 2671 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2672 _ 55
        mov     ebp, esp                                ; 2673 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2675 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2678 _ C7. 40, 04, 00000000
        nop                                             ; 267F _ 90
        pop     ebp                                     ; 2680 _ 5D
        ret                                             ; 2681 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2682 _ 55
        mov     ebp, esp                                ; 2683 _ 89. E5
        sub     esp, 4                                  ; 2685 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2688 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 268B _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 268E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2691 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2694 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2697 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 269A _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 269D _ 88. 50, 0C
        nop                                             ; 26A0 _ 90
        leave                                           ; 26A1 _ C9
        ret                                             ; 26A2 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 26A3 _ 55
        mov     ebp, esp                                ; 26A4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 26A6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 26A9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 26AC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 26AE _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 26B1 _ C7. 40, 04, 00000002
        nop                                             ; 26B8 _ 90
        pop     ebp                                     ; 26B9 _ 5D
        ret                                             ; 26BA _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 26BB _ 55
        mov     ebp, esp                                ; 26BC _ 89. E5
        sub     esp, 24                                 ; 26BE _ 83. EC, 18
        sub     esp, 8                                  ; 26C1 _ 83. EC, 08
        push    96                                      ; 26C4 _ 6A, 60
        push    32                                      ; 26C6 _ 6A, 20
        call    io_out8                                 ; 26C8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 26CD _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 26D0 _ A1, 00000260(d)
        inc     eax                                     ; 26D5 _ 40
        mov     dword [timerctl], eax                   ; 26D6 _ A3, 00000260(d)
        mov     dword [ebp-0CH], 0                      ; 26DB _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 26E2 _ EB, 7E

?_150:  mov     eax, dword [ebp-0CH]                    ; 26E4 _ 8B. 45, F4
        shl     eax, 4                                  ; 26E7 _ C1. E0, 04
        add     eax, ?_176                              ; 26EA _ 05, 00000268(d)
        mov     eax, dword [eax]                        ; 26EF _ 8B. 00
        cmp     eax, 2                                  ; 26F1 _ 83. F8, 02
        jnz near      ?_151                                   ; 26f4 _ 75, 69
        mov     eax, dword [ebp-0CH]                    ; 26F6 _ 8B. 45, F4
        shl     eax, 4                                  ; 26F9 _ C1. E0, 04
        add     eax, ?_175                              ; 26FC _ 05, 00000264(d)
        mov     eax, dword [eax]                        ; 2701 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2703 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2706 _ 8B. 45, F4
        shl     eax, 4                                  ; 2709 _ C1. E0, 04
        add     eax, ?_175                              ; 270C _ 05, 00000264(d)
        mov     dword [eax], edx                        ; 2711 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2713 _ 8B. 45, F4
        shl     eax, 4                                  ; 2716 _ C1. E0, 04
        add     eax, ?_175                              ; 2719 _ 05, 00000264(d)
        mov     eax, dword [eax]                        ; 271E _ 8B. 00
        test    eax, eax                                ; 2720 _ 85. C0
        jnz near      ?_151                                   ; 2722 _ 75, 3b
        mov     eax, dword [ebp-0CH]                    ; 2724 _ 8B. 45, F4
        shl     eax, 4                                  ; 2727 _ C1. E0, 04
        add     eax, ?_176                              ; 272A _ 05, 00000268(d)
        mov     dword [eax], 1                          ; 272F _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2735 _ 8B. 45, F4
        shl     eax, 4                                  ; 2738 _ C1. E0, 04
        add     eax, ?_178                              ; 273B _ 05, 00000270(d)
        mov     al, byte [eax]                          ; 2740 _ 8A. 00
        movzx   edx, al                                 ; 2742 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2745 _ 8B. 45, F4
        shl     eax, 4                                  ; 2748 _ C1. E0, 04
        add     eax, ?_177                              ; 274B _ 05, 0000026C(d)
        mov     eax, dword [eax]                        ; 2750 _ 8B. 00
        sub     esp, 8                                  ; 2752 _ 83. EC, 08
        push    edx                                     ; 2755 _ 52
        push    eax                                     ; 2756 _ 50
        call    fifo8_put                               ; 2757 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 275C _ 83. C4, 10
?_151:  inc     dword [ebp-0CH]                         ; 275F _ FF. 45, F4
?_152:  cmp     dword [ebp-0CH], 499                    ; 2762 _ 81. 7D, F4, 000001F3
        jle near      ?_150                                   ; 2769 _ 0f 8e, ffffff75
        nop                                             ; 276F _ 90
        leave                                           ; 2770 _ C9
        ret                                             ; 2771 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2772 _ 55
        mov     ebp, esp                                ; 2773 _ 89. E5
        mov     eax, timerctl                           ; 2775 _ B8, 00000260(d)
        pop     ebp                                     ; 277A _ 5D
        ret                                             ; 277B _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 277C _ 55
        mov     ebp, esp                                ; 277D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 277F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2782 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2785 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2788 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 278B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 278E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2790 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2793 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2796 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2799 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 279C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 27A3 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 27A6 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 27AD _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 27B0 _ C7. 40, 08, 00000000
        nop                                             ; 27B7 _ 90
        pop     ebp                                     ; 27B8 _ 5D
        ret                                             ; 27B9 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 27BA _ 55
        mov     ebp, esp                                ; 27BB _ 89. E5
        sub     esp, 4                                  ; 27BD _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 27C0 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 27C3 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 27C6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27C9 _ 8B. 40, 10
        test    eax, eax                                ; 27CC _ 85. C0
        jnz near      ?_153                                   ; 27ce _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 27D0 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 27D3 _ 8B. 40, 14
        or      eax, 01H                                ; 27D6 _ 83. C8, 01
        mov     edx, eax                                ; 27D9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27DB _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 27DE _ 89. 50, 14
        mov     eax, 4294967295                         ; 27E1 _ B8, FFFFFFFF
        jmp     ?_155                                   ; 27E6 _ EB, 4F

?_153:  mov     eax, dword [ebp+8H]                     ; 27E8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 27EB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 27ED _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27F0 _ 8B. 40, 04
        add     edx, eax                                ; 27F3 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 27F5 _ 8A. 45, FC
        mov     byte [edx], al                          ; 27F8 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27FD _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2800 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2803 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2806 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2809 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 280C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 280F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2812 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2815 _ 39. C2
        jnz near      ?_154                                   ; 2817 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2819 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 281C _ C7. 40, 04, 00000000
?_154:  mov     eax, dword [ebp+8H]                     ; 2823 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2826 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2829 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 282C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 282F _ 89. 50, 10
        mov     eax, 0                                  ; 2832 _ B8, 00000000
?_155:  leave                                           ; 2837 _ C9
        ret                                             ; 2838 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2839 _ 55
        mov     ebp, esp                                ; 283A _ 89. E5
        sub     esp, 16                                 ; 283C _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 283F _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2842 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2845 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2848 _ 8B. 40, 0C
        cmp     edx, eax                                ; 284B _ 39. C2
        jnz near      ?_156                                   ; 284d _ 75, 07
        mov     eax, 4294967295                         ; 284F _ B8, FFFFFFFF
        jmp     ?_158                                   ; 2854 _ EB, 50

?_156:  mov     eax, dword [ebp+8H]                     ; 2856 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2859 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 285B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 285E _ 8B. 40, 08
        add     eax, edx                                ; 2861 _ 01. D0
        mov     al, byte [eax]                          ; 2863 _ 8A. 00
        movzx   eax, al                                 ; 2865 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2868 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 286B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 286E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2871 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2874 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2877 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 287A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 287D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2880 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2883 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2886 _ 39. C2
        jnz near      ?_157                                   ; 2888 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 288A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 288D _ C7. 40, 08, 00000000
?_157:  mov     eax, dword [ebp+8H]                     ; 2894 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2897 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 289A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 289D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 28A0 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 28A3 _ 8B. 45, FC
?_158:  leave                                           ; 28A6 _ C9
        ret                                             ; 28A7 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 28A8 _ 55
        mov     ebp, esp                                ; 28A9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 28AB _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 28AE _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 28B1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 28B4 _ 8B. 40, 10
        sub     edx, eax                                ; 28B7 _ 29. C2
        mov     eax, edx                                ; 28B9 _ 89. D0
        pop     ebp                                     ; 28BB _ 5D
        ret                                             ; 28BC _ C3
; fifo8_status End of function



?_159:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_160:                                                  ; byte
        db 20H, 6EH, 65H, 77H, 20H, 35H, 5BH, 73H       ; 0008 _  new 5[s
        db 65H, 63H, 5DH, 00H                           ; 0010 _ ec].

?_161:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0014 _ 3[sec].

?_162:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001B _ page is:
        db 20H, 00H                                     ; 0023 _  .

?_163:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0025 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002D _ L: .

?_164:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0031 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0039 _ H: .

?_165:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0045 _ w: .

?_166:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0049 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0051 _ gh: .

?_167:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0056 _ type: .



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

?_168:  db 00H                                          ; 0076 _ .

?_169:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1816:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1863:                                            ; byte
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

closebtn.1975:                                          ; byte
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

?_170:                                                  ; dword
        resb    2                                       ; 0004

?_171:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_172:  resd    1                                       ; 00EC

timerinfo:                                              ; byte
        resb    24                                      ; 00F0

timerbuf: resq  1                                       ; 0108

mx:     resd    1                                       ; 0110

my:     resd    1                                       ; 0114

xsize:  resd    1                                       ; 0118

ysize:  resd    1                                       ; 011C

buf_back: resd  8                                       ; 0120

buf_mouse:                                              ; byte
        resb    256                                     ; 0140

shtMsgBox:                                              ; dword
        resd    1                                       ; 0240

str.1911:                                               ; byte
        resb    1                                       ; 0244

?_173:  resb    9                                       ; 0245

?_174:  resb    18                                      ; 024E

timerctl:                                               ; byte
        resd    1                                       ; 0260

?_175:                                                  ; byte
        resb    4                                       ; 0264

?_176:                                                  ; byte
        resb    4                                       ; 0268

?_177:                                                  ; byte
        resb    4                                       ; 026C

?_178:                                                  ; byte
        resb    7988                                    ; 0270


