; Disassembly of file: ckernel.o
; Mon Feb  1 23:05:37 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 96                                 ; 0005 _ 83. EC, 60
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 001D _ 89. 45, DC
        mov     eax, dword [?_217]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000011C(d)
        mov     ax, word [?_218]                        ; 002B _ 66: A1, 00000006(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ysize], eax                      ; 0032 _ A3, 00000120(d)
        call    init_pit                                ; 0037 _ E8, FFFFFFFC(rel)
        push    0                                       ; 003C _ 6A, 00
        push    timerbuf                                ; 003E _ 68, 0000010C(d)
        push    8                                       ; 0043 _ 6A, 08
        push    timerinfo                               ; 0045 _ 68, 000000F0(d)
        call    fifo8_init                              ; 004A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004F _ 83. C4, 10
        call    timer_alloc                             ; 0052 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0057 _ 89. 45, D8
        sub     esp, 4                                  ; 005A _ 83. EC, 04
        push    10                                      ; 005D _ 6A, 0A
        push    timerinfo                               ; 005F _ 68, 000000F0(d)
        push    dword [ebp-28H]                         ; 0064 _ FF. 75, D8
        call    timer_init                              ; 0067 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006C _ 83. C4, 10
        sub     esp, 8                                  ; 006F _ 83. EC, 08
        push    100                                     ; 0072 _ 6A, 64
        push    dword [ebp-28H]                         ; 0074 _ FF. 75, D8
        call    timer_settime                           ; 0077 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007C _ 83. C4, 10
        call    timer_alloc                             ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0084 _ 89. 45, D4
        sub     esp, 4                                  ; 0087 _ 83. EC, 04
        push    2                                       ; 008A _ 6A, 02
        push    timerinfo                               ; 008C _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 0091 _ FF. 75, D4
        call    timer_init                              ; 0094 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0099 _ 83. C4, 10
        sub     esp, 8                                  ; 009C _ 83. EC, 08
        push    300                                     ; 009F _ 68, 0000012C
        push    dword [ebp-2CH]                         ; 00A4 _ FF. 75, D4
        call    timer_settime                           ; 00A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AC _ 83. C4, 10
        call    timer_alloc                             ; 00AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 00B4 _ 89. 45, D0
        sub     esp, 4                                  ; 00B7 _ 83. EC, 04
        push    1                                       ; 00BA _ 6A, 01
        push    timerinfo                               ; 00BC _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 00C1 _ FF. 75, D0
        call    timer_init                              ; 00C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C9 _ 83. C4, 10
        sub     esp, 8                                  ; 00CC _ 83. EC, 08
        push    50                                      ; 00CF _ 6A, 32
        push    dword [ebp-30H]                         ; 00D1 _ FF. 75, D0
        call    timer_settime                           ; 00D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D9 _ 83. C4, 10
        push    0                                       ; 00DC _ 6A, 00
        push    keybuf                                  ; 00DE _ 68, 00000040(d)
        push    32                                      ; 00E3 _ 6A, 20
        push    keyinfo                                 ; 00E5 _ 68, 00000008(d)
        call    fifo8_init                              ; 00EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EF _ 83. C4, 10
        push    0                                       ; 00F2 _ 6A, 00
        push    mousebuf                                ; 00F4 _ 68, 00000060(d)
        push    128                                     ; 00F9 _ 68, 00000080
        push    mouseinfo                               ; 00FE _ 68, 00000024(d)
        call    fifo8_init                              ; 0103 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0108 _ 83. C4, 10
        call    init_palette                            ; 010B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0110 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0115 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 011A _ 89. 45, CC
        call    get_adr_buffer                          ; 011D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0122 _ 89. 45, C8
        mov     eax, dword [memman]                     ; 0125 _ A1, 00000000(d)
        sub     esp, 12                                 ; 012A _ 83. EC, 0C
        push    eax                                     ; 012D _ 50
        call    memman_init                             ; 012E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0133 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0136 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013B _ 83. EC, 04
        push    1072594944                              ; 013E _ 68, 3FEE8000
        push    16809984                                ; 0143 _ 68, 01008000
        push    eax                                     ; 0148 _ 50
        call    memman_free                             ; 0149 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 014E _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0151 _ 8B. 0D, 00000120(d)
        mov     edx, dword [xsize]                      ; 0157 _ 8B. 15, 0000011C(d)
        mov     eax, dword [memman]                     ; 015D _ A1, 00000000(d)
        push    ecx                                     ; 0162 _ 51
        push    edx                                     ; 0163 _ 52
        push    dword [ebp-24H]                         ; 0164 _ FF. 75, DC
        push    eax                                     ; 0167 _ 50
        call    shtctl_init                             ; 0168 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016D _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0170 _ A3, 00000244(d)
        mov     eax, dword [shtctl]                     ; 0175 _ A1, 00000244(d)
        sub     esp, 12                                 ; 017A _ 83. EC, 0C
        push    eax                                     ; 017D _ 50
        call    sheet_alloc                             ; 017E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0183 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0186 _ A3, 00000248(d)
        mov     eax, dword [shtctl]                     ; 018B _ A1, 00000244(d)
        sub     esp, 12                                 ; 0190 _ 83. EC, 0C
        push    eax                                     ; 0193 _ 50
        call    sheet_alloc                             ; 0194 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0199 _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019C _ A3, 0000024C(d)
        mov     edx, dword [xsize]                      ; 01A1 _ 8B. 15, 0000011C(d)
        mov     eax, dword [ysize]                      ; 01A7 _ A1, 00000120(d)
        imul    edx, eax                                ; 01AC _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01AF _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B4 _ 83. EC, 08
        push    edx                                     ; 01B7 _ 52
        push    eax                                     ; 01B8 _ 50
        call    memman_alloc_4k                         ; 01B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01BE _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C1 _ A3, 00000124(d)
        mov     ebx, dword [ysize]                      ; 01C6 _ 8B. 1D, 00000120(d)
        mov     ecx, dword [xsize]                      ; 01CC _ 8B. 0D, 0000011C(d)
        mov     edx, dword [buf_back]                   ; 01D2 _ 8B. 15, 00000124(d)
        mov     eax, dword [sht_back]                   ; 01D8 _ A1, 00000248(d)
        sub     esp, 12                                 ; 01DD _ 83. EC, 0C
        push    99                                      ; 01E0 _ 6A, 63
        push    ebx                                     ; 01E2 _ 53
        push    ecx                                     ; 01E3 _ 51
        push    edx                                     ; 01E4 _ 52
        push    eax                                     ; 01E5 _ 50
        call    sheet_setbuf                            ; 01E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EB _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01EE _ A1, 0000024C(d)
        sub     esp, 12                                 ; 01F3 _ 83. EC, 0C
        push    99                                      ; 01F6 _ 6A, 63
        push    16                                      ; 01F8 _ 6A, 10
        push    16                                      ; 01FA _ 6A, 10
        push    buf_mouse                               ; 01FC _ 68, 00000140(d)
        push    eax                                     ; 0201 _ 50
        call    sheet_setbuf                            ; 0202 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0207 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020A _ 8B. 0D, 00000120(d)
        mov     edx, dword [xsize]                      ; 0210 _ 8B. 15, 0000011C(d)
        mov     eax, dword [buf_back]                   ; 0216 _ A1, 00000124(d)
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
        mov     edx, dword [sht_back]                   ; 023B _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0241 _ A1, 00000244(d)
        push    0                                       ; 0246 _ 6A, 00
        push    0                                       ; 0248 _ 6A, 00
        push    edx                                     ; 024A _ 52
        push    eax                                     ; 024B _ 50
        call    sheet_slide                             ; 024C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0251 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0254 _ A1, 0000011C(d)
        sub     eax, 16                                 ; 0259 _ 83. E8, 10
        mov     edx, eax                                ; 025C _ 89. C2
        shr     edx, 31                                 ; 025E _ C1. EA, 1F
        add     eax, edx                                ; 0261 _ 01. D0
        sar     eax, 1                                  ; 0263 _ D1. F8
        mov     dword [mx], eax                         ; 0265 _ A3, 00000114(d)
        mov     eax, dword [ysize]                      ; 026A _ A1, 00000120(d)
        sub     eax, 44                                 ; 026F _ 83. E8, 2C
        mov     edx, eax                                ; 0272 _ 89. C2
        shr     edx, 31                                 ; 0274 _ C1. EA, 1F
        add     eax, edx                                ; 0277 _ 01. D0
        sar     eax, 1                                  ; 0279 _ D1. F8
        mov     dword [my], eax                         ; 027B _ A3, 00000118(d)
        mov     ebx, dword [my]                         ; 0280 _ 8B. 1D, 00000118(d)
        mov     ecx, dword [mx]                         ; 0286 _ 8B. 0D, 00000114(d)
        mov     edx, dword [sht_mouse]                  ; 028C _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 0292 _ A1, 00000244(d)
        push    ebx                                     ; 0297 _ 53
        push    ecx                                     ; 0298 _ 51
        push    edx                                     ; 0299 _ 52
        push    eax                                     ; 029A _ 50
        call    sheet_slide                             ; 029B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A0 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A3 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AA _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 02B6 _ 83. EC, 08
        push    ?_204                                   ; 02B9 _ 68, 00000000(d)
        push    eax                                     ; 02BE _ 50
        call    message_box                             ; 02BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C4 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C7 _ A3, 00000240(d)
        mov     edx, dword [sht_back]                   ; 02CC _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 02D2 _ A1, 00000244(d)
        sub     esp, 4                                  ; 02D7 _ 83. EC, 04
        push    0                                       ; 02DA _ 6A, 00
        push    edx                                     ; 02DC _ 52
        push    eax                                     ; 02DD _ 50
        call    sheet_updown                            ; 02DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E3 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E6 _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 02EC _ A1, 00000244(d)
        sub     esp, 4                                  ; 02F1 _ 83. EC, 04
        push    100                                     ; 02F4 _ 6A, 64
        push    edx                                     ; 02F6 _ 52
        push    eax                                     ; 02F7 _ 50
        call    sheet_updown                            ; 02F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FD _ 83. C4, 10
        call    io_sti                                  ; 0300 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0305 _ 83. EC, 0C
        push    mdec                                    ; 0308 _ 68, 000000E0(d)
        call    enable_mouse                            ; 030D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0312 _ 83. C4, 10
        call    get_code32_addr                         ; 0315 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 031A _ 89. 45, C4
        call    get_addr_gdt                            ; 031D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 0322 _ 89. 45, C0
        mov     eax, dword [memman]                     ; 0325 _ A1, 00000000(d)
        sub     esp, 12                                 ; 032A _ 83. EC, 0C
        push    eax                                     ; 032D _ 50
        call    task_init                               ; 032E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0333 _ 83. C4, 10
        mov     dword [task_a.1861], eax                ; 0336 _ A3, 00000250(d)
        mov     eax, dword [task_a.1861]                ; 033B _ A1, 00000250(d)
        mov     dword [?_219], eax                      ; 0340 _ A3, 00000020(d)
        mov     eax, dword [task_a.1861]                ; 0345 _ A1, 00000250(d)
        sub     esp, 4                                  ; 034A _ 83. EC, 04
        push    0                                       ; 034D _ 6A, 00
        push    0                                       ; 034F _ 6A, 00
        push    eax                                     ; 0351 _ 50
        call    task_run                                ; 0352 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0357 _ 83. C4, 10
        call    launch_console                          ; 035A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], eax                    ; 035F _ 89. 45, BC
        mov     dword [ebp-48H], 0                      ; 0362 _ C7. 45, B8, 00000000
        mov     dword [ebp-14H], 0                      ; 0369 _ C7. 45, EC, 00000000
        mov     dword [ebp-4CH], 0                      ; 0370 _ C7. 45, B4, 00000000
        mov     dword [ebp-18H], 0                      ; 0377 _ C7. 45, E8, 00000000
        mov     dword [ebp-1CH], 0                      ; 037E _ C7. 45, E4, 00000000
        mov     dword [ebp-20H], 0                      ; 0385 _ C7. 45, E0, 00000000
?_001:  call    io_cli                                  ; 038C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0391 _ 83. EC, 0C
        push    keyinfo                                 ; 0394 _ 68, 00000008(d)
        call    fifo8_status                            ; 0399 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039E _ 83. C4, 10
        mov     ebx, eax                                ; 03A1 _ 89. C3
        sub     esp, 12                                 ; 03A3 _ 83. EC, 0C
        push    mouseinfo                               ; 03A6 _ 68, 00000024(d)
        call    fifo8_status                            ; 03AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B0 _ 83. C4, 10
        add     ebx, eax                                ; 03B3 _ 01. C3
        sub     esp, 12                                 ; 03B5 _ 83. EC, 0C
        push    timerinfo                               ; 03B8 _ 68, 000000F0(d)
        call    fifo8_status                            ; 03BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C2 _ 83. C4, 10
        add     eax, ebx                                ; 03C5 _ 01. D8
        test    eax, eax                                ; 03C7 _ 85. C0
        jnz near      ?_002                                   ; 03c9 _ 75, 07
        call    io_sti                                  ; 03CB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03D0 _ EB, BA

?_002:  sub     esp, 12                                 ; 03D2 _ 83. EC, 0C
        push    keyinfo                                 ; 03D5 _ 68, 00000008(d)
        call    fifo8_status                            ; 03DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DF _ 83. C4, 10
        test    eax, eax                                ; 03E2 _ 85. C0
        je near       ?_007                                   ; 03e4 _ 0f 84, 0000025b
        call    io_sti                                  ; 03EA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03EF _ 83. EC, 0C
        push    keyinfo                                 ; 03F2 _ 68, 00000008(d)
        call    fifo8_get                               ; 03F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FC _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 03FF _ 89. 45, B8
        cmp     dword [ebp-48H], 28                     ; 0402 _ 83. 7D, B8, 1C
        jnz near      ?_003                                   ; 0406 _ 75, 5c
        mov     ebx, dword [xsize]                      ; 0408 _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [buf_back]                   ; 040E _ 8B. 0D, 00000124(d)
        mov     edx, dword [ebp-14H]                    ; 0414 _ 8B. 55, EC
        mov     eax, edx                                ; 0417 _ 89. D0
        shl     eax, 2                                  ; 0419 _ C1. E0, 02
        add     eax, edx                                ; 041C _ 01. D0
        shl     eax, 2                                  ; 041E _ C1. E0, 02
        mov     edx, eax                                ; 0421 _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 0423 _ 8B. 45, C8
        lea     esi, [edx+eax]                          ; 0426 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0429 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 042F _ A1, 00000244(d)
        sub     esp, 4                                  ; 0434 _ 83. EC, 04
        push    7                                       ; 0437 _ 6A, 07
        push    ebx                                     ; 0439 _ 53
        push    dword [ebp-14H]                         ; 043A _ FF. 75, EC
        push    ecx                                     ; 043D _ 51
        push    esi                                     ; 043E _ 56
        push    edx                                     ; 043F _ 52
        push    eax                                     ; 0440 _ 50
        call    showMemoryInfo                          ; 0441 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0446 _ 83. C4, 20
        inc     dword [ebp-14H]                         ; 0449 _ FF. 45, EC
        mov     eax, dword [ebp-14H]                    ; 044C _ 8B. 45, EC
        cmp     eax, dword [ebp-34H]                    ; 044F _ 3B. 45, CC
        jle near      ?_001                                   ; 0452 _ 0f 8e, ffffff34
        mov     dword [ebp-14H], 0                      ; 0458 _ C7. 45, EC, 00000000
        jmp     ?_001                                   ; 045F _ E9, FFFFFF28

?_003:  cmp     dword [ebp-48H], 15                     ; 0464 _ 83. 7D, B8, 0F
        jne near      ?_006                                   ; 0468 _ 0f 85, 000000cb
        cmp     dword [ebp-20H], 0                      ; 046E _ 83. 7D, E0, 00
        jnz near      ?_004                                   ; 0472 _ 75, 3d
        mov     dword [ebp-20H], 1                      ; 0474 _ C7. 45, E0, 00000001
        mov     edx, dword [shtMsgBox]                  ; 047B _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0481 _ A1, 00000244(d)
        push    0                                       ; 0486 _ 6A, 00
        push    ?_205                                   ; 0488 _ 68, 00000008(d)
        push    edx                                     ; 048D _ 52
        push    eax                                     ; 048E _ 50
        call    make_wtitle8                            ; 048F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0494 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0497 _ A1, 00000244(d)
        push    1                                       ; 049C _ 6A, 01
        push    ?_206                                   ; 049E _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04A3 _ FF. 75, BC
        push    eax                                     ; 04A6 _ 50
        call    make_wtitle8                            ; 04A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AC _ 83. C4, 10
        jmp     ?_005                                   ; 04AF _ EB, 3B

?_004:  mov     dword [ebp-20H], 0                      ; 04B1 _ C7. 45, E0, 00000000
        mov     edx, dword [shtMsgBox]                  ; 04B8 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 04BE _ A1, 00000244(d)
        push    1                                       ; 04C3 _ 6A, 01
        push    ?_205                                   ; 04C5 _ 68, 00000008(d)
        push    edx                                     ; 04CA _ 52
        push    eax                                     ; 04CB _ 50
        call    make_wtitle8                            ; 04CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04D4 _ A1, 00000244(d)
        push    0                                       ; 04D9 _ 6A, 00
        push    ?_206                                   ; 04DB _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04E0 _ FF. 75, BC
        push    eax                                     ; 04E3 _ 50
        call    make_wtitle8                            ; 04E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E9 _ 83. C4, 10
?_005:  mov     eax, dword [shtMsgBox]                  ; 04EC _ A1, 00000240(d)
        mov     ecx, dword [eax+4H]                     ; 04F1 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 04F4 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 04FA _ A1, 00000244(d)
        sub     esp, 8                                  ; 04FF _ 83. EC, 08
        push    21                                      ; 0502 _ 6A, 15
        push    ecx                                     ; 0504 _ 51
        push    0                                       ; 0505 _ 6A, 00
        push    0                                       ; 0507 _ 6A, 00
        push    edx                                     ; 0509 _ 52
        push    eax                                     ; 050A _ 50
        call    sheet_refresh                           ; 050B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0510 _ 83. C4, 20
        mov     eax, dword [ebp-44H]                    ; 0513 _ 8B. 45, BC
        mov     edx, dword [eax+4H]                     ; 0516 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0519 _ A1, 00000244(d)
        sub     esp, 8                                  ; 051E _ 83. EC, 08
        push    21                                      ; 0521 _ 6A, 15
        push    edx                                     ; 0523 _ 52
        push    0                                       ; 0524 _ 6A, 00
        push    0                                       ; 0526 _ 6A, 00
        push    dword [ebp-44H]                         ; 0528 _ FF. 75, BC
        push    eax                                     ; 052B _ 50
        call    sheet_refresh                           ; 052C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0531 _ 83. C4, 20
        jmp     ?_001                                   ; 0534 _ E9, FFFFFE53

?_006:  mov     eax, dword [ebp-48H]                    ; 0539 _ 8B. 45, B8
        add     eax, keytable                           ; 053C _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0541 _ 8A. 00
        test    al, al                                  ; 0543 _ 84. C0
        je near       ?_001                                   ; 0545 _ 0f 84, fffffe41
        cmp     dword [ebp-0CH], 143                    ; 054B _ 81. 7D, F4, 0000008F
        jg  near      ?_001                                   ; 0552 _ 0f 8f, fffffe34
        mov     eax, dword [ebp-0CH]                    ; 0558 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 055B _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 055E _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0563 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0566 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 056B _ 8B. 00
        sub     esp, 4                                  ; 056D _ 83. EC, 04
        push    43                                      ; 0570 _ 6A, 2B
        push    ecx                                     ; 0572 _ 51
        push    28                                      ; 0573 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0575 _ FF. 75, F4
        push    7                                       ; 0578 _ 6A, 07
        push    edx                                     ; 057A _ 52
        push    eax                                     ; 057B _ 50
        call    boxfill8                                ; 057C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0581 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0584 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0587 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 058A _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0590 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0595 _ 83. EC, 08
        push    44                                      ; 0598 _ 6A, 2C
        push    ecx                                     ; 059A _ 51
        push    28                                      ; 059B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 059D _ FF. 75, F4
        push    edx                                     ; 05A0 _ 52
        push    eax                                     ; 05A1 _ 50
        call    sheet_refresh                           ; 05A2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05A7 _ 83. C4, 20
        mov     eax, dword [ebp-48H]                    ; 05AA _ 8B. 45, B8
        add     eax, keytable                           ; 05AD _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 05B2 _ 8A. 00
        mov     byte [ebp-5EH], al                      ; 05B4 _ 88. 45, A2
        mov     byte [ebp-5DH], 0                       ; 05B7 _ C6. 45, A3, 00
        mov     edx, dword [shtMsgBox]                  ; 05BB _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 05C1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 05C6 _ 83. EC, 08
        lea     ecx, [ebp-5EH]                          ; 05C9 _ 8D. 4D, A2
        push    ecx                                     ; 05CC _ 51
        push    0                                       ; 05CD _ 6A, 00
        push    28                                      ; 05CF _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05D1 _ FF. 75, F4
        push    edx                                     ; 05D4 _ 52
        push    eax                                     ; 05D5 _ 50
        call    showString                              ; 05D6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05DB _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 05DE _ 83. 45, F4, 08
        mov     dword [ebp-1CH], 1                      ; 05E2 _ C7. 45, E4, 00000001
        mov     eax, dword [ebp-0CH]                    ; 05E9 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 05EC _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 05EF _ 8B. 45, F0
        movzx   ecx, al                                 ; 05F2 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 05F5 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 05FA _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 05FD _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0602 _ 8B. 00
        sub     esp, 4                                  ; 0604 _ 83. EC, 04
        push    43                                      ; 0607 _ 6A, 2B
        push    ebx                                     ; 0609 _ 53
        push    28                                      ; 060A _ 6A, 1C
        push    dword [ebp-0CH]                         ; 060C _ FF. 75, F4
        push    ecx                                     ; 060F _ 51
        push    edx                                     ; 0610 _ 52
        push    eax                                     ; 0611 _ 50
        call    boxfill8                                ; 0612 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0617 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 061A _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 061D _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0620 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0626 _ A1, 00000244(d)
        sub     esp, 8                                  ; 062B _ 83. EC, 08
        push    44                                      ; 062E _ 6A, 2C
        push    ecx                                     ; 0630 _ 51
        push    28                                      ; 0631 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0633 _ FF. 75, F4
        push    edx                                     ; 0636 _ 52
        push    eax                                     ; 0637 _ 50
        call    sheet_refresh                           ; 0638 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 063D _ 83. C4, 20
        jmp     ?_001                                   ; 0640 _ E9, FFFFFD47

?_007:  sub     esp, 12                                 ; 0645 _ 83. EC, 0C
        push    mouseinfo                               ; 0648 _ 68, 00000024(d)
        call    fifo8_status                            ; 064D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0652 _ 83. C4, 10
        test    eax, eax                                ; 0655 _ 85. C0
        jz near       ?_008                                   ; 0657 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 0659 _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 065F _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0665 _ A1, 00000244(d)
        sub     esp, 4                                  ; 066A _ 83. EC, 04
        push    ecx                                     ; 066D _ 51
        push    edx                                     ; 066E _ 52
        push    eax                                     ; 066F _ 50
        call    show_mouse_info                         ; 0670 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0675 _ 83. C4, 10
        jmp     ?_001                                   ; 0678 _ E9, FFFFFD0F

