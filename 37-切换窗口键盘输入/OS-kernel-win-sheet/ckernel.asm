; Disassembly of file: ckernel.o
; Tue Feb  2 11:19:18 2021
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
        mov     eax, dword [?_221]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000011C(d)
        mov     ax, word [?_222]                        ; 002B _ 66: A1, 00000006(d)
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
        push    ?_208                                   ; 02B9 _ 68, 00000000(d)
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
        mov     dword [task_a.1863], eax                ; 0336 _ A3, 00000254(d)
        mov     eax, dword [task_a.1863]                ; 033B _ A1, 00000254(d)
        mov     dword [?_223], eax                      ; 0340 _ A3, 00000020(d)
        mov     eax, dword [task_a.1863]                ; 0345 _ A1, 00000254(d)
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
        mov     dword [ebp-18H], 196                    ; 0377 _ C7. 45, E8, 000000C4
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
        je near       ?_008                                   ; 03e4 _ 0f 84, 00000297
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
        push    ?_209                                   ; 0488 _ 68, 00000008(d)
        push    edx                                     ; 048D _ 52
        push    eax                                     ; 048E _ 50
        call    make_wtitle8                            ; 048F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0494 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0497 _ A1, 00000244(d)
        push    1                                       ; 049C _ 6A, 01
        push    ?_210                                   ; 049E _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04A3 _ FF. 75, BC
        push    eax                                     ; 04A6 _ 50
        call    make_wtitle8                            ; 04A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AC _ 83. C4, 10
        jmp     ?_005                                   ; 04AF _ EB, 3B

?_004:  mov     dword [ebp-20H], 0                      ; 04B1 _ C7. 45, E0, 00000000
        mov     edx, dword [shtMsgBox]                  ; 04B8 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 04BE _ A1, 00000244(d)
        push    1                                       ; 04C3 _ 6A, 01
        push    ?_209                                   ; 04C5 _ 68, 00000008(d)
        push    edx                                     ; 04CA _ 52
        push    eax                                     ; 04CB _ 50
        call    make_wtitle8                            ; 04CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04D4 _ A1, 00000244(d)
        push    0                                       ; 04D9 _ 6A, 00
        push    ?_210                                   ; 04DB _ 68, 0000000F(d)
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

?_006:  cmp     dword [ebp-20H], 0                      ; 0539 _ 83. 7D, E0, 00
        jne near      ?_007                                   ; 053d _ 0f 85, 0000010c
        mov     eax, dword [ebp-48H]                    ; 0543 _ 8B. 45, B8
        add     eax, keytable                           ; 0546 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 054B _ 8A. 00
        test    al, al                                  ; 054D _ 84. C0
        je near       ?_001                                   ; 054f _ 0f 84, fffffe37
        cmp     dword [ebp-0CH], 143                    ; 0555 _ 81. 7D, F4, 0000008F
        jg  near      ?_001                                   ; 055c _ 0f 8f, fffffe2a
        mov     eax, dword [ebp-0CH]                    ; 0562 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0565 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 0568 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 056D _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0570 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0575 _ 8B. 00
        sub     esp, 4                                  ; 0577 _ 83. EC, 04
        push    43                                      ; 057A _ 6A, 2B
        push    ecx                                     ; 057C _ 51
        push    28                                      ; 057D _ 6A, 1C
        push    dword [ebp-0CH]                         ; 057F _ FF. 75, F4
        push    7                                       ; 0582 _ 6A, 07
        push    edx                                     ; 0584 _ 52
        push    eax                                     ; 0585 _ 50
        call    boxfill8                                ; 0586 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 058B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 058E _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0591 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0594 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 059A _ A1, 00000244(d)
        sub     esp, 8                                  ; 059F _ 83. EC, 08
        push    44                                      ; 05A2 _ 6A, 2C
        push    ecx                                     ; 05A4 _ 51
        push    28                                      ; 05A5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05A7 _ FF. 75, F4
        push    edx                                     ; 05AA _ 52
        push    eax                                     ; 05AB _ 50
        call    sheet_refresh                           ; 05AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B1 _ 83. C4, 20
        mov     eax, dword [ebp-48H]                    ; 05B4 _ 8B. 45, B8
        add     eax, keytable                           ; 05B7 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 05BC _ 8A. 00
        mov     byte [ebp-5EH], al                      ; 05BE _ 88. 45, A2
        mov     byte [ebp-5DH], 0                       ; 05C1 _ C6. 45, A3, 00
        mov     edx, dword [shtMsgBox]                  ; 05C5 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 05CB _ A1, 00000244(d)
        sub     esp, 8                                  ; 05D0 _ 83. EC, 08
        lea     ecx, [ebp-5EH]                          ; 05D3 _ 8D. 4D, A2
        push    ecx                                     ; 05D6 _ 51
        push    0                                       ; 05D7 _ 6A, 00
        push    28                                      ; 05D9 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05DB _ FF. 75, F4
        push    edx                                     ; 05DE _ 52
        push    eax                                     ; 05DF _ 50
        call    showString                              ; 05E0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05E5 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 05E8 _ 83. 45, F4, 08
        mov     dword [ebp-1CH], 1                      ; 05EC _ C7. 45, E4, 00000001
        mov     eax, dword [ebp-0CH]                    ; 05F3 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 05F6 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 05F9 _ 8B. 45, F0
        movzx   ecx, al                                 ; 05FC _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 05FF _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0604 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0607 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 060C _ 8B. 00
        sub     esp, 4                                  ; 060E _ 83. EC, 04
        push    43                                      ; 0611 _ 6A, 2B
        push    ebx                                     ; 0613 _ 53
        push    28                                      ; 0614 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0616 _ FF. 75, F4
        push    ecx                                     ; 0619 _ 51
        push    edx                                     ; 061A _ 52
        push    eax                                     ; 061B _ 50
        call    boxfill8                                ; 061C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0621 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0624 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0627 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 062A _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0630 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0635 _ 83. EC, 08
        push    44                                      ; 0638 _ 6A, 2C
        push    ecx                                     ; 063A _ 51
        push    28                                      ; 063B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 063D _ FF. 75, F4
        push    edx                                     ; 0640 _ 52
        push    eax                                     ; 0641 _ 50
        call    sheet_refresh                           ; 0642 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0647 _ 83. C4, 20
        jmp     ?_001                                   ; 064A _ E9, FFFFFD3D

?_007:  mov     eax, dword [task_a.1863]                ; 064F _ A1, 00000254(d)
        sub     esp, 12                                 ; 0654 _ 83. EC, 0C
        push    eax                                     ; 0657 _ 50
        call    task_sleep                              ; 0658 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 065D _ 83. C4, 10
        mov     eax, dword [ebp-48H]                    ; 0660 _ 8B. 45, B8
        movzx   eax, al                                 ; 0663 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0666 _ 8B. 15, 00000250(d)
        add     edx, 16                                 ; 066C _ 83. C2, 10
        sub     esp, 8                                  ; 066F _ 83. EC, 08
        push    eax                                     ; 0672 _ 50
        push    edx                                     ; 0673 _ 52
        call    fifo8_put                               ; 0674 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0679 _ 83. C4, 10
        jmp     ?_001                                   ; 067C _ E9, FFFFFD0B

?_008:  sub     esp, 12                                 ; 0681 _ 83. EC, 0C
        push    mouseinfo                               ; 0684 _ 68, 00000024(d)
        call    fifo8_status                            ; 0689 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068E _ 83. C4, 10
        test    eax, eax                                ; 0691 _ 85. C0
        jz near       ?_009                                   ; 0693 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 0695 _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 069B _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 06A1 _ A1, 00000244(d)
        sub     esp, 4                                  ; 06A6 _ 83. EC, 04
        push    ecx                                     ; 06A9 _ 51
        push    edx                                     ; 06AA _ 52
        push    eax                                     ; 06AB _ 50
        call    show_mouse_info                         ; 06AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B1 _ 83. C4, 10
        jmp     ?_001                                   ; 06B4 _ E9, FFFFFCD3

?_009:  sub     esp, 12                                 ; 06B9 _ 83. EC, 0C
        push    timerinfo                               ; 06BC _ 68, 000000F0(d)
        call    fifo8_status                            ; 06C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06C6 _ 83. C4, 10
        test    eax, eax                                ; 06C9 _ 85. C0
        je near       ?_001                                   ; 06cb _ 0f 84, fffffcbb
        call    io_sti                                  ; 06D1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06D6 _ 83. EC, 0C
        push    timerinfo                               ; 06D9 _ 68, 000000F0(d)
        call    fifo8_get                               ; 06DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06E3 _ 83. C4, 10
        mov     dword [ebp-50H], eax                    ; 06E6 _ 89. 45, B0
        cmp     dword [ebp-50H], 10                     ; 06E9 _ 83. 7D, B0, 0A
        jnz near      ?_010                                   ; 06ed _ 75, 43
        sub     esp, 8                                  ; 06EF _ 83. EC, 08
        push    100                                     ; 06F2 _ 6A, 64
        push    dword [ebp-28H]                         ; 06F4 _ FF. 75, D8
        call    timer_settime                           ; 06F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06FC _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 06FF _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 0703 _ 83. 7D, E8, 28
        jle near      ?_001                                   ; 0707 _ 0f 8e, fffffc7f
        cmp     dword [ebp-1CH], 0                      ; 070D _ 83. 7D, E4, 00
        jne near      ?_001                                   ; 0711 _ 0f 85, fffffc75
        call    io_cli                                  ; 0717 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1863]                ; 071C _ A1, 00000254(d)
        sub     esp, 12                                 ; 0721 _ 83. EC, 0C
        push    eax                                     ; 0724 _ 50
        call    task_sleep                              ; 0725 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 072A _ 83. C4, 10
        jmp     ?_001                                   ; 072D _ E9, FFFFFC5A

?_010:  cmp     dword [ebp-50H], 2                      ; 0732 _ 83. 7D, B0, 02
        jnz near      ?_011                                   ; 0736 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0738 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 073E _ A1, 00000244(d)
        sub     esp, 8                                  ; 0743 _ 83. EC, 08
        push    ?_211                                   ; 0746 _ 68, 00000017(d)
        push    7                                       ; 074B _ 6A, 07
        push    32                                      ; 074D _ 6A, 20
        push    0                                       ; 074F _ 6A, 00
        push    edx                                     ; 0751 _ 52
        push    eax                                     ; 0752 _ 50
        call    showString                              ; 0753 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0758 _ 83. C4, 20
        jmp     ?_001                                   ; 075B _ E9, FFFFFC2C

?_011:  cmp     dword [ebp-50H], 0                      ; 0760 _ 83. 7D, B0, 00
        jz near       ?_012                                   ; 0764 _ 74, 1e
        sub     esp, 4                                  ; 0766 _ 83. EC, 04
        push    0                                       ; 0769 _ 6A, 00
        push    timerinfo                               ; 076B _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0770 _ FF. 75, D0
        call    timer_init                              ; 0773 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0778 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 077B _ C7. 45, F0, 00000000
        jmp     ?_013                                   ; 0782 _ EB, 1C

?_012:  sub     esp, 4                                  ; 0784 _ 83. EC, 04
        push    1                                       ; 0787 _ 6A, 01
        push    timerinfo                               ; 0789 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 078E _ FF. 75, D0
        call    timer_init                              ; 0791 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0796 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0799 _ C7. 45, F0, 00000007
?_013:  sub     esp, 8                                  ; 07A0 _ 83. EC, 08
        push    50                                      ; 07A3 _ 6A, 32
        push    dword [ebp-30H]                         ; 07A5 _ FF. 75, D0
        call    timer_settime                           ; 07A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AD _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 07B0 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 07B3 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 07B6 _ 8B. 45, F0
        movzx   ecx, al                                 ; 07B9 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 07BC _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 07C1 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 07C4 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 07C9 _ 8B. 00
        sub     esp, 4                                  ; 07CB _ 83. EC, 04
        push    43                                      ; 07CE _ 6A, 2B
        push    ebx                                     ; 07D0 _ 53
        push    28                                      ; 07D1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07D3 _ FF. 75, F4
        push    ecx                                     ; 07D6 _ 51
        push    edx                                     ; 07D7 _ 52
        push    eax                                     ; 07D8 _ 50
        call    boxfill8                                ; 07D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07DE _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 07E1 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 07E4 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 07E7 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 07ED _ A1, 00000244(d)
        sub     esp, 8                                  ; 07F2 _ 83. EC, 08
        push    44                                      ; 07F5 _ 6A, 2C
        push    ecx                                     ; 07F7 _ 51
        push    28                                      ; 07F8 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07FA _ FF. 75, F4
        push    edx                                     ; 07FD _ 52
        push    eax                                     ; 07FE _ 50
        call    sheet_refresh                           ; 07FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0804 _ 83. C4, 20
        jmp     ?_001                                   ; 0807 _ E9, FFFFFB80
; CMain End of function

launch_console:; Function begin
        push    ebp                                     ; 080C _ 55
        mov     ebp, esp                                ; 080D _ 89. E5
        sub     esp, 24                                 ; 080F _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 0812 _ A1, 00000244(d)
        sub     esp, 12                                 ; 0817 _ 83. EC, 0C
        push    eax                                     ; 081A _ 50
        call    sheet_alloc                             ; 081B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0820 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0823 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0826 _ A1, 00000000(d)
        sub     esp, 8                                  ; 082B _ 83. EC, 08
        push    42240                                   ; 082E _ 68, 0000A500
        push    eax                                     ; 0833 _ 50
        call    memman_alloc_4k                         ; 0834 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0839 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 083C _ 89. 45, F0
        sub     esp, 12                                 ; 083F _ 83. EC, 0C
        push    99                                      ; 0842 _ 6A, 63
        push    165                                     ; 0844 _ 68, 000000A5
        push    256                                     ; 0849 _ 68, 00000100
        push    dword [ebp-10H]                         ; 084E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0851 _ FF. 75, F4
        call    sheet_setbuf                            ; 0854 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0859 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 085C _ A1, 00000244(d)
        push    0                                       ; 0861 _ 6A, 00
        push    ?_210                                   ; 0863 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0868 _ FF. 75, F4
        push    eax                                     ; 086B _ 50
        call    make_window8                            ; 086C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0871 _ 83. C4, 10
        sub     esp, 8                                  ; 0874 _ 83. EC, 08
        push    0                                       ; 0877 _ 6A, 00
        push    128                                     ; 0879 _ 68, 00000080
        push    240                                     ; 087E _ 68, 000000F0
        push    28                                      ; 0883 _ 6A, 1C
        push    8                                       ; 0885 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0887 _ FF. 75, F4
        call    make_textbox8                           ; 088A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 088F _ 83. C4, 20
        call    task_alloc                              ; 0892 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0897 _ 89. 45, EC
        call    get_code32_addr                         ; 089A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 089F _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 08A2 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 08A5 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 08AC _ 8B. 45, EC
        mov     dword [eax+78H], 1073741824             ; 08AF _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-18H]                    ; 08B6 _ 8B. 45, E8
        neg     eax                                     ; 08B9 _ F7. D8
        add     eax, console_task                       ; 08BB _ 05, 00000000(d)
        mov     edx, eax                                ; 08C0 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 08C2 _ 8B. 45, EC
        mov     dword [eax+34H], edx                    ; 08C5 _ 89. 50, 34
        mov     eax, dword [ebp-14H]                    ; 08C8 _ 8B. 45, EC
        mov     dword [eax+5CH], 0                      ; 08CB _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-14H]                    ; 08D2 _ 8B. 45, EC
        mov     dword [eax+60H], 8                      ; 08D5 _ C7. 40, 60, 00000008
        mov     eax, dword [ebp-14H]                    ; 08DC _ 8B. 45, EC
        mov     dword [eax+64H], 32                     ; 08DF _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-14H]                    ; 08E6 _ 8B. 45, EC
        mov     dword [eax+68H], 24                     ; 08E9 _ C7. 40, 68, 00000018
        mov     eax, dword [ebp-14H]                    ; 08F0 _ 8B. 45, EC
        mov     dword [eax+6CH], 0                      ; 08F3 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-14H]                    ; 08FA _ 8B. 45, EC
        mov     dword [eax+70H], 16                     ; 08FD _ C7. 40, 70, 00000010
        mov     eax, dword [ebp-14H]                    ; 0904 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0907 _ 8B. 40, 4C
        lea     edx, [eax-8H]                           ; 090A _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 090D _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0910 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0913 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0916 _ 8B. 40, 4C
        add     eax, 4                                  ; 0919 _ 83. C0, 04
        mov     edx, eax                                ; 091C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 091E _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0921 _ 89. 02
        sub     esp, 4                                  ; 0923 _ 83. EC, 04
        push    5                                       ; 0926 _ 6A, 05
        push    1                                       ; 0928 _ 6A, 01
        push    dword [ebp-14H]                         ; 092A _ FF. 75, EC
        call    task_run                                ; 092D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0932 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0935 _ A1, 00000244(d)
        push    4                                       ; 093A _ 6A, 04
        push    32                                      ; 093C _ 6A, 20
        push    dword [ebp-0CH]                         ; 093E _ FF. 75, F4
        push    eax                                     ; 0941 _ 50
        call    sheet_slide                             ; 0942 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0947 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 094A _ A1, 00000244(d)
        sub     esp, 4                                  ; 094F _ 83. EC, 04
        push    1                                       ; 0952 _ 6A, 01
        push    dword [ebp-0CH]                         ; 0954 _ FF. 75, F4
        push    eax                                     ; 0957 _ 50
        call    sheet_updown                            ; 0958 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095D _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0960 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0963 _ A3, 00000250(d)
        mov     eax, dword [ebp-0CH]                    ; 0968 _ 8B. 45, F4
        leave                                           ; 096B _ C9
        ret                                             ; 096C _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 096D _ 55
        mov     ebp, esp                                ; 096E _ 89. E5
        push    ebx                                     ; 0970 _ 53
        sub     esp, 548                                ; 0971 _ 81. EC, 00000224
        call    task_now                                ; 0977 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 097C _ 89. 45, EC
        mov     dword [ebp-0CH], 16                     ; 097F _ C7. 45, F4, 00000010
        mov     dword [ebp-10H], 0                      ; 0986 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp-14H]                    ; 098D _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0990 _ 8D. 50, 10
        push    dword [ebp-14H]                         ; 0993 _ FF. 75, EC
        lea     eax, [ebp-220H]                         ; 0996 _ 8D. 85, FFFFFDE0
        push    eax                                     ; 099C _ 50
        push    128                                     ; 099D _ 68, 00000080
        push    edx                                     ; 09A2 _ 52
        call    fifo8_init                              ; 09A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A8 _ 83. C4, 10
        call    timer_alloc                             ; 09AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 09B0 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 09B3 _ 8B. 45, EC
        add     eax, 16                                 ; 09B6 _ 83. C0, 10
        sub     esp, 4                                  ; 09B9 _ 83. EC, 04
        push    1                                       ; 09BC _ 6A, 01
        push    eax                                     ; 09BE _ 50
        push    dword [ebp-18H]                         ; 09BF _ FF. 75, E8
        call    timer_init                              ; 09C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C7 _ 83. C4, 10
        sub     esp, 8                                  ; 09CA _ 83. EC, 08
        push    50                                      ; 09CD _ 6A, 32
        push    dword [ebp-18H]                         ; 09CF _ FF. 75, E8
        call    timer_settime                           ; 09D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09D7 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 09DA _ A1, 00000244(d)
        sub     esp, 8                                  ; 09DF _ 83. EC, 08
        push    ?_212                                   ; 09E2 _ 68, 0000001E(d)
        push    7                                       ; 09E7 _ 6A, 07
        push    28                                      ; 09E9 _ 6A, 1C
        push    8                                       ; 09EB _ 6A, 08
        push    dword [ebp+8H]                          ; 09ED _ FF. 75, 08
        push    eax                                     ; 09F0 _ 50
        call    showString                              ; 09F1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09F6 _ 83. C4, 20
?_014:  call    io_cli                                  ; 09F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 09FE _ 8B. 45, EC
        add     eax, 16                                 ; 0A01 _ 83. C0, 10
        sub     esp, 12                                 ; 0A04 _ 83. EC, 0C
        push    eax                                     ; 0A07 _ 50
        call    fifo8_status                            ; 0A08 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0D _ 83. C4, 10
        test    eax, eax                                ; 0A10 _ 85. C0
        jnz near      ?_015                                   ; 0a12 _ 75, 07
        call    io_sti                                  ; 0A14 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0A19 _ EB, DE

?_015:  mov     eax, dword [ebp-14H]                    ; 0A1B _ 8B. 45, EC
        add     eax, 16                                 ; 0A1E _ 83. C0, 10
        sub     esp, 12                                 ; 0A21 _ 83. EC, 0C
        push    eax                                     ; 0A24 _ 50
        call    fifo8_get                               ; 0A25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A2A _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0A2D _ 89. 45, E4
        call    io_sti                                  ; 0A30 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 1                      ; 0A35 _ 83. 7D, E4, 01
        jg  near      ?_018                                   ; 0a39 _ 7f, 59
        cmp     dword [ebp-1CH], 0                      ; 0A3B _ 83. 7D, E4, 00
        jz near       ?_016                                   ; 0a3f _ 74, 20
        mov     eax, dword [ebp-14H]                    ; 0A41 _ 8B. 45, EC
        add     eax, 16                                 ; 0A44 _ 83. C0, 10
        sub     esp, 4                                  ; 0A47 _ 83. EC, 04
        push    0                                       ; 0A4A _ 6A, 00
        push    eax                                     ; 0A4C _ 50
        push    dword [ebp-18H]                         ; 0A4D _ FF. 75, E8
        call    timer_init                              ; 0A50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A55 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0A58 _ C7. 45, F0, 00000007
        jmp     ?_017                                   ; 0A5F _ EB, 1E

?_016:  mov     eax, dword [ebp-14H]                    ; 0A61 _ 8B. 45, EC
        add     eax, 16                                 ; 0A64 _ 83. C0, 10
        sub     esp, 4                                  ; 0A67 _ 83. EC, 04
        push    1                                       ; 0A6A _ 6A, 01
        push    eax                                     ; 0A6C _ 50
        push    dword [ebp-18H]                         ; 0A6D _ FF. 75, E8
        call    timer_init                              ; 0A70 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A75 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0A78 _ C7. 45, F0, 00000000
?_017:  sub     esp, 8                                  ; 0A7F _ 83. EC, 08
        push    50                                      ; 0A82 _ 6A, 32
        push    dword [ebp-18H]                         ; 0A84 _ FF. 75, E8
        call    timer_settime                           ; 0A87 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A8C _ 83. C4, 10
        jmp     ?_020                                   ; 0A8F _ E9, 00000154

