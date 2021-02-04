; Disassembly of file: ckernel.o
; Mon Feb  1 22:00:07 2021
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
        mov     eax, dword [?_195]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000011C(d)
        mov     ax, word [?_196]                        ; 002B _ 66: A1, 00000006(d)
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
        push    ?_184                                   ; 02B9 _ 68, 00000000(d)
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
        mov     dword [task_a.1843], eax                ; 0336 _ A3, 00000264(d)
        mov     eax, dword [task_a.1843]                ; 033B _ A1, 00000264(d)
        mov     dword [?_197], eax                      ; 0340 _ A3, 00000020(d)
        mov     dword [ebp-62H], 1802723700             ; 0345 _ C7. 45, 9E, 6B736174
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-5EH], 0                       ; 034C _ 66: C7. 45, A2, 0000
        mov     dword [ebp-14H], 0                      ; 0352 _ C7. 45, EC, 00000000
        mov     dword [ebp-14H], 0                      ; 0359 _ C7. 45, EC, 00000000
        jmp     ?_002                                   ; 0360 _ E9, 0000017A

?_001:  mov     eax, dword [shtctl]                     ; 0365 _ A1, 00000244(d)
        sub     esp, 12                                 ; 036A _ 83. EC, 0C
        push    eax                                     ; 036D _ 50
        call    sheet_alloc                             ; 036E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0373 _ 83. C4, 10
        mov     edx, dword [ebp-14H]                    ; 0376 _ 8B. 55, EC
        mov     dword [ebp+edx*4-5CH], eax              ; 0379 _ 89. 44 95, A4
        mov     eax, dword [memman]                     ; 037D _ A1, 00000000(d)
        sub     esp, 8                                  ; 0382 _ 83. EC, 08
        push    7488                                    ; 0385 _ 68, 00001D40
        push    eax                                     ; 038A _ 50
        call    memman_alloc_4k                         ; 038B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0390 _ 83. C4, 10
        mov     dword [ebp-4CH], eax                    ; 0393 _ 89. 45, B4
        mov     eax, dword [ebp-14H]                    ; 0396 _ 8B. 45, EC
        add     eax, 98                                 ; 0399 _ 83. C0, 62
        mov     byte [ebp-4DH], al                      ; 039C _ 88. 45, B3
        mov     al, byte [ebp-4DH]                      ; 039F _ 8A. 45, B3
        mov     byte [ebp-5EH], al                      ; 03A2 _ 88. 45, A2
        mov     eax, dword [ebp-14H]                    ; 03A5 _ 8B. 45, EC
        mov     eax, dword [ebp+eax*4-5CH]              ; 03A8 _ 8B. 44 85, A4
        sub     esp, 12                                 ; 03AC _ 83. EC, 0C
        push    -1                                      ; 03AF _ 6A, FF
        push    52                                      ; 03B1 _ 6A, 34
        push    144                                     ; 03B3 _ 68, 00000090
        push    dword [ebp-4CH]                         ; 03B8 _ FF. 75, B4
        push    eax                                     ; 03BB _ 50
        call    sheet_setbuf                            ; 03BC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C1 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 03C4 _ 8B. 45, EC
        mov     edx, dword [ebp+eax*4-5CH]              ; 03C7 _ 8B. 54 85, A4
        mov     eax, dword [shtctl]                     ; 03CB _ A1, 00000244(d)
        sub     esp, 4                                  ; 03D0 _ 83. EC, 04
        lea     ecx, [ebp-62H]                          ; 03D3 _ 8D. 4D, 9E
        push    ecx                                     ; 03D6 _ 51
        push    edx                                     ; 03D7 _ 52
        push    eax                                     ; 03D8 _ 50
        call    make_window8                            ; 03D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DE _ 83. C4, 10
        call    task_alloc                              ; 03E1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 03E6 _ 8B. 55, EC
        mov     dword [task_b.1827+edx*4], eax          ; 03E9 _ 89. 04 95, 00000268(d)
        mov     eax, dword [ebp-14H]                    ; 03F0 _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 03F3 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+68H], 0                      ; 03FA _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-14H]                    ; 0401 _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0404 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+6CH], 1073741824             ; 040B _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-3CH]                    ; 0412 _ 8B. 45, C4
        neg     eax                                     ; 0415 _ F7. D8
        lea     edx, [task_b_main+eax]                  ; 0417 _ 8D. 90, 00000000(d)
        mov     eax, dword [ebp-14H]                    ; 041D _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0420 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+28H], edx                    ; 0427 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 042A _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 042D _ 8B. 04 85, 00000268(d)
        mov     dword [eax+50H], 0                      ; 0434 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-14H]                    ; 043B _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 043E _ 8B. 04 85, 00000268(d)
        mov     dword [eax+54H], 8                      ; 0445 _ C7. 40, 54, 00000008
        mov     eax, dword [ebp-14H]                    ; 044C _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 044F _ 8B. 04 85, 00000268(d)
        mov     dword [eax+58H], 32                     ; 0456 _ C7. 40, 58, 00000020
        mov     eax, dword [ebp-14H]                    ; 045D _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0460 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+5CH], 24                     ; 0467 _ C7. 40, 5C, 00000018
        mov     eax, dword [ebp-14H]                    ; 046E _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0471 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+60H], 0                      ; 0478 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-14H]                    ; 047F _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0482 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+64H], 16                     ; 0489 _ C7. 40, 64, 00000010
        mov     eax, dword [ebp-14H]                    ; 0490 _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 0493 _ 8B. 04 85, 00000268(d)
        mov     edx, dword [eax+40H]                    ; 049A _ 8B. 50, 40
        mov     eax, dword [ebp-14H]                    ; 049D _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 04A0 _ 8B. 04 85, 00000268(d)
        sub     edx, 8                                  ; 04A7 _ 83. EA, 08
        mov     dword [eax+40H], edx                    ; 04AA _ 89. 50, 40
        mov     eax, dword [ebp-14H]                    ; 04AD _ 8B. 45, EC
        mov     edx, dword [ebp+eax*4-5CH]              ; 04B0 _ 8B. 54 85, A4
        mov     eax, dword [ebp-14H]                    ; 04B4 _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 04B7 _ 8B. 04 85, 00000268(d)
        mov     eax, dword [eax+40H]                    ; 04BE _ 8B. 40, 40
        add     eax, 4                                  ; 04C1 _ 83. C0, 04
        mov     dword [eax], edx                        ; 04C4 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 04C6 _ 8B. 45, EC
        mov     eax, dword [task_b.1827+eax*4]          ; 04C9 _ 8B. 04 85, 00000268(d)
        sub     esp, 12                                 ; 04D0 _ 83. EC, 0C
        push    eax                                     ; 04D3 _ 50
        call    task_run                                ; 04D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D9 _ 83. C4, 10
        inc     dword [ebp-14H]                         ; 04DC _ FF. 45, EC
?_002:  cmp     dword [ebp-14H], 1                      ; 04DF _ 83. 7D, EC, 01
        jle near      ?_001                                   ; 04e3 _ 0f 8e, fffffe7c
        mov     edx, dword [ebp-5CH]                    ; 04E9 _ 8B. 55, A4
        mov     eax, dword [shtctl]                     ; 04EC _ A1, 00000244(d)
        push    28                                      ; 04F1 _ 6A, 1C
        push    16                                      ; 04F3 _ 6A, 10
        push    edx                                     ; 04F5 _ 52
        push    eax                                     ; 04F6 _ 50
        call    sheet_slide                             ; 04F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04FC _ 83. C4, 10
        mov     edx, dword [ebp-5CH]                    ; 04FF _ 8B. 55, A4
        mov     eax, dword [shtctl]                     ; 0502 _ A1, 00000244(d)
        sub     esp, 4                                  ; 0507 _ 83. EC, 04
        push    1                                       ; 050A _ 6A, 01
        push    edx                                     ; 050C _ 52
        push    eax                                     ; 050D _ 50
        call    sheet_updown                            ; 050E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0513 _ 83. C4, 10
        mov     edx, dword [ebp-58H]                    ; 0516 _ 8B. 55, A8
        mov     eax, dword [shtctl]                     ; 0519 _ A1, 00000244(d)
        push    28                                      ; 051E _ 6A, 1C
        push    160                                     ; 0520 _ 68, 000000A0
        push    edx                                     ; 0525 _ 52
        push    eax                                     ; 0526 _ 50
        call    sheet_slide                             ; 0527 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 052C _ 83. C4, 10
        mov     edx, dword [ebp-58H]                    ; 052F _ 8B. 55, A8
        mov     eax, dword [shtctl]                     ; 0532 _ A1, 00000244(d)
        sub     esp, 4                                  ; 0537 _ 83. EC, 04
        push    1                                       ; 053A _ 6A, 01
        push    edx                                     ; 053C _ 52
        push    eax                                     ; 053D _ 50
        call    sheet_updown                            ; 053E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0543 _ 83. C4, 10
        mov     dword [ebp-44H], 0                      ; 0546 _ C7. 45, BC, 00000000
        mov     dword [ebp-18H], 0                      ; 054D _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0554 _ C7. 45, EC, 00000000
        mov     dword [ebp-1CH], 0                      ; 055B _ C7. 45, E4, 00000000
        mov     dword [ebp-20H], 0                      ; 0562 _ C7. 45, E0, 00000000
?_003:  call    io_cli                                  ; 0569 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 056E _ 83. EC, 0C
        push    keyinfo                                 ; 0571 _ 68, 00000008(d)
        call    fifo8_status                            ; 0576 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 057B _ 83. C4, 10
        mov     ebx, eax                                ; 057E _ 89. C3
        sub     esp, 12                                 ; 0580 _ 83. EC, 0C
        push    mouseinfo                               ; 0583 _ 68, 00000024(d)
        call    fifo8_status                            ; 0588 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 058D _ 83. C4, 10
        add     ebx, eax                                ; 0590 _ 01. C3
        sub     esp, 12                                 ; 0592 _ 83. EC, 0C
        push    timerinfo                               ; 0595 _ 68, 000000F0(d)
        call    fifo8_status                            ; 059A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 059F _ 83. C4, 10
        add     eax, ebx                                ; 05A2 _ 01. D8
        test    eax, eax                                ; 05A4 _ 85. C0
        jnz near      ?_004                                   ; 05a6 _ 75, 07
        call    io_sti                                  ; 05A8 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 05AD _ EB, BA

?_004:  sub     esp, 12                                 ; 05AF _ 83. EC, 0C
        push    keyinfo                                 ; 05B2 _ 68, 00000008(d)
        call    fifo8_status                            ; 05B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05BC _ 83. C4, 10
        test    eax, eax                                ; 05BF _ 85. C0
        je near       ?_006                                   ; 05c1 _ 0f 84, 00000186
        call    io_sti                                  ; 05C7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05CC _ 83. EC, 0C
        push    keyinfo                                 ; 05CF _ 68, 00000008(d)
        call    fifo8_get                               ; 05D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05D9 _ 83. C4, 10
        mov     dword [ebp-44H], eax                    ; 05DC _ 89. 45, BC
        cmp     dword [ebp-44H], 28                     ; 05DF _ 83. 7D, BC, 1C
        jnz near      ?_005                                   ; 05e3 _ 75, 5c
        mov     ebx, dword [xsize]                      ; 05E5 _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [buf_back]                   ; 05EB _ 8B. 0D, 00000124(d)
        mov     edx, dword [ebp-18H]                    ; 05F1 _ 8B. 55, E8
        mov     eax, edx                                ; 05F4 _ 89. D0
        shl     eax, 2                                  ; 05F6 _ C1. E0, 02
        add     eax, edx                                ; 05F9 _ 01. D0
        shl     eax, 2                                  ; 05FB _ C1. E0, 02
        mov     edx, eax                                ; 05FE _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 0600 _ 8B. 45, C8
        lea     esi, [edx+eax]                          ; 0603 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0606 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 060C _ A1, 00000244(d)
        sub     esp, 4                                  ; 0611 _ 83. EC, 04
        push    7                                       ; 0614 _ 6A, 07
        push    ebx                                     ; 0616 _ 53
        push    dword [ebp-18H]                         ; 0617 _ FF. 75, E8
        push    ecx                                     ; 061A _ 51
        push    esi                                     ; 061B _ 56
        push    edx                                     ; 061C _ 52
        push    eax                                     ; 061D _ 50
        call    showMemoryInfo                          ; 061E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0623 _ 83. C4, 20
        inc     dword [ebp-18H]                         ; 0626 _ FF. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0629 _ 8B. 45, E8
        cmp     eax, dword [ebp-34H]                    ; 062C _ 3B. 45, CC
        jle near      ?_003                                   ; 062f _ 0f 8e, ffffff34
        mov     dword [ebp-18H], 0                      ; 0635 _ C7. 45, E8, 00000000
        jmp     ?_003                                   ; 063C _ E9, FFFFFF28

?_005:  mov     eax, dword [ebp-44H]                    ; 0641 _ 8B. 45, BC
        add     eax, keytable                           ; 0644 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0649 _ 8A. 00
        test    al, al                                  ; 064B _ 84. C0
        je near       ?_003                                   ; 064d _ 0f 84, ffffff16
        cmp     dword [ebp-0CH], 143                    ; 0653 _ 81. 7D, F4, 0000008F
        jg  near      ?_003                                   ; 065a _ 0f 8f, ffffff09
        mov     eax, dword [ebp-0CH]                    ; 0660 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0663 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 0666 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 066B _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 066E _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0673 _ 8B. 00
        sub     esp, 4                                  ; 0675 _ 83. EC, 04
        push    43                                      ; 0678 _ 6A, 2B
        push    ecx                                     ; 067A _ 51
        push    28                                      ; 067B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 067D _ FF. 75, F4
        push    7                                       ; 0680 _ 6A, 07
        push    edx                                     ; 0682 _ 52
        push    eax                                     ; 0683 _ 50
        call    boxfill8                                ; 0684 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0689 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 068C _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 068F _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0692 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0698 _ A1, 00000244(d)
        sub     esp, 8                                  ; 069D _ 83. EC, 08
        push    44                                      ; 06A0 _ 6A, 2C
        push    ecx                                     ; 06A2 _ 51
        push    28                                      ; 06A3 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06A5 _ FF. 75, F4
        push    edx                                     ; 06A8 _ 52
        push    eax                                     ; 06A9 _ 50
        call    sheet_refresh                           ; 06AA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06AF _ 83. C4, 20
        mov     eax, dword [ebp-44H]                    ; 06B2 _ 8B. 45, BC
        add     eax, keytable                           ; 06B5 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 06BA _ 8A. 00
        mov     byte [ebp-64H], al                      ; 06BC _ 88. 45, 9C
        mov     byte [ebp-63H], 0                       ; 06BF _ C6. 45, 9D, 00
        mov     edx, dword [shtMsgBox]                  ; 06C3 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 06C9 _ A1, 00000244(d)
        sub     esp, 8                                  ; 06CE _ 83. EC, 08
        lea     ecx, [ebp-64H]                          ; 06D1 _ 8D. 4D, 9C
        push    ecx                                     ; 06D4 _ 51
        push    0                                       ; 06D5 _ 6A, 00
        push    28                                      ; 06D7 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06D9 _ FF. 75, F4
        push    edx                                     ; 06DC _ 52
        push    eax                                     ; 06DD _ 50
        call    showString                              ; 06DE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06E3 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 06E6 _ 83. 45, F4, 08
        mov     dword [ebp-20H], 1                      ; 06EA _ C7. 45, E0, 00000001
        mov     eax, dword [ebp-0CH]                    ; 06F1 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 06F4 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 06F7 _ 8B. 45, F0
        movzx   ecx, al                                 ; 06FA _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 06FD _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0702 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0705 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 070A _ 8B. 00
        sub     esp, 4                                  ; 070C _ 83. EC, 04
        push    43                                      ; 070F _ 6A, 2B
        push    ebx                                     ; 0711 _ 53
        push    28                                      ; 0712 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0714 _ FF. 75, F4
        push    ecx                                     ; 0717 _ 51
        push    edx                                     ; 0718 _ 52
        push    eax                                     ; 0719 _ 50
        call    boxfill8                                ; 071A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 071F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0722 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0725 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0728 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 072E _ A1, 00000244(d)
        sub     esp, 8                                  ; 0733 _ 83. EC, 08
        push    44                                      ; 0736 _ 6A, 2C
        push    ecx                                     ; 0738 _ 51
        push    28                                      ; 0739 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 073B _ FF. 75, F4
        push    edx                                     ; 073E _ 52
        push    eax                                     ; 073F _ 50
        call    sheet_refresh                           ; 0740 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0745 _ 83. C4, 20
        jmp     ?_003                                   ; 0748 _ E9, FFFFFE1C

?_006:  sub     esp, 12                                 ; 074D _ 83. EC, 0C
        push    mouseinfo                               ; 0750 _ 68, 00000024(d)
        call    fifo8_status                            ; 0755 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075A _ 83. C4, 10
        test    eax, eax                                ; 075D _ 85. C0
        jz near       ?_007                                   ; 075f _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 0761 _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 0767 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 076D _ A1, 00000244(d)
        sub     esp, 4                                  ; 0772 _ 83. EC, 04
        push    ecx                                     ; 0775 _ 51
        push    edx                                     ; 0776 _ 52
        push    eax                                     ; 0777 _ 50
        call    show_mouse_info                         ; 0778 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 077D _ 83. C4, 10
        jmp     ?_003                                   ; 0780 _ E9, FFFFFDE4

?_007:  sub     esp, 12                                 ; 0785 _ 83. EC, 0C
        push    timerinfo                               ; 0788 _ 68, 000000F0(d)
        call    fifo8_status                            ; 078D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0792 _ 83. C4, 10
        test    eax, eax                                ; 0795 _ 85. C0
        je near       ?_003                                   ; 0797 _ 0f 84, fffffdcc
        call    io_sti                                  ; 079D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 07A2 _ 83. EC, 0C
        push    timerinfo                               ; 07A5 _ 68, 000000F0(d)
        call    fifo8_get                               ; 07AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AF _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 07B2 _ 89. 45, B8
        cmp     dword [ebp-48H], 10                     ; 07B5 _ 83. 7D, B8, 0A
        jnz near      ?_008                                   ; 07b9 _ 75, 6f
        mov     edx, dword [sht_back]                   ; 07BB _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 07C1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 07C6 _ 83. EC, 08
        push    ?_185                                   ; 07C9 _ 68, 00000008(d)
        push    7                                       ; 07CE _ 6A, 07
        push    144                                     ; 07D0 _ 68, 00000090
        push    dword [ebp-1CH]                         ; 07D5 _ FF. 75, E4
        push    edx                                     ; 07D8 _ 52
        push    eax                                     ; 07D9 _ 50
        call    showString                              ; 07DA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07DF _ 83. C4, 20
        sub     esp, 8                                  ; 07E2 _ 83. EC, 08
        push    100                                     ; 07E5 _ 6A, 64
        push    dword [ebp-28H]                         ; 07E7 _ FF. 75, D8
        call    timer_settime                           ; 07EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07EF _ 83. C4, 10
        add     dword [ebp-1CH], 8                      ; 07F2 _ 83. 45, E4, 08
        cmp     dword [ebp-1CH], 40                     ; 07F6 _ 83. 7D, E4, 28
        jle near      ?_003                                   ; 07fa _ 0f 8e, fffffd69
        cmp     dword [ebp-20H], 0                      ; 0800 _ 83. 7D, E0, 00
        jne near      ?_003                                   ; 0804 _ 0f 85, fffffd5f
        call    io_cli                                  ; 080A _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1843]                ; 080F _ A1, 00000264(d)
        sub     esp, 12                                 ; 0814 _ 83. EC, 0C
        push    eax                                     ; 0817 _ 50
        call    task_sleep                              ; 0818 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 081D _ 83. C4, 10
        call    io_sti                                  ; 0820 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0825 _ E9, FFFFFD3F

?_008:  cmp     dword [ebp-48H], 2                      ; 082A _ 83. 7D, B8, 02
        jnz near      ?_009                                   ; 082e _ 75, 28
        mov     edx, dword [sht_back]                   ; 0830 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0836 _ A1, 00000244(d)
        sub     esp, 8                                  ; 083B _ 83. EC, 08
        push    ?_186                                   ; 083E _ 68, 0000000A(d)
        push    7                                       ; 0843 _ 6A, 07
        push    32                                      ; 0845 _ 6A, 20
        push    0                                       ; 0847 _ 6A, 00
        push    edx                                     ; 0849 _ 52
        push    eax                                     ; 084A _ 50
        call    showString                              ; 084B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0850 _ 83. C4, 20
        jmp     ?_003                                   ; 0853 _ E9, FFFFFD11

?_009:  cmp     dword [ebp-48H], 0                      ; 0858 _ 83. 7D, B8, 00
        jz near       ?_010                                   ; 085c _ 74, 1e
        sub     esp, 4                                  ; 085E _ 83. EC, 04
        push    0                                       ; 0861 _ 6A, 00
        push    timerinfo                               ; 0863 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0868 _ FF. 75, D0
        call    timer_init                              ; 086B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0870 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0873 _ C7. 45, F0, 00000000
        jmp     ?_011                                   ; 087A _ EB, 1C