?_008:  sub     esp, 12                                 ; 067D _ 83. EC, 0C
        push    timerinfo                               ; 0680 _ 68, 000000F0(d)
        call    fifo8_status                            ; 0685 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068A _ 83. C4, 10
        test    eax, eax                                ; 068D _ 85. C0
        je near       ?_001                                   ; 068f _ 0f 84, fffffcf7
        call    io_sti                                  ; 0695 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 069A _ 83. EC, 0C
        push    timerinfo                               ; 069D _ 68, 000000F0(d)
        call    fifo8_get                               ; 06A2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A7 _ 83. C4, 10
        mov     dword [ebp-50H], eax                    ; 06AA _ 89. 45, B0
        cmp     dword [ebp-50H], 10                     ; 06AD _ 83. 7D, B0, 0A
        jnz near      ?_009                                   ; 06b1 _ 75, 6a
        mov     edx, dword [sht_back]                   ; 06B3 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 06B9 _ A1, 00000244(d)
        sub     esp, 8                                  ; 06BE _ 83. EC, 08
        push    ?_207                                   ; 06C1 _ 68, 00000017(d)
        push    7                                       ; 06C6 _ 6A, 07
        push    144                                     ; 06C8 _ 68, 00000090
        push    dword [ebp-18H]                         ; 06CD _ FF. 75, E8
        push    edx                                     ; 06D0 _ 52
        push    eax                                     ; 06D1 _ 50
        call    showString                              ; 06D2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06D7 _ 83. C4, 20
        sub     esp, 8                                  ; 06DA _ 83. EC, 08
        push    100                                     ; 06DD _ 6A, 64
        push    dword [ebp-28H]                         ; 06DF _ FF. 75, D8
        call    timer_settime                           ; 06E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06E7 _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 06EA _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 06EE _ 83. 7D, E8, 28
        jle near      ?_001                                   ; 06f2 _ 0f 8e, fffffc94
        cmp     dword [ebp-1CH], 0                      ; 06F8 _ 83. 7D, E4, 00
        jne near      ?_001                                   ; 06fc _ 0f 85, fffffc8a
        call    io_cli                                  ; 0702 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1861]                ; 0707 _ A1, 00000250(d)
        sub     esp, 12                                 ; 070C _ 83. EC, 0C
        push    eax                                     ; 070F _ 50
        call    task_sleep                              ; 0710 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0715 _ 83. C4, 10
        jmp     ?_001                                   ; 0718 _ E9, FFFFFC6F

?_009:  cmp     dword [ebp-50H], 2                      ; 071D _ 83. 7D, B0, 02
        jnz near      ?_010                                   ; 0721 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0723 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0729 _ A1, 00000244(d)
        sub     esp, 8                                  ; 072E _ 83. EC, 08
        push    ?_208                                   ; 0731 _ 68, 00000019(d)
        push    7                                       ; 0736 _ 6A, 07
        push    32                                      ; 0738 _ 6A, 20
        push    0                                       ; 073A _ 6A, 00
        push    edx                                     ; 073C _ 52
        push    eax                                     ; 073D _ 50
        call    showString                              ; 073E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0743 _ 83. C4, 20
        jmp     ?_001                                   ; 0746 _ E9, FFFFFC41

?_010:  cmp     dword [ebp-50H], 0                      ; 074B _ 83. 7D, B0, 00
        jz near       ?_011                                   ; 074f _ 74, 1e
        sub     esp, 4                                  ; 0751 _ 83. EC, 04
        push    0                                       ; 0754 _ 6A, 00
        push    timerinfo                               ; 0756 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 075B _ FF. 75, D0
        call    timer_init                              ; 075E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0763 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0766 _ C7. 45, F0, 00000000
        jmp     ?_012                                   ; 076D _ EB, 1C

?_011:  sub     esp, 4                                  ; 076F _ 83. EC, 04
        push    1                                       ; 0772 _ 6A, 01
        push    timerinfo                               ; 0774 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0779 _ FF. 75, D0
        call    timer_init                              ; 077C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0781 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0784 _ C7. 45, F0, 00000007
?_012:  sub     esp, 8                                  ; 078B _ 83. EC, 08
        push    50                                      ; 078E _ 6A, 32
        push    dword [ebp-30H]                         ; 0790 _ FF. 75, D0
        call    timer_settime                           ; 0793 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0798 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 079B _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 079E _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 07A1 _ 8B. 45, F0
        movzx   ecx, al                                 ; 07A4 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 07A7 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 07AC _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 07AF _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 07B4 _ 8B. 00
        sub     esp, 4                                  ; 07B6 _ 83. EC, 04
        push    43                                      ; 07B9 _ 6A, 2B
        push    ebx                                     ; 07BB _ 53
        push    28                                      ; 07BC _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07BE _ FF. 75, F4
        push    ecx                                     ; 07C1 _ 51
        push    edx                                     ; 07C2 _ 52
        push    eax                                     ; 07C3 _ 50
        call    boxfill8                                ; 07C4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07C9 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 07CC _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 07CF _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 07D2 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 07D8 _ A1, 00000244(d)
        sub     esp, 8                                  ; 07DD _ 83. EC, 08
        push    44                                      ; 07E0 _ 6A, 2C
        push    ecx                                     ; 07E2 _ 51
        push    28                                      ; 07E3 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07E5 _ FF. 75, F4
        push    edx                                     ; 07E8 _ 52
        push    eax                                     ; 07E9 _ 50
        call    sheet_refresh                           ; 07EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07EF _ 83. C4, 20
        jmp     ?_001                                   ; 07F2 _ E9, FFFFFB95
; CMain End of function

launch_console:; Function begin
        push    ebp                                     ; 07F7 _ 55
        mov     ebp, esp                                ; 07F8 _ 89. E5
        sub     esp, 24                                 ; 07FA _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 07FD _ A1, 00000244(d)
        sub     esp, 12                                 ; 0802 _ 83. EC, 0C
        push    eax                                     ; 0805 _ 50
        call    sheet_alloc                             ; 0806 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 080B _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 080E _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0811 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0816 _ 83. EC, 08
        push    42240                                   ; 0819 _ 68, 0000A500
        push    eax                                     ; 081E _ 50
        call    memman_alloc_4k                         ; 081F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0824 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0827 _ 89. 45, F0
        sub     esp, 12                                 ; 082A _ 83. EC, 0C
        push    99                                      ; 082D _ 6A, 63
        push    165                                     ; 082F _ 68, 000000A5
        push    256                                     ; 0834 _ 68, 00000100
        push    dword [ebp-10H]                         ; 0839 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 083C _ FF. 75, F4
        call    sheet_setbuf                            ; 083F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0844 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0847 _ A1, 00000244(d)
        push    0                                       ; 084C _ 6A, 00
        push    ?_206                                   ; 084E _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0853 _ FF. 75, F4
        push    eax                                     ; 0856 _ 50
        call    make_window8                            ; 0857 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 085C _ 83. C4, 10
        sub     esp, 8                                  ; 085F _ 83. EC, 08
        push    0                                       ; 0862 _ 6A, 00
        push    128                                     ; 0864 _ 68, 00000080
        push    240                                     ; 0869 _ 68, 000000F0
        push    28                                      ; 086E _ 6A, 1C
        push    8                                       ; 0870 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0872 _ FF. 75, F4
        call    make_textbox8                           ; 0875 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 087A _ 83. C4, 20
        call    task_alloc                              ; 087D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0882 _ 89. 45, EC
        call    get_code32_addr                         ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 088A _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 088D _ 8B. 45, EC
        mov     dword [eax+70H], 0                      ; 0890 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-14H]                    ; 0897 _ 8B. 45, EC
        mov     dword [eax+74H], 1073741824             ; 089A _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-18H]                    ; 08A1 _ 8B. 45, E8
        neg     eax                                     ; 08A4 _ F7. D8
        add     eax, console_task                       ; 08A6 _ 05, 00000000(d)
        mov     edx, eax                                ; 08AB _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 08AD _ 8B. 45, EC
        mov     dword [eax+30H], edx                    ; 08B0 _ 89. 50, 30
        mov     eax, dword [ebp-14H]                    ; 08B3 _ 8B. 45, EC
        mov     dword [eax+58H], 0                      ; 08B6 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-14H]                    ; 08BD _ 8B. 45, EC
        mov     dword [eax+5CH], 8                      ; 08C0 _ C7. 40, 5C, 00000008
        mov     eax, dword [ebp-14H]                    ; 08C7 _ 8B. 45, EC
        mov     dword [eax+60H], 32                     ; 08CA _ C7. 40, 60, 00000020
        mov     eax, dword [ebp-14H]                    ; 08D1 _ 8B. 45, EC
        mov     dword [eax+64H], 24                     ; 08D4 _ C7. 40, 64, 00000018
        mov     eax, dword [ebp-14H]                    ; 08DB _ 8B. 45, EC
        mov     dword [eax+68H], 0                      ; 08DE _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-14H]                    ; 08E5 _ 8B. 45, EC
        mov     dword [eax+6CH], 16                     ; 08E8 _ C7. 40, 6C, 00000010
        mov     eax, dword [ebp-14H]                    ; 08EF _ 8B. 45, EC
        mov     eax, dword [eax+48H]                    ; 08F2 _ 8B. 40, 48
        lea     edx, [eax-8H]                           ; 08F5 _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 08F8 _ 8B. 45, EC
        mov     dword [eax+48H], edx                    ; 08FB _ 89. 50, 48
        mov     eax, dword [ebp-14H]                    ; 08FE _ 8B. 45, EC
        mov     eax, dword [eax+48H]                    ; 0901 _ 8B. 40, 48
        add     eax, 4                                  ; 0904 _ 83. C0, 04
        mov     edx, eax                                ; 0907 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0909 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 090C _ 89. 02
        sub     esp, 4                                  ; 090E _ 83. EC, 04
        push    5                                       ; 0911 _ 6A, 05
        push    1                                       ; 0913 _ 6A, 01
        push    dword [ebp-14H]                         ; 0915 _ FF. 75, EC
        call    task_run                                ; 0918 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 091D _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0920 _ A1, 00000244(d)
        push    4                                       ; 0925 _ 6A, 04
        push    32                                      ; 0927 _ 6A, 20
        push    dword [ebp-0CH]                         ; 0929 _ FF. 75, F4
        push    eax                                     ; 092C _ 50
        call    sheet_slide                             ; 092D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0932 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0935 _ A1, 00000244(d)
        sub     esp, 4                                  ; 093A _ 83. EC, 04
        push    1                                       ; 093D _ 6A, 01
        push    dword [ebp-0CH]                         ; 093F _ FF. 75, F4
        push    eax                                     ; 0942 _ 50
        call    sheet_updown                            ; 0943 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0948 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 094B _ 8B. 45, F4
        leave                                           ; 094E _ C9
        ret                                             ; 094F _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 0950 _ 55
        mov     ebp, esp                                ; 0951 _ 89. E5
        push    ebx                                     ; 0953 _ 53
        sub     esp, 564                                ; 0954 _ 81. EC, 00000234
        call    task_now                                ; 095A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 095F _ 89. 45, F0
        mov     dword [ebp-14H], 8                      ; 0962 _ C7. 45, EC, 00000008
        mov     dword [ebp-0CH], 0                      ; 0969 _ C7. 45, F4, 00000000
        push    dword [ebp-10H]                         ; 0970 _ FF. 75, F0
        lea     eax, [ebp-238H]                         ; 0973 _ 8D. 85, FFFFFDC8
        push    eax                                     ; 0979 _ 50
        push    128                                     ; 097A _ 68, 00000080
        lea     eax, [ebp-38H]                          ; 097F _ 8D. 45, C8
        push    eax                                     ; 0982 _ 50
        call    fifo8_init                              ; 0983 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0988 _ 83. C4, 10
        call    timer_alloc                             ; 098B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0990 _ 89. 45, E8
        sub     esp, 4                                  ; 0993 _ 83. EC, 04
        push    1                                       ; 0996 _ 6A, 01
        lea     eax, [ebp-38H]                          ; 0998 _ 8D. 45, C8
        push    eax                                     ; 099B _ 50
        push    dword [ebp-18H]                         ; 099C _ FF. 75, E8
        call    timer_init                              ; 099F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A4 _ 83. C4, 10
        sub     esp, 8                                  ; 09A7 _ 83. EC, 08
        push    50                                      ; 09AA _ 6A, 32
        push    dword [ebp-18H]                         ; 09AC _ FF. 75, E8
        call    timer_settime                           ; 09AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09B4 _ 83. C4, 10
?_013:  call    io_cli                                  ; 09B7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 09BC _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 09BF _ 8D. 45, C8
        push    eax                                     ; 09C2 _ 50
        call    fifo8_status                            ; 09C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C8 _ 83. C4, 10
        test    eax, eax                                ; 09CB _ 85. C0
        jnz near      ?_014                                   ; 09cd _ 75, 07
        call    io_sti                                  ; 09CF _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 09D4 _ EB, E1

?_014:  sub     esp, 12                                 ; 09D6 _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 09D9 _ 8D. 45, C8
        push    eax                                     ; 09DC _ 50
        call    fifo8_get                               ; 09DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09E2 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 09E5 _ 89. 45, E4
        call    io_sti                                  ; 09E8 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 1                      ; 09ED _ 83. 7D, E4, 01
        jg  near      ?_013                                   ; 09f1 _ 7f, c4
        cmp     dword [ebp-1CH], 0                      ; 09F3 _ 83. 7D, E4, 00
        jz near       ?_015                                   ; 09f7 _ 74, 1d
        sub     esp, 4                                  ; 09F9 _ 83. EC, 04
        push    0                                       ; 09FC _ 6A, 00
        lea     eax, [ebp-38H]                          ; 09FE _ 8D. 45, C8
        push    eax                                     ; 0A01 _ 50
        push    dword [ebp-18H]                         ; 0A02 _ FF. 75, E8
        call    timer_init                              ; 0A05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0A _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 0A0D _ C7. 45, F4, 00000007
        jmp     ?_016                                   ; 0A14 _ EB, 1B

?_015:  sub     esp, 4                                  ; 0A16 _ 83. EC, 04
        push    1                                       ; 0A19 _ 6A, 01
        lea     eax, [ebp-38H]                          ; 0A1B _ 8D. 45, C8
        push    eax                                     ; 0A1E _ 50
        push    dword [ebp-18H]                         ; 0A1F _ FF. 75, E8
        call    timer_init                              ; 0A22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A27 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0A2A _ C7. 45, F4, 00000000
?_016:  sub     esp, 8                                  ; 0A31 _ 83. EC, 08
        push    50                                      ; 0A34 _ 6A, 32
        push    dword [ebp-18H]                         ; 0A36 _ FF. 75, E8
        call    timer_settime                           ; 0A39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A3E _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0A41 _ 8B. 45, EC
        lea     ebx, [eax+7H]                           ; 0A44 _ 8D. 58, 07
        mov     eax, dword [ebp-0CH]                    ; 0A47 _ 8B. 45, F4
        movzx   ecx, al                                 ; 0A4A _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 0A4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0A50 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0A53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0A56 _ 8B. 00
        sub     esp, 4                                  ; 0A58 _ 83. EC, 04
        push    43                                      ; 0A5B _ 6A, 2B
        push    ebx                                     ; 0A5D _ 53
        push    28                                      ; 0A5E _ 6A, 1C
        push    dword [ebp-14H]                         ; 0A60 _ FF. 75, EC
        push    ecx                                     ; 0A63 _ 51
        push    edx                                     ; 0A64 _ 52
        push    eax                                     ; 0A65 _ 50
        call    boxfill8                                ; 0A66 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A6B _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0A6E _ 8B. 45, EC
        lea     edx, [eax+8H]                           ; 0A71 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0A74 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A79 _ 83. EC, 08
        push    44                                      ; 0A7C _ 6A, 2C
        push    edx                                     ; 0A7E _ 52
        push    28                                      ; 0A7F _ 6A, 1C
        push    dword [ebp-14H]                         ; 0A81 _ FF. 75, EC
        push    dword [ebp+8H]                          ; 0A84 _ FF. 75, 08
        push    eax                                     ; 0A87 _ 50
        call    sheet_refresh                           ; 0A88 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A8D _ 83. C4, 20
        jmp     ?_013                                   ; 0A90 _ E9, FFFFFF22
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 0A95 _ 55
        mov     ebp, esp                                ; 0A96 _ 89. E5
        sub     esp, 72                                 ; 0A98 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0A9B _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0AA1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0AA6 _ 83. EC, 08
        push    ?_209                                   ; 0AA9 _ 68, 00000020(d)
        push    7                                       ; 0AAE _ 6A, 07
        push    160                                     ; 0AB0 _ 68, 000000A0
        push    0                                       ; 0AB5 _ 6A, 00
        push    edx                                     ; 0AB7 _ 52
        push    eax                                     ; 0AB8 _ 50
        call    showString                              ; 0AB9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ABE _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0AC1 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0AC8 _ C7. 45, E8, 00000000
        push    0                                       ; 0ACF _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 0AD1 _ 8D. 45, C4
        push    eax                                     ; 0AD4 _ 50
        push    8                                       ; 0AD5 _ 6A, 08
        lea     eax, [ebp-34H]                          ; 0AD7 _ 8D. 45, CC
        push    eax                                     ; 0ADA _ 50
        call    fifo8_init                              ; 0ADB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AE0 _ 83. C4, 10
        call    timer_alloc                             ; 0AE3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0AE8 _ 89. 45, EC
        sub     esp, 4                                  ; 0AEB _ 83. EC, 04
        push    123                                     ; 0AEE _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0AF0 _ 8D. 45, CC
        push    eax                                     ; 0AF3 _ 50
        push    dword [ebp-14H]                         ; 0AF4 _ FF. 75, EC
        call    timer_init                              ; 0AF7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AFC _ 83. C4, 10
        sub     esp, 8                                  ; 0AFF _ 83. EC, 08
        push    100                                     ; 0B02 _ 6A, 64
        push    dword [ebp-14H]                         ; 0B04 _ FF. 75, EC
        call    timer_settime                           ; 0B07 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B0C _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0B0F _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0B16 _ C7. 45, F0, 00000000
?_017:  inc     dword [ebp-0CH]                         ; 0B1D _ FF. 45, F4
        call    io_cli                                  ; 0B20 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0B25 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0B28 _ 8D. 45, CC
        push    eax                                     ; 0B2B _ 50
        call    fifo8_status                            ; 0B2C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B31 _ 83. C4, 10
        test    eax, eax                                ; 0B34 _ 85. C0
        jnz near      ?_018                                   ; 0b36 _ 75, 07
        call    io_sti                                  ; 0B38 _ E8, FFFFFFFC(rel)
        jmp     ?_017                                   ; 0B3D _ EB, DE

?_018:  sub     esp, 12                                 ; 0B3F _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0B42 _ 8D. 45, CC
        push    eax                                     ; 0B45 _ 50
        call    fifo8_get                               ; 0B46 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4B _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0B4E _ 89. 45, E8
        call    io_sti                                  ; 0B51 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0B56 _ 83. 7D, E8, 7B
        jnz near      ?_017                                   ; 0b5a _ 75, c1
        mov     edx, dword [sht_back]                   ; 0B5C _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0B62 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0B67 _ 83. EC, 08
        push    ?_210                                   ; 0B6A _ 68, 0000002D(d)
        push    7                                       ; 0B6F _ 6A, 07
        push    192                                     ; 0B71 _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0B76 _ FF. 75, F0
        push    edx                                     ; 0B79 _ 52
        push    eax                                     ; 0B7A _ 50
        call    showString                              ; 0B7B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B80 _ 83. C4, 20
        sub     esp, 8                                  ; 0B83 _ 83. EC, 08
        push    100                                     ; 0B86 _ 6A, 64
        push    dword [ebp-14H]                         ; 0B88 _ FF. 75, EC
        call    timer_settime                           ; 0B8B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B90 _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0B93 _ 83. 45, F0, 08
        jmp     ?_017                                   ; 0B97 _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0B99 _ 55
        mov     ebp, esp                                ; 0B9A _ 89. E5
        push    ebx                                     ; 0B9C _ 53
        sub     esp, 4                                  ; 0B9D _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0BA0 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0BA3 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0BA6 _ 8B. 45, 0C
        dec     eax                                     ; 0BA9 _ 48
        sub     esp, 4                                  ; 0BAA _ 83. EC, 04
        push    edx                                     ; 0BAD _ 52
        push    eax                                     ; 0BAE _ 50
        push    0                                       ; 0BAF _ 6A, 00
        push    0                                       ; 0BB1 _ 6A, 00
        push    14                                      ; 0BB3 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0BB5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BB8 _ FF. 75, 08
        call    boxfill8                                ; 0BBB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BC0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BC3 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0BC6 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0BC9 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BCC _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BCF _ 8B. 45, 10
        sub     eax, 28                                 ; 0BD2 _ 83. E8, 1C
        sub     esp, 4                                  ; 0BD5 _ 83. EC, 04
        push    ecx                                     ; 0BD8 _ 51
        push    edx                                     ; 0BD9 _ 52
        push    eax                                     ; 0BDA _ 50
        push    0                                       ; 0BDB _ 6A, 00
        push    8                                       ; 0BDD _ 6A, 08
        push    dword [ebp+0CH]                         ; 0BDF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BE2 _ FF. 75, 08
        call    boxfill8                                ; 0BE5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BEA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BED _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0BF0 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0BF3 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BF6 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BF9 _ 8B. 45, 10
        sub     eax, 27                                 ; 0BFC _ 83. E8, 1B
        sub     esp, 4                                  ; 0BFF _ 83. EC, 04
        push    ecx                                     ; 0C02 _ 51
        push    edx                                     ; 0C03 _ 52
        push    eax                                     ; 0C04 _ 50
        push    0                                       ; 0C05 _ 6A, 00
        push    7                                       ; 0C07 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0C09 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C0C _ FF. 75, 08
        call    boxfill8                                ; 0C0F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C14 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C17 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C1A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C1D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C20 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C23 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C26 _ 83. E8, 1A
        sub     esp, 4                                  ; 0C29 _ 83. EC, 04
        push    ecx                                     ; 0C2C _ 51
        push    edx                                     ; 0C2D _ 52
        push    eax                                     ; 0C2E _ 50
        push    0                                       ; 0C2F _ 6A, 00
        push    8                                       ; 0C31 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0C33 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C36 _ FF. 75, 08
        call    boxfill8                                ; 0C39 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C3E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C41 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C44 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0C47 _ 8B. 45, 10
        sub     eax, 24                                 ; 0C4A _ 83. E8, 18
        sub     esp, 4                                  ; 0C4D _ 83. EC, 04
        push    edx                                     ; 0C50 _ 52
        push    59                                      ; 0C51 _ 6A, 3B
        push    eax                                     ; 0C53 _ 50
        push    3                                       ; 0C54 _ 6A, 03
        push    7                                       ; 0C56 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0C58 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C5B _ FF. 75, 08
        call    boxfill8                                ; 0C5E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C63 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C66 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0C69 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0C6C _ 8B. 45, 10
        sub     eax, 24                                 ; 0C6F _ 83. E8, 18
        sub     esp, 4                                  ; 0C72 _ 83. EC, 04
        push    edx                                     ; 0C75 _ 52
        push    2                                       ; 0C76 _ 6A, 02
        push    eax                                     ; 0C78 _ 50
        push    2                                       ; 0C79 _ 6A, 02
        push    7                                       ; 0C7B _ 6A, 07
        push    dword [ebp+0CH]                         ; 0C7D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C80 _ FF. 75, 08
        call    boxfill8                                ; 0C83 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C88 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C8B _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0C8E _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0C91 _ 8B. 45, 10
        sub     eax, 4                                  ; 0C94 _ 83. E8, 04
        sub     esp, 4                                  ; 0C97 _ 83. EC, 04
        push    edx                                     ; 0C9A _ 52
        push    59                                      ; 0C9B _ 6A, 3B
        push    eax                                     ; 0C9D _ 50
        push    3                                       ; 0C9E _ 6A, 03
        push    15                                      ; 0CA0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0CA2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CA5 _ FF. 75, 08
        call    boxfill8                                ; 0CA8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CAD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CB0 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0CB3 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0CB6 _ 8B. 45, 10
        sub     eax, 23                                 ; 0CB9 _ 83. E8, 17
        sub     esp, 4                                  ; 0CBC _ 83. EC, 04
        push    edx                                     ; 0CBF _ 52
        push    59                                      ; 0CC0 _ 6A, 3B
        push    eax                                     ; 0CC2 _ 50
        push    59                                      ; 0CC3 _ 6A, 3B
        push    15                                      ; 0CC5 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0CC7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CCA _ FF. 75, 08
        call    boxfill8                                ; 0CCD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CD2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CD5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CD8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0CDB _ 8B. 45, 10
        sub     eax, 3                                  ; 0CDE _ 83. E8, 03
        sub     esp, 4                                  ; 0CE1 _ 83. EC, 04
        push    edx                                     ; 0CE4 _ 52
        push    59                                      ; 0CE5 _ 6A, 3B
        push    eax                                     ; 0CE7 _ 50
        push    2                                       ; 0CE8 _ 6A, 02
        push    0                                       ; 0CEA _ 6A, 00
        push    dword [ebp+0CH]                         ; 0CEC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CEF _ FF. 75, 08
        call    boxfill8                                ; 0CF2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CF7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CFA _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CFD _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D00 _ 8B. 45, 10
        sub     eax, 24                                 ; 0D03 _ 83. E8, 18
        sub     esp, 4                                  ; 0D06 _ 83. EC, 04
        push    edx                                     ; 0D09 _ 52
        push    60                                      ; 0D0A _ 6A, 3C
        push    eax                                     ; 0D0C _ 50
        push    60                                      ; 0D0D _ 6A, 3C
        push    0                                       ; 0D0F _ 6A, 00
        push    dword [ebp+0CH]                         ; 0D11 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D14 _ FF. 75, 08
        call    boxfill8                                ; 0D17 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D1C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0D1F _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0D22 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0D25 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0D28 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0D2B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0D2E _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0D31 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D34 _ 83. E8, 2F
        sub     esp, 4                                  ; 0D37 _ 83. EC, 04
        push    ebx                                     ; 0D3A _ 53
        push    ecx                                     ; 0D3B _ 51
        push    edx                                     ; 0D3C _ 52
        push    eax                                     ; 0D3D _ 50
        push    15                                      ; 0D3E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0D40 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D43 _ FF. 75, 08
        call    boxfill8                                ; 0D46 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D4B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0D4E _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0D51 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0D54 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0D57 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0D5A _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0D5D _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0D60 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D63 _ 83. E8, 2F
        sub     esp, 4                                  ; 0D66 _ 83. EC, 04
        push    ebx                                     ; 0D69 _ 53
        push    ecx                                     ; 0D6A _ 51
        push    edx                                     ; 0D6B _ 52
        push    eax                                     ; 0D6C _ 50
        push    15                                      ; 0D6D _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0D6F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D72 _ FF. 75, 08
        call    boxfill8                                ; 0D75 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D7A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0D7D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0D80 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0D83 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0D86 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0D89 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D8C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0D8F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D92 _ 83. E8, 2F
        sub     esp, 4                                  ; 0D95 _ 83. EC, 04
        push    ebx                                     ; 0D98 _ 53
        push    ecx                                     ; 0D99 _ 51
        push    edx                                     ; 0D9A _ 52
        push    eax                                     ; 0D9B _ 50
        push    7                                       ; 0D9C _ 6A, 07
        push    dword [ebp+0CH]                         ; 0D9E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DA1 _ FF. 75, 08
        call    boxfill8                                ; 0DA4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DA9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0DAC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0DAF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0DB2 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0DB5 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0DB8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0DBB _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0DBE _ 8B. 45, 0C
        sub     eax, 3                                  ; 0DC1 _ 83. E8, 03
        sub     esp, 4                                  ; 0DC4 _ 83. EC, 04
        push    ebx                                     ; 0DC7 _ 53
        push    ecx                                     ; 0DC8 _ 51
        push    edx                                     ; 0DC9 _ 52
        push    eax                                     ; 0DCA _ 50
        push    7                                       ; 0DCB _ 6A, 07
        push    dword [ebp+0CH]                         ; 0DCD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DD0 _ FF. 75, 08
        call    boxfill8                                ; 0DD3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DD8 _ 83. C4, 20
        nop                                             ; 0DDB _ 90
        mov     ebx, dword [ebp-4H]                     ; 0DDC _ 8B. 5D, FC
        leave                                           ; 0DDF _ C9
        ret                                             ; 0DE0 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0DE1 _ 55
        mov     ebp, esp                                ; 0DE2 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0DE4 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0DE7 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0DEA _ A1, 00000114(d)
        add     eax, edx                                ; 0DEF _ 01. D0
        mov     dword [mx], eax                         ; 0DF1 _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0DF6 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0DF9 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0DFC _ A1, 00000118(d)
        add     eax, edx                                ; 0E01 _ 01. D0
        mov     dword [my], eax                         ; 0E03 _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0E08 _ A1, 00000114(d)
        test    eax, eax                                ; 0E0D _ 85. C0
        jns     ?_019                                   ; 0E0F _ 79, 0A
        mov     dword [mx], 0                           ; 0E11 _ C7. 05, 00000114(d), 00000000
