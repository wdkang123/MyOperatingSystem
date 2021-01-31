; Disassembly of file: write_vga_desktop.o
; Thu Nov  3 13:36:50 2016
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386



CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 48                                 ; 0005 _ 83. EC, 30
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000100(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000100(d)
        mov     dword [ebp-20H], eax                    ; 001D _ 89. 45, E0
        movzx   eax, word [?_070]                       ; 0020 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0027 _ 98
        mov     dword [xsize], eax                      ; 0028 _ A3, 00000218(d)
        movzx   eax, word [?_071]                       ; 002D _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0034 _ 98
        mov     dword [ysize], eax                      ; 0035 _ A3, 0000021C(d)
        sub     esp, 4                                  ; 003A _ 83. EC, 04
        push    keybuf                                  ; 003D _ 68, 00000140(d)
        push    32                                      ; 0042 _ 6A, 20
        push    keyinfo                                 ; 0044 _ 68, 00000108(d)
        call    fifo8_init                              ; 0049 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004E _ 83. C4, 10
        sub     esp, 4                                  ; 0051 _ 83. EC, 04
        push    mousebuf                                ; 0054 _ 68, 00000180(d)
        push    128                                     ; 0059 _ 68, 00000080
        push    mouseinfo                               ; 005E _ 68, 00000120(d)
        call    fifo8_init                              ; 0063 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0068 _ 83. C4, 10
        call    init_palette                            ; 006B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0070 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ysize]                      ; 0075 _ A1, 0000021C(d)
        lea     ecx, [eax-1DH]                          ; 007A _ 8D. 48, E3
        mov     eax, dword [xsize]                      ; 007D _ A1, 00000218(d)
        lea     edx, [eax-1H]                           ; 0082 _ 8D. 50, FF
        mov     eax, dword [xsize]                      ; 0085 _ A1, 00000218(d)
        sub     esp, 4                                  ; 008A _ 83. EC, 04
        push    ecx                                     ; 008D _ 51
        push    edx                                     ; 008E _ 52
        push    0                                       ; 008F _ 6A, 00
        push    0                                       ; 0091 _ 6A, 00
        push    14                                      ; 0093 _ 6A, 0E
        push    eax                                     ; 0095 _ 50
        push    dword [ebp-20H]                         ; 0096 _ FF. 75, E0
        call    boxfill8                                ; 0099 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 009E _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00A1 _ A1, 0000021C(d)
        lea     ebx, [eax-1CH]                          ; 00A6 _ 8D. 58, E4
        mov     eax, dword [xsize]                      ; 00A9 _ A1, 00000218(d)
        lea     ecx, [eax-1H]                           ; 00AE _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 00B1 _ A1, 0000021C(d)
        lea     edx, [eax-1CH]                          ; 00B6 _ 8D. 50, E4
        mov     eax, dword [xsize]                      ; 00B9 _ A1, 00000218(d)
        sub     esp, 4                                  ; 00BE _ 83. EC, 04
        push    ebx                                     ; 00C1 _ 53
        push    ecx                                     ; 00C2 _ 51
        push    edx                                     ; 00C3 _ 52
        push    0                                       ; 00C4 _ 6A, 00
        push    8                                       ; 00C6 _ 6A, 08
        push    eax                                     ; 00C8 _ 50
        push    dword [ebp-20H]                         ; 00C9 _ FF. 75, E0
        call    boxfill8                                ; 00CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00D1 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00D4 _ A1, 0000021C(d)
        lea     ebx, [eax-1BH]                          ; 00D9 _ 8D. 58, E5
        mov     eax, dword [xsize]                      ; 00DC _ A1, 00000218(d)
        lea     ecx, [eax-1H]                           ; 00E1 _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 00E4 _ A1, 0000021C(d)
        lea     edx, [eax-1BH]                          ; 00E9 _ 8D. 50, E5
        mov     eax, dword [xsize]                      ; 00EC _ A1, 00000218(d)
        sub     esp, 4                                  ; 00F1 _ 83. EC, 04
        push    ebx                                     ; 00F4 _ 53
        push    ecx                                     ; 00F5 _ 51
        push    edx                                     ; 00F6 _ 52
        push    0                                       ; 00F7 _ 6A, 00
        push    7                                       ; 00F9 _ 6A, 07
        push    eax                                     ; 00FB _ 50
        push    dword [ebp-20H]                         ; 00FC _ FF. 75, E0
        call    boxfill8                                ; 00FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0104 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0107 _ A1, 0000021C(d)
        lea     ebx, [eax-1H]                           ; 010C _ 8D. 58, FF
        mov     eax, dword [xsize]                      ; 010F _ A1, 00000218(d)
        lea     ecx, [eax-1H]                           ; 0114 _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 0117 _ A1, 0000021C(d)
        lea     edx, [eax-1AH]                          ; 011C _ 8D. 50, E6
        mov     eax, dword [xsize]                      ; 011F _ A1, 00000218(d)
        sub     esp, 4                                  ; 0124 _ 83. EC, 04
        push    ebx                                     ; 0127 _ 53
        push    ecx                                     ; 0128 _ 51
        push    edx                                     ; 0129 _ 52
        push    0                                       ; 012A _ 6A, 00
        push    8                                       ; 012C _ 6A, 08
        push    eax                                     ; 012E _ 50
        push    dword [ebp-20H]                         ; 012F _ FF. 75, E0
        call    boxfill8                                ; 0132 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0137 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 013A _ A1, 0000021C(d)
        lea     ecx, [eax-18H]                          ; 013F _ 8D. 48, E8
        mov     eax, dword [ysize]                      ; 0142 _ A1, 0000021C(d)
        lea     edx, [eax-18H]                          ; 0147 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 014A _ A1, 00000218(d)
        sub     esp, 4                                  ; 014F _ 83. EC, 04
        push    ecx                                     ; 0152 _ 51
        push    59                                      ; 0153 _ 6A, 3B
        push    edx                                     ; 0155 _ 52
        push    3                                       ; 0156 _ 6A, 03
        push    7                                       ; 0158 _ 6A, 07
        push    eax                                     ; 015A _ 50
        push    dword [ebp-20H]                         ; 015B _ FF. 75, E0
        call    boxfill8                                ; 015E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0163 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0166 _ A1, 0000021C(d)
        lea     ecx, [eax-4H]                           ; 016B _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 016E _ A1, 0000021C(d)
        lea     edx, [eax-18H]                          ; 0173 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0176 _ A1, 00000218(d)
        sub     esp, 4                                  ; 017B _ 83. EC, 04
        push    ecx                                     ; 017E _ 51
        push    2                                       ; 017F _ 6A, 02
        push    edx                                     ; 0181 _ 52
        push    2                                       ; 0182 _ 6A, 02
        push    7                                       ; 0184 _ 6A, 07
        push    eax                                     ; 0186 _ 50
        push    dword [ebp-20H]                         ; 0187 _ FF. 75, E0
        call    boxfill8                                ; 018A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 018F _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0192 _ A1, 0000021C(d)
        lea     ecx, [eax-4H]                           ; 0197 _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 019A _ A1, 0000021C(d)
        lea     edx, [eax-4H]                           ; 019F _ 8D. 50, FC
        mov     eax, dword [xsize]                      ; 01A2 _ A1, 00000218(d)
        sub     esp, 4                                  ; 01A7 _ 83. EC, 04
        push    ecx                                     ; 01AA _ 51
        push    59                                      ; 01AB _ 6A, 3B
        push    edx                                     ; 01AD _ 52
        push    3                                       ; 01AE _ 6A, 03
        push    15                                      ; 01B0 _ 6A, 0F
        push    eax                                     ; 01B2 _ 50
        push    dword [ebp-20H]                         ; 01B3 _ FF. 75, E0
        call    boxfill8                                ; 01B6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01BB _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01BE _ A1, 0000021C(d)
        lea     ecx, [eax-5H]                           ; 01C3 _ 8D. 48, FB
        mov     eax, dword [ysize]                      ; 01C6 _ A1, 0000021C(d)
        lea     edx, [eax-17H]                          ; 01CB _ 8D. 50, E9
        mov     eax, dword [xsize]                      ; 01CE _ A1, 00000218(d)
        sub     esp, 4                                  ; 01D3 _ 83. EC, 04
        push    ecx                                     ; 01D6 _ 51
        push    59                                      ; 01D7 _ 6A, 3B
        push    edx                                     ; 01D9 _ 52
        push    59                                      ; 01DA _ 6A, 3B
        push    15                                      ; 01DC _ 6A, 0F
        push    eax                                     ; 01DE _ 50
        push    dword [ebp-20H]                         ; 01DF _ FF. 75, E0
        call    boxfill8                                ; 01E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E7 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01EA _ A1, 0000021C(d)
        lea     ecx, [eax-3H]                           ; 01EF _ 8D. 48, FD
        mov     eax, dword [ysize]                      ; 01F2 _ A1, 0000021C(d)
        lea     edx, [eax-3H]                           ; 01F7 _ 8D. 50, FD
        mov     eax, dword [xsize]                      ; 01FA _ A1, 00000218(d)
        sub     esp, 4                                  ; 01FF _ 83. EC, 04
        push    ecx                                     ; 0202 _ 51
        push    59                                      ; 0203 _ 6A, 3B
        push    edx                                     ; 0205 _ 52
        push    2                                       ; 0206 _ 6A, 02
        push    0                                       ; 0208 _ 6A, 00
        push    eax                                     ; 020A _ 50
        push    dword [ebp-20H]                         ; 020B _ FF. 75, E0
        call    boxfill8                                ; 020E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0213 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0216 _ A1, 0000021C(d)
        lea     ecx, [eax-3H]                           ; 021B _ 8D. 48, FD
        mov     eax, dword [ysize]                      ; 021E _ A1, 0000021C(d)
        lea     edx, [eax-18H]                          ; 0223 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0226 _ A1, 00000218(d)
        sub     esp, 4                                  ; 022B _ 83. EC, 04
        push    ecx                                     ; 022E _ 51
        push    60                                      ; 022F _ 6A, 3C
        push    edx                                     ; 0231 _ 52
        push    60                                      ; 0232 _ 6A, 3C
        push    0                                       ; 0234 _ 6A, 00
        push    eax                                     ; 0236 _ 50
        push    dword [ebp-20H]                         ; 0237 _ FF. 75, E0
        call    boxfill8                                ; 023A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 023F _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0242 _ A1, 0000021C(d)
        lea     esi, [eax-18H]                          ; 0247 _ 8D. 70, E8
        mov     eax, dword [xsize]                      ; 024A _ A1, 00000218(d)
        lea     ebx, [eax-4H]                           ; 024F _ 8D. 58, FC
        mov     eax, dword [ysize]                      ; 0252 _ A1, 0000021C(d)
        lea     ecx, [eax-18H]                          ; 0257 _ 8D. 48, E8
        mov     eax, dword [xsize]                      ; 025A _ A1, 00000218(d)
        lea     edx, [eax-2FH]                          ; 025F _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 0262 _ A1, 00000218(d)
        sub     esp, 4                                  ; 0267 _ 83. EC, 04
        push    esi                                     ; 026A _ 56
        push    ebx                                     ; 026B _ 53
        push    ecx                                     ; 026C _ 51
        push    edx                                     ; 026D _ 52
        push    15                                      ; 026E _ 6A, 0F
        push    eax                                     ; 0270 _ 50
        push    dword [ebp-20H]                         ; 0271 _ FF. 75, E0
        call    boxfill8                                ; 0274 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0279 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 027C _ A1, 0000021C(d)
        lea     esi, [eax-4H]                           ; 0281 _ 8D. 70, FC
        mov     eax, dword [xsize]                      ; 0284 _ A1, 00000218(d)
        lea     ebx, [eax-2FH]                          ; 0289 _ 8D. 58, D1
        mov     eax, dword [ysize]                      ; 028C _ A1, 0000021C(d)
        lea     ecx, [eax-17H]                          ; 0291 _ 8D. 48, E9
        mov     eax, dword [xsize]                      ; 0294 _ A1, 00000218(d)
        lea     edx, [eax-2FH]                          ; 0299 _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 029C _ A1, 00000218(d)
        sub     esp, 4                                  ; 02A1 _ 83. EC, 04
        push    esi                                     ; 02A4 _ 56
        push    ebx                                     ; 02A5 _ 53
        push    ecx                                     ; 02A6 _ 51
        push    edx                                     ; 02A7 _ 52
        push    15                                      ; 02A8 _ 6A, 0F
        push    eax                                     ; 02AA _ 50
        push    dword [ebp-20H]                         ; 02AB _ FF. 75, E0
        call    boxfill8                                ; 02AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B3 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 02B6 _ A1, 0000021C(d)
        lea     esi, [eax-3H]                           ; 02BB _ 8D. 70, FD
        mov     eax, dword [xsize]                      ; 02BE _ A1, 00000218(d)
        lea     ebx, [eax-4H]                           ; 02C3 _ 8D. 58, FC
        mov     eax, dword [ysize]                      ; 02C6 _ A1, 0000021C(d)
        lea     ecx, [eax-3H]                           ; 02CB _ 8D. 48, FD
        mov     eax, dword [xsize]                      ; 02CE _ A1, 00000218(d)
        lea     edx, [eax-2FH]                          ; 02D3 _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 02D6 _ A1, 00000218(d)
        sub     esp, 4                                  ; 02DB _ 83. EC, 04
        push    esi                                     ; 02DE _ 56
        push    ebx                                     ; 02DF _ 53
        push    ecx                                     ; 02E0 _ 51
        push    edx                                     ; 02E1 _ 52
        push    7                                       ; 02E2 _ 6A, 07
        push    eax                                     ; 02E4 _ 50
        push    dword [ebp-20H]                         ; 02E5 _ FF. 75, E0
        call    boxfill8                                ; 02E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02ED _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 02F0 _ A1, 0000021C(d)
        lea     esi, [eax-3H]                           ; 02F5 _ 8D. 70, FD
        mov     eax, dword [xsize]                      ; 02F8 _ A1, 00000218(d)
        lea     ebx, [eax-3H]                           ; 02FD _ 8D. 58, FD
        mov     eax, dword [ysize]                      ; 0300 _ A1, 0000021C(d)
        lea     ecx, [eax-18H]                          ; 0305 _ 8D. 48, E8
        mov     eax, dword [xsize]                      ; 0308 _ A1, 00000218(d)
        lea     edx, [eax-3H]                           ; 030D _ 8D. 50, FD
        mov     eax, dword [xsize]                      ; 0310 _ A1, 00000218(d)
        sub     esp, 4                                  ; 0315 _ 83. EC, 04
        push    esi                                     ; 0318 _ 56
        push    ebx                                     ; 0319 _ 53
        push    ecx                                     ; 031A _ 51
        push    edx                                     ; 031B _ 52
        push    7                                       ; 031C _ 6A, 07
        push    eax                                     ; 031E _ 50
        push    dword [ebp-20H]                         ; 031F _ FF. 75, E0
        call    boxfill8                                ; 0322 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0327 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 032A _ A1, 00000218(d)
        sub     eax, 16                                 ; 032F _ 83. E8, 10
        mov     edx, eax                                ; 0332 _ 89. C2
        shr     edx, 31                                 ; 0334 _ C1. EA, 1F
        add     eax, edx                                ; 0337 _ 01. D0
        sar     eax, 1                                  ; 0339 _ D1. F8
        mov     dword [mx], eax                         ; 033B _ A3, 00000210(d)
        mov     eax, dword [ysize]                      ; 0340 _ A1, 0000021C(d)
        sub     eax, 44                                 ; 0345 _ 83. E8, 2C
        mov     edx, eax                                ; 0348 _ 89. C2
        shr     edx, 31                                 ; 034A _ C1. EA, 1F
        add     eax, edx                                ; 034D _ 01. D0
        sar     eax, 1                                  ; 034F _ D1. F8
        mov     dword [my], eax                         ; 0351 _ A3, 00000214(d)
        sub     esp, 8                                  ; 0356 _ 83. EC, 08
        push    14                                      ; 0359 _ 6A, 0E
        push    mcursor                                 ; 035B _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 0360 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0365 _ 83. C4, 10
        mov     ecx, dword [my]                         ; 0368 _ 8B. 0D, 00000214(d)
        mov     edx, dword [mx]                         ; 036E _ 8B. 15, 00000210(d)
        mov     eax, dword [xsize]                      ; 0374 _ A1, 00000218(d)
        push    16                                      ; 0379 _ 6A, 10
        push    mcursor                                 ; 037B _ 68, 00000000(d)
        push    ecx                                     ; 0380 _ 51
        push    edx                                     ; 0381 _ 52
        push    16                                      ; 0382 _ 6A, 10
        push    16                                      ; 0384 _ 6A, 10
        push    eax                                     ; 0386 _ 50
        push    dword [ebp-20H]                         ; 0387 _ FF. 75, E0
        call    putblock                                ; 038A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 038F _ 83. C4, 20
        call    get_memory_block_count                  ; 0392 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0397 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 039A _ 8B. 45, E4
        sub     esp, 12                                 ; 039D _ 83. EC, 0C
        push    eax                                     ; 03A0 _ 50
        call    intToHexStr                             ; 03A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A6 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 03A9 _ 89. 45, E8
        call    get_adr_buffer                          ; 03AC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 03B1 _ 89. 45, EC
        mov     dword [ebp-28H], 0                      ; 03B4 _ C7. 45, D8, 00000000
        mov     dword [ebp-28H], 0                      ; 03BB _ C7. 45, D8, 00000000
        jmp     ?_002                                   ; 03C2 _ EB, 49

