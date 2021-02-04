; Disassembly of file: ckernel.o
; Tue Feb  2 12:32:34 2021
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
        push    bootInfo                                ; 000B _ 68, 00000008(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000008(d)
        mov     dword [ebp-24H], eax                    ; 001D _ 89. 45, DC
        mov     eax, dword [?_237]                      ; 0020 _ A1, 0000000C(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        mov     ax, word [?_238]                        ; 002B _ 66: A1, 0000000E(d)
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
        push    keyinfo                                 ; 00E5 _ 68, 00000010(d)
        call    fifo8_init                              ; 00EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EF _ 83. C4, 10
        push    0                                       ; 00F2 _ 6A, 00
        push    mousebuf                                ; 00F4 _ 68, 00000080(d)
        push    128                                     ; 00F9 _ 68, 00000080
        push    mouseinfo                               ; 00FE _ 68, 0000002C(d)
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
        push    ?_224                                   ; 02B9 _ 68, 00000000(d)
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
        mov     dword [task_a.1871], eax                ; 0336 _ A3, 00000274(d)
        mov     eax, dword [task_a.1871]                ; 033B _ A1, 00000274(d)
        mov     dword [?_239], eax                      ; 0340 _ A3, 00000028(d)
        mov     eax, dword [task_a.1871]                ; 0345 _ A1, 00000274(d)
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
        mov     dword [ebp-18H], 176                    ; 0377 _ C7. 45, E8, 000000B0
        mov     dword [ebp-1CH], 0                      ; 037E _ C7. 45, E4, 00000000
        mov     dword [ebp-20H], 0                      ; 0385 _ C7. 45, E0, 00000000
?_001:  call    io_cli                                  ; 038C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0391 _ 83. EC, 0C
        push    keyinfo                                 ; 0394 _ 68, 00000010(d)
        call    fifo8_status                            ; 0399 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039E _ 83. C4, 10
        mov     ebx, eax                                ; 03A1 _ 89. C3
        sub     esp, 12                                 ; 03A3 _ 83. EC, 0C
        push    mouseinfo                               ; 03A6 _ 68, 0000002C(d)
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
        push    keyinfo                                 ; 03D5 _ 68, 00000010(d)
        call    fifo8_status                            ; 03DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DF _ 83. C4, 10
        test    eax, eax                                ; 03E2 _ 85. C0
        je near       ?_008                                   ; 03e4 _ 0f 84, 000002d3
        call    io_sti                                  ; 03EA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03EF _ 83. EC, 0C
        push    keyinfo                                 ; 03F2 _ 68, 00000010(d)
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
        push    ?_225                                   ; 0488 _ 68, 00000008(d)
        push    edx                                     ; 048D _ 52
        push    eax                                     ; 048E _ 50
        call    make_wtitle8                            ; 048F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0494 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0497 _ A1, 00000264(d)
        push    1                                       ; 049C _ 6A, 01
        push    ?_226                                   ; 049E _ 68, 0000000F(d)
        push    dword [ebp-44H]                         ; 04A3 _ FF. 75, BC
        push    eax                                     ; 04A6 _ 50
        call    make_wtitle8                            ; 04A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AC _ 83. C4, 10
        jmp     ?_005                                   ; 04AF _ EB, 3B

?_004:  mov     dword [ebp-20H], 0                      ; 04B1 _ C7. 45, E0, 00000000
        mov     edx, dword [shtMsgBox]                  ; 04B8 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04BE _ A1, 00000264(d)
        push    1                                       ; 04C3 _ 6A, 01
        push    ?_225                                   ; 04C5 _ 68, 00000008(d)
        push    edx                                     ; 04CA _ 52
        push    eax                                     ; 04CB _ 50
        call    make_wtitle8                            ; 04CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04D4 _ A1, 00000264(d)
        push    0                                       ; 04D9 _ 6A, 00
        push    ?_226                                   ; 04DB _ 68, 0000000F(d)
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

?_007:  sub     esp, 12                                 ; 065D _ 83. EC, 0C
        push    dword [ebp-48H]                         ; 0660 _ FF. 75, B8
        call    isSpecialKey                            ; 0663 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0668 _ 83. C4, 10
        test    eax, eax                                ; 066B _ 85. C0
        jne near      ?_001                                   ; 066d _ 0f 85, fffffd19
        mov     eax, dword [ebp-48H]                    ; 0673 _ 8B. 45, B8
        movzx   eax, al                                 ; 0676 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 0679 _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 067F _ 83. C2, 10
        sub     esp, 8                                  ; 0682 _ 83. EC, 08
        push    eax                                     ; 0685 _ 50
        push    edx                                     ; 0686 _ 52
        call    fifo8_put                               ; 0687 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 068C _ 83. C4, 10
        sub     esp, 12                                 ; 068F _ 83. EC, 0C
        push    keyinfo                                 ; 0692 _ 68, 00000010(d)
        call    fifo8_status                            ; 0697 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 069C _ 83. C4, 10
        test    eax, eax                                ; 069F _ 85. C0
        jne near      ?_001                                   ; 06a1 _ 0f 85, fffffce5
        mov     eax, dword [task_a.1871]                ; 06A7 _ A1, 00000274(d)
        sub     esp, 12                                 ; 06AC _ 83. EC, 0C
        push    eax                                     ; 06AF _ 50
        call    task_sleep                              ; 06B0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B5 _ 83. C4, 10
        jmp     ?_001                                   ; 06B8 _ E9, FFFFFCCF

?_008:  sub     esp, 12                                 ; 06BD _ 83. EC, 0C
        push    mouseinfo                               ; 06C0 _ 68, 0000002C(d)
        call    fifo8_status                            ; 06C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06CA _ 83. C4, 10
        test    eax, eax                                ; 06CD _ 85. C0
        jz near       ?_009                                   ; 06cf _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 06D1 _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 06D7 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 06DD _ A1, 00000264(d)
        sub     esp, 4                                  ; 06E2 _ 83. EC, 04
        push    ecx                                     ; 06E5 _ 51
        push    edx                                     ; 06E6 _ 52
        push    eax                                     ; 06E7 _ 50
        call    show_mouse_info                         ; 06E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06ED _ 83. C4, 10
        jmp     ?_001                                   ; 06F0 _ E9, FFFFFC97

?_009:  sub     esp, 12                                 ; 06F5 _ 83. EC, 0C
        push    timerinfo                               ; 06F8 _ 68, 00000110(d)
        call    fifo8_status                            ; 06FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0702 _ 83. C4, 10
        test    eax, eax                                ; 0705 _ 85. C0
        je near       ?_001                                   ; 0707 _ 0f 84, fffffc7f
        call    io_sti                                  ; 070D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0712 _ 83. EC, 0C
        push    timerinfo                               ; 0715 _ 68, 00000110(d)
        call    fifo8_get                               ; 071A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 071F _ 83. C4, 10
        mov     dword [ebp-50H], eax                    ; 0722 _ 89. 45, B0
        cmp     dword [ebp-50H], 10                     ; 0725 _ 83. 7D, B0, 0A
        jnz near      ?_010                                   ; 0729 _ 75, 43
        sub     esp, 8                                  ; 072B _ 83. EC, 08
        push    100                                     ; 072E _ 6A, 64
        push    dword [ebp-28H]                         ; 0730 _ FF. 75, D8
        call    timer_settime                           ; 0733 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0738 _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 073B _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 073F _ 83. 7D, E8, 28
        jle near      ?_001                                   ; 0743 _ 0f 8e, fffffc43
        cmp     dword [ebp-1CH], 0                      ; 0749 _ 83. 7D, E4, 00
        jne near      ?_001                                   ; 074d _ 0f 85, fffffc39
        call    io_cli                                  ; 0753 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1871]                ; 0758 _ A1, 00000274(d)
        sub     esp, 12                                 ; 075D _ 83. EC, 0C
        push    eax                                     ; 0760 _ 50
        call    task_sleep                              ; 0761 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0766 _ 83. C4, 10
        jmp     ?_001                                   ; 0769 _ E9, FFFFFC1E

?_010:  cmp     dword [ebp-50H], 2                      ; 076E _ 83. 7D, B0, 02
        jnz near      ?_011                                   ; 0772 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0774 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 077A _ A1, 00000264(d)
        sub     esp, 8                                  ; 077F _ 83. EC, 08
        push    ?_227                                   ; 0782 _ 68, 00000017(d)
        push    7                                       ; 0787 _ 6A, 07
        push    32                                      ; 0789 _ 6A, 20
        push    0                                       ; 078B _ 6A, 00
        push    edx                                     ; 078D _ 52
        push    eax                                     ; 078E _ 50
        call    showString                              ; 078F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0794 _ 83. C4, 20
        jmp     ?_001                                   ; 0797 _ E9, FFFFFBF0

?_011:  cmp     dword [ebp-50H], 0                      ; 079C _ 83. 7D, B0, 00
        jz near       ?_012                                   ; 07a0 _ 74, 1e
        sub     esp, 4                                  ; 07A2 _ 83. EC, 04
        push    0                                       ; 07A5 _ 6A, 00
        push    timerinfo                               ; 07A7 _ 68, 00000110(d)
        push    dword [ebp-30H]                         ; 07AC _ FF. 75, D0
        call    timer_init                              ; 07AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07B4 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 07B7 _ C7. 45, F0, 00000000
        jmp     ?_013                                   ; 07BE _ EB, 1C

?_012:  sub     esp, 4                                  ; 07C0 _ 83. EC, 04
        push    1                                       ; 07C3 _ 6A, 01
        push    timerinfo                               ; 07C5 _ 68, 00000110(d)
        push    dword [ebp-30H]                         ; 07CA _ FF. 75, D0
        call    timer_init                              ; 07CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D2 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 07D5 _ C7. 45, F0, 00000007
?_013:  sub     esp, 8                                  ; 07DC _ 83. EC, 08
        push    50                                      ; 07DF _ 6A, 32
        push    dword [ebp-30H]                         ; 07E1 _ FF. 75, D0
        call    timer_settime                           ; 07E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07E9 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 07EC _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 07EF _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 07F2 _ 8B. 45, F0
        movzx   ecx, al                                 ; 07F5 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 07F8 _ A1, 00000260(d)
        mov     edx, dword [eax+4H]                     ; 07FD _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0800 _ A1, 00000260(d)
        mov     eax, dword [eax]                        ; 0805 _ 8B. 00
        sub     esp, 4                                  ; 0807 _ 83. EC, 04
        push    43                                      ; 080A _ 6A, 2B
        push    ebx                                     ; 080C _ 53
        push    28                                      ; 080D _ 6A, 1C
        push    dword [ebp-0CH]                         ; 080F _ FF. 75, F4
        push    ecx                                     ; 0812 _ 51
        push    edx                                     ; 0813 _ 52
        push    eax                                     ; 0814 _ 50
        call    boxfill8                                ; 0815 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 081A _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 081D _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0820 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0823 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0829 _ A1, 00000264(d)
        sub     esp, 8                                  ; 082E _ 83. EC, 08
        push    44                                      ; 0831 _ 6A, 2C
        push    ecx                                     ; 0833 _ 51
        push    28                                      ; 0834 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0836 _ FF. 75, F4
        push    edx                                     ; 0839 _ 52
        push    eax                                     ; 083A _ 50
        call    sheet_refresh                           ; 083B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0840 _ 83. C4, 20
        jmp     ?_001                                   ; 0843 _ E9, FFFFFB44
; CMain End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0848 _ 55
        mov     ebp, esp                                ; 0849 _ 89. E5
        sub     esp, 8                                  ; 084B _ 83. EC, 08
        sub     esp, 12                                 ; 084E _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 0851 _ FF. 75, 08
        call    transferScanCode                        ; 0854 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0859 _ 83. C4, 10
        cmp     dword [ebp+8H], 58                      ; 085C _ 83. 7D, 08, 3A
        jz near       ?_014                                   ; 0860 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0862 _ 81. 7D, 08, 000000BA
        jz near       ?_014                                   ; 0869 _ 74, 1e
        cmp     dword [ebp+8H], 42                      ; 086B _ 83. 7D, 08, 2A
        jz near       ?_014                                   ; 086f _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0871 _ 83. 7D, 08, 36
        jz near       ?_014                                   ; 0875 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0877 _ 81. 7D, 08, 000000AA
        jz near       ?_014                                   ; 087e _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0880 _ 81. 7D, 08, 000000B6
        jnz near      ?_015                                   ; 0887 _ 75, 07
?_014:  mov     eax, 1                                  ; 0889 _ B8, 00000001
        jmp     ?_016                                   ; 088E _ EB, 05

?_015:  mov     eax, 0                                  ; 0890 _ B8, 00000000
?_016:  leave                                           ; 0895 _ C9
        ret                                             ; 0896 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0897 _ 55
        mov     ebp, esp                                ; 0898 _ 89. E5
        sub     esp, 16                                 ; 089A _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 089D _ 83. 7D, 08, 2A
        jnz near      ?_017                                   ; 08a1 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 08A3 _ A1, 00000000(d)
        or      eax, 01H                                ; 08A8 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 08AB _ A3, 00000000(d)
?_017:  cmp     dword [ebp+8H], 54                      ; 08B0 _ 83. 7D, 08, 36
        jnz near      ?_018                                   ; 08b4 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 08B6 _ A1, 00000000(d)
        or      eax, 02H                                ; 08BB _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 08BE _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 170                     ; 08C3 _ 81. 7D, 08, 000000AA
        jnz near      ?_019                                   ; 08ca _ 75, 0d
        mov     eax, dword [key_shift]                  ; 08CC _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 08D1 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 08D4 _ A3, 00000000(d)
?_019:  cmp     dword [ebp+8H], 182                     ; 08D9 _ 81. 7D, 08, 000000B6
        jnz near      ?_020                                   ; 08e0 _ 75, 0d
        mov     eax, dword [key_shift]                  ; 08E2 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 08E7 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 08EA _ A3, 00000000(d)
?_020:  cmp     dword [ebp+8H], 58                      ; 08EF _ 83. 7D, 08, 3A
        jnz near      ?_022                                   ; 08f3 _ 75, 1f
        mov     eax, dword [caps_lock]                  ; 08F5 _ A1, 00000000(d)
        test    eax, eax                                ; 08FA _ 85. C0
        jnz near      ?_021                                   ; 08fc _ 75, 0c
        mov     dword [caps_lock], 1                    ; 08FE _ C7. 05, 00000000(d), 00000001
        jmp     ?_022                                   ; 0908 _ EB, 0A

?_021:  mov     dword [caps_lock], 0                    ; 090A _ C7. 05, 00000000(d), 00000000
?_022:  cmp     dword [ebp+8H], 42                      ; 0914 _ 83. 7D, 08, 2A
        jz near       ?_023                                   ; 0918 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 091A _ 83. 7D, 08, 36
        jz near       ?_023                                   ; 091e _ 74, 1e
        cmp     dword [ebp+8H], 170                     ; 0920 _ 81. 7D, 08, 000000AA
        jz near       ?_023                                   ; 0927 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0929 _ 81. 7D, 08, 000000B6
        jz near       ?_023                                   ; 0930 _ 74, 0c
        cmp     dword [ebp+8H], 83                      ; 0932 _ 83. 7D, 08, 53
        jg  near      ?_023                                   ; 0936 _ 7f, 06
        cmp     dword [ebp+8H], 58                      ; 0938 _ 83. 7D, 08, 3A
        jnz near      ?_024                                   ; 093c _ 75, 07
?_023:  mov     al, 0                                   ; 093E _ B0, 00
        jmp     ?_029                                   ; 0940 _ E9, 00000084

?_024:  mov     byte [ebp-1H], 0                        ; 0945 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0949 _ A1, 00000000(d)
        test    eax, eax                                ; 094E _ 85. C0
        jnz near      ?_025                                   ; 0950 _ 75, 41
        cmp     dword [ebp+8H], 83                      ; 0952 _ 83. 7D, 08, 53
        jg  near      ?_025                                   ; 0956 _ 7f, 3b
        mov     eax, dword [ebp+8H]                     ; 0958 _ 8B. 45, 08
        add     eax, keytable                           ; 095B _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0960 _ 8A. 00
        test    al, al                                  ; 0962 _ 84. C0
        jz near       ?_025                                   ; 0964 _ 74, 2d
        mov     eax, dword [ebp+8H]                     ; 0966 _ 8B. 45, 08
        add     eax, keytable                           ; 0969 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 096E _ 8A. 00
        mov     byte [ebp-1H], al                       ; 0970 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0973 _ 80. 7D, FF, 40
        jle near      ?_027                                   ; 0977 _ 7e, 4c
        cmp     byte [ebp-1H], 90                       ; 0979 _ 80. 7D, FF, 5A
        jg  near      ?_027                                   ; 097d _ 7f, 46
        mov     eax, dword [caps_lock]                  ; 097F _ A1, 00000000(d)
        test    eax, eax                                ; 0984 _ 85. C0
        jnz near      ?_027                                   ; 0986 _ 75, 3d
        mov     al, byte [ebp-1H]                       ; 0988 _ 8A. 45, FF
        add     eax, 32                                 ; 098B _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 098E _ 88. 45, FF
        jmp     ?_027                                   ; 0991 _ EB, 32

?_025:  mov     eax, dword [key_shift]                  ; 0993 _ A1, 00000000(d)
        test    eax, eax                                ; 0998 _ 85. C0
        jz near       ?_026                                   ; 099a _ 74, 23
        cmp     dword [ebp+8H], 127                     ; 099C _ 83. 7D, 08, 7F
        jg  near      ?_026                                   ; 09a0 _ 7f, 1d
        mov     eax, dword [ebp+8H]                     ; 09A2 _ 8B. 45, 08
        add     eax, keytable1                          ; 09A5 _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 09AA _ 8A. 00
        test    al, al                                  ; 09AC _ 84. C0
        jz near       ?_026                                   ; 09ae _ 74, 0f
        mov     eax, dword [ebp+8H]                     ; 09B0 _ 8B. 45, 08
        add     eax, keytable1                          ; 09B3 _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 09B8 _ 8A. 00
        mov     byte [ebp-1H], al                       ; 09BA _ 88. 45, FF
        jmp     ?_028                                   ; 09BD _ EB, 07

?_026:  mov     byte [ebp-1H], 0                        ; 09BF _ C6. 45, FF, 00
        jmp     ?_028                                   ; 09C3 _ EB, 01

?_027:  nop                                             ; 09C5 _ 90
?_028:  mov     al, byte [ebp-1H]                       ; 09C6 _ 8A. 45, FF
?_029:  leave                                           ; 09C9 _ C9
        ret                                             ; 09CA _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 09CB _ 55
        mov     ebp, esp                                ; 09CC _ 89. E5
        sub     esp, 24                                 ; 09CE _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 09D1 _ A1, 00000264(d)
        sub     esp, 12                                 ; 09D6 _ 83. EC, 0C
        push    eax                                     ; 09D9 _ 50
        call    sheet_alloc                             ; 09DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09DF _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 09E2 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 09E5 _ A1, 00000000(d)
        sub     esp, 8                                  ; 09EA _ 83. EC, 08
        push    42240                                   ; 09ED _ 68, 0000A500
        push    eax                                     ; 09F2 _ 50
        call    memman_alloc_4k                         ; 09F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09F8 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 09FB _ 89. 45, F0
        sub     esp, 12                                 ; 09FE _ 83. EC, 0C
        push    99                                      ; 0A01 _ 6A, 63
        push    165                                     ; 0A03 _ 68, 000000A5
        push    256                                     ; 0A08 _ 68, 00000100
        push    dword [ebp-10H]                         ; 0A0D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0A10 _ FF. 75, F4
        call    sheet_setbuf                            ; 0A13 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A18 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0A1B _ A1, 00000264(d)
        push    0                                       ; 0A20 _ 6A, 00
        push    ?_226                                   ; 0A22 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0A27 _ FF. 75, F4
        push    eax                                     ; 0A2A _ 50
        call    make_window8                            ; 0A2B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A30 _ 83. C4, 10
        sub     esp, 8                                  ; 0A33 _ 83. EC, 08
        push    0                                       ; 0A36 _ 6A, 00
        push    128                                     ; 0A38 _ 68, 00000080
        push    240                                     ; 0A3D _ 68, 000000F0
        push    28                                      ; 0A42 _ 6A, 1C
        push    8                                       ; 0A44 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0A46 _ FF. 75, F4
        call    make_textbox8                           ; 0A49 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A4E _ 83. C4, 20
        call    task_alloc                              ; 0A51 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0A56 _ 89. 45, EC
        call    get_code32_addr                         ; 0A59 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0A5E _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0A61 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0A64 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A6B _ 8B. 45, EC
        mov     dword [eax+78H], 1073741824             ; 0A6E _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-18H]                    ; 0A75 _ 8B. 45, E8
        neg     eax                                     ; 0A78 _ F7. D8
        add     eax, console_task                       ; 0A7A _ 05, 00000000(d)
        mov     edx, eax                                ; 0A7F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0A81 _ 8B. 45, EC
        mov     dword [eax+34H], edx                    ; 0A84 _ 89. 50, 34
        mov     eax, dword [ebp-14H]                    ; 0A87 _ 8B. 45, EC
        mov     dword [eax+5CH], 0                      ; 0A8A _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A91 _ 8B. 45, EC
        mov     dword [eax+60H], 8                      ; 0A94 _ C7. 40, 60, 00000008
        mov     eax, dword [ebp-14H]                    ; 0A9B _ 8B. 45, EC
        mov     dword [eax+64H], 32                     ; 0A9E _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-14H]                    ; 0AA5 _ 8B. 45, EC
        mov     dword [eax+68H], 24                     ; 0AA8 _ C7. 40, 68, 00000018
        mov     eax, dword [ebp-14H]                    ; 0AAF _ 8B. 45, EC
        mov     dword [eax+6CH], 0                      ; 0AB2 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0AB9 _ 8B. 45, EC
        mov     dword [eax+70H], 16                     ; 0ABC _ C7. 40, 70, 00000010
        mov     eax, dword [ebp-14H]                    ; 0AC3 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0AC6 _ 8B. 40, 4C
        lea     edx, [eax-8H]                           ; 0AC9 _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0ACC _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0ACF _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0AD2 _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0AD5 _ 8B. 40, 4C
        add     eax, 4                                  ; 0AD8 _ 83. C0, 04
        mov     edx, eax                                ; 0ADB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0ADD _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0AE0 _ 89. 02
        sub     esp, 4                                  ; 0AE2 _ 83. EC, 04
        push    5                                       ; 0AE5 _ 6A, 05
        push    1                                       ; 0AE7 _ 6A, 01
        push    dword [ebp-14H]                         ; 0AE9 _ FF. 75, EC
        call    task_run                                ; 0AEC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF1 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0AF4 _ A1, 00000264(d)
        push    4                                       ; 0AF9 _ 6A, 04
        push    32                                      ; 0AFB _ 6A, 20
        push    dword [ebp-0CH]                         ; 0AFD _ FF. 75, F4
        push    eax                                     ; 0B00 _ 50
        call    sheet_slide                             ; 0B01 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B06 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0B09 _ A1, 00000264(d)
        sub     esp, 4                                  ; 0B0E _ 83. EC, 04
        push    1                                       ; 0B11 _ 6A, 01
        push    dword [ebp-0CH]                         ; 0B13 _ FF. 75, F4
        push    eax                                     ; 0B16 _ 50
        call    sheet_updown                            ; 0B17 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B1C _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0B1F _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0B22 _ A3, 00000270(d)
        mov     eax, dword [ebp-0CH]                    ; 0B27 _ 8B. 45, F4
        leave                                           ; 0B2A _ C9
        ret                                             ; 0B2B _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 0B2C _ 55
        mov     ebp, esp                                ; 0B2D _ 89. E5
        push    ebx                                     ; 0B2F _ 53
        sub     esp, 548                                ; 0B30 _ 81. EC, 00000224
        call    task_now                                ; 0B36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B3B _ 89. 45, EC
        mov     dword [ebp-0CH], 16                     ; 0B3E _ C7. 45, F4, 00000010
        mov     dword [ebp-10H], 0                      ; 0B45 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp-14H]                    ; 0B4C _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0B4F _ 8D. 50, 10
        push    dword [ebp-14H]                         ; 0B52 _ FF. 75, EC
        lea     eax, [ebp-224H]                         ; 0B55 _ 8D. 85, FFFFFDDC
        push    eax                                     ; 0B5B _ 50
        push    128                                     ; 0B5C _ 68, 00000080
        push    edx                                     ; 0B61 _ 52
        call    fifo8_init                              ; 0B62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B67 _ 83. C4, 10
        call    timer_alloc                             ; 0B6A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0B6F _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0B72 _ 8B. 45, EC
        add     eax, 16                                 ; 0B75 _ 83. C0, 10
        sub     esp, 4                                  ; 0B78 _ 83. EC, 04
        push    1                                       ; 0B7B _ 6A, 01
        push    eax                                     ; 0B7D _ 50
        push    dword [ebp-18H]                         ; 0B7E _ FF. 75, E8
        call    timer_init                              ; 0B81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B86 _ 83. C4, 10
        sub     esp, 8                                  ; 0B89 _ 83. EC, 08
        push    50                                      ; 0B8C _ 6A, 32
        push    dword [ebp-18H]                         ; 0B8E _ FF. 75, E8
        call    timer_settime                           ; 0B91 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B96 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0B99 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0B9E _ 83. EC, 08
        push    ?_228                                   ; 0BA1 _ 68, 0000001E(d)
        push    7                                       ; 0BA6 _ 6A, 07
        push    28                                      ; 0BA8 _ 6A, 1C
        push    8                                       ; 0BAA _ 6A, 08
        push    dword [ebp+8H]                          ; 0BAC _ FF. 75, 08
        push    eax                                     ; 0BAF _ 50
        call    showString                              ; 0BB0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BB5 _ 83. C4, 20
        mov     dword [ebp-1CH], 0                      ; 0BB8 _ C7. 45, E4, 00000000
