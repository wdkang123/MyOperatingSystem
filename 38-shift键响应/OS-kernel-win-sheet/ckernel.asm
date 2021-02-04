; Disassembly of file: ckernel.o
; Tue Feb  2 11:53:40 2021
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
        push    bootInfo                                ; 000B _ 68, 00000004(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000004(d)
        mov     dword [ebp-24H], eax                    ; 001D _ 89. 45, DC
        mov     eax, dword [?_231]                      ; 0020 _ A1, 00000008(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        mov     ax, word [?_232]                        ; 002B _ 66: A1, 0000000A(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ysize], eax                      ; 0032 _ A3, 00000140(d)
        call    init_pit                                ; 0037 _ E8, FFFFFFFC(rel)
        push    0                                       ; 003C _ 6A, 00
        push    timerbuf                                ; 003E _ 68, 0000012C(d)
        push    8                                       ; 0043 _ 6A, 08
        push    timerinfo                               ; 0045 _ 68, 00000110(d)
        call    fifo8_init                              ; 004A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004F _ 83. C4, 10
        call    timer_alloc                             ; 0052 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0057 _ 89. 45, D8
        sub     esp, 4                                  ; 005A _ 83. EC, 04
        push    10                                      ; 005D _ 6A, 0A
        push    timerinfo                               ; 005F _ 68, 00000110(d)
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
        push    timerinfo                               ; 008C _ 68, 00000110(d)
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
        push    timerinfo                               ; 00BC _ 68, 00000110(d)
        push    dword [ebp-30H]                         ; 00C1 _ FF. 75, D0
        call    timer_init                              ; 00C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C9 _ 83. C4, 10
        sub     esp, 8                                  ; 00CC _ 83. EC, 08
        push    50                                      ; 00CF _ 6A, 32
        push    dword [ebp-30H]                         ; 00D1 _ FF. 75, D0
        call    timer_settime                           ; 00D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D9 _ 83. C4, 10
        push    0                                       ; 00DC _ 6A, 00
        push    keybuf                                  ; 00DE _ 68, 00000060(d)
        push    32                                      ; 00E3 _ 6A, 20
        push    keyinfo                                 ; 00E5 _ 68, 0000000C(d)
        call    fifo8_init                              ; 00EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EF _ 83. C4, 10
        push    0                                       ; 00F2 _ 6A, 00
        push    mousebuf                                ; 00F4 _ 68, 00000080(d)
        push    128                                     ; 00F9 _ 68, 00000080
        push    mouseinfo                               ; 00FE _ 68, 00000028(d)
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
        mov     ecx, dword [ysize]                      ; 0151 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0157 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 015D _ A1, 00000000(d)
        push    ecx                                     ; 0162 _ 51
        push    edx                                     ; 0163 _ 52
        push    dword [ebp-24H]                         ; 0164 _ FF. 75, DC
        push    eax                                     ; 0167 _ 50
        call    shtctl_init                             ; 0168 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016D _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0170 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 0175 _ A1, 00000264(d)
        sub     esp, 12                                 ; 017A _ 83. EC, 0C
        push    eax                                     ; 017D _ 50
        call    sheet_alloc                             ; 017E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0183 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0186 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 018B _ A1, 00000264(d)
        sub     esp, 12                                 ; 0190 _ 83. EC, 0C
        push    eax                                     ; 0193 _ 50
        call    sheet_alloc                             ; 0194 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0199 _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019C _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01A1 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01A7 _ A1, 00000140(d)
        imul    edx, eax                                ; 01AC _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01AF _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B4 _ 83. EC, 08
        push    edx                                     ; 01B7 _ 52
        push    eax                                     ; 01B8 _ 50
        call    memman_alloc_4k                         ; 01B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01BE _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C1 _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 01C6 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 01CC _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 01D2 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 01D8 _ A1, 00000268(d)
        sub     esp, 12                                 ; 01DD _ 83. EC, 0C
        push    99                                      ; 01E0 _ 6A, 63
        push    ebx                                     ; 01E2 _ 53
        push    ecx                                     ; 01E3 _ 51
        push    edx                                     ; 01E4 _ 52
        push    eax                                     ; 01E5 _ 50
        call    sheet_setbuf                            ; 01E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EB _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01EE _ A1, 0000026C(d)
        sub     esp, 12                                 ; 01F3 _ 83. EC, 0C
        push    99                                      ; 01F6 _ 6A, 63
        push    16                                      ; 01F8 _ 6A, 10
        push    16                                      ; 01FA _ 6A, 10
        push    buf_mouse                               ; 01FC _ 68, 00000160(d)
        push    eax                                     ; 0201 _ 50
        call    sheet_setbuf                            ; 0202 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0207 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020A _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0210 _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0216 _ A1, 00000144(d)
        sub     esp, 4                                  ; 021B _ 83. EC, 04
        push    ecx                                     ; 021E _ 51
        push    edx                                     ; 021F _ 52
        push    eax                                     ; 0220 _ 50
        call    init_screen8                            ; 0221 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0226 _ 83. C4, 10
        sub     esp, 8                                  ; 0229 _ 83. EC, 08
        push    99                                      ; 022C _ 6A, 63
        push    buf_mouse                               ; 022E _ 68, 00000160(d)
        call    init_mouse_cursor                       ; 0233 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0238 _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023B _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0241 _ A1, 00000264(d)
        push    0                                       ; 0246 _ 6A, 00
        push    0                                       ; 0248 _ 6A, 00
        push    edx                                     ; 024A _ 52
        push    eax                                     ; 024B _ 50
        call    sheet_slide                             ; 024C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0251 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0254 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 0259 _ 83. E8, 10
        mov     edx, eax                                ; 025C _ 89. C2
        shr     edx, 31                                 ; 025E _ C1. EA, 1F
        add     eax, edx                                ; 0261 _ 01. D0
        sar     eax, 1                                  ; 0263 _ D1. F8
        mov     dword [mx], eax                         ; 0265 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 026A _ A1, 00000140(d)
        sub     eax, 44                                 ; 026F _ 83. E8, 2C
        mov     edx, eax                                ; 0272 _ 89. C2
        shr     edx, 31                                 ; 0274 _ C1. EA, 1F
        add     eax, edx                                ; 0277 _ 01. D0
        sar     eax, 1                                  ; 0279 _ D1. F8
        mov     dword [my], eax                         ; 027B _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 0280 _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0286 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 028C _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0292 _ A1, 00000264(d)
        push    ebx                                     ; 0297 _ 53
        push    ecx                                     ; 0298 _ 51
        push    edx                                     ; 0299 _ 52
        push    eax                                     ; 029A _ 50
        call    sheet_slide                             ; 029B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A0 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A3 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AA _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B1 _ A1, 00000264(d)
        sub     esp, 8                                  ; 02B6 _ 83. EC, 08
        push    ?_218                                   ; 02B9 _ 68, 00000000(d)
        push    eax                                     ; 02BE _ 50
        call    message_box                             ; 02BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C4 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C7 _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 02CC _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 02D2 _ A1, 00000264(d)
        sub     esp, 4                                  ; 02D7 _ 83. EC, 04
        push    0                                       ; 02DA _ 6A, 00
        push    edx                                     ; 02DC _ 52
        push    eax                                     ; 02DD _ 50
        call    sheet_updown                            ; 02DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E3 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E6 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02EC _ A1, 00000264(d)
        sub     esp, 4                                  ; 02F1 _ 83. EC, 04
        push    100                                     ; 02F4 _ 6A, 64
        push    edx                                     ; 02F6 _ 52
        push    eax                                     ; 02F7 _ 50
        call    sheet_updown                            ; 02F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FD _ 83. C4, 10
        call    io_sti                                  ; 0300 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0305 _ 83. EC, 0C
        push    mdec                                    ; 0308 _ 68, 00000100(d)
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
        mov     dword [task_a.1867], eax                ; 0336 _ A3, 00000274(d)
        mov     eax, dword [task_a.1867]                ; 033B _ A1, 00000274(d)
        mov     dword [?_233], eax                      ; 0340 _ A3, 00000024(d)
        mov     eax, dword [task_a.1867]                ; 0345 _ A1, 00000274(d)
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
        push    keyinfo                                 ; 0394 _ 68, 0000000C(d)
        call    fifo8_status                            ; 0399 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039E _ 83. C4, 10
        mov     ebx, eax                                ; 03A1 _ 89. C3
        sub     esp, 12                                 ; 03A3 _ 83. EC, 0C
        push    mouseinfo                               ; 03A6 _ 68, 00000028(d)
        call    fifo8_status                            ; 03AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B0 _ 83. C4, 10
        add     ebx, eax                                ; 03B3 _ 01. C3
        sub     esp, 12                                 ; 03B5 _ 83. EC, 0C
        push    timerinfo                               ; 03B8 _ 68, 00000110(d)
        call    fifo8_status                            ; 03BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C2 _ 83. C4, 10
        add     eax, ebx                                ; 03C5 _ 01. D8
        test    eax, eax                                ; 03C7 _ 85. C0
        jnz near      ?_002                                   ; 03c9 _ 75, 07
        call    io_sti                                  ; 03CB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03D0 _ EB, BA

?_002:  sub     esp, 12                                 ; 03D2 _ 83. EC, 0C
        push    keyinfo                                 ; 03D5 _ 68, 0000000C(d)
        call    fifo8_status                            ; 03DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DF _ 83. C4, 10
        test    eax, eax                                ; 03E2 _ 85. C0
        je near       ?_008                                   ; 03e4 _ 0f 84, 000002a5
        call    io_sti                                  ; 03EA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03EF _ 83. EC, 0C
        push    keyinfo                                 ; 03F2 _ 68, 0000000C(d)
        call    fifo8_get                               ; 03F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03FC _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 03FF _ 89. 45, B8
        cmp     dword [ebp-48H], 28                     ; 0402 _ 83. 7D, B8, 1C
        jnz near      ?_003                                   ; 0406 _ 75, 5c
        mov     ebx, dword [xsize]                      ; 0408 _ 8B. 1D, 0000013C(d)
        mov     ecx, dword [buf_back]                   ; 040E _ 8B. 0D, 00000144(d)
        mov     edx, dword [ebp-14H]                    ; 0414 _ 8B. 55, EC
        mov     eax, edx                                ; 0417 _ 89. D0
        shl     eax, 2                                  ; 0419 _ C1. E0, 02
        add     eax, edx                                ; 041C _ 01. D0
        shl     eax, 2                                  ; 041E _ C1. E0, 02
        mov     edx, eax                                ; 0421 _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 0423 _ 8B. 45, C8
        lea     esi, [edx+eax]                          ; 0426 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0429 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 042F _ A1, 00000264(d)
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
        mov     edx, dword [shtMsgBox]                  ; 047B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0481 _ A1, 00000264(d)
        push    0                                       ; 0486 _ 6A, 00
        push    ?_219                                   ; 0488 _ 68, 00000008(d)
        push    edx                                     ; 048D _ 52
        push    eax                                     ; 048E _ 50
        call    make_wtitle8                            ; 048F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0494 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0497 _ A1, 00000264(d)
        push    1                                       ; 049C _ 6A, 01
        push    ?_220                                   ; 049E _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04A3 _ FF. 75, BC
        push    eax                                     ; 04A6 _ 50
        call    make_wtitle8                            ; 04A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AC _ 83. C4, 10
        jmp     ?_005                                   ; 04AF _ EB, 3B

?_004:  mov     dword [ebp-20H], 0                      ; 04B1 _ C7. 45, E0, 00000000
        mov     edx, dword [shtMsgBox]                  ; 04B8 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04BE _ A1, 00000264(d)
        push    1                                       ; 04C3 _ 6A, 01
        push    ?_219                                   ; 04C5 _ 68, 00000008(d)
        push    edx                                     ; 04CA _ 52
        push    eax                                     ; 04CB _ 50
        call    make_wtitle8                            ; 04CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04D4 _ A1, 00000264(d)
        push    0                                       ; 04D9 _ 6A, 00
        push    ?_220                                   ; 04DB _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04E0 _ FF. 75, BC
        push    eax                                     ; 04E3 _ 50
        call    make_wtitle8                            ; 04E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E9 _ 83. C4, 10
?_005:  mov     eax, dword [shtMsgBox]                  ; 04EC _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 04F1 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 04F4 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04FA _ A1, 00000264(d)
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
        mov     eax, dword [shtctl]                     ; 0519 _ A1, 00000264(d)
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
        jne near      ?_007                                   ; 053d _ 0f 85, 0000011a
        sub     esp, 12                                 ; 0543 _ 83. EC, 0C
        push    dword [ebp-48H]                         ; 0546 _ FF. 75, B8
        call    transferScanCode                        ; 0549 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 054E _ 83. C4, 10
        test    al, al                                  ; 0551 _ 84. C0
        je near       ?_001                                   ; 0553 _ 0f 84, fffffe33
        cmp     dword [ebp-0CH], 143                    ; 0559 _ 81. 7D, F4, 0000008F
        jg  near      ?_001                                   ; 0560 _ 0f 8f, fffffe26
        mov     eax, dword [ebp-0CH]                    ; 0566 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0569 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 056C _ A1, 00000260(d)
        mov     edx, dword [eax+4H]                     ; 0571 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0574 _ A1, 00000260(d)
        mov     eax, dword [eax]                        ; 0579 _ 8B. 00
        sub     esp, 4                                  ; 057B _ 83. EC, 04
        push    43                                      ; 057E _ 6A, 2B
        push    ecx                                     ; 0580 _ 51
        push    28                                      ; 0581 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0583 _ FF. 75, F4
        push    7                                       ; 0586 _ 6A, 07
        push    edx                                     ; 0588 _ 52
        push    eax                                     ; 0589 _ 50
        call    boxfill8                                ; 058A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 058F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0592 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0595 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0598 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 059E _ A1, 00000264(d)
        sub     esp, 8                                  ; 05A3 _ 83. EC, 08
        push    44                                      ; 05A6 _ 6A, 2C
        push    ecx                                     ; 05A8 _ 51
        push    28                                      ; 05A9 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05AB _ FF. 75, F4
        push    edx                                     ; 05AE _ 52
        push    eax                                     ; 05AF _ 50
        call    sheet_refresh                           ; 05B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B5 _ 83. C4, 20
        sub     esp, 12                                 ; 05B8 _ 83. EC, 0C
        push    dword [ebp-48H]                         ; 05BB _ FF. 75, B8
        call    transferScanCode                        ; 05BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C3 _ 83. C4, 10
        mov     byte [ebp-51H], al                      ; 05C6 _ 88. 45, AF
        mov     al, byte [ebp-51H]                      ; 05C9 _ 8A. 45, AF
        mov     byte [ebp-62H], al                      ; 05CC _ 88. 45, 9E
        mov     byte [ebp-61H], 0                       ; 05CF _ C6. 45, 9F, 00
        mov     edx, dword [shtMsgBox]                  ; 05D3 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05D9 _ A1, 00000264(d)
        sub     esp, 8                                  ; 05DE _ 83. EC, 08
        lea     ecx, [ebp-62H]                          ; 05E1 _ 8D. 4D, 9E
        push    ecx                                     ; 05E4 _ 51
        push    0                                       ; 05E5 _ 6A, 00
        push    28                                      ; 05E7 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05E9 _ FF. 75, F4
        push    edx                                     ; 05EC _ 52
        push    eax                                     ; 05ED _ 50
        call    showString                              ; 05EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F3 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 05F6 _ 83. 45, F4, 08
        mov     dword [ebp-1CH], 1                      ; 05FA _ C7. 45, E4, 00000001
        mov     eax, dword [ebp-0CH]                    ; 0601 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0604 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0607 _ 8B. 45, F0
        movzx   ecx, al                                 ; 060A _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 060D _ A1, 00000260(d)
        mov     edx, dword [eax+4H]                     ; 0612 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0615 _ A1, 00000260(d)
        mov     eax, dword [eax]                        ; 061A _ 8B. 00
        sub     esp, 4                                  ; 061C _ 83. EC, 04
        push    43                                      ; 061F _ 6A, 2B
        push    ebx                                     ; 0621 _ 53
        push    28                                      ; 0622 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0624 _ FF. 75, F4
        push    ecx                                     ; 0627 _ 51
        push    edx                                     ; 0628 _ 52
        push    eax                                     ; 0629 _ 50
        call    boxfill8                                ; 062A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 062F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0632 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0635 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0638 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 063E _ A1, 00000264(d)
        sub     esp, 8                                  ; 0643 _ 83. EC, 08
        push    44                                      ; 0646 _ 6A, 2C
        push    ecx                                     ; 0648 _ 51
        push    28                                      ; 0649 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 064B _ FF. 75, F4
        push    edx                                     ; 064E _ 52
        push    eax                                     ; 064F _ 50
        call    sheet_refresh                           ; 0650 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0655 _ 83. C4, 20
        jmp     ?_001                                   ; 0658 _ E9, FFFFFD2F

?_007:  mov     eax, dword [task_a.1867]                ; 065D _ A1, 00000274(d)
        sub     esp, 12                                 ; 0662 _ 83. EC, 0C
        push    eax                                     ; 0665 _ 50
        call    task_sleep                              ; 0666 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 066B _ 83. C4, 10
        mov     eax, dword [ebp-48H]                    ; 066E _ 8B. 45, B8
        movzx   eax, al                                 ; 0671 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0674 _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 067A _ 83. C2, 10
        sub     esp, 8                                  ; 067D _ 83. EC, 08
        push    eax                                     ; 0680 _ 50
        push    edx                                     ; 0681 _ 52
        call    fifo8_put                               ; 0682 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0687 _ 83. C4, 10
        jmp     ?_001                                   ; 068A _ E9, FFFFFCFD

?_008:  sub     esp, 12                                 ; 068F _ 83. EC, 0C
        push    mouseinfo                               ; 0692 _ 68, 00000028(d)
        call    fifo8_status                            ; 0697 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 069C _ 83. C4, 10
        test    eax, eax                                ; 069F _ 85. C0
        jz near       ?_009                                   ; 06a1 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 06A3 _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 06A9 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 06AF _ A1, 00000264(d)
        sub     esp, 4                                  ; 06B4 _ 83. EC, 04
        push    ecx                                     ; 06B7 _ 51
        push    edx                                     ; 06B8 _ 52
        push    eax                                     ; 06B9 _ 50
        call    show_mouse_info                         ; 06BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06BF _ 83. C4, 10
        jmp     ?_001                                   ; 06C2 _ E9, FFFFFCC5

?_009:  sub     esp, 12                                 ; 06C7 _ 83. EC, 0C
        push    timerinfo                               ; 06CA _ 68, 00000110(d)
        call    fifo8_status                            ; 06CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D4 _ 83. C4, 10
        test    eax, eax                                ; 06D7 _ 85. C0
        je near       ?_001                                   ; 06d9 _ 0f 84, fffffcad
        call    io_sti                                  ; 06DF _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06E4 _ 83. EC, 0C
        push    timerinfo                               ; 06E7 _ 68, 00000110(d)
        call    fifo8_get                               ; 06EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06F1 _ 83. C4, 10
        mov     dword [ebp-50H], eax                    ; 06F4 _ 89. 45, B0
        cmp     dword [ebp-50H], 10                     ; 06F7 _ 83. 7D, B0, 0A
        jnz near      ?_010                                   ; 06fb _ 75, 43
        sub     esp, 8                                  ; 06FD _ 83. EC, 08
        push    100                                     ; 0700 _ 6A, 64
        push    dword [ebp-28H]                         ; 0702 _ FF. 75, D8
        call    timer_settime                           ; 0705 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 070A _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 070D _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 0711 _ 83. 7D, E8, 28
        jle near      ?_001                                   ; 0715 _ 0f 8e, fffffc71
        cmp     dword [ebp-1CH], 0                      ; 071B _ 83. 7D, E4, 00
        jne near      ?_001                                   ; 071f _ 0f 85, fffffc67
        call    io_cli                                  ; 0725 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1867]                ; 072A _ A1, 00000274(d)
        sub     esp, 12                                 ; 072F _ 83. EC, 0C
        push    eax                                     ; 0732 _ 50
        call    task_sleep                              ; 0733 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0738 _ 83. C4, 10
        jmp     ?_001                                   ; 073B _ E9, FFFFFC4C

?_010:  cmp     dword [ebp-50H], 2                      ; 0740 _ 83. 7D, B0, 02
        jnz near      ?_011                                   ; 0744 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0746 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 074C _ A1, 00000264(d)
        sub     esp, 8                                  ; 0751 _ 83. EC, 08
        push    ?_221                                   ; 0754 _ 68, 00000017(d)
        push    7                                       ; 0759 _ 6A, 07
        push    32                                      ; 075B _ 6A, 20
        push    0                                       ; 075D _ 6A, 00
        push    edx                                     ; 075F _ 52
        push    eax                                     ; 0760 _ 50
        call    showString                              ; 0761 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0766 _ 83. C4, 20
        jmp     ?_001                                   ; 0769 _ E9, FFFFFC1E

?_011:  cmp     dword [ebp-50H], 0                      ; 076E _ 83. 7D, B0, 00
        jz near       ?_012                                   ; 0772 _ 74, 1e
        sub     esp, 4                                  ; 0774 _ 83. EC, 04
        push    0                                       ; 0777 _ 6A, 00
        push    timerinfo                               ; 0779 _ 68, 00000110(d)
        push    dword [ebp-30H]                         ; 077E _ FF. 75, D0
        call    timer_init                              ; 0781 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0786 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0789 _ C7. 45, F0, 00000000
        jmp     ?_013                                   ; 0790 _ EB, 1C

?_012:  sub     esp, 4                                  ; 0792 _ 83. EC, 04
        push    1                                       ; 0795 _ 6A, 01
        push    timerinfo                               ; 0797 _ 68, 00000110(d)
        push    dword [ebp-30H]                         ; 079C _ FF. 75, D0
        call    timer_init                              ; 079F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07A4 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 07A7 _ C7. 45, F0, 00000007
?_013:  sub     esp, 8                                  ; 07AE _ 83. EC, 08
        push    50                                      ; 07B1 _ 6A, 32
        push    dword [ebp-30H]                         ; 07B3 _ FF. 75, D0
        call    timer_settime                           ; 07B6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07BB _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 07BE _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 07C1 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 07C4 _ 8B. 45, F0
        movzx   ecx, al                                 ; 07C7 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 07CA _ A1, 00000260(d)
        mov     edx, dword [eax+4H]                     ; 07CF _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 07D2 _ A1, 00000260(d)
        mov     eax, dword [eax]                        ; 07D7 _ 8B. 00
        sub     esp, 4                                  ; 07D9 _ 83. EC, 04
        push    43                                      ; 07DC _ 6A, 2B
        push    ebx                                     ; 07DE _ 53
        push    28                                      ; 07DF _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07E1 _ FF. 75, F4
        push    ecx                                     ; 07E4 _ 51
        push    edx                                     ; 07E5 _ 52
        push    eax                                     ; 07E6 _ 50
        call    boxfill8                                ; 07E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07EC _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 07EF _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 07F2 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 07F5 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07FB _ A1, 00000264(d)
        sub     esp, 8                                  ; 0800 _ 83. EC, 08
        push    44                                      ; 0803 _ 6A, 2C
        push    ecx                                     ; 0805 _ 51
        push    28                                      ; 0806 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0808 _ FF. 75, F4
        push    edx                                     ; 080B _ 52
        push    eax                                     ; 080C _ 50
        call    sheet_refresh                           ; 080D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0812 _ 83. C4, 20
        jmp     ?_001                                   ; 0815 _ E9, FFFFFB72
; CMain End of function

transferScanCode:; Function begin
        push    ebp                                     ; 081A _ 55
        mov     ebp, esp                                ; 081B _ 89. E5
        sub     esp, 16                                 ; 081D _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0820 _ 83. 7D, 08, 2A
        jnz near      ?_014                                   ; 0824 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 0826 _ A1, 00000000(d)
        or      eax, 01H                                ; 082B _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 082E _ A3, 00000000(d)
?_014:  cmp     dword [ebp+8H], 54                      ; 0833 _ 83. 7D, 08, 36
        jnz near      ?_015                                   ; 0837 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 0839 _ A1, 00000000(d)
        or      eax, 02H                                ; 083E _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0841 _ A3, 00000000(d)
?_015:  cmp     dword [ebp+8H], 170                     ; 0846 _ 81. 7D, 08, 000000AA
        jnz near      ?_016                                   ; 084d _ 75, 0d
        mov     eax, dword [key_shift]                  ; 084F _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0854 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0857 _ A3, 00000000(d)
?_016:  cmp     dword [ebp+8H], 182                     ; 085C _ 81. 7D, 08, 000000B6
        jnz near      ?_017                                   ; 0863 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 0865 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 086A _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 086D _ A3, 00000000(d)
?_017:  cmp     dword [ebp+8H], 42                      ; 0872 _ 83. 7D, 08, 2A
        jz near       ?_018                                   ; 0876 _ 74, 1e
        cmp     dword [ebp+8H], 54                      ; 0878 _ 83. 7D, 08, 36
        jz near       ?_018                                   ; 087c _ 74, 18
        cmp     dword [ebp+8H], 170                     ; 087E _ 81. 7D, 08, 000000AA
        jz near       ?_018                                   ; 0885 _ 74, 0f
        cmp     dword [ebp+8H], 182                     ; 0887 _ 81. 7D, 08, 000000B6
        jz near       ?_018                                   ; 088e _ 74, 06
        cmp     dword [ebp+8H], 83                      ; 0890 _ 83. 7D, 08, 53
        jle near      ?_019                                   ; 0894 _ 7e, 04
?_018:  mov     al, 0                                   ; 0896 _ B0, 00
        jmp     ?_023                                   ; 0898 _ EB, 63

?_019:  mov     byte [ebp-1H], 0                        ; 089A _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 089E _ A1, 00000000(d)
        test    eax, eax                                ; 08A3 _ 85. C0
        jnz near      ?_020                                   ; 08a5 _ 75, 23
        cmp     dword [ebp+8H], 83                      ; 08A7 _ 83. 7D, 08, 53
        jg  near      ?_020                                   ; 08ab _ 7f, 1d
        mov     eax, dword [ebp+8H]                     ; 08AD _ 8B. 45, 08
        add     eax, keytable                           ; 08B0 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 08B5 _ 8A. 00
        test    al, al                                  ; 08B7 _ 84. C0
        jz near       ?_020                                   ; 08b9 _ 74, 0f
        mov     eax, dword [ebp+8H]                     ; 08BB _ 8B. 45, 08
        add     eax, keytable                           ; 08BE _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 08C3 _ 8A. 00
        mov     byte [ebp-1H], al                       ; 08C5 _ 88. 45, FF
        jmp     ?_022                                   ; 08C8 _ EB, 30

?_020:  mov     eax, dword [key_shift]                  ; 08CA _ A1, 00000000(d)
        test    eax, eax                                ; 08CF _ 85. C0
        jz near       ?_021                                   ; 08d1 _ 74, 23
        cmp     dword [ebp+8H], 127                     ; 08D3 _ 83. 7D, 08, 7F
        jg  near      ?_021                                   ; 08d7 _ 7f, 1d
        mov     eax, dword [ebp+8H]                     ; 08D9 _ 8B. 45, 08
        add     eax, keytable1                          ; 08DC _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 08E1 _ 8A. 00
        test    al, al                                  ; 08E3 _ 84. C0
        jz near       ?_021                                   ; 08e5 _ 74, 0f
        mov     eax, dword [ebp+8H]                     ; 08E7 _ 8B. 45, 08
        add     eax, keytable1                          ; 08EA _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 08EF _ 8A. 00
        mov     byte [ebp-1H], al                       ; 08F1 _ 88. 45, FF
        jmp     ?_022                                   ; 08F4 _ EB, 04

?_021:  mov     byte [ebp-1H], 0                        ; 08F6 _ C6. 45, FF, 00
?_022:  mov     al, byte [ebp-1H]                       ; 08FA _ 8A. 45, FF
?_023:  leave                                           ; 08FD _ C9
        ret                                             ; 08FE _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 08FF _ 55
        mov     ebp, esp                                ; 0900 _ 89. E5
        sub     esp, 24                                 ; 0902 _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 0905 _ A1, 00000264(d)
        sub     esp, 12                                 ; 090A _ 83. EC, 0C
        push    eax                                     ; 090D _ 50
        call    sheet_alloc                             ; 090E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0913 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0916 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0919 _ A1, 00000000(d)
        sub     esp, 8                                  ; 091E _ 83. EC, 08
        push    42240                                   ; 0921 _ 68, 0000A500
        push    eax                                     ; 0926 _ 50
        call    memman_alloc_4k                         ; 0927 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 092C _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 092F _ 89. 45, F0
        sub     esp, 12                                 ; 0932 _ 83. EC, 0C
        push    99                                      ; 0935 _ 6A, 63
        push    165                                     ; 0937 _ 68, 000000A5
        push    256                                     ; 093C _ 68, 00000100
        push    dword [ebp-10H]                         ; 0941 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0944 _ FF. 75, F4
        call    sheet_setbuf                            ; 0947 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 094C _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 094F _ A1, 00000264(d)
        push    0                                       ; 0954 _ 6A, 00
        push    ?_220                                   ; 0956 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 095B _ FF. 75, F4
        push    eax                                     ; 095E _ 50
        call    make_window8                            ; 095F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0964 _ 83. C4, 10
        sub     esp, 8                                  ; 0967 _ 83. EC, 08
        push    0                                       ; 096A _ 6A, 00
        push    128                                     ; 096C _ 68, 00000080
        push    240                                     ; 0971 _ 68, 000000F0
        push    28                                      ; 0976 _ 6A, 1C
        push    8                                       ; 0978 _ 6A, 08
        push    dword [ebp-0CH]                         ; 097A _ FF. 75, F4
        call    make_textbox8                           ; 097D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0982 _ 83. C4, 20
        call    task_alloc                              ; 0985 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 098A _ 89. 45, EC
        call    get_code32_addr                         ; 098D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0992 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0995 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0998 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 099F _ 8B. 45, EC
        mov     dword [eax+78H], 1073741824             ; 09A2 _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-18H]                    ; 09A9 _ 8B. 45, E8
        neg     eax                                     ; 09AC _ F7. D8
        add     eax, console_task                       ; 09AE _ 05, 00000000(d)
        mov     edx, eax                                ; 09B3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 09B5 _ 8B. 45, EC
        mov     dword [eax+34H], edx                    ; 09B8 _ 89. 50, 34
        mov     eax, dword [ebp-14H]                    ; 09BB _ 8B. 45, EC
        mov     dword [eax+5CH], 0                      ; 09BE _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-14H]                    ; 09C5 _ 8B. 45, EC
        mov     dword [eax+60H], 8                      ; 09C8 _ C7. 40, 60, 00000008
        mov     eax, dword [ebp-14H]                    ; 09CF _ 8B. 45, EC
        mov     dword [eax+64H], 32                     ; 09D2 _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-14H]                    ; 09D9 _ 8B. 45, EC
        mov     dword [eax+68H], 24                     ; 09DC _ C7. 40, 68, 00000018
        mov     eax, dword [ebp-14H]                    ; 09E3 _ 8B. 45, EC
        mov     dword [eax+6CH], 0                      ; 09E6 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-14H]                    ; 09ED _ 8B. 45, EC
        mov     dword [eax+70H], 16                     ; 09F0 _ C7. 40, 70, 00000010
        mov     eax, dword [ebp-14H]                    ; 09F7 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 09FA _ 8B. 40, 4C
        lea     edx, [eax-8H]                           ; 09FD _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0A00 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0A03 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0A06 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0A09 _ 8B. 40, 4C
        add     eax, 4                                  ; 0A0C _ 83. C0, 04
        mov     edx, eax                                ; 0A0F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0A11 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0A14 _ 89. 02
        sub     esp, 4                                  ; 0A16 _ 83. EC, 04
        push    5                                       ; 0A19 _ 6A, 05
        push    1                                       ; 0A1B _ 6A, 01
        push    dword [ebp-14H]                         ; 0A1D _ FF. 75, EC
        call    task_run                                ; 0A20 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A25 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0A28 _ A1, 00000264(d)
        push    4                                       ; 0A2D _ 6A, 04
        push    32                                      ; 0A2F _ 6A, 20
        push    dword [ebp-0CH]                         ; 0A31 _ FF. 75, F4
        push    eax                                     ; 0A34 _ 50
        call    sheet_slide                             ; 0A35 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A3A _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0A3D _ A1, 00000264(d)
        sub     esp, 4                                  ; 0A42 _ 83. EC, 04
        push    1                                       ; 0A45 _ 6A, 01
        push    dword [ebp-0CH]                         ; 0A47 _ FF. 75, F4
        push    eax                                     ; 0A4A _ 50
        call    sheet_updown                            ; 0A4B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A50 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0A53 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0A56 _ A3, 00000270(d)
        mov     eax, dword [ebp-0CH]                    ; 0A5B _ 8B. 45, F4
        leave                                           ; 0A5E _ C9
        ret                                             ; 0A5F _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 0A60 _ 55
        mov     ebp, esp                                ; 0A61 _ 89. E5
        push    ebx                                     ; 0A63 _ 53
        sub     esp, 548                                ; 0A64 _ 81. EC, 00000224
        call    task_now                                ; 0A6A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0A6F _ 89. 45, EC
        mov     dword [ebp-0CH], 16                     ; 0A72 _ C7. 45, F4, 00000010
        mov     dword [ebp-10H], 0                      ; 0A79 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A80 _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0A83 _ 8D. 50, 10
        push    dword [ebp-14H]                         ; 0A86 _ FF. 75, EC
        lea     eax, [ebp-220H]                         ; 0A89 _ 8D. 85, FFFFFDE0
        push    eax                                     ; 0A8F _ 50
        push    128                                     ; 0A90 _ 68, 00000080
        push    edx                                     ; 0A95 _ 52
        call    fifo8_init                              ; 0A96 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A9B _ 83. C4, 10
        call    timer_alloc                             ; 0A9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0AA3 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0AA6 _ 8B. 45, EC
        add     eax, 16                                 ; 0AA9 _ 83. C0, 10
        sub     esp, 4                                  ; 0AAC _ 83. EC, 04
        push    1                                       ; 0AAF _ 6A, 01
        push    eax                                     ; 0AB1 _ 50
        push    dword [ebp-18H]                         ; 0AB2 _ FF. 75, E8
        call    timer_init                              ; 0AB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ABA _ 83. C4, 10
        sub     esp, 8                                  ; 0ABD _ 83. EC, 08
        push    50                                      ; 0AC0 _ 6A, 32
        push    dword [ebp-18H]                         ; 0AC2 _ FF. 75, E8
        call    timer_settime                           ; 0AC5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ACA _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0ACD _ A1, 00000264(d)
        sub     esp, 8                                  ; 0AD2 _ 83. EC, 08
        push    ?_222                                   ; 0AD5 _ 68, 0000001E(d)
        push    7                                       ; 0ADA _ 6A, 07
        push    28                                      ; 0ADC _ 6A, 1C
        push    8                                       ; 0ADE _ 6A, 08
        push    dword [ebp+8H]                          ; 0AE0 _ FF. 75, 08
        push    eax                                     ; 0AE3 _ 50
        call    showString                              ; 0AE4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AE9 _ 83. C4, 20