?_018:  cmp     dword [ebp-1CH], 14                     ; 0A94 _ 83. 7D, E4, 0E
        jne near      ?_019                                   ; 0a98 _ 0f 85, 000000a7
        cmp     dword [ebp-0CH], 8                      ; 0A9E _ 83. 7D, F4, 08
        jle near      ?_019                                   ; 0aa2 _ 0f 8e, 0000009d
        mov     eax, dword [ebp-0CH]                    ; 0AA8 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0AAB _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0AAE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AB1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0AB4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0AB7 _ 8B. 00
        sub     esp, 4                                  ; 0AB9 _ 83. EC, 04
        push    43                                      ; 0ABC _ 6A, 2B
        push    ecx                                     ; 0ABE _ 51
        push    28                                      ; 0ABF _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0AC1 _ FF. 75, F4
        push    0                                       ; 0AC4 _ 6A, 00
        push    edx                                     ; 0AC6 _ 52
        push    eax                                     ; 0AC7 _ 50
        call    boxfill8                                ; 0AC8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ACD _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0AD0 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0AD3 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0AD6 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0ADB _ 83. EC, 08
        push    44                                      ; 0ADE _ 6A, 2C
        push    edx                                     ; 0AE0 _ 52
        push    28                                      ; 0AE1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0AE3 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0AE6 _ FF. 75, 08
        push    eax                                     ; 0AE9 _ 50
        call    sheet_refresh                           ; 0AEA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AEF _ 83. C4, 20
        sub     dword [ebp-0CH], 8                      ; 0AF2 _ 83. 6D, F4, 08
        mov     eax, dword [ebp-0CH]                    ; 0AF6 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0AF9 _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0AFC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0AFF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B02 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0B05 _ 8B. 00
        sub     esp, 4                                  ; 0B07 _ 83. EC, 04
        push    43                                      ; 0B0A _ 6A, 2B
        push    ecx                                     ; 0B0C _ 51
        push    28                                      ; 0B0D _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0B0F _ FF. 75, F4
        push    0                                       ; 0B12 _ 6A, 00
        push    edx                                     ; 0B14 _ 52
        push    eax                                     ; 0B15 _ 50
        call    boxfill8                                ; 0B16 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B1B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0B1E _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0B21 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0B24 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0B29 _ 83. EC, 08
        push    44                                      ; 0B2C _ 6A, 2C
        push    edx                                     ; 0B2E _ 52
        push    28                                      ; 0B2F _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0B31 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0B34 _ FF. 75, 08
        push    eax                                     ; 0B37 _ 50
        call    sheet_refresh                           ; 0B38 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B3D _ 83. C4, 20
        jmp     ?_020                                   ; 0B40 _ E9, 000000A3

?_019:  cmp     dword [ebp-0CH], 239                    ; 0B45 _ 81. 7D, F4, 000000EF
        jg  near      ?_020                                   ; 0b4c _ 0f 8f, 00000096
        cmp     dword [ebp-1CH], 83                     ; 0B52 _ 83. 7D, E4, 53
        jg  near      ?_020                                   ; 0b56 _ 0f 8f, 0000008c
        mov     eax, dword [ebp-1CH]                    ; 0B5C _ 8B. 45, E4
        add     eax, keytable                           ; 0B5F _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0B64 _ 8A. 00
        test    al, al                                  ; 0B66 _ 84. C0
        jz near       ?_020                                   ; 0b68 _ 74, 7e
        mov     eax, dword [ebp-0CH]                    ; 0B6A _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0B6D _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0B70 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0B73 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0B76 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0B79 _ 8B. 00
        sub     esp, 4                                  ; 0B7B _ 83. EC, 04
        push    43                                      ; 0B7E _ 6A, 2B
        push    ecx                                     ; 0B80 _ 51
        push    28                                      ; 0B81 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0B83 _ FF. 75, F4
        push    0                                       ; 0B86 _ 6A, 00
        push    edx                                     ; 0B88 _ 52
        push    eax                                     ; 0B89 _ 50
        call    boxfill8                                ; 0B8A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B8F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0B92 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0B95 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0B98 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0B9D _ 83. EC, 08
        push    44                                      ; 0BA0 _ 6A, 2C
        push    edx                                     ; 0BA2 _ 52
        push    28                                      ; 0BA3 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0BA5 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0BA8 _ FF. 75, 08
        push    eax                                     ; 0BAB _ 50
        call    sheet_refresh                           ; 0BAC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BB1 _ 83. C4, 20
        mov     eax, dword [ebp-1CH]                    ; 0BB4 _ 8B. 45, E4
        add     eax, keytable                           ; 0BB7 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0BBC _ 8A. 00
        mov     byte [ebp-1EH], al                      ; 0BBE _ 88. 45, E2
        mov     byte [ebp-1DH], 0                       ; 0BC1 _ C6. 45, E3, 00
        mov     eax, dword [shtctl]                     ; 0BC5 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0BCA _ 83. EC, 08
        lea     edx, [ebp-1EH]                          ; 0BCD _ 8D. 55, E2
        push    edx                                     ; 0BD0 _ 52
        push    7                                       ; 0BD1 _ 6A, 07
        push    28                                      ; 0BD3 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0BD5 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0BD8 _ FF. 75, 08
        push    eax                                     ; 0BDB _ 50
        call    showString                              ; 0BDC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BE1 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0BE4 _ 83. 45, F4, 08
?_020:  mov     eax, dword [ebp-0CH]                    ; 0BE8 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0BEB _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0BEE _ 8B. 45, F0
        movzx   ecx, al                                 ; 0BF1 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 0BF4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0BF7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BFA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0BFD _ 8B. 00
        sub     esp, 4                                  ; 0BFF _ 83. EC, 04
        push    43                                      ; 0C02 _ 6A, 2B
        push    ebx                                     ; 0C04 _ 53
        push    28                                      ; 0C05 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C07 _ FF. 75, F4
        push    ecx                                     ; 0C0A _ 51
        push    edx                                     ; 0C0B _ 52
        push    eax                                     ; 0C0C _ 50
        call    boxfill8                                ; 0C0D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C12 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0C15 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0C18 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0C1B _ A1, 00000244(d)
        sub     esp, 8                                  ; 0C20 _ 83. EC, 08
        push    44                                      ; 0C23 _ 6A, 2C
        push    edx                                     ; 0C25 _ 52
        push    28                                      ; 0C26 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C28 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0C2B _ FF. 75, 08
        push    eax                                     ; 0C2E _ 50
        call    sheet_refresh                           ; 0C2F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C34 _ 83. C4, 20
        jmp     ?_014                                   ; 0C37 _ E9, FFFFFDBD
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 0C3C _ 55
        mov     ebp, esp                                ; 0C3D _ 89. E5
        sub     esp, 72                                 ; 0C3F _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0C42 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0C48 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0C4D _ 83. EC, 08
        push    ?_213                                   ; 0C50 _ 68, 00000020(d)
        push    7                                       ; 0C55 _ 6A, 07
        push    160                                     ; 0C57 _ 68, 000000A0
        push    0                                       ; 0C5C _ 6A, 00
        push    edx                                     ; 0C5E _ 52
        push    eax                                     ; 0C5F _ 50
        call    showString                              ; 0C60 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C65 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0C68 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0C6F _ C7. 45, E8, 00000000
        push    0                                       ; 0C76 _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 0C78 _ 8D. 45, C4
        push    eax                                     ; 0C7B _ 50
        push    8                                       ; 0C7C _ 6A, 08
        lea     eax, [ebp-34H]                          ; 0C7E _ 8D. 45, CC
        push    eax                                     ; 0C81 _ 50
        call    fifo8_init                              ; 0C82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C87 _ 83. C4, 10
        call    timer_alloc                             ; 0C8A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0C8F _ 89. 45, EC
        sub     esp, 4                                  ; 0C92 _ 83. EC, 04
        push    123                                     ; 0C95 _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0C97 _ 8D. 45, CC
        push    eax                                     ; 0C9A _ 50
        push    dword [ebp-14H]                         ; 0C9B _ FF. 75, EC
        call    timer_init                              ; 0C9E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA3 _ 83. C4, 10
        sub     esp, 8                                  ; 0CA6 _ 83. EC, 08
        push    100                                     ; 0CA9 _ 6A, 64
        push    dword [ebp-14H]                         ; 0CAB _ FF. 75, EC
        call    timer_settime                           ; 0CAE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB3 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0CB6 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0CBD _ C7. 45, F0, 00000000
?_021:  inc     dword [ebp-0CH]                         ; 0CC4 _ FF. 45, F4
        call    io_cli                                  ; 0CC7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0CCC _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0CCF _ 8D. 45, CC
        push    eax                                     ; 0CD2 _ 50
        call    fifo8_status                            ; 0CD3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD8 _ 83. C4, 10
        test    eax, eax                                ; 0CDB _ 85. C0
        jnz near      ?_022                                   ; 0cdd _ 75, 07
        call    io_sti                                  ; 0CDF _ E8, FFFFFFFC(rel)
        jmp     ?_021                                   ; 0CE4 _ EB, DE

?_022:  sub     esp, 12                                 ; 0CE6 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0CE9 _ 8D. 45, CC
        push    eax                                     ; 0CEC _ 50
        call    fifo8_get                               ; 0CED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CF2 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0CF5 _ 89. 45, E8
        call    io_sti                                  ; 0CF8 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0CFD _ 83. 7D, E8, 7B
        jnz near      ?_021                                   ; 0d01 _ 75, c1
        mov     edx, dword [sht_back]                   ; 0D03 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0D09 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0D0E _ 83. EC, 08
        push    ?_214                                   ; 0D11 _ 68, 0000002D(d)
        push    7                                       ; 0D16 _ 6A, 07
        push    192                                     ; 0D18 _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0D1D _ FF. 75, F0
        push    edx                                     ; 0D20 _ 52
        push    eax                                     ; 0D21 _ 50
        call    showString                              ; 0D22 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D27 _ 83. C4, 20
        sub     esp, 8                                  ; 0D2A _ 83. EC, 08
        push    100                                     ; 0D2D _ 6A, 64
        push    dword [ebp-14H]                         ; 0D2F _ FF. 75, EC
        call    timer_settime                           ; 0D32 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D37 _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0D3A _ 83. 45, F0, 08
        jmp     ?_021                                   ; 0D3E _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0D40 _ 55
        mov     ebp, esp                                ; 0D41 _ 89. E5
        push    ebx                                     ; 0D43 _ 53
        sub     esp, 4                                  ; 0D44 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0D47 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0D4A _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0D4D _ 8B. 45, 0C
        dec     eax                                     ; 0D50 _ 48
        sub     esp, 4                                  ; 0D51 _ 83. EC, 04
        push    edx                                     ; 0D54 _ 52
        push    eax                                     ; 0D55 _ 50
        push    0                                       ; 0D56 _ 6A, 00
        push    0                                       ; 0D58 _ 6A, 00
        push    14                                      ; 0D5A _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0D5C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D5F _ FF. 75, 08
        call    boxfill8                                ; 0D62 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D67 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0D6A _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0D6D _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0D70 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D73 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0D76 _ 8B. 45, 10
        sub     eax, 28                                 ; 0D79 _ 83. E8, 1C
        sub     esp, 4                                  ; 0D7C _ 83. EC, 04
        push    ecx                                     ; 0D7F _ 51
        push    edx                                     ; 0D80 _ 52
        push    eax                                     ; 0D81 _ 50
        push    0                                       ; 0D82 _ 6A, 00
        push    8                                       ; 0D84 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0D86 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D89 _ FF. 75, 08
        call    boxfill8                                ; 0D8C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D91 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0D94 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0D97 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0D9A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0D9D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0DA0 _ 8B. 45, 10
        sub     eax, 27                                 ; 0DA3 _ 83. E8, 1B
        sub     esp, 4                                  ; 0DA6 _ 83. EC, 04
        push    ecx                                     ; 0DA9 _ 51
        push    edx                                     ; 0DAA _ 52
        push    eax                                     ; 0DAB _ 50
        push    0                                       ; 0DAC _ 6A, 00
        push    7                                       ; 0DAE _ 6A, 07
        push    dword [ebp+0CH]                         ; 0DB0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DB3 _ FF. 75, 08
        call    boxfill8                                ; 0DB6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DBB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0DBE _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0DC1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0DC4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0DC7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0DCA _ 8B. 45, 10
        sub     eax, 26                                 ; 0DCD _ 83. E8, 1A
        sub     esp, 4                                  ; 0DD0 _ 83. EC, 04
        push    ecx                                     ; 0DD3 _ 51
        push    edx                                     ; 0DD4 _ 52
        push    eax                                     ; 0DD5 _ 50
        push    0                                       ; 0DD6 _ 6A, 00
        push    8                                       ; 0DD8 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0DDA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DDD _ FF. 75, 08
        call    boxfill8                                ; 0DE0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DE5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0DE8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0DEB _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0DEE _ 8B. 45, 10
        sub     eax, 24                                 ; 0DF1 _ 83. E8, 18
        sub     esp, 4                                  ; 0DF4 _ 83. EC, 04
        push    edx                                     ; 0DF7 _ 52
        push    59                                      ; 0DF8 _ 6A, 3B
        push    eax                                     ; 0DFA _ 50
        push    3                                       ; 0DFB _ 6A, 03
        push    7                                       ; 0DFD _ 6A, 07
        push    dword [ebp+0CH]                         ; 0DFF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E02 _ FF. 75, 08
        call    boxfill8                                ; 0E05 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E0A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E0D _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E10 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E13 _ 8B. 45, 10
        sub     eax, 24                                 ; 0E16 _ 83. E8, 18
        sub     esp, 4                                  ; 0E19 _ 83. EC, 04
        push    edx                                     ; 0E1C _ 52
        push    2                                       ; 0E1D _ 6A, 02
        push    eax                                     ; 0E1F _ 50
        push    2                                       ; 0E20 _ 6A, 02
        push    7                                       ; 0E22 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0E24 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E27 _ FF. 75, 08
        call    boxfill8                                ; 0E2A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E2F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E32 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0E35 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0E38 _ 8B. 45, 10
        sub     eax, 4                                  ; 0E3B _ 83. E8, 04
        sub     esp, 4                                  ; 0E3E _ 83. EC, 04
        push    edx                                     ; 0E41 _ 52
        push    59                                      ; 0E42 _ 6A, 3B
        push    eax                                     ; 0E44 _ 50
        push    3                                       ; 0E45 _ 6A, 03
        push    15                                      ; 0E47 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0E49 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E4C _ FF. 75, 08
        call    boxfill8                                ; 0E4F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E54 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E57 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0E5A _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0E5D _ 8B. 45, 10
        sub     eax, 23                                 ; 0E60 _ 83. E8, 17
        sub     esp, 4                                  ; 0E63 _ 83. EC, 04
        push    edx                                     ; 0E66 _ 52
        push    59                                      ; 0E67 _ 6A, 3B
        push    eax                                     ; 0E69 _ 50
        push    59                                      ; 0E6A _ 6A, 3B
        push    15                                      ; 0E6C _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0E6E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E71 _ FF. 75, 08
        call    boxfill8                                ; 0E74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E79 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E7C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E7F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0E82 _ 8B. 45, 10
        sub     eax, 3                                  ; 0E85 _ 83. E8, 03
        sub     esp, 4                                  ; 0E88 _ 83. EC, 04
        push    edx                                     ; 0E8B _ 52
        push    59                                      ; 0E8C _ 6A, 3B
        push    eax                                     ; 0E8E _ 50
        push    2                                       ; 0E8F _ 6A, 02
        push    0                                       ; 0E91 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0E93 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E96 _ FF. 75, 08
        call    boxfill8                                ; 0E99 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E9E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EA1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0EA4 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0EA7 _ 8B. 45, 10
        sub     eax, 24                                 ; 0EAA _ 83. E8, 18
        sub     esp, 4                                  ; 0EAD _ 83. EC, 04
        push    edx                                     ; 0EB0 _ 52
        push    60                                      ; 0EB1 _ 6A, 3C
        push    eax                                     ; 0EB3 _ 50
        push    60                                      ; 0EB4 _ 6A, 3C
        push    0                                       ; 0EB6 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0EB8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EBB _ FF. 75, 08
        call    boxfill8                                ; 0EBE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EC3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EC6 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0EC9 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0ECC _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0ECF _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0ED2 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0ED5 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0ED8 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0EDB _ 83. E8, 2F
        sub     esp, 4                                  ; 0EDE _ 83. EC, 04
        push    ebx                                     ; 0EE1 _ 53
        push    ecx                                     ; 0EE2 _ 51
        push    edx                                     ; 0EE3 _ 52
        push    eax                                     ; 0EE4 _ 50
        push    15                                      ; 0EE5 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0EE7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EEA _ FF. 75, 08
        call    boxfill8                                ; 0EED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EF5 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0EF8 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0EFB _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0EFE _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0F01 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0F04 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0F07 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0F0A _ 83. E8, 2F
        sub     esp, 4                                  ; 0F0D _ 83. EC, 04
        push    ebx                                     ; 0F10 _ 53
        push    ecx                                     ; 0F11 _ 51
        push    edx                                     ; 0F12 _ 52
        push    eax                                     ; 0F13 _ 50
        push    15                                      ; 0F14 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0F16 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F19 _ FF. 75, 08
        call    boxfill8                                ; 0F1C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F21 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F24 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0F27 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0F2A _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0F2D _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0F30 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F33 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0F36 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0F39 _ 83. E8, 2F
        sub     esp, 4                                  ; 0F3C _ 83. EC, 04
        push    ebx                                     ; 0F3F _ 53
        push    ecx                                     ; 0F40 _ 51
        push    edx                                     ; 0F41 _ 52
        push    eax                                     ; 0F42 _ 50
        push    7                                       ; 0F43 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F45 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F48 _ FF. 75, 08
        call    boxfill8                                ; 0F4B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F50 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F53 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0F56 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0F59 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0F5C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0F5F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F62 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F65 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0F68 _ 83. E8, 03
        sub     esp, 4                                  ; 0F6B _ 83. EC, 04
        push    ebx                                     ; 0F6E _ 53
        push    ecx                                     ; 0F6F _ 51
        push    edx                                     ; 0F70 _ 52
        push    eax                                     ; 0F71 _ 50
        push    7                                       ; 0F72 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F74 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F77 _ FF. 75, 08
        call    boxfill8                                ; 0F7A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F7F _ 83. C4, 20
        nop                                             ; 0F82 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0F83 _ 8B. 5D, FC
        leave                                           ; 0F86 _ C9
        ret                                             ; 0F87 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0F88 _ 55
        mov     ebp, esp                                ; 0F89 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0F8B _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0F8E _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0F91 _ A1, 00000114(d)
        add     eax, edx                                ; 0F96 _ 01. D0
        mov     dword [mx], eax                         ; 0F98 _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0F9D _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0FA0 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0FA3 _ A1, 00000118(d)
        add     eax, edx                                ; 0FA8 _ 01. D0
        mov     dword [my], eax                         ; 0FAA _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0FAF _ A1, 00000114(d)
        test    eax, eax                                ; 0FB4 _ 85. C0
        jns     ?_023                                   ; 0FB6 _ 79, 0A
        mov     dword [mx], 0                           ; 0FB8 _ C7. 05, 00000114(d), 00000000
?_023:  mov     eax, dword [my]                         ; 0FC2 _ A1, 00000118(d)
        test    eax, eax                                ; 0FC7 _ 85. C0
        jns     ?_024                                   ; 0FC9 _ 79, 0A
        mov     dword [my], 0                           ; 0FCB _ C7. 05, 00000118(d), 00000000
?_024:  mov     edx, dword [xsize]                      ; 0FD5 _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0FDB _ A1, 00000114(d)
        cmp     edx, eax                                ; 0FE0 _ 39. C2
        jg  near      ?_025                                   ; 0fe2 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 0FE4 _ A1, 0000011C(d)
        dec     eax                                     ; 0FE9 _ 48
        mov     dword [mx], eax                         ; 0FEA _ A3, 00000114(d)
?_025:  mov     edx, dword [ysize]                      ; 0FEF _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0FF5 _ A1, 00000118(d)
        cmp     edx, eax                                ; 0FFA _ 39. C2
        jg  near      ?_026                                   ; 0ffc _ 7f, 0b
        mov     eax, dword [ysize]                      ; 0FFE _ A1, 00000120(d)
        dec     eax                                     ; 1003 _ 48
        mov     dword [my], eax                         ; 1004 _ A3, 00000118(d)
?_026:  nop                                             ; 1009 _ 90
        pop     ebp                                     ; 100A _ 5D
        ret                                             ; 100B _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 100C _ 55
        mov     ebp, esp                                ; 100D _ 89. E5
        sub     esp, 24                                 ; 100F _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 1012 _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 1017 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 101A _ C6. 45, F3, 00
        call    io_sti                                  ; 101E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 1023 _ 83. EC, 0C
        push    mouseinfo                               ; 1026 _ 68, 00000024(d)
        call    fifo8_get                               ; 102B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1030 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 1033 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 1036 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 103A _ 83. EC, 08
        push    eax                                     ; 103D _ 50
        push    mdec                                    ; 103E _ 68, 000000E0(d)
        call    mouse_decode                            ; 1043 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1048 _ 83. C4, 10
        test    eax, eax                                ; 104B _ 85. C0
        jz near       ?_027                                   ; 104d _ 74, 60
        sub     esp, 4                                  ; 104F _ 83. EC, 04
        push    mdec                                    ; 1052 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 1057 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 105A _ FF. 75, 08
        call    computeMousePosition                    ; 105D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1062 _ 83. C4, 10
        mov     edx, dword [my]                         ; 1065 _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 106B _ A1, 00000114(d)
        push    edx                                     ; 1070 _ 52
        push    eax                                     ; 1071 _ 50
        push    dword [ebp+10H]                         ; 1072 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1075 _ FF. 75, 08
        call    sheet_slide                             ; 1078 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 107D _ 83. C4, 10
        mov     eax, dword [?_224]                      ; 1080 _ A1, 000000EC(d)
        and     eax, 01H                                ; 1085 _ 83. E0, 01
        test    eax, eax                                ; 1088 _ 85. C0
        jz near       ?_027                                   ; 108a _ 74, 23
        mov     eax, dword [my]                         ; 108C _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 1091 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 1094 _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 1099 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 109C _ A1, 00000240(d)
        push    ecx                                     ; 10A1 _ 51
        push    edx                                     ; 10A2 _ 52
        push    eax                                     ; 10A3 _ 50
        push    dword [ebp+8H]                          ; 10A4 _ FF. 75, 08
        call    sheet_slide                             ; 10A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10AC _ 83. C4, 10