?_019:  mov     eax, dword [my]                         ; 0E1B _ A1, 00000118(d)
        test    eax, eax                                ; 0E20 _ 85. C0
        jns     ?_020                                   ; 0E22 _ 79, 0A
        mov     dword [my], 0                           ; 0E24 _ C7. 05, 00000118(d), 00000000
?_020:  mov     edx, dword [xsize]                      ; 0E2E _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0E34 _ A1, 00000114(d)
        cmp     edx, eax                                ; 0E39 _ 39. C2
        jg  near      ?_021                                   ; 0e3b _ 7f, 0b
        mov     eax, dword [xsize]                      ; 0E3D _ A1, 0000011C(d)
        dec     eax                                     ; 0E42 _ 48
        mov     dword [mx], eax                         ; 0E43 _ A3, 00000114(d)
?_021:  mov     edx, dword [ysize]                      ; 0E48 _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0E4E _ A1, 00000118(d)
        cmp     edx, eax                                ; 0E53 _ 39. C2
        jg  near      ?_022                                   ; 0e55 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 0E57 _ A1, 00000120(d)
        dec     eax                                     ; 0E5C _ 48
        mov     dword [my], eax                         ; 0E5D _ A3, 00000118(d)
?_022:  nop                                             ; 0E62 _ 90
        pop     ebp                                     ; 0E63 _ 5D
        ret                                             ; 0E64 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0E65 _ 55
        mov     ebp, esp                                ; 0E66 _ 89. E5
        sub     esp, 24                                 ; 0E68 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0E6B _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 0E70 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0E73 _ C6. 45, F3, 00
        call    io_sti                                  ; 0E77 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0E7C _ 83. EC, 0C
        push    mouseinfo                               ; 0E7F _ 68, 00000024(d)
        call    fifo8_get                               ; 0E84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E89 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0E8C _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0E8F _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0E93 _ 83. EC, 08
        push    eax                                     ; 0E96 _ 50
        push    mdec                                    ; 0E97 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0E9C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EA1 _ 83. C4, 10
        test    eax, eax                                ; 0EA4 _ 85. C0
        jz near       ?_023                                   ; 0ea6 _ 74, 60
        sub     esp, 4                                  ; 0EA8 _ 83. EC, 04
        push    mdec                                    ; 0EAB _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0EB0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EB3 _ FF. 75, 08
        call    computeMousePosition                    ; 0EB6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EBB _ 83. C4, 10
        mov     edx, dword [my]                         ; 0EBE _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0EC4 _ A1, 00000114(d)
        push    edx                                     ; 0EC9 _ 52
        push    eax                                     ; 0ECA _ 50
        push    dword [ebp+10H]                         ; 0ECB _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0ECE _ FF. 75, 08
        call    sheet_slide                             ; 0ED1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ED6 _ 83. C4, 10
        mov     eax, dword [?_220]                      ; 0ED9 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0EDE _ 83. E0, 01
        test    eax, eax                                ; 0EE1 _ 85. C0
        jz near       ?_023                                   ; 0ee3 _ 74, 23
        mov     eax, dword [my]                         ; 0EE5 _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 0EEA _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0EED _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 0EF2 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0EF5 _ A1, 00000240(d)
        push    ecx                                     ; 0EFA _ 51
        push    edx                                     ; 0EFB _ 52
        push    eax                                     ; 0EFC _ 50
        push    dword [ebp+8H]                          ; 0EFD _ FF. 75, 08
        call    sheet_slide                             ; 0F00 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F05 _ 83. C4, 10
?_023:  nop                                             ; 0F08 _ 90
        leave                                           ; 0F09 _ C9
        ret                                             ; 0F0A _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0F0B _ 55
        mov     ebp, esp                                ; 0F0C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0F0E _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0F11 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0F17 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0F1A _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0F20 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0F23 _ 66: C7. 40, 06, 01E0
        nop                                             ; 0F29 _ 90
        pop     ebp                                     ; 0F2A _ 5D
        ret                                             ; 0F2B _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0F2C _ 55
        mov     ebp, esp                                ; 0F2D _ 89. E5
        push    ebx                                     ; 0F2F _ 53
        sub     esp, 36                                 ; 0F30 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0F33 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0F36 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0F39 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0F3C _ 89. 45, F4
        jmp     ?_025                                   ; 0F3F _ EB, 3C

?_024:  mov     eax, dword [ebp+1CH]                    ; 0F41 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0F44 _ 8A. 00
        movzx   eax, al                                 ; 0F46 _ 0F B6. C0
        shl     eax, 4                                  ; 0F49 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0F4C _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0F52 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0F56 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0F59 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0F5C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0F5F _ 8B. 00
        sub     esp, 8                                  ; 0F61 _ 83. EC, 08
        push    ebx                                     ; 0F64 _ 53
        push    ecx                                     ; 0F65 _ 51
        push    dword [ebp+14H]                         ; 0F66 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0F69 _ FF. 75, 10
        push    edx                                     ; 0F6C _ 52
        push    eax                                     ; 0F6D _ 50
        call    showFont8                               ; 0F6E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F73 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0F76 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0F7A _ FF. 45, 1C
?_025:  mov     eax, dword [ebp+1CH]                    ; 0F7D _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0F80 _ 8A. 00
        test    al, al                                  ; 0F82 _ 84. C0
        jnz near      ?_024                                   ; 0f84 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 0F86 _ 8B. 45, 14
        add     eax, 16                                 ; 0F89 _ 83. C0, 10
        sub     esp, 8                                  ; 0F8C _ 83. EC, 08
        push    eax                                     ; 0F8F _ 50
        push    dword [ebp+10H]                         ; 0F90 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0F93 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0F96 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0F99 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F9C _ FF. 75, 08
        call    sheet_refresh                           ; 0F9F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA4 _ 83. C4, 20
        nop                                             ; 0FA7 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0FA8 _ 8B. 5D, FC
        leave                                           ; 0FAB _ C9
        ret                                             ; 0FAC _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0FAD _ 55
        mov     ebp, esp                                ; 0FAE _ 89. E5
        sub     esp, 8                                  ; 0FB0 _ 83. EC, 08
        sub     esp, 4                                  ; 0FB3 _ 83. EC, 04
        push    table_rgb.1942                          ; 0FB6 _ 68, 00000080(d)
        push    15                                      ; 0FBB _ 6A, 0F
        push    0                                       ; 0FBD _ 6A, 00
        call    set_palette                             ; 0FBF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FC4 _ 83. C4, 10
        nop                                             ; 0FC7 _ 90
        leave                                           ; 0FC8 _ C9
        ret                                             ; 0FC9 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0FCA _ 55
        mov     ebp, esp                                ; 0FCB _ 89. E5
        sub     esp, 24                                 ; 0FCD _ 83. EC, 18
        call    io_load_eflags                          ; 0FD0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0FD5 _ 89. 45, F0
        call    io_cli                                  ; 0FD8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0FDD _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0FE0 _ FF. 75, 08
        push    968                                     ; 0FE3 _ 68, 000003C8
        call    io_out8                                 ; 0FE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FED _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0FF0 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0FF3 _ 89. 45, F4
        jmp     ?_027                                   ; 0FF6 _ EB, 5F

?_026:  mov     eax, dword [ebp+10H]                    ; 0FF8 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0FFB _ 8A. 00
        shr     al, 2                                   ; 0FFD _ C0. E8, 02
        movzx   eax, al                                 ; 1000 _ 0F B6. C0
        sub     esp, 8                                  ; 1003 _ 83. EC, 08
        push    eax                                     ; 1006 _ 50
        push    969                                     ; 1007 _ 68, 000003C9
        call    io_out8                                 ; 100C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1011 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 1014 _ 8B. 45, 10
        inc     eax                                     ; 1017 _ 40
        mov     al, byte [eax]                          ; 1018 _ 8A. 00
        shr     al, 2                                   ; 101A _ C0. E8, 02
        movzx   eax, al                                 ; 101D _ 0F B6. C0
        sub     esp, 8                                  ; 1020 _ 83. EC, 08
        push    eax                                     ; 1023 _ 50
        push    969                                     ; 1024 _ 68, 000003C9
        call    io_out8                                 ; 1029 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 102E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 1031 _ 8B. 45, 10
        add     eax, 2                                  ; 1034 _ 83. C0, 02
        mov     al, byte [eax]                          ; 1037 _ 8A. 00
        shr     al, 2                                   ; 1039 _ C0. E8, 02
        movzx   eax, al                                 ; 103C _ 0F B6. C0
        sub     esp, 8                                  ; 103F _ 83. EC, 08
        push    eax                                     ; 1042 _ 50
        push    969                                     ; 1043 _ 68, 000003C9
        call    io_out8                                 ; 1048 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 104D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 1050 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 1054 _ FF. 45, F4
?_027:  mov     eax, dword [ebp-0CH]                    ; 1057 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 105A _ 3B. 45, 0C
        jle near      ?_026                                   ; 105d _ 7e, 99
        sub     esp, 12                                 ; 105F _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1062 _ FF. 75, F0
        call    io_store_eflags                         ; 1065 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 106A _ 83. C4, 10
        nop                                             ; 106D _ 90
        leave                                           ; 106E _ C9
        ret                                             ; 106F _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 1070 _ 55
        mov     ebp, esp                                ; 1071 _ 89. E5
        sub     esp, 20                                 ; 1073 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 1076 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 1079 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 107C _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 107F _ 89. 45, F8
        jmp     ?_031                                   ; 1082 _ EB, 30

?_028:  mov     eax, dword [ebp+14H]                    ; 1084 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 1087 _ 89. 45, FC
        jmp     ?_030                                   ; 108A _ EB, 1D

?_029:  mov     eax, dword [ebp-8H]                     ; 108C _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 108F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1093 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1095 _ 8B. 45, FC
        add     eax, edx                                ; 1098 _ 01. D0
        mov     edx, eax                                ; 109A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 109C _ 8B. 45, 08
        add     edx, eax                                ; 109F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10A1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10A4 _ 88. 02
        inc     dword [ebp-4H]                          ; 10A6 _ FF. 45, FC
?_030:  mov     eax, dword [ebp-4H]                     ; 10A9 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 10AC _ 3B. 45, 1C
        jle near      ?_029                                   ; 10af _ 7e, db
        inc     dword [ebp-8H]                          ; 10B1 _ FF. 45, F8
?_031:  mov     eax, dword [ebp-8H]                     ; 10B4 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 10B7 _ 3B. 45, 20
        jle near      ?_028                                   ; 10ba _ 7e, c8
        nop                                             ; 10BC _ 90
        nop                                             ; 10BD _ 90
        leave                                           ; 10BE _ C9
        ret                                             ; 10BF _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 10C0 _ 55
        mov     ebp, esp                                ; 10C1 _ 89. E5
        sub     esp, 20                                 ; 10C3 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 10C6 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 10C9 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 10CC _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 10D3 _ E9, 00000162

?_032:  mov     edx, dword [ebp-4H]                     ; 10D8 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 10DB _ 8B. 45, 1C
        add     eax, edx                                ; 10DE _ 01. D0
        mov     al, byte [eax]                          ; 10E0 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 10E2 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 10E5 _ 80. 7D, FB, 00
        jns     ?_033                                   ; 10E9 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 10EB _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10EE _ 8B. 45, FC
        add     eax, edx                                ; 10F1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10F3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10F7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10F9 _ 8B. 45, 10
        add     eax, edx                                ; 10FC _ 01. D0
        mov     edx, eax                                ; 10FE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1100 _ 8B. 45, 08
        add     edx, eax                                ; 1103 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1105 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1108 _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 110A _ 0F BE. 45, FB
        and     eax, 40H                                ; 110E _ 83. E0, 40
        test    eax, eax                                ; 1111 _ 85. C0
        jz near       ?_034                                   ; 1113 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1115 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1118 _ 8B. 45, FC
        add     eax, edx                                ; 111B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 111D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1121 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1123 _ 8B. 45, 10
        add     eax, edx                                ; 1126 _ 01. D0
        lea     edx, [eax+1H]                           ; 1128 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 112B _ 8B. 45, 08
        add     edx, eax                                ; 112E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1130 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1133 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 1135 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1139 _ 83. E0, 20
        test    eax, eax                                ; 113C _ 85. C0
        jz near       ?_035                                   ; 113e _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1140 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1143 _ 8B. 45, FC
        add     eax, edx                                ; 1146 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1148 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 114C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 114E _ 8B. 45, 10
        add     eax, edx                                ; 1151 _ 01. D0
        lea     edx, [eax+2H]                           ; 1153 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1156 _ 8B. 45, 08
        add     edx, eax                                ; 1159 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 115B _ 8A. 45, EC
        mov     byte [edx], al                          ; 115E _ 88. 02
?_035:  movsx   eax, byte [ebp-5H]                      ; 1160 _ 0F BE. 45, FB
        and     eax, 10H                                ; 1164 _ 83. E0, 10
        test    eax, eax                                ; 1167 _ 85. C0
        jz near       ?_036                                   ; 1169 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 116B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 116E _ 8B. 45, FC
        add     eax, edx                                ; 1171 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1173 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1177 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1179 _ 8B. 45, 10
        add     eax, edx                                ; 117C _ 01. D0
        lea     edx, [eax+3H]                           ; 117E _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1181 _ 8B. 45, 08
        add     edx, eax                                ; 1184 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1186 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1189 _ 88. 02
?_036:  movsx   eax, byte [ebp-5H]                      ; 118B _ 0F BE. 45, FB
        and     eax, 08H                                ; 118F _ 83. E0, 08
        test    eax, eax                                ; 1192 _ 85. C0
        jz near       ?_037                                   ; 1194 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1196 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1199 _ 8B. 45, FC
        add     eax, edx                                ; 119C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 119E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11A2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11A4 _ 8B. 45, 10
        add     eax, edx                                ; 11A7 _ 01. D0
        lea     edx, [eax+4H]                           ; 11A9 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 11AC _ 8B. 45, 08
        add     edx, eax                                ; 11AF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 11B1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 11B4 _ 88. 02
?_037:  movsx   eax, byte [ebp-5H]                      ; 11B6 _ 0F BE. 45, FB
        and     eax, 04H                                ; 11BA _ 83. E0, 04
        test    eax, eax                                ; 11BD _ 85. C0
        jz near       ?_038                                   ; 11bf _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 11C1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 11C4 _ 8B. 45, FC
        add     eax, edx                                ; 11C7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11C9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11CD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11CF _ 8B. 45, 10
        add     eax, edx                                ; 11D2 _ 01. D0
        lea     edx, [eax+5H]                           ; 11D4 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 11D7 _ 8B. 45, 08
        add     edx, eax                                ; 11DA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 11DC _ 8A. 45, EC
        mov     byte [edx], al                          ; 11DF _ 88. 02
?_038:  movsx   eax, byte [ebp-5H]                      ; 11E1 _ 0F BE. 45, FB
        and     eax, 02H                                ; 11E5 _ 83. E0, 02
        test    eax, eax                                ; 11E8 _ 85. C0
        jz near       ?_039                                   ; 11ea _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 11EC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 11EF _ 8B. 45, FC
        add     eax, edx                                ; 11F2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 11F4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 11F8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 11FA _ 8B. 45, 10
        add     eax, edx                                ; 11FD _ 01. D0
        lea     edx, [eax+6H]                           ; 11FF _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1202 _ 8B. 45, 08
        add     edx, eax                                ; 1205 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1207 _ 8A. 45, EC
        mov     byte [edx], al                          ; 120A _ 88. 02
?_039:  movsx   eax, byte [ebp-5H]                      ; 120C _ 0F BE. 45, FB
        and     eax, 01H                                ; 1210 _ 83. E0, 01
        test    eax, eax                                ; 1213 _ 85. C0
        jz near       ?_040                                   ; 1215 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1217 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 121A _ 8B. 45, FC
        add     eax, edx                                ; 121D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 121F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1223 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1225 _ 8B. 45, 10
        add     eax, edx                                ; 1228 _ 01. D0
        lea     edx, [eax+7H]                           ; 122A _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 122D _ 8B. 45, 08
        add     edx, eax                                ; 1230 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1232 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1235 _ 88. 02
?_040:  inc     dword [ebp-4H]                          ; 1237 _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 15                      ; 123A _ 83. 7D, FC, 0F
        jle near      ?_032                                   ; 123e _ 0f 8e, fffffe94
        nop                                             ; 1244 _ 90
        nop                                             ; 1245 _ 90
        leave                                           ; 1246 _ C9
        ret                                             ; 1247 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1248 _ 55
        mov     ebp, esp                                ; 1249 _ 89. E5
        sub     esp, 20                                 ; 124B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 124E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1251 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1254 _ C7. 45, F8, 00000000
        jmp     ?_048                                   ; 125B _ E9, 000000AB

?_042:  mov     dword [ebp-4H], 0                       ; 1260 _ C7. 45, FC, 00000000
        jmp     ?_047                                   ; 1267 _ E9, 00000092

?_043:  mov     eax, dword [ebp-8H]                     ; 126C _ 8B. 45, F8
        shl     eax, 4                                  ; 126F _ C1. E0, 04
        mov     edx, eax                                ; 1272 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1274 _ 8B. 45, FC
        add     eax, edx                                ; 1277 _ 01. D0
        add     eax, cursor.1989                        ; 1279 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 127E _ 8A. 00
        cmp     al, 42                                  ; 1280 _ 3C, 2A
        jnz near      ?_044                                   ; 1282 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1284 _ 8B. 45, F8
        shl     eax, 4                                  ; 1287 _ C1. E0, 04
        mov     edx, eax                                ; 128A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 128C _ 8B. 45, FC
        add     eax, edx                                ; 128F _ 01. D0
        mov     edx, eax                                ; 1291 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1293 _ 8B. 45, 08
        add     eax, edx                                ; 1296 _ 01. D0
        mov     byte [eax], 0                           ; 1298 _ C6. 00, 00
?_044:  mov     eax, dword [ebp-8H]                     ; 129B _ 8B. 45, F8
        shl     eax, 4                                  ; 129E _ C1. E0, 04
        mov     edx, eax                                ; 12A1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 12A3 _ 8B. 45, FC
        add     eax, edx                                ; 12A6 _ 01. D0
        add     eax, cursor.1989                        ; 12A8 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 12AD _ 8A. 00
        cmp     al, 79                                  ; 12AF _ 3C, 4F
        jnz near      ?_045                                   ; 12b1 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 12B3 _ 8B. 45, F8
        shl     eax, 4                                  ; 12B6 _ C1. E0, 04
        mov     edx, eax                                ; 12B9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 12BB _ 8B. 45, FC
        add     eax, edx                                ; 12BE _ 01. D0
        mov     edx, eax                                ; 12C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12C2 _ 8B. 45, 08
        add     eax, edx                                ; 12C5 _ 01. D0
        mov     byte [eax], 7                           ; 12C7 _ C6. 00, 07