?_010:  sub     esp, 4                                  ; 087C _ 83. EC, 04
        push    1                                       ; 087F _ 6A, 01
        push    timerinfo                               ; 0881 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0886 _ FF. 75, D0
        call    timer_init                              ; 0889 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 088E _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0891 _ C7. 45, F0, 00000007
?_011:  sub     esp, 8                                  ; 0898 _ 83. EC, 08
        push    50                                      ; 089B _ 6A, 32
        push    dword [ebp-30H]                         ; 089D _ FF. 75, D0
        call    timer_settime                           ; 08A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A5 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 08A8 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 08AB _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 08AE _ 8B. 45, F0
        movzx   ecx, al                                 ; 08B1 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 08B4 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 08B9 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 08BC _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 08C1 _ 8B. 00
        sub     esp, 4                                  ; 08C3 _ 83. EC, 04
        push    43                                      ; 08C6 _ 6A, 2B
        push    ebx                                     ; 08C8 _ 53
        push    28                                      ; 08C9 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 08CB _ FF. 75, F4
        push    ecx                                     ; 08CE _ 51
        push    edx                                     ; 08CF _ 52
        push    eax                                     ; 08D0 _ 50
        call    boxfill8                                ; 08D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08D6 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 08D9 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 08DC _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 08DF _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 08E5 _ A1, 00000244(d)
        sub     esp, 8                                  ; 08EA _ 83. EC, 08
        push    44                                      ; 08ED _ 6A, 2C
        push    ecx                                     ; 08EF _ 51
        push    28                                      ; 08F0 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 08F2 _ FF. 75, F4
        push    edx                                     ; 08F5 _ 52
        push    eax                                     ; 08F6 _ 50
        call    sheet_refresh                           ; 08F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08FC _ 83. C4, 20
        jmp     ?_003                                   ; 08FF _ E9, FFFFFC65
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0904 _ 55
        mov     ebp, esp                                ; 0905 _ 89. E5
        sub     esp, 72                                 ; 0907 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 090A _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0910 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0915 _ 83. EC, 08
        push    ?_187                                   ; 0918 _ 68, 00000011(d)
        push    7                                       ; 091D _ 6A, 07
        push    160                                     ; 091F _ 68, 000000A0
        push    0                                       ; 0924 _ 6A, 00
        push    edx                                     ; 0926 _ 52
        push    eax                                     ; 0927 _ 50
        call    showString                              ; 0928 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 092D _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0930 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0937 _ C7. 45, E8, 00000000
        push    0                                       ; 093E _ 6A, 00
        lea     eax, [ebp-40H]                          ; 0940 _ 8D. 45, C0
        push    eax                                     ; 0943 _ 50
        push    8                                       ; 0944 _ 6A, 08
        lea     eax, [ebp-38H]                          ; 0946 _ 8D. 45, C8
        push    eax                                     ; 0949 _ 50
        call    fifo8_init                              ; 094A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 094F _ 83. C4, 10
        call    timer_alloc                             ; 0952 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0957 _ 89. 45, EC
        sub     esp, 4                                  ; 095A _ 83. EC, 04
        push    123                                     ; 095D _ 6A, 7B
        lea     eax, [ebp-38H]                          ; 095F _ 8D. 45, C8
        push    eax                                     ; 0962 _ 50
        push    dword [ebp-14H]                         ; 0963 _ FF. 75, EC
        call    timer_init                              ; 0966 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 096B _ 83. C4, 10
        sub     esp, 8                                  ; 096E _ 83. EC, 08
        push    100                                     ; 0971 _ 6A, 64
        push    dword [ebp-14H]                         ; 0973 _ FF. 75, EC
        call    timer_settime                           ; 0976 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 097B _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 097E _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0985 _ C7. 45, F0, 00000000
?_012:  inc     dword [ebp-0CH]                         ; 098C _ FF. 45, F4
        call    io_cli                                  ; 098F _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0994 _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 0997 _ 8D. 45, C8
        push    eax                                     ; 099A _ 50
        call    fifo8_status                            ; 099B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A0 _ 83. C4, 10
        test    eax, eax                                ; 09A3 _ 85. C0
        jnz near      ?_013                                   ; 09a5 _ 75, 07
        call    io_sti                                  ; 09A7 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 09AC _ EB, DE

?_013:  sub     esp, 12                                 ; 09AE _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 09B1 _ 8D. 45, C8
        push    eax                                     ; 09B4 _ 50
        call    fifo8_get                               ; 09B5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09BA _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 09BD _ 89. 45, E8
        call    io_sti                                  ; 09C0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 09C5 _ 83. 7D, E8, 7B
        jnz near      ?_012                                   ; 09c9 _ 75, c1
        mov     edx, dword [sht_back]                   ; 09CB _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 09D1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 09D6 _ 83. EC, 08
        push    ?_188                                   ; 09D9 _ 68, 0000001E(d)
        push    7                                       ; 09DE _ 6A, 07
        push    192                                     ; 09E0 _ 68, 000000C0
        push    dword [ebp-10H]                         ; 09E5 _ FF. 75, F0
        push    edx                                     ; 09E8 _ 52
        push    eax                                     ; 09E9 _ 50
        call    showString                              ; 09EA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09EF _ 83. C4, 20
        sub     esp, 8                                  ; 09F2 _ 83. EC, 08
        push    100                                     ; 09F5 _ 6A, 64
        push    dword [ebp-14H]                         ; 09F7 _ FF. 75, EC
        call    timer_settime                           ; 09FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09FF _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0A02 _ 83. 45, F0, 08
        mov     eax, dword [ebp+8H]                     ; 0A06 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0A09 _ 8B. 00
        sub     esp, 4                                  ; 0A0B _ 83. EC, 04
        push    44                                      ; 0A0E _ 6A, 2C
        push    104                                     ; 0A10 _ 6A, 68
        push    28                                      ; 0A12 _ 6A, 1C
        push    24                                      ; 0A14 _ 6A, 18
        push    8                                       ; 0A16 _ 6A, 08
        push    144                                     ; 0A18 _ 68, 00000090
        push    eax                                     ; 0A1D _ 50
        call    boxfill8                                ; 0A1E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A23 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0A26 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A2B _ 83. EC, 08
        push    44                                      ; 0A2E _ 6A, 2C
        push    104                                     ; 0A30 _ 6A, 68
        push    28                                      ; 0A32 _ 6A, 1C
        push    24                                      ; 0A34 _ 6A, 18
        push    dword [ebp+8H]                          ; 0A36 _ FF. 75, 08
        push    eax                                     ; 0A39 _ 50
        call    sheet_refresh                           ; 0A3A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A3F _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0A42 _ 8B. 45, F4
        sub     esp, 12                                 ; 0A45 _ 83. EC, 0C
        push    eax                                     ; 0A48 _ 50
        call    intToHexStr                             ; 0A49 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A4E _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0A51 _ 89. 45, E4
        mov     eax, dword [shtctl]                     ; 0A54 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A59 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0A5C _ FF. 75, E4
        push    7                                       ; 0A5F _ 6A, 07
        push    28                                      ; 0A61 _ 6A, 1C
        push    24                                      ; 0A63 _ 6A, 18
        push    dword [ebp+8H]                          ; 0A65 _ FF. 75, 08
        push    eax                                     ; 0A68 _ 50
        call    showString                              ; 0A69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A6E _ 83. C4, 20
        jmp     ?_012                                   ; 0A71 _ E9, FFFFFF16
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0A76 _ 55
        mov     ebp, esp                                ; 0A77 _ 89. E5
        push    ebx                                     ; 0A79 _ 53
        sub     esp, 4                                  ; 0A7A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0A7D _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0A80 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0A83 _ 8B. 45, 0C
        dec     eax                                     ; 0A86 _ 48
        sub     esp, 4                                  ; 0A87 _ 83. EC, 04
        push    edx                                     ; 0A8A _ 52
        push    eax                                     ; 0A8B _ 50
        push    0                                       ; 0A8C _ 6A, 00
        push    0                                       ; 0A8E _ 6A, 00
        push    14                                      ; 0A90 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0A92 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0A95 _ FF. 75, 08
        call    boxfill8                                ; 0A98 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A9D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AA0 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0AA3 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0AA6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AA9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AAC _ 8B. 45, 10
        sub     eax, 28                                 ; 0AAF _ 83. E8, 1C
        sub     esp, 4                                  ; 0AB2 _ 83. EC, 04
        push    ecx                                     ; 0AB5 _ 51
        push    edx                                     ; 0AB6 _ 52
        push    eax                                     ; 0AB7 _ 50
        push    0                                       ; 0AB8 _ 6A, 00
        push    8                                       ; 0ABA _ 6A, 08
        push    dword [ebp+0CH]                         ; 0ABC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0ABF _ FF. 75, 08
        call    boxfill8                                ; 0AC2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AC7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0ACA _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0ACD _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0AD0 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AD3 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AD6 _ 8B. 45, 10
        sub     eax, 27                                 ; 0AD9 _ 83. E8, 1B
        sub     esp, 4                                  ; 0ADC _ 83. EC, 04
        push    ecx                                     ; 0ADF _ 51
        push    edx                                     ; 0AE0 _ 52
        push    eax                                     ; 0AE1 _ 50
        push    0                                       ; 0AE2 _ 6A, 00
        push    7                                       ; 0AE4 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0AE6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0AE9 _ FF. 75, 08
        call    boxfill8                                ; 0AEC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AF1 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AF4 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0AF7 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0AFA _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AFD _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B00 _ 8B. 45, 10
        sub     eax, 26                                 ; 0B03 _ 83. E8, 1A
        sub     esp, 4                                  ; 0B06 _ 83. EC, 04
        push    ecx                                     ; 0B09 _ 51
        push    edx                                     ; 0B0A _ 52
        push    eax                                     ; 0B0B _ 50
        push    0                                       ; 0B0C _ 6A, 00
        push    8                                       ; 0B0E _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B10 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B13 _ FF. 75, 08
        call    boxfill8                                ; 0B16 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B1B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B1E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B21 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B24 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B27 _ 83. E8, 18
        sub     esp, 4                                  ; 0B2A _ 83. EC, 04
        push    edx                                     ; 0B2D _ 52
        push    59                                      ; 0B2E _ 6A, 3B
        push    eax                                     ; 0B30 _ 50
        push    3                                       ; 0B31 _ 6A, 03
        push    7                                       ; 0B33 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B35 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B38 _ FF. 75, 08
        call    boxfill8                                ; 0B3B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B40 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B43 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B46 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B49 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B4C _ 83. E8, 18
        sub     esp, 4                                  ; 0B4F _ 83. EC, 04
        push    edx                                     ; 0B52 _ 52
        push    2                                       ; 0B53 _ 6A, 02
        push    eax                                     ; 0B55 _ 50
        push    2                                       ; 0B56 _ 6A, 02
        push    7                                       ; 0B58 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B5A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B5D _ FF. 75, 08
        call    boxfill8                                ; 0B60 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B65 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B68 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B6B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B6E _ 8B. 45, 10
        sub     eax, 4                                  ; 0B71 _ 83. E8, 04
        sub     esp, 4                                  ; 0B74 _ 83. EC, 04
        push    edx                                     ; 0B77 _ 52
        push    59                                      ; 0B78 _ 6A, 3B
        push    eax                                     ; 0B7A _ 50
        push    3                                       ; 0B7B _ 6A, 03
        push    15                                      ; 0B7D _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0B7F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B82 _ FF. 75, 08
        call    boxfill8                                ; 0B85 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B8A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B8D _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0B90 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0B93 _ 8B. 45, 10
        sub     eax, 23                                 ; 0B96 _ 83. E8, 17
        sub     esp, 4                                  ; 0B99 _ 83. EC, 04
        push    edx                                     ; 0B9C _ 52
        push    59                                      ; 0B9D _ 6A, 3B
        push    eax                                     ; 0B9F _ 50
        push    59                                      ; 0BA0 _ 6A, 3B
        push    15                                      ; 0BA2 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BA4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BA7 _ FF. 75, 08
        call    boxfill8                                ; 0BAA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BAF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BB2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0BB5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0BB8 _ 8B. 45, 10
        sub     eax, 3                                  ; 0BBB _ 83. E8, 03
        sub     esp, 4                                  ; 0BBE _ 83. EC, 04
        push    edx                                     ; 0BC1 _ 52
        push    59                                      ; 0BC2 _ 6A, 3B
        push    eax                                     ; 0BC4 _ 50
        push    2                                       ; 0BC5 _ 6A, 02
        push    0                                       ; 0BC7 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0BC9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BCC _ FF. 75, 08
        call    boxfill8                                ; 0BCF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BD4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BD7 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0BDA _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0BDD _ 8B. 45, 10
        sub     eax, 24                                 ; 0BE0 _ 83. E8, 18
        sub     esp, 4                                  ; 0BE3 _ 83. EC, 04
        push    edx                                     ; 0BE6 _ 52
        push    60                                      ; 0BE7 _ 6A, 3C
        push    eax                                     ; 0BE9 _ 50
        push    60                                      ; 0BEA _ 6A, 3C
        push    0                                       ; 0BEC _ 6A, 00
        push    dword [ebp+0CH]                         ; 0BEE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BF1 _ FF. 75, 08
        call    boxfill8                                ; 0BF4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BF9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BFC _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0BFF _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0C02 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C05 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C08 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C0B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C0E _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C11 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C14 _ 83. EC, 04
        push    ebx                                     ; 0C17 _ 53
        push    ecx                                     ; 0C18 _ 51
        push    edx                                     ; 0C19 _ 52
        push    eax                                     ; 0C1A _ 50
        push    15                                      ; 0C1B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C1D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C20 _ FF. 75, 08
        call    boxfill8                                ; 0C23 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C28 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C2B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0C2E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0C31 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0C34 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0C37 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0C3A _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0C3D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C40 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C43 _ 83. EC, 04
        push    ebx                                     ; 0C46 _ 53
        push    ecx                                     ; 0C47 _ 51
        push    edx                                     ; 0C48 _ 52
        push    eax                                     ; 0C49 _ 50
        push    15                                      ; 0C4A _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C4C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C4F _ FF. 75, 08
        call    boxfill8                                ; 0C52 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C57 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C5A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0C5D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0C60 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C63 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C66 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C69 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0C6C _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C6F _ 83. E8, 2F
        sub     esp, 4                                  ; 0C72 _ 83. EC, 04
        push    ebx                                     ; 0C75 _ 53
        push    ecx                                     ; 0C76 _ 51
        push    edx                                     ; 0C77 _ 52
        push    eax                                     ; 0C78 _ 50
        push    7                                       ; 0C79 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0C7B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C7E _ FF. 75, 08
        call    boxfill8                                ; 0C81 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C86 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C89 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0C8C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0C8F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0C92 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0C95 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C98 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C9B _ 8B. 45, 0C
        sub     eax, 3                                  ; 0C9E _ 83. E8, 03
        sub     esp, 4                                  ; 0CA1 _ 83. EC, 04
        push    ebx                                     ; 0CA4 _ 53
        push    ecx                                     ; 0CA5 _ 51
        push    edx                                     ; 0CA6 _ 52
        push    eax                                     ; 0CA7 _ 50
        push    7                                       ; 0CA8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CAA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CAD _ FF. 75, 08
        call    boxfill8                                ; 0CB0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CB5 _ 83. C4, 20
        nop                                             ; 0CB8 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0CB9 _ 8B. 5D, FC
        leave                                           ; 0CBC _ C9
        ret                                             ; 0CBD _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0CBE _ 55
        mov     ebp, esp                                ; 0CBF _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0CC1 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0CC4 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0CC7 _ A1, 00000114(d)
        add     eax, edx                                ; 0CCC _ 01. D0
        mov     dword [mx], eax                         ; 0CCE _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0CD3 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0CD6 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0CD9 _ A1, 00000118(d)
        add     eax, edx                                ; 0CDE _ 01. D0
        mov     dword [my], eax                         ; 0CE0 _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0CE5 _ A1, 00000114(d)
        test    eax, eax                                ; 0CEA _ 85. C0
        jns     ?_014                                   ; 0CEC _ 79, 0A
        mov     dword [mx], 0                           ; 0CEE _ C7. 05, 00000114(d), 00000000
?_014:  mov     eax, dword [my]                         ; 0CF8 _ A1, 00000118(d)
        test    eax, eax                                ; 0CFD _ 85. C0
        jns     ?_015                                   ; 0CFF _ 79, 0A
        mov     dword [my], 0                           ; 0D01 _ C7. 05, 00000118(d), 00000000
?_015:  mov     edx, dword [xsize]                      ; 0D0B _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0D11 _ A1, 00000114(d)
        cmp     edx, eax                                ; 0D16 _ 39. C2
        jg  near      ?_016                                   ; 0d18 _ 7f, 0b
        mov     eax, dword [xsize]                      ; 0D1A _ A1, 0000011C(d)
        dec     eax                                     ; 0D1F _ 48
        mov     dword [mx], eax                         ; 0D20 _ A3, 00000114(d)
?_016:  mov     edx, dword [ysize]                      ; 0D25 _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0D2B _ A1, 00000118(d)
        cmp     edx, eax                                ; 0D30 _ 39. C2
        jg  near      ?_017                                   ; 0d32 _ 7f, 0b
        mov     eax, dword [ysize]                      ; 0D34 _ A1, 00000120(d)
        dec     eax                                     ; 0D39 _ 48
        mov     dword [my], eax                         ; 0D3A _ A3, 00000118(d)
?_017:  nop                                             ; 0D3F _ 90
        pop     ebp                                     ; 0D40 _ 5D
        ret                                             ; 0D41 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D42 _ 55
        mov     ebp, esp                                ; 0D43 _ 89. E5
        sub     esp, 24                                 ; 0D45 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D48 _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 0D4D _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D50 _ C6. 45, F3, 00
        call    io_sti                                  ; 0D54 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0D59 _ 83. EC, 0C
        push    mouseinfo                               ; 0D5C _ 68, 00000024(d)
        call    fifo8_get                               ; 0D61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D66 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0D69 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0D6C _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0D70 _ 83. EC, 08
        push    eax                                     ; 0D73 _ 50
        push    mdec                                    ; 0D74 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0D79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D7E _ 83. C4, 10
        test    eax, eax                                ; 0D81 _ 85. C0
        jz near       ?_018                                   ; 0d83 _ 74, 60
        sub     esp, 4                                  ; 0D85 _ 83. EC, 04
        push    mdec                                    ; 0D88 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0D8D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D90 _ FF. 75, 08
        call    computeMousePosition                    ; 0D93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D98 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0D9B _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0DA1 _ A1, 00000114(d)
        push    edx                                     ; 0DA6 _ 52
        push    eax                                     ; 0DA7 _ 50
        push    dword [ebp+10H]                         ; 0DA8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0DAB _ FF. 75, 08
        call    sheet_slide                             ; 0DAE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB3 _ 83. C4, 10
        mov     eax, dword [?_198]                      ; 0DB6 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0DBB _ 83. E0, 01
        test    eax, eax                                ; 0DBE _ 85. C0
        jz near       ?_018                                   ; 0dc0 _ 74, 23
        mov     eax, dword [my]                         ; 0DC2 _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 0DC7 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0DCA _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 0DCF _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0DD2 _ A1, 00000240(d)
        push    ecx                                     ; 0DD7 _ 51
        push    edx                                     ; 0DD8 _ 52
        push    eax                                     ; 0DD9 _ 50
        push    dword [ebp+8H]                          ; 0DDA _ FF. 75, 08
        call    sheet_slide                             ; 0DDD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DE2 _ 83. C4, 10
?_018:  nop                                             ; 0DE5 _ 90
        leave                                           ; 0DE6 _ C9
        ret                                             ; 0DE7 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0DE8 _ 55
        mov     ebp, esp                                ; 0DE9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DEB _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0DEE _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0DF7 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0DFD _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0E00 _ 66: C7. 40, 06, 01E0
        nop                                             ; 0E06 _ 90
        pop     ebp                                     ; 0E07 _ 5D
        ret                                             ; 0E08 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0E09 _ 55
        mov     ebp, esp                                ; 0E0A _ 89. E5
        push    ebx                                     ; 0E0C _ 53
        sub     esp, 36                                 ; 0E0D _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0E10 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0E13 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0E16 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0E19 _ 89. 45, F4
        jmp     ?_020                                   ; 0E1C _ EB, 3C

?_019:  mov     eax, dword [ebp+1CH]                    ; 0E1E _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E21 _ 8A. 00
        movzx   eax, al                                 ; 0E23 _ 0F B6. C0
        shl     eax, 4                                  ; 0E26 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0E29 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0E2F _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0E33 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0E36 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0E39 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E3C _ 8B. 00
        sub     esp, 8                                  ; 0E3E _ 83. EC, 08
        push    ebx                                     ; 0E41 _ 53
        push    ecx                                     ; 0E42 _ 51
        push    dword [ebp+14H]                         ; 0E43 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0E46 _ FF. 75, 10
        push    edx                                     ; 0E49 _ 52
        push    eax                                     ; 0E4A _ 50
        call    showFont8                               ; 0E4B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E50 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0E53 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0E57 _ FF. 45, 1C