?_030:  call    io_cli                                  ; 0BBF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0BC4 _ 8B. 45, EC
        add     eax, 16                                 ; 0BC7 _ 83. C0, 10
        sub     esp, 12                                 ; 0BCA _ 83. EC, 0C
        push    eax                                     ; 0BCD _ 50
        call    fifo8_status                            ; 0BCE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BD3 _ 83. C4, 10
        test    eax, eax                                ; 0BD6 _ 85. C0
        jnz near      ?_031                                   ; 0bd8 _ 75, 07
        call    io_sti                                  ; 0BDA _ E8, FFFFFFFC(rel)
        jmp     ?_030                                   ; 0BDF _ EB, DE

?_031:  call    io_sti                                  ; 0BE1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0BE6 _ 8B. 45, EC
        add     eax, 16                                 ; 0BE9 _ 83. C0, 10
        sub     esp, 12                                 ; 0BEC _ 83. EC, 0C
        push    eax                                     ; 0BEF _ 50
        call    fifo8_get                               ; 0BF0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BF5 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0BF8 _ 89. 45, E0
        cmp     dword [ebp-20H], 1                      ; 0BFB _ 83. 7D, E0, 01
        jg  near      ?_034                                   ; 0bff _ 7f, 59
        cmp     dword [ebp-20H], 0                      ; 0C01 _ 83. 7D, E0, 00
        jz near       ?_032                                   ; 0c05 _ 74, 20
        mov     eax, dword [ebp-14H]                    ; 0C07 _ 8B. 45, EC
        add     eax, 16                                 ; 0C0A _ 83. C0, 10
        sub     esp, 4                                  ; 0C0D _ 83. EC, 04
        push    0                                       ; 0C10 _ 6A, 00
        push    eax                                     ; 0C12 _ 50
        push    dword [ebp-18H]                         ; 0C13 _ FF. 75, E8
        call    timer_init                              ; 0C16 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C1B _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0C1E _ C7. 45, F0, 00000007
        jmp     ?_033                                   ; 0C25 _ EB, 1E

?_032:  mov     eax, dword [ebp-14H]                    ; 0C27 _ 8B. 45, EC
        add     eax, 16                                 ; 0C2A _ 83. C0, 10
        sub     esp, 4                                  ; 0C2D _ 83. EC, 04
        push    1                                       ; 0C30 _ 6A, 01
        push    eax                                     ; 0C32 _ 50
        push    dword [ebp-18H]                         ; 0C33 _ FF. 75, E8
        call    timer_init                              ; 0C36 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C3B _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0C3E _ C7. 45, F0, 00000000
?_033:  sub     esp, 8                                  ; 0C45 _ 83. EC, 08
        push    50                                      ; 0C48 _ 6A, 32
        push    dword [ebp-18H]                         ; 0C4A _ FF. 75, E8
        call    timer_settime                           ; 0C4D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C52 _ 83. C4, 10
        jmp     ?_036                                   ; 0C55 _ E9, 00000159

?_034:  cmp     dword [ebp-20H], 14                     ; 0C5A _ 83. 7D, E0, 0E
        jne near      ?_035                                   ; 0c5e _ 0f 85, 000000a7
        cmp     dword [ebp-0CH], 8                      ; 0C64 _ 83. 7D, F4, 08
        jle near      ?_035                                   ; 0c68 _ 0f 8e, 0000009d
        mov     eax, dword [ebp-0CH]                    ; 0C6E _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0C71 _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0C74 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0C77 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C7A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0C7D _ 8B. 00
        sub     esp, 4                                  ; 0C7F _ 83. EC, 04
        push    43                                      ; 0C82 _ 6A, 2B
        push    ecx                                     ; 0C84 _ 51
        push    28                                      ; 0C85 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0C87 _ FF. 75, F4
        push    0                                       ; 0C8A _ 6A, 00
        push    edx                                     ; 0C8C _ 52
        push    eax                                     ; 0C8D _ 50
        call    boxfill8                                ; 0C8E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C93 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0C96 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0C99 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0C9C _ A1, 00000264(d)
        sub     esp, 8                                  ; 0CA1 _ 83. EC, 08
        push    44                                      ; 0CA4 _ 6A, 2C
        push    edx                                     ; 0CA6 _ 52
        push    28                                      ; 0CA7 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0CA9 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0CAC _ FF. 75, 08
        push    eax                                     ; 0CAF _ 50
        call    sheet_refresh                           ; 0CB0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CB5 _ 83. C4, 20
        sub     dword [ebp-0CH], 8                      ; 0CB8 _ 83. 6D, F4, 08
        mov     eax, dword [ebp-0CH]                    ; 0CBC _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0CBF _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0CC2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0CC5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0CC8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0CCB _ 8B. 00
        sub     esp, 4                                  ; 0CCD _ 83. EC, 04
        push    43                                      ; 0CD0 _ 6A, 2B
        push    ecx                                     ; 0CD2 _ 51
        push    28                                      ; 0CD3 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0CD5 _ FF. 75, F4
        push    0                                       ; 0CD8 _ 6A, 00
        push    edx                                     ; 0CDA _ 52
        push    eax                                     ; 0CDB _ 50
        call    boxfill8                                ; 0CDC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CE1 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0CE4 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0CE7 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0CEA _ A1, 00000264(d)
        sub     esp, 8                                  ; 0CEF _ 83. EC, 08
        push    44                                      ; 0CF2 _ 6A, 2C
        push    edx                                     ; 0CF4 _ 52
        push    28                                      ; 0CF5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0CF7 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0CFA _ FF. 75, 08
        push    eax                                     ; 0CFD _ 50
        call    sheet_refresh                           ; 0CFE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D03 _ 83. C4, 20
        jmp     ?_036                                   ; 0D06 _ E9, 000000A8

?_035:  sub     esp, 12                                 ; 0D0B _ 83. EC, 0C
        push    dword [ebp-20H]                         ; 0D0E _ FF. 75, E0
        call    transferScanCode                        ; 0D11 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D16 _ 83. C4, 10
        mov     byte [ebp-21H], al                      ; 0D19 _ 88. 45, DF
        cmp     dword [ebp-0CH], 239                    ; 0D1C _ 81. 7D, F4, 000000EF
        jg  near      ?_036                                   ; 0d23 _ 0f 8f, 0000008a
        cmp     byte [ebp-21H], 0                       ; 0D29 _ 80. 7D, DF, 00
        je near       ?_036                                   ; 0d2d _ 0f 84, 00000080
        mov     eax, dword [ebp-0CH]                    ; 0D33 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0D36 _ 8D. 48, 07
        mov     eax, dword [ebp+8H]                     ; 0D39 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D3C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D3F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0D42 _ 8B. 00
        sub     esp, 4                                  ; 0D44 _ 83. EC, 04
        push    43                                      ; 0D47 _ 6A, 2B
        push    ecx                                     ; 0D49 _ 51
        push    28                                      ; 0D4A _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0D4C _ FF. 75, F4
        push    0                                       ; 0D4F _ 6A, 00
        push    edx                                     ; 0D51 _ 52
        push    eax                                     ; 0D52 _ 50
        call    boxfill8                                ; 0D53 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D58 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0D5B _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0D5E _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0D61 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D66 _ 83. EC, 08
        push    44                                      ; 0D69 _ 6A, 2C
        push    edx                                     ; 0D6B _ 52
        push    28                                      ; 0D6C _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0D6E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D71 _ FF. 75, 08
        push    eax                                     ; 0D74 _ 50
        call    sheet_refresh                           ; 0D75 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D7A _ 83. C4, 20
        mov     al, byte [ebp-21H]                      ; 0D7D _ 8A. 45, DF
        mov     byte [ebp-226H], al                     ; 0D80 _ 88. 85, FFFFFDDA
        mov     byte [ebp-225H], 0                      ; 0D86 _ C6. 85, FFFFFDDB, 00
        mov     eax, dword [shtctl]                     ; 0D8D _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D92 _ 83. EC, 08
        lea     edx, [ebp-226H]                         ; 0D95 _ 8D. 95, FFFFFDDA
        push    edx                                     ; 0D9B _ 52
        push    7                                       ; 0D9C _ 6A, 07
        push    28                                      ; 0D9E _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0DA0 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0DA3 _ FF. 75, 08
        push    eax                                     ; 0DA6 _ 50
        call    showString                              ; 0DA7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DAC _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0DAF _ 83. 45, F4, 08
?_036:  mov     eax, dword [ebp-0CH]                    ; 0DB3 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0DB6 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0DB9 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0DBC _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 0DBF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DC2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DC5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0DC8 _ 8B. 00
        sub     esp, 4                                  ; 0DCA _ 83. EC, 04
        push    43                                      ; 0DCD _ 6A, 2B
        push    ebx                                     ; 0DCF _ 53
        push    28                                      ; 0DD0 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0DD2 _ FF. 75, F4
        push    ecx                                     ; 0DD5 _ 51
        push    edx                                     ; 0DD6 _ 52
        push    eax                                     ; 0DD7 _ 50
        call    boxfill8                                ; 0DD8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DDD _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0DE0 _ 8B. 45, F4
        lea     edx, [eax+8H]                           ; 0DE3 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0DE6 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0DEB _ 83. EC, 08
        push    44                                      ; 0DEE _ 6A, 2C
        push    edx                                     ; 0DF0 _ 52
        push    28                                      ; 0DF1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0DF3 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0DF6 _ FF. 75, 08
        push    eax                                     ; 0DF9 _ 50
        call    sheet_refresh                           ; 0DFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DFF _ 83. C4, 20
        jmp     ?_030                                   ; 0E02 _ E9, FFFFFDB8
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 0E07 _ 55
        mov     ebp, esp                                ; 0E08 _ 89. E5
        sub     esp, 72                                 ; 0E0A _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0E0D _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0E13 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0E18 _ 83. EC, 08
        push    ?_229                                   ; 0E1B _ 68, 00000020(d)
        push    7                                       ; 0E20 _ 6A, 07
        push    160                                     ; 0E22 _ 68, 000000A0
        push    0                                       ; 0E27 _ 6A, 00
        push    edx                                     ; 0E29 _ 52
        push    eax                                     ; 0E2A _ 50
        call    showString                              ; 0E2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E30 _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0E33 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0E3A _ C7. 45, E8, 00000000
        push    0                                       ; 0E41 _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 0E43 _ 8D. 45, C4
        push    eax                                     ; 0E46 _ 50
        push    8                                       ; 0E47 _ 6A, 08
        lea     eax, [ebp-34H]                          ; 0E49 _ 8D. 45, CC
        push    eax                                     ; 0E4C _ 50
        call    fifo8_init                              ; 0E4D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E52 _ 83. C4, 10
        call    timer_alloc                             ; 0E55 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0E5A _ 89. 45, EC
        sub     esp, 4                                  ; 0E5D _ 83. EC, 04
        push    123                                     ; 0E60 _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0E62 _ 8D. 45, CC
        push    eax                                     ; 0E65 _ 50
        push    dword [ebp-14H]                         ; 0E66 _ FF. 75, EC
        call    timer_init                              ; 0E69 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E6E _ 83. C4, 10
        sub     esp, 8                                  ; 0E71 _ 83. EC, 08
        push    100                                     ; 0E74 _ 6A, 64
        push    dword [ebp-14H]                         ; 0E76 _ FF. 75, EC
        call    timer_settime                           ; 0E79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E7E _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0E81 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0E88 _ C7. 45, F0, 00000000
?_037:  inc     dword [ebp-0CH]                         ; 0E8F _ FF. 45, F4
        call    io_cli                                  ; 0E92 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0E97 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0E9A _ 8D. 45, CC
        push    eax                                     ; 0E9D _ 50
        call    fifo8_status                            ; 0E9E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EA3 _ 83. C4, 10
        test    eax, eax                                ; 0EA6 _ 85. C0
        jnz near      ?_038                                   ; 0ea8 _ 75, 07
        call    io_sti                                  ; 0EAA _ E8, FFFFFFFC(rel)
        jmp     ?_037                                   ; 0EAF _ EB, DE

?_038:  sub     esp, 12                                 ; 0EB1 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0EB4 _ 8D. 45, CC
        push    eax                                     ; 0EB7 _ 50
        call    fifo8_get                               ; 0EB8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EBD _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0EC0 _ 89. 45, E8
        call    io_sti                                  ; 0EC3 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0EC8 _ 83. 7D, E8, 7B
        jnz near      ?_037                                   ; 0ecc _ 75, c1
        mov     edx, dword [sht_back]                   ; 0ECE _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0ED4 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0ED9 _ 83. EC, 08
        push    ?_230                                   ; 0EDC _ 68, 0000002D(d)
        push    7                                       ; 0EE1 _ 6A, 07
        push    192                                     ; 0EE3 _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0EE8 _ FF. 75, F0
        push    edx                                     ; 0EEB _ 52
        push    eax                                     ; 0EEC _ 50
        call    showString                              ; 0EED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF2 _ 83. C4, 20
        sub     esp, 8                                  ; 0EF5 _ 83. EC, 08
        push    100                                     ; 0EF8 _ 6A, 64
        push    dword [ebp-14H]                         ; 0EFA _ FF. 75, EC
        call    timer_settime                           ; 0EFD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F02 _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0F05 _ 83. 45, F0, 08
        jmp     ?_037                                   ; 0F09 _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0F0B _ 55
        mov     ebp, esp                                ; 0F0C _ 89. E5
        push    ebx                                     ; 0F0E _ 53
        sub     esp, 4                                  ; 0F0F _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0F12 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0F15 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0F18 _ 8B. 45, 0C
        dec     eax                                     ; 0F1B _ 48
        sub     esp, 4                                  ; 0F1C _ 83. EC, 04
        push    edx                                     ; 0F1F _ 52
        push    eax                                     ; 0F20 _ 50
        push    0                                       ; 0F21 _ 6A, 00
        push    0                                       ; 0F23 _ 6A, 00
        push    14                                      ; 0F25 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0F27 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F2A _ FF. 75, 08
        call    boxfill8                                ; 0F2D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F32 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F35 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0F38 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0F3B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0F3E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0F41 _ 8B. 45, 10
        sub     eax, 28                                 ; 0F44 _ 83. E8, 1C
        sub     esp, 4                                  ; 0F47 _ 83. EC, 04
        push    ecx                                     ; 0F4A _ 51
        push    edx                                     ; 0F4B _ 52
        push    eax                                     ; 0F4C _ 50
        push    0                                       ; 0F4D _ 6A, 00
        push    8                                       ; 0F4F _ 6A, 08
        push    dword [ebp+0CH]                         ; 0F51 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F54 _ FF. 75, 08
        call    boxfill8                                ; 0F57 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F5C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F5F _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0F62 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0F65 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0F68 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0F6B _ 8B. 45, 10
        sub     eax, 27                                 ; 0F6E _ 83. E8, 1B
        sub     esp, 4                                  ; 0F71 _ 83. EC, 04
        push    ecx                                     ; 0F74 _ 51
        push    edx                                     ; 0F75 _ 52
        push    eax                                     ; 0F76 _ 50
        push    0                                       ; 0F77 _ 6A, 00
        push    7                                       ; 0F79 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F7B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F7E _ FF. 75, 08
        call    boxfill8                                ; 0F81 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F86 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F89 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0F8C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0F8F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0F92 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0F95 _ 8B. 45, 10
        sub     eax, 26                                 ; 0F98 _ 83. E8, 1A
        sub     esp, 4                                  ; 0F9B _ 83. EC, 04
        push    ecx                                     ; 0F9E _ 51
        push    edx                                     ; 0F9F _ 52
        push    eax                                     ; 0FA0 _ 50
        push    0                                       ; 0FA1 _ 6A, 00
        push    8                                       ; 0FA3 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0FA5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FA8 _ FF. 75, 08
        call    boxfill8                                ; 0FAB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FB0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FB3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0FB6 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0FB9 _ 8B. 45, 10
        sub     eax, 24                                 ; 0FBC _ 83. E8, 18
        sub     esp, 4                                  ; 0FBF _ 83. EC, 04
        push    edx                                     ; 0FC2 _ 52
        push    59                                      ; 0FC3 _ 6A, 3B
        push    eax                                     ; 0FC5 _ 50
        push    3                                       ; 0FC6 _ 6A, 03
        push    7                                       ; 0FC8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0FCA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FCD _ FF. 75, 08
        call    boxfill8                                ; 0FD0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FD8 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0FDB _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0FDE _ 8B. 45, 10
        sub     eax, 24                                 ; 0FE1 _ 83. E8, 18
        sub     esp, 4                                  ; 0FE4 _ 83. EC, 04
        push    edx                                     ; 0FE7 _ 52
        push    2                                       ; 0FE8 _ 6A, 02
        push    eax                                     ; 0FEA _ 50
        push    2                                       ; 0FEB _ 6A, 02
        push    7                                       ; 0FED _ 6A, 07
        push    dword [ebp+0CH]                         ; 0FEF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF2 _ FF. 75, 08
        call    boxfill8                                ; 0FF5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FFD _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 1000 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1003 _ 8B. 45, 10
        sub     eax, 4                                  ; 1006 _ 83. E8, 04
        sub     esp, 4                                  ; 1009 _ 83. EC, 04
        push    edx                                     ; 100C _ 52
        push    59                                      ; 100D _ 6A, 3B
        push    eax                                     ; 100F _ 50
        push    3                                       ; 1010 _ 6A, 03
        push    15                                      ; 1012 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1014 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1017 _ FF. 75, 08
        call    boxfill8                                ; 101A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 101F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1022 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 1025 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 1028 _ 8B. 45, 10
        sub     eax, 23                                 ; 102B _ 83. E8, 17
        sub     esp, 4                                  ; 102E _ 83. EC, 04
        push    edx                                     ; 1031 _ 52
        push    59                                      ; 1032 _ 6A, 3B
        push    eax                                     ; 1034 _ 50
        push    59                                      ; 1035 _ 6A, 3B
        push    15                                      ; 1037 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 1039 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 103C _ FF. 75, 08
        call    boxfill8                                ; 103F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1044 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1047 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 104A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 104D _ 8B. 45, 10
        sub     eax, 3                                  ; 1050 _ 83. E8, 03
        sub     esp, 4                                  ; 1053 _ 83. EC, 04
        push    edx                                     ; 1056 _ 52
        push    59                                      ; 1057 _ 6A, 3B
        push    eax                                     ; 1059 _ 50
        push    2                                       ; 105A _ 6A, 02
        push    0                                       ; 105C _ 6A, 00
        push    dword [ebp+0CH]                         ; 105E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1061 _ FF. 75, 08
        call    boxfill8                                ; 1064 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1069 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 106C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 106F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 1072 _ 8B. 45, 10
        sub     eax, 24                                 ; 1075 _ 83. E8, 18
        sub     esp, 4                                  ; 1078 _ 83. EC, 04
        push    edx                                     ; 107B _ 52
        push    60                                      ; 107C _ 6A, 3C
        push    eax                                     ; 107E _ 50
        push    60                                      ; 107F _ 6A, 3C
        push    0                                       ; 1081 _ 6A, 00
        push    dword [ebp+0CH]                         ; 1083 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1086 _ FF. 75, 08
        call    boxfill8                                ; 1089 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1091 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1094 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1097 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 109A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 109D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 10A0 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 10A3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 10A6 _ 83. E8, 2F
        sub     esp, 4                                  ; 10A9 _ 83. EC, 04
        push    ebx                                     ; 10AC _ 53
        push    ecx                                     ; 10AD _ 51
        push    edx                                     ; 10AE _ 52
        push    eax                                     ; 10AF _ 50
        push    15                                      ; 10B0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 10B2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10B5 _ FF. 75, 08
        call    boxfill8                                ; 10B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10BD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10C0 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 10C3 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 10C6 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 10C9 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 10CC _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 10CF _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 10D2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 10D5 _ 83. E8, 2F
        sub     esp, 4                                  ; 10D8 _ 83. EC, 04
        push    ebx                                     ; 10DB _ 53
        push    ecx                                     ; 10DC _ 51
        push    edx                                     ; 10DD _ 52
        push    eax                                     ; 10DE _ 50
        push    15                                      ; 10DF _ 6A, 0F
        push    dword [ebp+0CH]                         ; 10E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E4 _ FF. 75, 08
        call    boxfill8                                ; 10E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10EC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10EF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 10F2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 10F5 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 10F8 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 10FB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 10FE _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1101 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1104 _ 83. E8, 2F
        sub     esp, 4                                  ; 1107 _ 83. EC, 04
        push    ebx                                     ; 110A _ 53
        push    ecx                                     ; 110B _ 51
        push    edx                                     ; 110C _ 52
        push    eax                                     ; 110D _ 50
        push    7                                       ; 110E _ 6A, 07
        push    dword [ebp+0CH]                         ; 1110 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1113 _ FF. 75, 08
        call    boxfill8                                ; 1116 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 111B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 111E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1121 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1124 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1127 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 112A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 112D _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1130 _ 8B. 45, 0C
        sub     eax, 3                                  ; 1133 _ 83. E8, 03
        sub     esp, 4                                  ; 1136 _ 83. EC, 04
        push    ebx                                     ; 1139 _ 53
        push    ecx                                     ; 113A _ 51
        push    edx                                     ; 113B _ 52
        push    eax                                     ; 113C _ 50
        push    7                                       ; 113D _ 6A, 07
        push    dword [ebp+0CH]                         ; 113F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1142 _ FF. 75, 08
        call    boxfill8                                ; 1145 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 114A _ 83. C4, 20
        nop                                             ; 114D _ 90
        mov     ebx, dword [ebp-4H]                     ; 114E _ 8B. 5D, FC
        leave                                           ; 1151 _ C9
        ret                                             ; 1152 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 1153 _ 55
        mov     ebp, esp                                ; 1154 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1156 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1159 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 115C _ A1, 00000134(d)
        add     eax, edx                                ; 1161 _ 01. D0
        mov     dword [mx], eax                         ; 1163 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 1168 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 116B _ 8B. 50, 08
        mov     eax, dword [my]                         ; 116E _ A1, 00000138(d)
        add     eax, edx                                ; 1173 _ 01. D0
        mov     dword [my], eax                         ; 1175 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 117A _ A1, 00000134(d)
        test    eax, eax                                ; 117F _ 85. C0
        jns     ?_039                                   ; 1181 _ 79, 0A
        mov     dword [mx], 0                           ; 1183 _ C7. 05, 00000134(d), 00000000