?_045:  mov     eax, dword [ebp-8H]                     ; 12CA _ 8B. 45, F8
        shl     eax, 4                                  ; 12CD _ C1. E0, 04
        mov     edx, eax                                ; 12D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 12D2 _ 8B. 45, FC
        add     eax, edx                                ; 12D5 _ 01. D0
        add     eax, cursor.1989                        ; 12D7 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 12DC _ 8A. 00
        cmp     al, 46                                  ; 12DE _ 3C, 2E
        jnz near      ?_046                                   ; 12e0 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 12E2 _ 8B. 45, F8
        shl     eax, 4                                  ; 12E5 _ C1. E0, 04
        mov     edx, eax                                ; 12E8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 12EA _ 8B. 45, FC
        add     eax, edx                                ; 12ED _ 01. D0
        mov     edx, eax                                ; 12EF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12F1 _ 8B. 45, 08
        add     edx, eax                                ; 12F4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 12F6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 12F9 _ 88. 02
?_046:  inc     dword [ebp-4H]                          ; 12FB _ FF. 45, FC
?_047:  cmp     dword [ebp-4H], 15                      ; 12FE _ 83. 7D, FC, 0F
        jle near      ?_043                                   ; 1302 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 1308 _ FF. 45, F8
?_048:  cmp     dword [ebp-8H], 15                      ; 130B _ 83. 7D, F8, 0F
        jle near      ?_042                                   ; 130f _ 0f 8e, ffffff4b
        nop                                             ; 1315 _ 90
        nop                                             ; 1316 _ 90
        leave                                           ; 1317 _ C9
        ret                                             ; 1318 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1319 _ 55
        mov     ebp, esp                                ; 131A _ 89. E5
        push    ebx                                     ; 131C _ 53
        sub     esp, 16                                 ; 131D _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1320 _ C7. 45, F4, 00000000
        jmp     ?_052                                   ; 1327 _ EB, 4D

?_049:  mov     dword [ebp-8H], 0                       ; 1329 _ C7. 45, F8, 00000000
        jmp     ?_051                                   ; 1330 _ EB, 39

?_050:  mov     eax, dword [ebp-0CH]                    ; 1332 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1335 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1339 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 133B _ 8B. 45, F8
        add     eax, edx                                ; 133E _ 01. D0
        mov     edx, eax                                ; 1340 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 1342 _ 8B. 45, 20
        add     eax, edx                                ; 1345 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1347 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 134A _ 8B. 55, F4
        add     edx, ecx                                ; 134D _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 134F _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 1353 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1356 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1359 _ 01. D9
        add     edx, ecx                                ; 135B _ 01. CA
        mov     ecx, edx                                ; 135D _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 135F _ 8B. 55, 08
        add     edx, ecx                                ; 1362 _ 01. CA
        mov     al, byte [eax]                          ; 1364 _ 8A. 00
        mov     byte [edx], al                          ; 1366 _ 88. 02
        inc     dword [ebp-8H]                          ; 1368 _ FF. 45, F8
?_051:  mov     eax, dword [ebp-8H]                     ; 136B _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 136E _ 3B. 45, 10
        jl      ?_050                                   ; 1371 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 1373 _ FF. 45, F4
?_052:  mov     eax, dword [ebp-0CH]                    ; 1376 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1379 _ 3B. 45, 14
        jl      ?_049                                   ; 137C _ 7C, AB
        nop                                             ; 137E _ 90
        nop                                             ; 137F _ 90
        add     esp, 16                                 ; 1380 _ 83. C4, 10
        pop     ebx                                     ; 1383 _ 5B
        pop     ebp                                     ; 1384 _ 5D
        ret                                             ; 1385 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1386 _ 55
        mov     ebp, esp                                ; 1387 _ 89. E5
        sub     esp, 24                                 ; 1389 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 138C _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 1391 _ 89. 45, F4
        mov     eax, dword [?_217]                      ; 1394 _ A1, 00000004(d)
        cwde                                            ; 1399 _ 98
        mov     dword [ebp-10H], eax                    ; 139A _ 89. 45, F0
        mov     ax, word [?_218]                        ; 139D _ 66: A1, 00000006(d)
        cwde                                            ; 13A3 _ 98
        mov     dword [ebp-14H], eax                    ; 13A4 _ 89. 45, EC
        sub     esp, 8                                  ; 13A7 _ 83. EC, 08
        push    32                                      ; 13AA _ 6A, 20
        push    32                                      ; 13AC _ 6A, 20
        call    io_out8                                 ; 13AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13B3 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 13B6 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 13BA _ 83. EC, 0C
        push    96                                      ; 13BD _ 6A, 60
        call    io_in8                                  ; 13BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13C4 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 13C7 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 13CA _ 0F B6. 45, EB
        sub     esp, 8                                  ; 13CE _ 83. EC, 08
        push    eax                                     ; 13D1 _ 50
        push    keyinfo                                 ; 13D2 _ 68, 00000008(d)
        call    fifo8_put                               ; 13D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13DC _ 83. C4, 10
        nop                                             ; 13DF _ 90
        leave                                           ; 13E0 _ C9
        ret                                             ; 13E1 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 13E2 _ 55
        mov     ebp, esp                                ; 13E3 _ 89. E5
        sub     esp, 4                                  ; 13E5 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 13E8 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 13EB _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 13EE _ 80. 7D, FC, 09
        jle near      ?_053                                   ; 13f2 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 13F4 _ 8A. 45, FC
        add     eax, 55                                 ; 13F7 _ 83. C0, 37
        jmp     ?_054                                   ; 13FA _ EB, 06

?_053:  mov     al, byte [ebp-4H]                       ; 13FC _ 8A. 45, FC
        add     eax, 48                                 ; 13FF _ 83. C0, 30
?_054:  leave                                           ; 1402 _ C9
        ret                                             ; 1403 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1404 _ 55
        mov     ebp, esp                                ; 1405 _ 89. E5
        sub     esp, 20                                 ; 1407 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 140A _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 140D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1410 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1417 _ 8A. 45, EC
        and     eax, 0FH                                ; 141A _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 141D _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1420 _ 0F BE. 45, FB
        push    eax                                     ; 1424 _ 50
        call    charToHexVal                            ; 1425 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 142A _ 83. C4, 04
        mov     byte [?_216], al                        ; 142D _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 1432 _ 8A. 45, EC
        shr     al, 4                                   ; 1435 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1438 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 143B _ 8A. 45, EC
        movsx   eax, al                                 ; 143E _ 0F BE. C0
        push    eax                                     ; 1441 _ 50
        call    charToHexVal                            ; 1442 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1447 _ 83. C4, 04
        mov     byte [?_215], al                        ; 144A _ A2, 00000076(d)
        mov     eax, keyval                             ; 144F _ B8, 00000074(d)
        leave                                           ; 1454 _ C9
        ret                                             ; 1455 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1456 _ 55
        mov     ebp, esp                                ; 1457 _ 89. E5
        sub     esp, 16                                 ; 1459 _ 83. EC, 10
        mov     byte [str.2037], 48                     ; 145C _ C6. 05, 00000354(d), 30
        mov     byte [?_221], 88                        ; 1463 _ C6. 05, 00000355(d), 58
        mov     byte [?_222], 0                         ; 146A _ C6. 05, 0000035E(d), 00
        mov     dword [ebp-4H], 2                       ; 1471 _ C7. 45, FC, 00000002
        jmp     ?_056                                   ; 1478 _ EB, 0E

?_055:  mov     eax, dword [ebp-4H]                     ; 147A _ 8B. 45, FC
        add     eax, str.2037                           ; 147D _ 05, 00000354(d)
        mov     byte [eax], 48                          ; 1482 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1485 _ FF. 45, FC
?_056:  cmp     dword [ebp-4H], 9                       ; 1488 _ 83. 7D, FC, 09
        jle near      ?_055                                   ; 148c _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 148E _ C7. 45, F8, 00000009
        jmp     ?_060                                   ; 1495 _ EB, 41

?_057:  mov     eax, dword [ebp+8H]                     ; 1497 _ 8B. 45, 08
        and     eax, 0FH                                ; 149A _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 149D _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 14A0 _ 8B. 45, 08
        shr     eax, 4                                  ; 14A3 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 14A6 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 14A9 _ 83. 7D, F4, 09
        jle near      ?_058                                   ; 14ad _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 14AF _ 8B. 45, F4
        add     eax, 55                                 ; 14B2 _ 83. C0, 37
        mov     dl, al                                  ; 14B5 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 14B7 _ 8B. 45, F8
        add     eax, str.2037                           ; 14BA _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 14BF _ 88. 10
        jmp     ?_059                                   ; 14C1 _ EB, 12

?_058:  mov     eax, dword [ebp-0CH]                    ; 14C3 _ 8B. 45, F4
        add     eax, 48                                 ; 14C6 _ 83. C0, 30
        mov     dl, al                                  ; 14C9 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 14CB _ 8B. 45, F8
        add     eax, str.2037                           ; 14CE _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 14D3 _ 88. 10
?_059:  dec     dword [ebp-8H]                          ; 14D5 _ FF. 4D, F8
?_060:  cmp     dword [ebp-8H], 1                       ; 14D8 _ 83. 7D, F8, 01
        jle near      ?_061                                   ; 14dc _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 14DE _ 83. 7D, 08, 00
        jnz near      ?_057                                   ; 14e2 _ 75, b3
?_061:  mov     eax, str.2037                           ; 14E4 _ B8, 00000354(d)
        leave                                           ; 14E9 _ C9
        ret                                             ; 14EA _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 14EB _ 55
        mov     ebp, esp                                ; 14EC _ 89. E5
        sub     esp, 8                                  ; 14EE _ 83. EC, 08
?_062:  sub     esp, 12                                 ; 14F1 _ 83. EC, 0C
        push    100                                     ; 14F4 _ 6A, 64
        call    io_in8                                  ; 14F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14FB _ 83. C4, 10
        and     eax, 02H                                ; 14FE _ 83. E0, 02
        test    eax, eax                                ; 1501 _ 85. C0
        jz near       ?_063                                   ; 1503 _ 74, 02
        jmp     ?_062                                   ; 1505 _ EB, EA

?_063:  nop                                             ; 1507 _ 90
        nop                                             ; 1508 _ 90
        leave                                           ; 1509 _ C9
        ret                                             ; 150A _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 150B _ 55
        mov     ebp, esp                                ; 150C _ 89. E5
        sub     esp, 8                                  ; 150E _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1511 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1516 _ 83. EC, 08
        push    96                                      ; 1519 _ 6A, 60
        push    100                                     ; 151B _ 6A, 64
        call    io_out8                                 ; 151D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1522 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1525 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 152A _ 83. EC, 08
        push    71                                      ; 152D _ 6A, 47
        push    96                                      ; 152F _ 6A, 60
        call    io_out8                                 ; 1531 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1536 _ 83. C4, 10
        nop                                             ; 1539 _ 90
        leave                                           ; 153A _ C9
        ret                                             ; 153B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 153C _ 55
        mov     ebp, esp                                ; 153D _ 89. E5
        sub     esp, 8                                  ; 153F _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1542 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1547 _ 83. EC, 08
        push    212                                     ; 154A _ 68, 000000D4
        push    100                                     ; 154F _ 6A, 64
        call    io_out8                                 ; 1551 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1556 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1559 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 155E _ 83. EC, 08
        push    244                                     ; 1561 _ 68, 000000F4
        push    96                                      ; 1566 _ 6A, 60
        call    io_out8                                 ; 1568 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 156D _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1570 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 1573 _ C6. 40, 03, 00
        nop                                             ; 1577 _ 90
        leave                                           ; 1578 _ C9
        ret                                             ; 1579 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 157A _ 55
        mov     ebp, esp                                ; 157B _ 89. E5
        sub     esp, 24                                 ; 157D _ 83. EC, 18
        sub     esp, 8                                  ; 1580 _ 83. EC, 08
        push    32                                      ; 1583 _ 6A, 20
        push    160                                     ; 1585 _ 68, 000000A0
        call    io_out8                                 ; 158A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 158F _ 83. C4, 10
        sub     esp, 8                                  ; 1592 _ 83. EC, 08
        push    32                                      ; 1595 _ 6A, 20
        push    32                                      ; 1597 _ 6A, 20
        call    io_out8                                 ; 1599 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 159E _ 83. C4, 10
        sub     esp, 12                                 ; 15A1 _ 83. EC, 0C
        push    96                                      ; 15A4 _ 6A, 60
        call    io_in8                                  ; 15A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15AB _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 15AE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 15B1 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 15B5 _ 83. EC, 08
        push    eax                                     ; 15B8 _ 50
        push    mouseinfo                               ; 15B9 _ 68, 00000024(d)
        call    fifo8_put                               ; 15BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15C3 _ 83. C4, 10
        nop                                             ; 15C6 _ 90
        leave                                           ; 15C7 _ C9
        ret                                             ; 15C8 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 15C9 _ 55
        mov     ebp, esp                                ; 15CA _ 89. E5
        sub     esp, 4                                  ; 15CC _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 15CF _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 15D2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 15D5 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 15D8 _ 8A. 40, 03
        test    al, al                                  ; 15DB _ 84. C0
        jnz near      ?_065                                   ; 15dd _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 15DF _ 80. 7D, FC, FA
        jnz near      ?_064                                   ; 15e3 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 15E5 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 15E8 _ C6. 40, 03, 01
?_064:  mov     eax, 0                                  ; 15EC _ B8, 00000000
        jmp     ?_072                                   ; 15F1 _ E9, 00000104

?_065:  mov     eax, dword [ebp+8H]                     ; 15F6 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 15F9 _ 8A. 40, 03
        cmp     al, 1                                   ; 15FC _ 3C, 01
        jnz near      ?_067                                   ; 15fe _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 1600 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1604 _ 25, 000000C8
        cmp     eax, 8                                  ; 1609 _ 83. F8, 08
        jnz near      ?_066                                   ; 160c _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 160E _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1611 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 1614 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1616 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1619 _ C6. 40, 03, 02
?_066:  mov     eax, 0                                  ; 161D _ B8, 00000000
        jmp     ?_072                                   ; 1622 _ E9, 000000D3

?_067:  mov     eax, dword [ebp+8H]                     ; 1627 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 162A _ 8A. 40, 03
        cmp     al, 2                                   ; 162D _ 3C, 02
        jnz near      ?_068                                   ; 162f _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 1631 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1634 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1637 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 163A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 163D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1641 _ B8, 00000000
        jmp     ?_072                                   ; 1646 _ E9, 000000AF

?_068:  mov     eax, dword [ebp+8H]                     ; 164B _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 164E _ 8A. 40, 03
        cmp     al, 3                                   ; 1651 _ 3C, 03
        jne near      ?_071                                   ; 1653 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 1659 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 165C _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 165F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1662 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1665 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1669 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 166C _ 8A. 00
        movzx   eax, al                                 ; 166E _ 0F B6. C0
        and     eax, 07H                                ; 1671 _ 83. E0, 07
        mov     edx, eax                                ; 1674 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1676 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1679 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 167C _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 167F _ 8A. 40, 01
        movzx   edx, al                                 ; 1682 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1685 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1688 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 168B _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 168E _ 8A. 40, 02
        movzx   edx, al                                 ; 1691 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1694 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1697 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 169A _ 8B. 45, 08
        mov     al, byte [eax]                          ; 169D _ 8A. 00
        movzx   eax, al                                 ; 169F _ 0F B6. C0
        and     eax, 10H                                ; 16A2 _ 83. E0, 10
        test    eax, eax                                ; 16A5 _ 85. C0
        jz near       ?_069                                   ; 16a7 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 16A9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 16AC _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 16AF _ 0D, FFFFFF00
        mov     edx, eax                                ; 16B4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16B6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 16B9 _ 89. 50, 04
?_069:  mov     eax, dword [ebp+8H]                     ; 16BC _ 8B. 45, 08
        mov     al, byte [eax]                          ; 16BF _ 8A. 00
        movzx   eax, al                                 ; 16C1 _ 0F B6. C0
        and     eax, 20H                                ; 16C4 _ 83. E0, 20
        test    eax, eax                                ; 16C7 _ 85. C0
        jz near       ?_070                                   ; 16c9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 16CB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 16CE _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 16D1 _ 0D, FFFFFF00
        mov     edx, eax                                ; 16D6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16D8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 16DB _ 89. 50, 08
?_070:  mov     eax, dword [ebp+8H]                     ; 16DE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 16E1 _ 8B. 40, 08
        neg     eax                                     ; 16E4 _ F7. D8
        mov     edx, eax                                ; 16E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 16E8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 16EB _ 89. 50, 08
        mov     eax, 1                                  ; 16EE _ B8, 00000001
        jmp     ?_072                                   ; 16F3 _ EB, 05

?_071:  mov     eax, 4294967295                         ; 16F5 _ B8, FFFFFFFF
?_072:  leave                                           ; 16FA _ C9
        ret                                             ; 16FB _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 16FC _ 55
        mov     ebp, esp                                ; 16FD _ 89. E5
        sub     esp, 40                                 ; 16FF _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 1702 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1709 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1710 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1717 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 171E _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 1724 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1727 _ 8B. 00
        sub     esp, 4                                  ; 1729 _ 83. EC, 04
        push    edx                                     ; 172C _ 52
        push    dword [ebp+1CH]                         ; 172D _ FF. 75, 1C
        push    eax                                     ; 1730 _ 50
        call    init_screen8                            ; 1731 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1736 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1739 _ 8B. 45, 20
        movsx   eax, al                                 ; 173C _ 0F BE. C0
        sub     esp, 8                                  ; 173F _ 83. EC, 08
        push    ?_211                                   ; 1742 _ 68, 0000002F(d)
        push    eax                                     ; 1747 _ 50
        push    dword [ebp-10H]                         ; 1748 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 174B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 174E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1751 _ FF. 75, 08
        call    showString                              ; 1754 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1759 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 175C _ 8B. 45, 18
        sub     esp, 12                                 ; 175F _ 83. EC, 0C
        push    eax                                     ; 1762 _ 50
        call    intToHexStr                             ; 1763 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1768 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 176B _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 176E _ 8B. 45, 20
        movsx   eax, al                                 ; 1771 _ 0F BE. C0
        sub     esp, 8                                  ; 1774 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1777 _ FF. 75, E4
        push    eax                                     ; 177A _ 50
        push    dword [ebp-10H]                         ; 177B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 177E _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1781 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1784 _ FF. 75, 08
        call    showString                              ; 1787 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 178C _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 178F _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1793 _ 8B. 45, 20
        movsx   eax, al                                 ; 1796 _ 0F BE. C0
        sub     esp, 8                                  ; 1799 _ 83. EC, 08
        push    ?_212                                   ; 179C _ 68, 00000039(d)
        push    eax                                     ; 17A1 _ 50
        push    dword [ebp-10H]                         ; 17A2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 17A5 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 17A8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17AB _ FF. 75, 08
        call    showString                              ; 17AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17B3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 17B6 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 17B9 _ 8B. 00
        sub     esp, 12                                 ; 17BB _ 83. EC, 0C
        push    eax                                     ; 17BE _ 50
        call    intToHexStr                             ; 17BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17C4 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 17C7 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 17CA _ 8B. 45, 20
        movsx   eax, al                                 ; 17CD _ 0F BE. C0
        sub     esp, 8                                  ; 17D0 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 17D3 _ FF. 75, E0
        push    eax                                     ; 17D6 _ 50
        push    dword [ebp-10H]                         ; 17D7 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 17DA _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 17DD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17E0 _ FF. 75, 08
        call    showString                              ; 17E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17E8 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 17EB _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 17EF _ 8B. 45, 20
        movsx   eax, al                                 ; 17F2 _ 0F BE. C0
        sub     esp, 8                                  ; 17F5 _ 83. EC, 08
        push    ?_213                                   ; 17F8 _ 68, 00000045(d)
        push    eax                                     ; 17FD _ 50
        push    dword [ebp-10H]                         ; 17FE _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1801 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1804 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1807 _ FF. 75, 08
        call    showString                              ; 180A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 180F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1812 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1815 _ 8B. 40, 04
        sub     esp, 12                                 ; 1818 _ 83. EC, 0C
        push    eax                                     ; 181B _ 50
        call    intToHexStr                             ; 181C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1821 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1824 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1827 _ 8B. 45, 20
        movsx   eax, al                                 ; 182A _ 0F BE. C0
        sub     esp, 8                                  ; 182D _ 83. EC, 08
        push    dword [ebp-24H]                         ; 1830 _ FF. 75, DC
        push    eax                                     ; 1833 _ 50
        push    dword [ebp-10H]                         ; 1834 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1837 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 183A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 183D _ FF. 75, 08
        call    showString                              ; 1840 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1845 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1848 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 184C _ 8B. 45, 20
        movsx   eax, al                                 ; 184F _ 0F BE. C0
        sub     esp, 8                                  ; 1852 _ 83. EC, 08
        push    ?_214                                   ; 1855 _ 68, 00000051(d)
        push    eax                                     ; 185A _ 50
        push    dword [ebp-10H]                         ; 185B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 185E _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1861 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1864 _ FF. 75, 08
        call    showString                              ; 1867 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 186C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 186F _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1872 _ 8B. 40, 08
        sub     esp, 12                                 ; 1875 _ 83. EC, 0C
        push    eax                                     ; 1878 _ 50
        call    intToHexStr                             ; 1879 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 187E _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1881 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1884 _ 8B. 45, 20
        movsx   eax, al                                 ; 1887 _ 0F BE. C0
        sub     esp, 8                                  ; 188A _ 83. EC, 08
        push    dword [ebp-28H]                         ; 188D _ FF. 75, D8
        push    eax                                     ; 1890 _ 50
        push    dword [ebp-10H]                         ; 1891 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1894 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1897 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 189A _ FF. 75, 08
        call    showString                              ; 189D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18A2 _ 83. C4, 20
        nop                                             ; 18A5 _ 90
        leave                                           ; 18A6 _ C9
        ret                                             ; 18A7 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 18A8 _ 55
        mov     ebp, esp                                ; 18A9 _ 89. E5
        sub     esp, 24                                 ; 18AB _ 83. EC, 18
        sub     esp, 12                                 ; 18AE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 18B1 _ FF. 75, 08
        call    sheet_alloc                             ; 18B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B9 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 18BC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 18BF _ A1, 00000000(d)
        sub     esp, 8                                  ; 18C4 _ 83. EC, 08
        push    10880                                   ; 18C7 _ 68, 00002A80
        push    eax                                     ; 18CC _ 50
        call    memman_alloc_4k                         ; 18CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18D2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 18D5 _ 89. 45, F0
        sub     esp, 12                                 ; 18D8 _ 83. EC, 0C
        push    -1                                      ; 18DB _ 6A, FF
        push    68                                      ; 18DD _ 6A, 44
        push    160                                     ; 18DF _ 68, 000000A0
        push    dword [ebp-10H]                         ; 18E4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 18E7 _ FF. 75, F4
        call    sheet_setbuf                            ; 18EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18EF _ 83. C4, 20
        push    1                                       ; 18F2 _ 6A, 01
        push    dword [ebp+0CH]                         ; 18F4 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 18F7 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 18FA _ FF. 75, 08
        call    make_window8                            ; 18FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1902 _ 83. C4, 10
        sub     esp, 8                                  ; 1905 _ 83. EC, 08
        push    7                                       ; 1908 _ 6A, 07
        push    16                                      ; 190A _ 6A, 10
        push    144                                     ; 190C _ 68, 00000090
        push    28                                      ; 1911 _ 6A, 1C
        push    8                                       ; 1913 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1915 _ FF. 75, F4
        call    make_textbox8                           ; 1918 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 191D _ 83. C4, 20
        push    172                                     ; 1920 _ 68, 000000AC
        push    260                                     ; 1925 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 192A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 192D _ FF. 75, 08
        call    sheet_slide                             ; 1930 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1935 _ 83. C4, 10
        sub     esp, 4                                  ; 1938 _ 83. EC, 04
        push    2                                       ; 193B _ 6A, 02
        push    dword [ebp-0CH]                         ; 193D _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1940 _ FF. 75, 08
        call    sheet_updown                            ; 1943 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1948 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 194B _ 8B. 45, F4
        leave                                           ; 194E _ C9
        ret                                             ; 194F _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1950 _ 55
        mov     ebp, esp                                ; 1951 _ 89. E5
        push    ebx                                     ; 1953 _ 53
        sub     esp, 36                                 ; 1954 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1957 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 195A _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 195D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1960 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1963 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1966 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1969 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 196C _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 196F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1972 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1975 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1978 _ 8B. 00
        push    0                                       ; 197A _ 6A, 00
        push    edx                                     ; 197C _ 52
        push    0                                       ; 197D _ 6A, 00
        push    0                                       ; 197F _ 6A, 00
        push    8                                       ; 1981 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1983 _ FF. 75, F4
        push    eax                                     ; 1986 _ 50
        call    boxfill8                                ; 1987 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 198C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 198F _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1992 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1995 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1998 _ 8B. 00
        push    1                                       ; 199A _ 6A, 01
        push    edx                                     ; 199C _ 52
        push    1                                       ; 199D _ 6A, 01
        push    1                                       ; 199F _ 6A, 01
        push    7                                       ; 19A1 _ 6A, 07
        push    dword [ebp-0CH]                         ; 19A3 _ FF. 75, F4
        push    eax                                     ; 19A6 _ 50
        call    boxfill8                                ; 19A7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19AC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19AF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 19B2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19B5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19B8 _ 8B. 00
        push    edx                                     ; 19BA _ 52
        push    0                                       ; 19BB _ 6A, 00
        push    0                                       ; 19BD _ 6A, 00
        push    0                                       ; 19BF _ 6A, 00
        push    8                                       ; 19C1 _ 6A, 08
        push    dword [ebp-0CH]                         ; 19C3 _ FF. 75, F4
        push    eax                                     ; 19C6 _ 50
        call    boxfill8                                ; 19C7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19CC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19CF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 19D2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19D5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19D8 _ 8B. 00
        push    edx                                     ; 19DA _ 52
        push    1                                       ; 19DB _ 6A, 01
        push    1                                       ; 19DD _ 6A, 01
        push    1                                       ; 19DF _ 6A, 01
        push    7                                       ; 19E1 _ 6A, 07
        push    dword [ebp-0CH]                         ; 19E3 _ FF. 75, F4
        push    eax                                     ; 19E6 _ 50
        call    boxfill8                                ; 19E7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19EC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 19EF _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 19F2 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 19F5 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 19F8 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 19FB _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 19FE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1A01 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A04 _ 8B. 00
        push    ebx                                     ; 1A06 _ 53
        push    ecx                                     ; 1A07 _ 51
        push    1                                       ; 1A08 _ 6A, 01
        push    edx                                     ; 1A0A _ 52
        push    15                                      ; 1A0B _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1A0D _ FF. 75, F4
        push    eax                                     ; 1A10 _ 50
        call    boxfill8                                ; 1A11 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A16 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A19 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1A1C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1A1F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1A22 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1A25 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A28 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A2B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A2E _ 8B. 00
        push    ebx                                     ; 1A30 _ 53
        push    ecx                                     ; 1A31 _ 51
        push    0                                       ; 1A32 _ 6A, 00
        push    edx                                     ; 1A34 _ 52
        push    0                                       ; 1A35 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1A37 _ FF. 75, F4
        push    eax                                     ; 1A3A _ 50
        call    boxfill8                                ; 1A3B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A40 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A43 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1A46 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1A49 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1A4C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1A4F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A52 _ 8B. 00
        push    ecx                                     ; 1A54 _ 51
        push    edx                                     ; 1A55 _ 52
        push    2                                       ; 1A56 _ 6A, 02
        push    2                                       ; 1A58 _ 6A, 02
        push    8                                       ; 1A5A _ 6A, 08
        push    dword [ebp-0CH]                         ; 1A5C _ FF. 75, F4
        push    eax                                     ; 1A5F _ 50
        call    boxfill8                                ; 1A60 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A65 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1A68 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1A6B _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1A6E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A71 _ 8B. 00
        push    20                                      ; 1A73 _ 6A, 14
        push    edx                                     ; 1A75 _ 52
        push    3                                       ; 1A76 _ 6A, 03
        push    3                                       ; 1A78 _ 6A, 03
        push    12                                      ; 1A7A _ 6A, 0C
        push    dword [ebp-0CH]                         ; 1A7C _ FF. 75, F4
        push    eax                                     ; 1A7F _ 50
        call    boxfill8                                ; 1A80 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A85 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1A88 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1A8B _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1A8E _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1A91 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1A94 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1A97 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1A9A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A9D _ 8B. 00
        push    ebx                                     ; 1A9F _ 53
        push    ecx                                     ; 1AA0 _ 51
        push    edx                                     ; 1AA1 _ 52
        push    1                                       ; 1AA2 _ 6A, 01
        push    15                                      ; 1AA4 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1AA6 _ FF. 75, F4
        push    eax                                     ; 1AA9 _ 50
        call    boxfill8                                ; 1AAA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AAF _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1AB2 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1AB5 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1AB8 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1ABB _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1ABE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AC1 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AC4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AC7 _ 8B. 00
        push    ebx                                     ; 1AC9 _ 53
        push    ecx                                     ; 1ACA _ 51
        push    edx                                     ; 1ACB _ 52
        push    0                                       ; 1ACC _ 6A, 00
        push    0                                       ; 1ACE _ 6A, 00
        push    dword [ebp-0CH]                         ; 1AD0 _ FF. 75, F4
        push    eax                                     ; 1AD3 _ 50
        call    boxfill8                                ; 1AD4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AD9 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 1ADC _ 0F BE. 45, E4
        push    eax                                     ; 1AE0 _ 50
        push    dword [ebp+10H]                         ; 1AE1 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1AE4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AE7 _ FF. 75, 08
        call    make_wtitle8                            ; 1AEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AEF _ 83. C4, 10
        nop                                             ; 1AF2 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1AF3 _ 8B. 5D, FC
        leave                                           ; 1AF6 _ C9
        ret                                             ; 1AF7 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 1AF8 _ 55
        mov     ebp, esp                                ; 1AF9 _ 89. E5
        push    ebx                                     ; 1AFB _ 53
        sub     esp, 36                                 ; 1AFC _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1AFF _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1B02 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1B05 _ 80. 7D, E4, 00
        jz near       ?_073                                   ; 1b09 _ 74, 0a
        mov     byte [ebp-12H], 7                       ; 1B0B _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1B0F _ C6. 45, ED, 0C
        jmp     ?_074                                   ; 1B13 _ EB, 08