?_024:  call    io_cli                                  ; 0AEC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0AF1 _ 8B. 45, EC
        add     eax, 16                                 ; 0AF4 _ 83. C0, 10
        sub     esp, 12                                 ; 0AF7 _ 83. EC, 0C
        push    eax                                     ; 0AFA _ 50
        call    fifo8_status                            ; 0AFB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B00 _ 83. C4, 10
        test    eax, eax                                ; 0B03 _ 85. C0
        jnz near      ?_025                                   ; 0b05 _ 75, 07
        call    io_sti                                  ; 0B07 _ E8, FFFFFFFC(rel)
        jmp     ?_024                                   ; 0B0C _ EB, DE

?_025:  mov     eax, dword [ebp-14H]                    ; 0B0E _ 8B. 45, EC
        add     eax, 16                                 ; 0B11 _ 83. C0, 10
        sub     esp, 12                                 ; 0B14 _ 83. EC, 0C
        push    eax                                     ; 0B17 _ 50
        call    fifo8_get                               ; 0B18 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B1D _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0B20 _ 89. 45, E4
        call    io_sti                                  ; 0B23 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 1                      ; 0B28 _ 83. 7D, E4, 01
        jg  near      ?_028                                   ; 0b2c _ 7f, 59
        cmp     dword [ebp-1CH], 0                      ; 0B2E _ 83. 7D, E4, 00
        jz near       ?_026                                   ; 0b32 _ 74, 20
        mov     eax, dword [ebp-14H]                    ; 0B34 _ 8B. 45, EC
        add     eax, 16                                 ; 0B37 _ 83. C0, 10
        sub     esp, 4                                  ; 0B3A _ 83. EC, 04
        push    0                                       ; 0B3D _ 6A, 00
        push    eax                                     ; 0B3F _ 50
        push    dword [ebp-18H]                         ; 0B40 _ FF. 75, E8
        call    timer_init                              ; 0B43 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B48 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0B4B _ C7. 45, F0, 00000007
        jmp     ?_027                                   ; 0B52 _ EB, 1E

?_026:  mov     eax, dword [ebp-14H]                    ; 0B54 _ 8B. 45, EC
        add     eax, 16                                 ; 0B57 _ 83. C0, 10
        sub     esp, 4                                  ; 0B5A _ 83. EC, 04
        push    1                                       ; 0B5D _ 6A, 01
        push    eax                                     ; 0B5F _ 50
        push    dword [ebp-18H]                         ; 0B60 _ FF. 75, E8
        call    timer_init                              ; 0B63 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B68 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0B6B _ C7. 45, F0, 00000000
?_027:  sub     esp, 8                                  ; 0B72 _ 83. EC, 08
        push    50                                      ; 0B75 _ 6A, 32
        push    dword [ebp-18H]                         ; 0B77 _ FF. 75, E8
        call    timer_settime                           ; 0B7A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B7F _ 83. C4, 10
        jmp     ?_030                                   ; 0B82 _ E9, 00000156

?_028:  cmp     dword [ebp-1CH], 14                     ; 0B87 _ 83. 7D, E4, 0E
        jne near      ?_029                                   ; 0b8b _ 0f 85, 000000a7
        cmp     dword [ebp-0CH], 8                      ; 0B91 _ 83. 7D, F4, 08
        jle near      ?_029                                   ; 0b95 _ 0f 8e, 0000009d
        mov     eax, dword [ebp-0CH]                    ; 0B9B _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0B9E _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0BA1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0BA4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BA7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0BAA _ 8B. 00
        sub     esp, 4                                  ; 0BAC _ 83. EC, 04
        push    43                                      ; 0BAF _ 6A, 2B
        push    ecx                                     ; 0BB1 _ 51
        push    28                                      ; 0BB2 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0BB4 _ FF. 75, F4
        push    0                                       ; 0BB7 _ 6A, 00
        push    edx                                     ; 0BB9 _ 52
        push    eax                                     ; 0BBA _ 50
        call    boxfill8                                ; 0BBB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BC0 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0BC3 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0BC6 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0BC9 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0BCE _ 83. EC, 08
        push    44                                      ; 0BD1 _ 6A, 2C
        push    edx                                     ; 0BD3 _ 52
        push    28                                      ; 0BD4 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0BD6 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0BD9 _ FF. 75, 08
        push    eax                                     ; 0BDC _ 50
        call    sheet_refresh                           ; 0BDD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BE2 _ 83. C4, 20
        sub     dword [ebp-0CH], 8                      ; 0BE5 _ 83. 6D, F4, 08
        mov     eax, dword [ebp-0CH]                    ; 0BE9 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0BEC _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0BEF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0BF2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0BF5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0BF8 _ 8B. 00
        sub     esp, 4                                  ; 0BFA _ 83. EC, 04
        push    43                                      ; 0BFD _ 6A, 2B
        push    ecx                                     ; 0BFF _ 51
        push    28                                      ; 0C00 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C02 _ FF. 75, F4
        push    0                                       ; 0C05 _ 6A, 00
        push    edx                                     ; 0C07 _ 52
        push    eax                                     ; 0C08 _ 50
        call    boxfill8                                ; 0C09 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C0E _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0C11 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0C14 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0C17 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0C1C _ 83. EC, 08
        push    44                                      ; 0C1F _ 6A, 2C
        push    edx                                     ; 0C21 _ 52
        push    28                                      ; 0C22 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C24 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0C27 _ FF. 75, 08
        push    eax                                     ; 0C2A _ 50
        call    sheet_refresh                           ; 0C2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C30 _ 83. C4, 20
        jmp     ?_030                                   ; 0C33 _ E9, 000000A5

?_029:  cmp     dword [ebp-0CH], 239                    ; 0C38 _ 81. 7D, F4, 000000EF
        jg  near      ?_030                                   ; 0c3f _ 0f 8f, 00000098
        sub     esp, 12                                 ; 0C45 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 0C48 _ FF. 75, E4
        call    transferScanCode                        ; 0C4B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C50 _ 83. C4, 10
        test    al, al                                  ; 0C53 _ 84. C0
        je near       ?_030                                   ; 0c55 _ 0f 84, 00000082
        mov     eax, dword [ebp-0CH]                    ; 0C5B _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0C5E _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0C61 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0C64 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C67 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0C6A _ 8B. 00
        sub     esp, 4                                  ; 0C6C _ 83. EC, 04
        push    43                                      ; 0C6F _ 6A, 2B
        push    ecx                                     ; 0C71 _ 51
        push    28                                      ; 0C72 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C74 _ FF. 75, F4
        push    0                                       ; 0C77 _ 6A, 00
        push    edx                                     ; 0C79 _ 52
        push    eax                                     ; 0C7A _ 50
        call    boxfill8                                ; 0C7B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C80 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0C83 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0C86 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0C89 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0C8E _ 83. EC, 08
        push    44                                      ; 0C91 _ 6A, 2C
        push    edx                                     ; 0C93 _ 52
        push    28                                      ; 0C94 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C96 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0C99 _ FF. 75, 08
        push    eax                                     ; 0C9C _ 50
        call    sheet_refresh                           ; 0C9D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CA2 _ 83. C4, 20
        sub     esp, 12                                 ; 0CA5 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 0CA8 _ FF. 75, E4
        call    transferScanCode                        ; 0CAB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB0 _ 83. C4, 10
        mov     byte [ebp-1EH], al                      ; 0CB3 _ 88. 45, E2
        mov     byte [ebp-1DH], 0                       ; 0CB6 _ C6. 45, E3, 00
        mov     eax, dword [shtctl]                     ; 0CBA _ A1, 00000264(d)
        sub     esp, 8                                  ; 0CBF _ 83. EC, 08
        lea     edx, [ebp-1EH]                          ; 0CC2 _ 8D. 55, E2
        push    edx                                     ; 0CC5 _ 52
        push    7                                       ; 0CC6 _ 6A, 07
        push    28                                      ; 0CC8 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0CCA _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0CCD _ FF. 75, 08
        push    eax                                     ; 0CD0 _ 50
        call    showString                              ; 0CD1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CD6 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0CD9 _ 83. 45, F4, 08
?_030:  mov     eax, dword [ebp-0CH]                    ; 0CDD _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0CE0 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0CE3 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0CE6 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 0CE9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0CEC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CEF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0CF2 _ 8B. 00
        sub     esp, 4                                  ; 0CF4 _ 83. EC, 04
        push    43                                      ; 0CF7 _ 6A, 2B
        push    ebx                                     ; 0CF9 _ 53
        push    28                                      ; 0CFA _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0CFC _ FF. 75, F4
        push    ecx                                     ; 0CFF _ 51
        push    edx                                     ; 0D00 _ 52
        push    eax                                     ; 0D01 _ 50
        call    boxfill8                                ; 0D02 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D07 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0D0A _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0D0D _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0D10 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D15 _ 83. EC, 08
        push    44                                      ; 0D18 _ 6A, 2C
        push    edx                                     ; 0D1A _ 52
        push    28                                      ; 0D1B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0D1D _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D20 _ FF. 75, 08
        push    eax                                     ; 0D23 _ 50
        call    sheet_refresh                           ; 0D24 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D29 _ 83. C4, 20
        jmp     ?_024                                   ; 0D2C _ E9, FFFFFDBB
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 0D31 _ 55
        mov     ebp, esp                                ; 0D32 _ 89. E5
        sub     esp, 72                                 ; 0D34 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0D37 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0D3D _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D42 _ 83. EC, 08
        push    ?_223                                   ; 0D45 _ 68, 00000020(d)
        push    7                                       ; 0D4A _ 6A, 07
        push    160                                     ; 0D4C _ 68, 000000A0
        push    0                                       ; 0D51 _ 6A, 00
        push    edx                                     ; 0D53 _ 52
        push    eax                                     ; 0D54 _ 50
        call    showString                              ; 0D55 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D5A _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0D5D _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0D64 _ C7. 45, E8, 00000000
        push    0                                       ; 0D6B _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 0D6D _ 8D. 45, C4
        push    eax                                     ; 0D70 _ 50
        push    8                                       ; 0D71 _ 6A, 08
        lea     eax, [ebp-34H]                          ; 0D73 _ 8D. 45, CC
        push    eax                                     ; 0D76 _ 50
        call    fifo8_init                              ; 0D77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D7C _ 83. C4, 10
        call    timer_alloc                             ; 0D7F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0D84 _ 89. 45, EC
        sub     esp, 4                                  ; 0D87 _ 83. EC, 04
        push    123                                     ; 0D8A _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0D8C _ 8D. 45, CC
        push    eax                                     ; 0D8F _ 50
        push    dword [ebp-14H]                         ; 0D90 _ FF. 75, EC
        call    timer_init                              ; 0D93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D98 _ 83. C4, 10
        sub     esp, 8                                  ; 0D9B _ 83. EC, 08
        push    100                                     ; 0D9E _ 6A, 64
        push    dword [ebp-14H]                         ; 0DA0 _ FF. 75, EC
        call    timer_settime                           ; 0DA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DA8 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0DAB _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0DB2 _ C7. 45, F0, 00000000
?_031:  inc     dword [ebp-0CH]                         ; 0DB9 _ FF. 45, F4
        call    io_cli                                  ; 0DBC _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0DC1 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0DC4 _ 8D. 45, CC
        push    eax                                     ; 0DC7 _ 50
        call    fifo8_status                            ; 0DC8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DCD _ 83. C4, 10
        test    eax, eax                                ; 0DD0 _ 85. C0
        jnz near      ?_032                                   ; 0dd2 _ 75, 07
        call    io_sti                                  ; 0DD4 _ E8, FFFFFFFC(rel)
        jmp     ?_031                                   ; 0DD9 _ EB, DE