?_027:  nop                                             ; 10AF _ 90
        leave                                           ; 10B0 _ C9
        ret                                             ; 10B1 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 10B2 _ 55
        mov     ebp, esp                                ; 10B3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 10B5 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 10B8 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 10BE _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 10C1 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 10C7 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 10CA _ 66: C7. 40, 06, 01E0
        nop                                             ; 10D0 _ 90
        pop     ebp                                     ; 10D1 _ 5D
        ret                                             ; 10D2 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 10D3 _ 55
        mov     ebp, esp                                ; 10D4 _ 89. E5
        push    ebx                                     ; 10D6 _ 53
        sub     esp, 36                                 ; 10D7 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 10DA _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 10DD _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 10E0 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 10E3 _ 89. 45, F4
        jmp     ?_029                                   ; 10E6 _ EB, 3C

?_028:  mov     eax, dword [ebp+1CH]                    ; 10E8 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 10EB _ 8A. 00
        movzx   eax, al                                 ; 10ED _ 0F B6. C0
        shl     eax, 4                                  ; 10F0 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 10F3 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 10F9 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 10FD _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1100 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1103 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1106 _ 8B. 00
        sub     esp, 8                                  ; 1108 _ 83. EC, 08
        push    ebx                                     ; 110B _ 53
        push    ecx                                     ; 110C _ 51
        push    dword [ebp+14H]                         ; 110D _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1110 _ FF. 75, 10
        push    edx                                     ; 1113 _ 52
        push    eax                                     ; 1114 _ 50
        call    showFont8                               ; 1115 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 111A _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 111D _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 1121 _ FF. 45, 1C
?_029:  mov     eax, dword [ebp+1CH]                    ; 1124 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 1127 _ 8A. 00
        test    al, al                                  ; 1129 _ 84. C0
        jnz near      ?_028                                   ; 112b _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 112D _ 8B. 45, 14
        add     eax, 16                                 ; 1130 _ 83. C0, 10
        sub     esp, 8                                  ; 1133 _ 83. EC, 08
        push    eax                                     ; 1136 _ 50
        push    dword [ebp+10H]                         ; 1137 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 113A _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 113D _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1140 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1143 _ FF. 75, 08
        call    sheet_refresh                           ; 1146 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 114B _ 83. C4, 20
        nop                                             ; 114E _ 90
        mov     ebx, dword [ebp-4H]                     ; 114F _ 8B. 5D, FC
        leave                                           ; 1152 _ C9
        ret                                             ; 1153 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 1154 _ 55
        mov     ebp, esp                                ; 1155 _ 89. E5
        sub     esp, 8                                  ; 1157 _ 83. EC, 08
        sub     esp, 4                                  ; 115A _ 83. EC, 04
        push    table_rgb.1944                          ; 115D _ 68, 00000080(d)
        push    15                                      ; 1162 _ 6A, 0F
        push    0                                       ; 1164 _ 6A, 00
        call    set_palette                             ; 1166 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 116B _ 83. C4, 10
        nop                                             ; 116E _ 90
        leave                                           ; 116F _ C9
        ret                                             ; 1170 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 1171 _ 55
        mov     ebp, esp                                ; 1172 _ 89. E5
        sub     esp, 24                                 ; 1174 _ 83. EC, 18
        call    io_load_eflags                          ; 1177 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 117C _ 89. 45, F0
        call    io_cli                                  ; 117F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1184 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 1187 _ FF. 75, 08
        push    968                                     ; 118A _ 68, 000003C8
        call    io_out8                                 ; 118F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1194 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1197 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 119A _ 89. 45, F4
        jmp     ?_031                                   ; 119D _ EB, 5F

?_030:  mov     eax, dword [ebp+10H]                    ; 119F _ 8B. 45, 10
        mov     al, byte [eax]                          ; 11A2 _ 8A. 00
        shr     al, 2                                   ; 11A4 _ C0. E8, 02
        movzx   eax, al                                 ; 11A7 _ 0F B6. C0
        sub     esp, 8                                  ; 11AA _ 83. EC, 08
        push    eax                                     ; 11AD _ 50
        push    969                                     ; 11AE _ 68, 000003C9
        call    io_out8                                 ; 11B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11B8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 11BB _ 8B. 45, 10
        inc     eax                                     ; 11BE _ 40
        mov     al, byte [eax]                          ; 11BF _ 8A. 00
        shr     al, 2                                   ; 11C1 _ C0. E8, 02
        movzx   eax, al                                 ; 11C4 _ 0F B6. C0
        sub     esp, 8                                  ; 11C7 _ 83. EC, 08
        push    eax                                     ; 11CA _ 50
        push    969                                     ; 11CB _ 68, 000003C9
        call    io_out8                                 ; 11D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11D5 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 11D8 _ 8B. 45, 10
        add     eax, 2                                  ; 11DB _ 83. C0, 02
        mov     al, byte [eax]                          ; 11DE _ 8A. 00
        shr     al, 2                                   ; 11E0 _ C0. E8, 02
        movzx   eax, al                                 ; 11E3 _ 0F B6. C0
        sub     esp, 8                                  ; 11E6 _ 83. EC, 08
        push    eax                                     ; 11E9 _ 50
        push    969                                     ; 11EA _ 68, 000003C9
        call    io_out8                                 ; 11EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F4 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 11F7 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 11FB _ FF. 45, F4
?_031:  mov     eax, dword [ebp-0CH]                    ; 11FE _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 1201 _ 3B. 45, 0C
        jle near      ?_030                                   ; 1204 _ 7e, 99
        sub     esp, 12                                 ; 1206 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1209 _ FF. 75, F0
        call    io_store_eflags                         ; 120C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1211 _ 83. C4, 10
        nop                                             ; 1214 _ 90
        leave                                           ; 1215 _ C9
        ret                                             ; 1216 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 1217 _ 55
        mov     ebp, esp                                ; 1218 _ 89. E5
        sub     esp, 20                                 ; 121A _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 121D _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 1220 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1223 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 1226 _ 89. 45, F8
        jmp     ?_035                                   ; 1229 _ EB, 30

?_032:  mov     eax, dword [ebp+14H]                    ; 122B _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 122E _ 89. 45, FC
        jmp     ?_034                                   ; 1231 _ EB, 1D

?_033:  mov     eax, dword [ebp-8H]                     ; 1233 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 1236 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 123A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 123C _ 8B. 45, FC
        add     eax, edx                                ; 123F _ 01. D0
        mov     edx, eax                                ; 1241 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1243 _ 8B. 45, 08
        add     edx, eax                                ; 1246 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1248 _ 8A. 45, EC
        mov     byte [edx], al                          ; 124B _ 88. 02
        inc     dword [ebp-4H]                          ; 124D _ FF. 45, FC
?_034:  mov     eax, dword [ebp-4H]                     ; 1250 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 1253 _ 3B. 45, 1C
        jle near      ?_033                                   ; 1256 _ 7e, db
        inc     dword [ebp-8H]                          ; 1258 _ FF. 45, F8
?_035:  mov     eax, dword [ebp-8H]                     ; 125B _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 125E _ 3B. 45, 20
        jle near      ?_032                                   ; 1261 _ 7e, c8
        nop                                             ; 1263 _ 90
        nop                                             ; 1264 _ 90
        leave                                           ; 1265 _ C9
        ret                                             ; 1266 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 1267 _ 55
        mov     ebp, esp                                ; 1268 _ 89. E5
        sub     esp, 20                                 ; 126A _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 126D _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 1270 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1273 _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 127A _ E9, 00000162

?_036:  mov     edx, dword [ebp-4H]                     ; 127F _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 1282 _ 8B. 45, 1C
        add     eax, edx                                ; 1285 _ 01. D0
        mov     al, byte [eax]                          ; 1287 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 1289 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 128C _ 80. 7D, FB, 00
        jns     ?_037                                   ; 1290 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 1292 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1295 _ 8B. 45, FC
        add     eax, edx                                ; 1298 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 129A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 129E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12A0 _ 8B. 45, 10
        add     eax, edx                                ; 12A3 _ 01. D0
        mov     edx, eax                                ; 12A5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12A7 _ 8B. 45, 08
        add     edx, eax                                ; 12AA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 12AC _ 8A. 45, EC
        mov     byte [edx], al                          ; 12AF _ 88. 02
?_037:  movsx   eax, byte [ebp-5H]                      ; 12B1 _ 0F BE. 45, FB
        and     eax, 40H                                ; 12B5 _ 83. E0, 40
        test    eax, eax                                ; 12B8 _ 85. C0
        jz near       ?_038                                   ; 12ba _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 12BC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 12BF _ 8B. 45, FC
        add     eax, edx                                ; 12C2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12C4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 12C8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12CA _ 8B. 45, 10
        add     eax, edx                                ; 12CD _ 01. D0
        lea     edx, [eax+1H]                           ; 12CF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 12D2 _ 8B. 45, 08
        add     edx, eax                                ; 12D5 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 12D7 _ 8A. 45, EC
        mov     byte [edx], al                          ; 12DA _ 88. 02
?_038:  movsx   eax, byte [ebp-5H]                      ; 12DC _ 0F BE. 45, FB
        and     eax, 20H                                ; 12E0 _ 83. E0, 20
        test    eax, eax                                ; 12E3 _ 85. C0
        jz near       ?_039                                   ; 12e5 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 12E7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 12EA _ 8B. 45, FC
        add     eax, edx                                ; 12ED _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12EF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 12F3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 12F5 _ 8B. 45, 10
        add     eax, edx                                ; 12F8 _ 01. D0
        lea     edx, [eax+2H]                           ; 12FA _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 12FD _ 8B. 45, 08
        add     edx, eax                                ; 1300 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1302 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1305 _ 88. 02
?_039:  movsx   eax, byte [ebp-5H]                      ; 1307 _ 0F BE. 45, FB
        and     eax, 10H                                ; 130B _ 83. E0, 10
        test    eax, eax                                ; 130E _ 85. C0
        jz near       ?_040                                   ; 1310 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1312 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1315 _ 8B. 45, FC
        add     eax, edx                                ; 1318 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 131A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 131E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1320 _ 8B. 45, 10
        add     eax, edx                                ; 1323 _ 01. D0
        lea     edx, [eax+3H]                           ; 1325 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1328 _ 8B. 45, 08
        add     edx, eax                                ; 132B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 132D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1330 _ 88. 02
?_040:  movsx   eax, byte [ebp-5H]                      ; 1332 _ 0F BE. 45, FB
        and     eax, 08H                                ; 1336 _ 83. E0, 08
        test    eax, eax                                ; 1339 _ 85. C0
        jz near       ?_041                                   ; 133b _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 133D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1340 _ 8B. 45, FC
        add     eax, edx                                ; 1343 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1345 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1349 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 134B _ 8B. 45, 10
        add     eax, edx                                ; 134E _ 01. D0
        lea     edx, [eax+4H]                           ; 1350 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1353 _ 8B. 45, 08
        add     edx, eax                                ; 1356 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1358 _ 8A. 45, EC
        mov     byte [edx], al                          ; 135B _ 88. 02
?_041:  movsx   eax, byte [ebp-5H]                      ; 135D _ 0F BE. 45, FB
        and     eax, 04H                                ; 1361 _ 83. E0, 04
        test    eax, eax                                ; 1364 _ 85. C0
        jz near       ?_042                                   ; 1366 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1368 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 136B _ 8B. 45, FC
        add     eax, edx                                ; 136E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1370 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1374 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1376 _ 8B. 45, 10
        add     eax, edx                                ; 1379 _ 01. D0
        lea     edx, [eax+5H]                           ; 137B _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 137E _ 8B. 45, 08
        add     edx, eax                                ; 1381 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1383 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1386 _ 88. 02
?_042:  movsx   eax, byte [ebp-5H]                      ; 1388 _ 0F BE. 45, FB
        and     eax, 02H                                ; 138C _ 83. E0, 02
        test    eax, eax                                ; 138F _ 85. C0
        jz near       ?_043                                   ; 1391 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1393 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1396 _ 8B. 45, FC
        add     eax, edx                                ; 1399 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 139B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 139F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 13A1 _ 8B. 45, 10
        add     eax, edx                                ; 13A4 _ 01. D0
        lea     edx, [eax+6H]                           ; 13A6 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 13A9 _ 8B. 45, 08
        add     edx, eax                                ; 13AC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13AE _ 8A. 45, EC
        mov     byte [edx], al                          ; 13B1 _ 88. 02
?_043:  movsx   eax, byte [ebp-5H]                      ; 13B3 _ 0F BE. 45, FB
        and     eax, 01H                                ; 13B7 _ 83. E0, 01
        test    eax, eax                                ; 13BA _ 85. C0
        jz near       ?_044                                   ; 13bc _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 13BE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 13C1 _ 8B. 45, FC
        add     eax, edx                                ; 13C4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 13C6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 13CA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 13CC _ 8B. 45, 10
        add     eax, edx                                ; 13CF _ 01. D0
        lea     edx, [eax+7H]                           ; 13D1 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 13D4 _ 8B. 45, 08
        add     edx, eax                                ; 13D7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13D9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 13DC _ 88. 02
?_044:  inc     dword [ebp-4H]                          ; 13DE _ FF. 45, FC
?_045:  cmp     dword [ebp-4H], 15                      ; 13E1 _ 83. 7D, FC, 0F
        jle near      ?_036                                   ; 13e5 _ 0f 8e, fffffe94
        nop                                             ; 13EB _ 90
        nop                                             ; 13EC _ 90
        leave                                           ; 13ED _ C9
        ret                                             ; 13EE _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 13EF _ 55
        mov     ebp, esp                                ; 13F0 _ 89. E5
        sub     esp, 20                                 ; 13F2 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 13F5 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 13F8 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 13FB _ C7. 45, F8, 00000000
        jmp     ?_052                                   ; 1402 _ E9, 000000AB

?_046:  mov     dword [ebp-4H], 0                       ; 1407 _ C7. 45, FC, 00000000
        jmp     ?_051                                   ; 140E _ E9, 00000092

?_047:  mov     eax, dword [ebp-8H]                     ; 1413 _ 8B. 45, F8
        shl     eax, 4                                  ; 1416 _ C1. E0, 04
        mov     edx, eax                                ; 1419 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 141B _ 8B. 45, FC
        add     eax, edx                                ; 141E _ 01. D0
        add     eax, cursor.1991                        ; 1420 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1425 _ 8A. 00
        cmp     al, 42                                  ; 1427 _ 3C, 2A
        jnz near      ?_048                                   ; 1429 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 142B _ 8B. 45, F8
        shl     eax, 4                                  ; 142E _ C1. E0, 04
        mov     edx, eax                                ; 1431 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1433 _ 8B. 45, FC
        add     eax, edx                                ; 1436 _ 01. D0
        mov     edx, eax                                ; 1438 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 143A _ 8B. 45, 08
        add     eax, edx                                ; 143D _ 01. D0
        mov     byte [eax], 0                           ; 143F _ C6. 00, 00
?_048:  mov     eax, dword [ebp-8H]                     ; 1442 _ 8B. 45, F8
        shl     eax, 4                                  ; 1445 _ C1. E0, 04
        mov     edx, eax                                ; 1448 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 144A _ 8B. 45, FC
        add     eax, edx                                ; 144D _ 01. D0
        add     eax, cursor.1991                        ; 144F _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1454 _ 8A. 00
        cmp     al, 79                                  ; 1456 _ 3C, 4F
        jnz near      ?_049                                   ; 1458 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 145A _ 8B. 45, F8
        shl     eax, 4                                  ; 145D _ C1. E0, 04
        mov     edx, eax                                ; 1460 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1462 _ 8B. 45, FC
        add     eax, edx                                ; 1465 _ 01. D0
        mov     edx, eax                                ; 1467 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1469 _ 8B. 45, 08
        add     eax, edx                                ; 146C _ 01. D0
        mov     byte [eax], 7                           ; 146E _ C6. 00, 07
?_049:  mov     eax, dword [ebp-8H]                     ; 1471 _ 8B. 45, F8
        shl     eax, 4                                  ; 1474 _ C1. E0, 04
        mov     edx, eax                                ; 1477 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1479 _ 8B. 45, FC
        add     eax, edx                                ; 147C _ 01. D0
        add     eax, cursor.1991                        ; 147E _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1483 _ 8A. 00
        cmp     al, 46                                  ; 1485 _ 3C, 2E
        jnz near      ?_050                                   ; 1487 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1489 _ 8B. 45, F8
        shl     eax, 4                                  ; 148C _ C1. E0, 04
        mov     edx, eax                                ; 148F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1491 _ 8B. 45, FC
        add     eax, edx                                ; 1494 _ 01. D0
        mov     edx, eax                                ; 1496 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1498 _ 8B. 45, 08
        add     edx, eax                                ; 149B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 149D _ 8A. 45, EC
        mov     byte [edx], al                          ; 14A0 _ 88. 02
?_050:  inc     dword [ebp-4H]                          ; 14A2 _ FF. 45, FC
?_051:  cmp     dword [ebp-4H], 15                      ; 14A5 _ 83. 7D, FC, 0F
        jle near      ?_047                                   ; 14a9 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 14AF _ FF. 45, F8
?_052:  cmp     dword [ebp-8H], 15                      ; 14B2 _ 83. 7D, F8, 0F
        jle near      ?_046                                   ; 14b6 _ 0f 8e, ffffff4b
        nop                                             ; 14BC _ 90
        nop                                             ; 14BD _ 90
        leave                                           ; 14BE _ C9
        ret                                             ; 14BF _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 14C0 _ 55
        mov     ebp, esp                                ; 14C1 _ 89. E5
        push    ebx                                     ; 14C3 _ 53
        sub     esp, 16                                 ; 14C4 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 14C7 _ C7. 45, F4, 00000000
        jmp     ?_056                                   ; 14CE _ EB, 4D

?_053:  mov     dword [ebp-8H], 0                       ; 14D0 _ C7. 45, F8, 00000000
        jmp     ?_055                                   ; 14D7 _ EB, 39

?_054:  mov     eax, dword [ebp-0CH]                    ; 14D9 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 14DC _ 0F AF. 45, 24
        mov     edx, eax                                ; 14E0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 14E2 _ 8B. 45, F8
        add     eax, edx                                ; 14E5 _ 01. D0
        mov     edx, eax                                ; 14E7 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 14E9 _ 8B. 45, 20
        add     eax, edx                                ; 14EC _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 14EE _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 14F1 _ 8B. 55, F4
        add     edx, ecx                                ; 14F4 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 14F6 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 14FA _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 14FD _ 8B. 4D, F8
        add     ecx, ebx                                ; 1500 _ 01. D9
        add     edx, ecx                                ; 1502 _ 01. CA
        mov     ecx, edx                                ; 1504 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 1506 _ 8B. 55, 08
        add     edx, ecx                                ; 1509 _ 01. CA
        mov     al, byte [eax]                          ; 150B _ 8A. 00
        mov     byte [edx], al                          ; 150D _ 88. 02
        inc     dword [ebp-8H]                          ; 150F _ FF. 45, F8
?_055:  mov     eax, dword [ebp-8H]                     ; 1512 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 1515 _ 3B. 45, 10
        jl      ?_054                                   ; 1518 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 151A _ FF. 45, F4
?_056:  mov     eax, dword [ebp-0CH]                    ; 151D _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1520 _ 3B. 45, 14
        jl      ?_053                                   ; 1523 _ 7C, AB
        nop                                             ; 1525 _ 90
        nop                                             ; 1526 _ 90
        add     esp, 16                                 ; 1527 _ 83. C4, 10
        pop     ebx                                     ; 152A _ 5B
        pop     ebp                                     ; 152B _ 5D
        ret                                             ; 152C _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 152D _ 55
        mov     ebp, esp                                ; 152E _ 89. E5
        sub     esp, 24                                 ; 1530 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 1533 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 1538 _ 89. 45, F4
        mov     eax, dword [?_221]                      ; 153B _ A1, 00000004(d)
        cwde                                            ; 1540 _ 98
        mov     dword [ebp-10H], eax                    ; 1541 _ 89. 45, F0
        mov     ax, word [?_222]                        ; 1544 _ 66: A1, 00000006(d)
        cwde                                            ; 154A _ 98
        mov     dword [ebp-14H], eax                    ; 154B _ 89. 45, EC
        sub     esp, 8                                  ; 154E _ 83. EC, 08
        push    32                                      ; 1551 _ 6A, 20
        push    32                                      ; 1553 _ 6A, 20
        call    io_out8                                 ; 1555 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 155A _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 155D _ C6. 45, EB, 00
        sub     esp, 12                                 ; 1561 _ 83. EC, 0C
        push    96                                      ; 1564 _ 6A, 60
        call    io_in8                                  ; 1566 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 156B _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 156E _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 1571 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 1575 _ 83. EC, 08
        push    eax                                     ; 1578 _ 50
        push    keyinfo                                 ; 1579 _ 68, 00000008(d)
        call    fifo8_put                               ; 157E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1583 _ 83. C4, 10
        nop                                             ; 1586 _ 90
        leave                                           ; 1587 _ C9
        ret                                             ; 1588 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1589 _ 55
        mov     ebp, esp                                ; 158A _ 89. E5
        sub     esp, 4                                  ; 158C _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 158F _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1592 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1595 _ 80. 7D, FC, 09
        jle near      ?_057                                   ; 1599 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 159B _ 8A. 45, FC
        add     eax, 55                                 ; 159E _ 83. C0, 37
        jmp     ?_058                                   ; 15A1 _ EB, 06

?_057:  mov     al, byte [ebp-4H]                       ; 15A3 _ 8A. 45, FC
        add     eax, 48                                 ; 15A6 _ 83. C0, 30