?_020:  mov     eax, dword [ebp+1CH]                    ; 0E5A _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E5D _ 8A. 00
        test    al, al                                  ; 0E5F _ 84. C0
        jnz near      ?_019                                   ; 0e61 _ 75, bb
        mov     eax, dword [ebp+14H]                    ; 0E63 _ 8B. 45, 14
        add     eax, 16                                 ; 0E66 _ 83. C0, 10
        sub     esp, 8                                  ; 0E69 _ 83. EC, 08
        push    eax                                     ; 0E6C _ 50
        push    dword [ebp+10H]                         ; 0E6D _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0E70 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0E73 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0E76 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E79 _ FF. 75, 08
        call    sheet_refresh                           ; 0E7C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E81 _ 83. C4, 20
        nop                                             ; 0E84 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0E85 _ 8B. 5D, FC
        leave                                           ; 0E88 _ C9
        ret                                             ; 0E89 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0E8A _ 55
        mov     ebp, esp                                ; 0E8B _ 89. E5
        sub     esp, 8                                  ; 0E8D _ 83. EC, 08
        sub     esp, 4                                  ; 0E90 _ 83. EC, 04
        push    table_rgb.1910                          ; 0E93 _ 68, 00000080(d)
        push    15                                      ; 0E98 _ 6A, 0F
        push    0                                       ; 0E9A _ 6A, 00
        call    set_palette                             ; 0E9C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EA1 _ 83. C4, 10
        nop                                             ; 0EA4 _ 90
        leave                                           ; 0EA5 _ C9
        ret                                             ; 0EA6 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0EA7 _ 55
        mov     ebp, esp                                ; 0EA8 _ 89. E5
        sub     esp, 24                                 ; 0EAA _ 83. EC, 18
        call    io_load_eflags                          ; 0EAD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0EB2 _ 89. 45, F0
        call    io_cli                                  ; 0EB5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0EBA _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0EBD _ FF. 75, 08
        push    968                                     ; 0EC0 _ 68, 000003C8
        call    io_out8                                 ; 0EC5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ECA _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0ECD _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0ED0 _ 89. 45, F4
        jmp     ?_022                                   ; 0ED3 _ EB, 5F

?_021:  mov     eax, dword [ebp+10H]                    ; 0ED5 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0ED8 _ 8A. 00
        shr     al, 2                                   ; 0EDA _ C0. E8, 02
        movzx   eax, al                                 ; 0EDD _ 0F B6. C0
        sub     esp, 8                                  ; 0EE0 _ 83. EC, 08
        push    eax                                     ; 0EE3 _ 50
        push    969                                     ; 0EE4 _ 68, 000003C9
        call    io_out8                                 ; 0EE9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EEE _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0EF1 _ 8B. 45, 10
        inc     eax                                     ; 0EF4 _ 40
        mov     al, byte [eax]                          ; 0EF5 _ 8A. 00
        shr     al, 2                                   ; 0EF7 _ C0. E8, 02
        movzx   eax, al                                 ; 0EFA _ 0F B6. C0
        sub     esp, 8                                  ; 0EFD _ 83. EC, 08
        push    eax                                     ; 0F00 _ 50
        push    969                                     ; 0F01 _ 68, 000003C9
        call    io_out8                                 ; 0F06 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F0B _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F0E _ 8B. 45, 10
        add     eax, 2                                  ; 0F11 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0F14 _ 8A. 00
        shr     al, 2                                   ; 0F16 _ C0. E8, 02
        movzx   eax, al                                 ; 0F19 _ 0F B6. C0
        sub     esp, 8                                  ; 0F1C _ 83. EC, 08
        push    eax                                     ; 0F1F _ 50
        push    969                                     ; 0F20 _ 68, 000003C9
        call    io_out8                                 ; 0F25 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F2A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0F2D _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0F31 _ FF. 45, F4
?_022:  mov     eax, dword [ebp-0CH]                    ; 0F34 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0F37 _ 3B. 45, 0C
        jle near      ?_021                                   ; 0f3a _ 7e, 99
        sub     esp, 12                                 ; 0F3C _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0F3F _ FF. 75, F0
        call    io_store_eflags                         ; 0F42 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F47 _ 83. C4, 10
        nop                                             ; 0F4A _ 90
        leave                                           ; 0F4B _ C9
        ret                                             ; 0F4C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0F4D _ 55
        mov     ebp, esp                                ; 0F4E _ 89. E5
        sub     esp, 20                                 ; 0F50 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0F53 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0F56 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0F59 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0F5C _ 89. 45, F8
        jmp     ?_026                                   ; 0F5F _ EB, 30

?_023:  mov     eax, dword [ebp+14H]                    ; 0F61 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0F64 _ 89. 45, FC
        jmp     ?_025                                   ; 0F67 _ EB, 1D

?_024:  mov     eax, dword [ebp-8H]                     ; 0F69 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0F6C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F70 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0F72 _ 8B. 45, FC
        add     eax, edx                                ; 0F75 _ 01. D0
        mov     edx, eax                                ; 0F77 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F79 _ 8B. 45, 08
        add     edx, eax                                ; 0F7C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0F7E _ 8A. 45, EC
        mov     byte [edx], al                          ; 0F81 _ 88. 02
        inc     dword [ebp-4H]                          ; 0F83 _ FF. 45, FC
?_025:  mov     eax, dword [ebp-4H]                     ; 0F86 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0F89 _ 3B. 45, 1C
        jle near      ?_024                                   ; 0f8c _ 7e, db
        inc     dword [ebp-8H]                          ; 0F8E _ FF. 45, F8
?_026:  mov     eax, dword [ebp-8H]                     ; 0F91 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0F94 _ 3B. 45, 20
        jle near      ?_023                                   ; 0f97 _ 7e, c8
        nop                                             ; 0F99 _ 90
        nop                                             ; 0F9A _ 90
        leave                                           ; 0F9B _ C9
        ret                                             ; 0F9C _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0F9D _ 55
        mov     ebp, esp                                ; 0F9E _ 89. E5
        sub     esp, 20                                 ; 0FA0 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0FA3 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0FA6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FA9 _ C7. 45, FC, 00000000
        jmp     ?_036                                   ; 0FB0 _ E9, 00000162

?_027:  mov     edx, dword [ebp-4H]                     ; 0FB5 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0FB8 _ 8B. 45, 1C
        add     eax, edx                                ; 0FBB _ 01. D0
        mov     al, byte [eax]                          ; 0FBD _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0FBF _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0FC2 _ 80. 7D, FB, 00
        jns     ?_028                                   ; 0FC6 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0FC8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0FCB _ 8B. 45, FC
        add     eax, edx                                ; 0FCE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FD0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD6 _ 8B. 45, 10
        add     eax, edx                                ; 0FD9 _ 01. D0
        mov     edx, eax                                ; 0FDB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FDD _ 8B. 45, 08
        add     edx, eax                                ; 0FE0 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0FE2 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0FE5 _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0FE7 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0FEB _ 83. E0, 40
        test    eax, eax                                ; 0FEE _ 85. C0
        jz near       ?_029                                   ; 0ff0 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0FF2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0FF5 _ 8B. 45, FC
        add     eax, edx                                ; 0FF8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FFA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FFE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1000 _ 8B. 45, 10
        add     eax, edx                                ; 1003 _ 01. D0
        lea     edx, [eax+1H]                           ; 1005 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1008 _ 8B. 45, 08
        add     edx, eax                                ; 100B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 100D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1010 _ 88. 02
?_029:  movsx   eax, byte [ebp-5H]                      ; 1012 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1016 _ 83. E0, 20
        test    eax, eax                                ; 1019 _ 85. C0
        jz near       ?_030                                   ; 101b _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 101D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1020 _ 8B. 45, FC
        add     eax, edx                                ; 1023 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1025 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1029 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 102B _ 8B. 45, 10
        add     eax, edx                                ; 102E _ 01. D0
        lea     edx, [eax+2H]                           ; 1030 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1033 _ 8B. 45, 08
        add     edx, eax                                ; 1036 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1038 _ 8A. 45, EC
        mov     byte [edx], al                          ; 103B _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 103D _ 0F BE. 45, FB
        and     eax, 10H                                ; 1041 _ 83. E0, 10
        test    eax, eax                                ; 1044 _ 85. C0
        jz near       ?_031                                   ; 1046 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1048 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 104B _ 8B. 45, FC
        add     eax, edx                                ; 104E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1050 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1054 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1056 _ 8B. 45, 10
        add     eax, edx                                ; 1059 _ 01. D0
        lea     edx, [eax+3H]                           ; 105B _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 105E _ 8B. 45, 08
        add     edx, eax                                ; 1061 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1063 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1066 _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 1068 _ 0F BE. 45, FB
        and     eax, 08H                                ; 106C _ 83. E0, 08
        test    eax, eax                                ; 106F _ 85. C0
        jz near       ?_032                                   ; 1071 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1073 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1076 _ 8B. 45, FC
        add     eax, edx                                ; 1079 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 107B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 107F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1081 _ 8B. 45, 10
        add     eax, edx                                ; 1084 _ 01. D0
        lea     edx, [eax+4H]                           ; 1086 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1089 _ 8B. 45, 08
        add     edx, eax                                ; 108C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 108E _ 8A. 45, EC
        mov     byte [edx], al                          ; 1091 _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 1093 _ 0F BE. 45, FB
        and     eax, 04H                                ; 1097 _ 83. E0, 04
        test    eax, eax                                ; 109A _ 85. C0
        jz near       ?_033                                   ; 109c _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 109E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10A1 _ 8B. 45, FC
        add     eax, edx                                ; 10A4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10A6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10AA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10AC _ 8B. 45, 10
        add     eax, edx                                ; 10AF _ 01. D0
        lea     edx, [eax+5H]                           ; 10B1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10B4 _ 8B. 45, 08
        add     edx, eax                                ; 10B7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10B9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10BC _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 10BE _ 0F BE. 45, FB
        and     eax, 02H                                ; 10C2 _ 83. E0, 02
        test    eax, eax                                ; 10C5 _ 85. C0
        jz near       ?_034                                   ; 10c7 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10C9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10CC _ 8B. 45, FC
        add     eax, edx                                ; 10CF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10D1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10D5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10D7 _ 8B. 45, 10
        add     eax, edx                                ; 10DA _ 01. D0
        lea     edx, [eax+6H]                           ; 10DC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10DF _ 8B. 45, 08
        add     edx, eax                                ; 10E2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10E4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10E7 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 10E9 _ 0F BE. 45, FB
        and     eax, 01H                                ; 10ED _ 83. E0, 01
        test    eax, eax                                ; 10F0 _ 85. C0
        jz near       ?_035                                   ; 10f2 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10F4 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10F7 _ 8B. 45, FC
        add     eax, edx                                ; 10FA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10FC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1100 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1102 _ 8B. 45, 10
        add     eax, edx                                ; 1105 _ 01. D0
        lea     edx, [eax+7H]                           ; 1107 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 110A _ 8B. 45, 08
        add     edx, eax                                ; 110D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 110F _ 8A. 45, EC
        mov     byte [edx], al                          ; 1112 _ 88. 02
?_035:  inc     dword [ebp-4H]                          ; 1114 _ FF. 45, FC
?_036:  cmp     dword [ebp-4H], 15                      ; 1117 _ 83. 7D, FC, 0F
        jle near      ?_027                                   ; 111b _ 0f 8e, fffffe94
        nop                                             ; 1121 _ 90
        nop                                             ; 1122 _ 90
        leave                                           ; 1123 _ C9
        ret                                             ; 1124 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1125 _ 55
        mov     ebp, esp                                ; 1126 _ 89. E5
        sub     esp, 20                                 ; 1128 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 112B _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 112E _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1131 _ C7. 45, F8, 00000000
        jmp     ?_043                                   ; 1138 _ E9, 000000AB

?_037:  mov     dword [ebp-4H], 0                       ; 113D _ C7. 45, FC, 00000000
        jmp     ?_042                                   ; 1144 _ E9, 00000092

?_038:  mov     eax, dword [ebp-8H]                     ; 1149 _ 8B. 45, F8
        shl     eax, 4                                  ; 114C _ C1. E0, 04
        mov     edx, eax                                ; 114F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1151 _ 8B. 45, FC
        add     eax, edx                                ; 1154 _ 01. D0
        add     eax, cursor.1957                        ; 1156 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 115B _ 8A. 00
        cmp     al, 42                                  ; 115D _ 3C, 2A
        jnz near      ?_039                                   ; 115f _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1161 _ 8B. 45, F8
        shl     eax, 4                                  ; 1164 _ C1. E0, 04
        mov     edx, eax                                ; 1167 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1169 _ 8B. 45, FC
        add     eax, edx                                ; 116C _ 01. D0
        mov     edx, eax                                ; 116E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1170 _ 8B. 45, 08
        add     eax, edx                                ; 1173 _ 01. D0
        mov     byte [eax], 0                           ; 1175 _ C6. 00, 00
?_039:  mov     eax, dword [ebp-8H]                     ; 1178 _ 8B. 45, F8
        shl     eax, 4                                  ; 117B _ C1. E0, 04
        mov     edx, eax                                ; 117E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1180 _ 8B. 45, FC
        add     eax, edx                                ; 1183 _ 01. D0
        add     eax, cursor.1957                        ; 1185 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 118A _ 8A. 00
        cmp     al, 79                                  ; 118C _ 3C, 4F
        jnz near      ?_040                                   ; 118e _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1190 _ 8B. 45, F8
        shl     eax, 4                                  ; 1193 _ C1. E0, 04
        mov     edx, eax                                ; 1196 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1198 _ 8B. 45, FC
        add     eax, edx                                ; 119B _ 01. D0
        mov     edx, eax                                ; 119D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 119F _ 8B. 45, 08
        add     eax, edx                                ; 11A2 _ 01. D0
        mov     byte [eax], 7                           ; 11A4 _ C6. 00, 07
?_040:  mov     eax, dword [ebp-8H]                     ; 11A7 _ 8B. 45, F8
        shl     eax, 4                                  ; 11AA _ C1. E0, 04
        mov     edx, eax                                ; 11AD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11AF _ 8B. 45, FC
        add     eax, edx                                ; 11B2 _ 01. D0
        add     eax, cursor.1957                        ; 11B4 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11B9 _ 8A. 00
        cmp     al, 46                                  ; 11BB _ 3C, 2E
        jnz near      ?_041                                   ; 11bd _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11BF _ 8B. 45, F8
        shl     eax, 4                                  ; 11C2 _ C1. E0, 04
        mov     edx, eax                                ; 11C5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11C7 _ 8B. 45, FC
        add     eax, edx                                ; 11CA _ 01. D0
        mov     edx, eax                                ; 11CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11CE _ 8B. 45, 08
        add     edx, eax                                ; 11D1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 11D3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 11D6 _ 88. 02
?_041:  inc     dword [ebp-4H]                          ; 11D8 _ FF. 45, FC
?_042:  cmp     dword [ebp-4H], 15                      ; 11DB _ 83. 7D, FC, 0F
        jle near      ?_038                                   ; 11df _ 0f 8e, ffffff64
        inc     dword [ebp-8H]                          ; 11E5 _ FF. 45, F8
?_043:  cmp     dword [ebp-8H], 15                      ; 11E8 _ 83. 7D, F8, 0F
        jle near      ?_037                                   ; 11ec _ 0f 8e, ffffff4b
        nop                                             ; 11F2 _ 90
        nop                                             ; 11F3 _ 90
        leave                                           ; 11F4 _ C9
        ret                                             ; 11F5 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 11F6 _ 55
        mov     ebp, esp                                ; 11F7 _ 89. E5
        push    ebx                                     ; 11F9 _ 53
        sub     esp, 16                                 ; 11FA _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 11FD _ C7. 45, F4, 00000000
        jmp     ?_047                                   ; 1204 _ EB, 4D

?_044:  mov     dword [ebp-8H], 0                       ; 1206 _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 120D _ EB, 39

?_045:  mov     eax, dword [ebp-0CH]                    ; 120F _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1212 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1216 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1218 _ 8B. 45, F8
        add     eax, edx                                ; 121B _ 01. D0
        mov     edx, eax                                ; 121D _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 121F _ 8B. 45, 20
        add     eax, edx                                ; 1222 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1224 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 1227 _ 8B. 55, F4
        add     edx, ecx                                ; 122A _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 122C _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 1230 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1233 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1236 _ 01. D9
        add     edx, ecx                                ; 1238 _ 01. CA
        mov     ecx, edx                                ; 123A _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 123C _ 8B. 55, 08
        add     edx, ecx                                ; 123F _ 01. CA
        mov     al, byte [eax]                          ; 1241 _ 8A. 00
        mov     byte [edx], al                          ; 1243 _ 88. 02
        inc     dword [ebp-8H]                          ; 1245 _ FF. 45, F8
?_046:  mov     eax, dword [ebp-8H]                     ; 1248 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 124B _ 3B. 45, 10
        jl      ?_045                                   ; 124E _ 7C, BF
        inc     dword [ebp-0CH]                         ; 1250 _ FF. 45, F4
?_047:  mov     eax, dword [ebp-0CH]                    ; 1253 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1256 _ 3B. 45, 14
        jl      ?_044                                   ; 1259 _ 7C, AB
        nop                                             ; 125B _ 90
        nop                                             ; 125C _ 90
        add     esp, 16                                 ; 125D _ 83. C4, 10
        pop     ebx                                     ; 1260 _ 5B
        pop     ebp                                     ; 1261 _ 5D
        ret                                             ; 1262 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1263 _ 55
        mov     ebp, esp                                ; 1264 _ 89. E5
        sub     esp, 24                                 ; 1266 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 1269 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 126E _ 89. 45, F4
        mov     eax, dword [?_195]                      ; 1271 _ A1, 00000004(d)
        cwde                                            ; 1276 _ 98
        mov     dword [ebp-10H], eax                    ; 1277 _ 89. 45, F0
        mov     ax, word [?_196]                        ; 127A _ 66: A1, 00000006(d)
        cwde                                            ; 1280 _ 98
        mov     dword [ebp-14H], eax                    ; 1281 _ 89. 45, EC
        sub     esp, 8                                  ; 1284 _ 83. EC, 08
        push    32                                      ; 1287 _ 6A, 20
        push    32                                      ; 1289 _ 6A, 20
        call    io_out8                                 ; 128B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1290 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 1293 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 1297 _ 83. EC, 0C
        push    96                                      ; 129A _ 6A, 60
        call    io_in8                                  ; 129C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12A1 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 12A4 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 12A7 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 12AB _ 83. EC, 08
        push    eax                                     ; 12AE _ 50
        push    keyinfo                                 ; 12AF _ 68, 00000008(d)
        call    fifo8_put                               ; 12B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12B9 _ 83. C4, 10
        nop                                             ; 12BC _ 90
        leave                                           ; 12BD _ C9
        ret                                             ; 12BE _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 12BF _ 55
        mov     ebp, esp                                ; 12C0 _ 89. E5
        sub     esp, 4                                  ; 12C2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 12C5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 12C8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 12CB _ 80. 7D, FC, 09
        jle near      ?_048                                   ; 12cf _ 7e, 08
        mov     al, byte [ebp-4H]                       ; 12D1 _ 8A. 45, FC
        add     eax, 55                                 ; 12D4 _ 83. C0, 37
        jmp     ?_049                                   ; 12D7 _ EB, 06

?_048:  mov     al, byte [ebp-4H]                       ; 12D9 _ 8A. 45, FC
        add     eax, 48                                 ; 12DC _ 83. C0, 30
?_049:  leave                                           ; 12DF _ C9
        ret                                             ; 12E0 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 12E1 _ 55
        mov     ebp, esp                                ; 12E2 _ 89. E5
        sub     esp, 20                                 ; 12E4 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 12E7 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 12EA _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 12ED _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 12F4 _ 8A. 45, EC
        and     eax, 0FH                                ; 12F7 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 12FA _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 12FD _ 0F BE. 45, FB
        push    eax                                     ; 1301 _ 50
        call    charToHexVal                            ; 1302 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1307 _ 83. C4, 04
        mov     byte [?_194], al                        ; 130A _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 130F _ 8A. 45, EC
        shr     al, 4                                   ; 1312 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1315 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 1318 _ 8A. 45, EC
        movsx   eax, al                                 ; 131B _ 0F BE. C0
        push    eax                                     ; 131E _ 50
        call    charToHexVal                            ; 131F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1324 _ 83. C4, 04
        mov     byte [?_193], al                        ; 1327 _ A2, 00000076(d)
        mov     eax, keyval                             ; 132C _ B8, 00000074(d)
        leave                                           ; 1331 _ C9
        ret                                             ; 1332 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1333 _ 55
        mov     ebp, esp                                ; 1334 _ 89. E5
        sub     esp, 16                                 ; 1336 _ 83. EC, 10
        mov     byte [str.2005], 48                     ; 1339 _ C6. 05, 00000368(d), 30
        mov     byte [?_199], 88                        ; 1340 _ C6. 05, 00000369(d), 58
        mov     byte [?_200], 0                         ; 1347 _ C6. 05, 00000372(d), 00
        mov     dword [ebp-4H], 2                       ; 134E _ C7. 45, FC, 00000002
        jmp     ?_051                                   ; 1355 _ EB, 0E