?_039:  mov     eax, dword [my]                         ; 118D _ A1, 00000138(d)
        test    eax, eax                                ; 1192 _ 85. C0
        jns     ?_040                                   ; 1194 _ 79, 0A
        mov     dword [my], 0                           ; 1196 _ C7. 05, 00000138(d), 00000000
?_040:  mov     edx, dword [xsize]                      ; 11A0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [mx]                         ; 11A6 _ A1, 00000134(d)
        cmp     edx, eax                                ; 11AB _ 39. C2
        jg  near      ?_041                                   ; 11ad _ 7f, 0b
        mov     eax, dword [xsize]                      ; 11AF _ A1, 0000013C(d)
        dec     eax                                     ; 11B4 _ 48
        mov     dword [mx], eax                         ; 11B5 _ A3, 00000134(d)
?_041:  mov     edx, dword [ysize]                      ; 11BA _ 8B. 15, 00000140(d)
        mov     eax, dword [my]                         ; 11C0 _ A1, 00000138(d)
        cmp     edx, eax                                ; 11C5 _ 39. C2
        jg  near      ?_042                                   ; 11c7 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 11C9 _ A1, 00000140(d)
        dec     eax                                     ; 11CE _ 48
        mov     dword [my], eax                         ; 11CF _ A3, 00000138(d)
?_042:  nop                                             ; 11D4 _ 90
        pop     ebp                                     ; 11D5 _ 5D
        ret                                             ; 11D6 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 11D7 _ 55
        mov     ebp, esp                                ; 11D8 _ 89. E5
        sub     esp, 24                                 ; 11DA _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 11DD _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 11E2 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 11E5 _ C6. 45, F3, 00
        call    io_sti                                  ; 11E9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 11EE _ 83. EC, 0C
        push    mouseinfo                               ; 11F1 _ 68, 0000002C(d)
        call    fifo8_get                               ; 11F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11FB _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 11FE _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 1201 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 1205 _ 83. EC, 08
        push    eax                                     ; 1208 _ 50
        push    mdec                                    ; 1209 _ 68, 00000100(d)
        call    mouse_decode                            ; 120E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1213 _ 83. C4, 10
        test    eax, eax                                ; 1216 _ 85. C0
        jz near       ?_043                                   ; 1218 _ 74, 60
        sub     esp, 4                                  ; 121A _ 83. EC, 04
        push    mdec                                    ; 121D _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 1222 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1225 _ FF. 75, 08
        call    computeMousePosition                    ; 1228 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 122D _ 83. C4, 10
        mov     edx, dword [my]                         ; 1230 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 1236 _ A1, 00000134(d)
        push    edx                                     ; 123B _ 52
        push    eax                                     ; 123C _ 50
        push    dword [ebp+10H]                         ; 123D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1240 _ FF. 75, 08
        call    sheet_slide                             ; 1243 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1248 _ 83. C4, 10
        mov     eax, dword [?_240]                      ; 124B _ A1, 0000010C(d)
        and     eax, 01H                                ; 1250 _ 83. E0, 01
        test    eax, eax                                ; 1253 _ 85. C0
        jz near       ?_043                                   ; 1255 _ 74, 23
        mov     eax, dword [my]                         ; 1257 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 125C _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 125F _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 1264 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 1267 _ A1, 00000260(d)
        push    ecx                                     ; 126C _ 51
        push    edx                                     ; 126D _ 52
        push    eax                                     ; 126E _ 50
        push    dword [ebp+8H]                          ; 126F _ FF. 75, 08
        call    sheet_slide                             ; 1272 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1277 _ 83. C4, 10
?_043:  nop                                             ; 127A _ 90
        leave                                           ; 127B _ C9
        ret                                             ; 127C _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 127D _ 55
        mov     ebp, esp                                ; 127E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1280 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 1283 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 1289 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 128C _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 1292 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 1295 _ 66: C7. 40, 06, 01E0
        nop                                             ; 129B _ 90
        pop     ebp                                     ; 129C _ 5D
        ret                                             ; 129D _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 129E _ 55
        mov     ebp, esp                                ; 129F _ 89. E5
        push    ebx                                     ; 12A1 _ 53
        sub     esp, 36                                 ; 12A2 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 12A5 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 12A8 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 12AB _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 12AE _ 89. 45, F4
        jmp     ?_045                                   ; 12B1 _ EB, 3C

?_044:  mov     eax, dword [ebp+1CH]                    ; 12B3 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 12B6 _ 8A. 00
        movzx   eax, al                                 ; 12B8 _ 0F B6. C0
        shl     eax, 4                                  ; 12BB _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 12BE _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 12C4 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 12C8 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 12CB _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 12CE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12D1 _ 8B. 00
        sub     esp, 8                                  ; 12D3 _ 83. EC, 08
        push    ebx                                     ; 12D6 _ 53
        push    ecx                                     ; 12D7 _ 51
        push    dword [ebp+14H]                         ; 12D8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 12DB _ FF. 75, 10
        push    edx                                     ; 12DE _ 52
        push    eax                                     ; 12DF _ 50
        call    showFont8                               ; 12E0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12E5 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 12E8 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 12EC _ FF. 45, 1C
?_045:  mov     eax, dword [ebp+1CH]                    ; 12EF _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 12F2 _ 8A. 00
        test    al, al                                  ; 12F4 _ 84. C0
        jnz near      ?_044                                   ; 12f6 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 12F8 _ 8B. 45, 14
        add     eax, 16                                 ; 12FB _ 83. C0, 10
        sub     esp, 8                                  ; 12FE _ 83. EC, 08
        push    eax                                     ; 1301 _ 50
        push    dword [ebp+10H]                         ; 1302 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 1305 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 1308 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 130B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 130E _ FF. 75, 08
        call    sheet_refresh                           ; 1311 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1316 _ 83. C4, 20
        nop                                             ; 1319 _ 90
        mov     ebx, dword [ebp-4H]                     ; 131A _ 8B. 5D, FC
        leave                                           ; 131D _ C9
        ret                                             ; 131E _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 131F _ 55
        mov     ebp, esp                                ; 1320 _ 89. E5
        sub     esp, 8                                  ; 1322 _ 83. EC, 08
        sub     esp, 4                                  ; 1325 _ 83. EC, 04
        push    table_rgb.1962                          ; 1328 _ 68, 00000120(d)
        push    15                                      ; 132D _ 6A, 0F
        push    0                                       ; 132F _ 6A, 00
        call    set_palette                             ; 1331 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1336 _ 83. C4, 10
        nop                                             ; 1339 _ 90
        leave                                           ; 133A _ C9
        ret                                             ; 133B _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 133C _ 55
        mov     ebp, esp                                ; 133D _ 89. E5
        sub     esp, 24                                 ; 133F _ 83. EC, 18
        call    io_load_eflags                          ; 1342 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1347 _ 89. 45, F0
        call    io_cli                                  ; 134A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 134F _ 83. EC, 08
        push    dword [ebp+8H]                          ; 1352 _ FF. 75, 08
        push    968                                     ; 1355 _ 68, 000003C8
        call    io_out8                                 ; 135A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 135F _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1362 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 1365 _ 89. 45, F4
        jmp     ?_047                                   ; 1368 _ EB, 5F

?_046:  mov     eax, dword [ebp+10H]                    ; 136A _ 8B. 45, 10
        mov     al, byte [eax]                          ; 136D _ 8A. 00
        shr     al, 2                                   ; 136F _ C0. E8, 02
        movzx   eax, al                                 ; 1372 _ 0F B6. C0
        sub     esp, 8                                  ; 1375 _ 83. EC, 08
        push    eax                                     ; 1378 _ 50
        push    969                                     ; 1379 _ 68, 000003C9
        call    io_out8                                 ; 137E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1383 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 1386 _ 8B. 45, 10
        inc     eax                                     ; 1389 _ 40
        mov     al, byte [eax]                          ; 138A _ 8A. 00
        shr     al, 2                                   ; 138C _ C0. E8, 02
        movzx   eax, al                                 ; 138F _ 0F B6. C0
        sub     esp, 8                                  ; 1392 _ 83. EC, 08
        push    eax                                     ; 1395 _ 50
        push    969                                     ; 1396 _ 68, 000003C9
        call    io_out8                                 ; 139B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13A0 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 13A3 _ 8B. 45, 10
        add     eax, 2                                  ; 13A6 _ 83. C0, 02
        mov     al, byte [eax]                          ; 13A9 _ 8A. 00
        shr     al, 2                                   ; 13AB _ C0. E8, 02
        movzx   eax, al                                 ; 13AE _ 0F B6. C0
        sub     esp, 8                                  ; 13B1 _ 83. EC, 08
        push    eax                                     ; 13B4 _ 50
        push    969                                     ; 13B5 _ 68, 000003C9
        call    io_out8                                 ; 13BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13BF _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 13C2 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 13C6 _ FF. 45, F4
?_047:  mov     eax, dword [ebp-0CH]                    ; 13C9 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 13CC _ 3B. 45, 0C
        jle near      ?_046                                   ; 13cf _ 7e, 99
        sub     esp, 12                                 ; 13D1 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 13D4 _ FF. 75, F0
        call    io_store_eflags                         ; 13D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13DC _ 83. C4, 10
        nop                                             ; 13DF _ 90
        leave                                           ; 13E0 _ C9
        ret                                             ; 13E1 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 13E2 _ 55
        mov     ebp, esp                                ; 13E3 _ 89. E5
        sub     esp, 20                                 ; 13E5 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 13E8 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 13EB _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 13EE _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 13F1 _ 89. 45, F8
        jmp     ?_051                                   ; 13F4 _ EB, 30

?_048:  mov     eax, dword [ebp+14H]                    ; 13F6 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 13F9 _ 89. 45, FC
        jmp     ?_050                                   ; 13FC _ EB, 1D

?_049:  mov     eax, dword [ebp-8H]                     ; 13FE _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 1401 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1405 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1407 _ 8B. 45, FC
        add     eax, edx                                ; 140A _ 01. D0
        mov     edx, eax                                ; 140C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 140E _ 8B. 45, 08
        add     edx, eax                                ; 1411 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1413 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1416 _ 88. 02
        inc     dword [ebp-4H]                          ; 1418 _ FF. 45, FC
?_050:  mov     eax, dword [ebp-4H]                     ; 141B _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 141E _ 3B. 45, 1C
        jle near      ?_049                                   ; 1421 _ 7e, db
        inc     dword [ebp-8H]                          ; 1423 _ FF. 45, F8
?_051:  mov     eax, dword [ebp-8H]                     ; 1426 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 1429 _ 3B. 45, 20
        jle near      ?_048                                   ; 142c _ 7e, c8
        nop                                             ; 142E _ 90
        nop                                             ; 142F _ 90
        leave                                           ; 1430 _ C9
        ret                                             ; 1431 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 1432 _ 55
        mov     ebp, esp                                ; 1433 _ 89. E5
        sub     esp, 20                                 ; 1435 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 1438 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 143B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 143E _ C7. 45, FC, 00000000
        jmp     ?_061                                   ; 1445 _ E9, 00000162

?_052:  mov     edx, dword [ebp-4H]                     ; 144A _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 144D _ 8B. 45, 1C
        add     eax, edx                                ; 1450 _ 01. D0
        mov     al, byte [eax]                          ; 1452 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 1454 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 1457 _ 80. 7D, FB, 00
        jns     ?_053                                   ; 145B _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 145D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1460 _ 8B. 45, FC
        add     eax, edx                                ; 1463 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1465 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1469 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 146B _ 8B. 45, 10
        add     eax, edx                                ; 146E _ 01. D0
        mov     edx, eax                                ; 1470 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1472 _ 8B. 45, 08
        add     edx, eax                                ; 1475 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1477 _ 8A. 45, EC
        mov     byte [edx], al                          ; 147A _ 88. 02
?_053:  movsx   eax, byte [ebp-5H]                      ; 147C _ 0F BE. 45, FB
        and     eax, 40H                                ; 1480 _ 83. E0, 40
        test    eax, eax                                ; 1483 _ 85. C0
        jz near       ?_054                                   ; 1485 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1487 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 148A _ 8B. 45, FC
        add     eax, edx                                ; 148D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 148F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1493 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1495 _ 8B. 45, 10
        add     eax, edx                                ; 1498 _ 01. D0
        lea     edx, [eax+1H]                           ; 149A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 149D _ 8B. 45, 08
        add     edx, eax                                ; 14A0 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14A2 _ 8A. 45, EC
        mov     byte [edx], al                          ; 14A5 _ 88. 02
?_054:  movsx   eax, byte [ebp-5H]                      ; 14A7 _ 0F BE. 45, FB
        and     eax, 20H                                ; 14AB _ 83. E0, 20
        test    eax, eax                                ; 14AE _ 85. C0
        jz near       ?_055                                   ; 14b0 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14B2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14B5 _ 8B. 45, FC
        add     eax, edx                                ; 14B8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14BA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 14BE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14C0 _ 8B. 45, 10
        add     eax, edx                                ; 14C3 _ 01. D0
        lea     edx, [eax+2H]                           ; 14C5 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 14C8 _ 8B. 45, 08
        add     edx, eax                                ; 14CB _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14CD _ 8A. 45, EC
        mov     byte [edx], al                          ; 14D0 _ 88. 02
?_055:  movsx   eax, byte [ebp-5H]                      ; 14D2 _ 0F BE. 45, FB
        and     eax, 10H                                ; 14D6 _ 83. E0, 10
        test    eax, eax                                ; 14D9 _ 85. C0
        jz near       ?_056                                   ; 14db _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14DD _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14E0 _ 8B. 45, FC
        add     eax, edx                                ; 14E3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14E5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 14E9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14EB _ 8B. 45, 10
        add     eax, edx                                ; 14EE _ 01. D0
        lea     edx, [eax+3H]                           ; 14F0 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 14F3 _ 8B. 45, 08
        add     edx, eax                                ; 14F6 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14F8 _ 8A. 45, EC
        mov     byte [edx], al                          ; 14FB _ 88. 02
?_056:  movsx   eax, byte [ebp-5H]                      ; 14FD _ 0F BE. 45, FB
        and     eax, 08H                                ; 1501 _ 83. E0, 08
        test    eax, eax                                ; 1504 _ 85. C0
        jz near       ?_057                                   ; 1506 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1508 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 150B _ 8B. 45, FC
        add     eax, edx                                ; 150E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1510 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1514 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1516 _ 8B. 45, 10
        add     eax, edx                                ; 1519 _ 01. D0
        lea     edx, [eax+4H]                           ; 151B _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 151E _ 8B. 45, 08
        add     edx, eax                                ; 1521 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1523 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1526 _ 88. 02
?_057:  movsx   eax, byte [ebp-5H]                      ; 1528 _ 0F BE. 45, FB
        and     eax, 04H                                ; 152C _ 83. E0, 04
        test    eax, eax                                ; 152F _ 85. C0
        jz near       ?_058                                   ; 1531 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1533 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1536 _ 8B. 45, FC
        add     eax, edx                                ; 1539 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 153B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 153F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1541 _ 8B. 45, 10
        add     eax, edx                                ; 1544 _ 01. D0
        lea     edx, [eax+5H]                           ; 1546 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1549 _ 8B. 45, 08
        add     edx, eax                                ; 154C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 154E _ 8A. 45, EC
        mov     byte [edx], al                          ; 1551 _ 88. 02
?_058:  movsx   eax, byte [ebp-5H]                      ; 1553 _ 0F BE. 45, FB
        and     eax, 02H                                ; 1557 _ 83. E0, 02
        test    eax, eax                                ; 155A _ 85. C0
        jz near       ?_059                                   ; 155c _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 155E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1561 _ 8B. 45, FC
        add     eax, edx                                ; 1564 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1566 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 156A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 156C _ 8B. 45, 10
        add     eax, edx                                ; 156F _ 01. D0
        lea     edx, [eax+6H]                           ; 1571 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1574 _ 8B. 45, 08
        add     edx, eax                                ; 1577 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1579 _ 8A. 45, EC
        mov     byte [edx], al                          ; 157C _ 88. 02
?_059:  movsx   eax, byte [ebp-5H]                      ; 157E _ 0F BE. 45, FB
        and     eax, 01H                                ; 1582 _ 83. E0, 01
        test    eax, eax                                ; 1585 _ 85. C0
        jz near       ?_060                                   ; 1587 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1589 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 158C _ 8B. 45, FC
        add     eax, edx                                ; 158F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1591 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1595 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1597 _ 8B. 45, 10
        add     eax, edx                                ; 159A _ 01. D0
        lea     edx, [eax+7H]                           ; 159C _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 159F _ 8B. 45, 08
        add     edx, eax                                ; 15A2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 15A4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 15A7 _ 88. 02
?_060:  inc     dword [ebp-4H]                          ; 15A9 _ FF. 45, FC
?_061:  cmp     dword [ebp-4H], 15                      ; 15AC _ 83. 7D, FC, 0F
        jle near      ?_052                                   ; 15b0 _ 0f 8e, fffffe94
        nop                                             ; 15B6 _ 90
        nop                                             ; 15B7 _ 90
        leave                                           ; 15B8 _ C9
        ret                                             ; 15B9 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 15BA _ 55
        mov     ebp, esp                                ; 15BB _ 89. E5
        sub     esp, 20                                 ; 15BD _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 15C0 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 15C3 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 15C6 _ C7. 45, F8, 00000000
        jmp     ?_068                                   ; 15CD _ E9, 000000AB

?_062:  mov     dword [ebp-4H], 0                       ; 15D2 _ C7. 45, FC, 00000000
        jmp     ?_067                                   ; 15D9 _ E9, 00000092

?_063:  mov     eax, dword [ebp-8H]                     ; 15DE _ 8B. 45, F8
        shl     eax, 4                                  ; 15E1 _ C1. E0, 04
        mov     edx, eax                                ; 15E4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15E6 _ 8B. 45, FC
        add     eax, edx                                ; 15E9 _ 01. D0
        add     eax, cursor.2009                        ; 15EB _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 15F0 _ 8A. 00
        cmp     al, 42                                  ; 15F2 _ 3C, 2A
        jnz near      ?_064                                   ; 15f4 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 15F6 _ 8B. 45, F8
        shl     eax, 4                                  ; 15F9 _ C1. E0, 04
        mov     edx, eax                                ; 15FC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15FE _ 8B. 45, FC
        add     eax, edx                                ; 1601 _ 01. D0
        mov     edx, eax                                ; 1603 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1605 _ 8B. 45, 08
        add     eax, edx                                ; 1608 _ 01. D0
        mov     byte [eax], 0                           ; 160A _ C6. 00, 00
?_064:  mov     eax, dword [ebp-8H]                     ; 160D _ 8B. 45, F8
        shl     eax, 4                                  ; 1610 _ C1. E0, 04
        mov     edx, eax                                ; 1613 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1615 _ 8B. 45, FC
        add     eax, edx                                ; 1618 _ 01. D0
        add     eax, cursor.2009                        ; 161A _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 161F _ 8A. 00
        cmp     al, 79                                  ; 1621 _ 3C, 4F
        jnz near      ?_065                                   ; 1623 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1625 _ 8B. 45, F8
        shl     eax, 4                                  ; 1628 _ C1. E0, 04
        mov     edx, eax                                ; 162B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 162D _ 8B. 45, FC
        add     eax, edx                                ; 1630 _ 01. D0
        mov     edx, eax                                ; 1632 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1634 _ 8B. 45, 08
        add     eax, edx                                ; 1637 _ 01. D0
        mov     byte [eax], 7                           ; 1639 _ C6. 00, 07
?_065:  mov     eax, dword [ebp-8H]                     ; 163C _ 8B. 45, F8
        shl     eax, 4                                  ; 163F _ C1. E0, 04
        mov     edx, eax                                ; 1642 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1644 _ 8B. 45, FC
        add     eax, edx                                ; 1647 _ 01. D0
        add     eax, cursor.2009                        ; 1649 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 164E _ 8A. 00
        cmp     al, 46                                  ; 1650 _ 3C, 2E
        jnz near      ?_066                                   ; 1652 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1654 _ 8B. 45, F8
        shl     eax, 4                                  ; 1657 _ C1. E0, 04
        mov     edx, eax                                ; 165A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 165C _ 8B. 45, FC
        add     eax, edx                                ; 165F _ 01. D0
        mov     edx, eax                                ; 1661 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1663 _ 8B. 45, 08
        add     edx, eax                                ; 1666 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1668 _ 8A. 45, EC
        mov     byte [edx], al                          ; 166B _ 88. 02
?_066:  inc     dword [ebp-4H]                          ; 166D _ FF. 45, FC
?_067:  cmp     dword [ebp-4H], 15                      ; 1670 _ 83. 7D, FC, 0F
        jle near      ?_063                                   ; 1674 _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 167A _ FF. 45, F8
?_068:  cmp     dword [ebp-8H], 15                      ; 167D _ 83. 7D, F8, 0F
        jle near      ?_062                                   ; 1681 _ 0f 8e, ffffff4b
        nop                                             ; 1687 _ 90
        nop                                             ; 1688 _ 90
        leave                                           ; 1689 _ C9
        ret                                             ; 168A _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 168B _ 55
        mov     ebp, esp                                ; 168C _ 89. E5
        push    ebx                                     ; 168E _ 53
        sub     esp, 16                                 ; 168F _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1692 _ C7. 45, F4, 00000000
        jmp     ?_072                                   ; 1699 _ EB, 4D

?_069:  mov     dword [ebp-8H], 0                       ; 169B _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 16A2 _ EB, 39