?_001:  mov     eax, dword [ebp-28H]                    ; 03C4 _ 8B. 45, D8
        add     eax, testData                           ; 03C7 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 03CC _ 0F B6. 00
        mov     byte [ebp-29H], al                      ; 03CF _ 88. 45, D7
        movsx   eax, byte [ebp-29H]                     ; 03D2 _ 0F BE. 45, D7
        sub     esp, 12                                 ; 03D6 _ 83. EC, 0C
        push    eax                                     ; 03D9 _ 50
        call    intToHexStr                             ; 03DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 03E2 _ 89. 45, F0
        mov     eax, dword [ebp-28H]                    ; 03E5 _ 8B. 45, D8
        shl     eax, 4                                  ; 03E8 _ C1. E0, 04
        mov     edx, eax                                ; 03EB _ 89. C2
        mov     eax, dword [xsize]                      ; 03ED _ A1, 00000218(d)
        sub     esp, 8                                  ; 03F2 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 03F5 _ FF. 75, F0
        push    7                                       ; 03F8 _ 6A, 07
        push    edx                                     ; 03FA _ 52
        push    0                                       ; 03FB _ 6A, 00
        push    eax                                     ; 03FD _ 50
        push    dword [ebp-20H]                         ; 03FE _ FF. 75, E0
        call    showString                              ; 0401 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0406 _ 83. C4, 20
        add     dword [ebp-28H], 1                      ; 0409 _ 83. 45, D8, 01