?_050:  mov     eax, dword [ebp-4H]                     ; 1357 _ 8B. 45, FC
        add     eax, str.2005                           ; 135A _ 05, 00000368(d)
        mov     byte [eax], 48                          ; 135F _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1362 _ FF. 45, FC
?_051:  cmp     dword [ebp-4H], 9                       ; 1365 _ 83. 7D, FC, 09
        jle near      ?_050                                   ; 1369 _ 7e, ec
        mov     dword [ebp-8H], 9                       ; 136B _ C7. 45, F8, 00000009
        jmp     ?_055                                   ; 1372 _ EB, 41

?_052:  mov     eax, dword [ebp+8H]                     ; 1374 _ 8B. 45, 08
        and     eax, 0FH                                ; 1377 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 137A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 137D _ 8B. 45, 08
        shr     eax, 4                                  ; 1380 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1383 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 1386 _ 83. 7D, F4, 09
        jle near      ?_053                                   ; 138a _ 7e, 14
        mov     eax, dword [ebp-0CH]                    ; 138C _ 8B. 45, F4
        add     eax, 55                                 ; 138F _ 83. C0, 37
        mov     dl, al                                  ; 1392 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1394 _ 8B. 45, F8
        add     eax, str.2005                           ; 1397 _ 05, 00000368(d)
        mov     byte [eax], dl                          ; 139C _ 88. 10
        jmp     ?_054                                   ; 139E _ EB, 12

?_053:  mov     eax, dword [ebp-0CH]                    ; 13A0 _ 8B. 45, F4
        add     eax, 48                                 ; 13A3 _ 83. C0, 30
        mov     dl, al                                  ; 13A6 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 13A8 _ 8B. 45, F8
        add     eax, str.2005                           ; 13AB _ 05, 00000368(d)
        mov     byte [eax], dl                          ; 13B0 _ 88. 10
?_054:  dec     dword [ebp-8H]                          ; 13B2 _ FF. 4D, F8
?_055:  cmp     dword [ebp-8H], 1                       ; 13B5 _ 83. 7D, F8, 01
        jle near      ?_056                                   ; 13b9 _ 7e, 06
        cmp     dword [ebp+8H], 0                       ; 13BB _ 83. 7D, 08, 00
        jnz near      ?_052                                   ; 13bf _ 75, b3
?_056:  mov     eax, str.2005                           ; 13C1 _ B8, 00000368(d)
        leave                                           ; 13C6 _ C9
        ret                                             ; 13C7 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 13C8 _ 55
        mov     ebp, esp                                ; 13C9 _ 89. E5
        sub     esp, 8                                  ; 13CB _ 83. EC, 08
?_057:  sub     esp, 12                                 ; 13CE _ 83. EC, 0C
        push    100                                     ; 13D1 _ 6A, 64
        call    io_in8                                  ; 13D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13D8 _ 83. C4, 10
        and     eax, 02H                                ; 13DB _ 83. E0, 02
        test    eax, eax                                ; 13DE _ 85. C0
        jz near       ?_058                                   ; 13e0 _ 74, 02
        jmp     ?_057                                   ; 13E2 _ EB, EA

?_058:  nop                                             ; 13E4 _ 90
        nop                                             ; 13E5 _ 90
        leave                                           ; 13E6 _ C9
        ret                                             ; 13E7 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 13E8 _ 55
        mov     ebp, esp                                ; 13E9 _ 89. E5
        sub     esp, 8                                  ; 13EB _ 83. EC, 08
        call    wait_KBC_sendready                      ; 13EE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 13F3 _ 83. EC, 08
        push    96                                      ; 13F6 _ 6A, 60
        push    100                                     ; 13F8 _ 6A, 64
        call    io_out8                                 ; 13FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13FF _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1402 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1407 _ 83. EC, 08
        push    71                                      ; 140A _ 6A, 47
        push    96                                      ; 140C _ 6A, 60
        call    io_out8                                 ; 140E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1413 _ 83. C4, 10
        nop                                             ; 1416 _ 90
        leave                                           ; 1417 _ C9
        ret                                             ; 1418 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1419 _ 55
        mov     ebp, esp                                ; 141A _ 89. E5
        sub     esp, 8                                  ; 141C _ 83. EC, 08
        call    wait_KBC_sendready                      ; 141F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1424 _ 83. EC, 08
        push    212                                     ; 1427 _ 68, 000000D4
        push    100                                     ; 142C _ 6A, 64
        call    io_out8                                 ; 142E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1433 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1436 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 143B _ 83. EC, 08
        push    244                                     ; 143E _ 68, 000000F4
        push    96                                      ; 1443 _ 6A, 60
        call    io_out8                                 ; 1445 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 144A _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 144D _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 1450 _ C6. 40, 03, 00
        nop                                             ; 1454 _ 90
        leave                                           ; 1455 _ C9
        ret                                             ; 1456 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1457 _ 55
        mov     ebp, esp                                ; 1458 _ 89. E5
        sub     esp, 24                                 ; 145A _ 83. EC, 18
        sub     esp, 8                                  ; 145D _ 83. EC, 08
        push    32                                      ; 1460 _ 6A, 20
        push    160                                     ; 1462 _ 68, 000000A0
        call    io_out8                                 ; 1467 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 146C _ 83. C4, 10
        sub     esp, 8                                  ; 146F _ 83. EC, 08
        push    32                                      ; 1472 _ 6A, 20
        push    32                                      ; 1474 _ 6A, 20
        call    io_out8                                 ; 1476 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 147B _ 83. C4, 10
        sub     esp, 12                                 ; 147E _ 83. EC, 0C
        push    96                                      ; 1481 _ 6A, 60
        call    io_in8                                  ; 1483 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1488 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 148B _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 148E _ 0F B6. 45, F7
        sub     esp, 8                                  ; 1492 _ 83. EC, 08
        push    eax                                     ; 1495 _ 50
        push    mouseinfo                               ; 1496 _ 68, 00000024(d)
        call    fifo8_put                               ; 149B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14A0 _ 83. C4, 10
        nop                                             ; 14A3 _ 90
        leave                                           ; 14A4 _ C9
        ret                                             ; 14A5 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 14A6 _ 55
        mov     ebp, esp                                ; 14A7 _ 89. E5
        sub     esp, 4                                  ; 14A9 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 14AC _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 14AF _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14B2 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 14B5 _ 8A. 40, 03
        test    al, al                                  ; 14B8 _ 84. C0
        jnz near      ?_060                                   ; 14ba _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 14BC _ 80. 7D, FC, FA
        jnz near      ?_059                                   ; 14c0 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 14C2 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 14C5 _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 14C9 _ B8, 00000000
        jmp     ?_067                                   ; 14CE _ E9, 00000104

?_060:  mov     eax, dword [ebp+8H]                     ; 14D3 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 14D6 _ 8A. 40, 03
        cmp     al, 1                                   ; 14D9 _ 3C, 01
        jnz near      ?_062                                   ; 14db _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 14DD _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 14E1 _ 25, 000000C8
        cmp     eax, 8                                  ; 14E6 _ 83. F8, 08
        jnz near      ?_061                                   ; 14e9 _ 75, 0f
        mov     eax, dword [ebp+8H]                     ; 14EB _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 14EE _ 8A. 55, FC
        mov     byte [eax], dl                          ; 14F1 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 14F3 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 14F6 _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 14FA _ B8, 00000000
        jmp     ?_067                                   ; 14FF _ E9, 000000D3

?_062:  mov     eax, dword [ebp+8H]                     ; 1504 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1507 _ 8A. 40, 03
        cmp     al, 2                                   ; 150A _ 3C, 02
        jnz near      ?_063                                   ; 150c _ 75, 1a
        mov     eax, dword [ebp+8H]                     ; 150E _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1511 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1514 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1517 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 151A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 151E _ B8, 00000000
        jmp     ?_067                                   ; 1523 _ E9, 000000AF

?_063:  mov     eax, dword [ebp+8H]                     ; 1528 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 152B _ 8A. 40, 03
        cmp     al, 3                                   ; 152E _ 3C, 03
        jne near      ?_066                                   ; 1530 _ 0f 85, 0000009c
        mov     eax, dword [ebp+8H]                     ; 1536 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1539 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 153C _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 153F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1542 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1546 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1549 _ 8A. 00
        movzx   eax, al                                 ; 154B _ 0F B6. C0
        and     eax, 07H                                ; 154E _ 83. E0, 07
        mov     edx, eax                                ; 1551 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1553 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1556 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1559 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 155C _ 8A. 40, 01
        movzx   edx, al                                 ; 155F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1562 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1565 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1568 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 156B _ 8A. 40, 02
        movzx   edx, al                                 ; 156E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1571 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1574 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1577 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 157A _ 8A. 00
        movzx   eax, al                                 ; 157C _ 0F B6. C0
        and     eax, 10H                                ; 157F _ 83. E0, 10
        test    eax, eax                                ; 1582 _ 85. C0
        jz near       ?_064                                   ; 1584 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1586 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1589 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 158C _ 0D, FFFFFF00
        mov     edx, eax                                ; 1591 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1593 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1596 _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 1599 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 159C _ 8A. 00
        movzx   eax, al                                 ; 159E _ 0F B6. C0
        and     eax, 20H                                ; 15A1 _ 83. E0, 20
        test    eax, eax                                ; 15A4 _ 85. C0
        jz near       ?_065                                   ; 15a6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15A8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15AB _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 15AE _ 0D, FFFFFF00
        mov     edx, eax                                ; 15B3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15B5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15B8 _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 15BB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15BE _ 8B. 40, 08
        neg     eax                                     ; 15C1 _ F7. D8
        mov     edx, eax                                ; 15C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15C5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15C8 _ 89. 50, 08
        mov     eax, 1                                  ; 15CB _ B8, 00000001
        jmp     ?_067                                   ; 15D0 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 15D2 _ B8, FFFFFFFF
?_067:  leave                                           ; 15D7 _ C9
        ret                                             ; 15D8 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 15D9 _ 55
        mov     ebp, esp                                ; 15DA _ 89. E5
        sub     esp, 40                                 ; 15DC _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 15DF _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 15E6 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 15ED _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 15F4 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 15FB _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 1601 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1604 _ 8B. 00
        sub     esp, 4                                  ; 1606 _ 83. EC, 04
        push    edx                                     ; 1609 _ 52
        push    dword [ebp+1CH]                         ; 160A _ FF. 75, 1C
        push    eax                                     ; 160D _ 50
        call    init_screen8                            ; 160E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1613 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1616 _ 8B. 45, 20
        movsx   eax, al                                 ; 1619 _ 0F BE. C0
        sub     esp, 8                                  ; 161C _ 83. EC, 08
        push    ?_189                                   ; 161F _ 68, 00000020(d)
        push    eax                                     ; 1624 _ 50
        push    dword [ebp-10H]                         ; 1625 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1628 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 162B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 162E _ FF. 75, 08
        call    showString                              ; 1631 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1636 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1639 _ 8B. 45, 18
        sub     esp, 12                                 ; 163C _ 83. EC, 0C
        push    eax                                     ; 163F _ 50
        call    intToHexStr                             ; 1640 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1645 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1648 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 164B _ 8B. 45, 20
        movsx   eax, al                                 ; 164E _ 0F BE. C0
        sub     esp, 8                                  ; 1651 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1654 _ FF. 75, E4
        push    eax                                     ; 1657 _ 50
        push    dword [ebp-10H]                         ; 1658 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 165B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 165E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1661 _ FF. 75, 08
        call    showString                              ; 1664 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1669 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 166C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1670 _ 8B. 45, 20
        movsx   eax, al                                 ; 1673 _ 0F BE. C0
        sub     esp, 8                                  ; 1676 _ 83. EC, 08
        push    ?_190                                   ; 1679 _ 68, 0000002A(d)
        push    eax                                     ; 167E _ 50
        push    dword [ebp-10H]                         ; 167F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1682 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1685 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1688 _ FF. 75, 08
        call    showString                              ; 168B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1690 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1693 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1696 _ 8B. 00
        sub     esp, 12                                 ; 1698 _ 83. EC, 0C
        push    eax                                     ; 169B _ 50
        call    intToHexStr                             ; 169C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16A1 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 16A4 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 16A7 _ 8B. 45, 20
        movsx   eax, al                                 ; 16AA _ 0F BE. C0
        sub     esp, 8                                  ; 16AD _ 83. EC, 08
        push    dword [ebp-20H]                         ; 16B0 _ FF. 75, E0
        push    eax                                     ; 16B3 _ 50
        push    dword [ebp-10H]                         ; 16B4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 16B7 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 16BA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16BD _ FF. 75, 08
        call    showString                              ; 16C0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16C5 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 16C8 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 16CC _ 8B. 45, 20
        movsx   eax, al                                 ; 16CF _ 0F BE. C0
        sub     esp, 8                                  ; 16D2 _ 83. EC, 08
        push    ?_191                                   ; 16D5 _ 68, 00000036(d)
        push    eax                                     ; 16DA _ 50
        push    dword [ebp-10H]                         ; 16DB _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 16DE _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 16E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16E4 _ FF. 75, 08
        call    showString                              ; 16E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16EC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 16EF _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 16F2 _ 8B. 40, 04
        sub     esp, 12                                 ; 16F5 _ 83. EC, 0C
        push    eax                                     ; 16F8 _ 50
        call    intToHexStr                             ; 16F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16FE _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1701 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1704 _ 8B. 45, 20
        movsx   eax, al                                 ; 1707 _ 0F BE. C0
        sub     esp, 8                                  ; 170A _ 83. EC, 08
        push    dword [ebp-24H]                         ; 170D _ FF. 75, DC
        push    eax                                     ; 1710 _ 50
        push    dword [ebp-10H]                         ; 1711 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1714 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1717 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 171A _ FF. 75, 08
        call    showString                              ; 171D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1722 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1725 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1729 _ 8B. 45, 20
        movsx   eax, al                                 ; 172C _ 0F BE. C0
        sub     esp, 8                                  ; 172F _ 83. EC, 08
        push    ?_192                                   ; 1732 _ 68, 00000042(d)
        push    eax                                     ; 1737 _ 50
        push    dword [ebp-10H]                         ; 1738 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 173B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 173E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1741 _ FF. 75, 08
        call    showString                              ; 1744 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1749 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 174C _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 174F _ 8B. 40, 08
        sub     esp, 12                                 ; 1752 _ 83. EC, 0C
        push    eax                                     ; 1755 _ 50
        call    intToHexStr                             ; 1756 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 175B _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 175E _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1761 _ 8B. 45, 20
        movsx   eax, al                                 ; 1764 _ 0F BE. C0
        sub     esp, 8                                  ; 1767 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 176A _ FF. 75, D8
        push    eax                                     ; 176D _ 50
        push    dword [ebp-10H]                         ; 176E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1771 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1774 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1777 _ FF. 75, 08
        call    showString                              ; 177A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 177F _ 83. C4, 20
        nop                                             ; 1782 _ 90
        leave                                           ; 1783 _ C9
        ret                                             ; 1784 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1785 _ 55
        mov     ebp, esp                                ; 1786 _ 89. E5
        sub     esp, 24                                 ; 1788 _ 83. EC, 18
        sub     esp, 12                                 ; 178B _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 178E _ FF. 75, 08
        call    sheet_alloc                             ; 1791 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1796 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1799 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 179C _ A1, 00000000(d)
        sub     esp, 8                                  ; 17A1 _ 83. EC, 08
        push    10880                                   ; 17A4 _ 68, 00002A80
        push    eax                                     ; 17A9 _ 50
        call    memman_alloc_4k                         ; 17AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17AF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 17B2 _ 89. 45, F0
        sub     esp, 12                                 ; 17B5 _ 83. EC, 0C
        push    -1                                      ; 17B8 _ 6A, FF
        push    68                                      ; 17BA _ 6A, 44
        push    160                                     ; 17BC _ 68, 000000A0
        push    dword [ebp-10H]                         ; 17C1 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 17C4 _ FF. 75, F4
        call    sheet_setbuf                            ; 17C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17CC _ 83. C4, 20
        sub     esp, 4                                  ; 17CF _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 17D2 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 17D5 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 17D8 _ FF. 75, 08
        call    make_window8                            ; 17DB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17E0 _ 83. C4, 10
        sub     esp, 8                                  ; 17E3 _ 83. EC, 08
        push    7                                       ; 17E6 _ 6A, 07
        push    16                                      ; 17E8 _ 6A, 10
        push    144                                     ; 17EA _ 68, 00000090
        push    28                                      ; 17EF _ 6A, 1C
        push    8                                       ; 17F1 _ 6A, 08
        push    dword [ebp-0CH]                         ; 17F3 _ FF. 75, F4
        call    make_textbox8                           ; 17F6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17FB _ 83. C4, 20
        push    172                                     ; 17FE _ 68, 000000AC
        push    260                                     ; 1803 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1808 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 180B _ FF. 75, 08
        call    sheet_slide                             ; 180E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1813 _ 83. C4, 10
        sub     esp, 4                                  ; 1816 _ 83. EC, 04
        push    2                                       ; 1819 _ 6A, 02
        push    dword [ebp-0CH]                         ; 181B _ FF. 75, F4
        push    dword [ebp+8H]                          ; 181E _ FF. 75, 08
        call    sheet_updown                            ; 1821 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1826 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1829 _ 8B. 45, F4
        leave                                           ; 182C _ C9
        ret                                             ; 182D _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 182E _ 55
        mov     ebp, esp                                ; 182F _ 89. E5
        push    ebx                                     ; 1831 _ 53
        sub     esp, 36                                 ; 1832 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1835 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1838 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 183B _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 183E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1841 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1844 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1847 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 184A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 184D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1850 _ 8B. 00
        push    0                                       ; 1852 _ 6A, 00
        push    edx                                     ; 1854 _ 52
        push    0                                       ; 1855 _ 6A, 00
        push    0                                       ; 1857 _ 6A, 00
        push    8                                       ; 1859 _ 6A, 08
        push    dword [ebp-18H]                         ; 185B _ FF. 75, E8
        push    eax                                     ; 185E _ 50
        call    boxfill8                                ; 185F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1864 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1867 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 186A _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 186D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1870 _ 8B. 00
        push    1                                       ; 1872 _ 6A, 01
        push    edx                                     ; 1874 _ 52
        push    1                                       ; 1875 _ 6A, 01
        push    1                                       ; 1877 _ 6A, 01
        push    7                                       ; 1879 _ 6A, 07
        push    dword [ebp-18H]                         ; 187B _ FF. 75, E8
        push    eax                                     ; 187E _ 50
        call    boxfill8                                ; 187F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1884 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1887 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 188A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 188D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1890 _ 8B. 00
        push    edx                                     ; 1892 _ 52
        push    0                                       ; 1893 _ 6A, 00
        push    0                                       ; 1895 _ 6A, 00
        push    0                                       ; 1897 _ 6A, 00
        push    8                                       ; 1899 _ 6A, 08
        push    dword [ebp-18H]                         ; 189B _ FF. 75, E8
        push    eax                                     ; 189E _ 50
        call    boxfill8                                ; 189F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18A4 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18A7 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 18AA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18AD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18B0 _ 8B. 00
        push    edx                                     ; 18B2 _ 52
        push    1                                       ; 18B3 _ 6A, 01
        push    1                                       ; 18B5 _ 6A, 01
        push    1                                       ; 18B7 _ 6A, 01
        push    7                                       ; 18B9 _ 6A, 07
        push    dword [ebp-18H]                         ; 18BB _ FF. 75, E8
        push    eax                                     ; 18BE _ 50
        call    boxfill8                                ; 18BF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18C4 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18C7 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 18CA _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 18CD _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 18D0 _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 18D3 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 18D6 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 18D9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18DC _ 8B. 00
        push    ebx                                     ; 18DE _ 53
        push    ecx                                     ; 18DF _ 51
        push    1                                       ; 18E0 _ 6A, 01
        push    edx                                     ; 18E2 _ 52
        push    15                                      ; 18E3 _ 6A, 0F
        push    dword [ebp-18H]                         ; 18E5 _ FF. 75, E8
        push    eax                                     ; 18E8 _ 50
        call    boxfill8                                ; 18E9 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18EE _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18F1 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 18F4 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 18F7 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 18FA _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 18FD _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1900 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1903 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1906 _ 8B. 00
        push    ebx                                     ; 1908 _ 53
        push    ecx                                     ; 1909 _ 51
        push    0                                       ; 190A _ 6A, 00
        push    edx                                     ; 190C _ 52
        push    0                                       ; 190D _ 6A, 00
        push    dword [ebp-18H]                         ; 190F _ FF. 75, E8
        push    eax                                     ; 1912 _ 50
        call    boxfill8                                ; 1913 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1918 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 191B _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 191E _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 1921 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1924 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1927 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 192A _ 8B. 00
        push    ecx                                     ; 192C _ 51
        push    edx                                     ; 192D _ 52
        push    2                                       ; 192E _ 6A, 02
        push    2                                       ; 1930 _ 6A, 02
        push    8                                       ; 1932 _ 6A, 08
        push    dword [ebp-18H]                         ; 1934 _ FF. 75, E8
        push    eax                                     ; 1937 _ 50
        call    boxfill8                                ; 1938 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 193D _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1940 _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1943 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1946 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1949 _ 8B. 00
        push    20                                      ; 194B _ 6A, 14
        push    edx                                     ; 194D _ 52
        push    3                                       ; 194E _ 6A, 03
        push    3                                       ; 1950 _ 6A, 03
        push    12                                      ; 1952 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1954 _ FF. 75, E8
        push    eax                                     ; 1957 _ 50
        call    boxfill8                                ; 1958 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 195D _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1960 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1963 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1966 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1969 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 196C _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 196F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1972 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1975 _ 8B. 00
        push    ebx                                     ; 1977 _ 53
        push    ecx                                     ; 1978 _ 51
        push    edx                                     ; 1979 _ 52
        push    1                                       ; 197A _ 6A, 01
        push    15                                      ; 197C _ 6A, 0F
        push    dword [ebp-18H]                         ; 197E _ FF. 75, E8
        push    eax                                     ; 1981 _ 50
        call    boxfill8                                ; 1982 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1987 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 198A _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 198D _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1990 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1993 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 1996 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1999 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 199C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 199F _ 8B. 00
        push    ebx                                     ; 19A1 _ 53
        push    ecx                                     ; 19A2 _ 51
        push    edx                                     ; 19A3 _ 52
        push    0                                       ; 19A4 _ 6A, 00
        push    0                                       ; 19A6 _ 6A, 00
        push    dword [ebp-18H]                         ; 19A8 _ FF. 75, E8
        push    eax                                     ; 19AB _ 50
        call    boxfill8                                ; 19AC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19B1 _ 83. C4, 1C
        sub     esp, 8                                  ; 19B4 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 19B7 _ FF. 75, 10
        push    7                                       ; 19BA _ 6A, 07
        push    4                                       ; 19BC _ 6A, 04
        push    24                                      ; 19BE _ 6A, 18
        push    dword [ebp+0CH]                         ; 19C0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 19C3 _ FF. 75, 08
        call    showString                              ; 19C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19CB _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 19CE _ C7. 45, F0, 00000000
        jmp     ?_075                                   ; 19D5 _ EB, 7F