?_070:  mov     eax, dword [ebp-0CH]                    ; 16A4 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 16A7 _ 0F AF. 45, 24
        mov     edx, eax                                ; 16AB _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 16AD _ 8B. 45, F8
        add     eax, edx                                ; 16B0 _ 01. D0
        mov     edx, eax                                ; 16B2 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 16B4 _ 8B. 45, 20
        add     eax, edx                                ; 16B7 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 16B9 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 16BC _ 8B. 55, F4
        add     edx, ecx                                ; 16BF _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 16C1 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 16C5 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 16C8 _ 8B. 4D, F8
        add     ecx, ebx                                ; 16CB _ 01. D9
        add     edx, ecx                                ; 16CD _ 01. CA
        mov     ecx, edx                                ; 16CF _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 16D1 _ 8B. 55, 08
        add     edx, ecx                                ; 16D4 _ 01. CA
        mov     al, byte [eax]                          ; 16D6 _ 8A. 00
        mov     byte [edx], al                          ; 16D8 _ 88. 02
        inc     dword [ebp-8H]                          ; 16DA _ FF. 45, F8
?_071:  mov     eax, dword [ebp-8H]                     ; 16DD _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 16E0 _ 3B. 45, 10
        jl      ?_070                                   ; 16E3 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 16E5 _ FF. 45, F4
?_072:  mov     eax, dword [ebp-0CH]                    ; 16E8 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 16EB _ 3B. 45, 14
        jl      ?_069                                   ; 16EE _ 7C, AB
        nop                                             ; 16F0 _ 90
        nop                                             ; 16F1 _ 90
        add     esp, 16                                 ; 16F2 _ 83. C4, 10
        pop     ebx                                     ; 16F5 _ 5B
        pop     ebp                                     ; 16F6 _ 5D
        ret                                             ; 16F7 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 16F8 _ 55
        mov     ebp, esp                                ; 16F9 _ 89. E5
        sub     esp, 24                                 ; 16FB _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 16FE _ A1, 00000008(d)
        mov     dword [ebp-0CH], eax                    ; 1703 _ 89. 45, F4
        mov     eax, dword [?_237]                      ; 1706 _ A1, 0000000C(d)
        cwde                                            ; 170B _ 98
        mov     dword [ebp-10H], eax                    ; 170C _ 89. 45, F0
        mov     ax, word [?_238]                        ; 170F _ 66: A1, 0000000E(d)
        cwde                                            ; 1715 _ 98
        mov     dword [ebp-14H], eax                    ; 1716 _ 89. 45, EC
        sub     esp, 8                                  ; 1719 _ 83. EC, 08
        push    32                                      ; 171C _ 6A, 20
        push    32                                      ; 171E _ 6A, 20
        call    io_out8                                 ; 1720 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1725 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 1728 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 172C _ 83. EC, 0C
        push    96                                      ; 172F _ 6A, 60
        call    io_in8                                  ; 1731 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1736 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 1739 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 173C _ 0F B6. 45, EB
        sub     esp, 8                                  ; 1740 _ 83. EC, 08
        push    eax                                     ; 1743 _ 50
        push    keyinfo                                 ; 1744 _ 68, 00000010(d)
        call    fifo8_put                               ; 1749 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 174E _ 83. C4, 10
        nop                                             ; 1751 _ 90
        leave                                           ; 1752 _ C9
        ret                                             ; 1753 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1754 _ 55
        mov     ebp, esp                                ; 1755 _ 89. E5
        sub     esp, 4                                  ; 1757 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 175A _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 175D _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1760 _ 80. 7D, FC, 09
        jle near      ?_073                                   ; 1764 _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 1766 _ 8A. 45, FC
        add     eax, 55                                 ; 1769 _ 83. C0, 37
        jmp     ?_074                                   ; 176C _ EB, 06

?_073:  mov     al, byte [ebp-4H]                       ; 176E _ 8A. 45, FC
        add     eax, 48                                 ; 1771 _ 83. C0, 30
?_074:  leave                                           ; 1774 _ C9
        ret                                             ; 1775 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1776 _ 55
        mov     ebp, esp                                ; 1777 _ 89. E5
        sub     esp, 20                                 ; 1779 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 177F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1782 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1789 _ 8A. 45, EC
        and     eax, 0FH                                ; 178C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 178F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1792 _ 0F BE. 45, FB
        push    eax                                     ; 1796 _ 50
        call    charToHexVal                            ; 1797 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 179C _ 83. C4, 04
        mov     byte [?_236], al                        ; 179F _ A2, 00000103(d)
        mov     al, byte [ebp-14H]                      ; 17A4 _ 8A. 45, EC
        shr     al, 4                                   ; 17A7 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 17AA _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 17AD _ 8A. 45, EC
        movsx   eax, al                                 ; 17B0 _ 0F BE. C0
        push    eax                                     ; 17B3 _ 50
        call    charToHexVal                            ; 17B4 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 17B9 _ 83. C4, 04
        mov     byte [?_235], al                        ; 17BC _ A2, 00000102(d)
        mov     eax, keyval                             ; 17C1 _ B8, 00000100(d)
        leave                                           ; 17C6 _ C9
        ret                                             ; 17C7 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 17C8 _ 55
        mov     ebp, esp                                ; 17C9 _ 89. E5
        sub     esp, 16                                 ; 17CB _ 83. EC, 10
        mov     byte [str.2057], 48                     ; 17CE _ C6. 05, 00000374(d), 30
        mov     byte [?_241], 88                        ; 17D5 _ C6. 05, 00000375(d), 58
        mov     byte [?_242], 0                         ; 17DC _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 17E3 _ C7. 45, FC, 00000002
        jmp     ?_076                                   ; 17EA _ EB, 0E

?_075:  mov     eax, dword [ebp-4H]                     ; 17EC _ 8B. 45, FC
        add     eax, str.2057                           ; 17EF _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 17F4 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 17F7 _ FF. 45, FC
?_076:  cmp     dword [ebp-4H], 9                       ; 17FA _ 83. 7D, FC, 09
        jle near      ?_075                                   ; 17fe _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 1800 _ C7. 45, F8, 00000009
        jmp     ?_080                                   ; 1807 _ EB, 41

?_077:  mov     eax, dword [ebp+8H]                     ; 1809 _ 8B. 45, 08
        and     eax, 0FH                                ; 180C _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 180F _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1812 _ 8B. 45, 08
        shr     eax, 4                                  ; 1815 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1818 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 181B _ 83. 7D, F4, 09
        jle near      ?_078                                   ; 181f _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 1821 _ 8B. 45, F4
        add     eax, 55                                 ; 1824 _ 83. C0, 37
        mov     dl, al                                  ; 1827 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1829 _ 8B. 45, F8
        add     eax, str.2057                           ; 182C _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 1831 _ 88. 10
        jmp     ?_079                                   ; 1833 _ EB, 12

?_078:  mov     eax, dword [ebp-0CH]                    ; 1835 _ 8B. 45, F4
        add     eax, 48                                 ; 1838 _ 83. C0, 30
        mov     dl, al                                  ; 183B _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 183D _ 8B. 45, F8
        add     eax, str.2057                           ; 1840 _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 1845 _ 88. 10
?_079:  dec     dword [ebp-8H]                          ; 1847 _ FF. 4D, F8
?_080:  cmp     dword [ebp-8H], 1                       ; 184A _ 83. 7D, F8, 01
        jle near      ?_081                                   ; 184e _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 1850 _ 83. 7D, 08, 00
        jnz near      ?_077                                   ; 1854 _ 75, b3
?_081:  mov     eax, str.2057                           ; 1856 _ B8, 00000374(d)
        leave                                           ; 185B _ C9
        ret                                             ; 185C _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 185D _ 55
        mov     ebp, esp                                ; 185E _ 89. E5
        sub     esp, 8                                  ; 1860 _ 83. EC, 08
?_082:  sub     esp, 12                                 ; 1863 _ 83. EC, 0C
        push    100                                     ; 1866 _ 6A, 64
        call    io_in8                                  ; 1868 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 186D _ 83. C4, 10
        and     eax, 02H                                ; 1870 _ 83. E0, 02
        test    eax, eax                                ; 1873 _ 85. C0
        jz near       ?_083                                   ; 1875 _ 74, 02
        jmp     ?_082                                   ; 1877 _ EB, EA

?_083:  nop                                             ; 1879 _ 90
        nop                                             ; 187A _ 90
        leave                                           ; 187B _ C9
        ret                                             ; 187C _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 187D _ 55
        mov     ebp, esp                                ; 187E _ 89. E5
        sub     esp, 8                                  ; 1880 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1883 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1888 _ 83. EC, 08
        push    96                                      ; 188B _ 6A, 60
        push    100                                     ; 188D _ 6A, 64
        call    io_out8                                 ; 188F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1894 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1897 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 189C _ 83. EC, 08
        push    71                                      ; 189F _ 6A, 47
        push    96                                      ; 18A1 _ 6A, 60
        call    io_out8                                 ; 18A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18A8 _ 83. C4, 10
        nop                                             ; 18AB _ 90
        leave                                           ; 18AC _ C9
        ret                                             ; 18AD _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 18AE _ 55
        mov     ebp, esp                                ; 18AF _ 89. E5
        sub     esp, 8                                  ; 18B1 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 18B4 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 18B9 _ 83. EC, 08
        push    212                                     ; 18BC _ 68, 000000D4
        push    100                                     ; 18C1 _ 6A, 64
        call    io_out8                                 ; 18C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18C8 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 18CB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 18D0 _ 83. EC, 08
        push    244                                     ; 18D3 _ 68, 000000F4
        push    96                                      ; 18D8 _ 6A, 60
        call    io_out8                                 ; 18DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18DF _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 18E2 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 18E5 _ C6. 40, 03, 00
        nop                                             ; 18E9 _ 90
        leave                                           ; 18EA _ C9
        ret                                             ; 18EB _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 18EC _ 55
        mov     ebp, esp                                ; 18ED _ 89. E5
        sub     esp, 24                                 ; 18EF _ 83. EC, 18
        sub     esp, 8                                  ; 18F2 _ 83. EC, 08
        push    32                                      ; 18F5 _ 6A, 20
        push    160                                     ; 18F7 _ 68, 000000A0
        call    io_out8                                 ; 18FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1901 _ 83. C4, 10
        sub     esp, 8                                  ; 1904 _ 83. EC, 08
        push    32                                      ; 1907 _ 6A, 20
        push    32                                      ; 1909 _ 6A, 20
        call    io_out8                                 ; 190B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1910 _ 83. C4, 10
        sub     esp, 12                                 ; 1913 _ 83. EC, 0C
        push    96                                      ; 1916 _ 6A, 60
        call    io_in8                                  ; 1918 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 191D _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 1920 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1923 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 1927 _ 83. EC, 08
        push    eax                                     ; 192A _ 50
        push    mouseinfo                               ; 192B _ 68, 0000002C(d)
        call    fifo8_put                               ; 1930 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1935 _ 83. C4, 10
        nop                                             ; 1938 _ 90
        leave                                           ; 1939 _ C9
        ret                                             ; 193A _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 193B _ 55
        mov     ebp, esp                                ; 193C _ 89. E5
        sub     esp, 4                                  ; 193E _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1941 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1944 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1947 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 194A _ 8A. 40, 03
        test    al, al                                  ; 194D _ 84. C0
        jnz near      ?_085                                   ; 194f _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1951 _ 80. 7D, FC, FA
        jnz near      ?_084                                   ; 1955 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1957 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 195A _ C6. 40, 03, 01
?_084:  mov     eax, 0                                  ; 195E _ B8, 00000000
        jmp     ?_092                                   ; 1963 _ E9, 00000104

?_085:  mov     eax, dword [ebp+8H]                     ; 1968 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 196B _ 8A. 40, 03
        cmp     al, 1                                   ; 196E _ 3C, 01
        jnz near      ?_087                                   ; 1970 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 1972 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1976 _ 25, 000000C8
        cmp     eax, 8                                  ; 197B _ 83. F8, 08
        jnz near      ?_086                                   ; 197e _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 1980 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1983 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 1986 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1988 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 198B _ C6. 40, 03, 02
?_086:  mov     eax, 0                                  ; 198F _ B8, 00000000
        jmp     ?_092                                   ; 1994 _ E9, 000000D3

?_087:  mov     eax, dword [ebp+8H]                     ; 1999 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 199C _ 8A. 40, 03
        cmp     al, 2                                   ; 199F _ 3C, 02
        jnz near      ?_088                                   ; 19a1 _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 19A3 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 19A6 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 19A9 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 19AC _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 19AF _ C6. 40, 03, 03
        mov     eax, 0                                  ; 19B3 _ B8, 00000000
        jmp     ?_092                                   ; 19B8 _ E9, 000000AF

?_088:  mov     eax, dword [ebp+8H]                     ; 19BD _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 19C0 _ 8A. 40, 03
        cmp     al, 3                                   ; 19C3 _ 3C, 03
        jne near      ?_091                                   ; 19c5 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 19CB _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 19CE _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 19D1 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 19D4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 19D7 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 19DB _ 8B. 45, 08
        mov     al, byte [eax]                          ; 19DE _ 8A. 00
        movzx   eax, al                                 ; 19E0 _ 0F B6. C0
        and     eax, 07H                                ; 19E3 _ 83. E0, 07
        mov     edx, eax                                ; 19E6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19E8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 19EB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 19EE _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 19F1 _ 8A. 40, 01
        movzx   edx, al                                 ; 19F4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 19F7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 19FA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19FD _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 1A00 _ 8A. 40, 02
        movzx   edx, al                                 ; 1A03 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1A06 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1A09 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A0C _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1A0F _ 8A. 00
        movzx   eax, al                                 ; 1A11 _ 0F B6. C0
        and     eax, 10H                                ; 1A14 _ 83. E0, 10
        test    eax, eax                                ; 1A17 _ 85. C0
        jz near       ?_089                                   ; 1a19 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1A1B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A1E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1A21 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1A26 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1A28 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1A2B _ 89. 50, 04
?_089:  mov     eax, dword [ebp+8H]                     ; 1A2E _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1A31 _ 8A. 00
        movzx   eax, al                                 ; 1A33 _ 0F B6. C0
        and     eax, 20H                                ; 1A36 _ 83. E0, 20
        test    eax, eax                                ; 1A39 _ 85. C0
        jz near       ?_090                                   ; 1a3b _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1A3D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1A40 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1A43 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1A48 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1A4A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1A4D _ 89. 50, 08
?_090:  mov     eax, dword [ebp+8H]                     ; 1A50 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1A53 _ 8B. 40, 08
        neg     eax                                     ; 1A56 _ F7. D8
        mov     edx, eax                                ; 1A58 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1A5A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1A5D _ 89. 50, 08
        mov     eax, 1                                  ; 1A60 _ B8, 00000001
        jmp     ?_092                                   ; 1A65 _ EB, 05

?_091:  mov     eax, 4294967295                         ; 1A67 _ B8, FFFFFFFF
?_092:  leave                                           ; 1A6C _ C9
        ret                                             ; 1A6D _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1A6E _ 55
        mov     ebp, esp                                ; 1A6F _ 89. E5
        sub     esp, 40                                 ; 1A71 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 1A74 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1A7B _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1A82 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1A89 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 1A90 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 1A96 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A99 _ 8B. 00
        sub     esp, 4                                  ; 1A9B _ 83. EC, 04
        push    edx                                     ; 1A9E _ 52
        push    dword [ebp+1CH]                         ; 1A9F _ FF. 75, 1C
        push    eax                                     ; 1AA2 _ 50
        call    init_screen8                            ; 1AA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AA8 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1AAB _ 8B. 45, 20
        movsx   eax, al                                 ; 1AAE _ 0F BE. C0
        sub     esp, 8                                  ; 1AB1 _ 83. EC, 08
        push    ?_231                                   ; 1AB4 _ 68, 0000002F(d)
        push    eax                                     ; 1AB9 _ 50
        push    dword [ebp-10H]                         ; 1ABA _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1ABD _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1AC0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AC3 _ FF. 75, 08
        call    showString                              ; 1AC6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1ACB _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1ACE _ 8B. 45, 18
        sub     esp, 12                                 ; 1AD1 _ 83. EC, 0C
        push    eax                                     ; 1AD4 _ 50
        call    intToHexStr                             ; 1AD5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ADA _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1ADD _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1AE0 _ 8B. 45, 20
        movsx   eax, al                                 ; 1AE3 _ 0F BE. C0
        sub     esp, 8                                  ; 1AE6 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1AE9 _ FF. 75, E4
        push    eax                                     ; 1AEC _ 50
        push    dword [ebp-10H]                         ; 1AED _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1AF0 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1AF3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AF6 _ FF. 75, 08
        call    showString                              ; 1AF9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AFE _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1B01 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1B05 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B08 _ 0F BE. C0
        sub     esp, 8                                  ; 1B0B _ 83. EC, 08
        push    ?_232                                   ; 1B0E _ 68, 00000039(d)
        push    eax                                     ; 1B13 _ 50
        push    dword [ebp-10H]                         ; 1B14 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1B17 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1B1A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B1D _ FF. 75, 08
        call    showString                              ; 1B20 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B25 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B28 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1B2B _ 8B. 00
        sub     esp, 12                                 ; 1B2D _ 83. EC, 0C
        push    eax                                     ; 1B30 _ 50
        call    intToHexStr                             ; 1B31 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B36 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1B39 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1B3C _ 8B. 45, 20
        movsx   eax, al                                 ; 1B3F _ 0F BE. C0
        sub     esp, 8                                  ; 1B42 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1B45 _ FF. 75, E0
        push    eax                                     ; 1B48 _ 50
        push    dword [ebp-10H]                         ; 1B49 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1B4C _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1B4F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B52 _ FF. 75, 08
        call    showString                              ; 1B55 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B5A _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1B5D _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1B61 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B64 _ 0F BE. C0
        sub     esp, 8                                  ; 1B67 _ 83. EC, 08
        push    ?_233                                   ; 1B6A _ 68, 00000045(d)
        push    eax                                     ; 1B6F _ 50
        push    dword [ebp-10H]                         ; 1B70 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1B73 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1B76 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B79 _ FF. 75, 08
        call    showString                              ; 1B7C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B81 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B84 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1B87 _ 8B. 40, 04
        sub     esp, 12                                 ; 1B8A _ 83. EC, 0C
        push    eax                                     ; 1B8D _ 50
        call    intToHexStr                             ; 1B8E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B93 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1B96 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1B99 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B9C _ 0F BE. C0
        sub     esp, 8                                  ; 1B9F _ 83. EC, 08
        push    dword [ebp-24H]                         ; 1BA2 _ FF. 75, DC
        push    eax                                     ; 1BA5 _ 50
        push    dword [ebp-10H]                         ; 1BA6 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1BA9 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1BAC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1BAF _ FF. 75, 08
        call    showString                              ; 1BB2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BB7 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1BBA _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1BBE _ 8B. 45, 20
        movsx   eax, al                                 ; 1BC1 _ 0F BE. C0
        sub     esp, 8                                  ; 1BC4 _ 83. EC, 08
        push    ?_234                                   ; 1BC7 _ 68, 00000051(d)
        push    eax                                     ; 1BCC _ 50
        push    dword [ebp-10H]                         ; 1BCD _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1BD0 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1BD3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1BD6 _ FF. 75, 08
        call    showString                              ; 1BD9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BDE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1BE1 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1BE4 _ 8B. 40, 08
        sub     esp, 12                                 ; 1BE7 _ 83. EC, 0C
        push    eax                                     ; 1BEA _ 50
        call    intToHexStr                             ; 1BEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BF0 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1BF3 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1BF6 _ 8B. 45, 20
        movsx   eax, al                                 ; 1BF9 _ 0F BE. C0
        sub     esp, 8                                  ; 1BFC _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1BFF _ FF. 75, D8
        push    eax                                     ; 1C02 _ 50
        push    dword [ebp-10H]                         ; 1C03 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1C06 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1C09 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1C0C _ FF. 75, 08
        call    showString                              ; 1C0F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C14 _ 83. C4, 20
        nop                                             ; 1C17 _ 90
        leave                                           ; 1C18 _ C9
        ret                                             ; 1C19 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1C1A _ 55
        mov     ebp, esp                                ; 1C1B _ 89. E5
        sub     esp, 24                                 ; 1C1D _ 83. EC, 18
        sub     esp, 12                                 ; 1C20 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1C23 _ FF. 75, 08
        call    sheet_alloc                             ; 1C26 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C2B _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1C2E _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1C31 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1C36 _ 83. EC, 08
        push    10880                                   ; 1C39 _ 68, 00002A80
        push    eax                                     ; 1C3E _ 50
        call    memman_alloc_4k                         ; 1C3F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C44 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1C47 _ 89. 45, F0
        sub     esp, 12                                 ; 1C4A _ 83. EC, 0C
        push    -1                                      ; 1C4D _ 6A, FF
        push    68                                      ; 1C4F _ 6A, 44
        push    160                                     ; 1C51 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1C56 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1C59 _ FF. 75, F4
        call    sheet_setbuf                            ; 1C5C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C61 _ 83. C4, 20
        push    1                                       ; 1C64 _ 6A, 01
        push    dword [ebp+0CH]                         ; 1C66 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1C69 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1C6C _ FF. 75, 08
        call    make_window8                            ; 1C6F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C74 _ 83. C4, 10
        sub     esp, 8                                  ; 1C77 _ 83. EC, 08
        push    7                                       ; 1C7A _ 6A, 07
        push    16                                      ; 1C7C _ 6A, 10
        push    144                                     ; 1C7E _ 68, 00000090
        push    28                                      ; 1C83 _ 6A, 1C
        push    8                                       ; 1C85 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C87 _ FF. 75, F4
        call    make_textbox8                           ; 1C8A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C8F _ 83. C4, 20
        push    172                                     ; 1C92 _ 68, 000000AC
        push    260                                     ; 1C97 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1C9C _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1C9F _ FF. 75, 08
        call    sheet_slide                             ; 1CA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CA7 _ 83. C4, 10
        sub     esp, 4                                  ; 1CAA _ 83. EC, 04
        push    2                                       ; 1CAD _ 6A, 02
        push    dword [ebp-0CH]                         ; 1CAF _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1CB2 _ FF. 75, 08
        call    sheet_updown                            ; 1CB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CBA _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1CBD _ 8B. 45, F4
        leave                                           ; 1CC0 _ C9
        ret                                             ; 1CC1 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1CC2 _ 55
        mov     ebp, esp                                ; 1CC3 _ 89. E5
        push    ebx                                     ; 1CC5 _ 53
        sub     esp, 36                                 ; 1CC6 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1CC9 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1CCC _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1CCF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CD2 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1CD5 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1CD8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1CDB _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1CDE _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1CE1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1CE4 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CE7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CEA _ 8B. 00
        push    0                                       ; 1CEC _ 6A, 00
        push    edx                                     ; 1CEE _ 52
        push    0                                       ; 1CEF _ 6A, 00
        push    0                                       ; 1CF1 _ 6A, 00
        push    8                                       ; 1CF3 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1CF5 _ FF. 75, F4
        push    eax                                     ; 1CF8 _ 50
        call    boxfill8                                ; 1CF9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CFE _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1D01 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D04 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D07 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D0A _ 8B. 00
        push    1                                       ; 1D0C _ 6A, 01
        push    edx                                     ; 1D0E _ 52
        push    1                                       ; 1D0F _ 6A, 01
        push    1                                       ; 1D11 _ 6A, 01
        push    7                                       ; 1D13 _ 6A, 07
        push    dword [ebp-0CH]                         ; 1D15 _ FF. 75, F4
        push    eax                                     ; 1D18 _ 50
        call    boxfill8                                ; 1D19 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D1E _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D21 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D24 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D27 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D2A _ 8B. 00
        push    edx                                     ; 1D2C _ 52
        push    0                                       ; 1D2D _ 6A, 00
        push    0                                       ; 1D2F _ 6A, 00
        push    0                                       ; 1D31 _ 6A, 00
        push    8                                       ; 1D33 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1D35 _ FF. 75, F4
        push    eax                                     ; 1D38 _ 50
        call    boxfill8                                ; 1D39 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D3E _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D41 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D44 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D47 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D4A _ 8B. 00
        push    edx                                     ; 1D4C _ 52
        push    1                                       ; 1D4D _ 6A, 01
        push    1                                       ; 1D4F _ 6A, 01
        push    1                                       ; 1D51 _ 6A, 01
        push    7                                       ; 1D53 _ 6A, 07
        push    dword [ebp-0CH]                         ; 1D55 _ FF. 75, F4
        push    eax                                     ; 1D58 _ 50
        call    boxfill8                                ; 1D59 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D5E _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D61 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1D64 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D67 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D6A _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D6D _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D70 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D73 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D76 _ 8B. 00
        push    ebx                                     ; 1D78 _ 53
        push    ecx                                     ; 1D79 _ 51
        push    1                                       ; 1D7A _ 6A, 01
        push    edx                                     ; 1D7C _ 52
        push    15                                      ; 1D7D _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1D7F _ FF. 75, F4
        push    eax                                     ; 1D82 _ 50
        call    boxfill8                                ; 1D83 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D88 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D8B _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D8E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D91 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D94 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D97 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D9A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D9D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DA0 _ 8B. 00
        push    ebx                                     ; 1DA2 _ 53
        push    ecx                                     ; 1DA3 _ 51
        push    0                                       ; 1DA4 _ 6A, 00
        push    edx                                     ; 1DA6 _ 52
        push    0                                       ; 1DA7 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1DA9 _ FF. 75, F4
        push    eax                                     ; 1DAC _ 50
        call    boxfill8                                ; 1DAD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DB2 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1DB5 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1DB8 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1DBB _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1DBE _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1DC1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DC4 _ 8B. 00
        push    ecx                                     ; 1DC6 _ 51
        push    edx                                     ; 1DC7 _ 52
        push    2                                       ; 1DC8 _ 6A, 02
        push    2                                       ; 1DCA _ 6A, 02
        push    8                                       ; 1DCC _ 6A, 08
        push    dword [ebp-0CH]                         ; 1DCE _ FF. 75, F4
        push    eax                                     ; 1DD1 _ 50
        call    boxfill8                                ; 1DD2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DD7 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1DDA _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1DDD _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1DE0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DE3 _ 8B. 00
        push    20                                      ; 1DE5 _ 6A, 14
        push    edx                                     ; 1DE7 _ 52
        push    3                                       ; 1DE8 _ 6A, 03
        push    3                                       ; 1DEA _ 6A, 03
        push    12                                      ; 1DEC _ 6A, 0C
        push    dword [ebp-0CH]                         ; 1DEE _ FF. 75, F4
        push    eax                                     ; 1DF1 _ 50
        call    boxfill8                                ; 1DF2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DF7 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1DFA _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1DFD _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1E00 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1E03 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1E06 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1E09 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1E0C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E0F _ 8B. 00
        push    ebx                                     ; 1E11 _ 53
        push    ecx                                     ; 1E12 _ 51
        push    edx                                     ; 1E13 _ 52
        push    1                                       ; 1E14 _ 6A, 01
        push    15                                      ; 1E16 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1E18 _ FF. 75, F4
        push    eax                                     ; 1E1B _ 50
        call    boxfill8                                ; 1E1C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E21 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1E24 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1E27 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E2A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1E2D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1E30 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1E33 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1E36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E39 _ 8B. 00
        push    ebx                                     ; 1E3B _ 53
        push    ecx                                     ; 1E3C _ 51
        push    edx                                     ; 1E3D _ 52
        push    0                                       ; 1E3E _ 6A, 00
        push    0                                       ; 1E40 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1E42 _ FF. 75, F4
        push    eax                                     ; 1E45 _ 50
        call    boxfill8                                ; 1E46 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E4B _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 1E4E _ 0F BE. 45, E4
        push    eax                                     ; 1E52 _ 50
        push    dword [ebp+10H]                         ; 1E53 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1E56 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1E59 _ FF. 75, 08
        call    make_wtitle8                            ; 1E5C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E61 _ 83. C4, 10
        nop                                             ; 1E64 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1E65 _ 8B. 5D, FC
        leave                                           ; 1E68 _ C9
        ret                                             ; 1E69 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 1E6A _ 55
        mov     ebp, esp                                ; 1E6B _ 89. E5
        push    ebx                                     ; 1E6D _ 53
        sub     esp, 36                                 ; 1E6E _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1E71 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1E74 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1E77 _ 80. 7D, E4, 00
        jz near       ?_093                                   ; 1e7b _ 74, 0a
        mov     byte [ebp-12H], 7                       ; 1E7D _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1E81 _ C6. 45, ED, 0C
        jmp     ?_094                                   ; 1E85 _ EB, 08