?_002:  cmp     dword [ebp-28H], 3                      ; 040D _ 83. 7D, D8, 03
        jle     ?_001                                   ; 0411 _ 7E, B1
        call    io_sti                                  ; 0413 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0418 _ 83. EC, 0C
        push    mdec                                    ; 041B _ 68, 00000200(d)
        call    enable_mouse                            ; 0420 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0425 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0428 _ C7. 45, F4, 00000000
        mov     dword [ebp-24H], 0                      ; 042F _ C7. 45, DC, 00000000
?_003:  call    io_cli                                  ; 0436 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 043B _ 83. EC, 0C
        push    keyinfo                                 ; 043E _ 68, 00000108(d)
        call    fifo8_status                            ; 0443 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0448 _ 83. C4, 10
        mov     ebx, eax                                ; 044B _ 89. C3
        sub     esp, 12                                 ; 044D _ 83. EC, 0C
        push    mouseinfo                               ; 0450 _ 68, 00000120(d)
        call    fifo8_status                            ; 0455 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 045A _ 83. C4, 10
        add     eax, ebx                                ; 045D _ 01. D8
        test    eax, eax                                ; 045F _ 85. C0
        jnz     ?_004                                   ; 0461 _ 75, 0A
        call    io_stihlt                               ; 0463 _ E8, FFFFFFFC(rel)
        jmp     ?_006                                   ; 0468 _ E9, 00000092

?_004:  sub     esp, 12                                 ; 046D _ 83. EC, 0C
        push    keyinfo                                 ; 0470 _ 68, 00000108(d)
        call    fifo8_status                            ; 0475 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 047A _ 83. C4, 10
        test    eax, eax                                ; 047D _ 85. C0
        jz      ?_005                                   ; 047F _ 74, 65
        call    io_sti                                  ; 0481 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0486 _ 83. EC, 0C
        push    keyinfo                                 ; 0489 _ 68, 00000108(d)
        call    fifo8_get                               ; 048E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0493 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0496 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 0499 _ 83. 7D, F4, 1C
        jnz     ?_006                                   ; 049D _ 75, 60
        mov     ecx, dword [xsize]                      ; 049F _ 8B. 0D, 00000218(d)
        mov     edx, dword [ebp-24H]                    ; 04A5 _ 8B. 55, DC
        mov     eax, edx                                ; 04A8 _ 89. D0
        shl     eax, 2                                  ; 04AA _ C1. E0, 02
        add     eax, edx                                ; 04AD _ 01. D0
        shl     eax, 2                                  ; 04AF _ C1. E0, 02
        mov     edx, eax                                ; 04B2 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 04B4 _ 8B. 45, EC
        add     eax, edx                                ; 04B7 _ 01. D0
        sub     esp, 12                                 ; 04B9 _ 83. EC, 0C
        push    7                                       ; 04BC _ 6A, 07
        push    ecx                                     ; 04BE _ 51
        push    dword [ebp-24H]                         ; 04BF _ FF. 75, DC
        push    dword [ebp-20H]                         ; 04C2 _ FF. 75, E0
        push    eax                                     ; 04C5 _ 50
        call    showMemoryInfo                          ; 04C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04CB _ 83. C4, 20
        add     dword [ebp-24H], 1                      ; 04CE _ 83. 45, DC, 01
        mov     eax, dword [ebp-24H]                    ; 04D2 _ 8B. 45, DC
        cmp     eax, dword [ebp-1CH]                    ; 04D5 _ 3B. 45, E4
        jle     ?_006                                   ; 04D8 _ 7E, 25
        mov     dword [ebp-24H], 0                      ; 04DA _ C7. 45, DC, 00000000
        jmp     ?_003                                   ; 04E1 _ E9, FFFFFF50

?_005:  sub     esp, 12                                 ; 04E6 _ 83. EC, 0C
        push    mouseinfo                               ; 04E9 _ 68, 00000120(d)
        call    fifo8_status                            ; 04EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04F3 _ 83. C4, 10
        test    eax, eax                                ; 04F6 _ 85. C0
        jz      ?_006                                   ; 04F8 _ 74, 05
        call    show_mouse_info                         ; 04FA _ E8, FFFFFFFC(rel)
?_006:  jmp     ?_003                                   ; 04FF _ E9, FFFFFF32
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0504 _ 55
        mov     ebp, esp                                ; 0505 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0507 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 050A _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 050D _ A1, 00000210(d)
        add     eax, edx                                ; 0512 _ 01. D0
        mov     dword [mx], eax                         ; 0514 _ A3, 00000210(d)
        mov     eax, dword [ebp+8H]                     ; 0519 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 051C _ 8B. 50, 08
        mov     eax, dword [my]                         ; 051F _ A1, 00000214(d)
        add     eax, edx                                ; 0524 _ 01. D0
        mov     dword [my], eax                         ; 0526 _ A3, 00000214(d)
        mov     eax, dword [mx]                         ; 052B _ A1, 00000210(d)
        test    eax, eax                                ; 0530 _ 85. C0
        jns     ?_007                                   ; 0532 _ 79, 0A
        mov     dword [mx], 0                           ; 0534 _ C7. 05, 00000210(d), 00000000
?_007:  mov     eax, dword [my]                         ; 053E _ A1, 00000214(d)
        test    eax, eax                                ; 0543 _ 85. C0
        jns     ?_008                                   ; 0545 _ 79, 0A
        mov     dword [my], 0                           ; 0547 _ C7. 05, 00000214(d), 00000000
?_008:  mov     eax, dword [xsize]                      ; 0551 _ A1, 00000218(d)
        lea     edx, [eax-10H]                          ; 0556 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 0559 _ A1, 00000210(d)
        cmp     edx, eax                                ; 055E _ 39. C2
        jge     ?_009                                   ; 0560 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 0562 _ A1, 00000218(d)
        sub     eax, 16                                 ; 0567 _ 83. E8, 10
        mov     dword [mx], eax                         ; 056A _ A3, 00000210(d)
?_009:  mov     eax, dword [ysize]                      ; 056F _ A1, 0000021C(d)
        lea     edx, [eax-10H]                          ; 0574 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 0577 _ A1, 00000214(d)
        cmp     edx, eax                                ; 057C _ 39. C2
        jge     ?_010                                   ; 057E _ 7D, 0D
        mov     eax, dword [ysize]                      ; 0580 _ A1, 0000021C(d)
        sub     eax, 16                                 ; 0585 _ 83. E8, 10
        mov     dword [my], eax                         ; 0588 _ A3, 00000214(d)