?_032:  sub     esp, 12                                 ; 0DDB _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0DDE _ 8D. 45, CC
        push    eax                                     ; 0DE1 _ 50
        call    fifo8_get                               ; 0DE2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DE7 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0DEA _ 89. 45, E8
        call    io_sti                                  ; 0DED _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0DF2 _ 83. 7D, E8, 7B
        jnz near      ?_031                                   ; 0df6 _ 75, c1
        mov     edx, dword [sht_back]                   ; 0DF8 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0DFE _ A1, 00000264(d)
        sub     esp, 8                                  ; 0E03 _ 83. EC, 08
        push    ?_224                                   ; 0E06 _ 68, 0000002D(d)
        push    7                                       ; 0E0B _ 6A, 07
        push    192                                     ; 0E0D _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0E12 _ FF. 75, F0
        push    edx                                     ; 0E15 _ 52
        push    eax                                     ; 0E16 _ 50
        call    showString                              ; 0E17 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E1C _ 83. C4, 20
        sub     esp, 8                                  ; 0E1F _ 83. EC, 08
        push    100                                     ; 0E22 _ 6A, 64
        push    dword [ebp-14H]                         ; 0E24 _ FF. 75, EC
        call    timer_settime                           ; 0E27 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E2C _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0E2F _ 83. 45, F0, 08
        jmp     ?_031                                   ; 0E33 _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0E35 _ 55
        mov     ebp, esp                                ; 0E36 _ 89. E5
        push    ebx                                     ; 0E38 _ 53
        sub     esp, 4                                  ; 0E39 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0E3C _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0E3F _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0E42 _ 8B. 45, 0C
        dec     eax                                     ; 0E45 _ 48
        sub     esp, 4                                  ; 0E46 _ 83. EC, 04
        push    edx                                     ; 0E49 _ 52
        push    eax                                     ; 0E4A _ 50
        push    0                                       ; 0E4B _ 6A, 00
        push    0                                       ; 0E4D _ 6A, 00
        push    14                                      ; 0E4F _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0E51 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E54 _ FF. 75, 08
        call    boxfill8                                ; 0E57 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E5C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E5F _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0E62 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0E65 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0E68 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0E6B _ 8B. 45, 10
        sub     eax, 28                                 ; 0E6E _ 83. E8, 1C
        sub     esp, 4                                  ; 0E71 _ 83. EC, 04
        push    ecx                                     ; 0E74 _ 51
        push    edx                                     ; 0E75 _ 52
        push    eax                                     ; 0E76 _ 50
        push    0                                       ; 0E77 _ 6A, 00
        push    8                                       ; 0E79 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0E7B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E7E _ FF. 75, 08
        call    boxfill8                                ; 0E81 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E86 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0E89 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0E8C _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0E8F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0E92 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0E95 _ 8B. 45, 10
        sub     eax, 27                                 ; 0E98 _ 83. E8, 1B
        sub     esp, 4                                  ; 0E9B _ 83. EC, 04
        push    ecx                                     ; 0E9E _ 51
        push    edx                                     ; 0E9F _ 52
        push    eax                                     ; 0EA0 _ 50
        push    0                                       ; 0EA1 _ 6A, 00
        push    7                                       ; 0EA3 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0EA5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EA8 _ FF. 75, 08
        call    boxfill8                                ; 0EAB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EB0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EB3 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0EB6 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0EB9 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0EBC _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0EBF _ 8B. 45, 10
        sub     eax, 26                                 ; 0EC2 _ 83. E8, 1A
        sub     esp, 4                                  ; 0EC5 _ 83. EC, 04
        push    ecx                                     ; 0EC8 _ 51
        push    edx                                     ; 0EC9 _ 52
        push    eax                                     ; 0ECA _ 50
        push    0                                       ; 0ECB _ 6A, 00
        push    8                                       ; 0ECD _ 6A, 08
        push    dword [ebp+0CH]                         ; 0ECF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0ED2 _ FF. 75, 08
        call    boxfill8                                ; 0ED5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EDA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EDD _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EE0 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0EE3 _ 8B. 45, 10
        sub     eax, 24                                 ; 0EE6 _ 83. E8, 18
        sub     esp, 4                                  ; 0EE9 _ 83. EC, 04
        push    edx                                     ; 0EEC _ 52
        push    59                                      ; 0EED _ 6A, 3B
        push    eax                                     ; 0EEF _ 50
        push    3                                       ; 0EF0 _ 6A, 03
        push    7                                       ; 0EF2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0EF4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EF7 _ FF. 75, 08
        call    boxfill8                                ; 0EFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EFF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F02 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F05 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F08 _ 8B. 45, 10
        sub     eax, 24                                 ; 0F0B _ 83. E8, 18
        sub     esp, 4                                  ; 0F0E _ 83. EC, 04
        push    edx                                     ; 0F11 _ 52
        push    2                                       ; 0F12 _ 6A, 02
        push    eax                                     ; 0F14 _ 50
        push    2                                       ; 0F15 _ 6A, 02
        push    7                                       ; 0F17 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F19 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F1C _ FF. 75, 08
        call    boxfill8                                ; 0F1F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F24 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F27 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F2A _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F2D _ 8B. 45, 10
        sub     eax, 4                                  ; 0F30 _ 83. E8, 04
        sub     esp, 4                                  ; 0F33 _ 83. EC, 04
        push    edx                                     ; 0F36 _ 52
        push    59                                      ; 0F37 _ 6A, 3B
        push    eax                                     ; 0F39 _ 50
        push    3                                       ; 0F3A _ 6A, 03
        push    15                                      ; 0F3C _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0F3E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F41 _ FF. 75, 08
        call    boxfill8                                ; 0F44 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F49 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F4C _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0F4F _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0F52 _ 8B. 45, 10
        sub     eax, 23                                 ; 0F55 _ 83. E8, 17
        sub     esp, 4                                  ; 0F58 _ 83. EC, 04
        push    edx                                     ; 0F5B _ 52
        push    59                                      ; 0F5C _ 6A, 3B
        push    eax                                     ; 0F5E _ 50
        push    59                                      ; 0F5F _ 6A, 3B
        push    15                                      ; 0F61 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0F63 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F66 _ FF. 75, 08
        call    boxfill8                                ; 0F69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F6E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F71 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F74 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F77 _ 8B. 45, 10
        sub     eax, 3                                  ; 0F7A _ 83. E8, 03
        sub     esp, 4                                  ; 0F7D _ 83. EC, 04
        push    edx                                     ; 0F80 _ 52
        push    59                                      ; 0F81 _ 6A, 3B
        push    eax                                     ; 0F83 _ 50
        push    2                                       ; 0F84 _ 6A, 02
        push    0                                       ; 0F86 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0F88 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F8B _ FF. 75, 08
        call    boxfill8                                ; 0F8E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F93 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F96 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0F99 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0F9C _ 8B. 45, 10
        sub     eax, 24                                 ; 0F9F _ 83. E8, 18
        sub     esp, 4                                  ; 0FA2 _ 83. EC, 04
        push    edx                                     ; 0FA5 _ 52
        push    60                                      ; 0FA6 _ 6A, 3C
        push    eax                                     ; 0FA8 _ 50
        push    60                                      ; 0FA9 _ 6A, 3C
        push    0                                       ; 0FAB _ 6A, 00
        push    dword [ebp+0CH]                         ; 0FAD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FB0 _ FF. 75, 08
        call    boxfill8                                ; 0FB3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FB8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FBB _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0FBE _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0FC1 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0FC4 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0FC7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0FCA _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0FCD _ 8B. 45, 0C
        sub     eax, 47                                 ; 0FD0 _ 83. E8, 2F
        sub     esp, 4                                  ; 0FD3 _ 83. EC, 04
        push    ebx                                     ; 0FD6 _ 53
        push    ecx                                     ; 0FD7 _ 51
        push    edx                                     ; 0FD8 _ 52
        push    eax                                     ; 0FD9 _ 50
        push    15                                      ; 0FDA _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0FDC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FDF _ FF. 75, 08
        call    boxfill8                                ; 0FE2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FE7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FEA _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0FED _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0FF0 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0FF3 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0FF6 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0FF9 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0FFC _ 8B. 45, 0C
        sub     eax, 47                                 ; 0FFF _ 83. E8, 2F
        sub     esp, 4                                  ; 1002 _ 83. EC, 04
        push    ebx                                     ; 1005 _ 53
        push    ecx                                     ; 1006 _ 51
        push    edx                                     ; 1007 _ 52
        push    eax                                     ; 1008 _ 50
        push    15                                      ; 1009 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 100B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 100E _ FF. 75, 08
        call    boxfill8                                ; 1011 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1016 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1019 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 101C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 101F _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1022 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1025 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1028 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 102B _ 8B. 45, 0C
        sub     eax, 47                                 ; 102E _ 83. E8, 2F
        sub     esp, 4                                  ; 1031 _ 83. EC, 04
        push    ebx                                     ; 1034 _ 53
        push    ecx                                     ; 1035 _ 51
        push    edx                                     ; 1036 _ 52
        push    eax                                     ; 1037 _ 50
        push    7                                       ; 1038 _ 6A, 07
        push    dword [ebp+0CH]                         ; 103A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 103D _ FF. 75, 08
        call    boxfill8                                ; 1040 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1045 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1048 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 104B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 104E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1051 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1054 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1057 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 105A _ 8B. 45, 0C
        sub     eax, 3                                  ; 105D _ 83. E8, 03
        sub     esp, 4                                  ; 1060 _ 83. EC, 04
        push    ebx                                     ; 1063 _ 53
        push    ecx                                     ; 1064 _ 51
        push    edx                                     ; 1065 _ 52
        push    eax                                     ; 1066 _ 50
        push    7                                       ; 1067 _ 6A, 07
        push    dword [ebp+0CH]                         ; 1069 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 106C _ FF. 75, 08
        call    boxfill8                                ; 106F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1074 _ 83. C4, 20
        nop                                             ; 1077 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1078 _ 8B. 5D, FC
        leave                                           ; 107B _ C9
        ret                                             ; 107C _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 107D _ 55
        mov     ebp, esp                                ; 107E _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1080 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1083 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 1086 _ A1, 00000134(d)
        add     eax, edx                                ; 108B _ 01. D0
        mov     dword [mx], eax                         ; 108D _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 1092 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1095 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 1098 _ A1, 00000138(d)
        add     eax, edx                                ; 109D _ 01. D0
        mov     dword [my], eax                         ; 109F _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 10A4 _ A1, 00000134(d)
        test    eax, eax                                ; 10A9 _ 85. C0
        jns     ?_033                                   ; 10AB _ 79, 0A
        mov     dword [mx], 0                           ; 10AD _ C7. 05, 00000134(d), 00000000
?_033:  mov     eax, dword [my]                         ; 10B7 _ A1, 00000138(d)
        test    eax, eax                                ; 10BC _ 85. C0
        jns     ?_034                                   ; 10BE _ 79, 0A
        mov     dword [my], 0                           ; 10C0 _ C7. 05, 00000138(d), 00000000
?_034:  mov     edx, dword [xsize]                      ; 10CA _ 8B. 15, 0000013C(d)
        mov     eax, dword [mx]                         ; 10D0 _ A1, 00000134(d)
        cmp     edx, eax                                ; 10D5 _ 39. C2
        jg  near      ?_035                                   ; 10d7 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 10D9 _ A1, 0000013C(d)
        dec     eax                                     ; 10DE _ 48
        mov     dword [mx], eax                         ; 10DF _ A3, 00000134(d)
?_035:  mov     edx, dword [ysize]                      ; 10E4 _ 8B. 15, 00000140(d)
        mov     eax, dword [my]                         ; 10EA _ A1, 00000138(d)
        cmp     edx, eax                                ; 10EF _ 39. C2
        jg  near      ?_036                                   ; 10f1 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 10F3 _ A1, 00000140(d)
        dec     eax                                     ; 10F8 _ 48
        mov     dword [my], eax                         ; 10F9 _ A3, 00000138(d)
?_036:  nop                                             ; 10FE _ 90
        pop     ebp                                     ; 10FF _ 5D
        ret                                             ; 1100 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1101 _ 55
        mov     ebp, esp                                ; 1102 _ 89. E5
        sub     esp, 24                                 ; 1104 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 1107 _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 110C _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 110F _ C6. 45, F3, 00
        call    io_sti                                  ; 1113 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 1118 _ 83. EC, 0C
        push    mouseinfo                               ; 111B _ 68, 00000028(d)
        call    fifo8_get                               ; 1120 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1125 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 1128 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 112B _ 0F B6. 45, F3
        sub     esp, 8                                  ; 112F _ 83. EC, 08
        push    eax                                     ; 1132 _ 50
        push    mdec                                    ; 1133 _ 68, 00000100(d)
        call    mouse_decode                            ; 1138 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 113D _ 83. C4, 10
        test    eax, eax                                ; 1140 _ 85. C0
        jz near       ?_037                                   ; 1142 _ 74, 60
        sub     esp, 4                                  ; 1144 _ 83. EC, 04
        push    mdec                                    ; 1147 _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 114C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 114F _ FF. 75, 08
        call    computeMousePosition                    ; 1152 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1157 _ 83. C4, 10
        mov     edx, dword [my]                         ; 115A _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 1160 _ A1, 00000134(d)
        push    edx                                     ; 1165 _ 52
        push    eax                                     ; 1166 _ 50
        push    dword [ebp+10H]                         ; 1167 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 116A _ FF. 75, 08
        call    sheet_slide                             ; 116D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1172 _ 83. C4, 10
        mov     eax, dword [?_234]                      ; 1175 _ A1, 0000010C(d)
        and     eax, 01H                                ; 117A _ 83. E0, 01
        test    eax, eax                                ; 117D _ 85. C0
        jz near       ?_037                                   ; 117f _ 74, 23
        mov     eax, dword [my]                         ; 1181 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 1186 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 1189 _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 118E _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 1191 _ A1, 00000260(d)
        push    ecx                                     ; 1196 _ 51
        push    edx                                     ; 1197 _ 52
        push    eax                                     ; 1198 _ 50
        push    dword [ebp+8H]                          ; 1199 _ FF. 75, 08
        call    sheet_slide                             ; 119C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11A1 _ 83. C4, 10
?_037:  nop                                             ; 11A4 _ 90
        leave                                           ; 11A5 _ C9
        ret                                             ; 11A6 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 11A7 _ 55
        mov     ebp, esp                                ; 11A8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 11AA _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 11AD _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 11B3 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 11B6 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 11BC _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 11BF _ 66: C7. 40, 06, 01E0
        nop                                             ; 11C5 _ 90
        pop     ebp                                     ; 11C6 _ 5D
        ret                                             ; 11C7 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 11C8 _ 55
        mov     ebp, esp                                ; 11C9 _ 89. E5
        push    ebx                                     ; 11CB _ 53
        sub     esp, 36                                 ; 11CC _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 11CF _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 11D2 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 11D5 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 11D8 _ 89. 45, F4
        jmp     ?_039                                   ; 11DB _ EB, 3C

?_038:  mov     eax, dword [ebp+1CH]                    ; 11DD _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 11E0 _ 8A. 00
        movzx   eax, al                                 ; 11E2 _ 0F B6. C0
        shl     eax, 4                                  ; 11E5 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 11E8 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 11EE _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 11F2 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 11F5 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 11F8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 11FB _ 8B. 00
        sub     esp, 8                                  ; 11FD _ 83. EC, 08
        push    ebx                                     ; 1200 _ 53
        push    ecx                                     ; 1201 _ 51
        push    dword [ebp+14H]                         ; 1202 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1205 _ FF. 75, 10
        push    edx                                     ; 1208 _ 52
        push    eax                                     ; 1209 _ 50
        call    showFont8                               ; 120A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 120F _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 1212 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 1216 _ FF. 45, 1C
?_039:  mov     eax, dword [ebp+1CH]                    ; 1219 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 121C _ 8A. 00
        test    al, al                                  ; 121E _ 84. C0
        jnz near      ?_038                                   ; 1220 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 1222 _ 8B. 45, 14
        add     eax, 16                                 ; 1225 _ 83. C0, 10
        sub     esp, 8                                  ; 1228 _ 83. EC, 08
        push    eax                                     ; 122B _ 50
        push    dword [ebp+10H]                         ; 122C _ FF. 75, 10
        push    dword [ebp+14H]                         ; 122F _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 1232 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1235 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1238 _ FF. 75, 08
        call    sheet_refresh                           ; 123B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1240 _ 83. C4, 20
        nop                                             ; 1243 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1244 _ 8B. 5D, FC
        leave                                           ; 1247 _ C9
        ret                                             ; 1248 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 1249 _ 55
        mov     ebp, esp                                ; 124A _ 89. E5
        sub     esp, 8                                  ; 124C _ 83. EC, 08
        sub     esp, 4                                  ; 124F _ 83. EC, 04
        push    table_rgb.1953                          ; 1252 _ 68, 00000120(d)
        push    15                                      ; 1257 _ 6A, 0F
        push    0                                       ; 1259 _ 6A, 00
        call    set_palette                             ; 125B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1260 _ 83. C4, 10
        nop                                             ; 1263 _ 90
        leave                                           ; 1264 _ C9
        ret                                             ; 1265 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 1266 _ 55
        mov     ebp, esp                                ; 1267 _ 89. E5
        sub     esp, 24                                 ; 1269 _ 83. EC, 18
        call    io_load_eflags                          ; 126C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1271 _ 89. 45, F0
        call    io_cli                                  ; 1274 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1279 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 127C _ FF. 75, 08
        push    968                                     ; 127F _ 68, 000003C8
        call    io_out8                                 ; 1284 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1289 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 128C _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 128F _ 89. 45, F4
        jmp     ?_041                                   ; 1292 _ EB, 5F

?_040:  mov     eax, dword [ebp+10H]                    ; 1294 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 1297 _ 8A. 00
        shr     al, 2                                   ; 1299 _ C0. E8, 02
        movzx   eax, al                                 ; 129C _ 0F B6. C0
        sub     esp, 8                                  ; 129F _ 83. EC, 08
        push    eax                                     ; 12A2 _ 50
        push    969                                     ; 12A3 _ 68, 000003C9
        call    io_out8                                 ; 12A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12AD _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 12B0 _ 8B. 45, 10
        inc     eax                                     ; 12B3 _ 40
        mov     al, byte [eax]                          ; 12B4 _ 8A. 00
        shr     al, 2                                   ; 12B6 _ C0. E8, 02
        movzx   eax, al                                 ; 12B9 _ 0F B6. C0
        sub     esp, 8                                  ; 12BC _ 83. EC, 08
        push    eax                                     ; 12BF _ 50
        push    969                                     ; 12C0 _ 68, 000003C9
        call    io_out8                                 ; 12C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12CA _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 12CD _ 8B. 45, 10
        add     eax, 2                                  ; 12D0 _ 83. C0, 02
        mov     al, byte [eax]                          ; 12D3 _ 8A. 00
        shr     al, 2                                   ; 12D5 _ C0. E8, 02
        movzx   eax, al                                 ; 12D8 _ 0F B6. C0
        sub     esp, 8                                  ; 12DB _ 83. EC, 08
        push    eax                                     ; 12DE _ 50
        push    969                                     ; 12DF _ 68, 000003C9
        call    io_out8                                 ; 12E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12E9 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 12EC _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 12F0 _ FF. 45, F4
?_041:  mov     eax, dword [ebp-0CH]                    ; 12F3 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 12F6 _ 3B. 45, 0C
        jle near      ?_040                                   ; 12f9 _ 7e, 99
        sub     esp, 12                                 ; 12FB _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 12FE _ FF. 75, F0
        call    io_store_eflags                         ; 1301 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1306 _ 83. C4, 10
        nop                                             ; 1309 _ 90
        leave                                           ; 130A _ C9
        ret                                             ; 130B _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 130C _ 55
        mov     ebp, esp                                ; 130D _ 89. E5
        sub     esp, 20                                 ; 130F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 1312 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 1315 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1318 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 131B _ 89. 45, F8
        jmp     ?_045                                   ; 131E _ EB, 30

?_042:  mov     eax, dword [ebp+14H]                    ; 1320 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 1323 _ 89. 45, FC
        jmp     ?_044                                   ; 1326 _ EB, 1D

?_043:  mov     eax, dword [ebp-8H]                     ; 1328 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 132B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 132F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1331 _ 8B. 45, FC
        add     eax, edx                                ; 1334 _ 01. D0
        mov     edx, eax                                ; 1336 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1338 _ 8B. 45, 08
        add     edx, eax                                ; 133B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 133D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1340 _ 88. 02
        inc     dword [ebp-4H]                          ; 1342 _ FF. 45, FC
?_044:  mov     eax, dword [ebp-4H]                     ; 1345 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 1348 _ 3B. 45, 1C
        jle near      ?_043                                   ; 134b _ 7e, db
        inc     dword [ebp-8H]                          ; 134D _ FF. 45, F8
?_045:  mov     eax, dword [ebp-8H]                     ; 1350 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 1353 _ 3B. 45, 20
        jle near      ?_042                                   ; 1356 _ 7e, c8
        nop                                             ; 1358 _ 90
        nop                                             ; 1359 _ 90
        leave                                           ; 135A _ C9
        ret                                             ; 135B _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 135C _ 55
        mov     ebp, esp                                ; 135D _ 89. E5
        sub     esp, 20                                 ; 135F _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 1362 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 1365 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1368 _ C7. 45, FC, 00000000
        jmp     ?_055                                   ; 136F _ E9, 00000162

?_046:  mov     edx, dword [ebp-4H]                     ; 1374 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 1377 _ 8B. 45, 1C
        add     eax, edx                                ; 137A _ 01. D0
        mov     al, byte [eax]                          ; 137C _ 8A. 00
        mov     byte [ebp-5H], al                       ; 137E _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 1381 _ 80. 7D, FB, 00
        jns     ?_047                                   ; 1385 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 1387 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 138A _ 8B. 45, FC
        add     eax, edx                                ; 138D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 138F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1393 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1395 _ 8B. 45, 10
        add     eax, edx                                ; 1398 _ 01. D0
        mov     edx, eax                                ; 139A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 139C _ 8B. 45, 08
        add     edx, eax                                ; 139F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13A1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 13A4 _ 88. 02
?_047:  movsx   eax, byte [ebp-5H]                      ; 13A6 _ 0F BE. 45, FB
        and     eax, 40H                                ; 13AA _ 83. E0, 40
        test    eax, eax                                ; 13AD _ 85. C0
        jz near       ?_048                                   ; 13af _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 13B1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 13B4 _ 8B. 45, FC
        add     eax, edx                                ; 13B7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 13B9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 13BD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 13BF _ 8B. 45, 10
        add     eax, edx                                ; 13C2 _ 01. D0
        lea     edx, [eax+1H]                           ; 13C4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 13C7 _ 8B. 45, 08
        add     edx, eax                                ; 13CA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13CC _ 8A. 45, EC
        mov     byte [edx], al                          ; 13CF _ 88. 02
?_048:  movsx   eax, byte [ebp-5H]                      ; 13D1 _ 0F BE. 45, FB
        and     eax, 20H                                ; 13D5 _ 83. E0, 20
        test    eax, eax                                ; 13D8 _ 85. C0
        jz near       ?_049                                   ; 13da _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 13DC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 13DF _ 8B. 45, FC
        add     eax, edx                                ; 13E2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 13E4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 13E8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 13EA _ 8B. 45, 10
        add     eax, edx                                ; 13ED _ 01. D0
        lea     edx, [eax+2H]                           ; 13EF _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 13F2 _ 8B. 45, 08
        add     edx, eax                                ; 13F5 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13F7 _ 8A. 45, EC
        mov     byte [edx], al                          ; 13FA _ 88. 02
?_049:  movsx   eax, byte [ebp-5H]                      ; 13FC _ 0F BE. 45, FB
        and     eax, 10H                                ; 1400 _ 83. E0, 10
        test    eax, eax                                ; 1403 _ 85. C0
        jz near       ?_050                                   ; 1405 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1407 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 140A _ 8B. 45, FC
        add     eax, edx                                ; 140D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 140F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1413 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1415 _ 8B. 45, 10
        add     eax, edx                                ; 1418 _ 01. D0
        lea     edx, [eax+3H]                           ; 141A _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 141D _ 8B. 45, 08
        add     edx, eax                                ; 1420 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1422 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1425 _ 88. 02
?_050:  movsx   eax, byte [ebp-5H]                      ; 1427 _ 0F BE. 45, FB
        and     eax, 08H                                ; 142B _ 83. E0, 08
        test    eax, eax                                ; 142E _ 85. C0
        jz near       ?_051                                   ; 1430 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1432 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1435 _ 8B. 45, FC
        add     eax, edx                                ; 1438 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 143A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 143E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1440 _ 8B. 45, 10
        add     eax, edx                                ; 1443 _ 01. D0
        lea     edx, [eax+4H]                           ; 1445 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1448 _ 8B. 45, 08
        add     edx, eax                                ; 144B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 144D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1450 _ 88. 02
?_051:  movsx   eax, byte [ebp-5H]                      ; 1452 _ 0F BE. 45, FB
        and     eax, 04H                                ; 1456 _ 83. E0, 04
        test    eax, eax                                ; 1459 _ 85. C0
        jz near       ?_052                                   ; 145b _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 145D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1460 _ 8B. 45, FC
        add     eax, edx                                ; 1463 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1465 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1469 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 146B _ 8B. 45, 10
        add     eax, edx                                ; 146E _ 01. D0
        lea     edx, [eax+5H]                           ; 1470 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1473 _ 8B. 45, 08
        add     edx, eax                                ; 1476 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1478 _ 8A. 45, EC
        mov     byte [edx], al                          ; 147B _ 88. 02
?_052:  movsx   eax, byte [ebp-5H]                      ; 147D _ 0F BE. 45, FB
        and     eax, 02H                                ; 1481 _ 83. E0, 02
        test    eax, eax                                ; 1484 _ 85. C0
        jz near       ?_053                                   ; 1486 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1488 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 148B _ 8B. 45, FC
        add     eax, edx                                ; 148E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1490 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1494 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1496 _ 8B. 45, 10
        add     eax, edx                                ; 1499 _ 01. D0
        lea     edx, [eax+6H]                           ; 149B _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 149E _ 8B. 45, 08
        add     edx, eax                                ; 14A1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14A3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 14A6 _ 88. 02
?_053:  movsx   eax, byte [ebp-5H]                      ; 14A8 _ 0F BE. 45, FB
        and     eax, 01H                                ; 14AC _ 83. E0, 01
        test    eax, eax                                ; 14AF _ 85. C0
        jz near       ?_054                                   ; 14b1 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14B3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14B6 _ 8B. 45, FC
        add     eax, edx                                ; 14B9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14BB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 14BF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14C1 _ 8B. 45, 10
        add     eax, edx                                ; 14C4 _ 01. D0
        lea     edx, [eax+7H]                           ; 14C6 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 14C9 _ 8B. 45, 08
        add     edx, eax                                ; 14CC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14CE _ 8A. 45, EC
        mov     byte [edx], al                          ; 14D1 _ 88. 02