?_068:  mov     dword [ebp-0CH], 0                      ; 19D7 _ C7. 45, F4, 00000000
        jmp     ?_074                                   ; 19DE _ EB, 6D

?_069:  mov     eax, dword [ebp-10H]                    ; 19E0 _ 8B. 45, F0
        shl     eax, 4                                  ; 19E3 _ C1. E0, 04
        mov     edx, eax                                ; 19E6 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 19E8 _ 8B. 45, F4
        add     eax, edx                                ; 19EB _ 01. D0
        add     eax, closebtn.2067                      ; 19ED _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 19F2 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 19F4 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 19F7 _ 80. 7D, EF, 40
        jnz near      ?_070                                   ; 19fb _ 75, 06
        mov     byte [ebp-11H], 0                       ; 19FD _ C6. 45, EF, 00
        jmp     ?_073                                   ; 1A01 _ EB, 1C

?_070:  cmp     byte [ebp-11H], 36                      ; 1A03 _ 80. 7D, EF, 24
        jnz near      ?_071                                   ; 1a07 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1A09 _ C6. 45, EF, 0F
        jmp     ?_073                                   ; 1A0D _ EB, 10

?_071:  cmp     byte [ebp-11H], 81                      ; 1A0F _ 80. 7D, EF, 51
        jnz near      ?_072                                   ; 1a13 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1A15 _ C6. 45, EF, 08
        jmp     ?_073                                   ; 1A19 _ EB, 04

?_072:  mov     byte [ebp-11H], 7                       ; 1A1B _ C6. 45, EF, 07
?_073:  mov     eax, dword [ebp+0CH]                    ; 1A1F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1A22 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1A24 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1A27 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1A2A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A2D _ 8B. 40, 04
        imul    ecx, eax                                ; 1A30 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1A33 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A36 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1A39 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1A3C _ 8B. 45, F4
        add     eax, ebx                                ; 1A3F _ 01. D8
        add     eax, ecx                                ; 1A41 _ 01. C8
        add     edx, eax                                ; 1A43 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1A45 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1A48 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1A4A _ FF. 45, F4
?_074:  cmp     dword [ebp-0CH], 15                     ; 1A4D _ 83. 7D, F4, 0F
        jle near      ?_069                                   ; 1a51 _ 7e, 8d
        inc     dword [ebp-10H]                         ; 1A53 _ FF. 45, F0
?_075:  cmp     dword [ebp-10H], 13                     ; 1A56 _ 83. 7D, F0, 0D
        jle near      ?_068                                   ; 1a5a _ 0f 8e, ffffff77
        nop                                             ; 1A60 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1A61 _ 8B. 5D, FC
        leave                                           ; 1A64 _ C9
        ret                                             ; 1A65 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1A66 _ 55
        mov     ebp, esp                                ; 1A67 _ 89. E5
        push    edi                                     ; 1A69 _ 57
        push    esi                                     ; 1A6A _ 56
        push    ebx                                     ; 1A6B _ 53
        sub     esp, 16                                 ; 1A6C _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1A6F _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1A72 _ 8B. 45, 14
        add     eax, edx                                ; 1A75 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1A77 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1A7A _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1A7D _ 8B. 45, 18
        add     eax, edx                                ; 1A80 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1A82 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1A85 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1A88 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1A8B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A8E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A91 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1A94 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1A97 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1A9A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AA0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AA3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AA6 _ 8B. 00
        push    edi                                     ; 1AA8 _ 57
        push    esi                                     ; 1AA9 _ 56
        push    ebx                                     ; 1AAA _ 53
        push    ecx                                     ; 1AAB _ 51
        push    15                                      ; 1AAC _ 6A, 0F
        push    edx                                     ; 1AAE _ 52
        push    eax                                     ; 1AAF _ 50
        call    boxfill8                                ; 1AB0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AB5 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1AB8 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1ABB _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1ABE _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1AC1 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1AC4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AC7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1ACA _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1ACD _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1AD0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AD3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AD6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AD9 _ 8B. 00
        push    edi                                     ; 1ADB _ 57
        push    esi                                     ; 1ADC _ 56
        push    ebx                                     ; 1ADD _ 53
        push    ecx                                     ; 1ADE _ 51
        push    15                                      ; 1ADF _ 6A, 0F
        push    edx                                     ; 1AE1 _ 52
        push    eax                                     ; 1AE2 _ 50
        call    boxfill8                                ; 1AE3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AE8 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1AEB _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1AEE _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1AF1 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1AF4 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1AF7 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1AFA _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1AFD _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B00 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B03 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B06 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B09 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B0C _ 8B. 00
        push    edi                                     ; 1B0E _ 57
        push    esi                                     ; 1B0F _ 56
        push    ebx                                     ; 1B10 _ 53
        push    ecx                                     ; 1B11 _ 51
        push    7                                       ; 1B12 _ 6A, 07
        push    edx                                     ; 1B14 _ 52
        push    eax                                     ; 1B15 _ 50
        call    boxfill8                                ; 1B16 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B1B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1B1E _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1B21 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1B24 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1B27 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1B2A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B2D _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1B30 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1B33 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1B36 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B39 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B3C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B3F _ 8B. 00
        push    edi                                     ; 1B41 _ 57
        push    esi                                     ; 1B42 _ 56
        push    ebx                                     ; 1B43 _ 53
        push    ecx                                     ; 1B44 _ 51
        push    7                                       ; 1B45 _ 6A, 07
        push    edx                                     ; 1B47 _ 52
        push    eax                                     ; 1B48 _ 50
        call    boxfill8                                ; 1B49 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B4E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1B51 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B54 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1B57 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1B5A _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1B5D _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1B60 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1B63 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B66 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B69 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B6C _ 8B. 00
        push    esi                                     ; 1B6E _ 56
        push    dword [ebp-10H]                         ; 1B6F _ FF. 75, F0
        push    ebx                                     ; 1B72 _ 53
        push    ecx                                     ; 1B73 _ 51
        push    0                                       ; 1B74 _ 6A, 00
        push    edx                                     ; 1B76 _ 52
        push    eax                                     ; 1B77 _ 50
        call    boxfill8                                ; 1B78 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B7D _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1B80 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1B83 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1B86 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1B89 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1B8C _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1B8F _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1B92 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B95 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B98 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B9B _ 8B. 00
        push    dword [ebp-14H]                         ; 1B9D _ FF. 75, EC
        push    esi                                     ; 1BA0 _ 56
        push    ebx                                     ; 1BA1 _ 53
        push    ecx                                     ; 1BA2 _ 51
        push    0                                       ; 1BA3 _ 6A, 00
        push    edx                                     ; 1BA5 _ 52
        push    eax                                     ; 1BA6 _ 50
        call    boxfill8                                ; 1BA7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BAC _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BAF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1BB2 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1BB5 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1BB8 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1BBB _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1BBE _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1BC1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BC4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BC7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BCA _ 8B. 00
        push    esi                                     ; 1BCC _ 56
        push    dword [ebp-10H]                         ; 1BCD _ FF. 75, F0
        push    ebx                                     ; 1BD0 _ 53
        push    ecx                                     ; 1BD1 _ 51
        push    8                                       ; 1BD2 _ 6A, 08
        push    edx                                     ; 1BD4 _ 52
        push    eax                                     ; 1BD5 _ 50
        call    boxfill8                                ; 1BD6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BDB _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BDE _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1BE1 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1BE4 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1BE7 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1BEA _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BED _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BF0 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1BF3 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1BF6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BF9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BFC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BFF _ 8B. 00
        push    edi                                     ; 1C01 _ 57
        push    esi                                     ; 1C02 _ 56
        push    ebx                                     ; 1C03 _ 53
        push    ecx                                     ; 1C04 _ 51
        push    8                                       ; 1C05 _ 6A, 08
        push    edx                                     ; 1C07 _ 52
        push    eax                                     ; 1C08 _ 50
        call    boxfill8                                ; 1C09 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C0E _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1C11 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1C14 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1C17 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1C1A _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1C1D _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1C20 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1C23 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C26 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C29 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C2C _ 8B. 00
        push    dword [ebp-14H]                         ; 1C2E _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1C31 _ FF. 75, F0
        push    esi                                     ; 1C34 _ 56
        push    ebx                                     ; 1C35 _ 53
        push    ecx                                     ; 1C36 _ 51
        push    edx                                     ; 1C37 _ 52
        push    eax                                     ; 1C38 _ 50
        call    boxfill8                                ; 1C39 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C3E _ 83. C4, 1C
        nop                                             ; 1C41 _ 90
        lea     esp, [ebp-0CH]                          ; 1C42 _ 8D. 65, F4
        pop     ebx                                     ; 1C45 _ 5B
        pop     esi                                     ; 1C46 _ 5E
        pop     edi                                     ; 1C47 _ 5F
        pop     ebp                                     ; 1C48 _ 5D
        ret                                             ; 1C49 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1C4A _ 55
        mov     ebp, esp                                ; 1C4B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1C4D _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1C50 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C56 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1C59 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C60 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1C63 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C6A _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1C6D _ C7. 40, 0C, 00000000
        nop                                             ; 1C74 _ 90
        pop     ebp                                     ; 1C75 _ 5D
        ret                                             ; 1C76 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1C77 _ 55
        mov     ebp, esp                                ; 1C78 _ 89. E5
        sub     esp, 16                                 ; 1C7A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C7D _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1C84 _ C7. 45, FC, 00000000
        jmp     ?_077                                   ; 1C8B _ EB, 13

?_076:  mov     eax, dword [ebp+8H]                     ; 1C8D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1C90 _ 8B. 55, FC
        add     edx, 2                                  ; 1C93 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C96 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1C9A _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1C9D _ FF. 45, FC
?_077:  mov     eax, dword [ebp+8H]                     ; 1CA0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CA3 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1CA5 _ 39. 45, FC
        jc near       ?_076                                   ; 1ca8 _ 72, e3
        mov     eax, dword [ebp-8H]                     ; 1CAA _ 8B. 45, F8
        leave                                           ; 1CAD _ C9
        ret                                             ; 1CAE _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1CAF _ 55
        mov     ebp, esp                                ; 1CB0 _ 89. E5
        sub     esp, 16                                 ; 1CB2 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CB5 _ C7. 45, FC, 00000000
        jmp     ?_081                                   ; 1CBC _ E9, 00000084

?_078:  mov     eax, dword [ebp+8H]                     ; 1CC1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CC4 _ 8B. 55, FC
        add     edx, 2                                  ; 1CC7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CCA _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1CCE _ 39. 45, 0C
        ja      ?_080                                   ; 1CD1 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1CD3 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CD6 _ 8B. 55, FC
        add     edx, 2                                  ; 1CD9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1CDC _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1CDF _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1CE2 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CE5 _ 8B. 55, FC
        add     edx, 2                                  ; 1CE8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1CEB _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1CEE _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1CF1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1CF4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CF7 _ 8B. 55, FC
        add     edx, 2                                  ; 1CFA _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1CFD _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D00 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D03 _ 8B. 55, FC
        add     edx, 2                                  ; 1D06 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D09 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D0D _ 2B. 45, 0C
        mov     edx, eax                                ; 1D10 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D12 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1D15 _ 8B. 4D, FC
        add     ecx, 2                                  ; 1D18 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D1B _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D1F _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D22 _ 8B. 55, FC
        add     edx, 2                                  ; 1D25 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D28 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1D2C _ 85. C0
        jnz near      ?_079                                   ; 1d2e _ 75, 0d
        mov     eax, dword [ebp+8H]                     ; 1D30 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D33 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D35 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D38 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D3B _ 89. 10
?_079:  mov     eax, dword [ebp-8H]                     ; 1D3D _ 8B. 45, F8
        jmp     ?_082                                   ; 1D40 _ EB, 16

?_080:  inc     dword [ebp-4H]                          ; 1D42 _ FF. 45, FC
?_081:  mov     eax, dword [ebp+8H]                     ; 1D45 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D48 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1D4A _ 39. 45, FC
        jc near       ?_078                                   ; 1d4d _ 0f 82, ffffff6e
        mov     eax, 0                                  ; 1D53 _ B8, 00000000
?_082:  leave                                           ; 1D58 _ C9
        ret                                             ; 1D59 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1D5A _ 55
        mov     ebp, esp                                ; 1D5B _ 89. E5
        push    ebx                                     ; 1D5D _ 53
        sub     esp, 16                                 ; 1D5E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1D61 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1D68 _ EB, 14

?_083:  mov     eax, dword [ebp+8H]                     ; 1D6A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D6D _ 8B. 55, F8
        add     edx, 2                                  ; 1D70 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D73 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1D76 _ 39. 45, 0C
        jc near       ?_085                                   ; 1d79 _ 72, 0f
        inc     dword [ebp-8H]                          ; 1D7B _ FF. 45, F8
?_084:  mov     eax, dword [ebp+8H]                     ; 1D7E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D81 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1D83 _ 39. 45, F8
        jl      ?_083                                   ; 1D86 _ 7C, E2
        jmp     ?_086                                   ; 1D88 _ EB, 01

?_085:  nop                                             ; 1D8A _ 90
?_086:  cmp     dword [ebp-8H], 0                       ; 1D8B _ 83. 7D, F8, 00
        jle near      ?_088                                   ; 1d8f _ 0f 8e, 000000ba
        mov     eax, dword [ebp-8H]                     ; 1D95 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1D98 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D9B _ 8B. 45, 08
        add     edx, 2                                  ; 1D9E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1DA1 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1DA4 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1DA7 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1DAA _ 8B. 45, 08
        add     ecx, 2                                  ; 1DAD _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1DB0 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1DB4 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1DB6 _ 39. 45, 0C
        jne near      ?_088                                   ; 1db9 _ 0f 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1DBF _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1DC2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DC5 _ 8B. 45, 08
        add     edx, 2                                  ; 1DC8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DCB _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1DCF _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1DD2 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1DD5 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DD8 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DDB _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1DDE _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1DE1 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DE5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DE8 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1DEA _ 39. 45, F8
        jge near      ?_087                                   ; 1ded _ 7d, 56
        mov     edx, dword [ebp+0CH]                    ; 1DEF _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1DF2 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DF5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DF8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1DFB _ 8B. 55, F8
        add     edx, 2                                  ; 1DFE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E01 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E04 _ 39. C1
        jnz near      ?_087                                   ; 1e06 _ 75, 3d
        mov     eax, dword [ebp-8H]                     ; 1E08 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E0B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E0E _ 8B. 45, 08
        add     edx, 2                                  ; 1E11 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E14 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E18 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1E1B _ 8B. 4D, F8
        add     ecx, 2                                  ; 1E1E _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E21 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1E25 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1E28 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1E2B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E2E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E31 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E34 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E38 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E3B _ 8B. 00
        lea     edx, [eax-1H]                           ; 1E3D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E40 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E43 _ 89. 10
?_087:  mov     eax, 0                                  ; 1E45 _ B8, 00000000
        jmp     ?_094                                   ; 1E4A _ E9, 0000011B

?_088:  mov     eax, dword [ebp+8H]                     ; 1E4F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E52 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1E54 _ 39. 45, F8
        jge near      ?_089                                   ; 1e57 _ 7d, 52
        mov     edx, dword [ebp+0CH]                    ; 1E59 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E5C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E5F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E62 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E65 _ 8B. 55, F8
        add     edx, 2                                  ; 1E68 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E6B _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E6E _ 39. C1
        jnz near      ?_089                                   ; 1e70 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1E72 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E75 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1E78 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E7B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1E7E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1E81 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E84 _ 8B. 55, F8
        add     edx, 2                                  ; 1E87 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E8A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1E8E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E91 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E97 _ 8B. 55, F8
        add     edx, 2                                  ; 1E9A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E9D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1EA1 _ B8, 00000000
        jmp     ?_094                                   ; 1EA6 _ E9, 000000BF

?_089:  mov     eax, dword [ebp+8H]                     ; 1EAB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EAE _ 8B. 00
        cmp     eax, 4095                               ; 1EB0 _ 3D, 00000FFF
        jg  near      ?_093                                   ; 1eb5 _ 0f 8f, 00000086
        mov     eax, dword [ebp+8H]                     ; 1EBB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EBE _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1EC0 _ 89. 45, F4
        jmp     ?_091                                   ; 1EC3 _ EB, 27

?_090:  mov     eax, dword [ebp-0CH]                    ; 1EC5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1EC8 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1ECB _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1ECE _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1ED1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1ED4 _ 8B. 45, 08
        add     edx, 2                                  ; 1ED7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1EDA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1EDD _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1EDF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1EE2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1EE5 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1EE9 _ FF. 4D, F4
?_091:  mov     eax, dword [ebp-0CH]                    ; 1EEC _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1EEF _ 3B. 45, F8
        jg  near      ?_090                                   ; 1ef2 _ 7f, d1
        mov     eax, dword [ebp+8H]                     ; 1EF4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EF7 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1EF9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EFC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1EFF _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F01 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F04 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F07 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F0A _ 8B. 00
        cmp     edx, eax                                ; 1F0C _ 39. C2
        jge near      ?_092                                   ; 1f0e _ 7d, 0b
        mov     eax, dword [ebp+8H]                     ; 1F10 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F13 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F15 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F18 _ 89. 50, 04
?_092:  mov     eax, dword [ebp+8H]                     ; 1F1B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F1E _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F21 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1F24 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1F27 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F2A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F2D _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F30 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1F33 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1F36 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1F3A _ B8, 00000000
        jmp     ?_094                                   ; 1F3F _ EB, 29

?_093:  mov     eax, dword [ebp+8H]                     ; 1F41 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F44 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1F47 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F4A _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F4D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F50 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F53 _ 8B. 40, 08
        mov     edx, eax                                ; 1F56 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1F58 _ 8B. 45, 10
        add     eax, edx                                ; 1F5B _ 01. D0
        mov     edx, eax                                ; 1F5D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F5F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F62 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1F65 _ B8, FFFFFFFF