?_010:  pop     ebp                                     ; 058D _ 5D
        ret                                             ; 058E _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 058F _ 55
        mov     ebp, esp                                ; 0590 _ 89. E5
        push    esi                                     ; 0592 _ 56
        push    ebx                                     ; 0593 _ 53
        mov     eax, dword [my]                         ; 0594 _ A1, 00000214(d)
        lea     esi, [eax+0FH]                          ; 0599 _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 059C _ A1, 00000210(d)
        lea     ebx, [eax+0FH]                          ; 05A1 _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 05A4 _ 8B. 0D, 00000214(d)
        mov     edx, dword [mx]                         ; 05AA _ 8B. 15, 00000210(d)
        mov     eax, dword [xsize]                      ; 05B0 _ A1, 00000218(d)
        sub     esp, 4                                  ; 05B5 _ 83. EC, 04
        push    esi                                     ; 05B8 _ 56
        push    ebx                                     ; 05B9 _ 53
        push    ecx                                     ; 05BA _ 51
        push    edx                                     ; 05BB _ 52
        push    14                                      ; 05BC _ 6A, 0E
        push    eax                                     ; 05BE _ 50
        push    dword [ebp+8H]                          ; 05BF _ FF. 75, 08
        call    boxfill8                                ; 05C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05C7 _ 83. C4, 20
        lea     esp, [ebp-8H]                           ; 05CA _ 8D. 65, F8
        pop     ebx                                     ; 05CD _ 5B
        pop     esi                                     ; 05CE _ 5E
        pop     ebp                                     ; 05CF _ 5D
        ret                                             ; 05D0 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 05D1 _ 55
        mov     ebp, esp                                ; 05D2 _ 89. E5
        sub     esp, 8                                  ; 05D4 _ 83. EC, 08
        mov     ecx, dword [my]                         ; 05D7 _ 8B. 0D, 00000214(d)
        mov     edx, dword [mx]                         ; 05DD _ 8B. 15, 00000210(d)
        mov     eax, dword [xsize]                      ; 05E3 _ A1, 00000218(d)
        push    16                                      ; 05E8 _ 6A, 10
        push    mcursor                                 ; 05EA _ 68, 00000000(d)
        push    ecx                                     ; 05EF _ 51
        push    edx                                     ; 05F0 _ 52
        push    16                                      ; 05F1 _ 6A, 10
        push    16                                      ; 05F3 _ 6A, 10
        push    eax                                     ; 05F5 _ 50
        push    dword [ebp+8H]                          ; 05F6 _ FF. 75, 08
        call    putblock                                ; 05F9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05FE _ 83. C4, 20
        leave                                           ; 0601 _ C9
        ret                                             ; 0602 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0603 _ 55
        mov     ebp, esp                                ; 0604 _ 89. E5
        sub     esp, 24                                 ; 0606 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0609 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 060E _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0611 _ C6. 45, F3, 00
        call    io_sti                                  ; 0615 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 061A _ 83. EC, 0C
        push    mouseinfo                               ; 061D _ 68, 00000120(d)
        call    fifo8_get                               ; 0622 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0627 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 062A _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 062D _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0631 _ 83. EC, 08
        push    eax                                     ; 0634 _ 50
        push    mdec                                    ; 0635 _ 68, 00000200(d)
        call    mouse_decode                            ; 063A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 063F _ 83. C4, 10
        test    eax, eax                                ; 0642 _ 85. C0
        jz      ?_011                                   ; 0644 _ 74, 2C
        sub     esp, 12                                 ; 0646 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0649 _ FF. 75, F4
        call    eraseMouse                              ; 064C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0651 _ 83. C4, 10
        sub     esp, 12                                 ; 0654 _ 83. EC, 0C
        push    mdec                                    ; 0657 _ 68, 00000200(d)
        call    computeMousePosition                    ; 065C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0661 _ 83. C4, 10
        sub     esp, 12                                 ; 0664 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0667 _ FF. 75, F4
        call    drawMouse                               ; 066A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 066F _ 83. C4, 10
?_011:  leave                                           ; 0672 _ C9
        ret                                             ; 0673 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0674 _ 55
        mov     ebp, esp                                ; 0675 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0677 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 067A _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0680 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0683 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0689 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 068C _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0692 _ 5D
        ret                                             ; 0693 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0694 _ 55
        mov     ebp, esp                                ; 0695 _ 89. E5
        sub     esp, 24                                 ; 0697 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 069A _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 069D _ 88. 45, F4
        jmp     ?_013                                   ; 06A0 _ EB, 37

?_012:  mov     eax, dword [ebp+1CH]                    ; 06A2 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 06A5 _ 0F B6. 00
        movzx   eax, al                                 ; 06A8 _ 0F B6. C0
        shl     eax, 4                                  ; 06AB _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06AE _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06B4 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 06B8 _ 83. EC, 08
        push    edx                                     ; 06BB _ 52
        push    eax                                     ; 06BC _ 50
        push    dword [ebp+14H]                         ; 06BD _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06C0 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 06C3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06C6 _ FF. 75, 08
        call    showFont8                               ; 06C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06CE _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 06D1 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 06D5 _ 83. 45, 1C, 01
?_013:  mov     eax, dword [ebp+1CH]                    ; 06D9 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 06DC _ 0F B6. 00
        test    al, al                                  ; 06DF _ 84. C0
        jnz     ?_012                                   ; 06E1 _ 75, BF
        leave                                           ; 06E3 _ C9
        ret                                             ; 06E4 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 06E5 _ 55
        mov     ebp, esp                                ; 06E6 _ 89. E5
        sub     esp, 8                                  ; 06E8 _ 83. EC, 08
        sub     esp, 4                                  ; 06EB _ 83. EC, 04
        push    table_rgb.1572                          ; 06EE _ 68, 00000020(d)
        push    15                                      ; 06F3 _ 6A, 0F
        push    0                                       ; 06F5 _ 6A, 00
        call    set_palette                             ; 06F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06FC _ 83. C4, 10
        nop                                             ; 06FF _ 90
        leave                                           ; 0700 _ C9
        ret                                             ; 0701 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0702 _ 55
        mov     ebp, esp                                ; 0703 _ 89. E5
        sub     esp, 24                                 ; 0705 _ 83. EC, 18
        call    io_load_eflags                          ; 0708 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 070D _ 89. 45, F4
        call    io_cli                                  ; 0710 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0715 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0718 _ FF. 75, 08
        push    968                                     ; 071B _ 68, 000003C8
        call    io_out8                                 ; 0720 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0725 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0728 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 072B _ 89. 45, F0
        jmp     ?_015                                   ; 072E _ EB, 65

?_014:  mov     eax, dword [ebp+10H]                    ; 0730 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0733 _ 0F B6. 00
        shr     al, 2                                   ; 0736 _ C0. E8, 02
        movzx   eax, al                                 ; 0739 _ 0F B6. C0
        sub     esp, 8                                  ; 073C _ 83. EC, 08
        push    eax                                     ; 073F _ 50
        push    969                                     ; 0740 _ 68, 000003C9
        call    io_out8                                 ; 0745 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 074A _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 074D _ 8B. 45, 10
        add     eax, 1                                  ; 0750 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0753 _ 0F B6. 00
        shr     al, 2                                   ; 0756 _ C0. E8, 02
        movzx   eax, al                                 ; 0759 _ 0F B6. C0
        sub     esp, 8                                  ; 075C _ 83. EC, 08
        push    eax                                     ; 075F _ 50
        push    969                                     ; 0760 _ 68, 000003C9
        call    io_out8                                 ; 0765 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 076A _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 076D _ 8B. 45, 10
        add     eax, 2                                  ; 0770 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0773 _ 0F B6. 00
        shr     al, 2                                   ; 0776 _ C0. E8, 02
        movzx   eax, al                                 ; 0779 _ 0F B6. C0
        sub     esp, 8                                  ; 077C _ 83. EC, 08
        push    eax                                     ; 077F _ 50
        push    969                                     ; 0780 _ 68, 000003C9
        call    io_out8                                 ; 0785 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 078D _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0791 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 0795 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0798 _ 3B. 45, 0C
        jle     ?_014                                   ; 079B _ 7E, 93
        sub     esp, 12                                 ; 079D _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 07A0 _ FF. 75, F4
        call    io_store_eflags                         ; 07A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07A8 _ 83. C4, 10
        nop                                             ; 07AB _ 90
        leave                                           ; 07AC _ C9
        ret                                             ; 07AD _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07AE _ 55
        mov     ebp, esp                                ; 07AF _ 89. E5
        sub     esp, 20                                 ; 07B1 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07B4 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07B7 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07BA _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 07BD _ 89. 45, FC
        jmp     ?_019                                   ; 07C0 _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 07C2 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 07C5 _ 89. 45, F8
        jmp     ?_018                                   ; 07C8 _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 07CA _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 07CD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07D1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07D3 _ 8B. 45, F8
        add     eax, edx                                ; 07D6 _ 01. D0
        mov     edx, eax                                ; 07D8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07DA _ 8B. 45, 08
        add     edx, eax                                ; 07DD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07DF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07E3 _ 88. 02
        add     dword [ebp-8H], 1                       ; 07E5 _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 07E9 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 07EC _ 3B. 45, 1C
        jle     ?_017                                   ; 07EF _ 7E, D9
        add     dword [ebp-4H], 1                       ; 07F1 _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 07F5 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 07F8 _ 3B. 45, 20
        jle     ?_016                                   ; 07FB _ 7E, C5
        leave                                           ; 07FD _ C9
        ret                                             ; 07FE _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 07FF _ 55
        mov     ebp, esp                                ; 0800 _ 89. E5
        sub     esp, 20                                 ; 0802 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0805 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0808 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 080B _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0812 _ E9, 0000016C