?_054:  inc     dword [ebp-4H]                          ; 14D3 _ FF. 45, FC
?_055:  cmp     dword [ebp-4H], 15                      ; 14D6 _ 83. 7D, FC, 0F
        jle near      ?_046                                   ; 14da _ 0f 8e, fffffe94
        nop                                             ; 14E0 _ 90
        nop                                             ; 14E1 _ 90
        leave                                           ; 14E2 _ C9
        ret                                             ; 14E3 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 14E4 _ 55
        mov     ebp, esp                                ; 14E5 _ 89. E5
        sub     esp, 20                                 ; 14E7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 14EA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 14ED _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 14F0 _ C7. 45, F8, 00000000
        jmp     ?_062                                   ; 14F7 _ E9, 000000AB

?_056:  mov     dword [ebp-4H], 0                       ; 14FC _ C7. 45, FC, 00000000
        jmp     ?_061                                   ; 1503 _ E9, 00000092

?_057:  mov     eax, dword [ebp-8H]                     ; 1508 _ 8B. 45, F8
        shl     eax, 4                                  ; 150B _ C1. E0, 04
        mov     edx, eax                                ; 150E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1510 _ 8B. 45, FC
        add     eax, edx                                ; 1513 _ 01. D0
        add     eax, cursor.2000                        ; 1515 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 151A _ 8A. 00
        cmp     al, 42                                  ; 151C _ 3C, 2A
        jnz near      ?_058                                   ; 151e _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1520 _ 8B. 45, F8
        shl     eax, 4                                  ; 1523 _ C1. E0, 04
        mov     edx, eax                                ; 1526 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1528 _ 8B. 45, FC
        add     eax, edx                                ; 152B _ 01. D0
        mov     edx, eax                                ; 152D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 152F _ 8B. 45, 08
        add     eax, edx                                ; 1532 _ 01. D0
        mov     byte [eax], 0                           ; 1534 _ C6. 00, 00
?_058:  mov     eax, dword [ebp-8H]                     ; 1537 _ 8B. 45, F8
        shl     eax, 4                                  ; 153A _ C1. E0, 04
        mov     edx, eax                                ; 153D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 153F _ 8B. 45, FC
        add     eax, edx                                ; 1542 _ 01. D0
        add     eax, cursor.2000                        ; 1544 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 1549 _ 8A. 00
        cmp     al, 79                                  ; 154B _ 3C, 4F
        jnz near      ?_059                                   ; 154d _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 154F _ 8B. 45, F8
        shl     eax, 4                                  ; 1552 _ C1. E0, 04
        mov     edx, eax                                ; 1555 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1557 _ 8B. 45, FC
        add     eax, edx                                ; 155A _ 01. D0
        mov     edx, eax                                ; 155C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 155E _ 8B. 45, 08
        add     eax, edx                                ; 1561 _ 01. D0
        mov     byte [eax], 7                           ; 1563 _ C6. 00, 07
?_059:  mov     eax, dword [ebp-8H]                     ; 1566 _ 8B. 45, F8
        shl     eax, 4                                  ; 1569 _ C1. E0, 04
        mov     edx, eax                                ; 156C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 156E _ 8B. 45, FC
        add     eax, edx                                ; 1571 _ 01. D0
        add     eax, cursor.2000                        ; 1573 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 1578 _ 8A. 00
        cmp     al, 46                                  ; 157A _ 3C, 2E
        jnz near      ?_060                                   ; 157c _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 157E _ 8B. 45, F8
        shl     eax, 4                                  ; 1581 _ C1. E0, 04
        mov     edx, eax                                ; 1584 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1586 _ 8B. 45, FC
        add     eax, edx                                ; 1589 _ 01. D0
        mov     edx, eax                                ; 158B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 158D _ 8B. 45, 08
        add     edx, eax                                ; 1590 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1592 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1595 _ 88. 02
?_060:  inc     dword [ebp-4H]                          ; 1597 _ FF. 45, FC
?_061:  cmp     dword [ebp-4H], 15                      ; 159A _ 83. 7D, FC, 0F
        jle near      ?_057                                   ; 159e _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 15A4 _ FF. 45, F8
?_062:  cmp     dword [ebp-8H], 15                      ; 15A7 _ 83. 7D, F8, 0F
        jle near      ?_056                                   ; 15ab _ 0f 8e, ffffff4b
        nop                                             ; 15B1 _ 90
        nop                                             ; 15B2 _ 90
        leave                                           ; 15B3 _ C9
        ret                                             ; 15B4 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 15B5 _ 55
        mov     ebp, esp                                ; 15B6 _ 89. E5
        push    ebx                                     ; 15B8 _ 53
        sub     esp, 16                                 ; 15B9 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 15BC _ C7. 45, F4, 00000000
        jmp     ?_066                                   ; 15C3 _ EB, 4D

?_063:  mov     dword [ebp-8H], 0                       ; 15C5 _ C7. 45, F8, 00000000
        jmp     ?_065                                   ; 15CC _ EB, 39

?_064:  mov     eax, dword [ebp-0CH]                    ; 15CE _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 15D1 _ 0F AF. 45, 24
        mov     edx, eax                                ; 15D5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 15D7 _ 8B. 45, F8
        add     eax, edx                                ; 15DA _ 01. D0
        mov     edx, eax                                ; 15DC _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 15DE _ 8B. 45, 20
        add     eax, edx                                ; 15E1 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 15E3 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 15E6 _ 8B. 55, F4
        add     edx, ecx                                ; 15E9 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 15EB _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 15EF _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 15F2 _ 8B. 4D, F8
        add     ecx, ebx                                ; 15F5 _ 01. D9
        add     edx, ecx                                ; 15F7 _ 01. CA
        mov     ecx, edx                                ; 15F9 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 15FB _ 8B. 55, 08
        add     edx, ecx                                ; 15FE _ 01. CA
        mov     al, byte [eax]                          ; 1600 _ 8A. 00
        mov     byte [edx], al                          ; 1602 _ 88. 02
        inc     dword [ebp-8H]                          ; 1604 _ FF. 45, F8
?_065:  mov     eax, dword [ebp-8H]                     ; 1607 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 160A _ 3B. 45, 10
        jl      ?_064                                   ; 160D _ 7C, BF
        inc     dword [ebp-0CH]                         ; 160F _ FF. 45, F4
?_066:  mov     eax, dword [ebp-0CH]                    ; 1612 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1615 _ 3B. 45, 14
        jl      ?_063                                   ; 1618 _ 7C, AB
        nop                                             ; 161A _ 90
        nop                                             ; 161B _ 90
        add     esp, 16                                 ; 161C _ 83. C4, 10
        pop     ebx                                     ; 161F _ 5B
        pop     ebp                                     ; 1620 _ 5D
        ret                                             ; 1621 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1622 _ 55
        mov     ebp, esp                                ; 1623 _ 89. E5
        sub     esp, 24                                 ; 1625 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 1628 _ A1, 00000004(d)
        mov     dword [ebp-0CH], eax                    ; 162D _ 89. 45, F4
        mov     eax, dword [?_231]                      ; 1630 _ A1, 00000008(d)
        cwde                                            ; 1635 _ 98
        mov     dword [ebp-10H], eax                    ; 1636 _ 89. 45, F0
        mov     ax, word [?_232]                        ; 1639 _ 66: A1, 0000000A(d)
        cwde                                            ; 163F _ 98
        mov     dword [ebp-14H], eax                    ; 1640 _ 89. 45, EC
        sub     esp, 8                                  ; 1643 _ 83. EC, 08
        push    32                                      ; 1646 _ 6A, 20
        push    32                                      ; 1648 _ 6A, 20
        call    io_out8                                 ; 164A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 164F _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 1652 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 1656 _ 83. EC, 0C
        push    96                                      ; 1659 _ 6A, 60
        call    io_in8                                  ; 165B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1660 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 1663 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 1666 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 166A _ 83. EC, 08
        push    eax                                     ; 166D _ 50
        push    keyinfo                                 ; 166E _ 68, 0000000C(d)
        call    fifo8_put                               ; 1673 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1678 _ 83. C4, 10
        nop                                             ; 167B _ 90
        leave                                           ; 167C _ C9
        ret                                             ; 167D _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 167E _ 55
        mov     ebp, esp                                ; 167F _ 89. E5
        sub     esp, 4                                  ; 1681 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1684 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1687 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 168A _ 80. 7D, FC, 09
        jle near      ?_067                                   ; 168e _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 1690 _ 8A. 45, FC
        add     eax, 55                                 ; 1693 _ 83. C0, 37
        jmp     ?_068                                   ; 1696 _ EB, 06

?_067:  mov     al, byte [ebp-4H]                       ; 1698 _ 8A. 45, FC
        add     eax, 48                                 ; 169B _ 83. C0, 30
?_068:  leave                                           ; 169E _ C9
        ret                                             ; 169F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 16A0 _ 55
        mov     ebp, esp                                ; 16A1 _ 89. E5
        sub     esp, 20                                 ; 16A3 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 16A6 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 16A9 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 16AC _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 16B3 _ 8A. 45, EC
        and     eax, 0FH                                ; 16B6 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 16B9 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 16BC _ 0F BE. 45, FB
        push    eax                                     ; 16C0 _ 50
        call    charToHexVal                            ; 16C1 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 16C6 _ 83. C4, 04
        mov     byte [?_230], al                        ; 16C9 _ A2, 00000103(d)
        mov     al, byte [ebp-14H]                      ; 16CE _ 8A. 45, EC
        shr     al, 4                                   ; 16D1 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 16D4 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 16D7 _ 8A. 45, EC
        movsx   eax, al                                 ; 16DA _ 0F BE. C0
        push    eax                                     ; 16DD _ 50
        call    charToHexVal                            ; 16DE _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 16E3 _ 83. C4, 04
        mov     byte [?_229], al                        ; 16E6 _ A2, 00000102(d)
        mov     eax, keyval                             ; 16EB _ B8, 00000100(d)
        leave                                           ; 16F0 _ C9
        ret                                             ; 16F1 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 16F2 _ 55
        mov     ebp, esp                                ; 16F3 _ 89. E5
        sub     esp, 16                                 ; 16F5 _ 83. EC, 10
        mov     byte [str.2048], 48                     ; 16F8 _ C6. 05, 00000374(d), 30
        mov     byte [?_235], 88                        ; 16FF _ C6. 05, 00000375(d), 58
        mov     byte [?_236], 0                         ; 1706 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 170D _ C7. 45, FC, 00000002
        jmp     ?_070                                   ; 1714 _ EB, 0E

?_069:  mov     eax, dword [ebp-4H]                     ; 1716 _ 8B. 45, FC
        add     eax, str.2048                           ; 1719 _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 171E _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1721 _ FF. 45, FC
?_070:  cmp     dword [ebp-4H], 9                       ; 1724 _ 83. 7D, FC, 09
        jle near      ?_069                                   ; 1728 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 172A _ C7. 45, F8, 00000009
        jmp     ?_074                                   ; 1731 _ EB, 41

?_071:  mov     eax, dword [ebp+8H]                     ; 1733 _ 8B. 45, 08
        and     eax, 0FH                                ; 1736 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 1739 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 173C _ 8B. 45, 08
        shr     eax, 4                                  ; 173F _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1742 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 1745 _ 83. 7D, F4, 09
        jle near      ?_072                                   ; 1749 _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 174B _ 8B. 45, F4
        add     eax, 55                                 ; 174E _ 83. C0, 37
        mov     dl, al                                  ; 1751 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1753 _ 8B. 45, F8
        add     eax, str.2048                           ; 1756 _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 175B _ 88. 10
        jmp     ?_073                                   ; 175D _ EB, 12

?_072:  mov     eax, dword [ebp-0CH]                    ; 175F _ 8B. 45, F4
        add     eax, 48                                 ; 1762 _ 83. C0, 30
        mov     dl, al                                  ; 1765 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1767 _ 8B. 45, F8
        add     eax, str.2048                           ; 176A _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 176F _ 88. 10
?_073:  dec     dword [ebp-8H]                          ; 1771 _ FF. 4D, F8
?_074:  cmp     dword [ebp-8H], 1                       ; 1774 _ 83. 7D, F8, 01
        jle near      ?_075                                   ; 1778 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 177A _ 83. 7D, 08, 00
        jnz near      ?_071                                   ; 177e _ 75, b3
?_075:  mov     eax, str.2048                           ; 1780 _ B8, 00000374(d)
        leave                                           ; 1785 _ C9
        ret                                             ; 1786 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1787 _ 55
        mov     ebp, esp                                ; 1788 _ 89. E5
        sub     esp, 8                                  ; 178A _ 83. EC, 08
?_076:  sub     esp, 12                                 ; 178D _ 83. EC, 0C
        push    100                                     ; 1790 _ 6A, 64
        call    io_in8                                  ; 1792 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1797 _ 83. C4, 10
        and     eax, 02H                                ; 179A _ 83. E0, 02
        test    eax, eax                                ; 179D _ 85. C0
        jz near       ?_077                                   ; 179f _ 74, 02
        jmp     ?_076                                   ; 17A1 _ EB, EA

?_077:  nop                                             ; 17A3 _ 90
        nop                                             ; 17A4 _ 90
        leave                                           ; 17A5 _ C9
        ret                                             ; 17A6 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 17A7 _ 55
        mov     ebp, esp                                ; 17A8 _ 89. E5
        sub     esp, 8                                  ; 17AA _ 83. EC, 08
        call    wait_KBC_sendready                      ; 17AD _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 17B2 _ 83. EC, 08
        push    96                                      ; 17B5 _ 6A, 60
        push    100                                     ; 17B7 _ 6A, 64
        call    io_out8                                 ; 17B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17BE _ 83. C4, 10
        call    wait_KBC_sendready                      ; 17C1 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 17C6 _ 83. EC, 08
        push    71                                      ; 17C9 _ 6A, 47
        push    96                                      ; 17CB _ 6A, 60
        call    io_out8                                 ; 17CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D2 _ 83. C4, 10
        nop                                             ; 17D5 _ 90
        leave                                           ; 17D6 _ C9
        ret                                             ; 17D7 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 17D8 _ 55
        mov     ebp, esp                                ; 17D9 _ 89. E5
        sub     esp, 8                                  ; 17DB _ 83. EC, 08
        call    wait_KBC_sendready                      ; 17DE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 17E3 _ 83. EC, 08
        push    212                                     ; 17E6 _ 68, 000000D4
        push    100                                     ; 17EB _ 6A, 64
        call    io_out8                                 ; 17ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17F2 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 17F5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 17FA _ 83. EC, 08
        push    244                                     ; 17FD _ 68, 000000F4
        push    96                                      ; 1802 _ 6A, 60
        call    io_out8                                 ; 1804 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1809 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 180C _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 180F _ C6. 40, 03, 00
        nop                                             ; 1813 _ 90
        leave                                           ; 1814 _ C9
        ret                                             ; 1815 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1816 _ 55
        mov     ebp, esp                                ; 1817 _ 89. E5
        sub     esp, 24                                 ; 1819 _ 83. EC, 18
        sub     esp, 8                                  ; 181C _ 83. EC, 08
        push    32                                      ; 181F _ 6A, 20
        push    160                                     ; 1821 _ 68, 000000A0
        call    io_out8                                 ; 1826 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 182B _ 83. C4, 10
        sub     esp, 8                                  ; 182E _ 83. EC, 08
        push    32                                      ; 1831 _ 6A, 20
        push    32                                      ; 1833 _ 6A, 20
        call    io_out8                                 ; 1835 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 183A _ 83. C4, 10
        sub     esp, 12                                 ; 183D _ 83. EC, 0C
        push    96                                      ; 1840 _ 6A, 60
        call    io_in8                                  ; 1842 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1847 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 184A _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 184D _ 0F B6. 45, F7
        sub     esp, 8                                  ; 1851 _ 83. EC, 08
        push    eax                                     ; 1854 _ 50
        push    mouseinfo                               ; 1855 _ 68, 00000028(d)
        call    fifo8_put                               ; 185A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 185F _ 83. C4, 10
        nop                                             ; 1862 _ 90
        leave                                           ; 1863 _ C9
        ret                                             ; 1864 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1865 _ 55
        mov     ebp, esp                                ; 1866 _ 89. E5
        sub     esp, 4                                  ; 1868 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 186B _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 186E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1871 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1874 _ 8A. 40, 03
        test    al, al                                  ; 1877 _ 84. C0
        jnz near      ?_079                                   ; 1879 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 187B _ 80. 7D, FC, FA
        jnz near      ?_078                                   ; 187f _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1881 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1884 _ C6. 40, 03, 01
?_078:  mov     eax, 0                                  ; 1888 _ B8, 00000000
        jmp     ?_086                                   ; 188D _ E9, 00000104

?_079:  mov     eax, dword [ebp+8H]                     ; 1892 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1895 _ 8A. 40, 03
        cmp     al, 1                                   ; 1898 _ 3C, 01
        jnz near      ?_081                                   ; 189a _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 189C _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 18A0 _ 25, 000000C8
        cmp     eax, 8                                  ; 18A5 _ 83. F8, 08
        jnz near      ?_080                                   ; 18a8 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 18AA _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 18AD _ 8A. 55, FC
        mov     byte [eax], dl                          ; 18B0 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 18B2 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 18B5 _ C6. 40, 03, 02
?_080:  mov     eax, 0                                  ; 18B9 _ B8, 00000000
        jmp     ?_086                                   ; 18BE _ E9, 000000D3

?_081:  mov     eax, dword [ebp+8H]                     ; 18C3 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 18C6 _ 8A. 40, 03
        cmp     al, 2                                   ; 18C9 _ 3C, 02
        jnz near      ?_082                                   ; 18cb _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 18CD _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 18D0 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 18D3 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18D6 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 18D9 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 18DD _ B8, 00000000
        jmp     ?_086                                   ; 18E2 _ E9, 000000AF

?_082:  mov     eax, dword [ebp+8H]                     ; 18E7 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 18EA _ 8A. 40, 03
        cmp     al, 3                                   ; 18ED _ 3C, 03
        jne near      ?_085                                   ; 18ef _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 18F5 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 18F8 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 18FB _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 18FE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1901 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1905 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1908 _ 8A. 00
        movzx   eax, al                                 ; 190A _ 0F B6. C0
        and     eax, 07H                                ; 190D _ 83. E0, 07
        mov     edx, eax                                ; 1910 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1912 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1915 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1918 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 191B _ 8A. 40, 01
        movzx   edx, al                                 ; 191E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1921 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1924 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1927 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 192A _ 8A. 40, 02
        movzx   edx, al                                 ; 192D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1930 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1933 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1936 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1939 _ 8A. 00
        movzx   eax, al                                 ; 193B _ 0F B6. C0
        and     eax, 10H                                ; 193E _ 83. E0, 10
        test    eax, eax                                ; 1941 _ 85. C0
        jz near       ?_083                                   ; 1943 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1945 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1948 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 194B _ 0D, FFFFFF00
        mov     edx, eax                                ; 1950 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1952 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1955 _ 89. 50, 04
?_083:  mov     eax, dword [ebp+8H]                     ; 1958 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 195B _ 8A. 00
        movzx   eax, al                                 ; 195D _ 0F B6. C0
        and     eax, 20H                                ; 1960 _ 83. E0, 20
        test    eax, eax                                ; 1963 _ 85. C0
        jz near       ?_084                                   ; 1965 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1967 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 196A _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 196D _ 0D, FFFFFF00
        mov     edx, eax                                ; 1972 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1974 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1977 _ 89. 50, 08
?_084:  mov     eax, dword [ebp+8H]                     ; 197A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 197D _ 8B. 40, 08
        neg     eax                                     ; 1980 _ F7. D8
        mov     edx, eax                                ; 1982 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1987 _ 89. 50, 08
        mov     eax, 1                                  ; 198A _ B8, 00000001
        jmp     ?_086                                   ; 198F _ EB, 05