?_094:  add     esp, 16                                 ; 1F6A _ 83. C4, 10
        pop     ebx                                     ; 1F6D _ 5B
        pop     ebp                                     ; 1F6E _ 5D
        ret                                             ; 1F6F _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1F70 _ 55
        mov     ebp, esp                                ; 1F71 _ 89. E5
        sub     esp, 16                                 ; 1F73 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1F76 _ 8B. 45, 0C
        add     eax, 4095                               ; 1F79 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1F7E _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1F83 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1F86 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1F89 _ FF. 75, 08
        call    memman_alloc                            ; 1F8C _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1F91 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1F94 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1F97 _ 8B. 45, FC
        leave                                           ; 1F9A _ C9
        ret                                             ; 1F9B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1F9C _ 55
        mov     ebp, esp                                ; 1F9D _ 89. E5
        sub     esp, 16                                 ; 1F9F _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1FA2 _ 8B. 45, 10
        add     eax, 4095                               ; 1FA5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FAA _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1FAF _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1FB2 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1FB5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1FB8 _ FF. 75, 08
        call    memman_free                             ; 1FBB _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1FC0 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1FC3 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FC6 _ 8B. 45, FC
        leave                                           ; 1FC9 _ C9
        ret                                             ; 1FCA _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1FCB _ 55
        mov     ebp, esp                                ; 1FCC _ 89. E5
        sub     esp, 24                                 ; 1FCE _ 83. EC, 18
        sub     esp, 8                                  ; 1FD1 _ 83. EC, 08
        push    9232                                    ; 1FD4 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1FD9 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1FDC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FE1 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1FE4 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1FE7 _ 83. 7D, F0, 00
        jnz near      ?_095                                   ; 1feb _ 75, 0a
        mov     eax, 0                                  ; 1FED _ B8, 00000000
        jmp     ?_099                                   ; 1FF2 _ E9, 00000099

?_095:  mov     eax, dword [ebp+10H]                    ; 1FF7 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1FFA _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1FFE _ 83. EC, 08
        push    eax                                     ; 2001 _ 50
        push    dword [ebp+8H]                          ; 2002 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2005 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 200A _ 83. C4, 10
        mov     edx, eax                                ; 200D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 200F _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2012 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2015 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2018 _ 8B. 40, 04
        test    eax, eax                                ; 201B _ 85. C0
        jnz near      ?_096                                   ; 201d _ 75, 1e
        mov     eax, dword [ebp-10H]                    ; 201F _ 8B. 45, F0
        sub     esp, 4                                  ; 2022 _ 83. EC, 04
        push    9232                                    ; 2025 _ 68, 00002410
        push    eax                                     ; 202A _ 50
        push    dword [ebp+8H]                          ; 202B _ FF. 75, 08
        call    memman_free_4k                          ; 202E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2033 _ 83. C4, 10
        mov     eax, 0                                  ; 2036 _ B8, 00000000
        jmp     ?_099                                   ; 203B _ EB, 53

?_096:  mov     eax, dword [ebp-10H]                    ; 203D _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 2040 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2043 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2045 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 2048 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 204B _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 204E _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 2051 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2054 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 2057 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 205A _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 2061 _ C7. 45, F4, 00000000
        jmp     ?_098                                   ; 2068 _ EB, 1A

?_097:  mov     eax, dword [ebp-10H]                    ; 206A _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 206D _ 8B. 55, F4
        add     edx, 33                                 ; 2070 _ 83. C2, 21
        shl     edx, 5                                  ; 2073 _ C1. E2, 05
        add     eax, edx                                ; 2076 _ 01. D0
        add     eax, 16                                 ; 2078 _ 83. C0, 10
        mov     dword [eax], 0                          ; 207B _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2081 _ FF. 45, F4
?_098:  cmp     dword [ebp-0CH], 255                    ; 2084 _ 81. 7D, F4, 000000FF
        jle near      ?_097                                   ; 208b _ 7e, dd
        mov     eax, dword [ebp-10H]                    ; 208D _ 8B. 45, F0
?_099:  leave                                           ; 2090 _ C9
        ret                                             ; 2091 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2092 _ 55
        mov     ebp, esp                                ; 2093 _ 89. E5
        sub     esp, 16                                 ; 2095 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2098 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 209F _ EB, 5A

?_100:  mov     eax, dword [ebp+8H]                     ; 20A1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20A4 _ 8B. 55, FC
        add     edx, 33                                 ; 20A7 _ 83. C2, 21
        shl     edx, 5                                  ; 20AA _ C1. E2, 05
        add     eax, edx                                ; 20AD _ 01. D0
        add     eax, 16                                 ; 20AF _ 83. C0, 10
        mov     eax, dword [eax]                        ; 20B2 _ 8B. 00
        test    eax, eax                                ; 20B4 _ 85. C0
        jnz near      ?_101                                   ; 20b6 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 20B8 _ 8B. 45, FC
        shl     eax, 5                                  ; 20BB _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 20BE _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 20C4 _ 8B. 45, 08
        add     eax, edx                                ; 20C7 _ 01. D0
        add     eax, 4                                  ; 20C9 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 20CC _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 20CF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20D2 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 20D5 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 20D8 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 20DB _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 20DF _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 20E2 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 20E9 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 20EC _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 20F3 _ 8B. 45, F8
        jmp     ?_103                                   ; 20F6 _ EB, 11

?_101:  inc     dword [ebp-4H]                          ; 20F8 _ FF. 45, FC
?_102:  cmp     dword [ebp-4H], 255                     ; 20FB _ 81. 7D, FC, 000000FF
        jle near      ?_100                                   ; 2102 _ 7e, 9d
        mov     eax, 0                                  ; 2104 _ B8, 00000000
?_103:  leave                                           ; 2109 _ C9
        ret                                             ; 210A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 210B _ 55
        mov     ebp, esp                                ; 210C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 210E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2111 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2114 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2116 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2119 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 211C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 211F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2122 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2125 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2128 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 212B _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 212E _ 89. 50, 14
        nop                                             ; 2131 _ 90
        pop     ebp                                     ; 2132 _ 5D
        ret                                             ; 2133 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2134 _ 55
        mov     ebp, esp                                ; 2135 _ 89. E5
        push    esi                                     ; 2137 _ 56
        push    ebx                                     ; 2138 _ 53
        sub     esp, 16                                 ; 2139 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 213C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 213F _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2142 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2145 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2148 _ 8B. 40, 10
        inc     eax                                     ; 214B _ 40
        cmp     dword [ebp+10H], eax                    ; 214C _ 39. 45, 10
        jle near      ?_104                                   ; 214f _ 7e, 0a
        mov     eax, dword [ebp+8H]                     ; 2151 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2154 _ 8B. 40, 10
        inc     eax                                     ; 2157 _ 40
        mov     dword [ebp+10H], eax                    ; 2158 _ 89. 45, 10
?_104:  cmp     dword [ebp+10H], -1                     ; 215B _ 83. 7D, 10, FF
        jge near      ?_105                                   ; 215f _ 7d, 07
        mov     dword [ebp+10H], -1                     ; 2161 _ C7. 45, 10, FFFFFFFF
?_105:  mov     eax, dword [ebp+0CH]                    ; 2168 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 216B _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 216E _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 2171 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2174 _ 3B. 45, 10
        jle near      ?_112                                   ; 2177 _ 0f 8e, 000001d3
        cmp     dword [ebp+10H], 0                      ; 217D _ 83. 7D, 10, 00
        js near       ?_108                                   ; 2181 _ 0f 88, 000000e1
        mov     eax, dword [ebp-10H]                    ; 2187 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 218A _ 89. 45, F4
        jmp     ?_107                                   ; 218D _ EB, 33

?_106:  mov     eax, dword [ebp-0CH]                    ; 218F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2192 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2195 _ 8B. 45, 08
        add     edx, 4                                  ; 2198 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 219B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 219F _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 21A2 _ 8B. 4D, F4
        add     ecx, 4                                  ; 21A5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21A8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21AC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21AF _ 8B. 55, F4
        add     edx, 4                                  ; 21B2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21B5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 21B9 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 21BC _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 21BF _ FF. 4D, F4
?_107:  mov     eax, dword [ebp-0CH]                    ; 21C2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 21C5 _ 3B. 45, 10
        jg  near      ?_106                                   ; 21c8 _ 7f, c5
        mov     eax, dword [ebp+8H]                     ; 21CA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 21CD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 21D0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 21D3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 21D6 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 21DA _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 21DD _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 21E0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21E3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21E6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 21E9 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 21EC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 21EF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 21F2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21F5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 21F8 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 21FB _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 21FE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2201 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2204 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2207 _ 8B. 40, 0C
        sub     esp, 8                                  ; 220A _ 83. EC, 08
        push    esi                                     ; 220D _ 56
        push    ebx                                     ; 220E _ 53
        push    ecx                                     ; 220F _ 51
        push    edx                                     ; 2210 _ 52
        push    eax                                     ; 2211 _ 50
        push    dword [ebp+8H]                          ; 2212 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2215 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 221A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 221D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2220 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2223 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2226 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2229 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 222C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 222F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2232 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2235 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2238 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 223B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 223E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2241 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2244 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2247 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 224A _ 8B. 40, 0C
        sub     esp, 4                                  ; 224D _ 83. EC, 04
        push    dword [ebp-10H]                         ; 2250 _ FF. 75, F0
        push    esi                                     ; 2253 _ 56
        push    ebx                                     ; 2254 _ 53
        push    ecx                                     ; 2255 _ 51
        push    edx                                     ; 2256 _ 52
        push    eax                                     ; 2257 _ 50
        push    dword [ebp+8H]                          ; 2258 _ FF. 75, 08
        call    sheet_refreshsub                        ; 225B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2260 _ 83. C4, 20
        jmp     ?_119                                   ; 2263 _ E9, 00000239

?_108:  mov     eax, dword [ebp+8H]                     ; 2268 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 226B _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 226E _ 39. 45, F0
        jge near      ?_111                                   ; 2271 _ 7d, 46
        mov     eax, dword [ebp-10H]                    ; 2273 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2276 _ 89. 45, F4
        jmp     ?_110                                   ; 2279 _ EB, 33

?_109:  mov     eax, dword [ebp-0CH]                    ; 227B _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 227E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2281 _ 8B. 45, 08
        add     edx, 4                                  ; 2284 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2287 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 228B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 228E _ 8B. 4D, F4
        add     ecx, 4                                  ; 2291 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2294 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2298 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 229B _ 8B. 55, F4
        add     edx, 4                                  ; 229E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22A1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 22A5 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 22A8 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 22AB _ FF. 45, F4
?_110:  mov     eax, dword [ebp+8H]                     ; 22AE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22B1 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 22B4 _ 39. 45, F4
        jl      ?_109                                   ; 22B7 _ 7C, C2
?_111:  mov     eax, dword [ebp+8H]                     ; 22B9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22BC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 22BF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22C2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 22C5 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22C8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22CB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22CE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 22D1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 22D4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 22D7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22DA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22DD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 22E0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 22E3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22E6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22E9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22EC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22EF _ 8B. 40, 0C
        sub     esp, 8                                  ; 22F2 _ 83. EC, 08
        push    0                                       ; 22F5 _ 6A, 00
        push    ebx                                     ; 22F7 _ 53
        push    ecx                                     ; 22F8 _ 51
        push    edx                                     ; 22F9 _ 52
        push    eax                                     ; 22FA _ 50
        push    dword [ebp+8H]                          ; 22FB _ FF. 75, 08
        call    sheet_refreshmap                        ; 22FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2303 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2306 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 2309 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 230C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 230F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2312 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2315 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2318 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 231B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 231E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2321 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2324 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2327 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 232A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 232D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2330 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2333 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2336 _ 83. EC, 04
        push    esi                                     ; 2339 _ 56
        push    0                                       ; 233A _ 6A, 00
        push    ebx                                     ; 233C _ 53
        push    ecx                                     ; 233D _ 51
        push    edx                                     ; 233E _ 52
        push    eax                                     ; 233F _ 50
        push    dword [ebp+8H]                          ; 2340 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2343 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2348 _ 83. C4, 20
        jmp     ?_119                                   ; 234B _ E9, 00000151

?_112:  mov     eax, dword [ebp-10H]                    ; 2350 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2353 _ 3B. 45, 10
        jge near      ?_119                                   ; 2356 _ 0f 8d, 00000145
        cmp     dword [ebp-10H], 0                      ; 235C _ 83. 7D, F0, 00
        js near       ?_115                                   ; 2360 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2362 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2365 _ 89. 45, F4
        jmp     ?_114                                   ; 2368 _ EB, 33

?_113:  mov     eax, dword [ebp-0CH]                    ; 236A _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 236D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2370 _ 8B. 45, 08
        add     edx, 4                                  ; 2373 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2376 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 237A _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 237D _ 8B. 4D, F4
        add     ecx, 4                                  ; 2380 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2383 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2387 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 238A _ 8B. 55, F4
        add     edx, 4                                  ; 238D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2390 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2394 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 2397 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 239A _ FF. 45, F4
?_114:  mov     eax, dword [ebp-0CH]                    ; 239D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23A0 _ 3B. 45, 10
        jl      ?_113                                   ; 23A3 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 23A5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 23A8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 23AB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 23AE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 23B1 _ 89. 54 88, 04
        jmp     ?_118                                   ; 23B5 _ EB, 69

?_115:  mov     eax, dword [ebp+8H]                     ; 23B7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23BA _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 23BD _ 89. 45, F4
        jmp     ?_117                                   ; 23C0 _ EB, 37

?_116:  mov     eax, dword [ebp-0CH]                    ; 23C2 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 23C5 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 23C8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23CB _ 8B. 55, F4
        add     edx, 4                                  ; 23CE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23D1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23D5 _ 8B. 45, 08
        add     ecx, 4                                  ; 23D8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 23DB _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 23DF _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 23E2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23E5 _ 8B. 45, 08
        add     edx, 4                                  ; 23E8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 23EB _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 23EF _ 8B. 55, F4
        inc     edx                                     ; 23F2 _ 42
        mov     dword [eax+18H], edx                    ; 23F3 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 23F6 _ FF. 4D, F4
?_117:  mov     eax, dword [ebp-0CH]                    ; 23F9 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23FC _ 3B. 45, 10
        jge near      ?_116                                   ; 23ff _ 7d, c1
        mov     eax, dword [ebp+8H]                     ; 2401 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2404 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2407 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 240A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 240D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2411 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2414 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2417 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 241A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 241D _ 89. 50, 10
?_118:  mov     eax, dword [ebp+0CH]                    ; 2420 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2423 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2426 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2429 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 242C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 242F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2432 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2435 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2438 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 243B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 243E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2441 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2444 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2447 _ 8B. 40, 0C
        sub     esp, 8                                  ; 244A _ 83. EC, 08
        push    dword [ebp+10H]                         ; 244D _ FF. 75, 10
        push    ebx                                     ; 2450 _ 53
        push    ecx                                     ; 2451 _ 51
        push    edx                                     ; 2452 _ 52
        push    eax                                     ; 2453 _ 50
        push    dword [ebp+8H]                          ; 2454 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2457 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 245C _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 245F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2462 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2465 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2468 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 246B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 246E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2471 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2474 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2477 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 247A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 247D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2480 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2483 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2486 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2489 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 248C _ FF. 75, 10
        push    dword [ebp+10H]                         ; 248F _ FF. 75, 10
        push    ebx                                     ; 2492 _ 53
        push    ecx                                     ; 2493 _ 51
        push    edx                                     ; 2494 _ 52
        push    eax                                     ; 2495 _ 50
        push    dword [ebp+8H]                          ; 2496 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2499 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 249E _ 83. C4, 20
?_119:  nop                                             ; 24A1 _ 90
        lea     esp, [ebp-8H]                           ; 24A2 _ 8D. 65, F8
        pop     ebx                                     ; 24A5 _ 5B
        pop     esi                                     ; 24A6 _ 5E
        pop     ebp                                     ; 24A7 _ 5D
        ret                                             ; 24A8 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 24A9 _ 55
        mov     ebp, esp                                ; 24AA _ 89. E5
        push    edi                                     ; 24AC _ 57
        push    esi                                     ; 24AD _ 56
        push    ebx                                     ; 24AE _ 53
        sub     esp, 28                                 ; 24AF _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 24B2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24B5 _ 8B. 40, 18
        test    eax, eax                                ; 24B8 _ 85. C0
        js near       ?_120                                   ; 24ba _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 24BC _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 24BF _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 24C2 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 24C5 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 24C8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24CB _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 24CE _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 24D1 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 24D4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24D7 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 24DA _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 24DD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 24E0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24E3 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 24E6 _ 8B. 45, 14
        add     edx, eax                                ; 24E9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 24EB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24EE _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 24F1 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 24F4 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 24F7 _ 03. 45, E4
        sub     esp, 4                                  ; 24FA _ 83. EC, 04
        push    ebx                                     ; 24FD _ 53
        push    ecx                                     ; 24FE _ 51
        push    edi                                     ; 24FF _ 57
        push    esi                                     ; 2500 _ 56
        push    edx                                     ; 2501 _ 52
        push    eax                                     ; 2502 _ 50
        push    dword [ebp+8H]                          ; 2503 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2506 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 250B _ 83. C4, 20
?_120:  mov     eax, 0                                  ; 250E _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2513 _ 8D. 65, F4
        pop     ebx                                     ; 2516 _ 5B
        pop     esi                                     ; 2517 _ 5E
        pop     edi                                     ; 2518 _ 5F
        pop     ebp                                     ; 2519 _ 5D
        ret                                             ; 251A _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 251B _ 55
        mov     ebp, esp                                ; 251C _ 89. E5
        push    esi                                     ; 251E _ 56
        push    ebx                                     ; 251F _ 53
        sub     esp, 16                                 ; 2520 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2523 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2526 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2529 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 252C _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 252F _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2532 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2535 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2538 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 253B _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 253E _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2541 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2544 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2547 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 254A _ 8B. 40, 18
        test    eax, eax                                ; 254D _ 85. C0
        js near       ?_121                                   ; 254f _ 0f 88, 000000d3
        mov     eax, dword [ebp+0CH]                    ; 2555 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2558 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 255B _ 8B. 45, F0
        add     edx, eax                                ; 255E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2560 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2563 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 2566 _ 8B. 45, F4
        add     eax, ecx                                ; 2569 _ 01. C8
        sub     esp, 8                                  ; 256B _ 83. EC, 08
        push    0                                       ; 256E _ 6A, 00
        push    edx                                     ; 2570 _ 52
        push    eax                                     ; 2571 _ 50
        push    dword [ebp-10H]                         ; 2572 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2575 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2578 _ FF. 75, 08
        call    sheet_refreshmap                        ; 257B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2580 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2583 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2586 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2589 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 258C _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 258F _ 8B. 55, 14
        add     ecx, edx                                ; 2592 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2594 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2597 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 259A _ 8B. 55, 10
        add     edx, ebx                                ; 259D _ 01. DA
        sub     esp, 8                                  ; 259F _ 83. EC, 08
        push    eax                                     ; 25A2 _ 50
        push    ecx                                     ; 25A3 _ 51
        push    edx                                     ; 25A4 _ 52
        push    dword [ebp+14H]                         ; 25A5 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 25A8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 25AB _ FF. 75, 08
        call    sheet_refreshmap                        ; 25AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25B3 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25B6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25B9 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 25BC _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 25BF _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25C2 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 25C5 _ 8B. 45, F0
        add     edx, eax                                ; 25C8 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25CA _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 25CD _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 25D0 _ 8B. 45, F4
        add     eax, ebx                                ; 25D3 _ 01. D8
        sub     esp, 4                                  ; 25D5 _ 83. EC, 04
        push    ecx                                     ; 25D8 _ 51
        push    0                                       ; 25D9 _ 6A, 00
        push    edx                                     ; 25DB _ 52
        push    eax                                     ; 25DC _ 50
        push    dword [ebp-10H]                         ; 25DD _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 25E0 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 25E3 _ FF. 75, 08
        call    sheet_refreshsub                        ; 25E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25EB _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25EE _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 25F1 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 25F4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25F7 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 25FA _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 25FD _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2600 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2603 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2605 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2608 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 260B _ 8B. 4D, 10
        add     ecx, esi                                ; 260E _ 01. F1
        sub     esp, 4                                  ; 2610 _ 83. EC, 04
        push    edx                                     ; 2613 _ 52
        push    eax                                     ; 2614 _ 50
        push    ebx                                     ; 2615 _ 53
        push    ecx                                     ; 2616 _ 51
        push    dword [ebp+14H]                         ; 2617 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 261A _ FF. 75, 10
        push    dword [ebp+8H]                          ; 261D _ FF. 75, 08
        call    sheet_refreshsub                        ; 2620 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2625 _ 83. C4, 20
?_121:  nop                                             ; 2628 _ 90
        lea     esp, [ebp-8H]                           ; 2629 _ 8D. 65, F8
        pop     ebx                                     ; 262C _ 5B
        pop     esi                                     ; 262D _ 5E
        pop     ebp                                     ; 262E _ 5D
        ret                                             ; 262F _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2630 _ 55
        mov     ebp, esp                                ; 2631 _ 89. E5
        sub     esp, 48                                 ; 2633 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2636 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2639 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 263B _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 263E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2641 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2644 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2647 _ 83. 7D, 0C, 00
        jns     ?_122                                   ; 264B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 264D _ C7. 45, 0C, 00000000