?_020:  mov     edx, dword [ebp-4H]                     ; 0817 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 081A _ 8B. 45, 1C
        add     eax, edx                                ; 081D _ 01. D0
        movzx   eax, byte [eax]                         ; 081F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0822 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0825 _ 80. 7D, FB, 00
        jns     ?_021                                   ; 0829 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 082B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 082E _ 8B. 45, FC
        add     eax, edx                                ; 0831 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0833 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0837 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0839 _ 8B. 45, 10
        add     eax, edx                                ; 083C _ 01. D0
        mov     edx, eax                                ; 083E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0840 _ 8B. 45, 08
        add     edx, eax                                ; 0843 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0845 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0849 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 084B _ 0F BE. 45, FB
        and     eax, 40H                                ; 084F _ 83. E0, 40
        test    eax, eax                                ; 0852 _ 85. C0
        jz      ?_022                                   ; 0854 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0856 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0859 _ 8B. 45, FC
        add     eax, edx                                ; 085C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 085E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0862 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0864 _ 8B. 45, 10
        add     eax, edx                                ; 0867 _ 01. D0
        lea     edx, [eax+1H]                           ; 0869 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 086C _ 8B. 45, 08
        add     edx, eax                                ; 086F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0871 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0875 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0877 _ 0F BE. 45, FB
        and     eax, 20H                                ; 087B _ 83. E0, 20
        test    eax, eax                                ; 087E _ 85. C0
        jz      ?_023                                   ; 0880 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0882 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0885 _ 8B. 45, FC
        add     eax, edx                                ; 0888 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 088A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 088E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0890 _ 8B. 45, 10
        add     eax, edx                                ; 0893 _ 01. D0
        lea     edx, [eax+2H]                           ; 0895 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0898 _ 8B. 45, 08
        add     edx, eax                                ; 089B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 089D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08A1 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08A3 _ 0F BE. 45, FB
        and     eax, 10H                                ; 08A7 _ 83. E0, 10
        test    eax, eax                                ; 08AA _ 85. C0
        jz      ?_024                                   ; 08AC _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08AE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08B1 _ 8B. 45, FC
        add     eax, edx                                ; 08B4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08B6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08BA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08BC _ 8B. 45, 10
        add     eax, edx                                ; 08BF _ 01. D0
        lea     edx, [eax+3H]                           ; 08C1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08C4 _ 8B. 45, 08
        add     edx, eax                                ; 08C7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08C9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08CD _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 08CF _ 0F BE. 45, FB
        and     eax, 08H                                ; 08D3 _ 83. E0, 08
        test    eax, eax                                ; 08D6 _ 85. C0
        jz      ?_025                                   ; 08D8 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08DA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08DD _ 8B. 45, FC
        add     eax, edx                                ; 08E0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08E2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08E6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08E8 _ 8B. 45, 10
        add     eax, edx                                ; 08EB _ 01. D0
        lea     edx, [eax+4H]                           ; 08ED _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 08F0 _ 8B. 45, 08
        add     edx, eax                                ; 08F3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08F5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08F9 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 08FB _ 0F BE. 45, FB
        and     eax, 04H                                ; 08FF _ 83. E0, 04
        test    eax, eax                                ; 0902 _ 85. C0
        jz      ?_026                                   ; 0904 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0906 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0909 _ 8B. 45, FC
        add     eax, edx                                ; 090C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 090E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0912 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0914 _ 8B. 45, 10
        add     eax, edx                                ; 0917 _ 01. D0
        lea     edx, [eax+5H]                           ; 0919 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 091C _ 8B. 45, 08
        add     edx, eax                                ; 091F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0921 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0925 _ 88. 02
?_026:  movsx   eax, byte [ebp-5H]                      ; 0927 _ 0F BE. 45, FB
        and     eax, 02H                                ; 092B _ 83. E0, 02
        test    eax, eax                                ; 092E _ 85. C0
        jz      ?_027                                   ; 0930 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0932 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0935 _ 8B. 45, FC
        add     eax, edx                                ; 0938 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 093A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 093E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0940 _ 8B. 45, 10
        add     eax, edx                                ; 0943 _ 01. D0
        lea     edx, [eax+6H]                           ; 0945 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0948 _ 8B. 45, 08
        add     edx, eax                                ; 094B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 094D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0951 _ 88. 02
?_027:  movsx   eax, byte [ebp-5H]                      ; 0953 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0957 _ 83. E0, 01
        test    eax, eax                                ; 095A _ 85. C0
        jz      ?_028                                   ; 095C _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 095E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0961 _ 8B. 45, FC
        add     eax, edx                                ; 0964 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0966 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 096A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 096C _ 8B. 45, 10
        add     eax, edx                                ; 096F _ 01. D0
        lea     edx, [eax+7H]                           ; 0971 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0974 _ 8B. 45, 08
        add     edx, eax                                ; 0977 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0979 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 097D _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 097F _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 0983 _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 0987 _ 0F 8E, FFFFFE8A
        leave                                           ; 098D _ C9
        ret                                             ; 098E _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 098F _ 55
        mov     ebp, esp                                ; 0990 _ 89. E5
        sub     esp, 20                                 ; 0992 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0995 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0998 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 099B _ C7. 45, FC, 00000000
        jmp     ?_036                                   ; 09A2 _ E9, 000000B1

?_030:  mov     dword [ebp-8H], 0                       ; 09A7 _ C7. 45, F8, 00000000
        jmp     ?_035                                   ; 09AE _ E9, 00000097

?_031:  mov     eax, dword [ebp-4H]                     ; 09B3 _ 8B. 45, FC
        shl     eax, 4                                  ; 09B6 _ C1. E0, 04
        mov     edx, eax                                ; 09B9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09BB _ 8B. 45, F8
        add     eax, edx                                ; 09BE _ 01. D0
        add     eax, cursor.1619                        ; 09C0 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 09C5 _ 0F B6. 00
        cmp     al, 42                                  ; 09C8 _ 3C, 2A
        jnz     ?_032                                   ; 09CA _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 09CC _ 8B. 45, FC
        shl     eax, 4                                  ; 09CF _ C1. E0, 04
        mov     edx, eax                                ; 09D2 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09D4 _ 8B. 45, F8
        add     eax, edx                                ; 09D7 _ 01. D0
        mov     edx, eax                                ; 09D9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09DB _ 8B. 45, 08
        add     eax, edx                                ; 09DE _ 01. D0
        mov     byte [eax], 0                           ; 09E0 _ C6. 00, 00
?_032:  mov     eax, dword [ebp-4H]                     ; 09E3 _ 8B. 45, FC
        shl     eax, 4                                  ; 09E6 _ C1. E0, 04
        mov     edx, eax                                ; 09E9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09EB _ 8B. 45, F8
        add     eax, edx                                ; 09EE _ 01. D0
        add     eax, cursor.1619                        ; 09F0 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 09F5 _ 0F B6. 00
        cmp     al, 79                                  ; 09F8 _ 3C, 4F
        jnz     ?_033                                   ; 09FA _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 09FC _ 8B. 45, FC
        shl     eax, 4                                  ; 09FF _ C1. E0, 04
        mov     edx, eax                                ; 0A02 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A04 _ 8B. 45, F8
        add     eax, edx                                ; 0A07 _ 01. D0
        mov     edx, eax                                ; 0A09 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A0B _ 8B. 45, 08
        add     eax, edx                                ; 0A0E _ 01. D0
        mov     byte [eax], 7                           ; 0A10 _ C6. 00, 07
?_033:  mov     eax, dword [ebp-4H]                     ; 0A13 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A16 _ C1. E0, 04
        mov     edx, eax                                ; 0A19 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A1B _ 8B. 45, F8
        add     eax, edx                                ; 0A1E _ 01. D0
        add     eax, cursor.1619                        ; 0A20 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0A25 _ 0F B6. 00
        cmp     al, 46                                  ; 0A28 _ 3C, 2E
        jnz     ?_034                                   ; 0A2A _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0A2C _ 8B. 45, FC
        shl     eax, 4                                  ; 0A2F _ C1. E0, 04
        mov     edx, eax                                ; 0A32 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A34 _ 8B. 45, F8
        add     eax, edx                                ; 0A37 _ 01. D0
        mov     edx, eax                                ; 0A39 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A3B _ 8B. 45, 08
        add     edx, eax                                ; 0A3E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A40 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A44 _ 88. 02
?_034:  add     dword [ebp-8H], 1                       ; 0A46 _ 83. 45, F8, 01
?_035:  cmp     dword [ebp-8H], 15                      ; 0A4A _ 83. 7D, F8, 0F
        jle     ?_031                                   ; 0A4E _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0A54 _ 83. 45, FC, 01
?_036:  cmp     dword [ebp-4H], 15                      ; 0A58 _ 83. 7D, FC, 0F
        jle     ?_030                                   ; 0A5C _ 0F 8E, FFFFFF45
        leave                                           ; 0A62 _ C9
        ret                                             ; 0A63 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A64 _ 55
        mov     ebp, esp                                ; 0A65 _ 89. E5
        sub     esp, 16                                 ; 0A67 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0A6A _ C7. 45, FC, 00000000
        jmp     ?_040                                   ; 0A71 _ EB, 50