?_058:  leave                                           ; 15A9 _ C9
        ret                                             ; 15AA _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 15AB _ 55
        mov     ebp, esp                                ; 15AC _ 89. E5
        sub     esp, 20                                 ; 15AE _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 15B1 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 15B4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 15B7 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 15BE _ 8A. 45, EC
        and     eax, 0FH                                ; 15C1 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 15C4 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 15C7 _ 0F BE. 45, FB
        push    eax                                     ; 15CB _ 50
        call    charToHexVal                            ; 15CC _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 15D1 _ 83. C4, 04
        mov     byte [?_220], al                        ; 15D4 _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 15D9 _ 8A. 45, EC
        shr     al, 4                                   ; 15DC _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 15DF _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 15E2 _ 8A. 45, EC
        movsx   eax, al                                 ; 15E5 _ 0F BE. C0
        push    eax                                     ; 15E8 _ 50
        call    charToHexVal                            ; 15E9 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 15EE _ 83. C4, 04
        mov     byte [?_219], al                        ; 15F1 _ A2, 00000076(d)
        mov     eax, keyval                             ; 15F6 _ B8, 00000074(d)
        leave                                           ; 15FB _ C9
        ret                                             ; 15FC _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 15FD _ 55
        mov     ebp, esp                                ; 15FE _ 89. E5
        sub     esp, 16                                 ; 1600 _ 83. EC, 10
        mov     byte [str.2039], 48                     ; 1603 _ C6. 05, 00000354(d), 30
        mov     byte [?_225], 88                        ; 160A _ C6. 05, 00000355(d), 58
        mov     byte [?_226], 0                         ; 1611 _ C6. 05, 0000035E(d), 00
        mov     dword [ebp-4H], 2                       ; 1618 _ C7. 45, FC, 00000002
        jmp     ?_060                                   ; 161F _ EB, 0E

?_059:  mov     eax, dword [ebp-4H]                     ; 1621 _ 8B. 45, FC
        add     eax, str.2039                           ; 1624 _ 05, 00000354(d)
        mov     byte [eax], 48                          ; 1629 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 162C _ FF. 45, FC
?_060:  cmp     dword [ebp-4H], 9                       ; 162F _ 83. 7D, FC, 09
        jle near      ?_059                                   ; 1633 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 1635 _ C7. 45, F8, 00000009
        jmp     ?_064                                   ; 163C _ EB, 41

?_061:  mov     eax, dword [ebp+8H]                     ; 163E _ 8B. 45, 08
        and     eax, 0FH                                ; 1641 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 1644 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1647 _ 8B. 45, 08
        shr     eax, 4                                  ; 164A _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 164D _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 1650 _ 83. 7D, F4, 09
        jle near      ?_062                                   ; 1654 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 1656 _ 8B. 45, F4
        add     eax, 55                                 ; 1659 _ 83. C0, 37
        mov     dl, al                                  ; 165C _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 165E _ 8B. 45, F8
        add     eax, str.2039                           ; 1661 _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 1666 _ 88. 10
        jmp     ?_063                                   ; 1668 _ EB, 12

?_062:  mov     eax, dword [ebp-0CH]                    ; 166A _ 8B. 45, F4
        add     eax, 48                                 ; 166D _ 83. C0, 30
        mov     dl, al                                  ; 1670 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1672 _ 8B. 45, F8
        add     eax, str.2039                           ; 1675 _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 167A _ 88. 10
?_063:  dec     dword [ebp-8H]                          ; 167C _ FF. 4D, F8
?_064:  cmp     dword [ebp-8H], 1                       ; 167F _ 83. 7D, F8, 01
        jle near      ?_065                                   ; 1683 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 1685 _ 83. 7D, 08, 00
        jnz near      ?_061                                   ; 1689 _ 75, b3
?_065:  mov     eax, str.2039                           ; 168B _ B8, 00000354(d)
        leave                                           ; 1690 _ C9
        ret                                             ; 1691 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1692 _ 55
        mov     ebp, esp                                ; 1693 _ 89. E5
        sub     esp, 8                                  ; 1695 _ 83. EC, 08
?_066:  sub     esp, 12                                 ; 1698 _ 83. EC, 0C
        push    100                                     ; 169B _ 6A, 64
        call    io_in8                                  ; 169D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16A2 _ 83. C4, 10
        and     eax, 02H                                ; 16A5 _ 83. E0, 02
        test    eax, eax                                ; 16A8 _ 85. C0
        jz near       ?_067                                   ; 16aa _ 74, 02
        jmp     ?_066                                   ; 16AC _ EB, EA

?_067:  nop                                             ; 16AE _ 90
        nop                                             ; 16AF _ 90
        leave                                           ; 16B0 _ C9
        ret                                             ; 16B1 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 16B2 _ 55
        mov     ebp, esp                                ; 16B3 _ 89. E5
        sub     esp, 8                                  ; 16B5 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 16B8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 16BD _ 83. EC, 08
        push    96                                      ; 16C0 _ 6A, 60
        push    100                                     ; 16C2 _ 6A, 64
        call    io_out8                                 ; 16C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16C9 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 16CC _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 16D1 _ 83. EC, 08
        push    71                                      ; 16D4 _ 6A, 47
        push    96                                      ; 16D6 _ 6A, 60
        call    io_out8                                 ; 16D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16DD _ 83. C4, 10
        nop                                             ; 16E0 _ 90
        leave                                           ; 16E1 _ C9
        ret                                             ; 16E2 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 16E3 _ 55
        mov     ebp, esp                                ; 16E4 _ 89. E5
        sub     esp, 8                                  ; 16E6 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 16E9 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 16EE _ 83. EC, 08
        push    212                                     ; 16F1 _ 68, 000000D4
        push    100                                     ; 16F6 _ 6A, 64
        call    io_out8                                 ; 16F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16FD _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1700 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1705 _ 83. EC, 08
        push    244                                     ; 1708 _ 68, 000000F4
        push    96                                      ; 170D _ 6A, 60
        call    io_out8                                 ; 170F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1714 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1717 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 171A _ C6. 40, 03, 00
        nop                                             ; 171E _ 90
        leave                                           ; 171F _ C9
        ret                                             ; 1720 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1721 _ 55
        mov     ebp, esp                                ; 1722 _ 89. E5
        sub     esp, 24                                 ; 1724 _ 83. EC, 18
        sub     esp, 8                                  ; 1727 _ 83. EC, 08
        push    32                                      ; 172A _ 6A, 20
        push    160                                     ; 172C _ 68, 000000A0
        call    io_out8                                 ; 1731 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1736 _ 83. C4, 10
        sub     esp, 8                                  ; 1739 _ 83. EC, 08
        push    32                                      ; 173C _ 6A, 20
        push    32                                      ; 173E _ 6A, 20
        call    io_out8                                 ; 1740 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1745 _ 83. C4, 10
        sub     esp, 12                                 ; 1748 _ 83. EC, 0C
        push    96                                      ; 174B _ 6A, 60
        call    io_in8                                  ; 174D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1752 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 1755 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1758 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 175C _ 83. EC, 08
        push    eax                                     ; 175F _ 50
        push    mouseinfo                               ; 1760 _ 68, 00000024(d)
        call    fifo8_put                               ; 1765 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 176A _ 83. C4, 10
        nop                                             ; 176D _ 90
        leave                                           ; 176E _ C9
        ret                                             ; 176F _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1770 _ 55
        mov     ebp, esp                                ; 1771 _ 89. E5
        sub     esp, 4                                  ; 1773 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1776 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1779 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 177F _ 8A. 40, 03
        test    al, al                                  ; 1782 _ 84. C0
        jnz near      ?_069                                   ; 1784 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1786 _ 80. 7D, FC, FA
        jnz near      ?_068                                   ; 178a _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 178C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 178F _ C6. 40, 03, 01
?_068:  mov     eax, 0                                  ; 1793 _ B8, 00000000
        jmp     ?_076                                   ; 1798 _ E9, 00000104

?_069:  mov     eax, dword [ebp+8H]                     ; 179D _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 17A0 _ 8A. 40, 03
        cmp     al, 1                                   ; 17A3 _ 3C, 01
        jnz near      ?_071                                   ; 17a5 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 17A7 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 17AB _ 25, 000000C8
        cmp     eax, 8                                  ; 17B0 _ 83. F8, 08
        jnz near      ?_070                                   ; 17b3 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 17B5 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 17B8 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 17BB _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 17BD _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 17C0 _ C6. 40, 03, 02
?_070:  mov     eax, 0                                  ; 17C4 _ B8, 00000000
        jmp     ?_076                                   ; 17C9 _ E9, 000000D3

?_071:  mov     eax, dword [ebp+8H]                     ; 17CE _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 17D1 _ 8A. 40, 03
        cmp     al, 2                                   ; 17D4 _ 3C, 02
        jnz near      ?_072                                   ; 17d6 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 17D8 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 17DB _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 17DE _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17E1 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 17E4 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 17E8 _ B8, 00000000
        jmp     ?_076                                   ; 17ED _ E9, 000000AF

?_072:  mov     eax, dword [ebp+8H]                     ; 17F2 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 17F5 _ 8A. 40, 03
        cmp     al, 3                                   ; 17F8 _ 3C, 03
        jne near      ?_075                                   ; 17fa _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 1800 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1803 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 1806 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1809 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 180C _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1810 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1813 _ 8A. 00
        movzx   eax, al                                 ; 1815 _ 0F B6. C0
        and     eax, 07H                                ; 1818 _ 83. E0, 07
        mov     edx, eax                                ; 181B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 181D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1820 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1823 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 1826 _ 8A. 40, 01
        movzx   edx, al                                 ; 1829 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 182C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 182F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1832 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 1835 _ 8A. 40, 02
        movzx   edx, al                                 ; 1838 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 183B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 183E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1841 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1844 _ 8A. 00
        movzx   eax, al                                 ; 1846 _ 0F B6. C0
        and     eax, 10H                                ; 1849 _ 83. E0, 10
        test    eax, eax                                ; 184C _ 85. C0
        jz near       ?_073                                   ; 184e _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1850 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1853 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1856 _ 0D, FFFFFF00
        mov     edx, eax                                ; 185B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 185D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1860 _ 89. 50, 04
?_073:  mov     eax, dword [ebp+8H]                     ; 1863 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1866 _ 8A. 00
        movzx   eax, al                                 ; 1868 _ 0F B6. C0
        and     eax, 20H                                ; 186B _ 83. E0, 20
        test    eax, eax                                ; 186E _ 85. C0
        jz near       ?_074                                   ; 1870 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1872 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1875 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1878 _ 0D, FFFFFF00
        mov     edx, eax                                ; 187D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 187F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1882 _ 89. 50, 08
?_074:  mov     eax, dword [ebp+8H]                     ; 1885 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1888 _ 8B. 40, 08
        neg     eax                                     ; 188B _ F7. D8
        mov     edx, eax                                ; 188D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 188F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1892 _ 89. 50, 08
        mov     eax, 1                                  ; 1895 _ B8, 00000001
        jmp     ?_076                                   ; 189A _ EB, 05

?_075:  mov     eax, 4294967295                         ; 189C _ B8, FFFFFFFF
?_076:  leave                                           ; 18A1 _ C9
        ret                                             ; 18A2 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 18A3 _ 55
        mov     ebp, esp                                ; 18A4 _ 89. E5
        sub     esp, 40                                 ; 18A6 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 18A9 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 18B0 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 18B7 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 18BE _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 18C5 _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 18CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18CE _ 8B. 00
        sub     esp, 4                                  ; 18D0 _ 83. EC, 04
        push    edx                                     ; 18D3 _ 52
        push    dword [ebp+1CH]                         ; 18D4 _ FF. 75, 1C
        push    eax                                     ; 18D7 _ 50
        call    init_screen8                            ; 18D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18DD _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 18E0 _ 8B. 45, 20
        movsx   eax, al                                 ; 18E3 _ 0F BE. C0
        sub     esp, 8                                  ; 18E6 _ 83. EC, 08
        push    ?_215                                   ; 18E9 _ 68, 0000002F(d)
        push    eax                                     ; 18EE _ 50
        push    dword [ebp-10H]                         ; 18EF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 18F2 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 18F5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 18F8 _ FF. 75, 08
        call    showString                              ; 18FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1900 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1903 _ 8B. 45, 18
        sub     esp, 12                                 ; 1906 _ 83. EC, 0C
        push    eax                                     ; 1909 _ 50
        call    intToHexStr                             ; 190A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 190F _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1912 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1915 _ 8B. 45, 20
        movsx   eax, al                                 ; 1918 _ 0F BE. C0
        sub     esp, 8                                  ; 191B _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 191E _ FF. 75, E4
        push    eax                                     ; 1921 _ 50
        push    dword [ebp-10H]                         ; 1922 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1925 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1928 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 192B _ FF. 75, 08
        call    showString                              ; 192E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1933 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1936 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 193A _ 8B. 45, 20
        movsx   eax, al                                 ; 193D _ 0F BE. C0
        sub     esp, 8                                  ; 1940 _ 83. EC, 08
        push    ?_216                                   ; 1943 _ 68, 00000039(d)
        push    eax                                     ; 1948 _ 50
        push    dword [ebp-10H]                         ; 1949 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 194C _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 194F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1952 _ FF. 75, 08
        call    showString                              ; 1955 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 195A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 195D _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1960 _ 8B. 00
        sub     esp, 12                                 ; 1962 _ 83. EC, 0C
        push    eax                                     ; 1965 _ 50
        call    intToHexStr                             ; 1966 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 196B _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 196E _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1971 _ 8B. 45, 20
        movsx   eax, al                                 ; 1974 _ 0F BE. C0
        sub     esp, 8                                  ; 1977 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 197A _ FF. 75, E0
        push    eax                                     ; 197D _ 50
        push    dword [ebp-10H]                         ; 197E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1981 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1984 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1987 _ FF. 75, 08
        call    showString                              ; 198A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 198F _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1992 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1996 _ 8B. 45, 20
        movsx   eax, al                                 ; 1999 _ 0F BE. C0
        sub     esp, 8                                  ; 199C _ 83. EC, 08
        push    ?_217                                   ; 199F _ 68, 00000045(d)
        push    eax                                     ; 19A4 _ 50
        push    dword [ebp-10H]                         ; 19A5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 19A8 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 19AB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 19AE _ FF. 75, 08
        call    showString                              ; 19B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19B6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 19B9 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 19BC _ 8B. 40, 04
        sub     esp, 12                                 ; 19BF _ 83. EC, 0C
        push    eax                                     ; 19C2 _ 50
        call    intToHexStr                             ; 19C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19C8 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 19CB _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 19CE _ 8B. 45, 20
        movsx   eax, al                                 ; 19D1 _ 0F BE. C0
        sub     esp, 8                                  ; 19D4 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 19D7 _ FF. 75, DC
        push    eax                                     ; 19DA _ 50
        push    dword [ebp-10H]                         ; 19DB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 19DE _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 19E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 19E4 _ FF. 75, 08
        call    showString                              ; 19E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19EC _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 19EF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 19F3 _ 8B. 45, 20
        movsx   eax, al                                 ; 19F6 _ 0F BE. C0
        sub     esp, 8                                  ; 19F9 _ 83. EC, 08
        push    ?_218                                   ; 19FC _ 68, 00000051(d)
        push    eax                                     ; 1A01 _ 50
        push    dword [ebp-10H]                         ; 1A02 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1A05 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1A08 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A0B _ FF. 75, 08
        call    showString                              ; 1A0E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A13 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1A16 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1A19 _ 8B. 40, 08
        sub     esp, 12                                 ; 1A1C _ 83. EC, 0C
        push    eax                                     ; 1A1F _ 50
        call    intToHexStr                             ; 1A20 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A25 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1A28 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1A2B _ 8B. 45, 20
        movsx   eax, al                                 ; 1A2E _ 0F BE. C0
        sub     esp, 8                                  ; 1A31 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1A34 _ FF. 75, D8
        push    eax                                     ; 1A37 _ 50
        push    dword [ebp-10H]                         ; 1A38 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1A3B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1A3E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A41 _ FF. 75, 08
        call    showString                              ; 1A44 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A49 _ 83. C4, 20
        nop                                             ; 1A4C _ 90
        leave                                           ; 1A4D _ C9
        ret                                             ; 1A4E _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1A4F _ 55
        mov     ebp, esp                                ; 1A50 _ 89. E5
        sub     esp, 24                                 ; 1A52 _ 83. EC, 18
        sub     esp, 12                                 ; 1A55 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1A58 _ FF. 75, 08
        call    sheet_alloc                             ; 1A5B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A60 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1A63 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1A66 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1A6B _ 83. EC, 08
        push    10880                                   ; 1A6E _ 68, 00002A80
        push    eax                                     ; 1A73 _ 50
        call    memman_alloc_4k                         ; 1A74 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A79 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1A7C _ 89. 45, F0
        sub     esp, 12                                 ; 1A7F _ 83. EC, 0C
        push    -1                                      ; 1A82 _ 6A, FF
        push    68                                      ; 1A84 _ 6A, 44
        push    160                                     ; 1A86 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1A8B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1A8E _ FF. 75, F4
        call    sheet_setbuf                            ; 1A91 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A96 _ 83. C4, 20
        push    1                                       ; 1A99 _ 6A, 01
        push    dword [ebp+0CH]                         ; 1A9B _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1A9E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1AA1 _ FF. 75, 08
        call    make_window8                            ; 1AA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AA9 _ 83. C4, 10
        sub     esp, 8                                  ; 1AAC _ 83. EC, 08
        push    7                                       ; 1AAF _ 6A, 07
        push    16                                      ; 1AB1 _ 6A, 10
        push    144                                     ; 1AB3 _ 68, 00000090
        push    28                                      ; 1AB8 _ 6A, 1C
        push    8                                       ; 1ABA _ 6A, 08
        push    dword [ebp-0CH]                         ; 1ABC _ FF. 75, F4
        call    make_textbox8                           ; 1ABF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AC4 _ 83. C4, 20
        push    172                                     ; 1AC7 _ 68, 000000AC
        push    260                                     ; 1ACC _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1AD1 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1AD4 _ FF. 75, 08
        call    sheet_slide                             ; 1AD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ADC _ 83. C4, 10
        sub     esp, 4                                  ; 1ADF _ 83. EC, 04
        push    2                                       ; 1AE2 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1AE4 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1AE7 _ FF. 75, 08
        call    sheet_updown                            ; 1AEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AEF _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1AF2 _ 8B. 45, F4
        leave                                           ; 1AF5 _ C9
        ret                                             ; 1AF6 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1AF7 _ 55
        mov     ebp, esp                                ; 1AF8 _ 89. E5
        push    ebx                                     ; 1AFA _ 53
        sub     esp, 36                                 ; 1AFB _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1AFE _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1B01 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1B04 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B07 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1B0A _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1B0D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B10 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1B13 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1B16 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B19 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B1C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B1F _ 8B. 00
        push    0                                       ; 1B21 _ 6A, 00
        push    edx                                     ; 1B23 _ 52
        push    0                                       ; 1B24 _ 6A, 00
        push    0                                       ; 1B26 _ 6A, 00
        push    8                                       ; 1B28 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1B2A _ FF. 75, F4
        push    eax                                     ; 1B2D _ 50
        call    boxfill8                                ; 1B2E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B33 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1B36 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1B39 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B3F _ 8B. 00
        push    1                                       ; 1B41 _ 6A, 01
        push    edx                                     ; 1B43 _ 52
        push    1                                       ; 1B44 _ 6A, 01
        push    1                                       ; 1B46 _ 6A, 01
        push    7                                       ; 1B48 _ 6A, 07
        push    dword [ebp-0CH]                         ; 1B4A _ FF. 75, F4
        push    eax                                     ; 1B4D _ 50
        call    boxfill8                                ; 1B4E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B53 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B56 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B59 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B5C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B5F _ 8B. 00
        push    edx                                     ; 1B61 _ 52
        push    0                                       ; 1B62 _ 6A, 00
        push    0                                       ; 1B64 _ 6A, 00
        push    0                                       ; 1B66 _ 6A, 00
        push    8                                       ; 1B68 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1B6A _ FF. 75, F4
        push    eax                                     ; 1B6D _ 50
        call    boxfill8                                ; 1B6E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B73 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B76 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B79 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B7F _ 8B. 00
        push    edx                                     ; 1B81 _ 52
        push    1                                       ; 1B82 _ 6A, 01
        push    1                                       ; 1B84 _ 6A, 01
        push    1                                       ; 1B86 _ 6A, 01
        push    7                                       ; 1B88 _ 6A, 07
        push    dword [ebp-0CH]                         ; 1B8A _ FF. 75, F4
        push    eax                                     ; 1B8D _ 50
        call    boxfill8                                ; 1B8E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B93 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1B96 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1B99 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1B9C _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1B9F _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1BA2 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1BA5 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1BA8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BAB _ 8B. 00
        push    ebx                                     ; 1BAD _ 53
        push    ecx                                     ; 1BAE _ 51
        push    1                                       ; 1BAF _ 6A, 01
        push    edx                                     ; 1BB1 _ 52
        push    15                                      ; 1BB2 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1BB4 _ FF. 75, F4
        push    eax                                     ; 1BB7 _ 50
        call    boxfill8                                ; 1BB8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BBD _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1BC0 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1BC3 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1BC6 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1BC9 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1BCC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BCF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BD2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BD5 _ 8B. 00
        push    ebx                                     ; 1BD7 _ 53
        push    ecx                                     ; 1BD8 _ 51
        push    0                                       ; 1BD9 _ 6A, 00
        push    edx                                     ; 1BDB _ 52
        push    0                                       ; 1BDC _ 6A, 00
        push    dword [ebp-0CH]                         ; 1BDE _ FF. 75, F4
        push    eax                                     ; 1BE1 _ 50
        call    boxfill8                                ; 1BE2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BE7 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1BEA _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1BED _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1BF0 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1BF3 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1BF6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF9 _ 8B. 00
        push    ecx                                     ; 1BFB _ 51
        push    edx                                     ; 1BFC _ 52
        push    2                                       ; 1BFD _ 6A, 02
        push    2                                       ; 1BFF _ 6A, 02
        push    8                                       ; 1C01 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C03 _ FF. 75, F4
        push    eax                                     ; 1C06 _ 50
        call    boxfill8                                ; 1C07 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C0C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1C0F _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1C12 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1C15 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C18 _ 8B. 00
        push    20                                      ; 1C1A _ 6A, 14
        push    edx                                     ; 1C1C _ 52
        push    3                                       ; 1C1D _ 6A, 03
        push    3                                       ; 1C1F _ 6A, 03
        push    12                                      ; 1C21 _ 6A, 0C
        push    dword [ebp-0CH]                         ; 1C23 _ FF. 75, F4
        push    eax                                     ; 1C26 _ 50
        call    boxfill8                                ; 1C27 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C2C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C2F _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1C32 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1C35 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1C38 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1C3B _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C3E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C41 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C44 _ 8B. 00
        push    ebx                                     ; 1C46 _ 53
        push    ecx                                     ; 1C47 _ 51
        push    edx                                     ; 1C48 _ 52
        push    1                                       ; 1C49 _ 6A, 01
        push    15                                      ; 1C4B _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1C4D _ FF. 75, F4
        push    eax                                     ; 1C50 _ 50
        call    boxfill8                                ; 1C51 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C56 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C59 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1C5C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1C5F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1C62 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C65 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C68 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C6B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C6E _ 8B. 00
        push    ebx                                     ; 1C70 _ 53
        push    ecx                                     ; 1C71 _ 51
        push    edx                                     ; 1C72 _ 52
        push    0                                       ; 1C73 _ 6A, 00
        push    0                                       ; 1C75 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1C77 _ FF. 75, F4
        push    eax                                     ; 1C7A _ 50
        call    boxfill8                                ; 1C7B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C80 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 1C83 _ 0F BE. 45, E4
        push    eax                                     ; 1C87 _ 50
        push    dword [ebp+10H]                         ; 1C88 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1C8B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1C8E _ FF. 75, 08
        call    make_wtitle8                            ; 1C91 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C96 _ 83. C4, 10
        nop                                             ; 1C99 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1C9A _ 8B. 5D, FC
        leave                                           ; 1C9D _ C9
        ret                                             ; 1C9E _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 1C9F _ 55
        mov     ebp, esp                                ; 1CA0 _ 89. E5
        push    ebx                                     ; 1CA2 _ 53
        sub     esp, 36                                 ; 1CA3 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1CA6 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1CA9 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1CAC _ 80. 7D, E4, 00
        jz near       ?_077                                   ; 1cb0 _ 74, 0a
        mov     byte [ebp-12H], 7                       ; 1CB2 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1CB6 _ C6. 45, ED, 0C
        jmp     ?_078                                   ; 1CBA _ EB, 08