?_073:  mov     byte [ebp-12H], 8                       ; 1B15 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1B19 _ C6. 45, ED, 0F
?_074:  mov     eax, dword [ebp+0CH]                    ; 1B1D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B20 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1B23 _ 8D. 58, FC
        mov     al, byte [ebp-13H]                      ; 1B26 _ 8A. 45, ED
        movzx   ecx, al                                 ; 1B29 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1B2C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1B2F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1B32 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B35 _ 8B. 00
        push    20                                      ; 1B37 _ 6A, 14
        push    ebx                                     ; 1B39 _ 53
        push    3                                       ; 1B3A _ 6A, 03
        push    3                                       ; 1B3C _ 6A, 03
        push    ecx                                     ; 1B3E _ 51
        push    edx                                     ; 1B3F _ 52
        push    eax                                     ; 1B40 _ 50
        call    boxfill8                                ; 1B41 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B46 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 1B49 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 1B4D _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1B50 _ FF. 75, 10
        push    eax                                     ; 1B53 _ 50
        push    4                                       ; 1B54 _ 6A, 04
        push    24                                      ; 1B56 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1B58 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B5B _ FF. 75, 08
        call    showString                              ; 1B5E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B63 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1B66 _ C7. 45, F0, 00000000
        jmp     ?_082                                   ; 1B6D _ EB, 7F

?_075:  mov     dword [ebp-0CH], 0                      ; 1B6F _ C7. 45, F4, 00000000
        jmp     ?_081                                   ; 1B76 _ EB, 6D

?_076:  mov     eax, dword [ebp-10H]                    ; 1B78 _ 8B. 45, F0
        shl     eax, 4                                  ; 1B7B _ C1. E0, 04
        mov     edx, eax                                ; 1B7E _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1B80 _ 8B. 45, F4
        add     eax, edx                                ; 1B83 _ 01. D0
        add     eax, closebtn.2108                      ; 1B85 _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1B8A _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1B8C _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1B8F _ 80. 7D, EF, 40
        jnz near      ?_077                                   ; 1b93 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1B95 _ C6. 45, EF, 00
        jmp     ?_080                                   ; 1B99 _ EB, 1C

?_077:  cmp     byte [ebp-11H], 36                      ; 1B9B _ 80. 7D, EF, 24
        jnz near      ?_078                                   ; 1b9f _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1BA1 _ C6. 45, EF, 0F
        jmp     ?_080                                   ; 1BA5 _ EB, 10

?_078:  cmp     byte [ebp-11H], 81                      ; 1BA7 _ 80. 7D, EF, 51
        jnz near      ?_079                                   ; 1bab _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1BAD _ C6. 45, EF, 08
        jmp     ?_080                                   ; 1BB1 _ EB, 04

?_079:  mov     byte [ebp-11H], 7                       ; 1BB3 _ C6. 45, EF, 07
?_080:  mov     eax, dword [ebp+0CH]                    ; 1BB7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1BBA _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1BBC _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1BBF _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1BC2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BC5 _ 8B. 40, 04
        imul    ecx, eax                                ; 1BC8 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1BCB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BCE _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1BD1 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1BD4 _ 8B. 45, F4
        add     eax, ebx                                ; 1BD7 _ 01. D8
        add     eax, ecx                                ; 1BD9 _ 01. C8
        add     edx, eax                                ; 1BDB _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1BDD _ 8A. 45, EF
        mov     byte [edx], al                          ; 1BE0 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1BE2 _ FF. 45, F4
?_081:  cmp     dword [ebp-0CH], 15                     ; 1BE5 _ 83. 7D, F4, 0F
        jle near      ?_076                                   ; 1be9 _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1BEB _ FF. 45, F0
?_082:  cmp     dword [ebp-10H], 13                     ; 1BEE _ 83. 7D, F0, 0D
        jle near      ?_075                                   ; 1bf2 _ 0f 8e, ffffff77
        nop                                             ; 1BF8 _ 90
        nop                                             ; 1BF9 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1BFA _ 8B. 5D, FC
        leave                                           ; 1BFD _ C9
        ret                                             ; 1BFE _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1BFF _ 55
        mov     ebp, esp                                ; 1C00 _ 89. E5
        push    edi                                     ; 1C02 _ 57
        push    esi                                     ; 1C03 _ 56
        push    ebx                                     ; 1C04 _ 53
        sub     esp, 16                                 ; 1C05 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1C08 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1C0B _ 8B. 45, 14
        add     eax, edx                                ; 1C0E _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1C10 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1C13 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1C16 _ 8B. 45, 18
        add     eax, edx                                ; 1C19 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1C1B _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1C1E _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1C21 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1C24 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C27 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1C2A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1C2D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1C30 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1C33 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1C36 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C39 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C3C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C3F _ 8B. 00
        push    edi                                     ; 1C41 _ 57
        push    esi                                     ; 1C42 _ 56
        push    ebx                                     ; 1C43 _ 53
        push    ecx                                     ; 1C44 _ 51
        push    15                                      ; 1C45 _ 6A, 0F
        push    edx                                     ; 1C47 _ 52
        push    eax                                     ; 1C48 _ 50
        call    boxfill8                                ; 1C49 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C4E _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1C51 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1C54 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1C57 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1C5A _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1C5D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1C60 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1C63 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1C66 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1C69 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C6C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C6F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C72 _ 8B. 00
        push    edi                                     ; 1C74 _ 57
        push    esi                                     ; 1C75 _ 56
        push    ebx                                     ; 1C76 _ 53
        push    ecx                                     ; 1C77 _ 51
        push    15                                      ; 1C78 _ 6A, 0F
        push    edx                                     ; 1C7A _ 52
        push    eax                                     ; 1C7B _ 50
        call    boxfill8                                ; 1C7C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C81 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1C84 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1C87 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1C8A _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C8D _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1C90 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1C93 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1C96 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1C99 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1C9C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C9F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CA2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CA5 _ 8B. 00
        push    edi                                     ; 1CA7 _ 57
        push    esi                                     ; 1CA8 _ 56
        push    ebx                                     ; 1CA9 _ 53
        push    ecx                                     ; 1CAA _ 51
        push    7                                       ; 1CAB _ 6A, 07
        push    edx                                     ; 1CAD _ 52
        push    eax                                     ; 1CAE _ 50
        call    boxfill8                                ; 1CAF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CB4 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1CB7 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1CBA _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1CBD _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1CC0 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1CC3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1CC6 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1CC9 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1CCC _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1CCF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CD2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CD5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CD8 _ 8B. 00
        push    edi                                     ; 1CDA _ 57
        push    esi                                     ; 1CDB _ 56
        push    ebx                                     ; 1CDC _ 53
        push    ecx                                     ; 1CDD _ 51
        push    7                                       ; 1CDE _ 6A, 07
        push    edx                                     ; 1CE0 _ 52
        push    eax                                     ; 1CE1 _ 50
        call    boxfill8                                ; 1CE2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CE7 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1CEA _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1CED _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1CF0 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1CF3 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1CF6 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1CF9 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1CFC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CFF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D02 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D05 _ 8B. 00
        push    esi                                     ; 1D07 _ 56
        push    dword [ebp-10H]                         ; 1D08 _ FF. 75, F0
        push    ebx                                     ; 1D0B _ 53
        push    ecx                                     ; 1D0C _ 51
        push    0                                       ; 1D0D _ 6A, 00
        push    edx                                     ; 1D0F _ 52
        push    eax                                     ; 1D10 _ 50
        call    boxfill8                                ; 1D11 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D16 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1D19 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1D1C _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1D1F _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1D22 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1D25 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1D28 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1D2B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D2E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D31 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D34 _ 8B. 00
        push    dword [ebp-14H]                         ; 1D36 _ FF. 75, EC
        push    esi                                     ; 1D39 _ 56
        push    ebx                                     ; 1D3A _ 53
        push    ecx                                     ; 1D3B _ 51
        push    0                                       ; 1D3C _ 6A, 00
        push    edx                                     ; 1D3E _ 52
        push    eax                                     ; 1D3F _ 50
        call    boxfill8                                ; 1D40 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D45 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1D48 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1D4B _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1D4E _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1D51 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1D54 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1D57 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1D5A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D5D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D60 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D63 _ 8B. 00
        push    esi                                     ; 1D65 _ 56
        push    dword [ebp-10H]                         ; 1D66 _ FF. 75, F0
        push    ebx                                     ; 1D69 _ 53
        push    ecx                                     ; 1D6A _ 51
        push    8                                       ; 1D6B _ 6A, 08
        push    edx                                     ; 1D6D _ 52
        push    eax                                     ; 1D6E _ 50
        call    boxfill8                                ; 1D6F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D74 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1D77 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1D7A _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1D7D _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1D80 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1D83 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1D86 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D89 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1D8C _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1D8F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D92 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D95 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D98 _ 8B. 00
        push    edi                                     ; 1D9A _ 57
        push    esi                                     ; 1D9B _ 56
        push    ebx                                     ; 1D9C _ 53
        push    ecx                                     ; 1D9D _ 51
        push    8                                       ; 1D9E _ 6A, 08
        push    edx                                     ; 1DA0 _ 52
        push    eax                                     ; 1DA1 _ 50
        call    boxfill8                                ; 1DA2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DA7 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1DAA _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1DAD _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1DB0 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1DB3 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1DB6 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1DB9 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1DBC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1DBF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1DC2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DC5 _ 8B. 00
        push    dword [ebp-14H]                         ; 1DC7 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1DCA _ FF. 75, F0
        push    esi                                     ; 1DCD _ 56
        push    ebx                                     ; 1DCE _ 53
        push    ecx                                     ; 1DCF _ 51
        push    edx                                     ; 1DD0 _ 52
        push    eax                                     ; 1DD1 _ 50
        call    boxfill8                                ; 1DD2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DD7 _ 83. C4, 1C
        nop                                             ; 1DDA _ 90
        lea     esp, [ebp-0CH]                          ; 1DDB _ 8D. 65, F4
        pop     ebx                                     ; 1DDE _ 5B
        pop     esi                                     ; 1DDF _ 5E
        pop     edi                                     ; 1DE0 _ 5F
        pop     ebp                                     ; 1DE1 _ 5D
        ret                                             ; 1DE2 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1DE3 _ 55
        mov     ebp, esp                                ; 1DE4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1DE6 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1DE9 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DEF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1DF2 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DF9 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1DFC _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1E03 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1E06 _ C7. 40, 0C, 00000000
        nop                                             ; 1E0D _ 90
        pop     ebp                                     ; 1E0E _ 5D
        ret                                             ; 1E0F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1E10 _ 55
        mov     ebp, esp                                ; 1E11 _ 89. E5
        sub     esp, 16                                 ; 1E13 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1E16 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1E1D _ C7. 45, FC, 00000000
        jmp     ?_084                                   ; 1E24 _ EB, 13

?_083:  mov     eax, dword [ebp+8H]                     ; 1E26 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E29 _ 8B. 55, FC
        add     edx, 2                                  ; 1E2C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E2F _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1E33 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1E36 _ FF. 45, FC
?_084:  mov     eax, dword [ebp+8H]                     ; 1E39 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E3C _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1E3E _ 39. 45, FC
        jc near       ?_083                                   ; 1e41 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1E43 _ 8B. 45, F8
        leave                                           ; 1E46 _ C9
        ret                                             ; 1E47 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1E48 _ 55
        mov     ebp, esp                                ; 1E49 _ 89. E5
        sub     esp, 16                                 ; 1E4B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1E4E _ C7. 45, FC, 00000000
        jmp     ?_088                                   ; 1E55 _ E9, 00000084

?_085:  mov     eax, dword [ebp+8H]                     ; 1E5A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E5D _ 8B. 55, FC
        add     edx, 2                                  ; 1E60 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E63 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1E67 _ 39. 45, 0C
        ja      ?_087                                   ; 1E6A _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1E6C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E6F _ 8B. 55, FC
        add     edx, 2                                  ; 1E72 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E75 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1E78 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1E7B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E7E _ 8B. 55, FC
        add     edx, 2                                  ; 1E81 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1E84 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1E87 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1E8A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E8D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E90 _ 8B. 55, FC
        add     edx, 2                                  ; 1E93 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1E96 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1E99 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E9C _ 8B. 55, FC
        add     edx, 2                                  ; 1E9F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1EA2 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1EA6 _ 2B. 45, 0C
        mov     edx, eax                                ; 1EA9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EAB _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1EAE _ 8B. 4D, FC
        add     ecx, 2                                  ; 1EB1 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1EB4 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1EB8 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1EBB _ 8B. 55, FC
        add     edx, 2                                  ; 1EBE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1EC1 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1EC5 _ 85. C0
        jnz near      ?_086                                   ; 1ec7 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 1EC9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ECC _ 8B. 00
        lea     edx, [eax-1H]                           ; 1ECE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1ED1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1ED4 _ 89. 10
?_086:  mov     eax, dword [ebp-8H]                     ; 1ED6 _ 8B. 45, F8
        jmp     ?_089                                   ; 1ED9 _ EB, 16

?_087:  inc     dword [ebp-4H]                          ; 1EDB _ FF. 45, FC
?_088:  mov     eax, dword [ebp+8H]                     ; 1EDE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EE1 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1EE3 _ 39. 45, FC
        jc near       ?_085                                   ; 1ee6 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 1EEC _ B8, 00000000
?_089:  leave                                           ; 1EF1 _ C9
        ret                                             ; 1EF2 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1EF3 _ 55
        mov     ebp, esp                                ; 1EF4 _ 89. E5
        push    ebx                                     ; 1EF6 _ 53
        sub     esp, 16                                 ; 1EF7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1EFA _ C7. 45, F8, 00000000
        jmp     ?_091                                   ; 1F01 _ EB, 14

?_090:  mov     eax, dword [ebp+8H]                     ; 1F03 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F06 _ 8B. 55, F8
        add     edx, 2                                  ; 1F09 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1F0C _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1F0F _ 39. 45, 0C
        jc near       ?_092                                   ; 1f12 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1F14 _ FF. 45, F8
?_091:  mov     eax, dword [ebp+8H]                     ; 1F17 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F1A _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1F1C _ 39. 45, F8
        jl      ?_090                                   ; 1F1F _ 7C, E2
        jmp     ?_093                                   ; 1F21 _ EB, 01

?_092:  nop                                             ; 1F23 _ 90
?_093:  cmp     dword [ebp-8H], 0                       ; 1F24 _ 83. 7D, F8, 00
        jle near      ?_095                                   ; 1f28 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 1F2E _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F31 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F34 _ 8B. 45, 08
        add     edx, 2                                  ; 1F37 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1F3A _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1F3D _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1F40 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1F43 _ 8B. 45, 08
        add     ecx, 2                                  ; 1F46 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1F49 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1F4D _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1F4F _ 39. 45, 0C
        jne near      ?_095                                   ; 1f52 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1F58 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F5B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F5E _ 8B. 45, 08
        add     edx, 2                                  ; 1F61 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1F64 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1F68 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1F6B _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1F6E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1F71 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F74 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1F77 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1F7A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1F7E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F81 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1F83 _ 39. 45, F8
        jge near      ?_094                                   ; 1f86 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 1F88 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1F8B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1F8E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F91 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F94 _ 8B. 55, F8
        add     edx, 2                                  ; 1F97 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1F9A _ 8B. 04 D0
        cmp     ecx, eax                                ; 1F9D _ 39. C1
        jnz near      ?_094                                   ; 1f9f _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 1FA1 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1FA4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1FA7 _ 8B. 45, 08
        add     edx, 2                                  ; 1FAA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1FAD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1FB1 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1FB4 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1FB7 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1FBA _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1FBE _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1FC1 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1FC4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1FC7 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1FCA _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1FCD _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1FD1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FD4 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1FD6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1FD9 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1FDC _ 89. 10
?_094:  mov     eax, 0                                  ; 1FDE _ B8, 00000000
        jmp     ?_101                                   ; 1FE3 _ E9, 0000011B

?_095:  mov     eax, dword [ebp+8H]                     ; 1FE8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FEB _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1FED _ 39. 45, F8
        jge near      ?_096                                   ; 1ff0 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1FF2 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1FF5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1FF8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1FFB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FFE _ 8B. 55, F8
        add     edx, 2                                  ; 2001 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2004 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2007 _ 39. C1
        jnz near      ?_096                                   ; 2009 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 200B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 200E _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2011 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2014 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2017 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 201A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 201D _ 8B. 55, F8
        add     edx, 2                                  ; 2020 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2023 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2027 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 202A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 202D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2030 _ 8B. 55, F8
        add     edx, 2                                  ; 2033 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2036 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 203A _ B8, 00000000
        jmp     ?_101                                   ; 203F _ E9, 000000BF

?_096:  mov     eax, dword [ebp+8H]                     ; 2044 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2047 _ 8B. 00
        cmp     eax, 4095                               ; 2049 _ 3D, 00000FFF
        jg  near      ?_100                                   ; 204e _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 2054 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2057 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2059 _ 89. 45, F4
        jmp     ?_098                                   ; 205C _ EB, 27

?_097:  mov     eax, dword [ebp-0CH]                    ; 205E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2061 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2064 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 2067 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 206A _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        add     edx, 2                                  ; 2070 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2073 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2076 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2078 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 207B _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 207E _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 2082 _ FF. 4D, F4
?_098:  mov     eax, dword [ebp-0CH]                    ; 2085 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 2088 _ 3B. 45, F8
        jg  near      ?_097                                   ; 208b _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 208D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2090 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2092 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2095 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2098 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 209A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 209D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20A0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20A3 _ 8B. 00
        cmp     edx, eax                                ; 20A5 _ 39. C2
        jge near      ?_099                                   ; 20a7 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 20A9 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 20AC _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 20AE _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 20B1 _ 89. 50, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 20B4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20B7 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 20BA _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 20BD _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 20C0 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 20C3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20C6 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 20C9 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 20CC _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 20CF _ 89. 54 C8, 04
        mov     eax, 0                                  ; 20D3 _ B8, 00000000
        jmp     ?_101                                   ; 20D8 _ EB, 29