?_093:  mov     byte [ebp-12H], 8                       ; 1E87 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1E8B _ C6. 45, ED, 0F
?_094:  mov     eax, dword [ebp+0CH]                    ; 1E8F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E92 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E95 _ 8D. 58, FC
        mov     al, byte [ebp-13H]                      ; 1E98 _ 8A. 45, ED
        movzx   ecx, al                                 ; 1E9B _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1E9E _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1EA1 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1EA4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1EA7 _ 8B. 00
        push    20                                      ; 1EA9 _ 6A, 14
        push    ebx                                     ; 1EAB _ 53
        push    3                                       ; 1EAC _ 6A, 03
        push    3                                       ; 1EAE _ 6A, 03
        push    ecx                                     ; 1EB0 _ 51
        push    edx                                     ; 1EB1 _ 52
        push    eax                                     ; 1EB2 _ 50
        call    boxfill8                                ; 1EB3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1EB8 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 1EBB _ 0F BE. 45, EE
        sub     esp, 8                                  ; 1EBF _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1EC2 _ FF. 75, 10
        push    eax                                     ; 1EC5 _ 50
        push    4                                       ; 1EC6 _ 6A, 04
        push    24                                      ; 1EC8 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1ECA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1ECD _ FF. 75, 08
        call    showString                              ; 1ED0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1ED5 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1ED8 _ C7. 45, F0, 00000000
        jmp     ?_102                                   ; 1EDF _ EB, 7F

?_095:  mov     dword [ebp-0CH], 0                      ; 1EE1 _ C7. 45, F4, 00000000
        jmp     ?_101                                   ; 1EE8 _ EB, 6D

?_096:  mov     eax, dword [ebp-10H]                    ; 1EEA _ 8B. 45, F0
        shl     eax, 4                                  ; 1EED _ C1. E0, 04
        mov     edx, eax                                ; 1EF0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1EF2 _ 8B. 45, F4
        add     eax, edx                                ; 1EF5 _ 01. D0
        add     eax, closebtn.2128                      ; 1EF7 _ 05, 00000260(d)
        mov     al, byte [eax]                          ; 1EFC _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1EFE _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1F01 _ 80. 7D, EF, 40
        jnz near      ?_097                                   ; 1f05 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1F07 _ C6. 45, EF, 00
        jmp     ?_100                                   ; 1F0B _ EB, 1C

?_097:  cmp     byte [ebp-11H], 36                      ; 1F0D _ 80. 7D, EF, 24
        jnz near      ?_098                                   ; 1f11 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1F13 _ C6. 45, EF, 0F
        jmp     ?_100                                   ; 1F17 _ EB, 10

?_098:  cmp     byte [ebp-11H], 81                      ; 1F19 _ 80. 7D, EF, 51
        jnz near      ?_099                                   ; 1f1d _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1F1F _ C6. 45, EF, 08
        jmp     ?_100                                   ; 1F23 _ EB, 04

?_099:  mov     byte [ebp-11H], 7                       ; 1F25 _ C6. 45, EF, 07
?_100:  mov     eax, dword [ebp+0CH]                    ; 1F29 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1F2C _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1F2E _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1F31 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1F34 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F37 _ 8B. 40, 04
        imul    ecx, eax                                ; 1F3A _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1F3D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1F40 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1F43 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1F46 _ 8B. 45, F4
        add     eax, ebx                                ; 1F49 _ 01. D8
        add     eax, ecx                                ; 1F4B _ 01. C8
        add     edx, eax                                ; 1F4D _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1F4F _ 8A. 45, EF
        mov     byte [edx], al                          ; 1F52 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1F54 _ FF. 45, F4
?_101:  cmp     dword [ebp-0CH], 15                     ; 1F57 _ 83. 7D, F4, 0F
        jle near      ?_096                                   ; 1f5b _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1F5D _ FF. 45, F0
?_102:  cmp     dword [ebp-10H], 13                     ; 1F60 _ 83. 7D, F0, 0D
        jle near      ?_095                                   ; 1f64 _ 0f 8e, ffffff77
        nop                                             ; 1F6A _ 90
        nop                                             ; 1F6B _ 90
        mov     ebx, dword [ebp-4H]                     ; 1F6C _ 8B. 5D, FC
        leave                                           ; 1F6F _ C9
        ret                                             ; 1F70 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1F71 _ 55
        mov     ebp, esp                                ; 1F72 _ 89. E5
        push    edi                                     ; 1F74 _ 57
        push    esi                                     ; 1F75 _ 56
        push    ebx                                     ; 1F76 _ 53
        sub     esp, 16                                 ; 1F77 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1F7A _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1F7D _ 8B. 45, 14
        add     eax, edx                                ; 1F80 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1F82 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1F85 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1F88 _ 8B. 45, 18
        add     eax, edx                                ; 1F8B _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1F8D _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1F90 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1F93 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1F96 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1F99 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1F9C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F9F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1FA2 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1FA5 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1FA8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FAB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FAE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FB1 _ 8B. 00
        push    edi                                     ; 1FB3 _ 57
        push    esi                                     ; 1FB4 _ 56
        push    ebx                                     ; 1FB5 _ 53
        push    ecx                                     ; 1FB6 _ 51
        push    15                                      ; 1FB7 _ 6A, 0F
        push    edx                                     ; 1FB9 _ 52
        push    eax                                     ; 1FBA _ 50
        call    boxfill8                                ; 1FBB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FC0 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1FC3 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1FC6 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1FC9 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1FCC _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1FCF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1FD2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1FD5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1FD8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1FDB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FDE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FE1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FE4 _ 8B. 00
        push    edi                                     ; 1FE6 _ 57
        push    esi                                     ; 1FE7 _ 56
        push    ebx                                     ; 1FE8 _ 53
        push    ecx                                     ; 1FE9 _ 51
        push    15                                      ; 1FEA _ 6A, 0F
        push    edx                                     ; 1FEC _ 52
        push    eax                                     ; 1FED _ 50
        call    boxfill8                                ; 1FEE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FF3 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1FF6 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1FF9 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1FFC _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1FFF _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 2002 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 2005 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 2008 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 200B _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 200E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2011 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2014 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2017 _ 8B. 00
        push    edi                                     ; 2019 _ 57
        push    esi                                     ; 201A _ 56
        push    ebx                                     ; 201B _ 53
        push    ecx                                     ; 201C _ 51
        push    7                                       ; 201D _ 6A, 07
        push    edx                                     ; 201F _ 52
        push    eax                                     ; 2020 _ 50
        call    boxfill8                                ; 2021 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2026 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 2029 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 202C _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 202F _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 2032 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 2035 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2038 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 203B _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 203E _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 2041 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2044 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2047 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 204A _ 8B. 00
        push    edi                                     ; 204C _ 57
        push    esi                                     ; 204D _ 56
        push    ebx                                     ; 204E _ 53
        push    ecx                                     ; 204F _ 51
        push    7                                       ; 2050 _ 6A, 07
        push    edx                                     ; 2052 _ 52
        push    eax                                     ; 2053 _ 50
        call    boxfill8                                ; 2054 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2059 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 205C _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 205F _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 2062 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2065 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 2068 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 206B _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 206E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2071 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2074 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2077 _ 8B. 00
        push    esi                                     ; 2079 _ 56
        push    dword [ebp-10H]                         ; 207A _ FF. 75, F0
        push    ebx                                     ; 207D _ 53
        push    ecx                                     ; 207E _ 51
        push    0                                       ; 207F _ 6A, 00
        push    edx                                     ; 2081 _ 52
        push    eax                                     ; 2082 _ 50
        call    boxfill8                                ; 2083 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2088 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 208B _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 208E _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 2091 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2094 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 2097 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 209A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 209D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 20A0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20A3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20A6 _ 8B. 00
        push    dword [ebp-14H]                         ; 20A8 _ FF. 75, EC
        push    esi                                     ; 20AB _ 56
        push    ebx                                     ; 20AC _ 53
        push    ecx                                     ; 20AD _ 51
        push    0                                       ; 20AE _ 6A, 00
        push    edx                                     ; 20B0 _ 52
        push    eax                                     ; 20B1 _ 50
        call    boxfill8                                ; 20B2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 20B7 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 20BA _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 20BD _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 20C0 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 20C3 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 20C6 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 20C9 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 20CC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 20CF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20D5 _ 8B. 00
        push    esi                                     ; 20D7 _ 56
        push    dword [ebp-10H]                         ; 20D8 _ FF. 75, F0
        push    ebx                                     ; 20DB _ 53
        push    ecx                                     ; 20DC _ 51
        push    8                                       ; 20DD _ 6A, 08
        push    edx                                     ; 20DF _ 52
        push    eax                                     ; 20E0 _ 50
        call    boxfill8                                ; 20E1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 20E6 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 20E9 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 20EC _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 20EF _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 20F2 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 20F5 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 20F8 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 20FB _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 20FE _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2101 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2104 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2107 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 210A _ 8B. 00
        push    edi                                     ; 210C _ 57
        push    esi                                     ; 210D _ 56
        push    ebx                                     ; 210E _ 53
        push    ecx                                     ; 210F _ 51
        push    8                                       ; 2110 _ 6A, 08
        push    edx                                     ; 2112 _ 52
        push    eax                                     ; 2113 _ 50
        call    boxfill8                                ; 2114 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2119 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 211C _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 211F _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 2122 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 2125 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 2128 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 212B _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 212E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2131 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2134 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2137 _ 8B. 00
        push    dword [ebp-14H]                         ; 2139 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 213C _ FF. 75, F0
        push    esi                                     ; 213F _ 56
        push    ebx                                     ; 2140 _ 53
        push    ecx                                     ; 2141 _ 51
        push    edx                                     ; 2142 _ 52
        push    eax                                     ; 2143 _ 50
        call    boxfill8                                ; 2144 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2149 _ 83. C4, 1C
        nop                                             ; 214C _ 90
        lea     esp, [ebp-0CH]                          ; 214D _ 8D. 65, F4
        pop     ebx                                     ; 2150 _ 5B
        pop     esi                                     ; 2151 _ 5E
        pop     edi                                     ; 2152 _ 5F
        pop     ebp                                     ; 2153 _ 5D
        ret                                             ; 2154 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 2155 _ 55
        mov     ebp, esp                                ; 2156 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2158 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 215B _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2161 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2164 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 216B _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 216E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2175 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2178 _ C7. 40, 0C, 00000000
        nop                                             ; 217F _ 90
        pop     ebp                                     ; 2180 _ 5D
        ret                                             ; 2181 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2182 _ 55
        mov     ebp, esp                                ; 2183 _ 89. E5
        sub     esp, 16                                 ; 2185 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2188 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 218F _ C7. 45, FC, 00000000
        jmp     ?_104                                   ; 2196 _ EB, 13

?_103:  mov     eax, dword [ebp+8H]                     ; 2198 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 219B _ 8B. 55, FC
        add     edx, 2                                  ; 219E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 21A1 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 21A5 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 21A8 _ FF. 45, FC
?_104:  mov     eax, dword [ebp+8H]                     ; 21AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21AE _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 21B0 _ 39. 45, FC
        jc near       ?_103                                   ; 21b3 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 21B5 _ 8B. 45, F8
        leave                                           ; 21B8 _ C9
        ret                                             ; 21B9 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 21BA _ 55
        mov     ebp, esp                                ; 21BB _ 89. E5
        sub     esp, 16                                 ; 21BD _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 21C0 _ C7. 45, FC, 00000000
        jmp     ?_108                                   ; 21C7 _ E9, 00000084

?_105:  mov     eax, dword [ebp+8H]                     ; 21CC _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21CF _ 8B. 55, FC
        add     edx, 2                                  ; 21D2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 21D5 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 21D9 _ 39. 45, 0C
        ja      ?_107                                   ; 21DC _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 21DE _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21E1 _ 8B. 55, FC
        add     edx, 2                                  ; 21E4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 21E7 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 21EA _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 21ED _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21F0 _ 8B. 55, FC
        add     edx, 2                                  ; 21F3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 21F6 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 21F9 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 21FC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21FF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2202 _ 8B. 55, FC
        add     edx, 2                                  ; 2205 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2208 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 220B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 220E _ 8B. 55, FC
        add     edx, 2                                  ; 2211 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2214 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2218 _ 2B. 45, 0C
        mov     edx, eax                                ; 221B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 221D _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 2220 _ 8B. 4D, FC
        add     ecx, 2                                  ; 2223 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2226 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 222A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 222D _ 8B. 55, FC
        add     edx, 2                                  ; 2230 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2233 _ 8B. 44 D0, 04
        test    eax, eax                                ; 2237 _ 85. C0
        jnz near      ?_106                                   ; 2239 _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 223B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 223E _ 8B. 00
        lea     edx, [eax-1H]                           ; 2240 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2243 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2246 _ 89. 10
?_106:  mov     eax, dword [ebp-8H]                     ; 2248 _ 8B. 45, F8
        jmp     ?_109                                   ; 224B _ EB, 16

?_107:  inc     dword [ebp-4H]                          ; 224D _ FF. 45, FC
?_108:  mov     eax, dword [ebp+8H]                     ; 2250 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2253 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 2255 _ 39. 45, FC
        jc near       ?_105                                   ; 2258 _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 225E _ B8, 00000000
?_109:  leave                                           ; 2263 _ C9
        ret                                             ; 2264 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2265 _ 55
        mov     ebp, esp                                ; 2266 _ 89. E5
        push    ebx                                     ; 2268 _ 53
        sub     esp, 16                                 ; 2269 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 226C _ C7. 45, F8, 00000000
        jmp     ?_111                                   ; 2273 _ EB, 14

?_110:  mov     eax, dword [ebp+8H]                     ; 2275 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2278 _ 8B. 55, F8
        add     edx, 2                                  ; 227B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 227E _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 2281 _ 39. 45, 0C
        jc near       ?_112                                   ; 2284 _ 72, 0f
        inc     dword [ebp-8H]                          ; 2286 _ FF. 45, F8
?_111:  mov     eax, dword [ebp+8H]                     ; 2289 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 228C _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 228E _ 39. 45, F8
        jl      ?_110                                   ; 2291 _ 7C, E2
        jmp     ?_113                                   ; 2293 _ EB, 01

?_112:  nop                                             ; 2295 _ 90
?_113:  cmp     dword [ebp-8H], 0                       ; 2296 _ 83. 7D, F8, 00
        jle near      ?_115                                   ; 229a _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 22A0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 22A3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22A6 _ 8B. 45, 08
        add     edx, 2                                  ; 22A9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 22AC _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 22AF _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 22B2 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 22B5 _ 8B. 45, 08
        add     ecx, 2                                  ; 22B8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 22BB _ 8B. 44 C8, 04
        add     eax, edx                                ; 22BF _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 22C1 _ 39. 45, 0C
        jne near      ?_115                                   ; 22c4 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 22CA _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 22CD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22D0 _ 8B. 45, 08
        add     edx, 2                                  ; 22D3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 22D6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 22DA _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 22DD _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 22E0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 22E3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 22E6 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 22E9 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 22EC _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 22F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22F3 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 22F5 _ 39. 45, F8
        jge near      ?_114                                   ; 22f8 _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 22FA _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 22FD _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2300 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2303 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2306 _ 8B. 55, F8
        add     edx, 2                                  ; 2309 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 230C _ 8B. 04 D0
        cmp     ecx, eax                                ; 230F _ 39. C1
        jnz near      ?_114                                   ; 2311 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 2313 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2316 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2319 _ 8B. 45, 08
        add     edx, 2                                  ; 231C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 231F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2323 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2326 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2329 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 232C _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 2330 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 2333 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 2336 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2339 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 233C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 233F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2343 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2346 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2348 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 234B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 234E _ 89. 10
?_114:  mov     eax, 0                                  ; 2350 _ B8, 00000000
        jmp     ?_121                                   ; 2355 _ E9, 0000011B

?_115:  mov     eax, dword [ebp+8H]                     ; 235A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 235D _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 235F _ 39. 45, F8
        jge near      ?_116                                   ; 2362 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 2364 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2367 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 236A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 236D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2370 _ 8B. 55, F8
        add     edx, 2                                  ; 2373 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2376 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2379 _ 39. C1
        jnz near      ?_116                                   ; 237b _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 237D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2380 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2383 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2386 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2389 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 238C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 238F _ 8B. 55, F8
        add     edx, 2                                  ; 2392 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2395 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2399 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 239C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 239F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 23A2 _ 8B. 55, F8
        add     edx, 2                                  ; 23A5 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 23A8 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 23AC _ B8, 00000000
        jmp     ?_121                                   ; 23B1 _ E9, 000000BF

?_116:  mov     eax, dword [ebp+8H]                     ; 23B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23B9 _ 8B. 00
        cmp     eax, 4095                               ; 23BB _ 3D, 00000FFF
        jg  near      ?_120                                   ; 23c0 _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 23C6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23C9 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 23CB _ 89. 45, F4
        jmp     ?_118                                   ; 23CE _ EB, 27

?_117:  mov     eax, dword [ebp-0CH]                    ; 23D0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 23D3 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 23D6 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 23D9 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 23DC _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 23DF _ 8B. 45, 08
        add     edx, 2                                  ; 23E2 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 23E5 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 23E8 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 23EA _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 23ED _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 23F0 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 23F4 _ FF. 4D, F4
?_118:  mov     eax, dword [ebp-0CH]                    ; 23F7 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 23FA _ 3B. 45, F8
        jg  near      ?_117                                   ; 23fd _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 23FF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2402 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2404 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2407 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 240A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 240C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 240F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2412 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2415 _ 8B. 00
        cmp     edx, eax                                ; 2417 _ 39. C2
        jge near      ?_119                                   ; 2419 _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 241B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 241E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2420 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2423 _ 89. 50, 04
?_119:  mov     eax, dword [ebp+8H]                     ; 2426 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2429 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 242C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 242F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2432 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2435 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2438 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 243B _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 243E _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2441 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2445 _ B8, 00000000
        jmp     ?_121                                   ; 244A _ EB, 29

?_120:  mov     eax, dword [ebp+8H]                     ; 244C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 244F _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2452 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2455 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2458 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 245B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 245E _ 8B. 40, 08
        mov     edx, eax                                ; 2461 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2463 _ 8B. 45, 10
        add     eax, edx                                ; 2466 _ 01. D0
        mov     edx, eax                                ; 2468 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 246A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 246D _ 89. 50, 08
        mov     eax, 4294967295                         ; 2470 _ B8, FFFFFFFF