?_037:  mov     dword [ebp-8H], 0                       ; 0A73 _ C7. 45, F8, 00000000
        jmp     ?_039                                   ; 0A7A _ EB, 3B

?_038:  mov     edx, dword [ebp+1CH]                    ; 0A7C _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 0A7F _ 8B. 45, FC
        add     eax, edx                                ; 0A82 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A84 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 0A88 _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 0A8B _ 8B. 55, F8
        add     edx, ecx                                ; 0A8E _ 01. CA
        add     eax, edx                                ; 0A90 _ 01. D0
        mov     edx, eax                                ; 0A92 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
        add     edx, eax                                ; 0A97 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0A99 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0A9C _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0AA0 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0AA2 _ 8B. 45, F8
        add     eax, ecx                                ; 0AA5 _ 01. C8
        mov     ecx, eax                                ; 0AA7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0AA9 _ 8B. 45, 20
        add     eax, ecx                                ; 0AAC _ 01. C8
        movzx   eax, byte [eax]                         ; 0AAE _ 0F B6. 00
        mov     byte [edx], al                          ; 0AB1 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0AB3 _ 83. 45, F8, 01
?_039:  mov     eax, dword [ebp-8H]                     ; 0AB7 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0ABA _ 3B. 45, 10
        jl      ?_038                                   ; 0ABD _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0ABF _ 83. 45, FC, 01
?_040:  mov     eax, dword [ebp-4H]                     ; 0AC3 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0AC6 _ 3B. 45, 14
        jl      ?_037                                   ; 0AC9 _ 7C, A8
        leave                                           ; 0ACB _ C9
        ret                                             ; 0ACC _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0ACD _ 55
        mov     ebp, esp                                ; 0ACE _ 89. E5
        sub     esp, 24                                 ; 0AD0 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AD3 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 0AD8 _ 89. 45, EC
        movzx   eax, word [?_070]                       ; 0ADB _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0AE2 _ 98
        mov     dword [ebp-10H], eax                    ; 0AE3 _ 89. 45, F0
        movzx   eax, word [?_071]                       ; 0AE6 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0AED _ 98
        mov     dword [ebp-0CH], eax                    ; 0AEE _ 89. 45, F4
        sub     esp, 8                                  ; 0AF1 _ 83. EC, 08
        push    32                                      ; 0AF4 _ 6A, 20
        push    32                                      ; 0AF6 _ 6A, 20
        call    io_out8                                 ; 0AF8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AFD _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B00 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B04 _ 83. EC, 0C
        push    96                                      ; 0B07 _ 6A, 60
        call    io_in8                                  ; 0B09 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B0E _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B11 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B14 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B18 _ 83. EC, 08
        push    eax                                     ; 0B1B _ 50
        push    keyinfo                                 ; 0B1C _ 68, 00000108(d)
        call    fifo8_put                               ; 0B21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B26 _ 83. C4, 10
        nop                                             ; 0B29 _ 90
        leave                                           ; 0B2A _ C9
        ret                                             ; 0B2B _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B2C _ 55
        mov     ebp, esp                                ; 0B2D _ 89. E5
        sub     esp, 4                                  ; 0B2F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B32 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B35 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B38 _ 80. 7D, FC, 09
        jle     ?_041                                   ; 0B3C _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0B3E _ 0F B6. 45, FC
        add     eax, 55                                 ; 0B42 _ 83. C0, 37
        jmp     ?_042                                   ; 0B45 _ EB, 07

?_041:  movzx   eax, byte [ebp-4H]                      ; 0B47 _ 0F B6. 45, FC
        add     eax, 48                                 ; 0B4B _ 83. C0, 30
?_042:  leave                                           ; 0B4E _ C9
        ret                                             ; 0B4F _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B50 _ 55
        mov     ebp, esp                                ; 0B51 _ 89. E5
        sub     esp, 20                                 ; 0B53 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B59 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B5C _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0B63 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0B67 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B6A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B6D _ 0F BE. 45, FB
        push    eax                                     ; 0B71 _ 50
        call    charToHexVal                            ; 0B72 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B77 _ 83. C4, 04
        mov     byte [?_069], al                        ; 0B7A _ A2, 00000003(d)
        movzx   eax, byte [ebp-14H]                     ; 0B7F _ 0F B6. 45, EC
        shr     al, 4                                   ; 0B83 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B86 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B89 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0B8D _ 0F BE. C0
        push    eax                                     ; 0B90 _ 50
        call    charToHexVal                            ; 0B91 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B96 _ 83. C4, 04
        mov     byte [?_068], al                        ; 0B99 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0B9E _ B8, 00000000(d)
        leave                                           ; 0BA3 _ C9
        ret                                             ; 0BA4 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BA5 _ 55
        mov     ebp, esp                                ; 0BA6 _ 89. E5
        sub     esp, 16                                 ; 0BA8 _ 83. EC, 10
        mov     byte [str.1667], 48                     ; 0BAB _ C6. 05, 00000220(d), 30
        mov     byte [?_072], 88                        ; 0BB2 _ C6. 05, 00000221(d), 58
        mov     byte [?_073], 0                         ; 0BB9 _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0BC0 _ C7. 45, F4, 00000002
        jmp     ?_044                                   ; 0BC7 _ EB, 0F

?_043:  mov     eax, dword [ebp-0CH]                    ; 0BC9 _ 8B. 45, F4
        add     eax, str.1667                           ; 0BCC _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0BD1 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0BD4 _ 83. 45, F4, 01
?_044:  cmp     dword [ebp-0CH], 9                      ; 0BD8 _ 83. 7D, F4, 09
        jle     ?_043                                   ; 0BDC _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0BDE _ C7. 45, F8, 00000009
        jmp     ?_048                                   ; 0BE5 _ EB, 42

?_045:  mov     eax, dword [ebp+8H]                     ; 0BE7 _ 8B. 45, 08
        and     eax, 0FH                                ; 0BEA _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0BED _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BF0 _ 8B. 45, 08
        shr     eax, 4                                  ; 0BF3 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0BF6 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0BF9 _ 83. 7D, FC, 09
        jle     ?_046                                   ; 0BFD _ 7E, 14
        mov     eax, dword [ebp-4H]                     ; 0BFF _ 8B. 45, FC
        add     eax, 55                                 ; 0C02 _ 83. C0, 37
        mov     edx, eax                                ; 0C05 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C07 _ 8B. 45, F8
        add     eax, str.1667                           ; 0C0A _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C0F _ 88. 10
        jmp     ?_047                                   ; 0C11 _ EB, 12

?_046:  mov     eax, dword [ebp-4H]                     ; 0C13 _ 8B. 45, FC
        add     eax, 48                                 ; 0C16 _ 83. C0, 30
        mov     edx, eax                                ; 0C19 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C1B _ 8B. 45, F8
        add     eax, str.1667                           ; 0C1E _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C23 _ 88. 10
?_047:  sub     dword [ebp-8H], 1                       ; 0C25 _ 83. 6D, F8, 01
?_048:  cmp     dword [ebp-8H], 1                       ; 0C29 _ 83. 7D, F8, 01
        jle     ?_049                                   ; 0C2D _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0C2F _ 83. 7D, 08, 00
        jnz     ?_045                                   ; 0C33 _ 75, B2
?_049:  mov     eax, str.1667                           ; 0C35 _ B8, 00000220(d)
        leave                                           ; 0C3A _ C9
        ret                                             ; 0C3B _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C3C _ 55
        mov     ebp, esp                                ; 0C3D _ 89. E5
        sub     esp, 8                                  ; 0C3F _ 83. EC, 08
?_050:  sub     esp, 12                                 ; 0C42 _ 83. EC, 0C
        push    100                                     ; 0C45 _ 6A, 64
        call    io_in8                                  ; 0C47 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C4C _ 83. C4, 10
        and     eax, 02H                                ; 0C4F _ 83. E0, 02
        test    eax, eax                                ; 0C52 _ 85. C0
        jnz     ?_051                                   ; 0C54 _ 75, 02
        jmp     ?_052                                   ; 0C56 _ EB, 02

?_051:  jmp     ?_050                                   ; 0C58 _ EB, E8