?_100:  mov     eax, dword [ebp+8H]                     ; 20DA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 20DD _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 20E0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20E3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 20E6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 20E9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 20EC _ 8B. 40, 08
        mov     edx, eax                                ; 20EF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 20F1 _ 8B. 45, 10
        add     eax, edx                                ; 20F4 _ 01. D0
        mov     edx, eax                                ; 20F6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 20F8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 20FB _ 89. 50, 08
        mov     eax, 4294967295                         ; 20FE _ B8, FFFFFFFF
?_101:  add     esp, 16                                 ; 2103 _ 83. C4, 10
        pop     ebx                                     ; 2106 _ 5B
        pop     ebp                                     ; 2107 _ 5D
        ret                                             ; 2108 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2109 _ 55
        mov     ebp, esp                                ; 210A _ 89. E5
        sub     esp, 16                                 ; 210C _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 210F _ 8B. 45, 0C
        add     eax, 4095                               ; 2112 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2117 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 211C _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 211F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2122 _ FF. 75, 08
        call    memman_alloc                            ; 2125 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 212A _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 212D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2130 _ 8B. 45, FC
        leave                                           ; 2133 _ C9
        ret                                             ; 2134 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2135 _ 55
        mov     ebp, esp                                ; 2136 _ 89. E5
        sub     esp, 16                                 ; 2138 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 213B _ 8B. 45, 10
        add     eax, 4095                               ; 213E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2143 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2148 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 214B _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 214E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2151 _ FF. 75, 08
        call    memman_free                             ; 2154 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2159 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 215C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 215F _ 8B. 45, FC
        leave                                           ; 2162 _ C9
        ret                                             ; 2163 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 2164 _ 55
        mov     ebp, esp                                ; 2165 _ 89. E5
        sub     esp, 24                                 ; 2167 _ 83. EC, 18
        sub     esp, 8                                  ; 216A _ 83. EC, 08
        push    9232                                    ; 216D _ 68, 00002410
        push    dword [ebp+8H]                          ; 2172 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2175 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 217A _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 217D _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 2180 _ 83. 7D, F0, 00
        jnz near      ?_102                                   ; 2184 _ 75, 0a
        mov     eax, 0                                  ; 2186 _ B8, 00000000
        jmp     ?_106                                   ; 218B _ E9, 00000099

?_102:  mov     eax, dword [ebp+10H]                    ; 2190 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2193 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 2197 _ 83. EC, 08
        push    eax                                     ; 219A _ 50
        push    dword [ebp+8H]                          ; 219B _ FF. 75, 08
        call    memman_alloc_4k                         ; 219E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21A3 _ 83. C4, 10
        mov     edx, eax                                ; 21A6 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 21A8 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 21AB _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 21AE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 21B1 _ 8B. 40, 04
        test    eax, eax                                ; 21B4 _ 85. C0
        jnz near      ?_103                                   ; 21b6 _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 21B8 _ 8B. 45, F0
        sub     esp, 4                                  ; 21BB _ 83. EC, 04
        push    9232                                    ; 21BE _ 68, 00002410
        push    eax                                     ; 21C3 _ 50
        push    dword [ebp+8H]                          ; 21C4 _ FF. 75, 08
        call    memman_free_4k                          ; 21C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21CC _ 83. C4, 10
        mov     eax, 0                                  ; 21CF _ B8, 00000000
        jmp     ?_106                                   ; 21D4 _ EB, 53

?_103:  mov     eax, dword [ebp-10H]                    ; 21D6 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 21D9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 21DC _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 21DE _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 21E1 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 21E4 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 21E7 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 21EA _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 21ED _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 21F0 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 21F3 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 21FA _ C7. 45, F4, 00000000
        jmp     ?_105                                   ; 2201 _ EB, 1A

?_104:  mov     eax, dword [ebp-10H]                    ; 2203 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2206 _ 8B. 55, F4
        add     edx, 33                                 ; 2209 _ 83. C2, 21
        shl     edx, 5                                  ; 220C _ C1. E2, 05
        add     eax, edx                                ; 220F _ 01. D0
        add     eax, 16                                 ; 2211 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2214 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 221A _ FF. 45, F4
?_105:  cmp     dword [ebp-0CH], 255                    ; 221D _ 81. 7D, F4, 000000FF
        jle near      ?_104                                   ; 2224 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 2226 _ 8B. 45, F0
?_106:  leave                                           ; 2229 _ C9
        ret                                             ; 222A _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 222B _ 55
        mov     ebp, esp                                ; 222C _ 89. E5
        sub     esp, 16                                 ; 222E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2231 _ C7. 45, FC, 00000000
        jmp     ?_109                                   ; 2238 _ EB, 5A

?_107:  mov     eax, dword [ebp+8H]                     ; 223A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 223D _ 8B. 55, FC
        add     edx, 33                                 ; 2240 _ 83. C2, 21
        shl     edx, 5                                  ; 2243 _ C1. E2, 05
        add     eax, edx                                ; 2246 _ 01. D0
        add     eax, 16                                 ; 2248 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 224B _ 8B. 00
        test    eax, eax                                ; 224D _ 85. C0
        jnz near      ?_108                                   ; 224f _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 2251 _ 8B. 45, FC
        shl     eax, 5                                  ; 2254 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2257 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 225D _ 8B. 45, 08
        add     eax, edx                                ; 2260 _ 01. D0
        add     eax, 4                                  ; 2262 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 2265 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2268 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 226B _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 226E _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 2271 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 2274 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 2278 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 227B _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 2282 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 2285 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 228C _ 8B. 45, F8
        jmp     ?_110                                   ; 228F _ EB, 11

?_108:  inc     dword [ebp-4H]                          ; 2291 _ FF. 45, FC
?_109:  cmp     dword [ebp-4H], 255                     ; 2294 _ 81. 7D, FC, 000000FF
        jle near      ?_107                                   ; 229b _ 7e, 9d
        mov     eax, 0                                  ; 229D _ B8, 00000000
?_110:  leave                                           ; 22A2 _ C9
        ret                                             ; 22A3 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 22A4 _ 55
        mov     ebp, esp                                ; 22A5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 22A7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 22AA _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 22AD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 22AF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22B2 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 22B5 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22B8 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 22BB _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 22BE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 22C4 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 22C7 _ 89. 50, 14
        nop                                             ; 22CA _ 90
        pop     ebp                                     ; 22CB _ 5D
        ret                                             ; 22CC _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 22CD _ 55
        mov     ebp, esp                                ; 22CE _ 89. E5
        push    esi                                     ; 22D0 _ 56
        push    ebx                                     ; 22D1 _ 53
        sub     esp, 16                                 ; 22D2 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 22D5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 22D8 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 22DB _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 22DE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22E1 _ 8B. 40, 10
        inc     eax                                     ; 22E4 _ 40
        cmp     dword [ebp+10H], eax                    ; 22E5 _ 39. 45, 10
        jle near      ?_111                                   ; 22e8 _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 22EA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22ED _ 8B. 40, 10
        inc     eax                                     ; 22F0 _ 40
        mov     dword [ebp+10H], eax                    ; 22F1 _ 89. 45, 10
?_111:  cmp     dword [ebp+10H], -1                     ; 22F4 _ 83. 7D, 10, FF
        jge near      ?_112                                   ; 22f8 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 22FA _ C7. 45, 10, FFFFFFFF
?_112:  mov     eax, dword [ebp+0CH]                    ; 2301 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2304 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2307 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 230A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 230D _ 3B. 45, 10
        jle near      ?_119                                   ; 2310 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 2316 _ 83. 7D, 10, 00
        js near       ?_115                                   ; 231a _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 2320 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2323 _ 89. 45, F4
        jmp     ?_114                                   ; 2326 _ EB, 33

?_113:  mov     eax, dword [ebp-0CH]                    ; 2328 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 232B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 232E _ 8B. 45, 08
        add     edx, 4                                  ; 2331 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2334 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2338 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 233B _ 8B. 4D, F4
        add     ecx, 4                                  ; 233E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2341 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2345 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2348 _ 8B. 55, F4
        add     edx, 4                                  ; 234B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 234E _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2352 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 2355 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2358 _ FF. 4D, F4
?_114:  mov     eax, dword [ebp-0CH]                    ; 235B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 235E _ 3B. 45, 10
        jg  near      ?_113                                   ; 2361 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 2363 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2366 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2369 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 236C _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 236F _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2373 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2376 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2379 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 237C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 237F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2382 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2385 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2388 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 238B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 238E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2391 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2394 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2397 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 239A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 239D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23A0 _ 8B. 40, 0C
        sub     esp, 8                                  ; 23A3 _ 83. EC, 08
        push    esi                                     ; 23A6 _ 56
        push    ebx                                     ; 23A7 _ 53
        push    ecx                                     ; 23A8 _ 51
        push    edx                                     ; 23A9 _ 52
        push    eax                                     ; 23AA _ 50
        push    dword [ebp+8H]                          ; 23AB _ FF. 75, 08
        call    sheet_refreshmap                        ; 23AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23B3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 23B6 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 23B9 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 23BC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23BF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23C2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 23C5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 23C8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23CB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23CE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 23D1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 23D4 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 23D7 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 23DA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23DD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23E0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23E3 _ 8B. 40, 0C
        sub     esp, 4                                  ; 23E6 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 23E9 _ FF. 75, F0
        push    esi                                     ; 23EC _ 56
        push    ebx                                     ; 23ED _ 53
        push    ecx                                     ; 23EE _ 51
        push    edx                                     ; 23EF _ 52
        push    eax                                     ; 23F0 _ 50
        push    dword [ebp+8H]                          ; 23F1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 23F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23F9 _ 83. C4, 20
        jmp     ?_126                                   ; 23FC _ E9, 00000239

?_115:  mov     eax, dword [ebp+8H]                     ; 2401 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2404 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 2407 _ 39. 45, F0
        jge near      ?_118                                   ; 240a _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 240C _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 240F _ 89. 45, F4
        jmp     ?_117                                   ; 2412 _ EB, 33

?_116:  mov     eax, dword [ebp-0CH]                    ; 2414 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2417 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 241A _ 8B. 45, 08
        add     edx, 4                                  ; 241D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2420 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2424 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2427 _ 8B. 4D, F4
        add     ecx, 4                                  ; 242A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 242D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2431 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2434 _ 8B. 55, F4
        add     edx, 4                                  ; 2437 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 243A _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 243E _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 2441 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 2444 _ FF. 45, F4
?_117:  mov     eax, dword [ebp+8H]                     ; 2447 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 244A _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 244D _ 39. 45, F4
        jl      ?_116                                   ; 2450 _ 7C, C2
?_118:  mov     eax, dword [ebp+8H]                     ; 2452 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2455 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2458 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 245B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 245E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2461 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2464 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2467 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 246A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 246D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2470 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2473 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2476 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2479 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 247C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 247F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2482 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2485 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2488 _ 8B. 40, 0C
        sub     esp, 8                                  ; 248B _ 83. EC, 08
        push    0                                       ; 248E _ 6A, 00
        push    ebx                                     ; 2490 _ 53
        push    ecx                                     ; 2491 _ 51
        push    edx                                     ; 2492 _ 52
        push    eax                                     ; 2493 _ 50
        push    dword [ebp+8H]                          ; 2494 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2497 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 249C _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 249F _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 24A2 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 24A5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24A8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24AB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24AE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 24B1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 24B4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24B7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24BA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24BD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 24C0 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 24C3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24C6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24C9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24CC _ 8B. 40, 0C
        sub     esp, 4                                  ; 24CF _ 83. EC, 04
        push    esi                                     ; 24D2 _ 56
        push    0                                       ; 24D3 _ 6A, 00
        push    ebx                                     ; 24D5 _ 53
        push    ecx                                     ; 24D6 _ 51
        push    edx                                     ; 24D7 _ 52
        push    eax                                     ; 24D8 _ 50
        push    dword [ebp+8H]                          ; 24D9 _ FF. 75, 08
        call    sheet_refreshsub                        ; 24DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24E1 _ 83. C4, 20
        jmp     ?_126                                   ; 24E4 _ E9, 00000151

?_119:  mov     eax, dword [ebp-10H]                    ; 24E9 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 24EC _ 3B. 45, 10
        jge near      ?_126                                   ; 24ef _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 24F5 _ 83. 7D, F0, 00
        js near       ?_122                                   ; 24f9 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 24FB _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 24FE _ 89. 45, F4
        jmp     ?_121                                   ; 2501 _ EB, 33

?_120:  mov     eax, dword [ebp-0CH]                    ; 2503 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2506 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2509 _ 8B. 45, 08
        add     edx, 4                                  ; 250C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 250F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2513 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2516 _ 8B. 4D, F4
        add     ecx, 4                                  ; 2519 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 251C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2520 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2523 _ 8B. 55, F4
        add     edx, 4                                  ; 2526 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2529 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 252D _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 2530 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 2533 _ FF. 45, F4
?_121:  mov     eax, dword [ebp-0CH]                    ; 2536 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2539 _ 3B. 45, 10
        jl      ?_120                                   ; 253C _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 253E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2541 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2544 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2547 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 254A _ 89. 54 88, 04
        jmp     ?_125                                   ; 254E _ EB, 69

?_122:  mov     eax, dword [ebp+8H]                     ; 2550 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2553 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2556 _ 89. 45, F4
        jmp     ?_124                                   ; 2559 _ EB, 37

?_123:  mov     eax, dword [ebp-0CH]                    ; 255B _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 255E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2561 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2564 _ 8B. 55, F4
        add     edx, 4                                  ; 2567 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 256A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 256E _ 8B. 45, 08
        add     ecx, 4                                  ; 2571 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2574 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 2578 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 257B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 257E _ 8B. 45, 08
        add     edx, 4                                  ; 2581 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2584 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2588 _ 8B. 55, F4
        inc     edx                                     ; 258B _ 42
        mov     dword [eax+18H], edx                    ; 258C _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 258F _ FF. 4D, F4
?_124:  mov     eax, dword [ebp-0CH]                    ; 2592 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2595 _ 3B. 45, 10
        jge near      ?_123                                   ; 2598 _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 259A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 259D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 25A0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 25A3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 25A6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 25AA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25AD _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 25B0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 25B3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 25B6 _ 89. 50, 10
?_125:  mov     eax, dword [ebp+0CH]                    ; 25B9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25BC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25BF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 25C2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 25C5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 25C8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 25CB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 25CE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 25D1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 25D4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 25D7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25DA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25DD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25E0 _ 8B. 40, 0C
        sub     esp, 8                                  ; 25E3 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 25E6 _ FF. 75, 10
        push    ebx                                     ; 25E9 _ 53
        push    ecx                                     ; 25EA _ 51
        push    edx                                     ; 25EB _ 52
        push    eax                                     ; 25EC _ 50
        push    dword [ebp+8H]                          ; 25ED _ FF. 75, 08
        call    sheet_refreshmap                        ; 25F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25F5 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25F8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25FB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25FE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2601 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2604 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2607 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 260A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 260D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2610 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2613 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2616 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2619 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 261C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 261F _ 8B. 40, 0C
        sub     esp, 4                                  ; 2622 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 2625 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 2628 _ FF. 75, 10
        push    ebx                                     ; 262B _ 53
        push    ecx                                     ; 262C _ 51
        push    edx                                     ; 262D _ 52
        push    eax                                     ; 262E _ 50
        push    dword [ebp+8H]                          ; 262F _ FF. 75, 08
        call    sheet_refreshsub                        ; 2632 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2637 _ 83. C4, 20
?_126:  nop                                             ; 263A _ 90
        lea     esp, [ebp-8H]                           ; 263B _ 8D. 65, F8
        pop     ebx                                     ; 263E _ 5B
        pop     esi                                     ; 263F _ 5E
        pop     ebp                                     ; 2640 _ 5D
        ret                                             ; 2641 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2642 _ 55
        mov     ebp, esp                                ; 2643 _ 89. E5
        push    edi                                     ; 2645 _ 57
        push    esi                                     ; 2646 _ 56
        push    ebx                                     ; 2647 _ 53
        sub     esp, 28                                 ; 2648 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 264B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 264E _ 8B. 40, 18
        test    eax, eax                                ; 2651 _ 85. C0
        js near       ?_127                                   ; 2653 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 2655 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 2658 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 265B _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 265E _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 2661 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2664 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 2667 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 266A _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 266D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2670 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 2673 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2676 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2679 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 267C _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 267F _ 8B. 45, 14
        add     edx, eax                                ; 2682 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2684 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2687 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 268A _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 268D _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2690 _ 03. 45, E4
        sub     esp, 4                                  ; 2693 _ 83. EC, 04
        push    ebx                                     ; 2696 _ 53
        push    ecx                                     ; 2697 _ 51
        push    edi                                     ; 2698 _ 57
        push    esi                                     ; 2699 _ 56
        push    edx                                     ; 269A _ 52
        push    eax                                     ; 269B _ 50
        push    dword [ebp+8H]                          ; 269C _ FF. 75, 08
        call    sheet_refreshsub                        ; 269F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26A4 _ 83. C4, 20
?_127:  mov     eax, 0                                  ; 26A7 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 26AC _ 8D. 65, F4
        pop     ebx                                     ; 26AF _ 5B
        pop     esi                                     ; 26B0 _ 5E
        pop     edi                                     ; 26B1 _ 5F
        pop     ebp                                     ; 26B2 _ 5D
        ret                                             ; 26B3 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 26B4 _ 55
        mov     ebp, esp                                ; 26B5 _ 89. E5
        push    esi                                     ; 26B7 _ 56
        push    ebx                                     ; 26B8 _ 53
        sub     esp, 16                                 ; 26B9 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 26BC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 26BF _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 26C2 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 26C5 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 26C8 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 26CB _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 26CE _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 26D1 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 26D4 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 26D7 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 26DA _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 26DD _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26E0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26E3 _ 8B. 40, 18
        test    eax, eax                                ; 26E6 _ 85. C0
        js near       ?_128                                   ; 26e8 _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 26EE _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 26F1 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 26F4 _ 8B. 45, F0
        add     edx, eax                                ; 26F7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 26F9 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 26FC _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 26FF _ 8B. 45, F4
        add     eax, ecx                                ; 2702 _ 01. C8
        sub     esp, 8                                  ; 2704 _ 83. EC, 08
        push    0                                       ; 2707 _ 6A, 00
        push    edx                                     ; 2709 _ 52
        push    eax                                     ; 270A _ 50
        push    dword [ebp-10H]                         ; 270B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 270E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2711 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2714 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2719 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 271C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 271F _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2722 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2725 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2728 _ 8B. 55, 14
        add     ecx, edx                                ; 272B _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 272D _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2730 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2733 _ 8B. 55, 10
        add     edx, ebx                                ; 2736 _ 01. DA
        sub     esp, 8                                  ; 2738 _ 83. EC, 08
        push    eax                                     ; 273B _ 50
        push    ecx                                     ; 273C _ 51
        push    edx                                     ; 273D _ 52
        push    dword [ebp+14H]                         ; 273E _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2741 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2744 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2747 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 274C _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 274F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2752 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 2755 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2758 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 275B _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 275E _ 8B. 45, F0
        add     edx, eax                                ; 2761 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2763 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2766 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2769 _ 8B. 45, F4
        add     eax, ebx                                ; 276C _ 01. D8
        sub     esp, 4                                  ; 276E _ 83. EC, 04
        push    ecx                                     ; 2771 _ 51
        push    0                                       ; 2772 _ 6A, 00
        push    edx                                     ; 2774 _ 52
        push    eax                                     ; 2775 _ 50
        push    dword [ebp-10H]                         ; 2776 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2779 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 277C _ FF. 75, 08
        call    sheet_refreshsub                        ; 277F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2784 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2787 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 278A _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 278D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2790 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2793 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2796 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2799 _ 8B. 4D, 14
        add     ebx, ecx                                ; 279C _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 279E _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 27A1 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 27A4 _ 8B. 4D, 10
        add     ecx, esi                                ; 27A7 _ 01. F1
        sub     esp, 4                                  ; 27A9 _ 83. EC, 04
        push    edx                                     ; 27AC _ 52
        push    eax                                     ; 27AD _ 50
        push    ebx                                     ; 27AE _ 53
        push    ecx                                     ; 27AF _ 51
        push    dword [ebp+14H]                         ; 27B0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 27B3 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 27B6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 27B9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27BE _ 83. C4, 20
?_128:  nop                                             ; 27C1 _ 90
        lea     esp, [ebp-8H]                           ; 27C2 _ 8D. 65, F8
        pop     ebx                                     ; 27C5 _ 5B
        pop     esi                                     ; 27C6 _ 5E
        pop     ebp                                     ; 27C7 _ 5D
        ret                                             ; 27C8 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 27C9 _ 55
        mov     ebp, esp                                ; 27CA _ 89. E5
        sub     esp, 48                                 ; 27CC _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 27CF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27D2 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 27D4 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 27D7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27DA _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 27DD _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 27E0 _ 83. 7D, 0C, 00
        jns     ?_129                                   ; 27E4 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 27E6 _ C7. 45, 0C, 00000000
?_129:  cmp     dword [ebp+10H], 8                      ; 27ED _ 83. 7D, 10, 08
        jg  near      ?_130                                   ; 27f1 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 27F3 _ C7. 45, 10, 00000000
?_130:  mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27FD _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2800 _ 39. 45, 14
        jle near      ?_131                                   ; 2803 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2805 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2808 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 280B _ 89. 45, 14
?_131:  mov     eax, dword [ebp+8H]                     ; 280E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2811 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2814 _ 39. 45, 18
        jle near      ?_132                                   ; 2817 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2819 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 281C _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 281F _ 89. 45, 18
?_132:  mov     eax, dword [ebp+1CH]                    ; 2822 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2825 _ 89. 45, FC
        jmp     ?_139                                   ; 2828 _ E9, 0000010E

?_133:  mov     eax, dword [ebp+8H]                     ; 282D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2830 _ 8B. 55, FC
        add     edx, 4                                  ; 2833 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2836 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 283A _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 283D _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2840 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 2842 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 2845 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2848 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 284E _ 8B. 45, E8
        sub     eax, edx                                ; 2851 _ 29. D0
        sar     eax, 5                                  ; 2853 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 2856 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2859 _ C7. 45, F4, 00000000
        jmp     ?_138                                   ; 2860 _ E9, 000000C4

?_134:  mov     eax, dword [ebp-18H]                    ; 2865 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2868 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 286B _ 8B. 45, F4
        add     eax, edx                                ; 286E _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2870 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2873 _ C7. 45, F8, 00000000
        jmp     ?_137                                   ; 287A _ E9, 00000098

?_135:  mov     eax, dword [ebp-18H]                    ; 287F _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2882 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2885 _ 8B. 45, F8
        add     eax, edx                                ; 2888 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 288A _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 288D _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2890 _ 3B. 45, D8
        jg  near      ?_136                                   ; 2893 _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 2895 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2898 _ 3B. 45, 14
        jge near      ?_136                                   ; 289b _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 289D _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 28A0 _ 3B. 45, DC
        jg  near      ?_136                                   ; 28a3 _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 28A5 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 28A8 _ 3B. 45, 18
        jge near      ?_136                                   ; 28ab _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 28AD _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 28B0 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 28B3 _ 0F AF. 45, F4
        mov     edx, eax                                ; 28B7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 28B9 _ 8B. 45, F8
        add     eax, edx                                ; 28BC _ 01. D0
        mov     edx, eax                                ; 28BE _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 28C0 _ 8B. 45, E4
        add     eax, edx                                ; 28C3 _ 01. D0
        mov     al, byte [eax]                          ; 28C5 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 28C7 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 28CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28CD _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 28D0 _ 0F AF. 45, DC
        mov     edx, eax                                ; 28D4 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 28D6 _ 8B. 45, D8
        add     eax, edx                                ; 28D9 _ 01. D0
        mov     edx, eax                                ; 28DB _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 28DD _ 8B. 45, EC
        add     eax, edx                                ; 28E0 _ 01. D0
        mov     al, byte [eax]                          ; 28E2 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 28E4 _ 38. 45, E3
        jnz near      ?_136                                   ; 28e7 _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 28E9 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 28ED _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 28F0 _ 8B. 40, 14
        cmp     edx, eax                                ; 28F3 _ 39. C2
        jz near       ?_136                                   ; 28f5 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 28F7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28FA _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 28FD _ 0F AF. 45, DC
        mov     edx, eax                                ; 2901 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2903 _ 8B. 45, D8
        add     eax, edx                                ; 2906 _ 01. D0
        mov     edx, eax                                ; 2908 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 290A _ 8B. 45, F0
        add     edx, eax                                ; 290D _ 01. C2
        mov     al, byte [ebp-29H]                      ; 290F _ 8A. 45, D7
        mov     byte [edx], al                          ; 2912 _ 88. 02