?_122:  cmp     dword [ebp+10H], 8                      ; 2654 _ 83. 7D, 10, 08
        jg  near      ?_123                                   ; 2658 _ 7f, 07
        mov     dword [ebp+10H], 0                      ; 265A _ C7. 45, 10, 00000000
?_123:  mov     eax, dword [ebp+8H]                     ; 2661 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2664 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2667 _ 39. 45, 14
        jle near      ?_124                                   ; 266a _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 266C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 266F _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2672 _ 89. 45, 14
?_124:  mov     eax, dword [ebp+8H]                     ; 2675 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2678 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 267B _ 39. 45, 18
        jle near      ?_125                                   ; 267e _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 2680 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2683 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2686 _ 89. 45, 18
?_125:  mov     eax, dword [ebp+1CH]                    ; 2689 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 268C _ 89. 45, FC
        jmp     ?_132                                   ; 268F _ E9, 0000010E

?_126:  mov     eax, dword [ebp+8H]                     ; 2694 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2697 _ 8B. 55, FC
        add     edx, 4                                  ; 269A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 269D _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 26A1 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 26A4 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 26A7 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 26A9 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 26AC _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 26AF _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 26B5 _ 8B. 45, E8
        sub     eax, edx                                ; 26B8 _ 29. D0
        sar     eax, 5                                  ; 26BA _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 26BD _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 26C0 _ C7. 45, F4, 00000000
        jmp     ?_131                                   ; 26C7 _ E9, 000000C4

?_127:  mov     eax, dword [ebp-18H]                    ; 26CC _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 26CF _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 26D2 _ 8B. 45, F4
        add     eax, edx                                ; 26D5 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 26D7 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 26DA _ C7. 45, F8, 00000000
        jmp     ?_130                                   ; 26E1 _ E9, 00000098

?_128:  mov     eax, dword [ebp-18H]                    ; 26E6 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 26E9 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 26EC _ 8B. 45, F8
        add     eax, edx                                ; 26EF _ 01. D0
        mov     dword [ebp-28H], eax                    ; 26F1 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 26F4 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 26F7 _ 3B. 45, D8
        jg  near      ?_129                                   ; 26fa _ 7f, 7f
        mov     eax, dword [ebp-28H]                    ; 26FC _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 26FF _ 3B. 45, 14
        jge near      ?_129                                   ; 2702 _ 7d, 77
        mov     eax, dword [ebp+10H]                    ; 2704 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2707 _ 3B. 45, DC
        jg  near      ?_129                                   ; 270a _ 7f, 6f
        mov     eax, dword [ebp-24H]                    ; 270C _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 270F _ 3B. 45, 18
        jge near      ?_129                                   ; 2712 _ 7d, 67
        mov     eax, dword [ebp-18H]                    ; 2714 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2717 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 271A _ 0F AF. 45, F4
        mov     edx, eax                                ; 271E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2720 _ 8B. 45, F8
        add     eax, edx                                ; 2723 _ 01. D0
        mov     edx, eax                                ; 2725 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2727 _ 8B. 45, E4
        add     eax, edx                                ; 272A _ 01. D0
        mov     al, byte [eax]                          ; 272C _ 8A. 00
        mov     byte [ebp-29H], al                      ; 272E _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2731 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2734 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2737 _ 0F AF. 45, DC
        mov     edx, eax                                ; 273B _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 273D _ 8B. 45, D8
        add     eax, edx                                ; 2740 _ 01. D0
        mov     edx, eax                                ; 2742 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2744 _ 8B. 45, EC
        add     eax, edx                                ; 2747 _ 01. D0
        mov     al, byte [eax]                          ; 2749 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 274B _ 38. 45, E3
        jnz near      ?_129                                   ; 274e _ 75, 2b
        movzx   edx, byte [ebp-29H]                     ; 2750 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2754 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2757 _ 8B. 40, 14
        cmp     edx, eax                                ; 275A _ 39. C2
        jz near       ?_129                                   ; 275c _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 275E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2761 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2764 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2768 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 276A _ 8B. 45, D8
        add     eax, edx                                ; 276D _ 01. D0
        mov     edx, eax                                ; 276F _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2771 _ 8B. 45, F0
        add     edx, eax                                ; 2774 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2776 _ 8A. 45, D7
        mov     byte [edx], al                          ; 2779 _ 88. 02
?_129:  inc     dword [ebp-8H]                          ; 277B _ FF. 45, F8
?_130:  mov     eax, dword [ebp-18H]                    ; 277E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2781 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2784 _ 39. 45, F8
        jl      ?_128                                   ; 2787 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 278D _ FF. 45, F4
?_131:  mov     eax, dword [ebp-18H]                    ; 2790 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2793 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 2796 _ 39. 45, F4
        jl      ?_127                                   ; 2799 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 279F _ FF. 45, FC
?_132:  mov     eax, dword [ebp-4H]                     ; 27A2 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 27A5 _ 3B. 45, 20
        jle near      ?_126                                   ; 27a8 _ 0f 8e, fffffee6
        nop                                             ; 27AE _ 90
        nop                                             ; 27AF _ 90
        leave                                           ; 27B0 _ C9
        ret                                             ; 27B1 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 27B2 _ 55
        mov     ebp, esp                                ; 27B3 _ 89. E5
        sub     esp, 64                                 ; 27B5 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 27B8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27BB _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 27BE _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 27C1 _ 83. 7D, 0C, 00
        jns     ?_133                                   ; 27C5 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 27C7 _ C7. 45, 0C, 00000000
?_133:  cmp     dword [ebp+10H], 0                      ; 27CE _ 83. 7D, 10, 00
        jns     ?_134                                   ; 27D2 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 27D4 _ C7. 45, 10, 00000000
?_134:  mov     eax, dword [ebp+8H]                     ; 27DB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27DE _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 27E1 _ 39. 45, 14
        jle near      ?_135                                   ; 27e4 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 27E6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27E9 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 27EC _ 89. 45, 14
?_135:  mov     eax, dword [ebp+8H]                     ; 27EF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27F2 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 27F5 _ 39. 45, 18
        jle near      ?_136                                   ; 27f8 _ 7e, 09
        mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27FD _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2800 _ 89. 45, 18
?_136:  mov     eax, dword [ebp+1CH]                    ; 2803 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2806 _ 89. 45, FC
        jmp     ?_147                                   ; 2809 _ E9, 00000137

?_137:  mov     eax, dword [ebp+8H]                     ; 280E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2811 _ 8B. 55, FC
        add     edx, 4                                  ; 2814 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2817 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 281B _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 281E _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2821 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2827 _ 8B. 45, DC
        sub     eax, edx                                ; 282A _ 29. D0
        sar     eax, 5                                  ; 282C _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 282F _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2832 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2835 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2837 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 283A _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 283D _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2840 _ 8B. 55, 0C
        sub     edx, eax                                ; 2843 _ 29. C2
        mov     eax, edx                                ; 2845 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2847 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 284A _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 284D _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2850 _ 8B. 55, 10
        sub     edx, eax                                ; 2853 _ 29. C2
        mov     eax, edx                                ; 2855 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2857 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 285A _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 285D _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2860 _ 8B. 55, 14
        sub     edx, eax                                ; 2863 _ 29. C2
        mov     eax, edx                                ; 2865 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2867 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 286A _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 286D _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2870 _ 8B. 55, 18
        sub     edx, eax                                ; 2873 _ 29. C2
        mov     eax, edx                                ; 2875 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2877 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 287A _ 83. 7D, F0, 00
        jns     ?_138                                   ; 287E _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2880 _ C7. 45, F0, 00000000
?_138:  cmp     dword [ebp-14H], 0                      ; 2887 _ 83. 7D, EC, 00
        jns     ?_139                                   ; 288B _ 79, 07
        mov     dword [ebp-14H], 0                      ; 288D _ C7. 45, EC, 00000000
?_139:  mov     eax, dword [ebp-24H]                    ; 2894 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2897 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 289A _ 39. 45, E8
        jle near      ?_140                                   ; 289d _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 289F _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28A2 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 28A5 _ 89. 45, E8
?_140:  mov     eax, dword [ebp-24H]                    ; 28A8 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28AB _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 28AE _ 39. 45, E4
        jle near      ?_141                                   ; 28b1 _ 7e, 09
        mov     eax, dword [ebp-24H]                    ; 28B3 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28B6 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 28B9 _ 89. 45, E4
?_141:  mov     eax, dword [ebp-14H]                    ; 28BC _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 28BF _ 89. 45, F4
        jmp     ?_146                                   ; 28C2 _ EB, 76

?_142:  mov     eax, dword [ebp-24H]                    ; 28C4 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 28C7 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 28CA _ 8B. 45, F4
        add     eax, edx                                ; 28CD _ 01. D0
        mov     dword [ebp-30H], eax                    ; 28CF _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 28D2 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 28D5 _ 89. 45, F8
        jmp     ?_145                                   ; 28D8 _ EB, 55

?_143:  mov     eax, dword [ebp-24H]                    ; 28DA _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 28DD _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 28E0 _ 8B. 45, F8
        add     eax, edx                                ; 28E3 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 28E5 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 28E8 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28EB _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 28EE _ 0F AF. 45, F4
        mov     edx, eax                                ; 28F2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 28F4 _ 8B. 45, F8
        add     eax, edx                                ; 28F7 _ 01. D0
        mov     edx, eax                                ; 28F9 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 28FB _ 8B. 45, D4
        add     eax, edx                                ; 28FE _ 01. D0
        mov     al, byte [eax]                          ; 2900 _ 8A. 00
        movzx   edx, al                                 ; 2902 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2905 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2908 _ 8B. 40, 14
        cmp     edx, eax                                ; 290B _ 39. C2
        jz near       ?_144                                   ; 290d _ 74, 1d
        mov     eax, dword [ebp+8H]                     ; 290F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2912 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2915 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2919 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 291B _ 8B. 45, CC
        add     eax, edx                                ; 291E _ 01. D0
        mov     edx, eax                                ; 2920 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2922 _ 8B. 45, E0
        add     edx, eax                                ; 2925 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2927 _ 8A. 45, DB
        mov     byte [edx], al                          ; 292A _ 88. 02
?_144:  inc     dword [ebp-8H]                          ; 292C _ FF. 45, F8
?_145:  mov     eax, dword [ebp-8H]                     ; 292F _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2932 _ 3B. 45, E8
        jl      ?_143                                   ; 2935 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2937 _ FF. 45, F4
?_146:  mov     eax, dword [ebp-0CH]                    ; 293A _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 293D _ 3B. 45, E4
        jl      ?_142                                   ; 2940 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2942 _ FF. 45, FC
?_147:  mov     eax, dword [ebp+8H]                     ; 2945 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2948 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 294B _ 39. 45, FC
        jle near      ?_137                                   ; 294e _ 0f 8e, fffffeba
        nop                                             ; 2954 _ 90
        leave                                           ; 2955 _ C9
        ret                                             ; 2956 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2957 _ 55
        mov     ebp, esp                                ; 2958 _ 89. E5
        sub     esp, 24                                 ; 295A _ 83. EC, 18
        sub     esp, 8                                  ; 295D _ 83. EC, 08
        push    52                                      ; 2960 _ 6A, 34
        push    67                                      ; 2962 _ 6A, 43
        call    io_out8                                 ; 2964 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2969 _ 83. C4, 10
        sub     esp, 8                                  ; 296C _ 83. EC, 08
        push    156                                     ; 296F _ 68, 0000009C
        push    64                                      ; 2974 _ 6A, 40
        call    io_out8                                 ; 2976 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 297B _ 83. C4, 10
        sub     esp, 8                                  ; 297E _ 83. EC, 08
        push    46                                      ; 2981 _ 6A, 2E
        push    64                                      ; 2983 _ 6A, 40
        call    io_out8                                 ; 2985 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 298A _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 298D _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2997 _ C7. 45, F4, 00000000
        jmp     ?_149                                   ; 299E _ EB, 25

?_148:  mov     eax, dword [ebp-0CH]                    ; 29A0 _ 8B. 45, F4
        shl     eax, 4                                  ; 29A3 _ C1. E0, 04
        add     eax, ?_202                              ; 29A6 _ 05, 00000388(d)
        mov     dword [eax], 0                          ; 29AB _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 29B1 _ 8B. 45, F4
        shl     eax, 4                                  ; 29B4 _ C1. E0, 04
        add     eax, ?_203                              ; 29B7 _ 05, 0000038C(d)
        mov     dword [eax], 0                          ; 29BC _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 29C2 _ FF. 45, F4
?_149:  cmp     dword [ebp-0CH], 499                    ; 29C5 _ 81. 7D, F4, 000001F3
        jle near      ?_148                                   ; 29cc _ 7e, d2
        nop                                             ; 29CE _ 90
        nop                                             ; 29CF _ 90
        leave                                           ; 29D0 _ C9
        ret                                             ; 29D1 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 29D2 _ 55
        mov     ebp, esp                                ; 29D3 _ 89. E5
        sub     esp, 16                                 ; 29D5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 29D8 _ C7. 45, FC, 00000000
        jmp     ?_152                                   ; 29DF _ EB, 35

?_150:  mov     eax, dword [ebp-4H]                     ; 29E1 _ 8B. 45, FC
        shl     eax, 4                                  ; 29E4 _ C1. E0, 04
        add     eax, ?_202                              ; 29E7 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 29EC _ 8B. 00
        test    eax, eax                                ; 29EE _ 85. C0
        jnz near      ?_151                                   ; 29f0 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 29F2 _ 8B. 45, FC
        shl     eax, 4                                  ; 29F5 _ C1. E0, 04
        add     eax, ?_202                              ; 29F8 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 29FD _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A03 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A06 _ C1. E0, 04
        add     eax, timerctl                           ; 2A09 _ 05, 00000380(d)
        add     eax, 4                                  ; 2A0E _ 83. C0, 04
        jmp     ?_153                                   ; 2A11 _ EB, 11

?_151:  inc     dword [ebp-4H]                          ; 2A13 _ FF. 45, FC
?_152:  cmp     dword [ebp-4H], 499                     ; 2A16 _ 81. 7D, FC, 000001F3
        jle near      ?_150                                   ; 2a1d _ 7e, c2
        mov     eax, 0                                  ; 2A1F _ B8, 00000000
?_153:  leave                                           ; 2A24 _ C9
        ret                                             ; 2A25 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A26 _ 55
        mov     ebp, esp                                ; 2A27 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A29 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A2C _ C7. 40, 04, 00000000
        nop                                             ; 2A33 _ 90
        pop     ebp                                     ; 2A34 _ 5D
        ret                                             ; 2A35 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A36 _ 55
        mov     ebp, esp                                ; 2A37 _ 89. E5
        sub     esp, 4                                  ; 2A39 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A3C _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A3F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A42 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A45 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2A48 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A4B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2A4E _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A51 _ 88. 50, 0C
        nop                                             ; 2A54 _ 90
        leave                                           ; 2A55 _ C9
        ret                                             ; 2A56 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A57 _ 55
        mov     ebp, esp                                ; 2A58 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A5A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A5D _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2A60 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2A62 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2A65 _ C7. 40, 04, 00000002
        nop                                             ; 2A6C _ 90
        pop     ebp                                     ; 2A6D _ 5D
        ret                                             ; 2A6E _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2A6F _ 55
        mov     ebp, esp                                ; 2A70 _ 89. E5
        sub     esp, 24                                 ; 2A72 _ 83. EC, 18
        sub     esp, 8                                  ; 2A75 _ 83. EC, 08
        push    32                                      ; 2A78 _ 6A, 20
        push    32                                      ; 2A7A _ 6A, 20
        call    io_out8                                 ; 2A7C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A81 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2A84 _ A1, 00000380(d)
        inc     eax                                     ; 2A89 _ 40
        mov     dword [timerctl], eax                   ; 2A8A _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 2A8F _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2A93 _ C7. 45, F4, 00000000
        jmp     ?_157                                   ; 2A9A _ E9, 000000A8

?_154:  mov     eax, dword [ebp-0CH]                    ; 2A9F _ 8B. 45, F4
        shl     eax, 4                                  ; 2AA2 _ C1. E0, 04
        add     eax, ?_202                              ; 2AA5 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2AAA _ 8B. 00
        cmp     eax, 2                                  ; 2AAC _ 83. F8, 02
        jne near      ?_155                                   ; 2aaf _ 0f 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2AB5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AB8 _ C1. E0, 04
        add     eax, ?_201                              ; 2ABB _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2AC0 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2AC2 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2AC5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AC8 _ C1. E0, 04
        add     eax, ?_201                              ; 2ACB _ 05, 00000384(d)
        mov     dword [eax], edx                        ; 2AD0 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2AD2 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AD5 _ C1. E0, 04
        add     eax, ?_201                              ; 2AD8 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2ADD _ 8B. 00
        test    eax, eax                                ; 2ADF _ 85. C0
        jnz near      ?_155                                   ; 2ae1 _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2AE3 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AE6 _ C1. E0, 04
        add     eax, ?_202                              ; 2AE9 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2AEE _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2AF4 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AF7 _ C1. E0, 04
        add     eax, ?_204                              ; 2AFA _ 05, 00000390(d)
        mov     al, byte [eax]                          ; 2AFF _ 8A. 00
        movzx   edx, al                                 ; 2B01 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2B04 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B07 _ C1. E0, 04
        add     eax, ?_203                              ; 2B0A _ 05, 0000038C(d)
        mov     eax, dword [eax]                        ; 2B0F _ 8B. 00
        sub     esp, 8                                  ; 2B11 _ 83. EC, 08
        push    edx                                     ; 2B14 _ 52
        push    eax                                     ; 2B15 _ 50
        call    fifo8_put                               ; 2B16 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B1B _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2B1E _ 8B. 45, F4
        shl     eax, 4                                  ; 2B21 _ C1. E0, 04
        add     eax, timerctl                           ; 2B24 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 2B29 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2B2C _ A1, 00000000(d)
        cmp     edx, eax                                ; 2B31 _ 39. C2
        jnz near      ?_155                                   ; 2b33 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2B35 _ C6. 45, F3, 01
?_155:  cmp     byte [ebp-0DH], 0                       ; 2B39 _ 80. 7D, F3, 00
        jz near       ?_156                                   ; 2b3d _ 74, 05
        call    task_switch                             ; 2B3F _ E8, FFFFFFFC(rel)
?_156:  inc     dword [ebp-0CH]                         ; 2B44 _ FF. 45, F4
?_157:  cmp     dword [ebp-0CH], 499                    ; 2B47 _ 81. 7D, F4, 000001F3
        jle near      ?_154                                   ; 2b4e _ 0f 8e, ffffff4b
        nop                                             ; 2B54 _ 90
        leave                                           ; 2B55 _ C9
        ret                                             ; 2B56 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2B57 _ 55
        mov     ebp, esp                                ; 2B58 _ 89. E5
        mov     eax, timerctl                           ; 2B5A _ B8, 00000380(d)
        pop     ebp                                     ; 2B5F _ 5D
        ret                                             ; 2B60 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2B61 _ 55
        mov     ebp, esp                                ; 2B62 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B64 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B67 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2B6A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2B6D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2B70 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2B73 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2B75 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B78 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2B7B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2B7E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2B81 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B88 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B8B _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B92 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2B95 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B9C _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2B9F _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2BA2 _ 89. 50, 18
        nop                                             ; 2BA5 _ 90
        pop     ebp                                     ; 2BA6 _ 5D
        ret                                             ; 2BA7 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2BA8 _ 55
        mov     ebp, esp                                ; 2BA9 _ 89. E5
        sub     esp, 24                                 ; 2BAB _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2BAE _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2BB1 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2BB4 _ 83. 7D, 08, 00
        jnz near      ?_158                                   ; 2bb8 _ 75, 0a
        mov     eax, 4294967295                         ; 2BBA _ B8, FFFFFFFF
        jmp     ?_162                                   ; 2BBF _ E9, 0000009B

?_158:  mov     eax, dword [ebp+8H]                     ; 2BC4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BC7 _ 8B. 40, 10
        test    eax, eax                                ; 2BCA _ 85. C0
        jnz near      ?_159                                   ; 2bcc _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2BCE _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2BD1 _ 8B. 40, 14
        or      eax, 01H                                ; 2BD4 _ 83. C8, 01
        mov     edx, eax                                ; 2BD7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BD9 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2BDC _ 89. 50, 14
        mov     eax, 4294967295                         ; 2BDF _ B8, FFFFFFFF
        jmp     ?_162                                   ; 2BE4 _ EB, 79

?_159:  mov     eax, dword [ebp+8H]                     ; 2BE6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2BE9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2BEB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BEE _ 8B. 40, 04
        add     edx, eax                                ; 2BF1 _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2BF3 _ 8A. 45, F4
        mov     byte [edx], al                          ; 2BF6 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2BF8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BFB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2BFE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C01 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2C04 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C07 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2C0A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C10 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2C13 _ 39. C2
        jnz near      ?_160                                   ; 2c15 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2C17 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C1A _ C7. 40, 04, 00000000