?_077:  mov     byte [ebp-12H], 8                       ; 1CBC _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1CC0 _ C6. 45, ED, 0F
?_078:  mov     eax, dword [ebp+0CH]                    ; 1CC4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CC7 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1CCA _ 8D. 58, FC
        mov     al, byte [ebp-13H]                      ; 1CCD _ 8A. 45, ED
        movzx   ecx, al                                 ; 1CD0 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1CD3 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1CD6 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1CD9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CDC _ 8B. 00
        push    20                                      ; 1CDE _ 6A, 14
        push    ebx                                     ; 1CE0 _ 53
        push    3                                       ; 1CE1 _ 6A, 03
        push    3                                       ; 1CE3 _ 6A, 03
        push    ecx                                     ; 1CE5 _ 51
        push    edx                                     ; 1CE6 _ 52
        push    eax                                     ; 1CE7 _ 50
        call    boxfill8                                ; 1CE8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CED _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 1CF0 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 1CF4 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1CF7 _ FF. 75, 10
        push    eax                                     ; 1CFA _ 50
        push    4                                       ; 1CFB _ 6A, 04
        push    24                                      ; 1CFD _ 6A, 18
        push    dword [ebp+0CH]                         ; 1CFF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1D02 _ FF. 75, 08
        call    showString                              ; 1D05 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D0A _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1D0D _ C7. 45, F0, 00000000
        jmp     ?_086                                   ; 1D14 _ EB, 7F

?_079:  mov     dword [ebp-0CH], 0                      ; 1D16 _ C7. 45, F4, 00000000
        jmp     ?_085                                   ; 1D1D _ EB, 6D

?_080:  mov     eax, dword [ebp-10H]                    ; 1D1F _ 8B. 45, F0
        shl     eax, 4                                  ; 1D22 _ C1. E0, 04
        mov     edx, eax                                ; 1D25 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1D27 _ 8B. 45, F4
        add     eax, edx                                ; 1D2A _ 01. D0
        add     eax, closebtn.2110                      ; 1D2C _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1D31 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1D33 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1D36 _ 80. 7D, EF, 40
        jnz near      ?_081                                   ; 1d3a _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1D3C _ C6. 45, EF, 00
        jmp     ?_084                                   ; 1D40 _ EB, 1C

?_081:  cmp     byte [ebp-11H], 36                      ; 1D42 _ 80. 7D, EF, 24
        jnz near      ?_082                                   ; 1d46 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1D48 _ C6. 45, EF, 0F
        jmp     ?_084                                   ; 1D4C _ EB, 10

?_082:  cmp     byte [ebp-11H], 81                      ; 1D4E _ 80. 7D, EF, 51
        jnz near      ?_083                                   ; 1d52 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1D54 _ C6. 45, EF, 08
        jmp     ?_084                                   ; 1D58 _ EB, 04

?_083:  mov     byte [ebp-11H], 7                       ; 1D5A _ C6. 45, EF, 07
?_084:  mov     eax, dword [ebp+0CH]                    ; 1D5E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1D61 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1D63 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1D66 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1D69 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D6C _ 8B. 40, 04
        imul    ecx, eax                                ; 1D6F _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1D72 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1D75 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1D78 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1D7B _ 8B. 45, F4
        add     eax, ebx                                ; 1D7E _ 01. D8
        add     eax, ecx                                ; 1D80 _ 01. C8
        add     edx, eax                                ; 1D82 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1D84 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1D87 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1D89 _ FF. 45, F4
?_085:  cmp     dword [ebp-0CH], 15                     ; 1D8C _ 83. 7D, F4, 0F
        jle near      ?_080                                   ; 1d90 _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1D92 _ FF. 45, F0
?_086:  cmp     dword [ebp-10H], 13                     ; 1D95 _ 83. 7D, F0, 0D
        jle near      ?_079                                   ; 1d99 _ 0f 8e, ffffff77
        nop                                             ; 1D9F _ 90
        nop                                             ; 1DA0 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1DA1 _ 8B. 5D, FC
        leave                                           ; 1DA4 _ C9
        ret                                             ; 1DA5 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1DA6 _ 55
        mov     ebp, esp                                ; 1DA7 _ 89. E5
        push    edi                                     ; 1DA9 _ 57
        push    esi                                     ; 1DAA _ 56
        push    ebx                                     ; 1DAB _ 53
        sub     esp, 16                                 ; 1DAC _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1DAF _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1DB2 _ 8B. 45, 14
        add     eax, edx                                ; 1DB5 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1DB7 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1DBA _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1DBD _ 8B. 45, 18
        add     eax, edx                                ; 1DC0 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1DC2 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1DC5 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1DC8 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1DCB _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1DCE _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1DD1 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1DD4 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1DD7 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1DDA _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1DDD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1DE0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1DE3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DE6 _ 8B. 00
        push    edi                                     ; 1DE8 _ 57
        push    esi                                     ; 1DE9 _ 56
        push    ebx                                     ; 1DEA _ 53
        push    ecx                                     ; 1DEB _ 51
        push    15                                      ; 1DEC _ 6A, 0F
        push    edx                                     ; 1DEE _ 52
        push    eax                                     ; 1DEF _ 50
        call    boxfill8                                ; 1DF0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DF5 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1DF8 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1DFB _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1DFE _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1E01 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1E04 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1E07 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1E0A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1E0D _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1E10 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E13 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E16 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E19 _ 8B. 00
        push    edi                                     ; 1E1B _ 57
        push    esi                                     ; 1E1C _ 56
        push    ebx                                     ; 1E1D _ 53
        push    ecx                                     ; 1E1E _ 51
        push    15                                      ; 1E1F _ 6A, 0F
        push    edx                                     ; 1E21 _ 52
        push    eax                                     ; 1E22 _ 50
        call    boxfill8                                ; 1E23 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E28 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1E2B _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1E2E _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1E31 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1E34 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1E37 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1E3A _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1E3D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1E40 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1E43 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E46 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E49 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E4C _ 8B. 00
        push    edi                                     ; 1E4E _ 57
        push    esi                                     ; 1E4F _ 56
        push    ebx                                     ; 1E50 _ 53
        push    ecx                                     ; 1E51 _ 51
        push    7                                       ; 1E52 _ 6A, 07
        push    edx                                     ; 1E54 _ 52
        push    eax                                     ; 1E55 _ 50
        call    boxfill8                                ; 1E56 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E5B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1E5E _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1E61 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1E64 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1E67 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1E6A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1E6D _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1E70 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1E73 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1E76 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E79 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E7C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E7F _ 8B. 00
        push    edi                                     ; 1E81 _ 57
        push    esi                                     ; 1E82 _ 56
        push    ebx                                     ; 1E83 _ 53
        push    ecx                                     ; 1E84 _ 51
        push    7                                       ; 1E85 _ 6A, 07
        push    edx                                     ; 1E87 _ 52
        push    eax                                     ; 1E88 _ 50
        call    boxfill8                                ; 1E89 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E8E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1E91 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1E94 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1E97 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1E9A _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1E9D _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1EA0 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1EA3 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1EA6 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1EA9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EAC _ 8B. 00
        push    esi                                     ; 1EAE _ 56
        push    dword [ebp-10H]                         ; 1EAF _ FF. 75, F0
        push    ebx                                     ; 1EB2 _ 53
        push    ecx                                     ; 1EB3 _ 51
        push    0                                       ; 1EB4 _ 6A, 00
        push    edx                                     ; 1EB6 _ 52
        push    eax                                     ; 1EB7 _ 50
        call    boxfill8                                ; 1EB8 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1EBD _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1EC0 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1EC3 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1EC6 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1EC9 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1ECC _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1ECF _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1ED2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ED5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ED8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EDB _ 8B. 00
        push    dword [ebp-14H]                         ; 1EDD _ FF. 75, EC
        push    esi                                     ; 1EE0 _ 56
        push    ebx                                     ; 1EE1 _ 53
        push    ecx                                     ; 1EE2 _ 51
        push    0                                       ; 1EE3 _ 6A, 00
        push    edx                                     ; 1EE5 _ 52
        push    eax                                     ; 1EE6 _ 50
        call    boxfill8                                ; 1EE7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1EEC _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1EEF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1EF2 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1EF5 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1EF8 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1EFB _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1EFE _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1F01 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F04 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F07 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F0A _ 8B. 00
        push    esi                                     ; 1F0C _ 56
        push    dword [ebp-10H]                         ; 1F0D _ FF. 75, F0
        push    ebx                                     ; 1F10 _ 53
        push    ecx                                     ; 1F11 _ 51
        push    8                                       ; 1F12 _ 6A, 08
        push    edx                                     ; 1F14 _ 52
        push    eax                                     ; 1F15 _ 50
        call    boxfill8                                ; 1F16 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F1B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1F1E _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1F21 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1F24 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1F27 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1F2A _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1F2D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1F30 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1F33 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1F36 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F39 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F3C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F3F _ 8B. 00
        push    edi                                     ; 1F41 _ 57
        push    esi                                     ; 1F42 _ 56
        push    ebx                                     ; 1F43 _ 53
        push    ecx                                     ; 1F44 _ 51
        push    8                                       ; 1F45 _ 6A, 08
        push    edx                                     ; 1F47 _ 52
        push    eax                                     ; 1F48 _ 50
        call    boxfill8                                ; 1F49 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F4E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1F51 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1F54 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1F57 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1F5A _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1F5D _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1F60 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1F63 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F66 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F69 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F6C _ 8B. 00
        push    dword [ebp-14H]                         ; 1F6E _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1F71 _ FF. 75, F0
        push    esi                                     ; 1F74 _ 56
        push    ebx                                     ; 1F75 _ 53
        push    ecx                                     ; 1F76 _ 51
        push    edx                                     ; 1F77 _ 52
        push    eax                                     ; 1F78 _ 50
        call    boxfill8                                ; 1F79 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F7E _ 83. C4, 1C
        nop                                             ; 1F81 _ 90
        lea     esp, [ebp-0CH]                          ; 1F82 _ 8D. 65, F4
        pop     ebx                                     ; 1F85 _ 5B
        pop     esi                                     ; 1F86 _ 5E
        pop     edi                                     ; 1F87 _ 5F
        pop     ebp                                     ; 1F88 _ 5D
        ret                                             ; 1F89 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1F8A _ 55
        mov     ebp, esp                                ; 1F8B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1F8D _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1F90 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1F96 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1F99 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FA0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1FA3 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1FAA _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1FAD _ C7. 40, 0C, 00000000
        nop                                             ; 1FB4 _ 90
        pop     ebp                                     ; 1FB5 _ 5D
        ret                                             ; 1FB6 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1FB7 _ 55
        mov     ebp, esp                                ; 1FB8 _ 89. E5
        sub     esp, 16                                 ; 1FBA _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1FBD _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1FC4 _ C7. 45, FC, 00000000
        jmp     ?_088                                   ; 1FCB _ EB, 13

?_087:  mov     eax, dword [ebp+8H]                     ; 1FCD _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1FD0 _ 8B. 55, FC
        add     edx, 2                                  ; 1FD3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1FD6 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1FDA _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1FDD _ FF. 45, FC
?_088:  mov     eax, dword [ebp+8H]                     ; 1FE0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FE3 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1FE5 _ 39. 45, FC
        jc near       ?_087                                   ; 1fe8 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1FEA _ 8B. 45, F8
        leave                                           ; 1FED _ C9
        ret                                             ; 1FEE _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1FEF _ 55
        mov     ebp, esp                                ; 1FF0 _ 89. E5
        sub     esp, 16                                 ; 1FF2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1FF5 _ C7. 45, FC, 00000000
        jmp     ?_092                                   ; 1FFC _ E9, 00000084

?_089:  mov     eax, dword [ebp+8H]                     ; 2001 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2004 _ 8B. 55, FC
        add     edx, 2                                  ; 2007 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 200A _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 200E _ 39. 45, 0C
        ja      ?_091                                   ; 2011 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 2013 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2016 _ 8B. 55, FC
        add     edx, 2                                  ; 2019 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 201C _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 201F _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2022 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2025 _ 8B. 55, FC
        add     edx, 2                                  ; 2028 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 202B _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 202E _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2031 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2034 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2037 _ 8B. 55, FC
        add     edx, 2                                  ; 203A _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 203D _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2040 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2043 _ 8B. 55, FC
        add     edx, 2                                  ; 2046 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2049 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 204D _ 2B. 45, 0C
        mov     edx, eax                                ; 2050 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2052 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 2055 _ 8B. 4D, FC
        add     ecx, 2                                  ; 2058 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 205B _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 205F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2062 _ 8B. 55, FC
        add     edx, 2                                  ; 2065 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2068 _ 8B. 44 D0, 04
        test    eax, eax                                ; 206C _ 85. C0
        jnz near      ?_090                                   ; 206e _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 2070 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2073 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2075 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2078 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 207B _ 89. 10
?_090:  mov     eax, dword [ebp-8H]                     ; 207D _ 8B. 45, F8
        jmp     ?_093                                   ; 2080 _ EB, 16

?_091:  inc     dword [ebp-4H]                          ; 2082 _ FF. 45, FC
?_092:  mov     eax, dword [ebp+8H]                     ; 2085 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2088 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 208A _ 39. 45, FC
        jc near       ?_089                                   ; 208d _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 2093 _ B8, 00000000
?_093:  leave                                           ; 2098 _ C9
        ret                                             ; 2099 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 209A _ 55
        mov     ebp, esp                                ; 209B _ 89. E5
        push    ebx                                     ; 209D _ 53
        sub     esp, 16                                 ; 209E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 20A1 _ C7. 45, F8, 00000000
        jmp     ?_095                                   ; 20A8 _ EB, 14

?_094:  mov     eax, dword [ebp+8H]                     ; 20AA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20AD _ 8B. 55, F8
        add     edx, 2                                  ; 20B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 20B3 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 20B6 _ 39. 45, 0C
        jc near       ?_096                                   ; 20b9 _ 72, 0f
        inc     dword [ebp-8H]                          ; 20BB _ FF. 45, F8
?_095:  mov     eax, dword [ebp+8H]                     ; 20BE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20C1 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 20C3 _ 39. 45, F8
        jl      ?_094                                   ; 20C6 _ 7C, E2
        jmp     ?_097                                   ; 20C8 _ EB, 01

?_096:  nop                                             ; 20CA _ 90
?_097:  cmp     dword [ebp-8H], 0                       ; 20CB _ 83. 7D, F8, 00
        jle near      ?_099                                   ; 20cf _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 20D5 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 20D8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20DB _ 8B. 45, 08
        add     edx, 2                                  ; 20DE _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 20E1 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 20E4 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 20E7 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 20EA _ 8B. 45, 08
        add     ecx, 2                                  ; 20ED _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 20F0 _ 8B. 44 C8, 04
        add     eax, edx                                ; 20F4 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 20F6 _ 39. 45, 0C
        jne near      ?_099                                   ; 20f9 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 20FF _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2102 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2105 _ 8B. 45, 08
        add     edx, 2                                  ; 2108 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 210B _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 210F _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 2112 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 2115 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2118 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 211B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 211E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2121 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2125 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2128 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 212A _ 39. 45, F8
        jge near      ?_098                                   ; 212d _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 212F _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2132 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2135 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2138 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 213B _ 8B. 55, F8
        add     edx, 2                                  ; 213E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2141 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2144 _ 39. C1
        jnz near      ?_098                                   ; 2146 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 2148 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 214B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 214E _ 8B. 45, 08
        add     edx, 2                                  ; 2151 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2154 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2158 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 215B _ 8B. 4D, F8
        add     ecx, 2                                  ; 215E _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2161 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 2165 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 2168 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 216B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 216E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2171 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2174 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2178 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 217B _ 8B. 00
        lea     edx, [eax-1H]                           ; 217D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2180 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2183 _ 89. 10
?_098:  mov     eax, 0                                  ; 2185 _ B8, 00000000
        jmp     ?_105                                   ; 218A _ E9, 0000011B

?_099:  mov     eax, dword [ebp+8H]                     ; 218F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2192 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 2194 _ 39. 45, F8
        jge near      ?_100                                   ; 2197 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 2199 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 219C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 219F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21A2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 21A5 _ 8B. 55, F8
        add     edx, 2                                  ; 21A8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 21AB _ 8B. 04 D0
        cmp     ecx, eax                                ; 21AE _ 39. C1
        jnz near      ?_100                                   ; 21b0 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 21B2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 21B5 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 21B8 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 21BB _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 21BE _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 21C1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 21C4 _ 8B. 55, F8
        add     edx, 2                                  ; 21C7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 21CA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 21CE _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 21D1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21D4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 21D7 _ 8B. 55, F8
        add     edx, 2                                  ; 21DA _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 21DD _ 89. 4C D0, 04
        mov     eax, 0                                  ; 21E1 _ B8, 00000000
        jmp     ?_105                                   ; 21E6 _ E9, 000000BF

?_100:  mov     eax, dword [ebp+8H]                     ; 21EB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21EE _ 8B. 00
        cmp     eax, 4095                               ; 21F0 _ 3D, 00000FFF
        jg  near      ?_104                                   ; 21f5 _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 21FB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21FE _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2200 _ 89. 45, F4
        jmp     ?_102                                   ; 2203 _ EB, 27

?_101:  mov     eax, dword [ebp-0CH]                    ; 2205 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2208 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 220B _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 220E _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 2211 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2214 _ 8B. 45, 08
        add     edx, 2                                  ; 2217 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 221A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 221D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 221F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2222 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2225 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 2229 _ FF. 4D, F4
?_102:  mov     eax, dword [ebp-0CH]                    ; 222C _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 222F _ 3B. 45, F8
        jg  near      ?_101                                   ; 2232 _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 2234 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2237 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2239 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 223C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 223F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2241 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2244 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2247 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 224A _ 8B. 00
        cmp     edx, eax                                ; 224C _ 39. C2
        jge near      ?_103                                   ; 224e _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 2250 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2253 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2255 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2258 _ 89. 50, 04
?_103:  mov     eax, dword [ebp+8H]                     ; 225B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 225E _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2261 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2264 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2267 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 226A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 226D _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2270 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2273 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2276 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 227A _ B8, 00000000
        jmp     ?_105                                   ; 227F _ EB, 29

?_104:  mov     eax, dword [ebp+8H]                     ; 2281 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2284 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2287 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 228A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 228D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2290 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2293 _ 8B. 40, 08
        mov     edx, eax                                ; 2296 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2298 _ 8B. 45, 10
        add     eax, edx                                ; 229B _ 01. D0
        mov     edx, eax                                ; 229D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 229F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 22A2 _ 89. 50, 08
        mov     eax, 4294967295                         ; 22A5 _ B8, FFFFFFFF
?_105:  add     esp, 16                                 ; 22AA _ 83. C4, 10
        pop     ebx                                     ; 22AD _ 5B
        pop     ebp                                     ; 22AE _ 5D
        ret                                             ; 22AF _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 22B0 _ 55
        mov     ebp, esp                                ; 22B1 _ 89. E5
        sub     esp, 16                                 ; 22B3 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 22B6 _ 8B. 45, 0C
        add     eax, 4095                               ; 22B9 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 22BE _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 22C3 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 22C6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 22C9 _ FF. 75, 08
        call    memman_alloc                            ; 22CC _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 22D1 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 22D4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 22D7 _ 8B. 45, FC
        leave                                           ; 22DA _ C9
        ret                                             ; 22DB _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 22DC _ 55
        mov     ebp, esp                                ; 22DD _ 89. E5
        sub     esp, 16                                 ; 22DF _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 22E2 _ 8B. 45, 10
        add     eax, 4095                               ; 22E5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 22EA _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 22EF _ 89. 45, 10
        push    dword [ebp+10H]                         ; 22F2 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 22F5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 22F8 _ FF. 75, 08
        call    memman_free                             ; 22FB _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2300 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 2303 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2306 _ 8B. 45, FC
        leave                                           ; 2309 _ C9
        ret                                             ; 230A _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 230B _ 55
        mov     ebp, esp                                ; 230C _ 89. E5
        sub     esp, 24                                 ; 230E _ 83. EC, 18
        sub     esp, 8                                  ; 2311 _ 83. EC, 08
        push    9232                                    ; 2314 _ 68, 00002410
        push    dword [ebp+8H]                          ; 2319 _ FF. 75, 08
        call    memman_alloc_4k                         ; 231C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2321 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 2324 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 2327 _ 83. 7D, F0, 00
        jnz near      ?_106                                   ; 232b _ 75, 0a
        mov     eax, 0                                  ; 232D _ B8, 00000000
        jmp     ?_110                                   ; 2332 _ E9, 00000099

?_106:  mov     eax, dword [ebp+10H]                    ; 2337 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 233A _ 0F AF. 45, 14
        sub     esp, 8                                  ; 233E _ 83. EC, 08
        push    eax                                     ; 2341 _ 50
        push    dword [ebp+8H]                          ; 2342 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2345 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 234A _ 83. C4, 10
        mov     edx, eax                                ; 234D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 234F _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2352 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2355 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2358 _ 8B. 40, 04
        test    eax, eax                                ; 235B _ 85. C0
        jnz near      ?_107                                   ; 235d _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 235F _ 8B. 45, F0
        sub     esp, 4                                  ; 2362 _ 83. EC, 04
        push    9232                                    ; 2365 _ 68, 00002410
        push    eax                                     ; 236A _ 50
        push    dword [ebp+8H]                          ; 236B _ FF. 75, 08
        call    memman_free_4k                          ; 236E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2373 _ 83. C4, 10
        mov     eax, 0                                  ; 2376 _ B8, 00000000
        jmp     ?_110                                   ; 237B _ EB, 53