?_136:  inc     dword [ebp-8H]                          ; 2914 _ FF. 45, F8
?_137:  mov     eax, dword [ebp-18H]                    ; 2917 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 291A _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 291D _ 39. 45, F8
        jl      ?_135                                   ; 2920 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 2926 _ FF. 45, F4
?_138:  mov     eax, dword [ebp-18H]                    ; 2929 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 292C _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 292F _ 39. 45, F4
        jl      ?_134                                   ; 2932 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 2938 _ FF. 45, FC
?_139:  mov     eax, dword [ebp-4H]                     ; 293B _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 293E _ 3B. 45, 20
        jle near      ?_133                                   ; 2941 _ 0f 8e, fffffee6
        nop                                             ; 2947 _ 90
        nop                                             ; 2948 _ 90
        leave                                           ; 2949 _ C9
        ret                                             ; 294A _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 294B _ 55
        mov     ebp, esp                                ; 294C _ 89. E5
        sub     esp, 64                                 ; 294E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2951 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2954 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2957 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 295A _ 83. 7D, 0C, 00
        jns     ?_140                                   ; 295E _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2960 _ C7. 45, 0C, 00000000
?_140:  cmp     dword [ebp+10H], 0                      ; 2967 _ 83. 7D, 10, 00
        jns     ?_141                                   ; 296B _ 79, 07
        mov     dword [ebp+10H], 0                      ; 296D _ C7. 45, 10, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 2974 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2977 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 297A _ 39. 45, 14
        jle near      ?_142                                   ; 297d _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 297F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2982 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2985 _ 89. 45, 14
?_142:  mov     eax, dword [ebp+8H]                     ; 2988 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 298B _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 298E _ 39. 45, 18
        jle near      ?_143                                   ; 2991 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2993 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2996 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2999 _ 89. 45, 18
?_143:  mov     eax, dword [ebp+1CH]                    ; 299C _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 299F _ 89. 45, FC
        jmp     ?_154                                   ; 29A2 _ E9, 00000137

?_144:  mov     eax, dword [ebp+8H]                     ; 29A7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 29AA _ 8B. 55, FC
        add     edx, 4                                  ; 29AD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 29B0 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 29B4 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 29B7 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 29BA _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 29C0 _ 8B. 45, DC
        sub     eax, edx                                ; 29C3 _ 29. D0
        sar     eax, 5                                  ; 29C5 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 29C8 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 29CB _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 29CE _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 29D0 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 29D3 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 29D6 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 29D9 _ 8B. 55, 0C
        sub     edx, eax                                ; 29DC _ 29. C2
        mov     eax, edx                                ; 29DE _ 89. D0
        mov     dword [ebp-10H], eax                    ; 29E0 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 29E3 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 29E6 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 29E9 _ 8B. 55, 10
        sub     edx, eax                                ; 29EC _ 29. C2
        mov     eax, edx                                ; 29EE _ 89. D0
        mov     dword [ebp-14H], eax                    ; 29F0 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 29F3 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 29F6 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 29F9 _ 8B. 55, 14
        sub     edx, eax                                ; 29FC _ 29. C2
        mov     eax, edx                                ; 29FE _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2A00 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2A03 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2A06 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2A09 _ 8B. 55, 18
        sub     edx, eax                                ; 2A0C _ 29. C2
        mov     eax, edx                                ; 2A0E _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2A10 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2A13 _ 83. 7D, F0, 00
        jns     ?_145                                   ; 2A17 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2A19 _ C7. 45, F0, 00000000
?_145:  cmp     dword [ebp-14H], 0                      ; 2A20 _ 83. 7D, EC, 00
        jns     ?_146                                   ; 2A24 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 2A26 _ C7. 45, EC, 00000000
?_146:  mov     eax, dword [ebp-24H]                    ; 2A2D _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2A30 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 2A33 _ 39. 45, E8
        jle near      ?_147                                   ; 2a36 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2A38 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2A3B _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2A3E _ 89. 45, E8
?_147:  mov     eax, dword [ebp-24H]                    ; 2A41 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2A44 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2A47 _ 39. 45, E4
        jle near      ?_148                                   ; 2a4a _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2A4C _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2A4F _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2A52 _ 89. 45, E4
?_148:  mov     eax, dword [ebp-14H]                    ; 2A55 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2A58 _ 89. 45, F4
        jmp     ?_153                                   ; 2A5B _ EB, 76

?_149:  mov     eax, dword [ebp-24H]                    ; 2A5D _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2A60 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2A63 _ 8B. 45, F4
        add     eax, edx                                ; 2A66 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2A68 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2A6B _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2A6E _ 89. 45, F8
        jmp     ?_152                                   ; 2A71 _ EB, 55

?_150:  mov     eax, dword [ebp-24H]                    ; 2A73 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2A76 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2A79 _ 8B. 45, F8
        add     eax, edx                                ; 2A7C _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2A7E _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2A81 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2A84 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2A87 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2A8B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2A8D _ 8B. 45, F8
        add     eax, edx                                ; 2A90 _ 01. D0
        mov     edx, eax                                ; 2A92 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2A94 _ 8B. 45, D4
        add     eax, edx                                ; 2A97 _ 01. D0
        mov     al, byte [eax]                          ; 2A99 _ 8A. 00
        movzx   edx, al                                 ; 2A9B _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2A9E _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2AA1 _ 8B. 40, 14
        cmp     edx, eax                                ; 2AA4 _ 39. C2
        jz near       ?_151                                   ; 2aa6 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2AA8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AAB _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2AAE _ 0F AF. 45, D0
        mov     edx, eax                                ; 2AB2 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2AB4 _ 8B. 45, CC
        add     eax, edx                                ; 2AB7 _ 01. D0
        mov     edx, eax                                ; 2AB9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2ABB _ 8B. 45, E0
        add     edx, eax                                ; 2ABE _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2AC0 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2AC3 _ 88. 02
?_151:  inc     dword [ebp-8H]                          ; 2AC5 _ FF. 45, F8
?_152:  mov     eax, dword [ebp-8H]                     ; 2AC8 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2ACB _ 3B. 45, E8
        jl      ?_150                                   ; 2ACE _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2AD0 _ FF. 45, F4
?_153:  mov     eax, dword [ebp-0CH]                    ; 2AD3 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2AD6 _ 3B. 45, E4
        jl      ?_149                                   ; 2AD9 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2ADB _ FF. 45, FC
?_154:  mov     eax, dword [ebp+8H]                     ; 2ADE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2AE1 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2AE4 _ 39. 45, FC
        jle near      ?_144                                   ; 2ae7 _ 0f 8e, fffffeba
        nop                                             ; 2AED _ 90
        leave                                           ; 2AEE _ C9
        ret                                             ; 2AEF _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2AF0 _ 55
        mov     ebp, esp                                ; 2AF1 _ 89. E5
        sub     esp, 24                                 ; 2AF3 _ 83. EC, 18
        sub     esp, 8                                  ; 2AF6 _ 83. EC, 08
        push    52                                      ; 2AF9 _ 6A, 34
        push    67                                      ; 2AFB _ 6A, 43
        call    io_out8                                 ; 2AFD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B02 _ 83. C4, 10
        sub     esp, 8                                  ; 2B05 _ 83. EC, 08
        push    156                                     ; 2B08 _ 68, 0000009C
        push    64                                      ; 2B0D _ 6A, 40
        call    io_out8                                 ; 2B0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B14 _ 83. C4, 10
        sub     esp, 8                                  ; 2B17 _ 83. EC, 08
        push    46                                      ; 2B1A _ 6A, 2E
        push    64                                      ; 2B1C _ 6A, 40
        call    io_out8                                 ; 2B1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B23 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2B26 _ C7. 05, 00000360(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2B30 _ C7. 45, F4, 00000000
        jmp     ?_156                                   ; 2B37 _ EB, 25

?_155:  mov     eax, dword [ebp-0CH]                    ; 2B39 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B3C _ C1. E0, 04
        add     eax, ?_224                              ; 2B3F _ 05, 00000368(d)
        mov     dword [eax], 0                          ; 2B44 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2B4A _ 8B. 45, F4
        shl     eax, 4                                  ; 2B4D _ C1. E0, 04
        add     eax, ?_225                              ; 2B50 _ 05, 0000036C(d)
        mov     dword [eax], 0                          ; 2B55 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2B5B _ FF. 45, F4
?_156:  cmp     dword [ebp-0CH], 499                    ; 2B5E _ 81. 7D, F4, 000001F3
        jle near      ?_155                                   ; 2b65 _ 7e, d2
        nop                                             ; 2B67 _ 90
        nop                                             ; 2B68 _ 90
        leave                                           ; 2B69 _ C9
        ret                                             ; 2B6A _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2B6B _ 55
        mov     ebp, esp                                ; 2B6C _ 89. E5
        sub     esp, 16                                 ; 2B6E _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2B71 _ C7. 45, FC, 00000000
        jmp     ?_159                                   ; 2B78 _ EB, 35

?_157:  mov     eax, dword [ebp-4H]                     ; 2B7A _ 8B. 45, FC
        shl     eax, 4                                  ; 2B7D _ C1. E0, 04
        add     eax, ?_224                              ; 2B80 _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2B85 _ 8B. 00
        test    eax, eax                                ; 2B87 _ 85. C0
        jnz near      ?_158                                   ; 2b89 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2B8B _ 8B. 45, FC
        shl     eax, 4                                  ; 2B8E _ C1. E0, 04
        add     eax, ?_224                              ; 2B91 _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2B96 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2B9C _ 8B. 45, FC
        shl     eax, 4                                  ; 2B9F _ C1. E0, 04
        add     eax, timerctl                           ; 2BA2 _ 05, 00000360(d)
        add     eax, 4                                  ; 2BA7 _ 83. C0, 04
        jmp     ?_160                                   ; 2BAA _ EB, 11

?_158:  inc     dword [ebp-4H]                          ; 2BAC _ FF. 45, FC
?_159:  cmp     dword [ebp-4H], 499                     ; 2BAF _ 81. 7D, FC, 000001F3
        jle near      ?_157                                   ; 2bb6 _ 7e, c2
        mov     eax, 0                                  ; 2BB8 _ B8, 00000000
?_160:  leave                                           ; 2BBD _ C9
        ret                                             ; 2BBE _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2BBF _ 55
        mov     ebp, esp                                ; 2BC0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BC2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2BC5 _ C7. 40, 04, 00000000
        nop                                             ; 2BCC _ 90
        pop     ebp                                     ; 2BCD _ 5D
        ret                                             ; 2BCE _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2BCF _ 55
        mov     ebp, esp                                ; 2BD0 _ 89. E5
        sub     esp, 4                                  ; 2BD2 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2BD5 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2BD8 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2BDB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2BDE _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2BE1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2BE4 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2BE7 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2BEA _ 88. 50, 0C
        nop                                             ; 2BED _ 90
        leave                                           ; 2BEE _ C9
        ret                                             ; 2BEF _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2BF0 _ 55
        mov     ebp, esp                                ; 2BF1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BF3 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2BF6 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2BF9 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2BFB _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2BFE _ C7. 40, 04, 00000002
        nop                                             ; 2C05 _ 90
        pop     ebp                                     ; 2C06 _ 5D
        ret                                             ; 2C07 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2C08 _ 55
        mov     ebp, esp                                ; 2C09 _ 89. E5
        sub     esp, 24                                 ; 2C0B _ 83. EC, 18
        sub     esp, 8                                  ; 2C0E _ 83. EC, 08
        push    32                                      ; 2C11 _ 6A, 20
        push    32                                      ; 2C13 _ 6A, 20
        call    io_out8                                 ; 2C15 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C1A _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2C1D _ A1, 00000360(d)
        inc     eax                                     ; 2C22 _ 40
        mov     dword [timerctl], eax                   ; 2C23 _ A3, 00000360(d)
        mov     byte [ebp-0DH], 0                       ; 2C28 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2C2C _ C7. 45, F4, 00000000
        jmp     ?_164                                   ; 2C33 _ E9, 000000A8

?_161:  mov     eax, dword [ebp-0CH]                    ; 2C38 _ 8B. 45, F4
        shl     eax, 4                                  ; 2C3B _ C1. E0, 04
        add     eax, ?_224                              ; 2C3E _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2C43 _ 8B. 00
        cmp     eax, 2                                  ; 2C45 _ 83. F8, 02
        jne near      ?_162                                   ; 2c48 _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2C4E _ 8B. 45, F4
        shl     eax, 4                                  ; 2C51 _ C1. E0, 04
        add     eax, ?_223                              ; 2C54 _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2C59 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2C5B _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2C5E _ 8B. 45, F4
        shl     eax, 4                                  ; 2C61 _ C1. E0, 04
        add     eax, ?_223                              ; 2C64 _ 05, 00000364(d)
        mov     dword [eax], edx                        ; 2C69 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2C6B _ 8B. 45, F4
        shl     eax, 4                                  ; 2C6E _ C1. E0, 04
        add     eax, ?_223                              ; 2C71 _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2C76 _ 8B. 00
        test    eax, eax                                ; 2C78 _ 85. C0
        jnz near      ?_162                                   ; 2c7a _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2C7C _ 8B. 45, F4
        shl     eax, 4                                  ; 2C7F _ C1. E0, 04
        add     eax, ?_224                              ; 2C82 _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2C87 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2C8D _ 8B. 45, F4
        shl     eax, 4                                  ; 2C90 _ C1. E0, 04
        add     eax, ?_226                              ; 2C93 _ 05, 00000370(d)
        mov     al, byte [eax]                          ; 2C98 _ 8A. 00
        movzx   edx, al                                 ; 2C9A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2C9D _ 8B. 45, F4
        shl     eax, 4                                  ; 2CA0 _ C1. E0, 04
        add     eax, ?_225                              ; 2CA3 _ 05, 0000036C(d)
        mov     eax, dword [eax]                        ; 2CA8 _ 8B. 00
        sub     esp, 8                                  ; 2CAA _ 83. EC, 08
        push    edx                                     ; 2CAD _ 52
        push    eax                                     ; 2CAE _ 50
        call    fifo8_put                               ; 2CAF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CB4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2CB7 _ 8B. 45, F4
        shl     eax, 4                                  ; 2CBA _ C1. E0, 04
        add     eax, timerctl                           ; 2CBD _ 05, 00000360(d)
        lea     edx, [eax+4H]                           ; 2CC2 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2CC5 _ A1, 00000000(d)
        cmp     edx, eax                                ; 2CCA _ 39. C2
        jnz near      ?_162                                   ; 2ccc _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2CCE _ C6. 45, F3, 01
?_162:  cmp     byte [ebp-0DH], 0                       ; 2CD2 _ 80. 7D, F3, 00
        jz near       ?_163                                   ; 2cd6 _ 74, 05
        call    task_switch                             ; 2CD8 _ E8, FFFFFFFC(rel)
?_163:  inc     dword [ebp-0CH]                         ; 2CDD _ FF. 45, F4
?_164:  cmp     dword [ebp-0CH], 499                    ; 2CE0 _ 81. 7D, F4, 000001F3
        jle near      ?_161                                   ; 2ce7 _ 0f 8e, ffffff4b
        nop                                             ; 2CED _ 90
        leave                                           ; 2CEE _ C9
        ret                                             ; 2CEF _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2CF0 _ 55
        mov     ebp, esp                                ; 2CF1 _ 89. E5
        mov     eax, timerctl                           ; 2CF3 _ B8, 00000360(d)
        pop     ebp                                     ; 2CF8 _ 5D
        ret                                             ; 2CF9 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2CFA _ 55
        mov     ebp, esp                                ; 2CFB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2CFD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2D00 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2D03 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D06 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2D09 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2D0C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2D0E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2D11 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2D14 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2D17 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2D1A _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2D21 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2D24 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2D2B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2D2E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2D35 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2D38 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2D3B _ 89. 50, 18
        nop                                             ; 2D3E _ 90
        pop     ebp                                     ; 2D3F _ 5D
        ret                                             ; 2D40 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2D41 _ 55
        mov     ebp, esp                                ; 2D42 _ 89. E5
        sub     esp, 24                                 ; 2D44 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2D47 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2D4A _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2D4D _ 83. 7D, 08, 00
        jnz near      ?_165                                   ; 2d51 _ 75, 0a
        mov     eax, 4294967295                         ; 2D53 _ B8, FFFFFFFF
        jmp     ?_169                                   ; 2D58 _ E9, 0000009F

?_165:  mov     eax, dword [ebp+8H]                     ; 2D5D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D60 _ 8B. 40, 10
        test    eax, eax                                ; 2D63 _ 85. C0
        jnz near      ?_166                                   ; 2d65 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2D67 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2D6A _ 8B. 40, 14
        or      eax, 01H                                ; 2D6D _ 83. C8, 01
        mov     edx, eax                                ; 2D70 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D72 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2D75 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2D78 _ B8, FFFFFFFF
        jmp     ?_169                                   ; 2D7D _ EB, 7D

?_166:  mov     eax, dword [ebp+8H]                     ; 2D7F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2D82 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2D84 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D87 _ 8B. 40, 04
        add     edx, eax                                ; 2D8A _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2D8C _ 8A. 45, F4
        mov     byte [edx], al                          ; 2D8F _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2D91 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D94 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2D97 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D9A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D9D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2DA0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2DA3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2DA6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2DA9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2DAC _ 39. C2
        jnz near      ?_167                                   ; 2dae _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2DB0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2DB3 _ C7. 40, 04, 00000000
?_167:  mov     eax, dword [ebp+8H]                     ; 2DBA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2DBD _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2DC0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2DC3 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2DC6 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2DC9 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2DCC _ 8B. 40, 18
        test    eax, eax                                ; 2DCF _ 85. C0
        jz near       ?_168                                   ; 2dd1 _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 2DD3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2DD6 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2DD9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2DDC _ 83. F8, 02
        jz near       ?_168                                   ; 2ddf _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 2DE1 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2DE4 _ 8B. 40, 18
        sub     esp, 4                                  ; 2DE7 _ 83. EC, 04
        push    0                                       ; 2DEA _ 6A, 00
        push    -1                                      ; 2DEC _ 6A, FF
        push    eax                                     ; 2DEE _ 50
        call    task_run                                ; 2DEF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DF4 _ 83. C4, 10
?_168:  mov     eax, 0                                  ; 2DF7 _ B8, 00000000
?_169:  leave                                           ; 2DFC _ C9
        ret                                             ; 2DFD _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2DFE _ 55
        mov     ebp, esp                                ; 2DFF _ 89. E5
        sub     esp, 16                                 ; 2E01 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2E04 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2E07 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2E0A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E0D _ 8B. 40, 0C
        cmp     edx, eax                                ; 2E10 _ 39. C2
        jnz near      ?_170                                   ; 2e12 _ 75, 07
        mov     eax, 4294967295                         ; 2E14 _ B8, FFFFFFFF
        jmp     ?_172                                   ; 2E19 _ EB, 50

?_170:  mov     eax, dword [ebp+8H]                     ; 2E1B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2E1E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2E20 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E23 _ 8B. 40, 08
        add     eax, edx                                ; 2E26 _ 01. D0
        mov     al, byte [eax]                          ; 2E28 _ 8A. 00
        movzx   eax, al                                 ; 2E2A _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2E2D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2E30 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E33 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2E36 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E39 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2E3C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2E3F _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2E42 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2E45 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E48 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2E4B _ 39. C2
        jnz near      ?_171                                   ; 2e4d _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2E4F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2E52 _ C7. 40, 08, 00000000
?_171:  mov     eax, dword [ebp+8H]                     ; 2E59 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E5C _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2E5F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E62 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2E65 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2E68 _ 8B. 45, FC
?_172:  leave                                           ; 2E6B _ C9
        ret                                             ; 2E6C _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2E6D _ 55
        mov     ebp, esp                                ; 2E6E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E70 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2E73 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2E76 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E79 _ 8B. 40, 10
        sub     edx, eax                                ; 2E7C _ 29. C2
        mov     eax, edx                                ; 2E7E _ 89. D0
        pop     ebp                                     ; 2E80 _ 5D
        ret                                             ; 2E81 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2E82 _ 55
        mov     ebp, esp                                ; 2E83 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2E85 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_173                                   ; 2E8C _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2E8E _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2E95 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2E98 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2E9B _ 89. 45, 0C
?_173:  mov     eax, dword [ebp+0CH]                    ; 2E9E _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2EA1 _ 8B. 55, 08
        mov     word [edx], ax                          ; 2EA4 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2EA7 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2EAA _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2EAD _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2EB1 _ 8B. 45, 10
        sar     eax, 16                                 ; 2EB4 _ C1. F8, 10
        mov     dl, al                                  ; 2EB7 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2EB9 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2EBC _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2EBF _ 8B. 45, 14
        mov     dl, al                                  ; 2EC2 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2EC4 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2EC7 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2ECA _ 8B. 45, 0C
        shr     eax, 16                                 ; 2ECD _ C1. E8, 10
        and     eax, 0FH                                ; 2ED0 _ 83. E0, 0F
        mov     dl, al                                  ; 2ED3 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2ED5 _ 8B. 45, 14
        sar     eax, 8                                  ; 2ED8 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2EDB _ 83. E0, F0
        or      eax, edx                                ; 2EDE _ 09. D0
        mov     dl, al                                  ; 2EE0 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2EE2 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2EE5 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2EE8 _ 8B. 45, 10
        shr     eax, 24                                 ; 2EEB _ C1. E8, 18
        mov     dl, al                                  ; 2EEE _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2EF0 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2EF3 _ 88. 50, 07
        nop                                             ; 2EF6 _ 90
        pop     ebp                                     ; 2EF7 _ 5D
        ret                                             ; 2EF8 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 2EF9 _ 55
        mov     ebp, esp                                ; 2EFA _ 89. E5
        mov     eax, dword [taskctl]                    ; 2EFC _ A1, 000022A8(d)
        pop     ebp                                     ; 2F01 _ 5D
        ret                                             ; 2F02 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 2F03 _ 55
        mov     ebp, esp                                ; 2F04 _ 89. E5
        sub     esp, 16                                 ; 2F06 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 2F09 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 2F0F _ 8B. 55, 08
        mov     eax, edx                                ; 2F12 _ 89. D0
        shl     eax, 2                                  ; 2F14 _ C1. E0, 02
        add     eax, edx                                ; 2F17 _ 01. D0
        shl     eax, 2                                  ; 2F19 _ C1. E0, 02
        add     eax, ecx                                ; 2F1C _ 01. C8
        add     eax, 8                                  ; 2F1E _ 83. C0, 08
        mov     dword [eax], 0                          ; 2F21 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 2F27 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 2F2D _ 8B. 55, 08
        mov     eax, edx                                ; 2F30 _ 89. D0
        shl     eax, 2                                  ; 2F32 _ C1. E0, 02
        add     eax, edx                                ; 2F35 _ 01. D0
        shl     eax, 2                                  ; 2F37 _ C1. E0, 02
        add     eax, ecx                                ; 2F3A _ 01. C8
        add     eax, 12                                 ; 2F3C _ 83. C0, 0C
        mov     dword [eax], 0                          ; 2F3F _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 2F45 _ C7. 45, FC, 00000000
        jmp     ?_175                                   ; 2F4C _ EB, 20

?_174:  mov     ecx, dword [taskctl]                    ; 2F4E _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 2F54 _ 8B. 55, FC
        mov     eax, edx                                ; 2F57 _ 89. D0
        add     eax, eax                                ; 2F59 _ 01. C0
        add     eax, edx                                ; 2F5B _ 01. D0
        shl     eax, 3                                  ; 2F5D _ C1. E0, 03
        add     eax, ecx                                ; 2F60 _ 01. C8
        add     eax, 16                                 ; 2F62 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2F65 _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 2F6B _ FF. 45, FC
?_175:  cmp     dword [ebp-4H], 2                       ; 2F6E _ 83. 7D, FC, 02
        jle near      ?_174                                   ; 2f72 _ 7e, da
        nop                                             ; 2F74 _ 90
        nop                                             ; 2F75 _ 90
        leave                                           ; 2F76 _ C9
        ret                                             ; 2F77 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 2F78 _ 55
        mov     ebp, esp                                ; 2F79 _ 89. E5
        push    ebx                                     ; 2F7B _ 53
        sub     esp, 20                                 ; 2F7C _ 83. EC, 14
        call    get_addr_gdt                            ; 2F7F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2F84 _ 89. 45, F0
        sub     esp, 8                                  ; 2F87 _ 83. EC, 08
        push    668                                     ; 2F8A _ 68, 0000029C
        push    dword [ebp+8H]                          ; 2F8F _ FF. 75, 08
        call    memman_alloc_4k                         ; 2F92 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F97 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2F9A _ A3, 000022A8(d)
        mov     dword [ebp-0CH], 0                      ; 2F9F _ C7. 45, F4, 00000000
        jmp     ?_177                                   ; 2FA6 _ E9, 000000A0

?_176:  mov     ecx, dword [taskctl]                    ; 2FAB _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 2FB1 _ 8B. 55, F4
        mov     eax, edx                                ; 2FB4 _ 89. D0
        add     eax, eax                                ; 2FB6 _ 01. C0
        add     eax, edx                                ; 2FB8 _ 01. D0
        lea     edx, [eax*4]                            ; 2FBA _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2FC1 _ 01. D0
        shl     eax, 3                                  ; 2FC3 _ C1. E0, 03
        add     eax, ecx                                ; 2FC6 _ 01. C8
        add     eax, 72                                 ; 2FC8 _ 83. C0, 48
        mov     dword [eax], 0                          ; 2FCB _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2FD1 _ 8B. 45, F4
        add     eax, 7                                  ; 2FD4 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 2FD7 _ 8B. 1D, 000022A8(d)
        lea     ecx, [eax*8]                            ; 2FDD _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2FE4 _ 8B. 55, F4
        mov     eax, edx                                ; 2FE7 _ 89. D0
        add     eax, eax                                ; 2FE9 _ 01. C0
        add     eax, edx                                ; 2FEB _ 01. D0
        lea     edx, [eax*4]                            ; 2FED _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2FF4 _ 01. D0
        shl     eax, 3                                  ; 2FF6 _ C1. E0, 03
        add     eax, ebx                                ; 2FF9 _ 01. D8
        add     eax, 68                                 ; 2FFB _ 83. C0, 44
        mov     dword [eax], ecx                        ; 2FFE _ 89. 08
        mov     ecx, dword [taskctl]                    ; 3000 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 3006 _ 8B. 55, F4
        mov     eax, edx                                ; 3009 _ 89. D0
        add     eax, eax                                ; 300B _ 01. C0
        add     eax, edx                                ; 300D _ 01. D0
        lea     edx, [eax*4]                            ; 300F _ 8D. 14 85, 00000000
        add     eax, edx                                ; 3016 _ 01. D0
        shl     eax, 3                                  ; 3018 _ C1. E0, 03
        add     eax, 80                                 ; 301B _ 83. C0, 50
        add     eax, ecx                                ; 301E _ 01. C8
        add     eax, 4                                  ; 3020 _ 83. C0, 04
        mov     edx, eax                                ; 3023 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3025 _ 8B. 45, F4
        add     eax, 7                                  ; 3028 _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 302B _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 3032 _ 8B. 45, F0
        add     eax, ecx                                ; 3035 _ 01. C8
        push    137                                     ; 3037 _ 68, 00000089
        push    edx                                     ; 303C _ 52
        push    103                                     ; 303D _ 6A, 67
        push    eax                                     ; 303F _ 50
        call    set_segmdesc                            ; 3040 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3045 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 3048 _ FF. 45, F4
?_177:  cmp     dword [ebp-0CH], 4                      ; 304B _ 83. 7D, F4, 04
        jle near      ?_176                                   ; 304f _ 0f 8e, ffffff56
        mov     dword [ebp-0CH], 0                      ; 3055 _ C7. 45, F4, 00000000
        jmp     ?_179                                   ; 305C _ EB, 11

?_178:  sub     esp, 12                                 ; 305E _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 3061 _ FF. 75, F4
        call    init_task_level                         ; 3064 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3069 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 306C _ FF. 45, F4
?_179:  cmp     dword [ebp-0CH], 2                      ; 306F _ 83. 7D, F4, 02
        jle near      ?_178                                   ; 3073 _ 7e, e9
        call    task_alloc                              ; 3075 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 307A _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 307D _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 3080 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 3087 _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 308A _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 3091 _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 3094 _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 309B _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 309E _ FF. 75, EC
        call    task_add                                ; 30A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30A6 _ 83. C4, 10
        call    task_switchsub                          ; 30A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 30AE _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 30B1 _ 8B. 00
        sub     esp, 12                                 ; 30B3 _ 83. EC, 0C
        push    eax                                     ; 30B6 _ 50
        call    load_tr                                 ; 30B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30BC _ 83. C4, 10
        call    timer_alloc                             ; 30BF _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 30C4 _ A3, 000022A4(d)
        mov     eax, dword [ebp-14H]                    ; 30C9 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 30CC _ 8B. 40, 08
        mov     edx, eax                                ; 30CF _ 89. C2
        mov     eax, dword [task_timer]                 ; 30D1 _ A1, 000022A4(d)
        sub     esp, 8                                  ; 30D6 _ 83. EC, 08
        push    edx                                     ; 30D9 _ 52
        push    eax                                     ; 30DA _ 50
        call    timer_settime                           ; 30DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30E0 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 30E3 _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 30E6 _ 8B. 5D, FC
        leave                                           ; 30E9 _ C9
        ret                                             ; 30EA _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 30EB _ 55
        mov     ebp, esp                                ; 30EC _ 89. E5
        sub     esp, 16                                 ; 30EE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 30F1 _ C7. 45, FC, 00000000
        jmp     ?_182                                   ; 30F8 _ E9, 000000FD

?_180:  mov     ecx, dword [taskctl]                    ; 30FD _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 3103 _ 8B. 55, FC
        mov     eax, edx                                ; 3106 _ 89. D0
        add     eax, eax                                ; 3108 _ 01. C0
        add     eax, edx                                ; 310A _ 01. D0
        lea     edx, [eax*4]                            ; 310C _ 8D. 14 85, 00000000
        add     eax, edx                                ; 3113 _ 01. D0
        shl     eax, 3                                  ; 3115 _ C1. E0, 03
        add     eax, ecx                                ; 3118 _ 01. C8
        add     eax, 72                                 ; 311A _ 83. C0, 48
        mov     eax, dword [eax]                        ; 311D _ 8B. 00
        test    eax, eax                                ; 311F _ 85. C0
        jne near      ?_181                                   ; 3121 _ 0f 85, 000000d0
        mov     ecx, dword [taskctl]                    ; 3127 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 312D _ 8B. 55, FC
        mov     eax, edx                                ; 3130 _ 89. D0
        add     eax, eax                                ; 3132 _ 01. C0
        add     eax, edx                                ; 3134 _ 01. D0
        lea     edx, [eax*4]                            ; 3136 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 313D _ 01. D0
        shl     eax, 3                                  ; 313F _ C1. E0, 03
        add     eax, 64                                 ; 3142 _ 83. C0, 40
        add     eax, ecx                                ; 3145 _ 01. C8
        add     eax, 4                                  ; 3147 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 314A _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 314D _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 3150 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 3157 _ 8B. 45, F8
        mov     dword [eax+34H], 514                    ; 315A _ C7. 40, 34, 00000202
        mov     eax, dword [ebp-8H]                     ; 3161 _ 8B. 45, F8
        mov     dword [eax+38H], 0                      ; 3164 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-8H]                     ; 316B _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 316E _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3175 _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 3178 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 317F _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 3182 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 3189 _ 8B. 45, F8
        mov     dword [eax+4CH], 0                      ; 318C _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3193 _ 8B. 45, FC
        inc     eax                                     ; 3196 _ 40
        shl     eax, 9                                  ; 3197 _ C1. E0, 09
        mov     edx, eax                                ; 319A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 319C _ 8B. 45, F8
        mov     dword [eax+48H], edx                    ; 319F _ 89. 50, 48
        mov     eax, dword [ebp-8H]                     ; 31A2 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 31A5 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-8H]                     ; 31AC _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 31AF _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 31B6 _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 31B9 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 31C0 _ 8B. 45, F8
        mov     dword [eax+64H], 0                      ; 31C3 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-8H]                     ; 31CA _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 31CD _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 31D4 _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 31D7 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 31DE _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 31E1 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 31E8 _ 8B. 45, F8
        mov     dword [eax+74H], 1073741824             ; 31EB _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-8H]                     ; 31F2 _ 8B. 45, F8
        jmp     ?_183                                   ; 31F5 _ EB, 12