?_085:  mov     eax, 4294967295                         ; 1991 _ B8, FFFFFFFF
?_086:  leave                                           ; 1996 _ C9
        ret                                             ; 1997 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1998 _ 55
        mov     ebp, esp                                ; 1999 _ 89. E5
        sub     esp, 40                                 ; 199B _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 199E _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 19A5 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 19AC _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 19B3 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 19BA _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 19C0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19C3 _ 8B. 00
        sub     esp, 4                                  ; 19C5 _ 83. EC, 04
        push    edx                                     ; 19C8 _ 52
        push    dword [ebp+1CH]                         ; 19C9 _ FF. 75, 1C
        push    eax                                     ; 19CC _ 50
        call    init_screen8                            ; 19CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19D2 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 19D5 _ 8B. 45, 20
        movsx   eax, al                                 ; 19D8 _ 0F BE. C0
        sub     esp, 8                                  ; 19DB _ 83. EC, 08
        push    ?_225                                   ; 19DE _ 68, 0000002F(d)
        push    eax                                     ; 19E3 _ 50
        push    dword [ebp-10H]                         ; 19E4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 19E7 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 19EA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 19ED _ FF. 75, 08
        call    showString                              ; 19F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19F5 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 19F8 _ 8B. 45, 18
        sub     esp, 12                                 ; 19FB _ 83. EC, 0C
        push    eax                                     ; 19FE _ 50
        call    intToHexStr                             ; 19FF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A04 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1A07 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1A0A _ 8B. 45, 20
        movsx   eax, al                                 ; 1A0D _ 0F BE. C0
        sub     esp, 8                                  ; 1A10 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1A13 _ FF. 75, E4
        push    eax                                     ; 1A16 _ 50
        push    dword [ebp-10H]                         ; 1A17 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1A1A _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1A1D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A20 _ FF. 75, 08
        call    showString                              ; 1A23 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A28 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1A2B _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1A2F _ 8B. 45, 20
        movsx   eax, al                                 ; 1A32 _ 0F BE. C0
        sub     esp, 8                                  ; 1A35 _ 83. EC, 08
        push    ?_226                                   ; 1A38 _ 68, 00000039(d)
        push    eax                                     ; 1A3D _ 50
        push    dword [ebp-10H]                         ; 1A3E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1A41 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1A44 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A47 _ FF. 75, 08
        call    showString                              ; 1A4A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A4F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1A52 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1A55 _ 8B. 00
        sub     esp, 12                                 ; 1A57 _ 83. EC, 0C
        push    eax                                     ; 1A5A _ 50
        call    intToHexStr                             ; 1A5B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A60 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1A63 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1A66 _ 8B. 45, 20
        movsx   eax, al                                 ; 1A69 _ 0F BE. C0
        sub     esp, 8                                  ; 1A6C _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1A6F _ FF. 75, E0
        push    eax                                     ; 1A72 _ 50
        push    dword [ebp-10H]                         ; 1A73 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1A76 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1A79 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A7C _ FF. 75, 08
        call    showString                              ; 1A7F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A84 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1A87 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1A8B _ 8B. 45, 20
        movsx   eax, al                                 ; 1A8E _ 0F BE. C0
        sub     esp, 8                                  ; 1A91 _ 83. EC, 08
        push    ?_227                                   ; 1A94 _ 68, 00000045(d)
        push    eax                                     ; 1A99 _ 50
        push    dword [ebp-10H]                         ; 1A9A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1A9D _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1AA0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AA3 _ FF. 75, 08
        call    showString                              ; 1AA6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AAB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1AAE _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1AB1 _ 8B. 40, 04
        sub     esp, 12                                 ; 1AB4 _ 83. EC, 0C
        push    eax                                     ; 1AB7 _ 50
        call    intToHexStr                             ; 1AB8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ABD _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1AC0 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1AC3 _ 8B. 45, 20
        movsx   eax, al                                 ; 1AC6 _ 0F BE. C0
        sub     esp, 8                                  ; 1AC9 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 1ACC _ FF. 75, DC
        push    eax                                     ; 1ACF _ 50
        push    dword [ebp-10H]                         ; 1AD0 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1AD3 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1AD6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AD9 _ FF. 75, 08
        call    showString                              ; 1ADC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AE1 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1AE4 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1AE8 _ 8B. 45, 20
        movsx   eax, al                                 ; 1AEB _ 0F BE. C0
        sub     esp, 8                                  ; 1AEE _ 83. EC, 08
        push    ?_228                                   ; 1AF1 _ 68, 00000051(d)
        push    eax                                     ; 1AF6 _ 50
        push    dword [ebp-10H]                         ; 1AF7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1AFA _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1AFD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B00 _ FF. 75, 08
        call    showString                              ; 1B03 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B08 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B0B _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1B0E _ 8B. 40, 08
        sub     esp, 12                                 ; 1B11 _ 83. EC, 0C
        push    eax                                     ; 1B14 _ 50
        call    intToHexStr                             ; 1B15 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B1A _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1B1D _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1B20 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B23 _ 0F BE. C0
        sub     esp, 8                                  ; 1B26 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1B29 _ FF. 75, D8
        push    eax                                     ; 1B2C _ 50
        push    dword [ebp-10H]                         ; 1B2D _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1B30 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1B33 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B36 _ FF. 75, 08
        call    showString                              ; 1B39 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B3E _ 83. C4, 20
        nop                                             ; 1B41 _ 90
        leave                                           ; 1B42 _ C9
        ret                                             ; 1B43 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1B44 _ 55
        mov     ebp, esp                                ; 1B45 _ 89. E5
        sub     esp, 24                                 ; 1B47 _ 83. EC, 18
        sub     esp, 12                                 ; 1B4A _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1B4D _ FF. 75, 08
        call    sheet_alloc                             ; 1B50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B55 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1B58 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1B5B _ A1, 00000000(d)
        sub     esp, 8                                  ; 1B60 _ 83. EC, 08
        push    10880                                   ; 1B63 _ 68, 00002A80
        push    eax                                     ; 1B68 _ 50
        call    memman_alloc_4k                         ; 1B69 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B6E _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1B71 _ 89. 45, F0
        sub     esp, 12                                 ; 1B74 _ 83. EC, 0C
        push    -1                                      ; 1B77 _ 6A, FF
        push    68                                      ; 1B79 _ 6A, 44
        push    160                                     ; 1B7B _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1B80 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1B83 _ FF. 75, F4
        call    sheet_setbuf                            ; 1B86 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B8B _ 83. C4, 20
        push    1                                       ; 1B8E _ 6A, 01
        push    dword [ebp+0CH]                         ; 1B90 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1B93 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1B96 _ FF. 75, 08
        call    make_window8                            ; 1B99 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B9E _ 83. C4, 10
        sub     esp, 8                                  ; 1BA1 _ 83. EC, 08
        push    7                                       ; 1BA4 _ 6A, 07
        push    16                                      ; 1BA6 _ 6A, 10
        push    144                                     ; 1BA8 _ 68, 00000090
        push    28                                      ; 1BAD _ 6A, 1C
        push    8                                       ; 1BAF _ 6A, 08
        push    dword [ebp-0CH]                         ; 1BB1 _ FF. 75, F4
        call    make_textbox8                           ; 1BB4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BB9 _ 83. C4, 20
        push    172                                     ; 1BBC _ 68, 000000AC
        push    260                                     ; 1BC1 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1BC6 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1BC9 _ FF. 75, 08
        call    sheet_slide                             ; 1BCC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BD1 _ 83. C4, 10
        sub     esp, 4                                  ; 1BD4 _ 83. EC, 04
        push    2                                       ; 1BD7 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1BD9 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1BDC _ FF. 75, 08
        call    sheet_updown                            ; 1BDF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BE4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1BE7 _ 8B. 45, F4
        leave                                           ; 1BEA _ C9
        ret                                             ; 1BEB _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1BEC _ 55
        mov     ebp, esp                                ; 1BED _ 89. E5
        push    ebx                                     ; 1BEF _ 53
        sub     esp, 36                                 ; 1BF0 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1BF3 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1BF6 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1BF9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1BFC _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1BFF _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1C02 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C05 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1C08 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1C0B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C0E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C11 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C14 _ 8B. 00
        push    0                                       ; 1C16 _ 6A, 00
        push    edx                                     ; 1C18 _ 52
        push    0                                       ; 1C19 _ 6A, 00
        push    0                                       ; 1C1B _ 6A, 00
        push    8                                       ; 1C1D _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C1F _ FF. 75, F4
        push    eax                                     ; 1C22 _ 50
        call    boxfill8                                ; 1C23 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C28 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1C2B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C2E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C34 _ 8B. 00
        push    1                                       ; 1C36 _ 6A, 01
        push    edx                                     ; 1C38 _ 52
        push    1                                       ; 1C39 _ 6A, 01
        push    1                                       ; 1C3B _ 6A, 01
        push    7                                       ; 1C3D _ 6A, 07
        push    dword [ebp-0CH]                         ; 1C3F _ FF. 75, F4
        push    eax                                     ; 1C42 _ 50
        call    boxfill8                                ; 1C43 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C48 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C4B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C4E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C51 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C54 _ 8B. 00
        push    edx                                     ; 1C56 _ 52
        push    0                                       ; 1C57 _ 6A, 00
        push    0                                       ; 1C59 _ 6A, 00
        push    0                                       ; 1C5B _ 6A, 00
        push    8                                       ; 1C5D _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C5F _ FF. 75, F4
        push    eax                                     ; 1C62 _ 50
        call    boxfill8                                ; 1C63 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C68 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C6B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C6E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C71 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C74 _ 8B. 00
        push    edx                                     ; 1C76 _ 52
        push    1                                       ; 1C77 _ 6A, 01
        push    1                                       ; 1C79 _ 6A, 01
        push    1                                       ; 1C7B _ 6A, 01
        push    7                                       ; 1C7D _ 6A, 07
        push    dword [ebp-0CH]                         ; 1C7F _ FF. 75, F4
        push    eax                                     ; 1C82 _ 50
        call    boxfill8                                ; 1C83 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C88 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1C8B _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1C8E _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1C91 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1C94 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1C97 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C9A _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C9D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CA0 _ 8B. 00
        push    ebx                                     ; 1CA2 _ 53
        push    ecx                                     ; 1CA3 _ 51
        push    1                                       ; 1CA4 _ 6A, 01
        push    edx                                     ; 1CA6 _ 52
        push    15                                      ; 1CA7 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1CA9 _ FF. 75, F4
        push    eax                                     ; 1CAC _ 50
        call    boxfill8                                ; 1CAD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CB2 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1CB5 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1CB8 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1CBB _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1CBE _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1CC1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CC4 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CC7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CCA _ 8B. 00
        push    ebx                                     ; 1CCC _ 53
        push    ecx                                     ; 1CCD _ 51
        push    0                                       ; 1CCE _ 6A, 00
        push    edx                                     ; 1CD0 _ 52
        push    0                                       ; 1CD1 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1CD3 _ FF. 75, F4
        push    eax                                     ; 1CD6 _ 50
        call    boxfill8                                ; 1CD7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CDC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1CDF _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1CE2 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1CE5 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1CE8 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CEB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CEE _ 8B. 00
        push    ecx                                     ; 1CF0 _ 51
        push    edx                                     ; 1CF1 _ 52
        push    2                                       ; 1CF2 _ 6A, 02
        push    2                                       ; 1CF4 _ 6A, 02
        push    8                                       ; 1CF6 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1CF8 _ FF. 75, F4
        push    eax                                     ; 1CFB _ 50
        call    boxfill8                                ; 1CFC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D01 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1D04 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1D07 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1D0A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D0D _ 8B. 00
        push    20                                      ; 1D0F _ 6A, 14
        push    edx                                     ; 1D11 _ 52
        push    3                                       ; 1D12 _ 6A, 03
        push    3                                       ; 1D14 _ 6A, 03
        push    12                                      ; 1D16 _ 6A, 0C
        push    dword [ebp-0CH]                         ; 1D18 _ FF. 75, F4
        push    eax                                     ; 1D1B _ 50
        call    boxfill8                                ; 1D1C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D21 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D24 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1D27 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D2A _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D2D _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1D30 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D33 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D39 _ 8B. 00
        push    ebx                                     ; 1D3B _ 53
        push    ecx                                     ; 1D3C _ 51
        push    edx                                     ; 1D3D _ 52
        push    1                                       ; 1D3E _ 6A, 01
        push    15                                      ; 1D40 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1D42 _ FF. 75, F4
        push    eax                                     ; 1D45 _ 50
        call    boxfill8                                ; 1D46 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D4B _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D4E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D51 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D54 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D57 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1D5A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D5D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D60 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D63 _ 8B. 00
        push    ebx                                     ; 1D65 _ 53
        push    ecx                                     ; 1D66 _ 51
        push    edx                                     ; 1D67 _ 52
        push    0                                       ; 1D68 _ 6A, 00
        push    0                                       ; 1D6A _ 6A, 00
        push    dword [ebp-0CH]                         ; 1D6C _ FF. 75, F4
        push    eax                                     ; 1D6F _ 50
        call    boxfill8                                ; 1D70 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D75 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 1D78 _ 0F BE. 45, E4
        push    eax                                     ; 1D7C _ 50
        push    dword [ebp+10H]                         ; 1D7D _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1D80 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1D83 _ FF. 75, 08
        call    make_wtitle8                            ; 1D86 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1D8B _ 83. C4, 10
        nop                                             ; 1D8E _ 90
        mov     ebx, dword [ebp-4H]                     ; 1D8F _ 8B. 5D, FC
        leave                                           ; 1D92 _ C9
        ret                                             ; 1D93 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 1D94 _ 55
        mov     ebp, esp                                ; 1D95 _ 89. E5
        push    ebx                                     ; 1D97 _ 53
        sub     esp, 36                                 ; 1D98 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1D9B _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1D9E _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DA1 _ 80. 7D, E4, 00
        jz near       ?_087                                   ; 1da5 _ 74, 0a
        mov     byte [ebp-12H], 7                       ; 1DA7 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1DAB _ C6. 45, ED, 0C
        jmp     ?_088                                   ; 1DAF _ EB, 08

?_087:  mov     byte [ebp-12H], 8                       ; 1DB1 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1DB5 _ C6. 45, ED, 0F
?_088:  mov     eax, dword [ebp+0CH]                    ; 1DB9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DBC _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1DBF _ 8D. 58, FC
        mov     al, byte [ebp-13H]                      ; 1DC2 _ 8A. 45, ED
        movzx   ecx, al                                 ; 1DC5 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1DC8 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1DCB _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1DCE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DD1 _ 8B. 00
        push    20                                      ; 1DD3 _ 6A, 14
        push    ebx                                     ; 1DD5 _ 53
        push    3                                       ; 1DD6 _ 6A, 03
        push    3                                       ; 1DD8 _ 6A, 03
        push    ecx                                     ; 1DDA _ 51
        push    edx                                     ; 1DDB _ 52
        push    eax                                     ; 1DDC _ 50
        call    boxfill8                                ; 1DDD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DE2 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 1DE5 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 1DE9 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1DEC _ FF. 75, 10
        push    eax                                     ; 1DEF _ 50
        push    4                                       ; 1DF0 _ 6A, 04
        push    24                                      ; 1DF2 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1DF4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1DF7 _ FF. 75, 08
        call    showString                              ; 1DFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DFF _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1E02 _ C7. 45, F0, 00000000
        jmp     ?_096                                   ; 1E09 _ EB, 7F

?_089:  mov     dword [ebp-0CH], 0                      ; 1E0B _ C7. 45, F4, 00000000
        jmp     ?_095                                   ; 1E12 _ EB, 6D

?_090:  mov     eax, dword [ebp-10H]                    ; 1E14 _ 8B. 45, F0
        shl     eax, 4                                  ; 1E17 _ C1. E0, 04
        mov     edx, eax                                ; 1E1A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E1C _ 8B. 45, F4
        add     eax, edx                                ; 1E1F _ 01. D0
        add     eax, closebtn.2119                      ; 1E21 _ 05, 00000260(d)
        mov     al, byte [eax]                          ; 1E26 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1E28 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1E2B _ 80. 7D, EF, 40
        jnz near      ?_091                                   ; 1e2f _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1E31 _ C6. 45, EF, 00
        jmp     ?_094                                   ; 1E35 _ EB, 1C

?_091:  cmp     byte [ebp-11H], 36                      ; 1E37 _ 80. 7D, EF, 24
        jnz near      ?_092                                   ; 1e3b _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1E3D _ C6. 45, EF, 0F
        jmp     ?_094                                   ; 1E41 _ EB, 10

?_092:  cmp     byte [ebp-11H], 81                      ; 1E43 _ 80. 7D, EF, 51
        jnz near      ?_093                                   ; 1e47 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1E49 _ C6. 45, EF, 08
        jmp     ?_094                                   ; 1E4D _ EB, 04

?_093:  mov     byte [ebp-11H], 7                       ; 1E4F _ C6. 45, EF, 07
?_094:  mov     eax, dword [ebp+0CH]                    ; 1E53 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1E56 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1E58 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1E5B _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1E5E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E61 _ 8B. 40, 04
        imul    ecx, eax                                ; 1E64 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1E67 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E6A _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1E6D _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1E70 _ 8B. 45, F4
        add     eax, ebx                                ; 1E73 _ 01. D8
        add     eax, ecx                                ; 1E75 _ 01. C8
        add     edx, eax                                ; 1E77 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1E79 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1E7C _ 88. 02
        inc     dword [ebp-0CH]                         ; 1E7E _ FF. 45, F4
?_095:  cmp     dword [ebp-0CH], 15                     ; 1E81 _ 83. 7D, F4, 0F
        jle near      ?_090                                   ; 1e85 _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1E87 _ FF. 45, F0
?_096:  cmp     dword [ebp-10H], 13                     ; 1E8A _ 83. 7D, F0, 0D
        jle near      ?_089                                   ; 1e8e _ 0f 8e, ffffff77
        nop                                             ; 1E94 _ 90
        nop                                             ; 1E95 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1E96 _ 8B. 5D, FC
        leave                                           ; 1E99 _ C9
        ret                                             ; 1E9A _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1E9B _ 55
        mov     ebp, esp                                ; 1E9C _ 89. E5
        push    edi                                     ; 1E9E _ 57
        push    esi                                     ; 1E9F _ 56
        push    ebx                                     ; 1EA0 _ 53
        sub     esp, 16                                 ; 1EA1 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1EA4 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1EA7 _ 8B. 45, 14
        add     eax, edx                                ; 1EAA _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1EAC _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1EAF _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1EB2 _ 8B. 45, 18
        add     eax, edx                                ; 1EB5 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1EB7 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1EBA _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1EBD _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1EC0 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1EC3 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1EC6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1EC9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1ECC _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1ECF _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1ED2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ED5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ED8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EDB _ 8B. 00
        push    edi                                     ; 1EDD _ 57
        push    esi                                     ; 1EDE _ 56
        push    ebx                                     ; 1EDF _ 53
        push    ecx                                     ; 1EE0 _ 51
        push    15                                      ; 1EE1 _ 6A, 0F
        push    edx                                     ; 1EE3 _ 52
        push    eax                                     ; 1EE4 _ 50
        call    boxfill8                                ; 1EE5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1EEA _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1EED _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1EF0 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1EF3 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1EF6 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1EF9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1EFC _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1EFF _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1F02 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1F05 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F08 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F0B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F0E _ 8B. 00
        push    edi                                     ; 1F10 _ 57
        push    esi                                     ; 1F11 _ 56
        push    ebx                                     ; 1F12 _ 53
        push    ecx                                     ; 1F13 _ 51
        push    15                                      ; 1F14 _ 6A, 0F
        push    edx                                     ; 1F16 _ 52
        push    eax                                     ; 1F17 _ 50
        call    boxfill8                                ; 1F18 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F1D _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1F20 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1F23 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1F26 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1F29 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1F2C _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1F2F _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1F32 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1F35 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1F38 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F3B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F3E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F41 _ 8B. 00
        push    edi                                     ; 1F43 _ 57
        push    esi                                     ; 1F44 _ 56
        push    ebx                                     ; 1F45 _ 53
        push    ecx                                     ; 1F46 _ 51
        push    7                                       ; 1F47 _ 6A, 07
        push    edx                                     ; 1F49 _ 52
        push    eax                                     ; 1F4A _ 50
        call    boxfill8                                ; 1F4B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F50 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1F53 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1F56 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1F59 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1F5C _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1F5F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F62 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1F65 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1F68 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1F6B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F6E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F71 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F74 _ 8B. 00
        push    edi                                     ; 1F76 _ 57
        push    esi                                     ; 1F77 _ 56
        push    ebx                                     ; 1F78 _ 53
        push    ecx                                     ; 1F79 _ 51
        push    7                                       ; 1F7A _ 6A, 07
        push    edx                                     ; 1F7C _ 52
        push    eax                                     ; 1F7D _ 50
        call    boxfill8                                ; 1F7E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F83 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1F86 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1F89 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1F8C _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1F8F _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1F92 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1F95 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1F98 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F9B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F9E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FA1 _ 8B. 00
        push    esi                                     ; 1FA3 _ 56
        push    dword [ebp-10H]                         ; 1FA4 _ FF. 75, F0
        push    ebx                                     ; 1FA7 _ 53
        push    ecx                                     ; 1FA8 _ 51
        push    0                                       ; 1FA9 _ 6A, 00
        push    edx                                     ; 1FAB _ 52
        push    eax                                     ; 1FAC _ 50
        call    boxfill8                                ; 1FAD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FB2 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1FB5 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1FB8 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1FBB _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1FBE _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1FC1 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1FC4 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1FC7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FCA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FCD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FD0 _ 8B. 00
        push    dword [ebp-14H]                         ; 1FD2 _ FF. 75, EC
        push    esi                                     ; 1FD5 _ 56
        push    ebx                                     ; 1FD6 _ 53
        push    ecx                                     ; 1FD7 _ 51
        push    0                                       ; 1FD8 _ 6A, 00
        push    edx                                     ; 1FDA _ 52
        push    eax                                     ; 1FDB _ 50
        call    boxfill8                                ; 1FDC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FE1 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1FE4 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1FE7 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1FEA _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1FED _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1FF0 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1FF3 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1FF6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FF9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FFC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FFF _ 8B. 00
        push    esi                                     ; 2001 _ 56
        push    dword [ebp-10H]                         ; 2002 _ FF. 75, F0
        push    ebx                                     ; 2005 _ 53
        push    ecx                                     ; 2006 _ 51
        push    8                                       ; 2007 _ 6A, 08
        push    edx                                     ; 2009 _ 52
        push    eax                                     ; 200A _ 50
        call    boxfill8                                ; 200B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2010 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 2013 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 2016 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 2019 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 201C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 201F _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2022 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 2025 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2028 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 202B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 202E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2031 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2034 _ 8B. 00
        push    edi                                     ; 2036 _ 57
        push    esi                                     ; 2037 _ 56
        push    ebx                                     ; 2038 _ 53
        push    ecx                                     ; 2039 _ 51
        push    8                                       ; 203A _ 6A, 08
        push    edx                                     ; 203C _ 52
        push    eax                                     ; 203D _ 50
        call    boxfill8                                ; 203E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2043 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 2046 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 2049 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 204C _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 204F _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 2052 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 2055 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 2058 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 205B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 205E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2061 _ 8B. 00
        push    dword [ebp-14H]                         ; 2063 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 2066 _ FF. 75, F0
        push    esi                                     ; 2069 _ 56
        push    ebx                                     ; 206A _ 53
        push    ecx                                     ; 206B _ 51
        push    edx                                     ; 206C _ 52
        push    eax                                     ; 206D _ 50
        call    boxfill8                                ; 206E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2073 _ 83. C4, 1C
        nop                                             ; 2076 _ 90
        lea     esp, [ebp-0CH]                          ; 2077 _ 8D. 65, F4
        pop     ebx                                     ; 207A _ 5B
        pop     esi                                     ; 207B _ 5E
        pop     edi                                     ; 207C _ 5F
        pop     ebp                                     ; 207D _ 5D
        ret                                             ; 207E _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 207F _ 55
        mov     ebp, esp                                ; 2080 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2082 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2085 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 208B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 208E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2095 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2098 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 209F _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 20A2 _ C7. 40, 0C, 00000000
        nop                                             ; 20A9 _ 90
        pop     ebp                                     ; 20AA _ 5D
        ret                                             ; 20AB _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 20AC _ 55
        mov     ebp, esp                                ; 20AD _ 89. E5
        sub     esp, 16                                 ; 20AF _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 20B2 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 20B9 _ C7. 45, FC, 00000000
        jmp     ?_098                                   ; 20C0 _ EB, 13

?_097:  mov     eax, dword [ebp+8H]                     ; 20C2 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20C5 _ 8B. 55, FC
        add     edx, 2                                  ; 20C8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 20CB _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 20CF _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 20D2 _ FF. 45, FC
?_098:  mov     eax, dword [ebp+8H]                     ; 20D5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20D8 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 20DA _ 39. 45, FC
        jc near       ?_097                                   ; 20dd _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 20DF _ 8B. 45, F8
        leave                                           ; 20E2 _ C9
        ret                                             ; 20E3 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 20E4 _ 55
        mov     ebp, esp                                ; 20E5 _ 89. E5
        sub     esp, 16                                 ; 20E7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 20EA _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 20F1 _ E9, 00000084

?_099:  mov     eax, dword [ebp+8H]                     ; 20F6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20F9 _ 8B. 55, FC
        add     edx, 2                                  ; 20FC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 20FF _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 2103 _ 39. 45, 0C
        ja      ?_101                                   ; 2106 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 2108 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 210B _ 8B. 55, FC
        add     edx, 2                                  ; 210E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2111 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 2114 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2117 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 211A _ 8B. 55, FC
        add     edx, 2                                  ; 211D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2120 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2123 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2126 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2129 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 212C _ 8B. 55, FC
        add     edx, 2                                  ; 212F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2132 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2135 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2138 _ 8B. 55, FC
        add     edx, 2                                  ; 213B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 213E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2142 _ 2B. 45, 0C
        mov     edx, eax                                ; 2145 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2147 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 214A _ 8B. 4D, FC
        add     ecx, 2                                  ; 214D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2150 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2154 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2157 _ 8B. 55, FC
        add     edx, 2                                  ; 215A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 215D _ 8B. 44 D0, 04
        test    eax, eax                                ; 2161 _ 85. C0
        jnz near      ?_100                                   ; 2163 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 2165 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2168 _ 8B. 00
        lea     edx, [eax-1H]                           ; 216A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 216D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2170 _ 89. 10
?_100:  mov     eax, dword [ebp-8H]                     ; 2172 _ 8B. 45, F8
        jmp     ?_103                                   ; 2175 _ EB, 16

?_101:  inc     dword [ebp-4H]                          ; 2177 _ FF. 45, FC
?_102:  mov     eax, dword [ebp+8H]                     ; 217A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 217D _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 217F _ 39. 45, FC
        jc near       ?_099                                   ; 2182 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 2188 _ B8, 00000000
?_103:  leave                                           ; 218D _ C9
        ret                                             ; 218E _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 218F _ 55
        mov     ebp, esp                                ; 2190 _ 89. E5
        push    ebx                                     ; 2192 _ 53
        sub     esp, 16                                 ; 2193 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2196 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 219D _ EB, 14

?_104:  mov     eax, dword [ebp+8H]                     ; 219F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 21A2 _ 8B. 55, F8
        add     edx, 2                                  ; 21A5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 21A8 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 21AB _ 39. 45, 0C
        jc near       ?_106                                   ; 21ae _ 72, 0f
        inc     dword [ebp-8H]                          ; 21B0 _ FF. 45, F8
?_105:  mov     eax, dword [ebp+8H]                     ; 21B3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21B6 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 21B8 _ 39. 45, F8
        jl      ?_104                                   ; 21BB _ 7C, E2
        jmp     ?_107                                   ; 21BD _ EB, 01

?_106:  nop                                             ; 21BF _ 90
?_107:  cmp     dword [ebp-8H], 0                       ; 21C0 _ 83. 7D, F8, 00
        jle near      ?_109                                   ; 21c4 _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 21CA _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 21CD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21D0 _ 8B. 45, 08
        add     edx, 2                                  ; 21D3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 21D6 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 21D9 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 21DC _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 21DF _ 8B. 45, 08
        add     ecx, 2                                  ; 21E2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 21E5 _ 8B. 44 C8, 04
        add     eax, edx                                ; 21E9 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 21EB _ 39. 45, 0C
        jne near      ?_109                                   ; 21ee _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 21F4 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 21F7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21FA _ 8B. 45, 08
        add     edx, 2                                  ; 21FD _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2200 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 2204 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 2207 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 220A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 220D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2210 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2213 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2216 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 221A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 221D _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 221F _ 39. 45, F8
        jge near      ?_108                                   ; 2222 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 2224 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2227 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 222A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 222D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2230 _ 8B. 55, F8
        add     edx, 2                                  ; 2233 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2236 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2239 _ 39. C1
        jnz near      ?_108                                   ; 223b _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 223D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2240 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2243 _ 8B. 45, 08
        add     edx, 2                                  ; 2246 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2249 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 224D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2250 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2253 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2256 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 225A _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 225D _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 2260 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2263 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2266 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2269 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 226D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2270 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2272 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2275 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2278 _ 89. 10