?_160:  mov     eax, dword [ebp+8H]                     ; 2C21 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C24 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2C27 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C2A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2C2D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C30 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C33 _ 8B. 40, 18
        test    eax, eax                                ; 2C36 _ 85. C0
        jz near       ?_161                                   ; 2c38 _ 74, 20
        mov     eax, dword [ebp+8H]                     ; 2C3A _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C3D _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2C40 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2C43 _ 83. F8, 02
        jz near       ?_161                                   ; 2c46 _ 74, 12
        mov     eax, dword [ebp+8H]                     ; 2C48 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C4B _ 8B. 40, 18
        sub     esp, 12                                 ; 2C4E _ 83. EC, 0C
        push    eax                                     ; 2C51 _ 50
        call    task_run                                ; 2C52 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C57 _ 83. C4, 10
?_161:  mov     eax, 0                                  ; 2C5A _ B8, 00000000
?_162:  leave                                           ; 2C5F _ C9
        ret                                             ; 2C60 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2C61 _ 55
        mov     ebp, esp                                ; 2C62 _ 89. E5
        sub     esp, 16                                 ; 2C64 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2C67 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2C6A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C6D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C70 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2C73 _ 39. C2
        jnz near      ?_163                                   ; 2c75 _ 75, 07
        mov     eax, 4294967295                         ; 2C77 _ B8, FFFFFFFF
        jmp     ?_165                                   ; 2C7C _ EB, 50

?_163:  mov     eax, dword [ebp+8H]                     ; 2C7E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2C81 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2C83 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C86 _ 8B. 40, 08
        add     eax, edx                                ; 2C89 _ 01. D0
        mov     al, byte [eax]                          ; 2C8B _ 8A. 00
        movzx   eax, al                                 ; 2C8D _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2C90 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C93 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C96 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2C99 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C9C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2C9F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CA2 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2CA5 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CA8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CAB _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CAE _ 39. C2
        jnz near      ?_164                                   ; 2cb0 _ 75, 0a
        mov     eax, dword [ebp+8H]                     ; 2CB2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2CB5 _ C7. 40, 08, 00000000
?_164:  mov     eax, dword [ebp+8H]                     ; 2CBC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CBF _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2CC2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CC5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2CC8 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2CCB _ 8B. 45, FC
?_165:  leave                                           ; 2CCE _ C9
        ret                                             ; 2CCF _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2CD0 _ 55
        mov     ebp, esp                                ; 2CD1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2CD3 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2CD6 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2CD9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CDC _ 8B. 40, 10
        sub     edx, eax                                ; 2CDF _ 29. C2
        mov     eax, edx                                ; 2CE1 _ 89. D0
        pop     ebp                                     ; 2CE3 _ 5D
        ret                                             ; 2CE4 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2CE5 _ 55
        mov     ebp, esp                                ; 2CE6 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2CE8 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_166                                   ; 2CEF _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2CF1 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2CF8 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2CFB _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2CFE _ 89. 45, 0C
?_166:  mov     eax, dword [ebp+0CH]                    ; 2D01 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2D04 _ 8B. 55, 08
        mov     word [edx], ax                          ; 2D07 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2D0A _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2D0D _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2D10 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2D14 _ 8B. 45, 10
        sar     eax, 16                                 ; 2D17 _ C1. F8, 10
        mov     dl, al                                  ; 2D1A _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D1C _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2D1F _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2D22 _ 8B. 45, 14
        mov     dl, al                                  ; 2D25 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D27 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2D2A _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2D2D _ 8B. 45, 0C
        shr     eax, 16                                 ; 2D30 _ C1. E8, 10
        and     eax, 0FH                                ; 2D33 _ 83. E0, 0F
        mov     dl, al                                  ; 2D36 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2D38 _ 8B. 45, 14
        sar     eax, 8                                  ; 2D3B _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2D3E _ 83. E0, F0
        or      eax, edx                                ; 2D41 _ 09. D0
        mov     dl, al                                  ; 2D43 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D45 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2D48 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2D4B _ 8B. 45, 10
        shr     eax, 24                                 ; 2D4E _ C1. E8, 18
        mov     dl, al                                  ; 2D51 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D53 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2D56 _ 88. 50, 07
        nop                                             ; 2D59 _ 90
        pop     ebp                                     ; 2D5A _ 5D
        ret                                             ; 2D5B _ C3
; set_segmdesc End of function

task_init:; Function begin
        push    ebp                                     ; 2D5C _ 55
        mov     ebp, esp                                ; 2D5D _ 89. E5
        push    ebx                                     ; 2D5F _ 53
        sub     esp, 20                                 ; 2D60 _ 83. EC, 14
        call    get_addr_gdt                            ; 2D63 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2D68 _ 89. 45, F0
        sub     esp, 8                                  ; 2D6B _ 83. EC, 08
        push    588                                     ; 2D6E _ 68, 0000024C
        push    dword [ebp+8H]                          ; 2D73 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2D76 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D7B _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2D7E _ A3, 000022C8(d)
        mov     dword [ebp-0CH], 0                      ; 2D83 _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 2D8A _ E9, 00000091

?_167:  mov     ecx, dword [taskctl]                    ; 2D8F _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2D95 _ 8B. 55, F4
        mov     eax, edx                                ; 2D98 _ 89. D0
        add     eax, eax                                ; 2D9A _ 01. C0
        add     eax, edx                                ; 2D9C _ 01. D0
        add     eax, eax                                ; 2D9E _ 01. C0
        add     eax, edx                                ; 2DA0 _ 01. D0
        shl     eax, 4                                  ; 2DA2 _ C1. E0, 04
        add     eax, ecx                                ; 2DA5 _ 01. C8
        add     eax, 32                                 ; 2DA7 _ 83. C0, 20
        mov     dword [eax], 0                          ; 2DAA _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2DB0 _ 8B. 45, F4
        add     eax, 7                                  ; 2DB3 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 2DB6 _ 8B. 1D, 000022C8(d)
        lea     ecx, [eax*8]                            ; 2DBC _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2DC3 _ 8B. 55, F4
        mov     eax, edx                                ; 2DC6 _ 89. D0
        add     eax, eax                                ; 2DC8 _ 01. C0
        add     eax, edx                                ; 2DCA _ 01. D0
        add     eax, eax                                ; 2DCC _ 01. C0
        add     eax, edx                                ; 2DCE _ 01. D0
        shl     eax, 4                                  ; 2DD0 _ C1. E0, 04
        add     eax, ebx                                ; 2DD3 _ 01. D8
        add     eax, 28                                 ; 2DD5 _ 83. C0, 1C
        mov     dword [eax], ecx                        ; 2DD8 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 2DDA _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2DE0 _ 8B. 55, F4
        mov     eax, edx                                ; 2DE3 _ 89. D0
        add     eax, eax                                ; 2DE5 _ 01. C0
        add     eax, edx                                ; 2DE7 _ 01. D0
        add     eax, eax                                ; 2DE9 _ 01. C0
        add     eax, edx                                ; 2DEB _ 01. D0
        shl     eax, 4                                  ; 2DED _ C1. E0, 04
        add     eax, 16                                 ; 2DF0 _ 83. C0, 10
        add     eax, ecx                                ; 2DF3 _ 01. C8
        add     eax, 20                                 ; 2DF5 _ 83. C0, 14
        mov     edx, eax                                ; 2DF8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2DFA _ 8B. 45, F4
        add     eax, 7                                  ; 2DFD _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 2E00 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E07 _ 8B. 45, F0
        add     eax, ecx                                ; 2E0A _ 01. C8
        push    137                                     ; 2E0C _ 68, 00000089
        push    edx                                     ; 2E11 _ 52
        push    103                                     ; 2E12 _ 6A, 67
        push    eax                                     ; 2E14 _ 50
        call    set_segmdesc                            ; 2E15 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E1A _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 2E1D _ FF. 45, F4
?_168:  cmp     dword [ebp-0CH], 4                      ; 2E20 _ 83. 7D, F4, 04
        jle near      ?_167                                   ; 2e24 _ 0f 8e, ffffff65
        call    task_alloc                              ; 2E2A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2E2F _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2E32 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 2E35 _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 2E3C _ A1, 000022C8(d)
        mov     dword [eax], 1                          ; 2E41 _ C7. 00, 00000001
        mov     eax, dword [taskctl]                    ; 2E47 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 2E4C _ C7. 40, 04, 00000000
        mov     eax, dword [taskctl]                    ; 2E53 _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 2E58 _ 8B. 55, EC
        mov     dword [eax+8H], edx                     ; 2E5B _ 89. 50, 08
        mov     eax, dword [ebp-14H]                    ; 2E5E _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 2E61 _ 8B. 00
        sub     esp, 12                                 ; 2E63 _ 83. EC, 0C
        push    eax                                     ; 2E66 _ 50
        call    load_tr                                 ; 2E67 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E6C _ 83. C4, 10
        call    timer_alloc                             ; 2E6F _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 2E74 _ A3, 000022C4(d)
        mov     eax, dword [task_timer]                 ; 2E79 _ A1, 000022C4(d)
        sub     esp, 8                                  ; 2E7E _ 83. EC, 08
        push    100                                     ; 2E81 _ 6A, 64
        push    eax                                     ; 2E83 _ 50
        call    timer_settime                           ; 2E84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E89 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 2E8C _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 2E8F _ 8B. 5D, FC
        leave                                           ; 2E92 _ C9
        ret                                             ; 2E93 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 2E94 _ 55
        mov     ebp, esp                                ; 2E95 _ 89. E5
        sub     esp, 16                                 ; 2E97 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2E9A _ C7. 45, FC, 00000000
        jmp     ?_171                                   ; 2EA1 _ E9, 000000F3

?_169:  mov     ecx, dword [taskctl]                    ; 2EA6 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 2EAC _ 8B. 55, FC
        mov     eax, edx                                ; 2EAF _ 89. D0
        add     eax, eax                                ; 2EB1 _ 01. C0
        add     eax, edx                                ; 2EB3 _ 01. D0
        add     eax, eax                                ; 2EB5 _ 01. C0
        add     eax, edx                                ; 2EB7 _ 01. D0
        shl     eax, 4                                  ; 2EB9 _ C1. E0, 04
        add     eax, ecx                                ; 2EBC _ 01. C8
        add     eax, 32                                 ; 2EBE _ 83. C0, 20
        mov     eax, dword [eax]                        ; 2EC1 _ 8B. 00
        test    eax, eax                                ; 2EC3 _ 85. C0
        jne near      ?_170                                   ; 2ec5 _ 0f 85, 000000cb
        mov     ecx, dword [taskctl]                    ; 2ECB _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 2ED1 _ 8B. 55, FC
        mov     eax, edx                                ; 2ED4 _ 89. D0
        add     eax, eax                                ; 2ED6 _ 01. C0
        add     eax, edx                                ; 2ED8 _ 01. D0
        add     eax, eax                                ; 2EDA _ 01. C0
        add     eax, edx                                ; 2EDC _ 01. D0
        shl     eax, 4                                  ; 2EDE _ C1. E0, 04
        add     eax, 16                                 ; 2EE1 _ 83. C0, 10
        add     eax, ecx                                ; 2EE4 _ 01. C8
        add     eax, 12                                 ; 2EE6 _ 83. C0, 0C
        mov     dword [ebp-8H], eax                     ; 2EE9 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 2EEC _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 2EEF _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 2EF6 _ 8B. 45, F8
        mov     dword [eax+2CH], 514                    ; 2EF9 _ C7. 40, 2C, 00000202
        mov     eax, dword [ebp-8H]                     ; 2F00 _ 8B. 45, F8
        mov     dword [eax+30H], 0                      ; 2F03 _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F0A _ 8B. 45, F8
        mov     dword [eax+34H], 0                      ; 2F0D _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F14 _ 8B. 45, F8
        mov     dword [eax+38H], 0                      ; 2F17 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F1E _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 2F21 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F28 _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 2F2B _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-4H]                     ; 2F32 _ 8B. 45, FC
        inc     eax                                     ; 2F35 _ 40
        shl     eax, 9                                  ; 2F36 _ C1. E0, 09
        mov     edx, eax                                ; 2F39 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2F3B _ 8B. 45, F8
        mov     dword [eax+40H], edx                    ; 2F3E _ 89. 50, 40
        mov     eax, dword [ebp-8H]                     ; 2F41 _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 2F44 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F4B _ 8B. 45, F8
        mov     dword [eax+4CH], 0                      ; 2F4E _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F55 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 2F58 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F5F _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 2F62 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F69 _ 8B. 45, F8
        mov     dword [eax+60H], 0                      ; 2F6C _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F73 _ 8B. 45, F8
        mov     dword [eax+64H], 0                      ; 2F76 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F7D _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 2F80 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F87 _ 8B. 45, F8
        mov     dword [eax+6CH], 1073741824             ; 2F8A _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-8H]                     ; 2F91 _ 8B. 45, F8
        jmp     ?_172                                   ; 2F94 _ EB, 12

?_170:  inc     dword [ebp-4H]                          ; 2F96 _ FF. 45, FC
?_171:  cmp     dword [ebp-4H], 4                       ; 2F99 _ 83. 7D, FC, 04
        jle near      ?_169                                   ; 2f9d _ 0f 8e, ffffff03
        mov     eax, 0                                  ; 2FA3 _ B8, 00000000
?_172:  leave                                           ; 2FA8 _ C9
        ret                                             ; 2FA9 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 2FAA _ 55
        mov     ebp, esp                                ; 2FAB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2FAD _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2FB0 _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 2FB7 _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 2FBC _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx]                        ; 2FC2 _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 2FC4 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 2FC7 _ 89. 4C 90, 08
        mov     eax, dword [taskctl]                    ; 2FCB _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 2FD0 _ 8B. 10
        inc     edx                                     ; 2FD2 _ 42
        mov     dword [eax], edx                        ; 2FD3 _ 89. 10
        nop                                             ; 2FD5 _ 90
        pop     ebp                                     ; 2FD6 _ 5D
        ret                                             ; 2FD7 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 2FD8 _ 55
        mov     ebp, esp                                ; 2FD9 _ 89. E5
        sub     esp, 8                                  ; 2FDB _ 83. EC, 08
        mov     eax, dword [task_timer]                 ; 2FDE _ A1, 000022C4(d)
        sub     esp, 8                                  ; 2FE3 _ 83. EC, 08
        push    100                                     ; 2FE6 _ 6A, 64
        push    eax                                     ; 2FE8 _ 50
        call    timer_settime                           ; 2FE9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2FEE _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 2FF1 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 2FF6 _ 8B. 00
        cmp     eax, 1                                  ; 2FF8 _ 83. F8, 01
        jle near      ?_174                                   ; 2ffb _ 7e, 4e
        mov     eax, dword [taskctl]                    ; 2FFD _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 3002 _ 8B. 50, 04
        inc     edx                                     ; 3005 _ 42
        mov     dword [eax+4H], edx                     ; 3006 _ 89. 50, 04
        mov     eax, dword [taskctl]                    ; 3009 _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 300E _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 3011 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 3016 _ 8B. 00
        cmp     edx, eax                                ; 3018 _ 39. C2
        jnz near      ?_173                                   ; 301a _ 75, 0c
        mov     eax, dword [taskctl]                    ; 301C _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 3021 _ C7. 40, 04, 00000000
?_173:  mov     eax, dword [taskctl]                    ; 3028 _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 302D _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 3033 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3036 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 303A _ 8B. 00
        sub     esp, 8                                  ; 303C _ 83. EC, 08
        push    eax                                     ; 303F _ 50
        push    0                                       ; 3040 _ 6A, 00
        call    farjmp                                  ; 3042 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3047 _ 83. C4, 10
        nop                                             ; 304A _ 90
?_174:  nop                                             ; 304B _ 90
        leave                                           ; 304C _ C9
        ret                                             ; 304D _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 304E _ 55
        mov     ebp, esp                                ; 304F _ 89. E5
        sub     esp, 24                                 ; 3051 _ 83. EC, 18
        mov     byte [ebp-0DH], 0                       ; 3054 _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 3058 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 305B _ 8B. 40, 04
        cmp     eax, 2                                  ; 305E _ 83. F8, 02
        jne near      ?_183                                   ; 3061 _ 0f 85, 000000e9
        mov     eax, dword [taskctl]                    ; 3067 _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 306C _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 3072 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 3075 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 3079 _ 39. 45, 08
        jnz near      ?_175                                   ; 307c _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 307E _ C6. 45, F3, 01
?_175:  mov     dword [ebp-0CH], 0                      ; 3082 _ C7. 45, F4, 00000000
        jmp     ?_177                                   ; 3089 _ EB, 14

?_176:  mov     eax, dword [taskctl]                    ; 308B _ A1, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 3090 _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3093 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 3097 _ 39. 45, 08
        jz near       ?_178                                   ; 309a _ 74, 11
        inc     dword [ebp-0CH]                         ; 309C _ FF. 45, F4
?_177:  mov     eax, dword [taskctl]                    ; 309F _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 30A4 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 30A6 _ 39. 45, F4
        jl      ?_176                                   ; 30A9 _ 7C, E0
        jmp     ?_179                                   ; 30AB _ EB, 01

?_178:  nop                                             ; 30AD _ 90
?_179:  mov     eax, dword [taskctl]                    ; 30AE _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 30B3 _ 8B. 10
        dec     edx                                     ; 30B5 _ 4A
        mov     dword [eax], edx                        ; 30B6 _ 89. 10
        mov     eax, dword [taskctl]                    ; 30B8 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 30BD _ 8B. 40, 04
        cmp     dword [ebp-0CH], eax                    ; 30C0 _ 39. 45, F4
        jge near      ?_181                                   ; 30c3 _ 7d, 2d
        mov     eax, dword [taskctl]                    ; 30C5 _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 30CA _ 8B. 50, 04
        dec     edx                                     ; 30CD _ 4A
        mov     dword [eax+4H], edx                     ; 30CE _ 89. 50, 04
        jmp     ?_181                                   ; 30D1 _ EB, 1F

?_180:  mov     edx, dword [taskctl]                    ; 30D3 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-0CH]                    ; 30D9 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 30DC _ 8D. 48, 01
        mov     eax, dword [taskctl]                    ; 30DF _ A1, 000022C8(d)
        mov     ecx, dword [edx+ecx*4+8H]               ; 30E4 _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 30E8 _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 30EB _ 89. 4C 90, 08
        inc     dword [ebp-0CH]                         ; 30EF _ FF. 45, F4
?_181:  mov     eax, dword [taskctl]                    ; 30F2 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 30F7 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 30F9 _ 39. 45, F4
        jl      ?_180                                   ; 30FC _ 7C, D5
        mov     eax, dword [ebp+8H]                     ; 30FE _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3101 _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 3108 _ 80. 7D, F3, 00
        jz near       ?_183                                   ; 310c _ 74, 42
        mov     eax, dword [taskctl]                    ; 310E _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 3113 _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 3116 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 311B _ 8B. 00
        cmp     edx, eax                                ; 311D _ 39. C2
        jl      ?_182                                   ; 311F _ 7C, 0C
        mov     eax, dword [taskctl]                    ; 3121 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 3126 _ C7. 40, 04, 00000000
?_182:  mov     eax, dword [taskctl]                    ; 312D _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 3132 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 3138 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 313B _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 313F _ 8B. 00
        sub     esp, 8                                  ; 3141 _ 83. EC, 08
        push    eax                                     ; 3144 _ 50
        push    0                                       ; 3145 _ 6A, 00
        call    farjmp                                  ; 3147 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 314C _ 83. C4, 10
        nop                                             ; 314F _ 90
?_183:  nop                                             ; 3150 _ 90
        leave                                           ; 3151 _ C9
        ret                                             ; 3152 _ C3
; task_sleep End of function



?_184:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_185:                                                  ; byte
        db 41H, 00H                                     ; 0008 _ A.

?_186:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 000A _ 3[sec].

?_187:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_188:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_189:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_190:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_191:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_192:                                                  ; byte
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

?_193:  db 00H                                          ; 0076 _ .

?_194:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1910:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1957:                                            ; byte
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

closebtn.2067:                                          ; byte
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

?_195:                                                  ; dword
        resb    2                                       ; 0004

?_196:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_197:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_198:  resd    1                                       ; 00EC

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

task_a.1843:                                            ; dword
        resd    1                                       ; 0264

task_b.1827:                                            ; byte
        resd    6                                       ; 0268

tss_a.1842:                                             ; byte
        resb    128                                     ; 0280

tss_b.1841:                                             ; byte
        resb    104                                     ; 0300

str.2005:                                               ; byte
        resb    1                                       ; 0368

?_199:  resb    9                                       ; 0369

?_200:  resb    14                                      ; 0372

timerctl:                                               ; byte
        resd    1                                       ; 0380

?_201:                                                  ; byte
        resb    4                                       ; 0384

?_202:                                                  ; byte
        resb    4                                       ; 0388

?_203:                                                  ; byte
        resb    4                                       ; 038C

?_204:                                                  ; byte
        resb    7988                                    ; 0390

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