?_181:  inc     dword [ebp-4H]                          ; 31F7 _ FF. 45, FC
?_182:  cmp     dword [ebp-4H], 4                       ; 31FA _ 83. 7D, FC, 04
        jle near      ?_180                                   ; 31fe _ 0f 8e, fffffef9
        mov     eax, 0                                  ; 3204 _ B8, 00000000
?_183:  leave                                           ; 3209 _ C9
        ret                                             ; 320A _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 320B _ 55
        mov     ebp, esp                                ; 320C _ 89. E5
        sub     esp, 8                                  ; 320E _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 3211 _ 83. 7D, 0C, 00
        jns     ?_184                                   ; 3215 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3217 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 321A _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 321D _ 89. 45, 0C
?_184:  cmp     dword [ebp+10H], 0                      ; 3220 _ 83. 7D, 10, 00
        jle near      ?_185                                   ; 3224 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 3226 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3229 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 322C _ 89. 50, 08
?_185:  mov     eax, dword [ebp+8H]                     ; 322F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3232 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3235 _ 83. F8, 02
        jnz near      ?_186                                   ; 3238 _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 323A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 323D _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 3240 _ 39. 45, 0C
        jz near       ?_186                                   ; 3243 _ 74, 0e
        sub     esp, 12                                 ; 3245 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3248 _ FF. 75, 08
        call    task_remove                             ; 324B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3250 _ 83. C4, 10
?_186:  mov     eax, dword [ebp+8H]                     ; 3253 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3256 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3259 _ 83. F8, 02
        jz near       ?_187                                   ; 325c _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 325E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3261 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3264 _ 89. 50, 0C
        sub     esp, 12                                 ; 3267 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 326A _ FF. 75, 08
        call    task_add                                ; 326D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3272 _ 83. C4, 10
?_187:  mov     eax, dword [taskctl]                    ; 3275 _ A1, 000022A8(d)
        mov     dword [eax+4H], 1                       ; 327A _ C7. 40, 04, 00000001
        nop                                             ; 3281 _ 90
        leave                                           ; 3282 _ C9
        ret                                             ; 3283 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3284 _ 55
        mov     ebp, esp                                ; 3285 _ 89. E5
        sub     esp, 24                                 ; 3287 _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 328A _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 3290 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 3295 _ 8B. 10
        mov     eax, edx                                ; 3297 _ 89. D0
        shl     eax, 2                                  ; 3299 _ C1. E0, 02
        add     eax, edx                                ; 329C _ 01. D0
        shl     eax, 2                                  ; 329E _ C1. E0, 02
        add     eax, ecx                                ; 32A1 _ 01. C8
        add     eax, 8                                  ; 32A3 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 32A6 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 32A9 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 32AC _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 32AF _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 32B2 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 32B6 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 32B9 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 32BC _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 32BF _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 32C2 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 32C5 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 32C8 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 32CB _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 32CE _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 32D1 _ 8B. 00
        cmp     edx, eax                                ; 32D3 _ 39. C2
        jnz near      ?_188                                   ; 32d5 _ 75, 0a
        mov     eax, dword [ebp-0CH]                    ; 32D7 _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 32DA _ C7. 40, 04, 00000000
?_188:  mov     eax, dword [taskctl]                    ; 32E1 _ A1, 000022A8(d)
        mov     eax, dword [eax+4H]                     ; 32E6 _ 8B. 40, 04
        test    eax, eax                                ; 32E9 _ 85. C0
        jz near       ?_189                                   ; 32eb _ 74, 24
        call    task_switchsub                          ; 32ED _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 32F2 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 32F8 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 32FD _ 8B. 10
        mov     eax, edx                                ; 32FF _ 89. D0
        shl     eax, 2                                  ; 3301 _ C1. E0, 02
        add     eax, edx                                ; 3304 _ 01. D0
        shl     eax, 2                                  ; 3306 _ C1. E0, 02
        add     eax, ecx                                ; 3309 _ 01. C8
        add     eax, 8                                  ; 330B _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 330E _ 89. 45, F4
?_189:  mov     eax, dword [ebp-0CH]                    ; 3311 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3314 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3317 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 331A _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 331E _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3321 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 3324 _ 8B. 40, 08
        mov     edx, eax                                ; 3327 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3329 _ A1, 000022A4(d)
        sub     esp, 8                                  ; 332E _ 83. EC, 08
        push    edx                                     ; 3331 _ 52
        push    eax                                     ; 3332 _ 50
        call    timer_settime                           ; 3333 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3338 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 333B _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 333E _ 3B. 45, F0
        jz near       ?_190                                   ; 3341 _ 74, 1a
        cmp     dword [ebp-14H], 0                      ; 3343 _ 83. 7D, EC, 00
        jz near       ?_190                                   ; 3347 _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 3349 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 334C _ 8B. 00
        sub     esp, 8                                  ; 334E _ 83. EC, 08
        push    eax                                     ; 3351 _ 50
        push    0                                       ; 3352 _ 6A, 00
        call    farjmp                                  ; 3354 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3359 _ 83. C4, 10
        nop                                             ; 335C _ 90
?_190:  nop                                             ; 335D _ 90
        leave                                           ; 335E _ C9
        ret                                             ; 335F _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3360 _ 55
        mov     ebp, esp                                ; 3361 _ 89. E5
        sub     esp, 24                                 ; 3363 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 3366 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 336D _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 3374 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3377 _ 8B. 40, 04
        cmp     eax, 2                                  ; 337A _ 83. F8, 02
        jnz near      ?_191                                   ; 337d _ 75, 52
        call    task_now                                ; 337F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3384 _ 89. 45, F0
        sub     esp, 12                                 ; 3387 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 338A _ FF. 75, 08
        call    task_remove                             ; 338D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3392 _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 3395 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 339C _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 339F _ 3B. 45, F0
        jnz near      ?_191                                   ; 33a2 _ 75, 2d
        call    task_switchsub                          ; 33A4 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 33A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 33AE _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 33B1 _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 33B8 _ 83. 7D, F0, 00
        jz near       ?_191                                   ; 33bc _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 33BE _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 33C1 _ 8B. 00
        sub     esp, 8                                  ; 33C3 _ 83. EC, 08
        push    eax                                     ; 33C6 _ 50
        push    0                                       ; 33C7 _ 6A, 00
        call    farjmp                                  ; 33C9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33CE _ 83. C4, 10
?_191:  mov     eax, dword [ebp-0CH]                    ; 33D1 _ 8B. 45, F4
        leave                                           ; 33D4 _ C9
        ret                                             ; 33D5 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 33D6 _ 55
        mov     ebp, esp                                ; 33D7 _ 89. E5
        sub     esp, 16                                 ; 33D9 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 33DC _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 33E2 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 33E7 _ 8B. 10
        mov     eax, edx                                ; 33E9 _ 89. D0
        shl     eax, 2                                  ; 33EB _ C1. E0, 02
        add     eax, edx                                ; 33EE _ 01. D0
        shl     eax, 2                                  ; 33F0 _ C1. E0, 02
        add     eax, ecx                                ; 33F3 _ 01. C8
        add     eax, 8                                  ; 33F5 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 33F8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 33FB _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 33FE _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3401 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3404 _ 8B. 44 90, 08
        leave                                           ; 3408 _ C9
        ret                                             ; 3409 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 340A _ 55
        mov     ebp, esp                                ; 340B _ 89. E5
        sub     esp, 16                                 ; 340D _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3410 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 3416 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3419 _ 8B. 50, 0C
        mov     eax, edx                                ; 341C _ 89. D0
        shl     eax, 2                                  ; 341E _ C1. E0, 02
        add     eax, edx                                ; 3421 _ 01. D0
        shl     eax, 2                                  ; 3423 _ C1. E0, 02
        add     eax, ecx                                ; 3426 _ 01. C8
        add     eax, 8                                  ; 3428 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 342B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 342E _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 3431 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 3433 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 3436 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3439 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 343D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3440 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3442 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3445 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3448 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 344A _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 344D _ C7. 40, 04, 00000002
        nop                                             ; 3454 _ 90
        leave                                           ; 3455 _ C9
        ret                                             ; 3456 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 3457 _ 55
        mov     ebp, esp                                ; 3458 _ 89. E5
        sub     esp, 16                                 ; 345A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 345D _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 3463 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3466 _ 8B. 50, 0C
        mov     eax, edx                                ; 3469 _ 89. D0
        shl     eax, 2                                  ; 346B _ C1. E0, 02
        add     eax, edx                                ; 346E _ 01. D0
        shl     eax, 2                                  ; 3470 _ C1. E0, 02
        add     eax, ecx                                ; 3473 _ 01. C8
        add     eax, 8                                  ; 3475 _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 3478 _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 347B _ C7. 45, FC, 00000000
        jmp     ?_194                                   ; 3482 _ EB, 22

?_192:  mov     eax, dword [ebp-8H]                     ; 3484 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3487 _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 348A _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 348E _ 39. 45, 08
        jnz near      ?_193                                   ; 3491 _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 3493 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3496 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 3499 _ C7. 44 90, 08, 00000000
        jmp     ?_195                                   ; 34A1 _ EB, 0D

?_193:  inc     dword [ebp-4H]                          ; 34A3 _ FF. 45, FC
?_194:  mov     eax, dword [ebp-8H]                     ; 34A6 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 34A9 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 34AB _ 39. 45, FC
        jl      ?_192                                   ; 34AE _ 7C, D4
?_195:  mov     eax, dword [ebp-8H]                     ; 34B0 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 34B3 _ 8B. 00
        lea     edx, [eax-1H]                           ; 34B5 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 34B8 _ 8B. 45, F8
        mov     dword [eax], edx                        ; 34BB _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 34BD _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 34C0 _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 34C3 _ 39. 45, FC
        jge near      ?_196                                   ; 34c6 _ 7d, 0f
        mov     eax, dword [ebp-8H]                     ; 34C8 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 34CB _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 34CE _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 34D1 _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 34D4 _ 89. 50, 04
?_196:  mov     eax, dword [ebp-8H]                     ; 34D7 _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 34DA _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 34DD _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 34E0 _ 8B. 00
        cmp     edx, eax                                ; 34E2 _ 39. C2
        jl      ?_197                                   ; 34E4 _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 34E6 _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 34E9 _ C7. 40, 04, 00000000
?_197:  mov     eax, dword [ebp+8H]                     ; 34F0 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 34F3 _ C7. 40, 04, 00000001
        jmp     ?_199                                   ; 34FA _ EB, 1A

?_198:  mov     eax, dword [ebp-4H]                     ; 34FC _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 34FF _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 3502 _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 3505 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 3509 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 350C _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 350F _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 3513 _ FF. 45, FC
?_199:  mov     eax, dword [ebp-8H]                     ; 3516 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3519 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 351B _ 39. 45, FC
        jl      ?_198                                   ; 351E _ 7C, DC
        nop                                             ; 3520 _ 90
        leave                                           ; 3521 _ C9
        ret                                             ; 3522 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 3523 _ 55
        mov     ebp, esp                                ; 3524 _ 89. E5
        sub     esp, 16                                 ; 3526 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3529 _ C7. 45, FC, 00000000
        jmp     ?_201                                   ; 3530 _ EB, 21

?_200:  mov     ecx, dword [taskctl]                    ; 3532 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 3538 _ 8B. 55, FC
        mov     eax, edx                                ; 353B _ 89. D0
        shl     eax, 2                                  ; 353D _ C1. E0, 02
        add     eax, edx                                ; 3540 _ 01. D0
        shl     eax, 2                                  ; 3542 _ C1. E0, 02
        add     eax, ecx                                ; 3545 _ 01. C8
        add     eax, 8                                  ; 3547 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 354A _ 8B. 00
        test    eax, eax                                ; 354C _ 85. C0
        jg  near      ?_202                                   ; 354e _ 7f, 0b
        inc     dword [ebp-4H]                          ; 3550 _ FF. 45, FC
?_201:  cmp     dword [ebp-4H], 2                       ; 3553 _ 83. 7D, FC, 02
        jle near      ?_200                                   ; 3557 _ 7e, d9
        jmp     ?_203                                   ; 3559 _ EB, 01

?_202:  nop                                             ; 355B _ 90
?_203:  mov     eax, dword [taskctl]                    ; 355C _ A1, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 3561 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 3564 _ 89. 10
        mov     eax, dword [taskctl]                    ; 3566 _ A1, 000022A8(d)
        mov     dword [eax+4H], 0                       ; 356B _ C7. 40, 04, 00000000
        nop                                             ; 3572 _ 90
        leave                                           ; 3573 _ C9
        ret                                             ; 3574 _ C3
; task_switchsub End of function



?_204:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_205:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_206:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_207:                                                  ; byte
        db 41H, 00H                                     ; 0017 _ A.

?_208:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0019 _ 3[sec].

?_209:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0020 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0028 _ sk b.

?_210:                                                  ; byte
        db 42H, 00H                                     ; 002D _ B.

?_211:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002F _ page is:
        db 20H, 00H                                     ; 0037 _  .

?_212:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0039 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0041 _ L: .

?_213:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0045 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004D _ H: .

?_214:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0051 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0059 _ w: .



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

?_215:  db 00H                                          ; 0076 _ .

?_216:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1942:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1989:                                            ; byte
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

closebtn.2108:                                          ; byte
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

?_217:                                                  ; dword
        resb    2                                       ; 0004

?_218:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_219:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_220:  resd    1                                       ; 00EC

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

task_a.1861:                                            ; dword
        resd    4                                       ; 0250

tss_a.1860:                                             ; byte
        resb    128                                     ; 0260

tss_b.1859:                                             ; byte
        resb    104                                     ; 02E0

task_b.1845:                                            ; byte
        resb    12                                      ; 0348

str.2037:                                               ; byte
        resb    1                                       ; 0354

?_221:  resb    9                                       ; 0355

?_222:  resb    2                                       ; 035E

timerctl:                                               ; byte
        resd    1                                       ; 0360

?_223:                                                  ; byte
        resb    4                                       ; 0364

?_224:                                                  ; byte
        resb    4                                       ; 0368

?_225:                                                  ; byte
        resb    4                                       ; 036C

?_226:                                                  ; byte
        resb    7988                                    ; 0370

task_timer:                                             ; dword
        resd    1                                       ; 22A4

taskctl: resd   1                                       ; 22A8