?_108:  mov     eax, 0                                  ; 227A _ B8, 00000000
        jmp     ?_115                                   ; 227F _ E9, 0000011B

?_109:  mov     eax, dword [ebp+8H]                     ; 2284 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2287 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 2289 _ 39. 45, F8
        jge near      ?_110                                   ; 228c _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 228E _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2291 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2294 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2297 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 229A _ 8B. 55, F8
        add     edx, 2                                  ; 229D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 22A0 _ 8B. 04 D0
        cmp     ecx, eax                                ; 22A3 _ 39. C1
        jnz near      ?_110                                   ; 22a5 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 22A7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22AA _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 22AD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 22B0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 22B3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 22B6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22B9 _ 8B. 55, F8
        add     edx, 2                                  ; 22BC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 22BF _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 22C3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 22C6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 22C9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22CC _ 8B. 55, F8
        add     edx, 2                                  ; 22CF _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 22D2 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 22D6 _ B8, 00000000
        jmp     ?_115                                   ; 22DB _ E9, 000000BF

?_110:  mov     eax, dword [ebp+8H]                     ; 22E0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22E3 _ 8B. 00
        cmp     eax, 4095                               ; 22E5 _ 3D, 00000FFF
        jg  near      ?_114                                   ; 22ea _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 22F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22F3 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 22F5 _ 89. 45, F4
        jmp     ?_112                                   ; 22F8 _ EB, 27

?_111:  mov     eax, dword [ebp-0CH]                    ; 22FA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 22FD _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2300 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 2303 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 2306 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2309 _ 8B. 45, 08
        add     edx, 2                                  ; 230C _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 230F _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2312 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2314 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2317 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 231A _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 231E _ FF. 4D, F4
?_112:  mov     eax, dword [ebp-0CH]                    ; 2321 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 2324 _ 3B. 45, F8
        jg  near      ?_111                                   ; 2327 _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 2329 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 232C _ 8B. 00
        lea     edx, [eax+1H]                           ; 232E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2331 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2334 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2336 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2339 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 233C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 233F _ 8B. 00
        cmp     edx, eax                                ; 2341 _ 39. C2
        jge near      ?_113                                   ; 2343 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 2345 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2348 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 234A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 234D _ 89. 50, 04
?_113:  mov     eax, dword [ebp+8H]                     ; 2350 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2353 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2356 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2359 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 235C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 235F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2362 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2365 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2368 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 236B _ 89. 54 C8, 04
        mov     eax, 0                                  ; 236F _ B8, 00000000
        jmp     ?_115                                   ; 2374 _ EB, 29

?_114:  mov     eax, dword [ebp+8H]                     ; 2376 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2379 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 237C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 237F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2382 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2385 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2388 _ 8B. 40, 08
        mov     edx, eax                                ; 238B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 238D _ 8B. 45, 10
        add     eax, edx                                ; 2390 _ 01. D0
        mov     edx, eax                                ; 2392 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2394 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2397 _ 89. 50, 08
        mov     eax, 4294967295                         ; 239A _ B8, FFFFFFFF
?_115:  add     esp, 16                                 ; 239F _ 83. C4, 10
        pop     ebx                                     ; 23A2 _ 5B
        pop     ebp                                     ; 23A3 _ 5D
        ret                                             ; 23A4 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 23A5 _ 55
        mov     ebp, esp                                ; 23A6 _ 89. E5
        sub     esp, 16                                 ; 23A8 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 23AB _ 8B. 45, 0C
        add     eax, 4095                               ; 23AE _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 23B3 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 23B8 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 23BB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 23BE _ FF. 75, 08
        call    memman_alloc                            ; 23C1 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 23C6 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 23C9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 23CC _ 8B. 45, FC
        leave                                           ; 23CF _ C9
        ret                                             ; 23D0 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 23D1 _ 55
        mov     ebp, esp                                ; 23D2 _ 89. E5
        sub     esp, 16                                 ; 23D4 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 23D7 _ 8B. 45, 10
        add     eax, 4095                               ; 23DA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 23DF _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 23E4 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 23E7 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 23EA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 23ED _ FF. 75, 08
        call    memman_free                             ; 23F0 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 23F5 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 23F8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 23FB _ 8B. 45, FC
        leave                                           ; 23FE _ C9
        ret                                             ; 23FF _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 2400 _ 55
        mov     ebp, esp                                ; 2401 _ 89. E5
        sub     esp, 24                                 ; 2403 _ 83. EC, 18
        sub     esp, 8                                  ; 2406 _ 83. EC, 08
        push    9232                                    ; 2409 _ 68, 00002410
        push    dword [ebp+8H]                          ; 240E _ FF. 75, 08
        call    memman_alloc_4k                         ; 2411 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2416 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 2419 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 241C _ 83. 7D, F0, 00
        jnz near      ?_116                                   ; 2420 _ 75, 0a
        mov     eax, 0                                  ; 2422 _ B8, 00000000
        jmp     ?_120                                   ; 2427 _ E9, 00000099

?_116:  mov     eax, dword [ebp+10H]                    ; 242C _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 242F _ 0F AF. 45, 14
        sub     esp, 8                                  ; 2433 _ 83. EC, 08
        push    eax                                     ; 2436 _ 50
        push    dword [ebp+8H]                          ; 2437 _ FF. 75, 08
        call    memman_alloc_4k                         ; 243A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 243F _ 83. C4, 10
        mov     edx, eax                                ; 2442 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2444 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2447 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 244A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 244D _ 8B. 40, 04
        test    eax, eax                                ; 2450 _ 85. C0
        jnz near      ?_117                                   ; 2452 _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 2454 _ 8B. 45, F0
        sub     esp, 4                                  ; 2457 _ 83. EC, 04
        push    9232                                    ; 245A _ 68, 00002410
        push    eax                                     ; 245F _ 50
        push    dword [ebp+8H]                          ; 2460 _ FF. 75, 08
        call    memman_free_4k                          ; 2463 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2468 _ 83. C4, 10
        mov     eax, 0                                  ; 246B _ B8, 00000000
        jmp     ?_120                                   ; 2470 _ EB, 53

?_117:  mov     eax, dword [ebp-10H]                    ; 2472 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 2475 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2478 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 247A _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 247D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2480 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2483 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 2486 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2489 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 248C _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 248F _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 2496 _ C7. 45, F4, 00000000
        jmp     ?_119                                   ; 249D _ EB, 1A

?_118:  mov     eax, dword [ebp-10H]                    ; 249F _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 24A2 _ 8B. 55, F4
        add     edx, 33                                 ; 24A5 _ 83. C2, 21
        shl     edx, 5                                  ; 24A8 _ C1. E2, 05
        add     eax, edx                                ; 24AB _ 01. D0
        add     eax, 16                                 ; 24AD _ 83. C0, 10
        mov     dword [eax], 0                          ; 24B0 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 24B6 _ FF. 45, F4
?_119:  cmp     dword [ebp-0CH], 255                    ; 24B9 _ 81. 7D, F4, 000000FF
        jle near      ?_118                                   ; 24c0 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 24C2 _ 8B. 45, F0
?_120:  leave                                           ; 24C5 _ C9
        ret                                             ; 24C6 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 24C7 _ 55
        mov     ebp, esp                                ; 24C8 _ 89. E5
        sub     esp, 16                                 ; 24CA _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 24CD _ C7. 45, FC, 00000000
        jmp     ?_123                                   ; 24D4 _ EB, 5A

?_121:  mov     eax, dword [ebp+8H]                     ; 24D6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 24D9 _ 8B. 55, FC
        add     edx, 33                                 ; 24DC _ 83. C2, 21
        shl     edx, 5                                  ; 24DF _ C1. E2, 05
        add     eax, edx                                ; 24E2 _ 01. D0
        add     eax, 16                                 ; 24E4 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 24E7 _ 8B. 00
        test    eax, eax                                ; 24E9 _ 85. C0
        jnz near      ?_122                                   ; 24eb _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 24ED _ 8B. 45, FC
        shl     eax, 5                                  ; 24F0 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 24F3 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 24F9 _ 8B. 45, 08
        add     eax, edx                                ; 24FC _ 01. D0
        add     eax, 4                                  ; 24FE _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 2501 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2504 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2507 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 250A _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 250D _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 2510 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 2514 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 2517 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 251E _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 2521 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2528 _ 8B. 45, F8
        jmp     ?_124                                   ; 252B _ EB, 11

?_122:  inc     dword [ebp-4H]                          ; 252D _ FF. 45, FC
?_123:  cmp     dword [ebp-4H], 255                     ; 2530 _ 81. 7D, FC, 000000FF
        jle near      ?_121                                   ; 2537 _ 7e, 9d
        mov     eax, 0                                  ; 2539 _ B8, 00000000
?_124:  leave                                           ; 253E _ C9
        ret                                             ; 253F _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2540 _ 55
        mov     ebp, esp                                ; 2541 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2543 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2546 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2549 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 254B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 254E _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2551 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2554 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2557 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 255A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 255D _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2560 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2563 _ 89. 50, 14
        nop                                             ; 2566 _ 90
        pop     ebp                                     ; 2567 _ 5D
        ret                                             ; 2568 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2569 _ 55
        mov     ebp, esp                                ; 256A _ 89. E5
        push    esi                                     ; 256C _ 56
        push    ebx                                     ; 256D _ 53
        sub     esp, 16                                 ; 256E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2571 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2574 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2577 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 257A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 257D _ 8B. 40, 10
        inc     eax                                     ; 2580 _ 40
        cmp     dword [ebp+10H], eax                    ; 2581 _ 39. 45, 10
        jle near      ?_125                                   ; 2584 _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 2586 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2589 _ 8B. 40, 10
        inc     eax                                     ; 258C _ 40
        mov     dword [ebp+10H], eax                    ; 258D _ 89. 45, 10
?_125:  cmp     dword [ebp+10H], -1                     ; 2590 _ 83. 7D, 10, FF
        jge near      ?_126                                   ; 2594 _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 2596 _ C7. 45, 10, FFFFFFFF
?_126:  mov     eax, dword [ebp+0CH]                    ; 259D _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 25A0 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 25A3 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 25A6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 25A9 _ 3B. 45, 10
        jle near      ?_133                                   ; 25ac _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 25B2 _ 83. 7D, 10, 00
        js near       ?_129                                   ; 25b6 _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 25BC _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 25BF _ 89. 45, F4
        jmp     ?_128                                   ; 25C2 _ EB, 33

?_127:  mov     eax, dword [ebp-0CH]                    ; 25C4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 25C7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 25CA _ 8B. 45, 08
        add     edx, 4                                  ; 25CD _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 25D0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 25D4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 25D7 _ 8B. 4D, F4
        add     ecx, 4                                  ; 25DA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 25DD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 25E1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 25E4 _ 8B. 55, F4
        add     edx, 4                                  ; 25E7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 25EA _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 25EE _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 25F1 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 25F4 _ FF. 4D, F4
?_128:  mov     eax, dword [ebp-0CH]                    ; 25F7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 25FA _ 3B. 45, 10
        jg  near      ?_127                                   ; 25fd _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 25FF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2602 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2605 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2608 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 260B _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 260F _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2612 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2615 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2618 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 261B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 261E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2621 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2624 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2627 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 262A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 262D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2630 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2633 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2636 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2639 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 263C _ 8B. 40, 0C
        sub     esp, 8                                  ; 263F _ 83. EC, 08
        push    esi                                     ; 2642 _ 56
        push    ebx                                     ; 2643 _ 53
        push    ecx                                     ; 2644 _ 51
        push    edx                                     ; 2645 _ 52
        push    eax                                     ; 2646 _ 50
        push    dword [ebp+8H]                          ; 2647 _ FF. 75, 08
        call    sheet_refreshmap                        ; 264A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 264F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2652 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2655 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2658 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 265B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 265E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2661 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2664 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2667 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 266A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 266D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2670 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2673 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2676 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2679 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 267C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 267F _ 8B. 40, 0C
        sub     esp, 4                                  ; 2682 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 2685 _ FF. 75, F0
        push    esi                                     ; 2688 _ 56
        push    ebx                                     ; 2689 _ 53
        push    ecx                                     ; 268A _ 51
        push    edx                                     ; 268B _ 52
        push    eax                                     ; 268C _ 50
        push    dword [ebp+8H]                          ; 268D _ FF. 75, 08
        call    sheet_refreshsub                        ; 2690 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2695 _ 83. C4, 20
        jmp     ?_140                                   ; 2698 _ E9, 00000239

?_129:  mov     eax, dword [ebp+8H]                     ; 269D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 26A0 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 26A3 _ 39. 45, F0
        jge near      ?_132                                   ; 26a6 _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 26A8 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 26AB _ 89. 45, F4
        jmp     ?_131                                   ; 26AE _ EB, 33

?_130:  mov     eax, dword [ebp-0CH]                    ; 26B0 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 26B3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 26B6 _ 8B. 45, 08
        add     edx, 4                                  ; 26B9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 26BC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 26C0 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 26C3 _ 8B. 4D, F4
        add     ecx, 4                                  ; 26C6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 26C9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 26CD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26D0 _ 8B. 55, F4
        add     edx, 4                                  ; 26D3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26D6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 26DA _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 26DD _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 26E0 _ FF. 45, F4
?_131:  mov     eax, dword [ebp+8H]                     ; 26E3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 26E6 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 26E9 _ 39. 45, F4
        jl      ?_130                                   ; 26EC _ 7C, C2
?_132:  mov     eax, dword [ebp+8H]                     ; 26EE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 26F1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 26F4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26F7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 26FA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26FD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2700 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2703 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2706 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2709 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 270C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 270F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2712 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2715 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2718 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 271B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 271E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2721 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2724 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2727 _ 83. EC, 08
        push    0                                       ; 272A _ 6A, 00
        push    ebx                                     ; 272C _ 53
        push    ecx                                     ; 272D _ 51
        push    edx                                     ; 272E _ 52
        push    eax                                     ; 272F _ 50
        push    dword [ebp+8H]                          ; 2730 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2733 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2738 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 273B _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 273E _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 2741 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2744 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2747 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 274A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 274D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2750 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2753 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2756 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2759 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 275C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 275F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2762 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2765 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2768 _ 8B. 40, 0C
        sub     esp, 4                                  ; 276B _ 83. EC, 04
        push    esi                                     ; 276E _ 56
        push    0                                       ; 276F _ 6A, 00
        push    ebx                                     ; 2771 _ 53
        push    ecx                                     ; 2772 _ 51
        push    edx                                     ; 2773 _ 52
        push    eax                                     ; 2774 _ 50
        push    dword [ebp+8H]                          ; 2775 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2778 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 277D _ 83. C4, 20
        jmp     ?_140                                   ; 2780 _ E9, 00000151

?_133:  mov     eax, dword [ebp-10H]                    ; 2785 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2788 _ 3B. 45, 10
        jge near      ?_140                                   ; 278b _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 2791 _ 83. 7D, F0, 00
        js near       ?_136                                   ; 2795 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2797 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 279A _ 89. 45, F4
        jmp     ?_135                                   ; 279D _ EB, 33

?_134:  mov     eax, dword [ebp-0CH]                    ; 279F _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 27A2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27A5 _ 8B. 45, 08
        add     edx, 4                                  ; 27A8 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 27AB _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 27AF _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 27B2 _ 8B. 4D, F4
        add     ecx, 4                                  ; 27B5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 27B8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 27BC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27BF _ 8B. 55, F4
        add     edx, 4                                  ; 27C2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27C5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 27C9 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 27CC _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 27CF _ FF. 45, F4
?_135:  mov     eax, dword [ebp-0CH]                    ; 27D2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 27D5 _ 3B. 45, 10
        jl      ?_134                                   ; 27D8 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 27DA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 27DD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 27E0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 27E3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 27E6 _ 89. 54 88, 04
        jmp     ?_139                                   ; 27EA _ EB, 69

?_136:  mov     eax, dword [ebp+8H]                     ; 27EC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27EF _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 27F2 _ 89. 45, F4
        jmp     ?_138                                   ; 27F5 _ EB, 37

?_137:  mov     eax, dword [ebp-0CH]                    ; 27F7 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 27FA _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 27FD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2800 _ 8B. 55, F4
        add     edx, 4                                  ; 2803 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2806 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 280A _ 8B. 45, 08
        add     ecx, 4                                  ; 280D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2810 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 2814 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2817 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 281A _ 8B. 45, 08
        add     edx, 4                                  ; 281D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2820 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2824 _ 8B. 55, F4
        inc     edx                                     ; 2827 _ 42
        mov     dword [eax+18H], edx                    ; 2828 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 282B _ FF. 4D, F4
?_138:  mov     eax, dword [ebp-0CH]                    ; 282E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2831 _ 3B. 45, 10
        jge near      ?_137                                   ; 2834 _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 2836 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2839 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 283C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 283F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2842 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2846 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2849 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 284C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 284F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2852 _ 89. 50, 10
?_139:  mov     eax, dword [ebp+0CH]                    ; 2855 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2858 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 285B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 285E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2861 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2864 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2867 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 286A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 286D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2870 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2873 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2876 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2879 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 287C _ 8B. 40, 0C
        sub     esp, 8                                  ; 287F _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2882 _ FF. 75, 10
        push    ebx                                     ; 2885 _ 53
        push    ecx                                     ; 2886 _ 51
        push    edx                                     ; 2887 _ 52
        push    eax                                     ; 2888 _ 50
        push    dword [ebp+8H]                          ; 2889 _ FF. 75, 08
        call    sheet_refreshmap                        ; 288C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2891 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2894 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2897 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 289A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 289D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28A0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28A3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28A6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28A9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28AC _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 28AF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28B2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28B5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28B8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28BB _ 8B. 40, 0C
        sub     esp, 4                                  ; 28BE _ 83. EC, 04
        push    dword [ebp+10H]                         ; 28C1 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 28C4 _ FF. 75, 10
        push    ebx                                     ; 28C7 _ 53
        push    ecx                                     ; 28C8 _ 51
        push    edx                                     ; 28C9 _ 52
        push    eax                                     ; 28CA _ 50
        push    dword [ebp+8H]                          ; 28CB _ FF. 75, 08
        call    sheet_refreshsub                        ; 28CE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 28D3 _ 83. C4, 20
?_140:  nop                                             ; 28D6 _ 90
        lea     esp, [ebp-8H]                           ; 28D7 _ 8D. 65, F8
        pop     ebx                                     ; 28DA _ 5B
        pop     esi                                     ; 28DB _ 5E
        pop     ebp                                     ; 28DC _ 5D
        ret                                             ; 28DD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 28DE _ 55
        mov     ebp, esp                                ; 28DF _ 89. E5
        push    edi                                     ; 28E1 _ 57
        push    esi                                     ; 28E2 _ 56
        push    ebx                                     ; 28E3 _ 53
        sub     esp, 28                                 ; 28E4 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 28E7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 28EA _ 8B. 40, 18
        test    eax, eax                                ; 28ED _ 85. C0
        js near       ?_141                                   ; 28ef _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 28F1 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 28F4 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 28F7 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 28FA _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 28FD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2900 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 2903 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 2906 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 2909 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 290C _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 290F _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2912 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2915 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2918 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 291B _ 8B. 45, 14
        add     edx, eax                                ; 291E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2920 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2923 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2926 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2929 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 292C _ 03. 45, E4
        sub     esp, 4                                  ; 292F _ 83. EC, 04
        push    ebx                                     ; 2932 _ 53
        push    ecx                                     ; 2933 _ 51
        push    edi                                     ; 2934 _ 57
        push    esi                                     ; 2935 _ 56
        push    edx                                     ; 2936 _ 52
        push    eax                                     ; 2937 _ 50
        push    dword [ebp+8H]                          ; 2938 _ FF. 75, 08
        call    sheet_refreshsub                        ; 293B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2940 _ 83. C4, 20
?_141:  mov     eax, 0                                  ; 2943 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2948 _ 8D. 65, F4
        pop     ebx                                     ; 294B _ 5B
        pop     esi                                     ; 294C _ 5E
        pop     edi                                     ; 294D _ 5F
        pop     ebp                                     ; 294E _ 5D
        ret                                             ; 294F _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2950 _ 55
        mov     ebp, esp                                ; 2951 _ 89. E5
        push    esi                                     ; 2953 _ 56
        push    ebx                                     ; 2954 _ 53
        sub     esp, 16                                 ; 2955 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2958 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 295B _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 295E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2961 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2964 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2967 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 296A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 296D _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2970 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2973 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2976 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2979 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 297C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 297F _ 8B. 40, 18
        test    eax, eax                                ; 2982 _ 85. C0
        js near       ?_142                                   ; 2984 _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 298A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 298D _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2990 _ 8B. 45, F0
        add     edx, eax                                ; 2993 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2995 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2998 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 299B _ 8B. 45, F4
        add     eax, ecx                                ; 299E _ 01. C8
        sub     esp, 8                                  ; 29A0 _ 83. EC, 08
        push    0                                       ; 29A3 _ 6A, 00
        push    edx                                     ; 29A5 _ 52
        push    eax                                     ; 29A6 _ 50
        push    dword [ebp-10H]                         ; 29A7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 29AA _ FF. 75, F4
        push    dword [ebp+8H]                          ; 29AD _ FF. 75, 08
        call    sheet_refreshmap                        ; 29B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29B5 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 29B8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29BB _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 29BE _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 29C1 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 29C4 _ 8B. 55, 14
        add     ecx, edx                                ; 29C7 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 29C9 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 29CC _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 29CF _ 8B. 55, 10
        add     edx, ebx                                ; 29D2 _ 01. DA
        sub     esp, 8                                  ; 29D4 _ 83. EC, 08
        push    eax                                     ; 29D7 _ 50
        push    ecx                                     ; 29D8 _ 51
        push    edx                                     ; 29D9 _ 52
        push    dword [ebp+14H]                         ; 29DA _ FF. 75, 14
        push    dword [ebp+10H]                         ; 29DD _ FF. 75, 10
        push    dword [ebp+8H]                          ; 29E0 _ FF. 75, 08
        call    sheet_refreshmap                        ; 29E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29E8 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 29EB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29EE _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 29F1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 29F4 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 29F7 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 29FA _ 8B. 45, F0
        add     edx, eax                                ; 29FD _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 29FF _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2A02 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2A05 _ 8B. 45, F4
        add     eax, ebx                                ; 2A08 _ 01. D8
        sub     esp, 4                                  ; 2A0A _ 83. EC, 04
        push    ecx                                     ; 2A0D _ 51
        push    0                                       ; 2A0E _ 6A, 00
        push    edx                                     ; 2A10 _ 52
        push    eax                                     ; 2A11 _ 50
        push    dword [ebp-10H]                         ; 2A12 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2A15 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2A18 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2A1B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A20 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2A23 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2A26 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2A29 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A2C _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2A2F _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2A32 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2A35 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2A38 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2A3A _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2A3D _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2A40 _ 8B. 4D, 10
        add     ecx, esi                                ; 2A43 _ 01. F1
        sub     esp, 4                                  ; 2A45 _ 83. EC, 04
        push    edx                                     ; 2A48 _ 52
        push    eax                                     ; 2A49 _ 50
        push    ebx                                     ; 2A4A _ 53
        push    ecx                                     ; 2A4B _ 51
        push    dword [ebp+14H]                         ; 2A4C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2A4F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2A52 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2A55 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A5A _ 83. C4, 20
?_142:  nop                                             ; 2A5D _ 90
        lea     esp, [ebp-8H]                           ; 2A5E _ 8D. 65, F8
        pop     ebx                                     ; 2A61 _ 5B
        pop     esi                                     ; 2A62 _ 5E
        pop     ebp                                     ; 2A63 _ 5D
        ret                                             ; 2A64 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2A65 _ 55
        mov     ebp, esp                                ; 2A66 _ 89. E5
        sub     esp, 48                                 ; 2A68 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2A6B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A6E _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2A70 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2A73 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A76 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2A79 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2A7C _ 83. 7D, 0C, 00
        jns     ?_143                                   ; 2A80 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2A82 _ C7. 45, 0C, 00000000