?_107:  mov     eax, dword [ebp-10H]                    ; 237D _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 2380 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2383 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2385 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 2388 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 238B _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 238E _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 2391 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2394 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 2397 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 239A _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 23A1 _ C7. 45, F4, 00000000
        jmp     ?_109                                   ; 23A8 _ EB, 1A

?_108:  mov     eax, dword [ebp-10H]                    ; 23AA _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 23AD _ 8B. 55, F4
        add     edx, 33                                 ; 23B0 _ 83. C2, 21
        shl     edx, 5                                  ; 23B3 _ C1. E2, 05
        add     eax, edx                                ; 23B6 _ 01. D0
        add     eax, 16                                 ; 23B8 _ 83. C0, 10
        mov     dword [eax], 0                          ; 23BB _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 23C1 _ FF. 45, F4
?_109:  cmp     dword [ebp-0CH], 255                    ; 23C4 _ 81. 7D, F4, 000000FF
        jle near      ?_108                                   ; 23cb _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 23CD _ 8B. 45, F0
?_110:  leave                                           ; 23D0 _ C9
        ret                                             ; 23D1 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 23D2 _ 55
        mov     ebp, esp                                ; 23D3 _ 89. E5
        sub     esp, 16                                 ; 23D5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 23D8 _ C7. 45, FC, 00000000
        jmp     ?_113                                   ; 23DF _ EB, 5A

?_111:  mov     eax, dword [ebp+8H]                     ; 23E1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 23E4 _ 8B. 55, FC
        add     edx, 33                                 ; 23E7 _ 83. C2, 21
        shl     edx, 5                                  ; 23EA _ C1. E2, 05
        add     eax, edx                                ; 23ED _ 01. D0
        add     eax, 16                                 ; 23EF _ 83. C0, 10
        mov     eax, dword [eax]                        ; 23F2 _ 8B. 00
        test    eax, eax                                ; 23F4 _ 85. C0
        jnz near      ?_112                                   ; 23f6 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 23F8 _ 8B. 45, FC
        shl     eax, 5                                  ; 23FB _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 23FE _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2404 _ 8B. 45, 08
        add     eax, edx                                ; 2407 _ 01. D0
        add     eax, 4                                  ; 2409 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 240C _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 240F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2412 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 2415 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 2418 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 241B _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 241F _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 2422 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 2429 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 242C _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2433 _ 8B. 45, F8
        jmp     ?_114                                   ; 2436 _ EB, 11

?_112:  inc     dword [ebp-4H]                          ; 2438 _ FF. 45, FC
?_113:  cmp     dword [ebp-4H], 255                     ; 243B _ 81. 7D, FC, 000000FF
        jle near      ?_111                                   ; 2442 _ 7e, 9d
        mov     eax, 0                                  ; 2444 _ B8, 00000000
?_114:  leave                                           ; 2449 _ C9
        ret                                             ; 244A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 244B _ 55
        mov     ebp, esp                                ; 244C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 244E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2451 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2454 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2456 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2459 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 245C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 245F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2462 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2465 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2468 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 246B _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 246E _ 89. 50, 14
        nop                                             ; 2471 _ 90
        pop     ebp                                     ; 2472 _ 5D
        ret                                             ; 2473 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2474 _ 55
        mov     ebp, esp                                ; 2475 _ 89. E5
        push    esi                                     ; 2477 _ 56
        push    ebx                                     ; 2478 _ 53
        sub     esp, 16                                 ; 2479 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 247C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 247F _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2482 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2485 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2488 _ 8B. 40, 10
        inc     eax                                     ; 248B _ 40
        cmp     dword [ebp+10H], eax                    ; 248C _ 39. 45, 10
        jle near      ?_115                                   ; 248f _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 2491 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2494 _ 8B. 40, 10
        inc     eax                                     ; 2497 _ 40
        mov     dword [ebp+10H], eax                    ; 2498 _ 89. 45, 10
?_115:  cmp     dword [ebp+10H], -1                     ; 249B _ 83. 7D, 10, FF
        jge near      ?_116                                   ; 249f _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 24A1 _ C7. 45, 10, FFFFFFFF
?_116:  mov     eax, dword [ebp+0CH]                    ; 24A8 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 24AB _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 24AE _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 24B1 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 24B4 _ 3B. 45, 10
        jle near      ?_123                                   ; 24b7 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 24BD _ 83. 7D, 10, 00
        js near       ?_119                                   ; 24c1 _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 24C7 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 24CA _ 89. 45, F4
        jmp     ?_118                                   ; 24CD _ EB, 33

?_117:  mov     eax, dword [ebp-0CH]                    ; 24CF _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 24D2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 24D5 _ 8B. 45, 08
        add     edx, 4                                  ; 24D8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 24DB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 24DF _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 24E2 _ 8B. 4D, F4
        add     ecx, 4                                  ; 24E5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 24E8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 24EC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24EF _ 8B. 55, F4
        add     edx, 4                                  ; 24F2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 24F5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 24F9 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 24FC _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 24FF _ FF. 4D, F4
?_118:  mov     eax, dword [ebp-0CH]                    ; 2502 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2505 _ 3B. 45, 10
        jg  near      ?_117                                   ; 2508 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 250A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 250D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2510 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2513 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2516 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 251A _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 251D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2520 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2523 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2526 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2529 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 252C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 252F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2532 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2535 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2538 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 253B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 253E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2541 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2544 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2547 _ 8B. 40, 0C
        sub     esp, 8                                  ; 254A _ 83. EC, 08
        push    esi                                     ; 254D _ 56
        push    ebx                                     ; 254E _ 53
        push    ecx                                     ; 254F _ 51
        push    edx                                     ; 2550 _ 52
        push    eax                                     ; 2551 _ 50
        push    dword [ebp+8H]                          ; 2552 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2555 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 255A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 255D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2560 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2563 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2566 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2569 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 256C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 256F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2572 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2575 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2578 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 257B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 257E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2581 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2584 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2587 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 258A _ 8B. 40, 0C
        sub     esp, 4                                  ; 258D _ 83. EC, 04
        push    dword [ebp-10H]                         ; 2590 _ FF. 75, F0
        push    esi                                     ; 2593 _ 56
        push    ebx                                     ; 2594 _ 53
        push    ecx                                     ; 2595 _ 51
        push    edx                                     ; 2596 _ 52
        push    eax                                     ; 2597 _ 50
        push    dword [ebp+8H]                          ; 2598 _ FF. 75, 08
        call    sheet_refreshsub                        ; 259B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25A0 _ 83. C4, 20
        jmp     ?_130                                   ; 25A3 _ E9, 00000239

?_119:  mov     eax, dword [ebp+8H]                     ; 25A8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25AB _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 25AE _ 39. 45, F0
        jge near      ?_122                                   ; 25b1 _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 25B3 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 25B6 _ 89. 45, F4
        jmp     ?_121                                   ; 25B9 _ EB, 33

?_120:  mov     eax, dword [ebp-0CH]                    ; 25BB _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 25BE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 25C1 _ 8B. 45, 08
        add     edx, 4                                  ; 25C4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 25C7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 25CB _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 25CE _ 8B. 4D, F4
        add     ecx, 4                                  ; 25D1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 25D4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 25D8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 25DB _ 8B. 55, F4
        add     edx, 4                                  ; 25DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 25E1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 25E5 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 25E8 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 25EB _ FF. 45, F4
?_121:  mov     eax, dword [ebp+8H]                     ; 25EE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25F1 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 25F4 _ 39. 45, F4
        jl      ?_120                                   ; 25F7 _ 7C, C2
?_122:  mov     eax, dword [ebp+8H]                     ; 25F9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25FC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 25FF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2602 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2605 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2608 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 260B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 260E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2611 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2614 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2617 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 261A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 261D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2620 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2623 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2626 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2629 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 262C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 262F _ 8B. 40, 0C
        sub     esp, 8                                  ; 2632 _ 83. EC, 08
        push    0                                       ; 2635 _ 6A, 00
        push    ebx                                     ; 2637 _ 53
        push    ecx                                     ; 2638 _ 51
        push    edx                                     ; 2639 _ 52
        push    eax                                     ; 263A _ 50
        push    dword [ebp+8H]                          ; 263B _ FF. 75, 08
        call    sheet_refreshmap                        ; 263E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2643 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2646 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 2649 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 264C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 264F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2652 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2655 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2658 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 265B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 265E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2661 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2664 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2667 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 266A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 266D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2670 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2673 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2676 _ 83. EC, 04
        push    esi                                     ; 2679 _ 56
        push    0                                       ; 267A _ 6A, 00
        push    ebx                                     ; 267C _ 53
        push    ecx                                     ; 267D _ 51
        push    edx                                     ; 267E _ 52
        push    eax                                     ; 267F _ 50
        push    dword [ebp+8H]                          ; 2680 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2683 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2688 _ 83. C4, 20
        jmp     ?_130                                   ; 268B _ E9, 00000151

?_123:  mov     eax, dword [ebp-10H]                    ; 2690 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2693 _ 3B. 45, 10
        jge near      ?_130                                   ; 2696 _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 269C _ 83. 7D, F0, 00
        js near       ?_126                                   ; 26a0 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 26A2 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 26A5 _ 89. 45, F4
        jmp     ?_125                                   ; 26A8 _ EB, 33

?_124:  mov     eax, dword [ebp-0CH]                    ; 26AA _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 26AD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 26B0 _ 8B. 45, 08
        add     edx, 4                                  ; 26B3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 26B6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 26BA _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 26BD _ 8B. 4D, F4
        add     ecx, 4                                  ; 26C0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 26C3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 26C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26CA _ 8B. 55, F4
        add     edx, 4                                  ; 26CD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26D0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 26D4 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 26D7 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 26DA _ FF. 45, F4
?_125:  mov     eax, dword [ebp-0CH]                    ; 26DD _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 26E0 _ 3B. 45, 10
        jl      ?_124                                   ; 26E3 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 26E5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 26E8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 26EB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 26EE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 26F1 _ 89. 54 88, 04
        jmp     ?_129                                   ; 26F5 _ EB, 69

?_126:  mov     eax, dword [ebp+8H]                     ; 26F7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 26FA _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 26FD _ 89. 45, F4
        jmp     ?_128                                   ; 2700 _ EB, 37

?_127:  mov     eax, dword [ebp-0CH]                    ; 2702 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 2705 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2708 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 270B _ 8B. 55, F4
        add     edx, 4                                  ; 270E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2711 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2715 _ 8B. 45, 08
        add     ecx, 4                                  ; 2718 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 271B _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 271F _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2722 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2725 _ 8B. 45, 08
        add     edx, 4                                  ; 2728 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 272B _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 272F _ 8B. 55, F4
        inc     edx                                     ; 2732 _ 42
        mov     dword [eax+18H], edx                    ; 2733 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2736 _ FF. 4D, F4
?_128:  mov     eax, dword [ebp-0CH]                    ; 2739 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 273C _ 3B. 45, 10
        jge near      ?_127                                   ; 273f _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 2741 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2744 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2747 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 274A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 274D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2751 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2754 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2757 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 275A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 275D _ 89. 50, 10
?_129:  mov     eax, dword [ebp+0CH]                    ; 2760 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2763 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2766 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2769 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 276C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 276F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2772 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2775 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2778 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 277B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 277E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2781 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2784 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2787 _ 8B. 40, 0C
        sub     esp, 8                                  ; 278A _ 83. EC, 08
        push    dword [ebp+10H]                         ; 278D _ FF. 75, 10
        push    ebx                                     ; 2790 _ 53
        push    ecx                                     ; 2791 _ 51
        push    edx                                     ; 2792 _ 52
        push    eax                                     ; 2793 _ 50
        push    dword [ebp+8H]                          ; 2794 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2797 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 279C _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 279F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27A2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27A5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27A8 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 27AB _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27AE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27B1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27B4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 27B7 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 27BA _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 27BD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27C0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27C3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 27C6 _ 8B. 40, 0C
        sub     esp, 4                                  ; 27C9 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 27CC _ FF. 75, 10
        push    dword [ebp+10H]                         ; 27CF _ FF. 75, 10
        push    ebx                                     ; 27D2 _ 53
        push    ecx                                     ; 27D3 _ 51
        push    edx                                     ; 27D4 _ 52
        push    eax                                     ; 27D5 _ 50
        push    dword [ebp+8H]                          ; 27D6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 27D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27DE _ 83. C4, 20
?_130:  nop                                             ; 27E1 _ 90
        lea     esp, [ebp-8H]                           ; 27E2 _ 8D. 65, F8
        pop     ebx                                     ; 27E5 _ 5B
        pop     esi                                     ; 27E6 _ 5E
        pop     ebp                                     ; 27E7 _ 5D
        ret                                             ; 27E8 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 27E9 _ 55
        mov     ebp, esp                                ; 27EA _ 89. E5
        push    edi                                     ; 27EC _ 57
        push    esi                                     ; 27ED _ 56
        push    ebx                                     ; 27EE _ 53
        sub     esp, 28                                 ; 27EF _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 27F2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 27F5 _ 8B. 40, 18
        test    eax, eax                                ; 27F8 _ 85. C0
        js near       ?_131                                   ; 27fa _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 27FC _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 27FF _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 2802 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 2805 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 2808 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 280B _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 280E _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 2811 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 2814 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2817 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 281A _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 281D _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2820 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2823 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 2826 _ 8B. 45, 14
        add     edx, eax                                ; 2829 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 282B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 282E _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2831 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2834 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2837 _ 03. 45, E4
        sub     esp, 4                                  ; 283A _ 83. EC, 04
        push    ebx                                     ; 283D _ 53
        push    ecx                                     ; 283E _ 51
        push    edi                                     ; 283F _ 57
        push    esi                                     ; 2840 _ 56
        push    edx                                     ; 2841 _ 52
        push    eax                                     ; 2842 _ 50
        push    dword [ebp+8H]                          ; 2843 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2846 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 284B _ 83. C4, 20
?_131:  mov     eax, 0                                  ; 284E _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2853 _ 8D. 65, F4
        pop     ebx                                     ; 2856 _ 5B
        pop     esi                                     ; 2857 _ 5E
        pop     edi                                     ; 2858 _ 5F
        pop     ebp                                     ; 2859 _ 5D
        ret                                             ; 285A _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 285B _ 55
        mov     ebp, esp                                ; 285C _ 89. E5
        push    esi                                     ; 285E _ 56
        push    ebx                                     ; 285F _ 53
        sub     esp, 16                                 ; 2860 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2863 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2866 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2869 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 286C _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 286F _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2872 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2875 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2878 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 287B _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 287E _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2881 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2884 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2887 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 288A _ 8B. 40, 18
        test    eax, eax                                ; 288D _ 85. C0
        js near       ?_132                                   ; 288f _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 2895 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2898 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 289B _ 8B. 45, F0
        add     edx, eax                                ; 289E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28A0 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 28A3 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 28A6 _ 8B. 45, F4
        add     eax, ecx                                ; 28A9 _ 01. C8
        sub     esp, 8                                  ; 28AB _ 83. EC, 08
        push    0                                       ; 28AE _ 6A, 00
        push    edx                                     ; 28B0 _ 52
        push    eax                                     ; 28B1 _ 50
        push    dword [ebp-10H]                         ; 28B2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 28B5 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 28B8 _ FF. 75, 08
        call    sheet_refreshmap                        ; 28BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 28C0 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 28C3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 28C6 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 28C9 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 28CC _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 28CF _ 8B. 55, 14
        add     ecx, edx                                ; 28D2 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 28D4 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 28D7 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 28DA _ 8B. 55, 10
        add     edx, ebx                                ; 28DD _ 01. DA
        sub     esp, 8                                  ; 28DF _ 83. EC, 08
        push    eax                                     ; 28E2 _ 50
        push    ecx                                     ; 28E3 _ 51
        push    edx                                     ; 28E4 _ 52
        push    dword [ebp+14H]                         ; 28E5 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 28E8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 28EB _ FF. 75, 08
        call    sheet_refreshmap                        ; 28EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 28F3 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 28F6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 28F9 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 28FC _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 28FF _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2902 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2905 _ 8B. 45, F0
        add     edx, eax                                ; 2908 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 290A _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 290D _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2910 _ 8B. 45, F4
        add     eax, ebx                                ; 2913 _ 01. D8
        sub     esp, 4                                  ; 2915 _ 83. EC, 04
        push    ecx                                     ; 2918 _ 51
        push    0                                       ; 2919 _ 6A, 00
        push    edx                                     ; 291B _ 52
        push    eax                                     ; 291C _ 50
        push    dword [ebp-10H]                         ; 291D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2920 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2923 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2926 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 292B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 292E _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2931 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2934 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2937 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 293A _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 293D _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2940 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2943 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2945 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2948 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 294B _ 8B. 4D, 10
        add     ecx, esi                                ; 294E _ 01. F1
        sub     esp, 4                                  ; 2950 _ 83. EC, 04
        push    edx                                     ; 2953 _ 52
        push    eax                                     ; 2954 _ 50
        push    ebx                                     ; 2955 _ 53
        push    ecx                                     ; 2956 _ 51
        push    dword [ebp+14H]                         ; 2957 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 295A _ FF. 75, 10
        push    dword [ebp+8H]                          ; 295D _ FF. 75, 08
        call    sheet_refreshsub                        ; 2960 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2965 _ 83. C4, 20
?_132:  nop                                             ; 2968 _ 90
        lea     esp, [ebp-8H]                           ; 2969 _ 8D. 65, F8
        pop     ebx                                     ; 296C _ 5B
        pop     esi                                     ; 296D _ 5E
        pop     ebp                                     ; 296E _ 5D
        ret                                             ; 296F _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2970 _ 55
        mov     ebp, esp                                ; 2971 _ 89. E5
        sub     esp, 48                                 ; 2973 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2976 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2979 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 297B _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 297E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2981 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2984 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2987 _ 83. 7D, 0C, 00
        jns     ?_133                                   ; 298B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 298D _ C7. 45, 0C, 00000000
?_133:  cmp     dword [ebp+10H], 8                      ; 2994 _ 83. 7D, 10, 08
        jg  near      ?_134                                   ; 2998 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 299A _ C7. 45, 10, 00000000
?_134:  mov     eax, dword [ebp+8H]                     ; 29A1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 29A4 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 29A7 _ 39. 45, 14
        jle near      ?_135                                   ; 29aa _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 29AC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 29AF _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 29B2 _ 89. 45, 14
?_135:  mov     eax, dword [ebp+8H]                     ; 29B5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29B8 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 29BB _ 39. 45, 18
        jle near      ?_136                                   ; 29be _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 29C0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29C3 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 29C6 _ 89. 45, 18
?_136:  mov     eax, dword [ebp+1CH]                    ; 29C9 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 29CC _ 89. 45, FC
        jmp     ?_143                                   ; 29CF _ E9, 0000010E

?_137:  mov     eax, dword [ebp+8H]                     ; 29D4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 29D7 _ 8B. 55, FC
        add     edx, 4                                  ; 29DA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 29DD _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 29E1 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 29E4 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 29E7 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 29E9 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 29EC _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 29EF _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 29F5 _ 8B. 45, E8
        sub     eax, edx                                ; 29F8 _ 29. D0
        sar     eax, 5                                  ; 29FA _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 29FD _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2A00 _ C7. 45, F4, 00000000
        jmp     ?_142                                   ; 2A07 _ E9, 000000C4

?_138:  mov     eax, dword [ebp-18H]                    ; 2A0C _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2A0F _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2A12 _ 8B. 45, F4
        add     eax, edx                                ; 2A15 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2A17 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2A1A _ C7. 45, F8, 00000000
        jmp     ?_141                                   ; 2A21 _ E9, 00000098

?_139:  mov     eax, dword [ebp-18H]                    ; 2A26 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2A29 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2A2C _ 8B. 45, F8
        add     eax, edx                                ; 2A2F _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2A31 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2A34 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2A37 _ 3B. 45, D8
        jg  near      ?_140                                   ; 2a3a _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 2A3C _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2A3F _ 3B. 45, 14
        jge near      ?_140                                   ; 2a42 _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2A44 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2A47 _ 3B. 45, DC
        jg  near      ?_140                                   ; 2a4a _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 2A4C _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2A4F _ 3B. 45, 18
        jge near      ?_140                                   ; 2a52 _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2A54 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A57 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2A5A _ 0F AF. 45, F4
        mov     edx, eax                                ; 2A5E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2A60 _ 8B. 45, F8
        add     eax, edx                                ; 2A63 _ 01. D0
        mov     edx, eax                                ; 2A65 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2A67 _ 8B. 45, E4
        add     eax, edx                                ; 2A6A _ 01. D0
        mov     al, byte [eax]                          ; 2A6C _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2A6E _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2A71 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A74 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2A77 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2A7B _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2A7D _ 8B. 45, D8
        add     eax, edx                                ; 2A80 _ 01. D0
        mov     edx, eax                                ; 2A82 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2A84 _ 8B. 45, EC
        add     eax, edx                                ; 2A87 _ 01. D0
        mov     al, byte [eax]                          ; 2A89 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2A8B _ 38. 45, E3
        jnz near      ?_140                                   ; 2a8e _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 2A90 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2A94 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2A97 _ 8B. 40, 14
        cmp     edx, eax                                ; 2A9A _ 39. C2
        jz near       ?_140                                   ; 2a9c _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2A9E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AA1 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2AA4 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2AA8 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2AAA _ 8B. 45, D8
        add     eax, edx                                ; 2AAD _ 01. D0
        mov     edx, eax                                ; 2AAF _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2AB1 _ 8B. 45, F0
        add     edx, eax                                ; 2AB4 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2AB6 _ 8A. 45, D7
        mov     byte [edx], al                          ; 2AB9 _ 88. 02
?_140:  inc     dword [ebp-8H]                          ; 2ABB _ FF. 45, F8
?_141:  mov     eax, dword [ebp-18H]                    ; 2ABE _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2AC1 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2AC4 _ 39. 45, F8
        jl      ?_139                                   ; 2AC7 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 2ACD _ FF. 45, F4
?_142:  mov     eax, dword [ebp-18H]                    ; 2AD0 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2AD3 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 2AD6 _ 39. 45, F4
        jl      ?_138                                   ; 2AD9 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 2ADF _ FF. 45, FC