?_121:  add     esp, 16                                 ; 2475 _ 83. C4, 10
        pop     ebx                                     ; 2478 _ 5B
        pop     ebp                                     ; 2479 _ 5D
        ret                                             ; 247A _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 247B _ 55
        mov     ebp, esp                                ; 247C _ 89. E5
        sub     esp, 16                                 ; 247E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2481 _ 8B. 45, 0C
        add     eax, 4095                               ; 2484 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2489 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 248E _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 2491 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2494 _ FF. 75, 08
        call    memman_alloc                            ; 2497 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 249C _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 249F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 24A2 _ 8B. 45, FC
        leave                                           ; 24A5 _ C9
        ret                                             ; 24A6 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 24A7 _ 55
        mov     ebp, esp                                ; 24A8 _ 89. E5
        sub     esp, 16                                 ; 24AA _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 24AD _ 8B. 45, 10
        add     eax, 4095                               ; 24B0 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 24B5 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 24BA _ 89. 45, 10
        push    dword [ebp+10H]                         ; 24BD _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 24C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 24C3 _ FF. 75, 08
        call    memman_free                             ; 24C6 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 24CB _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 24CE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 24D1 _ 8B. 45, FC
        leave                                           ; 24D4 _ C9
        ret                                             ; 24D5 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 24D6 _ 55
        mov     ebp, esp                                ; 24D7 _ 89. E5
        sub     esp, 24                                 ; 24D9 _ 83. EC, 18
        sub     esp, 8                                  ; 24DC _ 83. EC, 08
        push    9232                                    ; 24DF _ 68, 00002410
        push    dword [ebp+8H]                          ; 24E4 _ FF. 75, 08
        call    memman_alloc_4k                         ; 24E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24EC _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 24EF _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 24F2 _ 83. 7D, F0, 00
        jnz near      ?_122                                   ; 24f6 _ 75, 0a
        mov     eax, 0                                  ; 24F8 _ B8, 00000000
        jmp     ?_126                                   ; 24FD _ E9, 00000099

?_122:  mov     eax, dword [ebp+10H]                    ; 2502 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2505 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 2509 _ 83. EC, 08
        push    eax                                     ; 250C _ 50
        push    dword [ebp+8H]                          ; 250D _ FF. 75, 08
        call    memman_alloc_4k                         ; 2510 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2515 _ 83. C4, 10
        mov     edx, eax                                ; 2518 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 251A _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 251D _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2520 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2523 _ 8B. 40, 04
        test    eax, eax                                ; 2526 _ 85. C0
        jnz near      ?_123                                   ; 2528 _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 252A _ 8B. 45, F0
        sub     esp, 4                                  ; 252D _ 83. EC, 04
        push    9232                                    ; 2530 _ 68, 00002410
        push    eax                                     ; 2535 _ 50
        push    dword [ebp+8H]                          ; 2536 _ FF. 75, 08
        call    memman_free_4k                          ; 2539 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 253E _ 83. C4, 10
        mov     eax, 0                                  ; 2541 _ B8, 00000000
        jmp     ?_126                                   ; 2546 _ EB, 53

?_123:  mov     eax, dword [ebp-10H]                    ; 2548 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 254B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 254E _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2550 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 2553 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2556 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2559 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 255C _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 255F _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 2562 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 2565 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 256C _ C7. 45, F4, 00000000
        jmp     ?_125                                   ; 2573 _ EB, 1A

?_124:  mov     eax, dword [ebp-10H]                    ; 2575 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2578 _ 8B. 55, F4
        add     edx, 33                                 ; 257B _ 83. C2, 21
        shl     edx, 5                                  ; 257E _ C1. E2, 05
        add     eax, edx                                ; 2581 _ 01. D0
        add     eax, 16                                 ; 2583 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2586 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 258C _ FF. 45, F4
?_125:  cmp     dword [ebp-0CH], 255                    ; 258F _ 81. 7D, F4, 000000FF
        jle near      ?_124                                   ; 2596 _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 2598 _ 8B. 45, F0
?_126:  leave                                           ; 259B _ C9
        ret                                             ; 259C _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 259D _ 55
        mov     ebp, esp                                ; 259E _ 89. E5
        sub     esp, 16                                 ; 25A0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 25A3 _ C7. 45, FC, 00000000
        jmp     ?_129                                   ; 25AA _ EB, 5A

?_127:  mov     eax, dword [ebp+8H]                     ; 25AC _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 25AF _ 8B. 55, FC
        add     edx, 33                                 ; 25B2 _ 83. C2, 21
        shl     edx, 5                                  ; 25B5 _ C1. E2, 05
        add     eax, edx                                ; 25B8 _ 01. D0
        add     eax, 16                                 ; 25BA _ 83. C0, 10
        mov     eax, dword [eax]                        ; 25BD _ 8B. 00
        test    eax, eax                                ; 25BF _ 85. C0
        jnz near      ?_128                                   ; 25c1 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 25C3 _ 8B. 45, FC
        shl     eax, 5                                  ; 25C6 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 25C9 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 25CF _ 8B. 45, 08
        add     eax, edx                                ; 25D2 _ 01. D0
        add     eax, 4                                  ; 25D4 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 25D7 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 25DA _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 25DD _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 25E0 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 25E3 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 25E6 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 25EA _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 25ED _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 25F4 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 25F7 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 25FE _ 8B. 45, F8
        jmp     ?_130                                   ; 2601 _ EB, 11

?_128:  inc     dword [ebp-4H]                          ; 2603 _ FF. 45, FC
?_129:  cmp     dword [ebp-4H], 255                     ; 2606 _ 81. 7D, FC, 000000FF
        jle near      ?_127                                   ; 260d _ 7e, 9d
        mov     eax, 0                                  ; 260F _ B8, 00000000
?_130:  leave                                           ; 2614 _ C9
        ret                                             ; 2615 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2616 _ 55
        mov     ebp, esp                                ; 2617 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2619 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 261C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 261F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2621 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2624 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2627 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 262A _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 262D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2630 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2633 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2636 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2639 _ 89. 50, 14
        nop                                             ; 263C _ 90
        pop     ebp                                     ; 263D _ 5D
        ret                                             ; 263E _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 263F _ 55
        mov     ebp, esp                                ; 2640 _ 89. E5
        push    esi                                     ; 2642 _ 56
        push    ebx                                     ; 2643 _ 53
        sub     esp, 16                                 ; 2644 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2647 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 264A _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 264D _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2650 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2653 _ 8B. 40, 10
        inc     eax                                     ; 2656 _ 40
        cmp     dword [ebp+10H], eax                    ; 2657 _ 39. 45, 10
        jle near      ?_131                                   ; 265a _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 265C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 265F _ 8B. 40, 10
        inc     eax                                     ; 2662 _ 40
        mov     dword [ebp+10H], eax                    ; 2663 _ 89. 45, 10
?_131:  cmp     dword [ebp+10H], -1                     ; 2666 _ 83. 7D, 10, FF
        jge near      ?_132                                   ; 266a _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 266C _ C7. 45, 10, FFFFFFFF
?_132:  mov     eax, dword [ebp+0CH]                    ; 2673 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2676 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2679 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 267C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 267F _ 3B. 45, 10
        jle near      ?_139                                   ; 2682 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 2688 _ 83. 7D, 10, 00
        js near       ?_135                                   ; 268c _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 2692 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2695 _ 89. 45, F4
        jmp     ?_134                                   ; 2698 _ EB, 33

?_133:  mov     eax, dword [ebp-0CH]                    ; 269A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 269D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26A0 _ 8B. 45, 08
        add     edx, 4                                  ; 26A3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 26A6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 26AA _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 26AD _ 8B. 4D, F4
        add     ecx, 4                                  ; 26B0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 26B3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 26B7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 26BA _ 8B. 55, F4
        add     edx, 4                                  ; 26BD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26C0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 26C4 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 26C7 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 26CA _ FF. 4D, F4
?_134:  mov     eax, dword [ebp-0CH]                    ; 26CD _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 26D0 _ 3B. 45, 10
        jg  near      ?_133                                   ; 26d3 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 26D5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 26D8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 26DB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 26DE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 26E1 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 26E5 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 26E8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 26EB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26EE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26F1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 26F4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 26F7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 26FA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 26FD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2700 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2703 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2706 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2709 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 270C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 270F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2712 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2715 _ 83. EC, 08
        push    esi                                     ; 2718 _ 56
        push    ebx                                     ; 2719 _ 53
        push    ecx                                     ; 271A _ 51
        push    edx                                     ; 271B _ 52
        push    eax                                     ; 271C _ 50
        push    dword [ebp+8H]                          ; 271D _ FF. 75, 08
        call    sheet_refreshmap                        ; 2720 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2725 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2728 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 272B _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 272E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2731 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2734 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2737 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 273A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 273D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2740 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2743 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2746 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2749 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 274C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 274F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2752 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2755 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2758 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 275B _ FF. 75, F0
        push    esi                                     ; 275E _ 56
        push    ebx                                     ; 275F _ 53
        push    ecx                                     ; 2760 _ 51
        push    edx                                     ; 2761 _ 52
        push    eax                                     ; 2762 _ 50
        push    dword [ebp+8H]                          ; 2763 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2766 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 276B _ 83. C4, 20
        jmp     ?_146                                   ; 276E _ E9, 00000239

?_135:  mov     eax, dword [ebp+8H]                     ; 2773 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2776 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 2779 _ 39. 45, F0
        jge near      ?_138                                   ; 277c _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 277E _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2781 _ 89. 45, F4
        jmp     ?_137                                   ; 2784 _ EB, 33

?_136:  mov     eax, dword [ebp-0CH]                    ; 2786 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2789 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 278C _ 8B. 45, 08
        add     edx, 4                                  ; 278F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2792 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2796 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2799 _ 8B. 4D, F4
        add     ecx, 4                                  ; 279C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 279F _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 27A3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 27A6 _ 8B. 55, F4
        add     edx, 4                                  ; 27A9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27AC _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 27B0 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 27B3 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 27B6 _ FF. 45, F4
?_137:  mov     eax, dword [ebp+8H]                     ; 27B9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27BC _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 27BF _ 39. 45, F4
        jl      ?_136                                   ; 27C2 _ 7C, C2
?_138:  mov     eax, dword [ebp+8H]                     ; 27C4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27C7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 27CA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 27CD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 27D0 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27D3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27D6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27D9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27DC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 27DF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27E2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27E5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27E8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 27EB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 27EE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 27F1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27F4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27F7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 27FA _ 8B. 40, 0C
        sub     esp, 8                                  ; 27FD _ 83. EC, 08
        push    0                                       ; 2800 _ 6A, 00
        push    ebx                                     ; 2802 _ 53
        push    ecx                                     ; 2803 _ 51
        push    edx                                     ; 2804 _ 52
        push    eax                                     ; 2805 _ 50
        push    dword [ebp+8H]                          ; 2806 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2809 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 280E _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2811 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 2814 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 2817 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 281A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 281D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2820 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2823 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2826 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2829 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 282C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 282F _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2832 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2835 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2838 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 283B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 283E _ 8B. 40, 0C
        sub     esp, 4                                  ; 2841 _ 83. EC, 04
        push    esi                                     ; 2844 _ 56
        push    0                                       ; 2845 _ 6A, 00
        push    ebx                                     ; 2847 _ 53
        push    ecx                                     ; 2848 _ 51
        push    edx                                     ; 2849 _ 52
        push    eax                                     ; 284A _ 50
        push    dword [ebp+8H]                          ; 284B _ FF. 75, 08
        call    sheet_refreshsub                        ; 284E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2853 _ 83. C4, 20
        jmp     ?_146                                   ; 2856 _ E9, 00000151

?_139:  mov     eax, dword [ebp-10H]                    ; 285B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 285E _ 3B. 45, 10
        jge near      ?_146                                   ; 2861 _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 2867 _ 83. 7D, F0, 00
        js near       ?_142                                   ; 286b _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 286D _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2870 _ 89. 45, F4
        jmp     ?_141                                   ; 2873 _ EB, 33

?_140:  mov     eax, dword [ebp-0CH]                    ; 2875 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2878 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 287B _ 8B. 45, 08
        add     edx, 4                                  ; 287E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2881 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2885 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2888 _ 8B. 4D, F4
        add     ecx, 4                                  ; 288B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 288E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2892 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2895 _ 8B. 55, F4
        add     edx, 4                                  ; 2898 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 289B _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 289F _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 28A2 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 28A5 _ FF. 45, F4
?_141:  mov     eax, dword [ebp-0CH]                    ; 28A8 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 28AB _ 3B. 45, 10
        jl      ?_140                                   ; 28AE _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 28B0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 28B3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 28B6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 28B9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 28BC _ 89. 54 88, 04
        jmp     ?_145                                   ; 28C0 _ EB, 69

?_142:  mov     eax, dword [ebp+8H]                     ; 28C2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 28C5 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 28C8 _ 89. 45, F4
        jmp     ?_144                                   ; 28CB _ EB, 37

?_143:  mov     eax, dword [ebp-0CH]                    ; 28CD _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 28D0 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 28D3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 28D6 _ 8B. 55, F4
        add     edx, 4                                  ; 28D9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 28DC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 28E0 _ 8B. 45, 08
        add     ecx, 4                                  ; 28E3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 28E6 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 28EA _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 28ED _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 28F0 _ 8B. 45, 08
        add     edx, 4                                  ; 28F3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 28F6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 28FA _ 8B. 55, F4
        inc     edx                                     ; 28FD _ 42
        mov     dword [eax+18H], edx                    ; 28FE _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2901 _ FF. 4D, F4
?_144:  mov     eax, dword [ebp-0CH]                    ; 2904 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2907 _ 3B. 45, 10
        jge near      ?_143                                   ; 290a _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 290C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 290F _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2912 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2915 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2918 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 291C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 291F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2922 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2925 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2928 _ 89. 50, 10
?_145:  mov     eax, dword [ebp+0CH]                    ; 292B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 292E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2931 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2934 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2937 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 293A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 293D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2940 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2943 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2946 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2949 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 294C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 294F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2952 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2955 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2958 _ FF. 75, 10
        push    ebx                                     ; 295B _ 53
        push    ecx                                     ; 295C _ 51
        push    edx                                     ; 295D _ 52
        push    eax                                     ; 295E _ 50
        push    dword [ebp+8H]                          ; 295F _ FF. 75, 08
        call    sheet_refreshmap                        ; 2962 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2967 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 296A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 296D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2970 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2973 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2976 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2979 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 297C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 297F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2982 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2985 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2988 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 298B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 298E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2991 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2994 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 2997 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 299A _ FF. 75, 10
        push    ebx                                     ; 299D _ 53
        push    ecx                                     ; 299E _ 51
        push    edx                                     ; 299F _ 52
        push    eax                                     ; 29A0 _ 50
        push    dword [ebp+8H]                          ; 29A1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 29A4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29A9 _ 83. C4, 20
?_146:  nop                                             ; 29AC _ 90
        lea     esp, [ebp-8H]                           ; 29AD _ 8D. 65, F8
        pop     ebx                                     ; 29B0 _ 5B
        pop     esi                                     ; 29B1 _ 5E
        pop     ebp                                     ; 29B2 _ 5D
        ret                                             ; 29B3 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 29B4 _ 55
        mov     ebp, esp                                ; 29B5 _ 89. E5
        push    edi                                     ; 29B7 _ 57
        push    esi                                     ; 29B8 _ 56
        push    ebx                                     ; 29B9 _ 53
        sub     esp, 28                                 ; 29BA _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 29BD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29C0 _ 8B. 40, 18
        test    eax, eax                                ; 29C3 _ 85. C0
        js near       ?_147                                   ; 29c5 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 29C7 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 29CA _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 29CD _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 29D0 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 29D3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29D6 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 29D9 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 29DC _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 29DF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 29E2 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 29E5 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 29E8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 29EB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 29EE _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 29F1 _ 8B. 45, 14
        add     edx, eax                                ; 29F4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 29F6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 29F9 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 29FC _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 29FF _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2A02 _ 03. 45, E4
        sub     esp, 4                                  ; 2A05 _ 83. EC, 04
        push    ebx                                     ; 2A08 _ 53
        push    ecx                                     ; 2A09 _ 51
        push    edi                                     ; 2A0A _ 57
        push    esi                                     ; 2A0B _ 56
        push    edx                                     ; 2A0C _ 52
        push    eax                                     ; 2A0D _ 50
        push    dword [ebp+8H]                          ; 2A0E _ FF. 75, 08
        call    sheet_refreshsub                        ; 2A11 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A16 _ 83. C4, 20
?_147:  mov     eax, 0                                  ; 2A19 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2A1E _ 8D. 65, F4
        pop     ebx                                     ; 2A21 _ 5B
        pop     esi                                     ; 2A22 _ 5E
        pop     edi                                     ; 2A23 _ 5F
        pop     ebp                                     ; 2A24 _ 5D
        ret                                             ; 2A25 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2A26 _ 55
        mov     ebp, esp                                ; 2A27 _ 89. E5
        push    esi                                     ; 2A29 _ 56
        push    ebx                                     ; 2A2A _ 53
        sub     esp, 16                                 ; 2A2B _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2A2E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2A31 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2A34 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2A37 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2A3A _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2A3D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2A40 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2A43 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2A46 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2A49 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2A4C _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2A4F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A52 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A55 _ 8B. 40, 18
        test    eax, eax                                ; 2A58 _ 85. C0
        js near       ?_148                                   ; 2a5a _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 2A60 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2A63 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2A66 _ 8B. 45, F0
        add     edx, eax                                ; 2A69 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2A6B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2A6E _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 2A71 _ 8B. 45, F4
        add     eax, ecx                                ; 2A74 _ 01. C8
        sub     esp, 8                                  ; 2A76 _ 83. EC, 08
        push    0                                       ; 2A79 _ 6A, 00
        push    edx                                     ; 2A7B _ 52
        push    eax                                     ; 2A7C _ 50
        push    dword [ebp-10H]                         ; 2A7D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2A80 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2A83 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2A86 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A8B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2A8E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A91 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2A94 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2A97 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2A9A _ 8B. 55, 14
        add     ecx, edx                                ; 2A9D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2A9F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2AA2 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2AA5 _ 8B. 55, 10
        add     edx, ebx                                ; 2AA8 _ 01. DA
        sub     esp, 8                                  ; 2AAA _ 83. EC, 08
        push    eax                                     ; 2AAD _ 50
        push    ecx                                     ; 2AAE _ 51
        push    edx                                     ; 2AAF _ 52
        push    dword [ebp+14H]                         ; 2AB0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2AB3 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2AB6 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2AB9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2ABE _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2AC1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2AC4 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 2AC7 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2ACA _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2ACD _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2AD0 _ 8B. 45, F0
        add     edx, eax                                ; 2AD3 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2AD5 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2AD8 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2ADB _ 8B. 45, F4
        add     eax, ebx                                ; 2ADE _ 01. D8
        sub     esp, 4                                  ; 2AE0 _ 83. EC, 04
        push    ecx                                     ; 2AE3 _ 51
        push    0                                       ; 2AE4 _ 6A, 00
        push    edx                                     ; 2AE6 _ 52
        push    eax                                     ; 2AE7 _ 50
        push    dword [ebp-10H]                         ; 2AE8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2AEB _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2AEE _ FF. 75, 08
        call    sheet_refreshsub                        ; 2AF1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2AF6 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2AF9 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2AFC _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2AFF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B02 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2B05 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2B08 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2B0B _ 8B. 4D, 14
        add     ebx, ecx                                ; 2B0E _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2B10 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2B13 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2B16 _ 8B. 4D, 10
        add     ecx, esi                                ; 2B19 _ 01. F1
        sub     esp, 4                                  ; 2B1B _ 83. EC, 04
        push    edx                                     ; 2B1E _ 52
        push    eax                                     ; 2B1F _ 50
        push    ebx                                     ; 2B20 _ 53
        push    ecx                                     ; 2B21 _ 51
        push    dword [ebp+14H]                         ; 2B22 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2B25 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2B28 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2B2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B30 _ 83. C4, 20
?_148:  nop                                             ; 2B33 _ 90
        lea     esp, [ebp-8H]                           ; 2B34 _ 8D. 65, F8
        pop     ebx                                     ; 2B37 _ 5B
        pop     esi                                     ; 2B38 _ 5E
        pop     ebp                                     ; 2B39 _ 5D
        ret                                             ; 2B3A _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2B3B _ 55
        mov     ebp, esp                                ; 2B3C _ 89. E5
        sub     esp, 48                                 ; 2B3E _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2B41 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2B44 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2B46 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2B49 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B4C _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2B4F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2B52 _ 83. 7D, 0C, 00
        jns     ?_149                                   ; 2B56 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2B58 _ C7. 45, 0C, 00000000
?_149:  cmp     dword [ebp+10H], 8                      ; 2B5F _ 83. 7D, 10, 08
        jg  near      ?_150                                   ; 2b63 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 2B65 _ C7. 45, 10, 00000000
?_150:  mov     eax, dword [ebp+8H]                     ; 2B6C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B6F _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2B72 _ 39. 45, 14
        jle near      ?_151                                   ; 2b75 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2B77 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B7A _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2B7D _ 89. 45, 14
?_151:  mov     eax, dword [ebp+8H]                     ; 2B80 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B83 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2B86 _ 39. 45, 18
        jle near      ?_152                                   ; 2b89 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2B8B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B8E _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2B91 _ 89. 45, 18
?_152:  mov     eax, dword [ebp+1CH]                    ; 2B94 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2B97 _ 89. 45, FC
        jmp     ?_159                                   ; 2B9A _ E9, 0000010E

?_153:  mov     eax, dword [ebp+8H]                     ; 2B9F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2BA2 _ 8B. 55, FC
        add     edx, 4                                  ; 2BA5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2BA8 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2BAC _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2BAF _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2BB2 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 2BB4 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 2BB7 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2BBA _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 2BC0 _ 8B. 45, E8
        sub     eax, edx                                ; 2BC3 _ 29. D0
        sar     eax, 5                                  ; 2BC5 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 2BC8 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2BCB _ C7. 45, F4, 00000000
        jmp     ?_158                                   ; 2BD2 _ E9, 000000C4

?_154:  mov     eax, dword [ebp-18H]                    ; 2BD7 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2BDA _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2BDD _ 8B. 45, F4
        add     eax, edx                                ; 2BE0 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2BE2 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2BE5 _ C7. 45, F8, 00000000
        jmp     ?_157                                   ; 2BEC _ E9, 00000098

?_155:  mov     eax, dword [ebp-18H]                    ; 2BF1 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2BF4 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2BF7 _ 8B. 45, F8
        add     eax, edx                                ; 2BFA _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2BFC _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2BFF _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2C02 _ 3B. 45, D8
        jg  near      ?_156                                   ; 2c05 _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 2C07 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2C0A _ 3B. 45, 14
        jge near      ?_156                                   ; 2c0d _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2C0F _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2C12 _ 3B. 45, DC
        jg  near      ?_156                                   ; 2c15 _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 2C17 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2C1A _ 3B. 45, 18
        jge near      ?_156                                   ; 2c1d _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2C1F _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C22 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2C25 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2C29 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2C2B _ 8B. 45, F8
        add     eax, edx                                ; 2C2E _ 01. D0
        mov     edx, eax                                ; 2C30 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2C32 _ 8B. 45, E4
        add     eax, edx                                ; 2C35 _ 01. D0
        mov     al, byte [eax]                          ; 2C37 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2C39 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2C3C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C3F _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2C42 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2C46 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2C48 _ 8B. 45, D8
        add     eax, edx                                ; 2C4B _ 01. D0
        mov     edx, eax                                ; 2C4D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2C4F _ 8B. 45, EC
        add     eax, edx                                ; 2C52 _ 01. D0
        mov     al, byte [eax]                          ; 2C54 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2C56 _ 38. 45, E3
        jnz near      ?_156                                   ; 2c59 _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 2C5B _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2C5F _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2C62 _ 8B. 40, 14
        cmp     edx, eax                                ; 2C65 _ 39. C2
        jz near       ?_156                                   ; 2c67 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2C69 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C6C _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2C6F _ 0F AF. 45, DC
        mov     edx, eax                                ; 2C73 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2C75 _ 8B. 45, D8
        add     eax, edx                                ; 2C78 _ 01. D0
        mov     edx, eax                                ; 2C7A _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2C7C _ 8B. 45, F0
        add     edx, eax                                ; 2C7F _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2C81 _ 8A. 45, D7
        mov     byte [edx], al                          ; 2C84 _ 88. 02