?_143:  cmp     dword [ebp+10H], 8                      ; 2A89 _ 83. 7D, 10, 08
        jg  near      ?_144                                   ; 2a8d _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 2A8F _ C7. 45, 10, 00000000
?_144:  mov     eax, dword [ebp+8H]                     ; 2A96 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A99 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2A9C _ 39. 45, 14
        jle near      ?_145                                   ; 2a9f _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2AA1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AA4 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2AA7 _ 89. 45, 14
?_145:  mov     eax, dword [ebp+8H]                     ; 2AAA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AAD _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2AB0 _ 39. 45, 18
        jle near      ?_146                                   ; 2ab3 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2AB5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2AB8 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2ABB _ 89. 45, 18
?_146:  mov     eax, dword [ebp+1CH]                    ; 2ABE _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2AC1 _ 89. 45, FC
        jmp     ?_153                                   ; 2AC4 _ E9, 0000010E

?_147:  mov     eax, dword [ebp+8H]                     ; 2AC9 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2ACC _ 8B. 55, FC
        add     edx, 4                                  ; 2ACF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2AD2 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2AD6 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2AD9 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2ADC _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 2ADE _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 2AE1 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2AE4 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 2AEA _ 8B. 45, E8
        sub     eax, edx                                ; 2AED _ 29. D0
        sar     eax, 5                                  ; 2AEF _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 2AF2 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2AF5 _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 2AFC _ E9, 000000C4

?_148:  mov     eax, dword [ebp-18H]                    ; 2B01 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2B04 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2B07 _ 8B. 45, F4
        add     eax, edx                                ; 2B0A _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2B0C _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2B0F _ C7. 45, F8, 00000000
        jmp     ?_151                                   ; 2B16 _ E9, 00000098

?_149:  mov     eax, dword [ebp-18H]                    ; 2B1B _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2B1E _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2B21 _ 8B. 45, F8
        add     eax, edx                                ; 2B24 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2B26 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2B29 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2B2C _ 3B. 45, D8
        jg  near      ?_150                                   ; 2b2f _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 2B31 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2B34 _ 3B. 45, 14
        jge near      ?_150                                   ; 2b37 _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2B39 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2B3C _ 3B. 45, DC
        jg  near      ?_150                                   ; 2b3f _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 2B41 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2B44 _ 3B. 45, 18
        jge near      ?_150                                   ; 2b47 _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2B49 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2B4C _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2B4F _ 0F AF. 45, F4
        mov     edx, eax                                ; 2B53 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2B55 _ 8B. 45, F8
        add     eax, edx                                ; 2B58 _ 01. D0
        mov     edx, eax                                ; 2B5A _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2B5C _ 8B. 45, E4
        add     eax, edx                                ; 2B5F _ 01. D0
        mov     al, byte [eax]                          ; 2B61 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2B63 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2B66 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B69 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2B6C _ 0F AF. 45, DC
        mov     edx, eax                                ; 2B70 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2B72 _ 8B. 45, D8
        add     eax, edx                                ; 2B75 _ 01. D0
        mov     edx, eax                                ; 2B77 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2B79 _ 8B. 45, EC
        add     eax, edx                                ; 2B7C _ 01. D0
        mov     al, byte [eax]                          ; 2B7E _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2B80 _ 38. 45, E3
        jnz near      ?_150                                   ; 2b83 _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 2B85 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2B89 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2B8C _ 8B. 40, 14
        cmp     edx, eax                                ; 2B8F _ 39. C2
        jz near       ?_150                                   ; 2b91 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2B93 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B96 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2B99 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2B9D _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2B9F _ 8B. 45, D8
        add     eax, edx                                ; 2BA2 _ 01. D0
        mov     edx, eax                                ; 2BA4 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2BA6 _ 8B. 45, F0
        add     edx, eax                                ; 2BA9 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2BAB _ 8A. 45, D7
        mov     byte [edx], al                          ; 2BAE _ 88. 02
?_150:  inc     dword [ebp-8H]                          ; 2BB0 _ FF. 45, F8
?_151:  mov     eax, dword [ebp-18H]                    ; 2BB3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2BB6 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2BB9 _ 39. 45, F8
        jl      ?_149                                   ; 2BBC _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 2BC2 _ FF. 45, F4
?_152:  mov     eax, dword [ebp-18H]                    ; 2BC5 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2BC8 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 2BCB _ 39. 45, F4
        jl      ?_148                                   ; 2BCE _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 2BD4 _ FF. 45, FC
?_153:  mov     eax, dword [ebp-4H]                     ; 2BD7 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 2BDA _ 3B. 45, 20
        jle near      ?_147                                   ; 2bdd _ 0f 8e, fffffee6
        nop                                             ; 2BE3 _ 90
        nop                                             ; 2BE4 _ 90
        leave                                           ; 2BE5 _ C9
        ret                                             ; 2BE6 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2BE7 _ 55
        mov     ebp, esp                                ; 2BE8 _ 89. E5
        sub     esp, 64                                 ; 2BEA _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2BED _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BF0 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2BF3 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 2BF6 _ 83. 7D, 0C, 00
        jns     ?_154                                   ; 2BFA _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2BFC _ C7. 45, 0C, 00000000
?_154:  cmp     dword [ebp+10H], 0                      ; 2C03 _ 83. 7D, 10, 00
        jns     ?_155                                   ; 2C07 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2C09 _ C7. 45, 10, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 2C10 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C13 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2C16 _ 39. 45, 14
        jle near      ?_156                                   ; 2c19 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2C1B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C1E _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2C21 _ 89. 45, 14
?_156:  mov     eax, dword [ebp+8H]                     ; 2C24 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C27 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2C2A _ 39. 45, 18
        jle near      ?_157                                   ; 2c2d _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2C2F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C32 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2C35 _ 89. 45, 18
?_157:  mov     eax, dword [ebp+1CH]                    ; 2C38 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2C3B _ 89. 45, FC
        jmp     ?_168                                   ; 2C3E _ E9, 00000137

?_158:  mov     eax, dword [ebp+8H]                     ; 2C43 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2C46 _ 8B. 55, FC
        add     edx, 4                                  ; 2C49 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C4C _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2C50 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2C53 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2C56 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2C5C _ 8B. 45, DC
        sub     eax, edx                                ; 2C5F _ 29. D0
        sar     eax, 5                                  ; 2C61 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2C64 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2C67 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2C6A _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2C6C _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2C6F _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2C72 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2C75 _ 8B. 55, 0C
        sub     edx, eax                                ; 2C78 _ 29. C2
        mov     eax, edx                                ; 2C7A _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2C7C _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2C7F _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2C82 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2C85 _ 8B. 55, 10
        sub     edx, eax                                ; 2C88 _ 29. C2
        mov     eax, edx                                ; 2C8A _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2C8C _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2C8F _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2C92 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2C95 _ 8B. 55, 14
        sub     edx, eax                                ; 2C98 _ 29. C2
        mov     eax, edx                                ; 2C9A _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2C9C _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2C9F _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2CA2 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2CA5 _ 8B. 55, 18
        sub     edx, eax                                ; 2CA8 _ 29. C2
        mov     eax, edx                                ; 2CAA _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2CAC _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2CAF _ 83. 7D, F0, 00
        jns     ?_159                                   ; 2CB3 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2CB5 _ C7. 45, F0, 00000000
?_159:  cmp     dword [ebp-14H], 0                      ; 2CBC _ 83. 7D, EC, 00
        jns     ?_160                                   ; 2CC0 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 2CC2 _ C7. 45, EC, 00000000
?_160:  mov     eax, dword [ebp-24H]                    ; 2CC9 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2CCC _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 2CCF _ 39. 45, E8
        jle near      ?_161                                   ; 2cd2 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2CD4 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2CD7 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2CDA _ 89. 45, E8
?_161:  mov     eax, dword [ebp-24H]                    ; 2CDD _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2CE0 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2CE3 _ 39. 45, E4
        jle near      ?_162                                   ; 2ce6 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2CE8 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2CEB _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2CEE _ 89. 45, E4
?_162:  mov     eax, dword [ebp-14H]                    ; 2CF1 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2CF4 _ 89. 45, F4
        jmp     ?_167                                   ; 2CF7 _ EB, 76

?_163:  mov     eax, dword [ebp-24H]                    ; 2CF9 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2CFC _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2CFF _ 8B. 45, F4
        add     eax, edx                                ; 2D02 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2D04 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2D07 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2D0A _ 89. 45, F8
        jmp     ?_166                                   ; 2D0D _ EB, 55

?_164:  mov     eax, dword [ebp-24H]                    ; 2D0F _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2D12 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2D15 _ 8B. 45, F8
        add     eax, edx                                ; 2D18 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2D1A _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2D1D _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2D20 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2D23 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2D27 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2D29 _ 8B. 45, F8
        add     eax, edx                                ; 2D2C _ 01. D0
        mov     edx, eax                                ; 2D2E _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2D30 _ 8B. 45, D4
        add     eax, edx                                ; 2D33 _ 01. D0
        mov     al, byte [eax]                          ; 2D35 _ 8A. 00
        movzx   edx, al                                 ; 2D37 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2D3A _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2D3D _ 8B. 40, 14
        cmp     edx, eax                                ; 2D40 _ 39. C2
        jz near       ?_165                                   ; 2d42 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2D44 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D47 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2D4A _ 0F AF. 45, D0
        mov     edx, eax                                ; 2D4E _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2D50 _ 8B. 45, CC
        add     eax, edx                                ; 2D53 _ 01. D0
        mov     edx, eax                                ; 2D55 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2D57 _ 8B. 45, E0
        add     edx, eax                                ; 2D5A _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2D5C _ 8A. 45, DB
        mov     byte [edx], al                          ; 2D5F _ 88. 02
?_165:  inc     dword [ebp-8H]                          ; 2D61 _ FF. 45, F8
?_166:  mov     eax, dword [ebp-8H]                     ; 2D64 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2D67 _ 3B. 45, E8
        jl      ?_164                                   ; 2D6A _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2D6C _ FF. 45, F4
?_167:  mov     eax, dword [ebp-0CH]                    ; 2D6F _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2D72 _ 3B. 45, E4
        jl      ?_163                                   ; 2D75 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2D77 _ FF. 45, FC
?_168:  mov     eax, dword [ebp+8H]                     ; 2D7A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D7D _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2D80 _ 39. 45, FC
        jle near      ?_158                                   ; 2d83 _ 0f 8e, fffffeba
        nop                                             ; 2D89 _ 90
        leave                                           ; 2D8A _ C9
        ret                                             ; 2D8B _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2D8C _ 55
        mov     ebp, esp                                ; 2D8D _ 89. E5
        sub     esp, 24                                 ; 2D8F _ 83. EC, 18
        sub     esp, 8                                  ; 2D92 _ 83. EC, 08
        push    52                                      ; 2D95 _ 6A, 34
        push    67                                      ; 2D97 _ 6A, 43
        call    io_out8                                 ; 2D99 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D9E _ 83. C4, 10
        sub     esp, 8                                  ; 2DA1 _ 83. EC, 08
        push    156                                     ; 2DA4 _ 68, 0000009C
        push    64                                      ; 2DA9 _ 6A, 40
        call    io_out8                                 ; 2DAB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DB0 _ 83. C4, 10
        sub     esp, 8                                  ; 2DB3 _ 83. EC, 08
        push    46                                      ; 2DB6 _ 6A, 2E
        push    64                                      ; 2DB8 _ 6A, 40
        call    io_out8                                 ; 2DBA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2DBF _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2DC2 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2DCC _ C7. 45, F4, 00000000
        jmp     ?_170                                   ; 2DD3 _ EB, 25

?_169:  mov     eax, dword [ebp-0CH]                    ; 2DD5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2DD8 _ C1. E0, 04
        add     eax, ?_238                              ; 2DDB _ 05, 00000388(d)
        mov     dword [eax], 0                          ; 2DE0 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2DE6 _ 8B. 45, F4
        shl     eax, 4                                  ; 2DE9 _ C1. E0, 04
        add     eax, ?_239                              ; 2DEC _ 05, 0000038C(d)
        mov     dword [eax], 0                          ; 2DF1 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2DF7 _ FF. 45, F4
?_170:  cmp     dword [ebp-0CH], 499                    ; 2DFA _ 81. 7D, F4, 000001F3
        jle near      ?_169                                   ; 2e01 _ 7e, d2
        nop                                             ; 2E03 _ 90
        nop                                             ; 2E04 _ 90
        leave                                           ; 2E05 _ C9
        ret                                             ; 2E06 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2E07 _ 55
        mov     ebp, esp                                ; 2E08 _ 89. E5
        sub     esp, 16                                 ; 2E0A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2E0D _ C7. 45, FC, 00000000
        jmp     ?_173                                   ; 2E14 _ EB, 35

?_171:  mov     eax, dword [ebp-4H]                     ; 2E16 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E19 _ C1. E0, 04
        add     eax, ?_238                              ; 2E1C _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2E21 _ 8B. 00
        test    eax, eax                                ; 2E23 _ 85. C0
        jnz near      ?_172                                   ; 2e25 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2E27 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E2A _ C1. E0, 04
        add     eax, ?_238                              ; 2E2D _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2E32 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2E38 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E3B _ C1. E0, 04
        add     eax, timerctl                           ; 2E3E _ 05, 00000380(d)
        add     eax, 4                                  ; 2E43 _ 83. C0, 04
        jmp     ?_174                                   ; 2E46 _ EB, 11

?_172:  inc     dword [ebp-4H]                          ; 2E48 _ FF. 45, FC
?_173:  cmp     dword [ebp-4H], 499                     ; 2E4B _ 81. 7D, FC, 000001F3
        jle near      ?_171                                   ; 2e52 _ 7e, c2
        mov     eax, 0                                  ; 2E54 _ B8, 00000000
?_174:  leave                                           ; 2E59 _ C9
        ret                                             ; 2E5A _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2E5B _ 55
        mov     ebp, esp                                ; 2E5C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E5E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2E61 _ C7. 40, 04, 00000000
        nop                                             ; 2E68 _ 90
        pop     ebp                                     ; 2E69 _ 5D
        ret                                             ; 2E6A _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2E6B _ 55
        mov     ebp, esp                                ; 2E6C _ 89. E5
        sub     esp, 4                                  ; 2E6E _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2E71 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2E74 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2E77 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E7A _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2E7D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2E80 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2E83 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2E86 _ 88. 50, 0C
        nop                                             ; 2E89 _ 90
        leave                                           ; 2E8A _ C9
        ret                                             ; 2E8B _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2E8C _ 55
        mov     ebp, esp                                ; 2E8D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E8F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E92 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2E95 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2E97 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2E9A _ C7. 40, 04, 00000002
        nop                                             ; 2EA1 _ 90
        pop     ebp                                     ; 2EA2 _ 5D
        ret                                             ; 2EA3 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2EA4 _ 55
        mov     ebp, esp                                ; 2EA5 _ 89. E5
        sub     esp, 24                                 ; 2EA7 _ 83. EC, 18
        sub     esp, 8                                  ; 2EAA _ 83. EC, 08
        push    32                                      ; 2EAD _ 6A, 20
        push    32                                      ; 2EAF _ 6A, 20
        call    io_out8                                 ; 2EB1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EB6 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2EB9 _ A1, 00000380(d)
        inc     eax                                     ; 2EBE _ 40
        mov     dword [timerctl], eax                   ; 2EBF _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 2EC4 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2EC8 _ C7. 45, F4, 00000000
        jmp     ?_178                                   ; 2ECF _ E9, 000000A8

?_175:  mov     eax, dword [ebp-0CH]                    ; 2ED4 _ 8B. 45, F4
        shl     eax, 4                                  ; 2ED7 _ C1. E0, 04
        add     eax, ?_238                              ; 2EDA _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2EDF _ 8B. 00
        cmp     eax, 2                                  ; 2EE1 _ 83. F8, 02
        jne near      ?_176                                   ; 2ee4 _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2EEA _ 8B. 45, F4
        shl     eax, 4                                  ; 2EED _ C1. E0, 04
        add     eax, ?_237                              ; 2EF0 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2EF5 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2EF7 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2EFA _ 8B. 45, F4
        shl     eax, 4                                  ; 2EFD _ C1. E0, 04
        add     eax, ?_237                              ; 2F00 _ 05, 00000384(d)
        mov     dword [eax], edx                        ; 2F05 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2F07 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F0A _ C1. E0, 04
        add     eax, ?_237                              ; 2F0D _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2F12 _ 8B. 00
        test    eax, eax                                ; 2F14 _ 85. C0
        jnz near      ?_176                                   ; 2f16 _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2F18 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F1B _ C1. E0, 04
        add     eax, ?_238                              ; 2F1E _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2F23 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2F29 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F2C _ C1. E0, 04
        add     eax, ?_240                              ; 2F2F _ 05, 00000390(d)
        mov     al, byte [eax]                          ; 2F34 _ 8A. 00
        movzx   edx, al                                 ; 2F36 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2F39 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F3C _ C1. E0, 04
        add     eax, ?_239                              ; 2F3F _ 05, 0000038C(d)
        mov     eax, dword [eax]                        ; 2F44 _ 8B. 00
        sub     esp, 8                                  ; 2F46 _ 83. EC, 08
        push    edx                                     ; 2F49 _ 52
        push    eax                                     ; 2F4A _ 50
        call    fifo8_put                               ; 2F4B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F50 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2F53 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F56 _ C1. E0, 04
        add     eax, timerctl                           ; 2F59 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 2F5E _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2F61 _ A1, 00000000(d)
        cmp     edx, eax                                ; 2F66 _ 39. C2
        jnz near      ?_176                                   ; 2f68 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2F6A _ C6. 45, F3, 01
?_176:  cmp     byte [ebp-0DH], 0                       ; 2F6E _ 80. 7D, F3, 00
        jz near       ?_177                                   ; 2f72 _ 74, 05
        call    task_switch                             ; 2F74 _ E8, FFFFFFFC(rel)
?_177:  inc     dword [ebp-0CH]                         ; 2F79 _ FF. 45, F4
?_178:  cmp     dword [ebp-0CH], 499                    ; 2F7C _ 81. 7D, F4, 000001F3
        jle near      ?_175                                   ; 2f83 _ 0f 8e, ffffff4b
        nop                                             ; 2F89 _ 90
        leave                                           ; 2F8A _ C9
        ret                                             ; 2F8B _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2F8C _ 55
        mov     ebp, esp                                ; 2F8D _ 89. E5
        mov     eax, timerctl                           ; 2F8F _ B8, 00000380(d)
        pop     ebp                                     ; 2F94 _ 5D
        ret                                             ; 2F95 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2F96 _ 55
        mov     ebp, esp                                ; 2F97 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F99 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2F9C _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2F9F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2FA2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2FA5 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2FA8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2FAA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2FAD _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2FB0 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2FB3 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2FB6 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2FBD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2FC0 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2FC7 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2FCA _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2FD1 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2FD4 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2FD7 _ 89. 50, 18
        nop                                             ; 2FDA _ 90
        pop     ebp                                     ; 2FDB _ 5D
        ret                                             ; 2FDC _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2FDD _ 55
        mov     ebp, esp                                ; 2FDE _ 89. E5
        sub     esp, 24                                 ; 2FE0 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2FE3 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2FE6 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2FE9 _ 83. 7D, 08, 00
        jnz near      ?_179                                   ; 2fed _ 75, 0a
        mov     eax, 4294967295                         ; 2FEF _ B8, FFFFFFFF
        jmp     ?_183                                   ; 2FF4 _ E9, 0000009F

?_179:  mov     eax, dword [ebp+8H]                     ; 2FF9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2FFC _ 8B. 40, 10
        test    eax, eax                                ; 2FFF _ 85. C0
        jnz near      ?_180                                   ; 3001 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 3003 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3006 _ 8B. 40, 14
        or      eax, 01H                                ; 3009 _ 83. C8, 01
        mov     edx, eax                                ; 300C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 300E _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 3011 _ 89. 50, 14
        mov     eax, 4294967295                         ; 3014 _ B8, FFFFFFFF
        jmp     ?_183                                   ; 3019 _ EB, 7D

?_180:  mov     eax, dword [ebp+8H]                     ; 301B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 301E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3020 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3023 _ 8B. 40, 04
        add     edx, eax                                ; 3026 _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 3028 _ 8A. 45, F4
        mov     byte [edx], al                          ; 302B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 302D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3030 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3033 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3036 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3039 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 303C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 303F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3042 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3045 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3048 _ 39. C2
        jnz near      ?_181                                   ; 304a _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 304C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 304F _ C7. 40, 04, 00000000
?_181:  mov     eax, dword [ebp+8H]                     ; 3056 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3059 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 305C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 305F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3062 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3065 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3068 _ 8B. 40, 18
        test    eax, eax                                ; 306B _ 85. C0
        jz near       ?_182                                   ; 306d _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 306F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3072 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 3075 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3078 _ 83. F8, 02
        jz near       ?_182                                   ; 307b _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 307D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3080 _ 8B. 40, 18
        sub     esp, 4                                  ; 3083 _ 83. EC, 04
        push    0                                       ; 3086 _ 6A, 00
        push    -1                                      ; 3088 _ 6A, FF
        push    eax                                     ; 308A _ 50
        call    task_run                                ; 308B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3090 _ 83. C4, 10
?_182:  mov     eax, 0                                  ; 3093 _ B8, 00000000
?_183:  leave                                           ; 3098 _ C9
        ret                                             ; 3099 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 309A _ 55
        mov     ebp, esp                                ; 309B _ 89. E5
        sub     esp, 16                                 ; 309D _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 30A0 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 30A3 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 30A6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30A9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 30AC _ 39. C2
        jnz near      ?_184                                   ; 30ae _ 75, 07
        mov     eax, 4294967295                         ; 30B0 _ B8, FFFFFFFF
        jmp     ?_186                                   ; 30B5 _ EB, 50

?_184:  mov     eax, dword [ebp+8H]                     ; 30B7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 30BA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 30BC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 30BF _ 8B. 40, 08
        add     eax, edx                                ; 30C2 _ 01. D0
        mov     al, byte [eax]                          ; 30C4 _ 8A. 00
        movzx   eax, al                                 ; 30C6 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 30C9 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 30CC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 30CF _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 30D2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 30D5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 30D8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 30DB _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 30DE _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 30E1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30E4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 30E7 _ 39. C2
        jnz near      ?_185                                   ; 30e9 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 30EB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 30EE _ C7. 40, 08, 00000000
?_185:  mov     eax, dword [ebp+8H]                     ; 30F5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 30F8 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 30FB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 30FE _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3101 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3104 _ 8B. 45, FC
?_186:  leave                                           ; 3107 _ C9
        ret                                             ; 3108 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 3109 _ 55
        mov     ebp, esp                                ; 310A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 310C _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 310F _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3112 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3115 _ 8B. 40, 10
        sub     edx, eax                                ; 3118 _ 29. C2
        mov     eax, edx                                ; 311A _ 89. D0
        pop     ebp                                     ; 311C _ 5D
        ret                                             ; 311D _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 311E _ 55
        mov     ebp, esp                                ; 311F _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3121 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_187                                   ; 3128 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 312A _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3131 _ 8B. 45, 0C
        shr     eax, 12                                 ; 3134 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3137 _ 89. 45, 0C
?_187:  mov     eax, dword [ebp+0CH]                    ; 313A _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 313D _ 8B. 55, 08
        mov     word [edx], ax                          ; 3140 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 3143 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 3146 _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 3149 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 314D _ 8B. 45, 10
        sar     eax, 16                                 ; 3150 _ C1. F8, 10
        mov     dl, al                                  ; 3153 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3155 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3158 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 315B _ 8B. 45, 14
        mov     dl, al                                  ; 315E _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3160 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3163 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3166 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3169 _ C1. E8, 10
        and     eax, 0FH                                ; 316C _ 83. E0, 0F
        mov     dl, al                                  ; 316F _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 3171 _ 8B. 45, 14
        sar     eax, 8                                  ; 3174 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3177 _ 83. E0, F0
        or      eax, edx                                ; 317A _ 09. D0
        mov     dl, al                                  ; 317C _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 317E _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3181 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3184 _ 8B. 45, 10
        shr     eax, 24                                 ; 3187 _ C1. E8, 18
        mov     dl, al                                  ; 318A _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 318C _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 318F _ 88. 50, 07
        nop                                             ; 3192 _ 90
        pop     ebp                                     ; 3193 _ 5D
        ret                                             ; 3194 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 3195 _ 55
        mov     ebp, esp                                ; 3196 _ 89. E5
        mov     eax, dword [taskctl]                    ; 3198 _ A1, 000022C8(d)
        pop     ebp                                     ; 319D _ 5D
        ret                                             ; 319E _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 319F _ 55
        mov     ebp, esp                                ; 31A0 _ 89. E5
        sub     esp, 16                                 ; 31A2 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 31A5 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 31AB _ 8B. 55, 08
        mov     eax, edx                                ; 31AE _ 89. D0
        shl     eax, 2                                  ; 31B0 _ C1. E0, 02
        add     eax, edx                                ; 31B3 _ 01. D0
        shl     eax, 2                                  ; 31B5 _ C1. E0, 02
        add     eax, ecx                                ; 31B8 _ 01. C8
        add     eax, 8                                  ; 31BA _ 83. C0, 08
        mov     dword [eax], 0                          ; 31BD _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 31C3 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 31C9 _ 8B. 55, 08
        mov     eax, edx                                ; 31CC _ 89. D0
        shl     eax, 2                                  ; 31CE _ C1. E0, 02
        add     eax, edx                                ; 31D1 _ 01. D0
        shl     eax, 2                                  ; 31D3 _ C1. E0, 02
        add     eax, ecx                                ; 31D6 _ 01. C8
        add     eax, 12                                 ; 31D8 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 31DB _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 31E1 _ C7. 45, FC, 00000000
        jmp     ?_189                                   ; 31E8 _ EB, 20