?_143:  mov     eax, dword [ebp-4H]                     ; 2AE2 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 2AE5 _ 3B. 45, 20
        jle near      ?_137                                   ; 2ae8 _ 0f 8e, fffffee6
        nop                                             ; 2AEE _ 90
        nop                                             ; 2AEF _ 90
        leave                                           ; 2AF0 _ C9
        ret                                             ; 2AF1 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2AF2 _ 55
        mov     ebp, esp                                ; 2AF3 _ 89. E5
        sub     esp, 64                                 ; 2AF5 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2AF8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2AFB _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2AFE _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 2B01 _ 83. 7D, 0C, 00
        jns     ?_144                                   ; 2B05 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2B07 _ C7. 45, 0C, 00000000
?_144:  cmp     dword [ebp+10H], 0                      ; 2B0E _ 83. 7D, 10, 00
        jns     ?_145                                   ; 2B12 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2B14 _ C7. 45, 10, 00000000
?_145:  mov     eax, dword [ebp+8H]                     ; 2B1B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B1E _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2B21 _ 39. 45, 14
        jle near      ?_146                                   ; 2b24 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2B26 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B29 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2B2C _ 89. 45, 14
?_146:  mov     eax, dword [ebp+8H]                     ; 2B2F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B32 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2B35 _ 39. 45, 18
        jle near      ?_147                                   ; 2b38 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2B3A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B3D _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2B40 _ 89. 45, 18
?_147:  mov     eax, dword [ebp+1CH]                    ; 2B43 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2B46 _ 89. 45, FC
        jmp     ?_158                                   ; 2B49 _ E9, 00000137

?_148:  mov     eax, dword [ebp+8H]                     ; 2B4E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2B51 _ 8B. 55, FC
        add     edx, 4                                  ; 2B54 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2B57 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2B5B _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2B5E _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2B61 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2B67 _ 8B. 45, DC
        sub     eax, edx                                ; 2B6A _ 29. D0
        sar     eax, 5                                  ; 2B6C _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2B6F _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2B72 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2B75 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2B77 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2B7A _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2B7D _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2B80 _ 8B. 55, 0C
        sub     edx, eax                                ; 2B83 _ 29. C2
        mov     eax, edx                                ; 2B85 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2B87 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2B8A _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2B8D _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2B90 _ 8B. 55, 10
        sub     edx, eax                                ; 2B93 _ 29. C2
        mov     eax, edx                                ; 2B95 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2B97 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2B9A _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2B9D _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2BA0 _ 8B. 55, 14
        sub     edx, eax                                ; 2BA3 _ 29. C2
        mov     eax, edx                                ; 2BA5 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2BA7 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2BAA _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2BAD _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2BB0 _ 8B. 55, 18
        sub     edx, eax                                ; 2BB3 _ 29. C2
        mov     eax, edx                                ; 2BB5 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2BB7 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2BBA _ 83. 7D, F0, 00
        jns     ?_149                                   ; 2BBE _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2BC0 _ C7. 45, F0, 00000000
?_149:  cmp     dword [ebp-14H], 0                      ; 2BC7 _ 83. 7D, EC, 00
        jns     ?_150                                   ; 2BCB _ 79, 07
        mov     dword [ebp-14H], 0                      ; 2BCD _ C7. 45, EC, 00000000
?_150:  mov     eax, dword [ebp-24H]                    ; 2BD4 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2BD7 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 2BDA _ 39. 45, E8
        jle near      ?_151                                   ; 2bdd _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2BDF _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2BE2 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2BE5 _ 89. 45, E8
?_151:  mov     eax, dword [ebp-24H]                    ; 2BE8 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2BEB _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2BEE _ 39. 45, E4
        jle near      ?_152                                   ; 2bf1 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2BF3 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2BF6 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2BF9 _ 89. 45, E4
?_152:  mov     eax, dword [ebp-14H]                    ; 2BFC _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2BFF _ 89. 45, F4
        jmp     ?_157                                   ; 2C02 _ EB, 76

?_153:  mov     eax, dword [ebp-24H]                    ; 2C04 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2C07 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2C0A _ 8B. 45, F4
        add     eax, edx                                ; 2C0D _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2C0F _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2C12 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2C15 _ 89. 45, F8
        jmp     ?_156                                   ; 2C18 _ EB, 55

?_154:  mov     eax, dword [ebp-24H]                    ; 2C1A _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2C1D _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2C20 _ 8B. 45, F8
        add     eax, edx                                ; 2C23 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2C25 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2C28 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2C2B _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2C2E _ 0F AF. 45, F4
        mov     edx, eax                                ; 2C32 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2C34 _ 8B. 45, F8
        add     eax, edx                                ; 2C37 _ 01. D0
        mov     edx, eax                                ; 2C39 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2C3B _ 8B. 45, D4
        add     eax, edx                                ; 2C3E _ 01. D0
        mov     al, byte [eax]                          ; 2C40 _ 8A. 00
        movzx   edx, al                                 ; 2C42 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2C45 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2C48 _ 8B. 40, 14
        cmp     edx, eax                                ; 2C4B _ 39. C2
        jz near       ?_155                                   ; 2c4d _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2C4F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C52 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2C55 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2C59 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2C5B _ 8B. 45, CC
        add     eax, edx                                ; 2C5E _ 01. D0
        mov     edx, eax                                ; 2C60 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2C62 _ 8B. 45, E0
        add     edx, eax                                ; 2C65 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2C67 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2C6A _ 88. 02
?_155:  inc     dword [ebp-8H]                          ; 2C6C _ FF. 45, F8
?_156:  mov     eax, dword [ebp-8H]                     ; 2C6F _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2C72 _ 3B. 45, E8
        jl      ?_154                                   ; 2C75 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2C77 _ FF. 45, F4
?_157:  mov     eax, dword [ebp-0CH]                    ; 2C7A _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2C7D _ 3B. 45, E4
        jl      ?_153                                   ; 2C80 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2C82 _ FF. 45, FC
?_158:  mov     eax, dword [ebp+8H]                     ; 2C85 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C88 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2C8B _ 39. 45, FC
        jle near      ?_148                                   ; 2c8e _ 0f 8e, fffffeba
        nop                                             ; 2C94 _ 90
        leave                                           ; 2C95 _ C9
        ret                                             ; 2C96 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2C97 _ 55
        mov     ebp, esp                                ; 2C98 _ 89. E5
        sub     esp, 24                                 ; 2C9A _ 83. EC, 18
        sub     esp, 8                                  ; 2C9D _ 83. EC, 08
        push    52                                      ; 2CA0 _ 6A, 34
        push    67                                      ; 2CA2 _ 6A, 43
        call    io_out8                                 ; 2CA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CA9 _ 83. C4, 10
        sub     esp, 8                                  ; 2CAC _ 83. EC, 08
        push    156                                     ; 2CAF _ 68, 0000009C
        push    64                                      ; 2CB4 _ 6A, 40
        call    io_out8                                 ; 2CB6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CBB _ 83. C4, 10
        sub     esp, 8                                  ; 2CBE _ 83. EC, 08
        push    46                                      ; 2CC1 _ 6A, 2E
        push    64                                      ; 2CC3 _ 6A, 40
        call    io_out8                                 ; 2CC5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CCA _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2CCD _ C7. 05, 00000360(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2CD7 _ C7. 45, F4, 00000000
        jmp     ?_160                                   ; 2CDE _ EB, 25

?_159:  mov     eax, dword [ebp-0CH]                    ; 2CE0 _ 8B. 45, F4
        shl     eax, 4                                  ; 2CE3 _ C1. E0, 04
        add     eax, ?_228                              ; 2CE6 _ 05, 00000368(d)
        mov     dword [eax], 0                          ; 2CEB _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2CF1 _ 8B. 45, F4
        shl     eax, 4                                  ; 2CF4 _ C1. E0, 04
        add     eax, ?_229                              ; 2CF7 _ 05, 0000036C(d)
        mov     dword [eax], 0                          ; 2CFC _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2D02 _ FF. 45, F4
?_160:  cmp     dword [ebp-0CH], 499                    ; 2D05 _ 81. 7D, F4, 000001F3
        jle near      ?_159                                   ; 2d0c _ 7e, d2
        nop                                             ; 2D0E _ 90
        nop                                             ; 2D0F _ 90
        leave                                           ; 2D10 _ C9
        ret                                             ; 2D11 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2D12 _ 55
        mov     ebp, esp                                ; 2D13 _ 89. E5
        sub     esp, 16                                 ; 2D15 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2D18 _ C7. 45, FC, 00000000
        jmp     ?_163                                   ; 2D1F _ EB, 35

?_161:  mov     eax, dword [ebp-4H]                     ; 2D21 _ 8B. 45, FC
        shl     eax, 4                                  ; 2D24 _ C1. E0, 04
        add     eax, ?_228                              ; 2D27 _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2D2C _ 8B. 00
        test    eax, eax                                ; 2D2E _ 85. C0
        jnz near      ?_162                                   ; 2d30 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2D32 _ 8B. 45, FC
        shl     eax, 4                                  ; 2D35 _ C1. E0, 04
        add     eax, ?_228                              ; 2D38 _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2D3D _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2D43 _ 8B. 45, FC
        shl     eax, 4                                  ; 2D46 _ C1. E0, 04
        add     eax, timerctl                           ; 2D49 _ 05, 00000360(d)
        add     eax, 4                                  ; 2D4E _ 83. C0, 04
        jmp     ?_164                                   ; 2D51 _ EB, 11

?_162:  inc     dword [ebp-4H]                          ; 2D53 _ FF. 45, FC
?_163:  cmp     dword [ebp-4H], 499                     ; 2D56 _ 81. 7D, FC, 000001F3
        jle near      ?_161                                   ; 2d5d _ 7e, c2
        mov     eax, 0                                  ; 2D5F _ B8, 00000000
?_164:  leave                                           ; 2D64 _ C9
        ret                                             ; 2D65 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2D66 _ 55
        mov     ebp, esp                                ; 2D67 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2D69 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2D6C _ C7. 40, 04, 00000000
        nop                                             ; 2D73 _ 90
        pop     ebp                                     ; 2D74 _ 5D
        ret                                             ; 2D75 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2D76 _ 55
        mov     ebp, esp                                ; 2D77 _ 89. E5
        sub     esp, 4                                  ; 2D79 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2D7C _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2D7F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2D82 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2D85 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2D88 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D8B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2D8E _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2D91 _ 88. 50, 0C
        nop                                             ; 2D94 _ 90
        leave                                           ; 2D95 _ C9
        ret                                             ; 2D96 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2D97 _ 55
        mov     ebp, esp                                ; 2D98 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2D9A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2D9D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2DA0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2DA2 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2DA5 _ C7. 40, 04, 00000002
        nop                                             ; 2DAC _ 90
        pop     ebp                                     ; 2DAD _ 5D
        ret                                             ; 2DAE _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2DAF _ 55
        mov     ebp, esp                                ; 2DB0 _ 89. E5
        sub     esp, 24                                 ; 2DB2 _ 83. EC, 18
        sub     esp, 8                                  ; 2DB5 _ 83. EC, 08
        push    32                                      ; 2DB8 _ 6A, 20
        push    32                                      ; 2DBA _ 6A, 20
        call    io_out8                                 ; 2DBC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DC1 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2DC4 _ A1, 00000360(d)
        inc     eax                                     ; 2DC9 _ 40
        mov     dword [timerctl], eax                   ; 2DCA _ A3, 00000360(d)
        mov     byte [ebp-0DH], 0                       ; 2DCF _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2DD3 _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 2DDA _ E9, 000000A8

?_165:  mov     eax, dword [ebp-0CH]                    ; 2DDF _ 8B. 45, F4
        shl     eax, 4                                  ; 2DE2 _ C1. E0, 04
        add     eax, ?_228                              ; 2DE5 _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2DEA _ 8B. 00
        cmp     eax, 2                                  ; 2DEC _ 83. F8, 02
        jne near      ?_166                                   ; 2def _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2DF5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2DF8 _ C1. E0, 04
        add     eax, ?_227                              ; 2DFB _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2E00 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2E02 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2E05 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E08 _ C1. E0, 04
        add     eax, ?_227                              ; 2E0B _ 05, 00000364(d)
        mov     dword [eax], edx                        ; 2E10 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2E12 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E15 _ C1. E0, 04
        add     eax, ?_227                              ; 2E18 _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2E1D _ 8B. 00
        test    eax, eax                                ; 2E1F _ 85. C0
        jnz near      ?_166                                   ; 2e21 _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2E23 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E26 _ C1. E0, 04
        add     eax, ?_228                              ; 2E29 _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2E2E _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2E34 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E37 _ C1. E0, 04
        add     eax, ?_230                              ; 2E3A _ 05, 00000370(d)
        mov     al, byte [eax]                          ; 2E3F _ 8A. 00
        movzx   edx, al                                 ; 2E41 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2E44 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E47 _ C1. E0, 04
        add     eax, ?_229                              ; 2E4A _ 05, 0000036C(d)
        mov     eax, dword [eax]                        ; 2E4F _ 8B. 00
        sub     esp, 8                                  ; 2E51 _ 83. EC, 08
        push    edx                                     ; 2E54 _ 52
        push    eax                                     ; 2E55 _ 50
        call    fifo8_put                               ; 2E56 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E5B _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2E5E _ 8B. 45, F4
        shl     eax, 4                                  ; 2E61 _ C1. E0, 04
        add     eax, timerctl                           ; 2E64 _ 05, 00000360(d)
        lea     edx, [eax+4H]                           ; 2E69 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2E6C _ A1, 00000000(d)
        cmp     edx, eax                                ; 2E71 _ 39. C2
        jnz near      ?_166                                   ; 2e73 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2E75 _ C6. 45, F3, 01
?_166:  cmp     byte [ebp-0DH], 0                       ; 2E79 _ 80. 7D, F3, 00
        jz near       ?_167                                   ; 2e7d _ 74, 05
        call    task_switch                             ; 2E7F _ E8, FFFFFFFC(rel)
?_167:  inc     dword [ebp-0CH]                         ; 2E84 _ FF. 45, F4
?_168:  cmp     dword [ebp-0CH], 499                    ; 2E87 _ 81. 7D, F4, 000001F3
        jle near      ?_165                                   ; 2e8e _ 0f 8e, ffffff4b
        nop                                             ; 2E94 _ 90
        leave                                           ; 2E95 _ C9
        ret                                             ; 2E96 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2E97 _ 55
        mov     ebp, esp                                ; 2E98 _ 89. E5
        mov     eax, timerctl                           ; 2E9A _ B8, 00000360(d)
        pop     ebp                                     ; 2E9F _ 5D
        ret                                             ; 2EA0 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2EA1 _ 55
        mov     ebp, esp                                ; 2EA2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2EA4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2EA7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2EAA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2EAD _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2EB0 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2EB3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2EB5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2EB8 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2EBB _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2EBE _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2EC1 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2EC8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2ECB _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2ED2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2ED5 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2EDC _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2EDF _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2EE2 _ 89. 50, 18
        nop                                             ; 2EE5 _ 90
        pop     ebp                                     ; 2EE6 _ 5D
        ret                                             ; 2EE7 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2EE8 _ 55
        mov     ebp, esp                                ; 2EE9 _ 89. E5
        sub     esp, 24                                 ; 2EEB _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2EEE _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2EF1 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2EF4 _ 83. 7D, 08, 00
        jnz near      ?_169                                   ; 2ef8 _ 75, 0a
        mov     eax, 4294967295                         ; 2EFA _ B8, FFFFFFFF
        jmp     ?_173                                   ; 2EFF _ E9, 0000009F

?_169:  mov     eax, dword [ebp+8H]                     ; 2F04 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F07 _ 8B. 40, 10
        test    eax, eax                                ; 2F0A _ 85. C0
        jnz near      ?_170                                   ; 2f0c _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2F0E _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2F11 _ 8B. 40, 14
        or      eax, 01H                                ; 2F14 _ 83. C8, 01
        mov     edx, eax                                ; 2F17 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F19 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2F1C _ 89. 50, 14
        mov     eax, 4294967295                         ; 2F1F _ B8, FFFFFFFF
        jmp     ?_173                                   ; 2F24 _ EB, 7D

?_170:  mov     eax, dword [ebp+8H]                     ; 2F26 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2F29 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2F2B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F2E _ 8B. 40, 04
        add     edx, eax                                ; 2F31 _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2F33 _ 8A. 45, F4
        mov     byte [edx], al                          ; 2F36 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2F38 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F3B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2F3E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F41 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2F44 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2F47 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2F4A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2F4D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F50 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2F53 _ 39. C2
        jnz near      ?_171                                   ; 2f55 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2F57 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2F5A _ C7. 40, 04, 00000000
?_171:  mov     eax, dword [ebp+8H]                     ; 2F61 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F64 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2F67 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2F6A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2F6D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2F70 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2F73 _ 8B. 40, 18
        test    eax, eax                                ; 2F76 _ 85. C0
        jz near       ?_172                                   ; 2f78 _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 2F7A _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2F7D _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2F80 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2F83 _ 83. F8, 02
        jz near       ?_172                                   ; 2f86 _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 2F88 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2F8B _ 8B. 40, 18
        sub     esp, 4                                  ; 2F8E _ 83. EC, 04
        push    0                                       ; 2F91 _ 6A, 00
        push    -1                                      ; 2F93 _ 6A, FF
        push    eax                                     ; 2F95 _ 50
        call    task_run                                ; 2F96 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F9B _ 83. C4, 10
?_172:  mov     eax, 0                                  ; 2F9E _ B8, 00000000
?_173:  leave                                           ; 2FA3 _ C9
        ret                                             ; 2FA4 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2FA5 _ 55
        mov     ebp, esp                                ; 2FA6 _ 89. E5
        sub     esp, 16                                 ; 2FA8 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2FAB _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2FAE _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2FB1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2FB4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2FB7 _ 39. C2
        jnz near      ?_174                                   ; 2fb9 _ 75, 07
        mov     eax, 4294967295                         ; 2FBB _ B8, FFFFFFFF
        jmp     ?_176                                   ; 2FC0 _ EB, 50

?_174:  mov     eax, dword [ebp+8H]                     ; 2FC2 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2FC5 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2FC7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FCA _ 8B. 40, 08
        add     eax, edx                                ; 2FCD _ 01. D0
        mov     al, byte [eax]                          ; 2FCF _ 8A. 00
        movzx   eax, al                                 ; 2FD1 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2FD4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2FD7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2FDA _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2FDD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2FE0 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2FE3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2FE6 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2FE9 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2FEC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2FEF _ 8B. 40, 0C
        cmp     edx, eax                                ; 2FF2 _ 39. C2
        jnz near      ?_175                                   ; 2ff4 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2FF6 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2FF9 _ C7. 40, 08, 00000000
?_175:  mov     eax, dword [ebp+8H]                     ; 3000 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3003 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3006 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3009 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 300C _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 300F _ 8B. 45, FC
?_176:  leave                                           ; 3012 _ C9
        ret                                             ; 3013 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 3014 _ 55
        mov     ebp, esp                                ; 3015 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3017 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 301A _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 301D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3020 _ 8B. 40, 10
        sub     edx, eax                                ; 3023 _ 29. C2
        mov     eax, edx                                ; 3025 _ 89. D0
        pop     ebp                                     ; 3027 _ 5D
        ret                                             ; 3028 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 3029 _ 55
        mov     ebp, esp                                ; 302A _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 302C _ 81. 7D, 0C, 000FFFFF
        jbe     ?_177                                   ; 3033 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3035 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 303C _ 8B. 45, 0C
        shr     eax, 12                                 ; 303F _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3042 _ 89. 45, 0C
?_177:  mov     eax, dword [ebp+0CH]                    ; 3045 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 3048 _ 8B. 55, 08
        mov     word [edx], ax                          ; 304B _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 304E _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 3051 _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 3054 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 3058 _ 8B. 45, 10
        sar     eax, 16                                 ; 305B _ C1. F8, 10
        mov     dl, al                                  ; 305E _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3060 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3063 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3066 _ 8B. 45, 14
        mov     dl, al                                  ; 3069 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 306B _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 306E _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3071 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3074 _ C1. E8, 10
        and     eax, 0FH                                ; 3077 _ 83. E0, 0F
        mov     dl, al                                  ; 307A _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 307C _ 8B. 45, 14
        sar     eax, 8                                  ; 307F _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3082 _ 83. E0, F0
        or      eax, edx                                ; 3085 _ 09. D0
        mov     dl, al                                  ; 3087 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3089 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 308C _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 308F _ 8B. 45, 10
        shr     eax, 24                                 ; 3092 _ C1. E8, 18
        mov     dl, al                                  ; 3095 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3097 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 309A _ 88. 50, 07
        nop                                             ; 309D _ 90
        pop     ebp                                     ; 309E _ 5D
        ret                                             ; 309F _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 30A0 _ 55
        mov     ebp, esp                                ; 30A1 _ 89. E5
        mov     eax, dword [taskctl]                    ; 30A3 _ A1, 000022A8(d)
        pop     ebp                                     ; 30A8 _ 5D
        ret                                             ; 30A9 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 30AA _ 55
        mov     ebp, esp                                ; 30AB _ 89. E5
        sub     esp, 16                                 ; 30AD _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 30B0 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 30B6 _ 8B. 55, 08
        mov     eax, edx                                ; 30B9 _ 89. D0
        shl     eax, 2                                  ; 30BB _ C1. E0, 02
        add     eax, edx                                ; 30BE _ 01. D0
        shl     eax, 2                                  ; 30C0 _ C1. E0, 02
        add     eax, ecx                                ; 30C3 _ 01. C8
        add     eax, 8                                  ; 30C5 _ 83. C0, 08
        mov     dword [eax], 0                          ; 30C8 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 30CE _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 30D4 _ 8B. 55, 08
        mov     eax, edx                                ; 30D7 _ 89. D0
        shl     eax, 2                                  ; 30D9 _ C1. E0, 02
        add     eax, edx                                ; 30DC _ 01. D0
        shl     eax, 2                                  ; 30DE _ C1. E0, 02
        add     eax, ecx                                ; 30E1 _ 01. C8
        add     eax, 12                                 ; 30E3 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 30E6 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 30EC _ C7. 45, FC, 00000000
        jmp     ?_179                                   ; 30F3 _ EB, 20

?_178:  mov     ecx, dword [taskctl]                    ; 30F5 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 30FB _ 8B. 55, FC
        mov     eax, edx                                ; 30FE _ 89. D0
        add     eax, eax                                ; 3100 _ 01. C0
        add     eax, edx                                ; 3102 _ 01. D0
        shl     eax, 3                                  ; 3104 _ C1. E0, 03
        add     eax, ecx                                ; 3107 _ 01. C8
        add     eax, 16                                 ; 3109 _ 83. C0, 10
        mov     dword [eax], 0                          ; 310C _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 3112 _ FF. 45, FC
?_179:  cmp     dword [ebp-4H], 2                       ; 3115 _ 83. 7D, FC, 02
        jle near      ?_178                                   ; 3119 _ 7e, da
        nop                                             ; 311B _ 90
        nop                                             ; 311C _ 90
        leave                                           ; 311D _ C9
        ret                                             ; 311E _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 311F _ 55
        mov     ebp, esp                                ; 3120 _ 89. E5
        push    ebx                                     ; 3122 _ 53
        sub     esp, 20                                 ; 3123 _ 83. EC, 14
        call    get_addr_gdt                            ; 3126 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 312B _ 89. 45, F0
        sub     esp, 8                                  ; 312E _ 83. EC, 08
        push    668                                     ; 3131 _ 68, 0000029C
        push    dword [ebp+8H]                          ; 3136 _ FF. 75, 08
        call    memman_alloc_4k                         ; 3139 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 313E _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 3141 _ A3, 000022A8(d)
        mov     dword [ebp-0CH], 0                      ; 3146 _ C7. 45, F4, 00000000
        jmp     ?_181                                   ; 314D _ E9, 00000088

?_180:  mov     ecx, dword [taskctl]                    ; 3152 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 3158 _ 8B. 55, F4
        mov     eax, edx                                ; 315B _ 89. D0
        shl     eax, 5                                  ; 315D _ C1. E0, 05
        sub     eax, edx                                ; 3160 _ 29. D0
        shl     eax, 2                                  ; 3162 _ C1. E0, 02
        add     eax, ecx                                ; 3165 _ 01. C8
        add     eax, 72                                 ; 3167 _ 83. C0, 48
        mov     dword [eax], 0                          ; 316A _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3170 _ 8B. 45, F4
        add     eax, 7                                  ; 3173 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 3176 _ 8B. 1D, 000022A8(d)
        lea     ecx, [eax*8]                            ; 317C _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3183 _ 8B. 55, F4
        mov     eax, edx                                ; 3186 _ 89. D0
        shl     eax, 5                                  ; 3188 _ C1. E0, 05
        sub     eax, edx                                ; 318B _ 29. D0
        shl     eax, 2                                  ; 318D _ C1. E0, 02
        add     eax, ebx                                ; 3190 _ 01. D8
        add     eax, 68                                 ; 3192 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 3195 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 3197 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 319D _ 8B. 55, F4
        mov     eax, edx                                ; 31A0 _ 89. D0
        shl     eax, 5                                  ; 31A2 _ C1. E0, 05
        sub     eax, edx                                ; 31A5 _ 29. D0
        shl     eax, 2                                  ; 31A7 _ C1. E0, 02
        add     eax, 80                                 ; 31AA _ 83. C0, 50
        add     eax, ecx                                ; 31AD _ 01. C8
        add     eax, 8                                  ; 31AF _ 83. C0, 08
        mov     edx, eax                                ; 31B2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 31B4 _ 8B. 45, F4
        add     eax, 7                                  ; 31B7 _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 31BA _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 31C1 _ 8B. 45, F0
        add     eax, ecx                                ; 31C4 _ 01. C8
        push    137                                     ; 31C6 _ 68, 00000089
        push    edx                                     ; 31CB _ 52
        push    103                                     ; 31CC _ 6A, 67
        push    eax                                     ; 31CE _ 50
        call    set_segmdesc                            ; 31CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31D4 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 31D7 _ FF. 45, F4
?_181:  cmp     dword [ebp-0CH], 4                      ; 31DA _ 83. 7D, F4, 04
        jle near      ?_180                                   ; 31de _ 0f 8e, ffffff6e
        mov     dword [ebp-0CH], 0                      ; 31E4 _ C7. 45, F4, 00000000
        jmp     ?_183                                   ; 31EB _ EB, 11

?_182:  sub     esp, 12                                 ; 31ED _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 31F0 _ FF. 75, F4
        call    init_task_level                         ; 31F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31F8 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 31FB _ FF. 45, F4
?_183:  cmp     dword [ebp-0CH], 2                      ; 31FE _ 83. 7D, F4, 02
        jle near      ?_182                                   ; 3202 _ 7e, e9
        call    task_alloc                              ; 3204 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 3209 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 320C _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 320F _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 3216 _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 3219 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 3220 _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 3223 _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 322A _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 322D _ FF. 75, EC
        call    task_add                                ; 3230 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3235 _ 83. C4, 10
        call    task_switchsub                          ; 3238 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 323D _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3240 _ 8B. 00
        sub     esp, 12                                 ; 3242 _ 83. EC, 0C
        push    eax                                     ; 3245 _ 50
        call    load_tr                                 ; 3246 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 324B _ 83. C4, 10
        call    timer_alloc                             ; 324E _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3253 _ A3, 000022A4(d)
        mov     eax, dword [ebp-14H]                    ; 3258 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 325B _ 8B. 40, 08
        mov     edx, eax                                ; 325E _ 89. C2
        mov     eax, dword [task_timer]                 ; 3260 _ A1, 000022A4(d)
        sub     esp, 8                                  ; 3265 _ 83. EC, 08
        push    edx                                     ; 3268 _ 52
        push    eax                                     ; 3269 _ 50
        call    timer_settime                           ; 326A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 326F _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 3272 _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 3275 _ 8B. 5D, FC
        leave                                           ; 3278 _ C9
        ret                                             ; 3279 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 327A _ 55
        mov     ebp, esp                                ; 327B _ 89. E5
        sub     esp, 16                                 ; 327D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3280 _ C7. 45, FC, 00000000
        jmp     ?_186                                   ; 3287 _ E9, 000000ED

?_184:  mov     ecx, dword [taskctl]                    ; 328C _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 3292 _ 8B. 55, FC
        mov     eax, edx                                ; 3295 _ 89. D0
        shl     eax, 5                                  ; 3297 _ C1. E0, 05
        sub     eax, edx                                ; 329A _ 29. D0
        shl     eax, 2                                  ; 329C _ C1. E0, 02
        add     eax, ecx                                ; 329F _ 01. C8
        add     eax, 72                                 ; 32A1 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 32A4 _ 8B. 00
        test    eax, eax                                ; 32A6 _ 85. C0
        jne near      ?_185                                   ; 32a8 _ 0f 85, 000000c8
        mov     ecx, dword [taskctl]                    ; 32AE _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 32B4 _ 8B. 55, FC
        mov     eax, edx                                ; 32B7 _ 89. D0
        shl     eax, 5                                  ; 32B9 _ C1. E0, 05
        sub     eax, edx                                ; 32BC _ 29. D0
        shl     eax, 2                                  ; 32BE _ C1. E0, 02
        add     eax, 64                                 ; 32C1 _ 83. C0, 40
        add     eax, ecx                                ; 32C4 _ 01. C8
        add     eax, 4                                  ; 32C6 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 32C9 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 32CC _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 32CF _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 32D6 _ 8B. 45, F8
        mov     dword [eax+38H], 514                    ; 32D9 _ C7. 40, 38, 00000202
        mov     eax, dword [ebp-8H]                     ; 32E0 _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 32E3 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 32EA _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 32ED _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 32F4 _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 32F7 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 32FE _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 3301 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 3308 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 330B _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3312 _ 8B. 45, FC
        inc     eax                                     ; 3315 _ 40
        shl     eax, 9                                  ; 3316 _ C1. E0, 09
        mov     edx, eax                                ; 3319 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 331B _ 8B. 45, F8
        mov     dword [eax+4CH], edx                    ; 331E _ 89. 50, 4C
        mov     eax, dword [ebp-8H]                     ; 3321 _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 3324 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 332B _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 332E _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 3335 _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 3338 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 333F _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 3342 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 3349 _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 334C _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3353 _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 3356 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 335D _ 8B. 45, F8
        mov     dword [eax+74H], 0                      ; 3360 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-8H]                     ; 3367 _ 8B. 45, F8
        mov     dword [eax+78H], 1073741824             ; 336A _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-8H]                     ; 3371 _ 8B. 45, F8
        jmp     ?_187                                   ; 3374 _ EB, 12