?_156:  inc     dword [ebp-8H]                          ; 2C86 _ FF. 45, F8
?_157:  mov     eax, dword [ebp-18H]                    ; 2C89 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C8C _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2C8F _ 39. 45, F8
        jl      ?_155                                   ; 2C92 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 2C98 _ FF. 45, F4
?_158:  mov     eax, dword [ebp-18H]                    ; 2C9B _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2C9E _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 2CA1 _ 39. 45, F4
        jl      ?_154                                   ; 2CA4 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 2CAA _ FF. 45, FC
?_159:  mov     eax, dword [ebp-4H]                     ; 2CAD _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 2CB0 _ 3B. 45, 20
        jle near      ?_153                                   ; 2cb3 _ 0f 8e, fffffee6
        nop                                             ; 2CB9 _ 90
        nop                                             ; 2CBA _ 90
        leave                                           ; 2CBB _ C9
        ret                                             ; 2CBC _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2CBD _ 55
        mov     ebp, esp                                ; 2CBE _ 89. E5
        sub     esp, 64                                 ; 2CC0 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2CC3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2CC6 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2CC9 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 2CCC _ 83. 7D, 0C, 00
        jns     ?_160                                   ; 2CD0 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2CD2 _ C7. 45, 0C, 00000000
?_160:  cmp     dword [ebp+10H], 0                      ; 2CD9 _ 83. 7D, 10, 00
        jns     ?_161                                   ; 2CDD _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2CDF _ C7. 45, 10, 00000000
?_161:  mov     eax, dword [ebp+8H]                     ; 2CE6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CE9 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2CEC _ 39. 45, 14
        jle near      ?_162                                   ; 2cef _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2CF1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CF4 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2CF7 _ 89. 45, 14
?_162:  mov     eax, dword [ebp+8H]                     ; 2CFA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CFD _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2D00 _ 39. 45, 18
        jle near      ?_163                                   ; 2d03 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2D05 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D08 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2D0B _ 89. 45, 18
?_163:  mov     eax, dword [ebp+1CH]                    ; 2D0E _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2D11 _ 89. 45, FC
        jmp     ?_174                                   ; 2D14 _ E9, 00000137

?_164:  mov     eax, dword [ebp+8H]                     ; 2D19 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2D1C _ 8B. 55, FC
        add     edx, 4                                  ; 2D1F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2D22 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2D26 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2D29 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2D2C _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2D32 _ 8B. 45, DC
        sub     eax, edx                                ; 2D35 _ 29. D0
        sar     eax, 5                                  ; 2D37 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2D3A _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2D3D _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2D40 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2D42 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2D45 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2D48 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2D4B _ 8B. 55, 0C
        sub     edx, eax                                ; 2D4E _ 29. C2
        mov     eax, edx                                ; 2D50 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2D52 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2D55 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2D58 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2D5B _ 8B. 55, 10
        sub     edx, eax                                ; 2D5E _ 29. C2
        mov     eax, edx                                ; 2D60 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2D62 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2D65 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2D68 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2D6B _ 8B. 55, 14
        sub     edx, eax                                ; 2D6E _ 29. C2
        mov     eax, edx                                ; 2D70 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2D72 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2D75 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2D78 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2D7B _ 8B. 55, 18
        sub     edx, eax                                ; 2D7E _ 29. C2
        mov     eax, edx                                ; 2D80 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2D82 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2D85 _ 83. 7D, F0, 00
        jns     ?_165                                   ; 2D89 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2D8B _ C7. 45, F0, 00000000
?_165:  cmp     dword [ebp-14H], 0                      ; 2D92 _ 83. 7D, EC, 00
        jns     ?_166                                   ; 2D96 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 2D98 _ C7. 45, EC, 00000000
?_166:  mov     eax, dword [ebp-24H]                    ; 2D9F _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2DA2 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 2DA5 _ 39. 45, E8
        jle near      ?_167                                   ; 2da8 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2DAA _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2DAD _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2DB0 _ 89. 45, E8
?_167:  mov     eax, dword [ebp-24H]                    ; 2DB3 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2DB6 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2DB9 _ 39. 45, E4
        jle near      ?_168                                   ; 2dbc _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 2DBE _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2DC1 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2DC4 _ 89. 45, E4
?_168:  mov     eax, dword [ebp-14H]                    ; 2DC7 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2DCA _ 89. 45, F4
        jmp     ?_173                                   ; 2DCD _ EB, 76

?_169:  mov     eax, dword [ebp-24H]                    ; 2DCF _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2DD2 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2DD5 _ 8B. 45, F4
        add     eax, edx                                ; 2DD8 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2DDA _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2DDD _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2DE0 _ 89. 45, F8
        jmp     ?_172                                   ; 2DE3 _ EB, 55

?_170:  mov     eax, dword [ebp-24H]                    ; 2DE5 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2DE8 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2DEB _ 8B. 45, F8
        add     eax, edx                                ; 2DEE _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2DF0 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2DF3 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2DF6 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2DF9 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2DFD _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2DFF _ 8B. 45, F8
        add     eax, edx                                ; 2E02 _ 01. D0
        mov     edx, eax                                ; 2E04 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2E06 _ 8B. 45, D4
        add     eax, edx                                ; 2E09 _ 01. D0
        mov     al, byte [eax]                          ; 2E0B _ 8A. 00
        movzx   edx, al                                 ; 2E0D _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2E10 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2E13 _ 8B. 40, 14
        cmp     edx, eax                                ; 2E16 _ 39. C2
        jz near       ?_171                                   ; 2e18 _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 2E1A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E1D _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2E20 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2E24 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2E26 _ 8B. 45, CC
        add     eax, edx                                ; 2E29 _ 01. D0
        mov     edx, eax                                ; 2E2B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2E2D _ 8B. 45, E0
        add     edx, eax                                ; 2E30 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2E32 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2E35 _ 88. 02
?_171:  inc     dword [ebp-8H]                          ; 2E37 _ FF. 45, F8
?_172:  mov     eax, dword [ebp-8H]                     ; 2E3A _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2E3D _ 3B. 45, E8
        jl      ?_170                                   ; 2E40 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2E42 _ FF. 45, F4
?_173:  mov     eax, dword [ebp-0CH]                    ; 2E45 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2E48 _ 3B. 45, E4
        jl      ?_169                                   ; 2E4B _ 7C, 82
        inc     dword [ebp-4H]                          ; 2E4D _ FF. 45, FC
?_174:  mov     eax, dword [ebp+8H]                     ; 2E50 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E53 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2E56 _ 39. 45, FC
        jle near      ?_164                                   ; 2e59 _ 0f 8e, fffffeba
        nop                                             ; 2E5F _ 90
        leave                                           ; 2E60 _ C9
        ret                                             ; 2E61 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2E62 _ 55
        mov     ebp, esp                                ; 2E63 _ 89. E5
        sub     esp, 24                                 ; 2E65 _ 83. EC, 18
        sub     esp, 8                                  ; 2E68 _ 83. EC, 08
        push    52                                      ; 2E6B _ 6A, 34
        push    67                                      ; 2E6D _ 6A, 43
        call    io_out8                                 ; 2E6F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E74 _ 83. C4, 10
        sub     esp, 8                                  ; 2E77 _ 83. EC, 08
        push    156                                     ; 2E7A _ 68, 0000009C
        push    64                                      ; 2E7F _ 6A, 40
        call    io_out8                                 ; 2E81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E86 _ 83. C4, 10
        sub     esp, 8                                  ; 2E89 _ 83. EC, 08
        push    46                                      ; 2E8C _ 6A, 2E
        push    64                                      ; 2E8E _ 6A, 40
        call    io_out8                                 ; 2E90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E95 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2E98 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2EA2 _ C7. 45, F4, 00000000
        jmp     ?_176                                   ; 2EA9 _ EB, 25

?_175:  mov     eax, dword [ebp-0CH]                    ; 2EAB _ 8B. 45, F4
        shl     eax, 4                                  ; 2EAE _ C1. E0, 04
        add     eax, ?_244                              ; 2EB1 _ 05, 00000388(d)
        mov     dword [eax], 0                          ; 2EB6 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2EBC _ 8B. 45, F4
        shl     eax, 4                                  ; 2EBF _ C1. E0, 04
        add     eax, ?_245                              ; 2EC2 _ 05, 0000038C(d)
        mov     dword [eax], 0                          ; 2EC7 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2ECD _ FF. 45, F4
?_176:  cmp     dword [ebp-0CH], 499                    ; 2ED0 _ 81. 7D, F4, 000001F3
        jle near      ?_175                                   ; 2ed7 _ 7e, d2
        nop                                             ; 2ED9 _ 90
        nop                                             ; 2EDA _ 90
        leave                                           ; 2EDB _ C9
        ret                                             ; 2EDC _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2EDD _ 55
        mov     ebp, esp                                ; 2EDE _ 89. E5
        sub     esp, 16                                 ; 2EE0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2EE3 _ C7. 45, FC, 00000000
        jmp     ?_179                                   ; 2EEA _ EB, 35

?_177:  mov     eax, dword [ebp-4H]                     ; 2EEC _ 8B. 45, FC
        shl     eax, 4                                  ; 2EEF _ C1. E0, 04
        add     eax, ?_244                              ; 2EF2 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2EF7 _ 8B. 00
        test    eax, eax                                ; 2EF9 _ 85. C0
        jnz near      ?_178                                   ; 2efb _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2EFD _ 8B. 45, FC
        shl     eax, 4                                  ; 2F00 _ C1. E0, 04
        add     eax, ?_244                              ; 2F03 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2F08 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2F0E _ 8B. 45, FC
        shl     eax, 4                                  ; 2F11 _ C1. E0, 04
        add     eax, timerctl                           ; 2F14 _ 05, 00000380(d)
        add     eax, 4                                  ; 2F19 _ 83. C0, 04
        jmp     ?_180                                   ; 2F1C _ EB, 11

?_178:  inc     dword [ebp-4H]                          ; 2F1E _ FF. 45, FC
?_179:  cmp     dword [ebp-4H], 499                     ; 2F21 _ 81. 7D, FC, 000001F3
        jle near      ?_177                                   ; 2f28 _ 7e, c2
        mov     eax, 0                                  ; 2F2A _ B8, 00000000
?_180:  leave                                           ; 2F2F _ C9
        ret                                             ; 2F30 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2F31 _ 55
        mov     ebp, esp                                ; 2F32 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F34 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2F37 _ C7. 40, 04, 00000000
        nop                                             ; 2F3E _ 90
        pop     ebp                                     ; 2F3F _ 5D
        ret                                             ; 2F40 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2F41 _ 55
        mov     ebp, esp                                ; 2F42 _ 89. E5
        sub     esp, 4                                  ; 2F44 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2F47 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2F4A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2F4D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2F50 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2F53 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2F56 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2F59 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2F5C _ 88. 50, 0C
        nop                                             ; 2F5F _ 90
        leave                                           ; 2F60 _ C9
        ret                                             ; 2F61 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2F62 _ 55
        mov     ebp, esp                                ; 2F63 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F65 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2F68 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2F6B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2F6D _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2F70 _ C7. 40, 04, 00000002
        nop                                             ; 2F77 _ 90
        pop     ebp                                     ; 2F78 _ 5D
        ret                                             ; 2F79 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2F7A _ 55
        mov     ebp, esp                                ; 2F7B _ 89. E5
        sub     esp, 24                                 ; 2F7D _ 83. EC, 18
        sub     esp, 8                                  ; 2F80 _ 83. EC, 08
        push    32                                      ; 2F83 _ 6A, 20
        push    32                                      ; 2F85 _ 6A, 20
        call    io_out8                                 ; 2F87 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F8C _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2F8F _ A1, 00000380(d)
        inc     eax                                     ; 2F94 _ 40
        mov     dword [timerctl], eax                   ; 2F95 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 2F9A _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2F9E _ C7. 45, F4, 00000000
        jmp     ?_184                                   ; 2FA5 _ E9, 000000A8

?_181:  mov     eax, dword [ebp-0CH]                    ; 2FAA _ 8B. 45, F4
        shl     eax, 4                                  ; 2FAD _ C1. E0, 04
        add     eax, ?_244                              ; 2FB0 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2FB5 _ 8B. 00
        cmp     eax, 2                                  ; 2FB7 _ 83. F8, 02
        jne near      ?_182                                   ; 2fba _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2FC0 _ 8B. 45, F4
        shl     eax, 4                                  ; 2FC3 _ C1. E0, 04
        add     eax, ?_243                              ; 2FC6 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2FCB _ 8B. 00
        lea     edx, [eax-1H]                           ; 2FCD _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2FD0 _ 8B. 45, F4
        shl     eax, 4                                  ; 2FD3 _ C1. E0, 04
        add     eax, ?_243                              ; 2FD6 _ 05, 00000384(d)
        mov     dword [eax], edx                        ; 2FDB _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2FDD _ 8B. 45, F4
        shl     eax, 4                                  ; 2FE0 _ C1. E0, 04
        add     eax, ?_243                              ; 2FE3 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2FE8 _ 8B. 00
        test    eax, eax                                ; 2FEA _ 85. C0
        jnz near      ?_182                                   ; 2fec _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2FEE _ 8B. 45, F4
        shl     eax, 4                                  ; 2FF1 _ C1. E0, 04
        add     eax, ?_244                              ; 2FF4 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2FF9 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2FFF _ 8B. 45, F4
        shl     eax, 4                                  ; 3002 _ C1. E0, 04
        add     eax, ?_246                              ; 3005 _ 05, 00000390(d)
        mov     al, byte [eax]                          ; 300A _ 8A. 00
        movzx   edx, al                                 ; 300C _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 300F _ 8B. 45, F4
        shl     eax, 4                                  ; 3012 _ C1. E0, 04
        add     eax, ?_245                              ; 3015 _ 05, 0000038C(d)
        mov     eax, dword [eax]                        ; 301A _ 8B. 00
        sub     esp, 8                                  ; 301C _ 83. EC, 08
        push    edx                                     ; 301F _ 52
        push    eax                                     ; 3020 _ 50
        call    fifo8_put                               ; 3021 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3026 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3029 _ 8B. 45, F4
        shl     eax, 4                                  ; 302C _ C1. E0, 04
        add     eax, timerctl                           ; 302F _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 3034 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3037 _ A1, 00000000(d)
        cmp     edx, eax                                ; 303C _ 39. C2
        jnz near      ?_182                                   ; 303e _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3040 _ C6. 45, F3, 01
?_182:  cmp     byte [ebp-0DH], 0                       ; 3044 _ 80. 7D, F3, 00
        jz near       ?_183                                   ; 3048 _ 74, 05
        call    task_switch                             ; 304A _ E8, FFFFFFFC(rel)
?_183:  inc     dword [ebp-0CH]                         ; 304F _ FF. 45, F4
?_184:  cmp     dword [ebp-0CH], 499                    ; 3052 _ 81. 7D, F4, 000001F3
        jle near      ?_181                                   ; 3059 _ 0f 8e, ffffff4b
        nop                                             ; 305F _ 90
        leave                                           ; 3060 _ C9
        ret                                             ; 3061 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 3062 _ 55
        mov     ebp, esp                                ; 3063 _ 89. E5
        mov     eax, timerctl                           ; 3065 _ B8, 00000380(d)
        pop     ebp                                     ; 306A _ 5D
        ret                                             ; 306B _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 306C _ 55
        mov     ebp, esp                                ; 306D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 306F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3072 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3075 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3078 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 307B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 307E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3080 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3083 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3086 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3089 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 308C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3093 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3096 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 309D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 30A0 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 30A7 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 30AA _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 30AD _ 89. 50, 18
        nop                                             ; 30B0 _ 90
        pop     ebp                                     ; 30B1 _ 5D
        ret                                             ; 30B2 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 30B3 _ 55
        mov     ebp, esp                                ; 30B4 _ 89. E5
        sub     esp, 24                                 ; 30B6 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 30B9 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 30BC _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 30BF _ 83. 7D, 08, 00
        jnz near      ?_185                                   ; 30c3 _ 75, 0a
        mov     eax, 4294967295                         ; 30C5 _ B8, FFFFFFFF
        jmp     ?_189                                   ; 30CA _ E9, 0000009F

?_185:  mov     eax, dword [ebp+8H]                     ; 30CF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 30D2 _ 8B. 40, 10
        test    eax, eax                                ; 30D5 _ 85. C0
        jnz near      ?_186                                   ; 30d7 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 30D9 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 30DC _ 8B. 40, 14
        or      eax, 01H                                ; 30DF _ 83. C8, 01
        mov     edx, eax                                ; 30E2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 30E4 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 30E7 _ 89. 50, 14
        mov     eax, 4294967295                         ; 30EA _ B8, FFFFFFFF
        jmp     ?_189                                   ; 30EF _ EB, 7D

?_186:  mov     eax, dword [ebp+8H]                     ; 30F1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 30F4 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 30F6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30F9 _ 8B. 40, 04
        add     edx, eax                                ; 30FC _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 30FE _ 8A. 45, F4
        mov     byte [edx], al                          ; 3101 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3103 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3106 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3109 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 310C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 310F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3112 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3115 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3118 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 311B _ 8B. 40, 0C
        cmp     edx, eax                                ; 311E _ 39. C2
        jnz near      ?_187                                   ; 3120 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 3122 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3125 _ C7. 40, 04, 00000000
?_187:  mov     eax, dword [ebp+8H]                     ; 312C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 312F _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3132 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3135 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3138 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 313B _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 313E _ 8B. 40, 18
        test    eax, eax                                ; 3141 _ 85. C0
        jz near       ?_188                                   ; 3143 _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 3145 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3148 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 314B _ 8B. 40, 04
        cmp     eax, 2                                  ; 314E _ 83. F8, 02
        jz near       ?_188                                   ; 3151 _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 3153 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3156 _ 8B. 40, 18
        sub     esp, 4                                  ; 3159 _ 83. EC, 04
        push    0                                       ; 315C _ 6A, 00
        push    -1                                      ; 315E _ 6A, FF
        push    eax                                     ; 3160 _ 50
        call    task_run                                ; 3161 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3166 _ 83. C4, 10
?_188:  mov     eax, 0                                  ; 3169 _ B8, 00000000
?_189:  leave                                           ; 316E _ C9
        ret                                             ; 316F _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 3170 _ 55
        mov     ebp, esp                                ; 3171 _ 89. E5
        sub     esp, 16                                 ; 3173 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3176 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 3179 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 317C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 317F _ 8B. 40, 0C
        cmp     edx, eax                                ; 3182 _ 39. C2
        jnz near      ?_190                                   ; 3184 _ 75, 07
        mov     eax, 4294967295                         ; 3186 _ B8, FFFFFFFF
        jmp     ?_192                                   ; 318B _ EB, 50

?_190:  mov     eax, dword [ebp+8H]                     ; 318D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3190 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3192 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3195 _ 8B. 40, 08
        add     eax, edx                                ; 3198 _ 01. D0
        mov     al, byte [eax]                          ; 319A _ 8A. 00
        movzx   eax, al                                 ; 319C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 319F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 31A2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 31A5 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 31A8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 31AB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 31AE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 31B1 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 31B4 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 31B7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 31BA _ 8B. 40, 0C
        cmp     edx, eax                                ; 31BD _ 39. C2
        jnz near      ?_191                                   ; 31bf _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 31C1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 31C4 _ C7. 40, 08, 00000000
?_191:  mov     eax, dword [ebp+8H]                     ; 31CB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 31CE _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 31D1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 31D4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 31D7 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 31DA _ 8B. 45, FC
?_192:  leave                                           ; 31DD _ C9
        ret                                             ; 31DE _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 31DF _ 55
        mov     ebp, esp                                ; 31E0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 31E2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 31E5 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 31E8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 31EB _ 8B. 40, 10
        sub     edx, eax                                ; 31EE _ 29. C2
        mov     eax, edx                                ; 31F0 _ 89. D0
        pop     ebp                                     ; 31F2 _ 5D
        ret                                             ; 31F3 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 31F4 _ 55
        mov     ebp, esp                                ; 31F5 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 31F7 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_193                                   ; 31FE _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3200 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3207 _ 8B. 45, 0C
        shr     eax, 12                                 ; 320A _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 320D _ 89. 45, 0C
?_193:  mov     eax, dword [ebp+0CH]                    ; 3210 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 3213 _ 8B. 55, 08
        mov     word [edx], ax                          ; 3216 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 3219 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 321C _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 321F _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 3223 _ 8B. 45, 10
        sar     eax, 16                                 ; 3226 _ C1. F8, 10
        mov     dl, al                                  ; 3229 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 322B _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 322E _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3231 _ 8B. 45, 14
        mov     dl, al                                  ; 3234 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3236 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3239 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 323C _ 8B. 45, 0C
        shr     eax, 16                                 ; 323F _ C1. E8, 10
        and     eax, 0FH                                ; 3242 _ 83. E0, 0F
        mov     dl, al                                  ; 3245 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 3247 _ 8B. 45, 14
        sar     eax, 8                                  ; 324A _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 324D _ 83. E0, F0
        or      eax, edx                                ; 3250 _ 09. D0
        mov     dl, al                                  ; 3252 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3254 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3257 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 325A _ 8B. 45, 10
        shr     eax, 24                                 ; 325D _ C1. E8, 18
        mov     dl, al                                  ; 3260 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 3262 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3265 _ 88. 50, 07
        nop                                             ; 3268 _ 90
        pop     ebp                                     ; 3269 _ 5D
        ret                                             ; 326A _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 326B _ 55
        mov     ebp, esp                                ; 326C _ 89. E5
        mov     eax, dword [taskctl]                    ; 326E _ A1, 000022C8(d)
        pop     ebp                                     ; 3273 _ 5D
        ret                                             ; 3274 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 3275 _ 55
        mov     ebp, esp                                ; 3276 _ 89. E5
        sub     esp, 16                                 ; 3278 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 327B _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 3281 _ 8B. 55, 08
        mov     eax, edx                                ; 3284 _ 89. D0
        shl     eax, 2                                  ; 3286 _ C1. E0, 02
        add     eax, edx                                ; 3289 _ 01. D0
        shl     eax, 2                                  ; 328B _ C1. E0, 02
        add     eax, ecx                                ; 328E _ 01. C8
        add     eax, 8                                  ; 3290 _ 83. C0, 08
        mov     dword [eax], 0                          ; 3293 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 3299 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 329F _ 8B. 55, 08
        mov     eax, edx                                ; 32A2 _ 89. D0
        shl     eax, 2                                  ; 32A4 _ C1. E0, 02
        add     eax, edx                                ; 32A7 _ 01. D0
        shl     eax, 2                                  ; 32A9 _ C1. E0, 02
        add     eax, ecx                                ; 32AC _ 01. C8
        add     eax, 12                                 ; 32AE _ 83. C0, 0C
        mov     dword [eax], 0                          ; 32B1 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 32B7 _ C7. 45, FC, 00000000
        jmp     ?_195                                   ; 32BE _ EB, 20