?_052:  leave                                           ; 0C5A _ C9
        ret                                             ; 0C5B _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C5C _ 55
        mov     ebp, esp                                ; 0C5D _ 89. E5
        sub     esp, 8                                  ; 0C5F _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C62 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C67 _ 83. EC, 08
        push    96                                      ; 0C6A _ 6A, 60
        push    100                                     ; 0C6C _ 6A, 64
        call    io_out8                                 ; 0C6E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C73 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C76 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C7B _ 83. EC, 08
        push    71                                      ; 0C7E _ 6A, 47
        push    96                                      ; 0C80 _ 6A, 60
        call    io_out8                                 ; 0C82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C87 _ 83. C4, 10
        nop                                             ; 0C8A _ 90
        leave                                           ; 0C8B _ C9
        ret                                             ; 0C8C _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C8D _ 55
        mov     ebp, esp                                ; 0C8E _ 89. E5
        sub     esp, 8                                  ; 0C90 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C93 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C98 _ 83. EC, 08
        push    212                                     ; 0C9B _ 68, 000000D4
        push    100                                     ; 0CA0 _ 6A, 64
        call    io_out8                                 ; 0CA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA7 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CAA _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CAF _ 83. EC, 08
        push    244                                     ; 0CB2 _ 68, 000000F4
        push    96                                      ; 0CB7 _ 6A, 60
        call    io_out8                                 ; 0CB9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CBE _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CC1 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CC4 _ C6. 40, 03, 00
        nop                                             ; 0CC8 _ 90
        leave                                           ; 0CC9 _ C9
        ret                                             ; 0CCA _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CCB _ 55
        mov     ebp, esp                                ; 0CCC _ 89. E5
        sub     esp, 24                                 ; 0CCE _ 83. EC, 18
        sub     esp, 8                                  ; 0CD1 _ 83. EC, 08
        push    32                                      ; 0CD4 _ 6A, 20
        push    160                                     ; 0CD6 _ 68, 000000A0
        call    io_out8                                 ; 0CDB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CE0 _ 83. C4, 10
        sub     esp, 8                                  ; 0CE3 _ 83. EC, 08
        push    32                                      ; 0CE6 _ 6A, 20
        push    32                                      ; 0CE8 _ 6A, 20
        call    io_out8                                 ; 0CEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEF _ 83. C4, 10
        sub     esp, 12                                 ; 0CF2 _ 83. EC, 0C
        push    96                                      ; 0CF5 _ 6A, 60
        call    io_in8                                  ; 0CF7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CFC _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0CFF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D02 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D06 _ 83. EC, 08
        push    eax                                     ; 0D09 _ 50
        push    mouseinfo                               ; 0D0A _ 68, 00000120(d)
        call    fifo8_put                               ; 0D0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D14 _ 83. C4, 10
        leave                                           ; 0D17 _ C9
        ret                                             ; 0D18 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D19 _ 55
        mov     ebp, esp                                ; 0D1A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D1C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D1F _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D22 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D25 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D28 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D2B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D2D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D30 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D33 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D36 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D39 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D40 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D43 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D4A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D4D _ C7. 40, 08, 00000000
        nop                                             ; 0D54 _ 90
        pop     ebp                                     ; 0D55 _ 5D
        ret                                             ; 0D56 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D57 _ 55
        mov     ebp, esp                                ; 0D58 _ 89. E5
        sub     esp, 4                                  ; 0D5A _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D5D _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D60 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D63 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D66 _ 8B. 40, 10
        test    eax, eax                                ; 0D69 _ 85. C0
        jnz     ?_053                                   ; 0D6B _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D6D _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D70 _ 8B. 40, 14
        or      eax, 01H                                ; 0D73 _ 83. C8, 01
        mov     edx, eax                                ; 0D76 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D7B _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D7E _ B8, FFFFFFFF
        jmp     ?_055                                   ; 0D83 _ EB, 50

?_053:  mov     eax, dword [ebp+8H]                     ; 0D85 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D88 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D8A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D8D _ 8B. 40, 04
        add     edx, eax                                ; 0D90 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0D92 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0D96 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D98 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D9B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D9E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DA1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DA4 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DA7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DAA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DAD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DB0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DB3 _ 39. C2
        jnz     ?_054                                   ; 0DB5 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DB7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DBA _ C7. 40, 04, 00000000
?_054:  mov     eax, dword [ebp+8H]                     ; 0DC1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DC4 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DC7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DCA _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DCD _ 89. 50, 10
        mov     eax, 0                                  ; 0DD0 _ B8, 00000000
?_055:  leave                                           ; 0DD5 _ C9
        ret                                             ; 0DD6 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0DD7 _ 55
        mov     ebp, esp                                ; 0DD8 _ 89. E5
        sub     esp, 16                                 ; 0DDA _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0DDD _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0DE0 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0DE3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DE6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DE9 _ 39. C2
        jnz     ?_056                                   ; 0DEB _ 75, 07
        mov     eax, 4294967295                         ; 0DED _ B8, FFFFFFFF
        jmp     ?_058                                   ; 0DF2 _ EB, 51

?_056:  mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DF7 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DF9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DFC _ 8B. 40, 08
        add     eax, edx                                ; 0DFF _ 01. D0
        movzx   eax, byte [eax]                         ; 0E01 _ 0F B6. 00
        movzx   eax, al                                 ; 0E04 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E07 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E0A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E0D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E10 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E13 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E16 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E19 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E1C _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E1F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E22 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E25 _ 39. C2
        jnz     ?_057                                   ; 0E27 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0E29 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E2C _ C7. 40, 08, 00000000
?_057:  mov     eax, dword [ebp+8H]                     ; 0E33 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E36 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E39 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E3C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E3F _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E42 _ 8B. 45, FC
?_058:  leave                                           ; 0E45 _ C9
        ret                                             ; 0E46 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E47 _ 55
        mov     ebp, esp                                ; 0E48 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E4A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E4D _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E50 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E53 _ 8B. 40, 10
        sub     edx, eax                                ; 0E56 _ 29. C2
        mov     eax, edx                                ; 0E58 _ 89. D0
        pop     ebp                                     ; 0E5A _ 5D
        ret                                             ; 0E5B _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E5C _ 55
        mov     ebp, esp                                ; 0E5D _ 89. E5
        sub     esp, 4                                  ; 0E5F _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E62 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E65 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E68 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E6B _ 0F B6. 40, 03
        test    al, al                                  ; 0E6F _ 84. C0
        jnz     ?_060                                   ; 0E71 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E73 _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 0E77 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E79 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E7C _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 0E80 _ B8, 00000000
        jmp     ?_067                                   ; 0E85 _ E9, 0000010F

?_060:  mov     eax, dword [ebp+8H]                     ; 0E8A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E8D _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0E91 _ 3C, 01
        jnz     ?_062                                   ; 0E93 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0E95 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E99 _ 25, 000000C8
        cmp     eax, 8                                  ; 0E9E _ 83. F8, 08
        jnz     ?_061                                   ; 0EA1 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0EA3 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EA6 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0EAA _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0EAC _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0EAF _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 0EB3 _ B8, 00000000
        jmp     ?_067                                   ; 0EB8 _ E9, 000000DC

?_062:  mov     eax, dword [ebp+8H]                     ; 0EBD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EC0 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0EC4 _ 3C, 02
        jnz     ?_063                                   ; 0EC6 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0EC8 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0ECB _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0ECF _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0ED2 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0ED5 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0ED9 _ B8, 00000000
        jmp     ?_067                                   ; 0EDE _ E9, 000000B6

?_063:  mov     eax, dword [ebp+8H]                     ; 0EE3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EE6 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0EEA _ 3C, 03
        jne near     ?_066                                   ; 0EEC _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0EF2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EF5 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0EF9 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0EFC _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EFF _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F03 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F06 _ 0F B6. 00
        movzx   eax, al                                 ; 0F09 _ 0F B6. C0
        and     eax, 07H                                ; 0F0C _ 83. E0, 07
        mov     edx, eax                                ; 0F0F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F11 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F14 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F17 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0F1A _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0F1E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F21 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F24 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F27 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0F2A _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0F2E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F31 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F34 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F37 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F3A _ 0F B6. 00
        movzx   eax, al                                 ; 0F3D _ 0F B6. C0
        and     eax, 10H                                ; 0F40 _ 83. E0, 10
        test    eax, eax                                ; 0F43 _ 85. C0
        jz      ?_064                                   ; 0F45 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F47 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F4A _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F4D _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F52 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F54 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F57 _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 0F5A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F5D _ 0F B6. 00
        movzx   eax, al                                 ; 0F60 _ 0F B6. C0
        and     eax, 20H                                ; 0F63 _ 83. E0, 20
        test    eax, eax                                ; 0F66 _ 85. C0
        jz      ?_065                                   ; 0F68 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F6A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F6D _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F70 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F75 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F77 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F7A _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 0F7D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F80 _ 8B. 40, 08
        neg     eax                                     ; 0F83 _ F7. D8
        mov     edx, eax                                ; 0F85 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F87 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F8A _ 89. 50, 08
        mov     eax, 1                                  ; 0F8D _ B8, 00000001
        jmp     ?_067                                   ; 0F92 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 0F94 _ B8, FFFFFFFF