?_185:  inc     dword [ebp-4H]                          ; 3376 _ FF. 45, FC
?_186:  cmp     dword [ebp-4H], 4                       ; 3379 _ 83. 7D, FC, 04
        jle near      ?_184                                   ; 337d _ 0f 8e, ffffff09
        mov     eax, 0                                  ; 3383 _ B8, 00000000
?_187:  leave                                           ; 3388 _ C9
        ret                                             ; 3389 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 338A _ 55
        mov     ebp, esp                                ; 338B _ 89. E5
        sub     esp, 8                                  ; 338D _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 3390 _ 83. 7D, 0C, 00
        jns     ?_188                                   ; 3394 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3396 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3399 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 339C _ 89. 45, 0C
?_188:  cmp     dword [ebp+10H], 0                      ; 339F _ 83. 7D, 10, 00
        jle near      ?_189                                   ; 33a3 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 33A5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 33A8 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 33AB _ 89. 50, 08
?_189:  mov     eax, dword [ebp+8H]                     ; 33AE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 33B1 _ 8B. 40, 04
        cmp     eax, 2                                  ; 33B4 _ 83. F8, 02
        jnz near      ?_190                                   ; 33b7 _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 33B9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 33BC _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 33BF _ 39. 45, 0C
        jz near       ?_190                                   ; 33c2 _ 74, 0e
        sub     esp, 12                                 ; 33C4 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 33C7 _ FF. 75, 08
        call    task_remove                             ; 33CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33CF _ 83. C4, 10
?_190:  mov     eax, dword [ebp+8H]                     ; 33D2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 33D5 _ 8B. 40, 04
        cmp     eax, 2                                  ; 33D8 _ 83. F8, 02
        jz near       ?_191                                   ; 33db _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 33DD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33E0 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 33E3 _ 89. 50, 0C
        sub     esp, 12                                 ; 33E6 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 33E9 _ FF. 75, 08
        call    task_add                                ; 33EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33F1 _ 83. C4, 10
?_191:  mov     eax, dword [taskctl]                    ; 33F4 _ A1, 000022A8(d)
        mov     dword [eax+4H], 1                       ; 33F9 _ C7. 40, 04, 00000001
        nop                                             ; 3400 _ 90
        leave                                           ; 3401 _ C9
        ret                                             ; 3402 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3403 _ 55
        mov     ebp, esp                                ; 3404 _ 89. E5
        sub     esp, 24                                 ; 3406 _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 3409 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 340F _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 3414 _ 8B. 10
        mov     eax, edx                                ; 3416 _ 89. D0
        shl     eax, 2                                  ; 3418 _ C1. E0, 02
        add     eax, edx                                ; 341B _ 01. D0
        shl     eax, 2                                  ; 341D _ C1. E0, 02
        add     eax, ecx                                ; 3420 _ 01. C8
        add     eax, 8                                  ; 3422 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 3425 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3428 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 342B _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 342E _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3431 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3435 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3438 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 343B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 343E _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 3441 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 3444 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3447 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 344A _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 344D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3450 _ 8B. 00
        cmp     edx, eax                                ; 3452 _ 39. C2
        jnz near      ?_192                                   ; 3454 _ 75, 0a
        mov     eax, dword [ebp-0CH]                    ; 3456 _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 3459 _ C7. 40, 04, 00000000
?_192:  mov     eax, dword [taskctl]                    ; 3460 _ A1, 000022A8(d)
        mov     eax, dword [eax+4H]                     ; 3465 _ 8B. 40, 04
        test    eax, eax                                ; 3468 _ 85. C0
        jz near       ?_193                                   ; 346a _ 74, 24
        call    task_switchsub                          ; 346C _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 3471 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 3477 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 347C _ 8B. 10
        mov     eax, edx                                ; 347E _ 89. D0
        shl     eax, 2                                  ; 3480 _ C1. E0, 02
        add     eax, edx                                ; 3483 _ 01. D0
        shl     eax, 2                                  ; 3485 _ C1. E0, 02
        add     eax, ecx                                ; 3488 _ 01. C8
        add     eax, 8                                  ; 348A _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 348D _ 89. 45, F4
?_193:  mov     eax, dword [ebp-0CH]                    ; 3490 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3493 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3496 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3499 _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 349D _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 34A0 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 34A3 _ 8B. 40, 08
        mov     edx, eax                                ; 34A6 _ 89. C2
        mov     eax, dword [task_timer]                 ; 34A8 _ A1, 000022A4(d)
        sub     esp, 8                                  ; 34AD _ 83. EC, 08
        push    edx                                     ; 34B0 _ 52
        push    eax                                     ; 34B1 _ 50
        call    timer_settime                           ; 34B2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 34B7 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 34BA _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 34BD _ 3B. 45, F0
        jz near       ?_194                                   ; 34c0 _ 74, 1a
        cmp     dword [ebp-14H], 0                      ; 34C2 _ 83. 7D, EC, 00
        jz near       ?_194                                   ; 34c6 _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 34C8 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 34CB _ 8B. 00
        sub     esp, 8                                  ; 34CD _ 83. EC, 08
        push    eax                                     ; 34D0 _ 50
        push    0                                       ; 34D1 _ 6A, 00
        call    farjmp                                  ; 34D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 34D8 _ 83. C4, 10
        nop                                             ; 34DB _ 90
?_194:  nop                                             ; 34DC _ 90
        leave                                           ; 34DD _ C9
        ret                                             ; 34DE _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 34DF _ 55
        mov     ebp, esp                                ; 34E0 _ 89. E5
        sub     esp, 24                                 ; 34E2 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 34E5 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 34EC _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 34F3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34F6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 34F9 _ 83. F8, 02
        jnz near      ?_195                                   ; 34fc _ 75, 52
        call    task_now                                ; 34FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3503 _ 89. 45, F0
        sub     esp, 12                                 ; 3506 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3509 _ FF. 75, 08
        call    task_remove                             ; 350C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3511 _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 3514 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 351B _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 351E _ 3B. 45, F0
        jnz near      ?_195                                   ; 3521 _ 75, 2d
        call    task_switchsub                          ; 3523 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3528 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 352D _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 3530 _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 3537 _ 83. 7D, F0, 00
        jz near       ?_195                                   ; 353b _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 353D _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3540 _ 8B. 00
        sub     esp, 8                                  ; 3542 _ 83. EC, 08
        push    eax                                     ; 3545 _ 50
        push    0                                       ; 3546 _ 6A, 00
        call    farjmp                                  ; 3548 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 354D _ 83. C4, 10
?_195:  mov     eax, dword [ebp-0CH]                    ; 3550 _ 8B. 45, F4
        leave                                           ; 3553 _ C9
        ret                                             ; 3554 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3555 _ 55
        mov     ebp, esp                                ; 3556 _ 89. E5
        sub     esp, 16                                 ; 3558 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 355B _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 3561 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 3566 _ 8B. 10
        mov     eax, edx                                ; 3568 _ 89. D0
        shl     eax, 2                                  ; 356A _ C1. E0, 02
        add     eax, edx                                ; 356D _ 01. D0
        shl     eax, 2                                  ; 356F _ C1. E0, 02
        add     eax, ecx                                ; 3572 _ 01. C8
        add     eax, 8                                  ; 3574 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3577 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 357A _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 357D _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3580 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3583 _ 8B. 44 90, 08
        leave                                           ; 3587 _ C9
        ret                                             ; 3588 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 3589 _ 55
        mov     ebp, esp                                ; 358A _ 89. E5
        sub     esp, 16                                 ; 358C _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 358F _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 3595 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3598 _ 8B. 50, 0C
        mov     eax, edx                                ; 359B _ 89. D0
        shl     eax, 2                                  ; 359D _ C1. E0, 02
        add     eax, edx                                ; 35A0 _ 01. D0
        shl     eax, 2                                  ; 35A2 _ C1. E0, 02
        add     eax, ecx                                ; 35A5 _ 01. C8
        add     eax, 8                                  ; 35A7 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 35AA _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 35AD _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 35B0 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 35B2 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 35B5 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 35B8 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 35BC _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 35BF _ 8B. 00
        lea     edx, [eax+1H]                           ; 35C1 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 35C4 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 35C7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 35C9 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 35CC _ C7. 40, 04, 00000002
        nop                                             ; 35D3 _ 90
        leave                                           ; 35D4 _ C9
        ret                                             ; 35D5 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 35D6 _ 55
        mov     ebp, esp                                ; 35D7 _ 89. E5
        sub     esp, 16                                 ; 35D9 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 35DC _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 35E2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 35E5 _ 8B. 50, 0C
        mov     eax, edx                                ; 35E8 _ 89. D0
        shl     eax, 2                                  ; 35EA _ C1. E0, 02
        add     eax, edx                                ; 35ED _ 01. D0
        shl     eax, 2                                  ; 35EF _ C1. E0, 02
        add     eax, ecx                                ; 35F2 _ 01. C8
        add     eax, 8                                  ; 35F4 _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 35F7 _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 35FA _ C7. 45, FC, 00000000
        jmp     ?_198                                   ; 3601 _ EB, 22

?_196:  mov     eax, dword [ebp-8H]                     ; 3603 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3606 _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3609 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 360D _ 39. 45, 08
        jnz near      ?_197                                   ; 3610 _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 3612 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3615 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 3618 _ C7. 44 90, 08, 00000000
        jmp     ?_199                                   ; 3620 _ EB, 0D

?_197:  inc     dword [ebp-4H]                          ; 3622 _ FF. 45, FC
?_198:  mov     eax, dword [ebp-8H]                     ; 3625 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3628 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 362A _ 39. 45, FC
        jl      ?_196                                   ; 362D _ 7C, D4
?_199:  mov     eax, dword [ebp-8H]                     ; 362F _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3632 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3634 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 3637 _ 8B. 45, F8
        mov     dword [eax], edx                        ; 363A _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 363C _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 363F _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 3642 _ 39. 45, FC
        jge near      ?_200                                   ; 3645 _ 7d, 0f
        mov     eax, dword [ebp-8H]                     ; 3647 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 364A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 364D _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 3650 _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 3653 _ 89. 50, 04
?_200:  mov     eax, dword [ebp-8H]                     ; 3656 _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 3659 _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 365C _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 365F _ 8B. 00
        cmp     edx, eax                                ; 3661 _ 39. C2
        jl      ?_201                                   ; 3663 _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 3665 _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 3668 _ C7. 40, 04, 00000000
?_201:  mov     eax, dword [ebp+8H]                     ; 366F _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3672 _ C7. 40, 04, 00000001
        jmp     ?_203                                   ; 3679 _ EB, 1A

?_202:  mov     eax, dword [ebp-4H]                     ; 367B _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 367E _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 3681 _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 3684 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 3688 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 368B _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 368E _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 3692 _ FF. 45, FC
?_203:  mov     eax, dword [ebp-8H]                     ; 3695 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3698 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 369A _ 39. 45, FC
        jl      ?_202                                   ; 369D _ 7C, DC
        nop                                             ; 369F _ 90
        leave                                           ; 36A0 _ C9
        ret                                             ; 36A1 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 36A2 _ 55
        mov     ebp, esp                                ; 36A3 _ 89. E5
        sub     esp, 16                                 ; 36A5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 36A8 _ C7. 45, FC, 00000000
        jmp     ?_205                                   ; 36AF _ EB, 21

?_204:  mov     ecx, dword [taskctl]                    ; 36B1 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 36B7 _ 8B. 55, FC
        mov     eax, edx                                ; 36BA _ 89. D0
        shl     eax, 2                                  ; 36BC _ C1. E0, 02
        add     eax, edx                                ; 36BF _ 01. D0
        shl     eax, 2                                  ; 36C1 _ C1. E0, 02
        add     eax, ecx                                ; 36C4 _ 01. C8
        add     eax, 8                                  ; 36C6 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 36C9 _ 8B. 00
        test    eax, eax                                ; 36CB _ 85. C0
        jg  near      ?_206                                   ; 36cd _ 7f, 0b
        inc     dword [ebp-4H]                          ; 36CF _ FF. 45, FC
?_205:  cmp     dword [ebp-4H], 2                       ; 36D2 _ 83. 7D, FC, 02
        jle near      ?_204                                   ; 36d6 _ 7e, d9
        jmp     ?_207                                   ; 36D8 _ EB, 01

?_206:  nop                                             ; 36DA _ 90
?_207:  mov     eax, dword [taskctl]                    ; 36DB _ A1, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 36E0 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 36E3 _ 89. 10
        mov     eax, dword [taskctl]                    ; 36E5 _ A1, 000022A8(d)
        mov     dword [eax+4H], 0                       ; 36EA _ C7. 40, 04, 00000000
        nop                                             ; 36F1 _ 90
        leave                                           ; 36F2 _ C9
        ret                                             ; 36F3 _ C3
; task_switchsub End of function



?_208:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_209:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_210:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_211:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0017 _ 3[sec].

?_212:                                                  ; byte
        db 3EH, 00H                                     ; 001E _ >.

?_213:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0020 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0028 _ sk b.

?_214:                                                  ; byte
        db 42H, 00H                                     ; 002D _ B.

?_215:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002F _ page is:
        db 20H, 00H                                     ; 0037 _  .

?_216:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0039 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0041 _ L: .

?_217:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0045 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004D _ H: .

?_218:                                                  ; byte
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

?_219:  db 00H                                          ; 0076 _ .

?_220:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1944:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1991:                                            ; byte
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

closebtn.2110:                                          ; byte
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

?_221:                                                  ; dword
        resb    2                                       ; 0004

?_222:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_223:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_224:  resd    1                                       ; 00EC

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

task_cons:                                              ; dword
        resd    1                                       ; 0250

task_a.1863:                                            ; dword
        resd    3                                       ; 0254

tss_a.1862:                                             ; byte
        resb    128                                     ; 0260

tss_b.1861:                                             ; byte
        resb    104                                     ; 02E0

task_b.1847:                                            ; byte
        resb    12                                      ; 0348

str.2039:                                               ; byte
        resb    1                                       ; 0354

?_225:  resb    9                                       ; 0355

?_226:  resb    2                                       ; 035E

timerctl:                                               ; byte
        resd    1                                       ; 0360

?_227:                                                  ; byte
        resb    4                                       ; 0364

?_228:                                                  ; byte
        resb    4                                       ; 0368

?_229:                                                  ; byte
        resb    4                                       ; 036C

?_230:                                                  ; byte
        resb    7988                                    ; 0370

task_timer:                                             ; dword
        resd    1                                       ; 22A4

taskctl: resd   1                                       ; 22A8