?_188:  mov     ecx, dword [taskctl]                    ; 31EA _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 31F0 _ 8B. 55, FC
        mov     eax, edx                                ; 31F3 _ 89. D0
        add     eax, eax                                ; 31F5 _ 01. C0
        add     eax, edx                                ; 31F7 _ 01. D0
        shl     eax, 3                                  ; 31F9 _ C1. E0, 03
        add     eax, ecx                                ; 31FC _ 01. C8
        add     eax, 16                                 ; 31FE _ 83. C0, 10
        mov     dword [eax], 0                          ; 3201 _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 3207 _ FF. 45, FC
?_189:  cmp     dword [ebp-4H], 2                       ; 320A _ 83. 7D, FC, 02
        jle near      ?_188                                   ; 320e _ 7e, da
        nop                                             ; 3210 _ 90
        nop                                             ; 3211 _ 90
        leave                                           ; 3212 _ C9
        ret                                             ; 3213 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3214 _ 55
        mov     ebp, esp                                ; 3215 _ 89. E5
        push    ebx                                     ; 3217 _ 53
        sub     esp, 20                                 ; 3218 _ 83. EC, 14
        call    get_addr_gdt                            ; 321B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3220 _ 89. 45, F0
        sub     esp, 8                                  ; 3223 _ 83. EC, 08
        push    668                                     ; 3226 _ 68, 0000029C
        push    dword [ebp+8H]                          ; 322B _ FF. 75, 08
        call    memman_alloc_4k                         ; 322E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3233 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 3236 _ A3, 000022C8(d)
        mov     dword [ebp-0CH], 0                      ; 323B _ C7. 45, F4, 00000000
        jmp     ?_191                                   ; 3242 _ E9, 00000088

?_190:  mov     ecx, dword [taskctl]                    ; 3247 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 324D _ 8B. 55, F4
        mov     eax, edx                                ; 3250 _ 89. D0
        shl     eax, 5                                  ; 3252 _ C1. E0, 05
        sub     eax, edx                                ; 3255 _ 29. D0
        shl     eax, 2                                  ; 3257 _ C1. E0, 02
        add     eax, ecx                                ; 325A _ 01. C8
        add     eax, 72                                 ; 325C _ 83. C0, 48
        mov     dword [eax], 0                          ; 325F _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3265 _ 8B. 45, F4
        add     eax, 7                                  ; 3268 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 326B _ 8B. 1D, 000022C8(d)
        lea     ecx, [eax*8]                            ; 3271 _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3278 _ 8B. 55, F4
        mov     eax, edx                                ; 327B _ 89. D0
        shl     eax, 5                                  ; 327D _ C1. E0, 05
        sub     eax, edx                                ; 3280 _ 29. D0
        shl     eax, 2                                  ; 3282 _ C1. E0, 02
        add     eax, ebx                                ; 3285 _ 01. D8
        add     eax, 68                                 ; 3287 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 328A _ 89. 08
        mov     ecx, dword [taskctl]                    ; 328C _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 3292 _ 8B. 55, F4
        mov     eax, edx                                ; 3295 _ 89. D0
        shl     eax, 5                                  ; 3297 _ C1. E0, 05
        sub     eax, edx                                ; 329A _ 29. D0
        shl     eax, 2                                  ; 329C _ C1. E0, 02
        add     eax, 80                                 ; 329F _ 83. C0, 50
        add     eax, ecx                                ; 32A2 _ 01. C8
        add     eax, 8                                  ; 32A4 _ 83. C0, 08
        mov     edx, eax                                ; 32A7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 32A9 _ 8B. 45, F4
        add     eax, 7                                  ; 32AC _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 32AF _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 32B6 _ 8B. 45, F0
        add     eax, ecx                                ; 32B9 _ 01. C8
        push    137                                     ; 32BB _ 68, 00000089
        push    edx                                     ; 32C0 _ 52
        push    103                                     ; 32C1 _ 6A, 67
        push    eax                                     ; 32C3 _ 50
        call    set_segmdesc                            ; 32C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 32C9 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 32CC _ FF. 45, F4
?_191:  cmp     dword [ebp-0CH], 4                      ; 32CF _ 83. 7D, F4, 04
        jle near      ?_190                                   ; 32d3 _ 0f 8e, ffffff6e
        mov     dword [ebp-0CH], 0                      ; 32D9 _ C7. 45, F4, 00000000
        jmp     ?_193                                   ; 32E0 _ EB, 11

?_192:  sub     esp, 12                                 ; 32E2 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 32E5 _ FF. 75, F4
        call    init_task_level                         ; 32E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 32ED _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 32F0 _ FF. 45, F4
?_193:  cmp     dword [ebp-0CH], 2                      ; 32F3 _ 83. 7D, F4, 02
        jle near      ?_192                                   ; 32f7 _ 7e, e9
        call    task_alloc                              ; 32F9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 32FE _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3301 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 3304 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 330B _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 330E _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 3315 _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 3318 _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 331F _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 3322 _ FF. 75, EC
        call    task_add                                ; 3325 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 332A _ 83. C4, 10
        call    task_switchsub                          ; 332D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3332 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3335 _ 8B. 00
        sub     esp, 12                                 ; 3337 _ 83. EC, 0C
        push    eax                                     ; 333A _ 50
        call    load_tr                                 ; 333B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3340 _ 83. C4, 10
        call    timer_alloc                             ; 3343 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3348 _ A3, 000022C4(d)
        mov     eax, dword [ebp-14H]                    ; 334D _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 3350 _ 8B. 40, 08
        mov     edx, eax                                ; 3353 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3355 _ A1, 000022C4(d)
        sub     esp, 8                                  ; 335A _ 83. EC, 08
        push    edx                                     ; 335D _ 52
        push    eax                                     ; 335E _ 50
        call    timer_settime                           ; 335F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3364 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 3367 _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 336A _ 8B. 5D, FC
        leave                                           ; 336D _ C9
        ret                                             ; 336E _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 336F _ 55
        mov     ebp, esp                                ; 3370 _ 89. E5
        sub     esp, 16                                 ; 3372 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3375 _ C7. 45, FC, 00000000
        jmp     ?_196                                   ; 337C _ E9, 000000ED

?_194:  mov     ecx, dword [taskctl]                    ; 3381 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 3387 _ 8B. 55, FC
        mov     eax, edx                                ; 338A _ 89. D0
        shl     eax, 5                                  ; 338C _ C1. E0, 05
        sub     eax, edx                                ; 338F _ 29. D0
        shl     eax, 2                                  ; 3391 _ C1. E0, 02
        add     eax, ecx                                ; 3394 _ 01. C8
        add     eax, 72                                 ; 3396 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 3399 _ 8B. 00
        test    eax, eax                                ; 339B _ 85. C0
        jne near      ?_195                                   ; 339d _ 0f 85, 000000c8
        mov     ecx, dword [taskctl]                    ; 33A3 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 33A9 _ 8B. 55, FC
        mov     eax, edx                                ; 33AC _ 89. D0
        shl     eax, 5                                  ; 33AE _ C1. E0, 05
        sub     eax, edx                                ; 33B1 _ 29. D0
        shl     eax, 2                                  ; 33B3 _ C1. E0, 02
        add     eax, 64                                 ; 33B6 _ 83. C0, 40
        add     eax, ecx                                ; 33B9 _ 01. C8
        add     eax, 4                                  ; 33BB _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 33BE _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 33C1 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 33C4 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 33CB _ 8B. 45, F8
        mov     dword [eax+38H], 514                    ; 33CE _ C7. 40, 38, 00000202
        mov     eax, dword [ebp-8H]                     ; 33D5 _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 33D8 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 33DF _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 33E2 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 33E9 _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 33EC _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 33F3 _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 33F6 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 33FD _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 3400 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3407 _ 8B. 45, FC
        inc     eax                                     ; 340A _ 40
        shl     eax, 9                                  ; 340B _ C1. E0, 09
        mov     edx, eax                                ; 340E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 3410 _ 8B. 45, F8
        mov     dword [eax+4CH], edx                    ; 3413 _ 89. 50, 4C
        mov     eax, dword [ebp-8H]                     ; 3416 _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 3419 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 3420 _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 3423 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 342A _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 342D _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3434 _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 3437 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 343E _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 3441 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3448 _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 344B _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 3452 _ 8B. 45, F8
        mov     dword [eax+74H], 0                      ; 3455 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-8H]                     ; 345C _ 8B. 45, F8
        mov     dword [eax+78H], 1073741824             ; 345F _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-8H]                     ; 3466 _ 8B. 45, F8
        jmp     ?_197                                   ; 3469 _ EB, 12

?_195:  inc     dword [ebp-4H]                          ; 346B _ FF. 45, FC
?_196:  cmp     dword [ebp-4H], 4                       ; 346E _ 83. 7D, FC, 04
        jle near      ?_194                                   ; 3472 _ 0f 8e, ffffff09
        mov     eax, 0                                  ; 3478 _ B8, 00000000
?_197:  leave                                           ; 347D _ C9
        ret                                             ; 347E _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 347F _ 55
        mov     ebp, esp                                ; 3480 _ 89. E5
        sub     esp, 8                                  ; 3482 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 3485 _ 83. 7D, 0C, 00
        jns     ?_198                                   ; 3489 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 348B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 348E _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3491 _ 89. 45, 0C
?_198:  cmp     dword [ebp+10H], 0                      ; 3494 _ 83. 7D, 10, 00
        jle near      ?_199                                   ; 3498 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 349A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 349D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 34A0 _ 89. 50, 08
?_199:  mov     eax, dword [ebp+8H]                     ; 34A3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34A6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 34A9 _ 83. F8, 02
        jnz near      ?_200                                   ; 34ac _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 34AE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 34B1 _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 34B4 _ 39. 45, 0C
        jz near       ?_200                                   ; 34b7 _ 74, 0e
        sub     esp, 12                                 ; 34B9 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 34BC _ FF. 75, 08
        call    task_remove                             ; 34BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 34C4 _ 83. C4, 10
?_200:  mov     eax, dword [ebp+8H]                     ; 34C7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34CA _ 8B. 40, 04
        cmp     eax, 2                                  ; 34CD _ 83. F8, 02
        jz near       ?_201                                   ; 34d0 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 34D2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 34D5 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 34D8 _ 89. 50, 0C
        sub     esp, 12                                 ; 34DB _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 34DE _ FF. 75, 08
        call    task_add                                ; 34E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 34E6 _ 83. C4, 10
?_201:  mov     eax, dword [taskctl]                    ; 34E9 _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 34EE _ C7. 40, 04, 00000001
        nop                                             ; 34F5 _ 90
        leave                                           ; 34F6 _ C9
        ret                                             ; 34F7 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 34F8 _ 55
        mov     ebp, esp                                ; 34F9 _ 89. E5
        sub     esp, 24                                 ; 34FB _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 34FE _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 3504 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3509 _ 8B. 10
        mov     eax, edx                                ; 350B _ 89. D0
        shl     eax, 2                                  ; 350D _ C1. E0, 02
        add     eax, edx                                ; 3510 _ 01. D0
        shl     eax, 2                                  ; 3512 _ C1. E0, 02
        add     eax, ecx                                ; 3515 _ 01. C8
        add     eax, 8                                  ; 3517 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 351A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 351D _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3520 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3523 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3526 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 352A _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 352D _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3530 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3533 _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 3536 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 3539 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 353C _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 353F _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3542 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3545 _ 8B. 00
        cmp     edx, eax                                ; 3547 _ 39. C2
        jnz near      ?_202                                   ; 3549 _ 75, 0a
        mov     eax, dword [ebp-0CH]                    ; 354B _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 354E _ C7. 40, 04, 00000000
?_202:  mov     eax, dword [taskctl]                    ; 3555 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 355A _ 8B. 40, 04
        test    eax, eax                                ; 355D _ 85. C0
        jz near       ?_203                                   ; 355f _ 74, 24
        call    task_switchsub                          ; 3561 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 3566 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 356C _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3571 _ 8B. 10
        mov     eax, edx                                ; 3573 _ 89. D0
        shl     eax, 2                                  ; 3575 _ C1. E0, 02
        add     eax, edx                                ; 3578 _ 01. D0
        shl     eax, 2                                  ; 357A _ C1. E0, 02
        add     eax, ecx                                ; 357D _ 01. C8
        add     eax, 8                                  ; 357F _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 3582 _ 89. 45, F4
?_203:  mov     eax, dword [ebp-0CH]                    ; 3585 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3588 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 358B _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 358E _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 3592 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3595 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 3598 _ 8B. 40, 08
        mov     edx, eax                                ; 359B _ 89. C2
        mov     eax, dword [task_timer]                 ; 359D _ A1, 000022C4(d)
        sub     esp, 8                                  ; 35A2 _ 83. EC, 08
        push    edx                                     ; 35A5 _ 52
        push    eax                                     ; 35A6 _ 50
        call    timer_settime                           ; 35A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35AC _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 35AF _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 35B2 _ 3B. 45, F0
        jz near       ?_204                                   ; 35b5 _ 74, 1a
        cmp     dword [ebp-14H], 0                      ; 35B7 _ 83. 7D, EC, 00
        jz near       ?_204                                   ; 35bb _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 35BD _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 35C0 _ 8B. 00
        sub     esp, 8                                  ; 35C2 _ 83. EC, 08
        push    eax                                     ; 35C5 _ 50
        push    0                                       ; 35C6 _ 6A, 00
        call    farjmp                                  ; 35C8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35CD _ 83. C4, 10
        nop                                             ; 35D0 _ 90
?_204:  nop                                             ; 35D1 _ 90
        leave                                           ; 35D2 _ C9
        ret                                             ; 35D3 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 35D4 _ 55
        mov     ebp, esp                                ; 35D5 _ 89. E5
        sub     esp, 24                                 ; 35D7 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 35DA _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 35E1 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 35E8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35EB _ 8B. 40, 04
        cmp     eax, 2                                  ; 35EE _ 83. F8, 02
        jnz near      ?_205                                   ; 35f1 _ 75, 52
        call    task_now                                ; 35F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 35F8 _ 89. 45, F0
        sub     esp, 12                                 ; 35FB _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 35FE _ FF. 75, 08
        call    task_remove                             ; 3601 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3606 _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 3609 _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 3610 _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 3613 _ 3B. 45, F0
        jnz near      ?_205                                   ; 3616 _ 75, 2d
        call    task_switchsub                          ; 3618 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 361D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3622 _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 3625 _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 362C _ 83. 7D, F0, 00
        jz near       ?_205                                   ; 3630 _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 3632 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3635 _ 8B. 00
        sub     esp, 8                                  ; 3637 _ 83. EC, 08
        push    eax                                     ; 363A _ 50
        push    0                                       ; 363B _ 6A, 00
        call    farjmp                                  ; 363D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3642 _ 83. C4, 10
?_205:  mov     eax, dword [ebp-0CH]                    ; 3645 _ 8B. 45, F4
        leave                                           ; 3648 _ C9
        ret                                             ; 3649 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 364A _ 55
        mov     ebp, esp                                ; 364B _ 89. E5
        sub     esp, 16                                 ; 364D _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3650 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 3656 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 365B _ 8B. 10
        mov     eax, edx                                ; 365D _ 89. D0
        shl     eax, 2                                  ; 365F _ C1. E0, 02
        add     eax, edx                                ; 3662 _ 01. D0
        shl     eax, 2                                  ; 3664 _ C1. E0, 02
        add     eax, ecx                                ; 3667 _ 01. C8
        add     eax, 8                                  ; 3669 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 366C _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 366F _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3672 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3675 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3678 _ 8B. 44 90, 08
        leave                                           ; 367C _ C9
        ret                                             ; 367D _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 367E _ 55
        mov     ebp, esp                                ; 367F _ 89. E5
        sub     esp, 16                                 ; 3681 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3684 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 368A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 368D _ 8B. 50, 0C
        mov     eax, edx                                ; 3690 _ 89. D0
        shl     eax, 2                                  ; 3692 _ C1. E0, 02
        add     eax, edx                                ; 3695 _ 01. D0
        shl     eax, 2                                  ; 3697 _ C1. E0, 02
        add     eax, ecx                                ; 369A _ 01. C8
        add     eax, 8                                  ; 369C _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 369F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 36A2 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 36A5 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 36A7 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 36AA _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 36AD _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 36B1 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 36B4 _ 8B. 00
        lea     edx, [eax+1H]                           ; 36B6 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 36B9 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 36BC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 36BE _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 36C1 _ C7. 40, 04, 00000002
        nop                                             ; 36C8 _ 90
        leave                                           ; 36C9 _ C9
        ret                                             ; 36CA _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 36CB _ 55
        mov     ebp, esp                                ; 36CC _ 89. E5
        sub     esp, 16                                 ; 36CE _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 36D1 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 36D7 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 36DA _ 8B. 50, 0C
        mov     eax, edx                                ; 36DD _ 89. D0
        shl     eax, 2                                  ; 36DF _ C1. E0, 02
        add     eax, edx                                ; 36E2 _ 01. D0
        shl     eax, 2                                  ; 36E4 _ C1. E0, 02
        add     eax, ecx                                ; 36E7 _ 01. C8
        add     eax, 8                                  ; 36E9 _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 36EC _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 36EF _ C7. 45, FC, 00000000
        jmp     ?_208                                   ; 36F6 _ EB, 22

?_206:  mov     eax, dword [ebp-8H]                     ; 36F8 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 36FB _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 36FE _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 3702 _ 39. 45, 08
        jnz near      ?_207                                   ; 3705 _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 3707 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 370A _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 370D _ C7. 44 90, 08, 00000000
        jmp     ?_209                                   ; 3715 _ EB, 0D

?_207:  inc     dword [ebp-4H]                          ; 3717 _ FF. 45, FC
?_208:  mov     eax, dword [ebp-8H]                     ; 371A _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 371D _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 371F _ 39. 45, FC
        jl      ?_206                                   ; 3722 _ 7C, D4
?_209:  mov     eax, dword [ebp-8H]                     ; 3724 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3727 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3729 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 372C _ 8B. 45, F8
        mov     dword [eax], edx                        ; 372F _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 3731 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 3734 _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 3737 _ 39. 45, FC
        jge near      ?_210                                   ; 373a _ 7d, 0f
        mov     eax, dword [ebp-8H]                     ; 373C _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 373F _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3742 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 3745 _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 3748 _ 89. 50, 04
?_210:  mov     eax, dword [ebp-8H]                     ; 374B _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 374E _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 3751 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3754 _ 8B. 00
        cmp     edx, eax                                ; 3756 _ 39. C2
        jl      ?_211                                   ; 3758 _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 375A _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 375D _ C7. 40, 04, 00000000
?_211:  mov     eax, dword [ebp+8H]                     ; 3764 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3767 _ C7. 40, 04, 00000001
        jmp     ?_213                                   ; 376E _ EB, 1A

?_212:  mov     eax, dword [ebp-4H]                     ; 3770 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 3773 _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 3776 _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 3779 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 377D _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3780 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 3783 _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 3787 _ FF. 45, FC
?_213:  mov     eax, dword [ebp-8H]                     ; 378A _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 378D _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 378F _ 39. 45, FC
        jl      ?_212                                   ; 3792 _ 7C, DC
        nop                                             ; 3794 _ 90
        leave                                           ; 3795 _ C9
        ret                                             ; 3796 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 3797 _ 55
        mov     ebp, esp                                ; 3798 _ 89. E5
        sub     esp, 16                                 ; 379A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 379D _ C7. 45, FC, 00000000
        jmp     ?_215                                   ; 37A4 _ EB, 21

?_214:  mov     ecx, dword [taskctl]                    ; 37A6 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 37AC _ 8B. 55, FC
        mov     eax, edx                                ; 37AF _ 89. D0
        shl     eax, 2                                  ; 37B1 _ C1. E0, 02
        add     eax, edx                                ; 37B4 _ 01. D0
        shl     eax, 2                                  ; 37B6 _ C1. E0, 02
        add     eax, ecx                                ; 37B9 _ 01. C8
        add     eax, 8                                  ; 37BB _ 83. C0, 08
        mov     eax, dword [eax]                        ; 37BE _ 8B. 00
        test    eax, eax                                ; 37C0 _ 85. C0
        jg  near      ?_216                                   ; 37c2 _ 7f, 0b
        inc     dword [ebp-4H]                          ; 37C4 _ FF. 45, FC
?_215:  cmp     dword [ebp-4H], 2                       ; 37C7 _ 83. 7D, FC, 02
        jle near      ?_214                                   ; 37cb _ 7e, d9
        jmp     ?_217                                   ; 37CD _ EB, 01

?_216:  nop                                             ; 37CF _ 90
?_217:  mov     eax, dword [taskctl]                    ; 37D0 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 37D5 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 37D8 _ 89. 10
        mov     eax, dword [taskctl]                    ; 37DA _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 37DF _ C7. 40, 04, 00000000
        nop                                             ; 37E6 _ 90
        leave                                           ; 37E7 _ C9
        ret                                             ; 37E8 _ C3
; task_switchsub End of function



?_218:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_219:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_220:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_221:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0017 _ 3[sec].

?_222:                                                  ; byte
        db 3EH, 00H                                     ; 001E _ >.

?_223:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0020 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0028 _ sk b.

?_224:                                                  ; byte
        db 42H, 00H                                     ; 002D _ B.

?_225:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002F _ page is:
        db 20H, 00H                                     ; 0037 _  .

?_226:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0039 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0041 _ L: .

?_227:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0045 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004D _ H: .

?_228:                                                  ; byte
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
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 0080 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 0088 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 0090 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 0098 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00A0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00A8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00B0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00C8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00D0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 00F0 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 00F8 _ ......|.

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0100 _ 0X

?_229:  db 00H                                          ; 0102 _ .

?_230:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0103 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 010B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0113 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 011B _ .....

table_rgb.1953:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0120 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2000:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0160 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0168 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0170 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0178 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0180 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0190 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01A0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01B0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 01E0 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 01F0 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0200 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0208 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0210 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0218 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0220 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0228 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0230 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0238 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0240 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0248 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0250 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0258 _ .....***

closebtn.2119:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0260 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0268 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0280 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0300 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0310 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0320 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0328 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0330 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0338 _ @@@@@@@@



key_shift:                                              ; dword
        resd    1                                       ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0004

?_231:                                                  ; dword
        resb    2                                       ; 0008

?_232:  resw    1                                       ; 000A

keyinfo:                                                ; byte
        resb    24                                      ; 000C

?_233:  resd    1                                       ; 0024

mouseinfo:                                              ; byte
        resb    56                                      ; 0028

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_234:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  7                                       ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

task_cons:                                              ; dword
        resd    1                                       ; 0270

task_a.1867:                                            ; dword
        resd    3                                       ; 0274

tss_a.1866:                                             ; byte
        resb    128                                     ; 0280

tss_b.1865:                                             ; byte
        resb    104                                     ; 0300

task_b.1851:                                            ; byte
        resb    12                                      ; 0368

str.2048:                                               ; byte
        resb    1                                       ; 0374

?_235:  resb    9                                       ; 0375

?_236:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    1                                       ; 0380

?_237:                                                  ; byte
        resb    4                                       ; 0384

?_238:                                                  ; byte
        resb    4                                       ; 0388

?_239:                                                  ; byte
        resb    4                                       ; 038C

?_240:                                                  ; byte
        resb    7988                                    ; 0390

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