?_067:  leave                                           ; 0F99 _ C9
        ret                                             ; 0F9A _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F9B _ 55
        mov     ebp, esp                                ; 0F9C _ 89. E5
        sub     esp, 56                                 ; 0F9E _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0FA1 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0FA8 _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0FAF _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0FB6 _ C7. 45, DC, 00000050
        push    100                                     ; 0FBD _ 6A, 64
        push    dword [ebp+14H]                         ; 0FBF _ FF. 75, 14
        push    0                                       ; 0FC2 _ 6A, 00
        push    0                                       ; 0FC4 _ 6A, 00
        push    14                                      ; 0FC6 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FC8 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FCB _ FF. 75, 0C
        call    boxfill8                                ; 0FCE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FD3 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FD6 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FD9 _ 0F BE. C0
        sub     esp, 8                                  ; 0FDC _ 83. EC, 08
        push    ?_074                                   ; 0FDF _ 68, 00000000(d)
        push    eax                                     ; 0FE4 _ 50
        push    dword [ebp-2CH]                         ; 0FE5 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FE8 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0FEB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FEE _ FF. 75, 0C
        call    showString                              ; 0FF1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FF6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FF9 _ 8B. 45, 10
        sub     esp, 12                                 ; 0FFC _ 83. EC, 0C
        push    eax                                     ; 0FFF _ 50
        call    intToHexStr                             ; 1000 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1005 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1008 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 100B _ 8B. 45, 18
        movsx   eax, al                                 ; 100E _ 0F BE. C0
        sub     esp, 8                                  ; 1011 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1014 _ FF. 75, E0
        push    eax                                     ; 1017 _ 50
        push    dword [ebp-2CH]                         ; 1018 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 101B _ FF. 75, D8
        push    dword [ebp+14H]                         ; 101E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1021 _ FF. 75, 0C
        call    showString                              ; 1024 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1029 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 102C _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1030 _ 8B. 45, 18
        movsx   eax, al                                 ; 1033 _ 0F BE. C0
        sub     esp, 8                                  ; 1036 _ 83. EC, 08
        push    ?_075                                   ; 1039 _ 68, 0000000A(d)
        push    eax                                     ; 103E _ 50
        push    dword [ebp-2CH]                         ; 103F _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1042 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1045 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1048 _ FF. 75, 0C
        call    showString                              ; 104B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1050 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1053 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1056 _ 8B. 00
        sub     esp, 12                                 ; 1058 _ 83. EC, 0C
        push    eax                                     ; 105B _ 50
        call    intToHexStr                             ; 105C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1061 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1064 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 1067 _ 8B. 45, 18
        movsx   eax, al                                 ; 106A _ 0F BE. C0
        sub     esp, 8                                  ; 106D _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1070 _ FF. 75, E4
        push    eax                                     ; 1073 _ 50
        push    dword [ebp-2CH]                         ; 1074 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1077 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 107A _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 107D _ FF. 75, 0C
        call    showString                              ; 1080 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1085 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1088 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 108C _ 8B. 45, 18
        movsx   eax, al                                 ; 108F _ 0F BE. C0
        sub     esp, 8                                  ; 1092 _ 83. EC, 08
        push    ?_076                                   ; 1095 _ 68, 00000016(d)
        push    eax                                     ; 109A _ 50
        push    dword [ebp-2CH]                         ; 109B _ FF. 75, D4
        push    dword [ebp-30H]                         ; 109E _ FF. 75, D0
        push    dword [ebp+14H]                         ; 10A1 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10A4 _ FF. 75, 0C
        call    showString                              ; 10A7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10AC _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10AF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10B2 _ 8B. 40, 04
        sub     esp, 12                                 ; 10B5 _ 83. EC, 0C
        push    eax                                     ; 10B8 _ 50
        call    intToHexStr                             ; 10B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10BE _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 10C1 _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 10C4 _ 8B. 45, 18
        movsx   eax, al                                 ; 10C7 _ 0F BE. C0
        sub     esp, 8                                  ; 10CA _ 83. EC, 08
        push    dword [ebp-18H]                         ; 10CD _ FF. 75, E8
        push    eax                                     ; 10D0 _ 50
        push    dword [ebp-2CH]                         ; 10D1 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10D4 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 10D7 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10DA _ FF. 75, 0C
        call    showString                              ; 10DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E2 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10E5 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 10E9 _ 8B. 45, 18
        movsx   eax, al                                 ; 10EC _ 0F BE. C0
        sub     esp, 8                                  ; 10EF _ 83. EC, 08
        push    ?_077                                   ; 10F2 _ 68, 00000022(d)
        push    eax                                     ; 10F7 _ 50
        push    dword [ebp-2CH]                         ; 10F8 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10FB _ FF. 75, D0
        push    dword [ebp+14H]                         ; 10FE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1101 _ FF. 75, 0C
        call    showString                              ; 1104 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1109 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 110C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 110F _ 8B. 40, 08
        sub     esp, 12                                 ; 1112 _ 83. EC, 0C
        push    eax                                     ; 1115 _ 50
        call    intToHexStr                             ; 1116 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 111B _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 111E _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1121 _ 8B. 45, 18
        movsx   eax, al                                 ; 1124 _ 0F BE. C0
        sub     esp, 8                                  ; 1127 _ 83. EC, 08
        push    dword [ebp-14H]                         ; 112A _ FF. 75, EC
        push    eax                                     ; 112D _ 50
        push    dword [ebp-2CH]                         ; 112E _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1131 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1134 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1137 _ FF. 75, 0C
        call    showString                              ; 113A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 113F _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1142 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1146 _ 8B. 45, 18
        movsx   eax, al                                 ; 1149 _ 0F BE. C0
        sub     esp, 8                                  ; 114C _ 83. EC, 08
        push    ?_078                                   ; 114F _ 68, 0000002E(d)
        push    eax                                     ; 1154 _ 50
        push    dword [ebp-2CH]                         ; 1155 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1158 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 115B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 115E _ FF. 75, 0C
        call    showString                              ; 1161 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1166 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1169 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 116C _ 8B. 40, 0C
        sub     esp, 12                                 ; 116F _ 83. EC, 0C
        push    eax                                     ; 1172 _ 50
        call    intToHexStr                             ; 1173 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1178 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 117B _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 117E _ 8B. 45, 18
        movsx   eax, al                                 ; 1181 _ 0F BE. C0
        sub     esp, 8                                  ; 1184 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 1187 _ FF. 75, F0
        push    eax                                     ; 118A _ 50
        push    dword [ebp-2CH]                         ; 118B _ FF. 75, D4
        push    dword [ebp-28H]                         ; 118E _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1191 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1194 _ FF. 75, 0C
        call    showString                              ; 1197 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 119C _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 119F _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 11A3 _ 8B. 45, 18
        movsx   eax, al                                 ; 11A6 _ 0F BE. C0
        sub     esp, 8                                  ; 11A9 _ 83. EC, 08
        push    ?_079                                   ; 11AC _ 68, 0000003B(d)
        push    eax                                     ; 11B1 _ 50
        push    dword [ebp-2CH]                         ; 11B2 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11B5 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 11B8 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11BB _ FF. 75, 0C
        call    showString                              ; 11BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11C3 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11C6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11C9 _ 8B. 40, 10
        sub     esp, 12                                 ; 11CC _ 83. EC, 0C
        push    eax                                     ; 11CF _ 50
        call    intToHexStr                             ; 11D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11D5 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11D8 _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 11DB _ 8B. 45, 18
        movsx   eax, al                                 ; 11DE _ 0F BE. C0
        sub     esp, 8                                  ; 11E1 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 11E4 _ FF. 75, F4
        push    eax                                     ; 11E7 _ 50
        push    dword [ebp-2CH]                         ; 11E8 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11EB _ FF. 75, D8
        push    dword [ebp+14H]                         ; 11EE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11F1 _ FF. 75, 0C
        call    showString                              ; 11F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11F9 _ 83. C4, 20
        leave                                           ; 11FC _ C9
        ret                                             ; 11FD _ C3
; showMemoryInfo End of function



keyval:                                                 ; byte
        db 30H, 58H                                     ; 0000 _ 0X

?_068:  db 00H                                          ; 0002 _ .

?_069:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1572:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

cursor.1619:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0080 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0088 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0098 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0100 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0110 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0128 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0138 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0148 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0158 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0168 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0178 _ .....***



mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_070:  resw    1                                       ; 0104

?_071:  resw    1                                       ; 0106

keyinfo:                                                ; byte
        resb    24                                      ; 0108

mouseinfo:                                              ; byte
        resb    32                                      ; 0120

keybuf:                                                 ; yword
        resb    64                                      ; 0140

mousebuf:                                               ; byte
        resb    128                                     ; 0180

mdec:                                                   ; oword
        resb    16                                      ; 0200

mx:     resd    1                                       ; 0210

my:     resd    1                                       ; 0214

xsize:  resd    1                                       ; 0218

ysize:  resd    1                                       ; 021C

str.1667:                                               ; byte
        resb    1                                       ; 0220

?_072:  resb    9                                       ; 0221

?_073:  resb    1                                       ; 022A



?_074:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0000 _ page is:
        db 20H, 00H                                     ; 0008 _  .

?_075:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 000A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0012 _ L: .

?_076:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0016 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 001E _ H: .

?_077:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0022 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 002A _ w: .

?_078:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 002E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0036 _ gh: .

?_079:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 003B _ type: .