?_194:  mov     ecx, dword [taskctl]                    ; 32C0 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 32C6 _ 8B. 55, FC
        mov     eax, edx                                ; 32C9 _ 89. D0
        add     eax, eax                                ; 32CB _ 01. C0
        add     eax, edx                                ; 32CD _ 01. D0
        shl     eax, 3                                  ; 32CF _ C1. E0, 03
        add     eax, ecx                                ; 32D2 _ 01. C8
        add     eax, 16                                 ; 32D4 _ 83. C0, 10
        mov     dword [eax], 0                          ; 32D7 _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 32DD _ FF. 45, FC
?_195:  cmp     dword [ebp-4H], 2                       ; 32E0 _ 83. 7D, FC, 02
        jle near      ?_194                                   ; 32e4 _ 7e, da
        nop                                             ; 32E6 _ 90
        nop                                             ; 32E7 _ 90
        leave                                           ; 32E8 _ C9
        ret                                             ; 32E9 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 32EA _ 55
        mov     ebp, esp                                ; 32EB _ 89. E5
        push    ebx                                     ; 32ED _ 53
        sub     esp, 20                                 ; 32EE _ 83. EC, 14
        call    get_addr_gdt                            ; 32F1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 32F6 _ 89. 45, F0
        sub     esp, 8                                  ; 32F9 _ 83. EC, 08
        push    668                                     ; 32FC _ 68, 0000029C
        push    dword [ebp+8H]                          ; 3301 _ FF. 75, 08
        call    memman_alloc_4k                         ; 3304 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3309 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 330C _ A3, 000022C8(d)
        mov     dword [ebp-0CH], 0                      ; 3311 _ C7. 45, F4, 00000000
        jmp     ?_197                                   ; 3318 _ E9, 00000088

?_196:  mov     ecx, dword [taskctl]                    ; 331D _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 3323 _ 8B. 55, F4
        mov     eax, edx                                ; 3326 _ 89. D0
        shl     eax, 5                                  ; 3328 _ C1. E0, 05
        sub     eax, edx                                ; 332B _ 29. D0
        shl     eax, 2                                  ; 332D _ C1. E0, 02
        add     eax, ecx                                ; 3330 _ 01. C8
        add     eax, 72                                 ; 3332 _ 83. C0, 48
        mov     dword [eax], 0                          ; 3335 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 333B _ 8B. 45, F4
        add     eax, 7                                  ; 333E _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 3341 _ 8B. 1D, 000022C8(d)
        lea     ecx, [eax*8]                            ; 3347 _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 334E _ 8B. 55, F4
        mov     eax, edx                                ; 3351 _ 89. D0
        shl     eax, 5                                  ; 3353 _ C1. E0, 05
        sub     eax, edx                                ; 3356 _ 29. D0
        shl     eax, 2                                  ; 3358 _ C1. E0, 02
        add     eax, ebx                                ; 335B _ 01. D8
        add     eax, 68                                 ; 335D _ 83. C0, 44
        mov     dword [eax], ecx                        ; 3360 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 3362 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 3368 _ 8B. 55, F4
        mov     eax, edx                                ; 336B _ 89. D0
        shl     eax, 5                                  ; 336D _ C1. E0, 05
        sub     eax, edx                                ; 3370 _ 29. D0
        shl     eax, 2                                  ; 3372 _ C1. E0, 02
        add     eax, 80                                 ; 3375 _ 83. C0, 50
        add     eax, ecx                                ; 3378 _ 01. C8
        add     eax, 8                                  ; 337A _ 83. C0, 08
        mov     edx, eax                                ; 337D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 337F _ 8B. 45, F4
        add     eax, 7                                  ; 3382 _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 3385 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 338C _ 8B. 45, F0
        add     eax, ecx                                ; 338F _ 01. C8
        push    137                                     ; 3391 _ 68, 00000089
        push    edx                                     ; 3396 _ 52
        push    103                                     ; 3397 _ 6A, 67
        push    eax                                     ; 3399 _ 50
        call    set_segmdesc                            ; 339A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 339F _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 33A2 _ FF. 45, F4
?_197:  cmp     dword [ebp-0CH], 4                      ; 33A5 _ 83. 7D, F4, 04
        jle near      ?_196                                   ; 33a9 _ 0f 8e, ffffff6e
        mov     dword [ebp-0CH], 0                      ; 33AF _ C7. 45, F4, 00000000
        jmp     ?_199                                   ; 33B6 _ EB, 11

?_198:  sub     esp, 12                                 ; 33B8 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 33BB _ FF. 75, F4
        call    init_task_level                         ; 33BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33C3 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 33C6 _ FF. 45, F4
?_199:  cmp     dword [ebp-0CH], 2                      ; 33C9 _ 83. 7D, F4, 02
        jle near      ?_198                                   ; 33cd _ 7e, e9
        call    task_alloc                              ; 33CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 33D4 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 33D7 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 33DA _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 33E1 _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 33E4 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 33EB _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 33EE _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 33F5 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 33F8 _ FF. 75, EC
        call    task_add                                ; 33FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3400 _ 83. C4, 10
        call    task_switchsub                          ; 3403 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3408 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 340B _ 8B. 00
        sub     esp, 12                                 ; 340D _ 83. EC, 0C
        push    eax                                     ; 3410 _ 50
        call    load_tr                                 ; 3411 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3416 _ 83. C4, 10
        call    timer_alloc                             ; 3419 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 341E _ A3, 000022C4(d)
        mov     eax, dword [ebp-14H]                    ; 3423 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 3426 _ 8B. 40, 08
        mov     edx, eax                                ; 3429 _ 89. C2
        mov     eax, dword [task_timer]                 ; 342B _ A1, 000022C4(d)
        sub     esp, 8                                  ; 3430 _ 83. EC, 08
        push    edx                                     ; 3433 _ 52
        push    eax                                     ; 3434 _ 50
        call    timer_settime                           ; 3435 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 343A _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 343D _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 3440 _ 8B. 5D, FC
        leave                                           ; 3443 _ C9
        ret                                             ; 3444 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3445 _ 55
        mov     ebp, esp                                ; 3446 _ 89. E5
        sub     esp, 16                                 ; 3448 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 344B _ C7. 45, FC, 00000000
        jmp     ?_202                                   ; 3452 _ E9, 000000ED

?_200:  mov     ecx, dword [taskctl]                    ; 3457 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 345D _ 8B. 55, FC
        mov     eax, edx                                ; 3460 _ 89. D0
        shl     eax, 5                                  ; 3462 _ C1. E0, 05
        sub     eax, edx                                ; 3465 _ 29. D0
        shl     eax, 2                                  ; 3467 _ C1. E0, 02
        add     eax, ecx                                ; 346A _ 01. C8
        add     eax, 72                                 ; 346C _ 83. C0, 48
        mov     eax, dword [eax]                        ; 346F _ 8B. 00
        test    eax, eax                                ; 3471 _ 85. C0
        jne near      ?_201                                   ; 3473 _ 0f 85, 000000c8
        mov     ecx, dword [taskctl]                    ; 3479 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 347F _ 8B. 55, FC
        mov     eax, edx                                ; 3482 _ 89. D0
        shl     eax, 5                                  ; 3484 _ C1. E0, 05
        sub     eax, edx                                ; 3487 _ 29. D0
        shl     eax, 2                                  ; 3489 _ C1. E0, 02
        add     eax, 64                                 ; 348C _ 83. C0, 40
        add     eax, ecx                                ; 348F _ 01. C8
        add     eax, 4                                  ; 3491 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 3494 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 3497 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 349A _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 34A1 _ 8B. 45, F8
        mov     dword [eax+38H], 514                    ; 34A4 _ C7. 40, 38, 00000202
        mov     eax, dword [ebp-8H]                     ; 34AB _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 34AE _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 34B5 _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 34B8 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 34BF _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 34C2 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 34C9 _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 34CC _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 34D3 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 34D6 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 34DD _ 8B. 45, FC
        inc     eax                                     ; 34E0 _ 40
        shl     eax, 9                                  ; 34E1 _ C1. E0, 09
        mov     edx, eax                                ; 34E4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 34E6 _ 8B. 45, F8
        mov     dword [eax+4CH], edx                    ; 34E9 _ 89. 50, 4C
        mov     eax, dword [ebp-8H]                     ; 34EC _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 34EF _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 34F6 _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 34F9 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 3500 _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 3503 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 350A _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 350D _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 3514 _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 3517 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 351E _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 3521 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 3528 _ 8B. 45, F8
        mov     dword [eax+74H], 0                      ; 352B _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-8H]                     ; 3532 _ 8B. 45, F8
        mov     dword [eax+78H], 1073741824             ; 3535 _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-8H]                     ; 353C _ 8B. 45, F8
        jmp     ?_203                                   ; 353F _ EB, 12

?_201:  inc     dword [ebp-4H]                          ; 3541 _ FF. 45, FC
?_202:  cmp     dword [ebp-4H], 4                       ; 3544 _ 83. 7D, FC, 04
        jle near      ?_200                                   ; 3548 _ 0f 8e, ffffff09
        mov     eax, 0                                  ; 354E _ B8, 00000000
?_203:  leave                                           ; 3553 _ C9
        ret                                             ; 3554 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3555 _ 55
        mov     ebp, esp                                ; 3556 _ 89. E5
        sub     esp, 8                                  ; 3558 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 355B _ 83. 7D, 0C, 00
        jns     ?_204                                   ; 355F _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3561 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3564 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3567 _ 89. 45, 0C
?_204:  cmp     dword [ebp+10H], 0                      ; 356A _ 83. 7D, 10, 00
        jle near      ?_205                                   ; 356e _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 3570 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3573 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3576 _ 89. 50, 08
?_205:  mov     eax, dword [ebp+8H]                     ; 3579 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 357C _ 8B. 40, 04
        cmp     eax, 2                                  ; 357F _ 83. F8, 02
        jnz near      ?_206                                   ; 3582 _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 3584 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3587 _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 358A _ 39. 45, 0C
        jz near       ?_206                                   ; 358d _ 74, 0e
        sub     esp, 12                                 ; 358F _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3592 _ FF. 75, 08
        call    task_remove                             ; 3595 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 359A _ 83. C4, 10
?_206:  mov     eax, dword [ebp+8H]                     ; 359D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35A0 _ 8B. 40, 04
        cmp     eax, 2                                  ; 35A3 _ 83. F8, 02
        jz near       ?_207                                   ; 35a6 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 35A8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 35AB _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 35AE _ 89. 50, 0C
        sub     esp, 12                                 ; 35B1 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 35B4 _ FF. 75, 08
        call    task_add                                ; 35B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35BC _ 83. C4, 10
?_207:  mov     eax, dword [taskctl]                    ; 35BF _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 35C4 _ C7. 40, 04, 00000001
        nop                                             ; 35CB _ 90
        leave                                           ; 35CC _ C9
        ret                                             ; 35CD _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 35CE _ 55
        mov     ebp, esp                                ; 35CF _ 89. E5
        sub     esp, 24                                 ; 35D1 _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 35D4 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 35DA _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 35DF _ 8B. 10
        mov     eax, edx                                ; 35E1 _ 89. D0
        shl     eax, 2                                  ; 35E3 _ C1. E0, 02
        add     eax, edx                                ; 35E6 _ 01. D0
        shl     eax, 2                                  ; 35E8 _ C1. E0, 02
        add     eax, ecx                                ; 35EB _ 01. C8
        add     eax, 8                                  ; 35ED _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 35F0 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 35F3 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 35F6 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 35F9 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 35FC _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3600 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3603 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3606 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3609 _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 360C _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 360F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3612 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3615 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3618 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 361B _ 8B. 00
        cmp     edx, eax                                ; 361D _ 39. C2
        jnz near      ?_208                                   ; 361f _ 75, 0a
        mov     eax, dword [ebp-0CH]                    ; 3621 _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 3624 _ C7. 40, 04, 00000000
?_208:  mov     eax, dword [taskctl]                    ; 362B _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 3630 _ 8B. 40, 04
        test    eax, eax                                ; 3633 _ 85. C0
        jz near       ?_209                                   ; 3635 _ 74, 24
        call    task_switchsub                          ; 3637 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 363C _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 3642 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3647 _ 8B. 10
        mov     eax, edx                                ; 3649 _ 89. D0
        shl     eax, 2                                  ; 364B _ C1. E0, 02
        add     eax, edx                                ; 364E _ 01. D0
        shl     eax, 2                                  ; 3650 _ C1. E0, 02
        add     eax, ecx                                ; 3653 _ 01. C8
        add     eax, 8                                  ; 3655 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 3658 _ 89. 45, F4
?_209:  mov     eax, dword [ebp-0CH]                    ; 365B _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 365E _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3661 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3664 _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 3668 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 366B _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 366E _ 8B. 40, 08
        mov     edx, eax                                ; 3671 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3673 _ A1, 000022C4(d)
        sub     esp, 8                                  ; 3678 _ 83. EC, 08
        push    edx                                     ; 367B _ 52
        push    eax                                     ; 367C _ 50
        call    timer_settime                           ; 367D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3682 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 3685 _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 3688 _ 3B. 45, F0
        jz near       ?_210                                   ; 368b _ 74, 1a
        cmp     dword [ebp-14H], 0                      ; 368D _ 83. 7D, EC, 00
        jz near       ?_210                                   ; 3691 _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 3693 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3696 _ 8B. 00
        sub     esp, 8                                  ; 3698 _ 83. EC, 08
        push    eax                                     ; 369B _ 50
        push    0                                       ; 369C _ 6A, 00
        call    farjmp                                  ; 369E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 36A3 _ 83. C4, 10
        nop                                             ; 36A6 _ 90
?_210:  nop                                             ; 36A7 _ 90
        leave                                           ; 36A8 _ C9
        ret                                             ; 36A9 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 36AA _ 55
        mov     ebp, esp                                ; 36AB _ 89. E5
        sub     esp, 24                                 ; 36AD _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 36B0 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 36B7 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 36BE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 36C1 _ 8B. 40, 04
        cmp     eax, 2                                  ; 36C4 _ 83. F8, 02
        jnz near      ?_211                                   ; 36c7 _ 75, 52
        call    task_now                                ; 36C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 36CE _ 89. 45, F0
        sub     esp, 12                                 ; 36D1 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 36D4 _ FF. 75, 08
        call    task_remove                             ; 36D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 36DC _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 36DF _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 36E6 _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 36E9 _ 3B. 45, F0
        jnz near      ?_211                                   ; 36ec _ 75, 2d
        call    task_switchsub                          ; 36EE _ E8, FFFFFFFC(rel)
        call    task_now                                ; 36F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 36F8 _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 36FB _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 3702 _ 83. 7D, F0, 00
        jz near       ?_211                                   ; 3706 _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 3708 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 370B _ 8B. 00
        sub     esp, 8                                  ; 370D _ 83. EC, 08
        push    eax                                     ; 3710 _ 50
        push    0                                       ; 3711 _ 6A, 00
        call    farjmp                                  ; 3713 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3718 _ 83. C4, 10
?_211:  mov     eax, dword [ebp-0CH]                    ; 371B _ 8B. 45, F4
        leave                                           ; 371E _ C9
        ret                                             ; 371F _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3720 _ 55
        mov     ebp, esp                                ; 3721 _ 89. E5
        sub     esp, 16                                 ; 3723 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3726 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 372C _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3731 _ 8B. 10
        mov     eax, edx                                ; 3733 _ 89. D0
        shl     eax, 2                                  ; 3735 _ C1. E0, 02
        add     eax, edx                                ; 3738 _ 01. D0
        shl     eax, 2                                  ; 373A _ C1. E0, 02
        add     eax, ecx                                ; 373D _ 01. C8
        add     eax, 8                                  ; 373F _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3742 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3745 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3748 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 374B _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 374E _ 8B. 44 90, 08
        leave                                           ; 3752 _ C9
        ret                                             ; 3753 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 3754 _ 55
        mov     ebp, esp                                ; 3755 _ 89. E5
        sub     esp, 16                                 ; 3757 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 375A _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 3760 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3763 _ 8B. 50, 0C
        mov     eax, edx                                ; 3766 _ 89. D0
        shl     eax, 2                                  ; 3768 _ C1. E0, 02
        add     eax, edx                                ; 376B _ 01. D0
        shl     eax, 2                                  ; 376D _ C1. E0, 02
        add     eax, ecx                                ; 3770 _ 01. C8
        add     eax, 8                                  ; 3772 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3775 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3778 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 377B _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 377D _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 3780 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3783 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3787 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 378A _ 8B. 00
        lea     edx, [eax+1H]                           ; 378C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 378F _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3792 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3794 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3797 _ C7. 40, 04, 00000002
        nop                                             ; 379E _ 90
        leave                                           ; 379F _ C9
        ret                                             ; 37A0 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 37A1 _ 55
        mov     ebp, esp                                ; 37A2 _ 89. E5
        sub     esp, 16                                 ; 37A4 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 37A7 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 37AD _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 37B0 _ 8B. 50, 0C
        mov     eax, edx                                ; 37B3 _ 89. D0
        shl     eax, 2                                  ; 37B5 _ C1. E0, 02
        add     eax, edx                                ; 37B8 _ 01. D0
        shl     eax, 2                                  ; 37BA _ C1. E0, 02
        add     eax, ecx                                ; 37BD _ 01. C8
        add     eax, 8                                  ; 37BF _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 37C2 _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 37C5 _ C7. 45, FC, 00000000
        jmp     ?_214                                   ; 37CC _ EB, 22

?_212:  mov     eax, dword [ebp-8H]                     ; 37CE _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 37D1 _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 37D4 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 37D8 _ 39. 45, 08
        jnz near      ?_213                                   ; 37db _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 37DD _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 37E0 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 37E3 _ C7. 44 90, 08, 00000000
        jmp     ?_215                                   ; 37EB _ EB, 0D

?_213:  inc     dword [ebp-4H]                          ; 37ED _ FF. 45, FC
?_214:  mov     eax, dword [ebp-8H]                     ; 37F0 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 37F3 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 37F5 _ 39. 45, FC
        jl      ?_212                                   ; 37F8 _ 7C, D4
?_215:  mov     eax, dword [ebp-8H]                     ; 37FA _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 37FD _ 8B. 00
        lea     edx, [eax-1H]                           ; 37FF _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 3802 _ 8B. 45, F8
        mov     dword [eax], edx                        ; 3805 _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 3807 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 380A _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 380D _ 39. 45, FC
        jge near      ?_216                                   ; 3810 _ 7d, 0f
        mov     eax, dword [ebp-8H]                     ; 3812 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 3815 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3818 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 381B _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 381E _ 89. 50, 04
?_216:  mov     eax, dword [ebp-8H]                     ; 3821 _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 3824 _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 3827 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 382A _ 8B. 00
        cmp     edx, eax                                ; 382C _ 39. C2
        jl      ?_217                                   ; 382E _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 3830 _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 3833 _ C7. 40, 04, 00000000
?_217:  mov     eax, dword [ebp+8H]                     ; 383A _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 383D _ C7. 40, 04, 00000001
        jmp     ?_219                                   ; 3844 _ EB, 1A

?_218:  mov     eax, dword [ebp-4H]                     ; 3846 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 3849 _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 384C _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 384F _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 3853 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3856 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 3859 _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 385D _ FF. 45, FC
?_219:  mov     eax, dword [ebp-8H]                     ; 3860 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3863 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 3865 _ 39. 45, FC
        jl      ?_218                                   ; 3868 _ 7C, DC
        nop                                             ; 386A _ 90
        leave                                           ; 386B _ C9
        ret                                             ; 386C _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 386D _ 55
        mov     ebp, esp                                ; 386E _ 89. E5
        sub     esp, 16                                 ; 3870 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3873 _ C7. 45, FC, 00000000
        jmp     ?_221                                   ; 387A _ EB, 21

?_220:  mov     ecx, dword [taskctl]                    ; 387C _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 3882 _ 8B. 55, FC
        mov     eax, edx                                ; 3885 _ 89. D0
        shl     eax, 2                                  ; 3887 _ C1. E0, 02
        add     eax, edx                                ; 388A _ 01. D0
        shl     eax, 2                                  ; 388C _ C1. E0, 02
        add     eax, ecx                                ; 388F _ 01. C8
        add     eax, 8                                  ; 3891 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 3894 _ 8B. 00
        test    eax, eax                                ; 3896 _ 85. C0
        jg  near      ?_222                                   ; 3898 _ 7f, 0b
        inc     dword [ebp-4H]                          ; 389A _ FF. 45, FC
?_221:  cmp     dword [ebp-4H], 2                       ; 389D _ 83. 7D, FC, 02
        jle near      ?_220                                   ; 38a1 _ 7e, d9
        jmp     ?_223                                   ; 38A3 _ EB, 01

?_222:  nop                                             ; 38A5 _ 90
?_223:  mov     eax, dword [taskctl]                    ; 38A6 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 38AB _ 8B. 55, FC
        mov     dword [eax], edx                        ; 38AE _ 89. 10
        mov     eax, dword [taskctl]                    ; 38B0 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 38B5 _ C7. 40, 04, 00000000
        nop                                             ; 38BC _ 90
        leave                                           ; 38BD _ C9
        ret                                             ; 38BE _ C3
; task_switchsub End of function



?_224:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_225:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_226:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_227:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0017 _ 3[sec].

?_228:                                                  ; byte
        db 3EH, 00H                                     ; 001E _ >.

?_229:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0020 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0028 _ sk b.

?_230:                                                  ; byte
        db 42H, 00H                                     ; 002D _ B.

?_231:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002F _ page is:
        db 20H, 00H                                     ; 0037 _  .

?_232:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0039 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0041 _ L: .

?_233:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0045 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004D _ H: .

?_234:                                                  ; byte
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

?_235:  db 00H                                          ; 0102 _ .

?_236:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0103 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 010B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0113 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 011B _ .....

table_rgb.1962:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0120 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2009:                                            ; byte
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

closebtn.2128:                                          ; byte
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

caps_lock:                                              ; dword
        resd    1                                       ; 0004

bootInfo:                                               ; qword
        resb    4                                       ; 0008

?_237:                                                  ; dword
        resb    2                                       ; 000C

?_238:  resw    1                                       ; 000E

keyinfo:                                                ; byte
        resb    24                                      ; 0010

?_239:  resd    1                                       ; 0028

mouseinfo:                                              ; byte
        resb    52                                      ; 002C

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_240:  resd    1                                       ; 010C

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

task_a.1871:                                            ; dword
        resd    3                                       ; 0274

tss_a.1870:                                             ; byte
        resb    128                                     ; 0280

tss_b.1869:                                             ; byte
        resb    104                                     ; 0300

task_b.1855:                                            ; byte
        resb    12                                      ; 0368

str.2057:                                               ; byte
        resb    1                                       ; 0374

?_241:  resb    9                                       ; 0375

?_242:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    1                                       ; 0380

?_243:                                                  ; byte
        resb    4                                       ; 0384

?_244:                                                  ; byte
        resb    4                                       ; 0388

?_245:                                                  ; byte
        resb    4                                       ; 038C

?_246:                                                  ; byte
        resb    7988                                    ; 0390

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


