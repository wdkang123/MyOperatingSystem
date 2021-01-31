; Disassembly of file: ckernel.o
; Wed Nov  2 23:38:48 2016
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 32                                 ; 0005 _ 83. EC, 20
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000100(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000100(d)
        mov     dword [ebp-1CH], eax                    ; 001D _ 89. 45, E4
        movzx   eax, word [?_095]                       ; 0020 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0027 _ 98
        mov     dword [xsize], eax                      ; 0028 _ A3, 00000218(d)
        movzx   eax, word [?_096]                       ; 002D _ 0F B7. 05, 00000106(d)
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
        push    dword [ebp-1CH]                         ; 0096 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 00C9 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 00FC _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 012F _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 015B _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 0187 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 01B3 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 01DF _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 020B _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 0237 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 0271 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 02AB _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 02E5 _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 031F _ FF. 75, E4
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
        push    dword [ebp-1CH]                         ; 0387 _ FF. 75, E4
        call    putblock                                ; 038A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 038F _ 83. C4, 20
        call    get_memory_block_count                  ; 0392 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0397 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 039A _ 8B. 45, E8
        sub     esp, 12                                 ; 039D _ 83. EC, 0C
        push    eax                                     ; 03A0 _ 50
        call    intToHexStr                             ; 03A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A6 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 03A9 _ 89. 45, EC
        call    get_adr_buffer                          ; 03AC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 03B1 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 03B4 _ A1, 00000000(d)
        sub     esp, 12                                 ; 03B9 _ 83. EC, 0C
        push    eax                                     ; 03BC _ 50
        call    memman_init                             ; 03BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C2 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 03C5 _ A1, 00000218(d)
        sub     esp, 8                                  ; 03CA _ 83. EC, 08
        push    ?_085                                   ; 03CD _ 68, 00000000(d)
        push    7                                       ; 03D2 _ 6A, 07
        push    0                                       ; 03D4 _ 6A, 00
        push    0                                       ; 03D6 _ 6A, 00
        push    eax                                     ; 03D8 _ 50
        push    dword [ebp-1CH]                         ; 03D9 _ FF. 75, E4
        call    showString                              ; 03DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03E1 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 03E4 _ A1, 00000218(d)
        sub     esp, 8                                  ; 03E9 _ 83. EC, 08
        push    ?_086                                   ; 03EC _ 68, 00000012(d)
        push    7                                       ; 03F1 _ 6A, 07
        push    160                                     ; 03F3 _ 68, 000000A0
        push    0                                       ; 03F8 _ 6A, 00
        push    eax                                     ; 03FA _ 50
        push    dword [ebp-1CH]                         ; 03FB _ FF. 75, E4
        call    showString                              ; 03FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0403 _ 83. C4, 20
        call    io_sti                                  ; 0406 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 040B _ 83. EC, 0C
        push    mdec                                    ; 040E _ 68, 00000200(d)
        call    enable_mouse                            ; 0413 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0418 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 041B _ C7. 45, F4, 00000000
        mov     dword [ebp-20H], 0                      ; 0422 _ C7. 45, E0, 00000000
?_001:  call    io_cli                                  ; 0429 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 042E _ 83. EC, 0C
        push    keyinfo                                 ; 0431 _ 68, 00000108(d)
        call    fifo8_status                            ; 0436 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043B _ 83. C4, 10
        mov     ebx, eax                                ; 043E _ 89. C3
        sub     esp, 12                                 ; 0440 _ 83. EC, 0C
        push    mouseinfo                               ; 0443 _ 68, 00000120(d)
        call    fifo8_status                            ; 0448 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 044D _ 83. C4, 10
        add     eax, ebx                                ; 0450 _ 01. D8
        test    eax, eax                                ; 0452 _ 85. C0
        jnz     ?_002                                   ; 0454 _ 75, 0A
        call    io_stihlt                               ; 0456 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 045B _ E9, 00000092

?_002:  sub     esp, 12                                 ; 0460 _ 83. EC, 0C
        push    keyinfo                                 ; 0463 _ 68, 00000108(d)
        call    fifo8_status                            ; 0468 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 046D _ 83. C4, 10
        test    eax, eax                                ; 0470 _ 85. C0
        jz      ?_003                                   ; 0472 _ 74, 65
        call    io_sti                                  ; 0474 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0479 _ 83. EC, 0C
        push    keyinfo                                 ; 047C _ 68, 00000108(d)
        call    fifo8_get                               ; 0481 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0486 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0489 _ 89. 45, F4
        cmp     dword [ebp-0CH], 28                     ; 048C _ 83. 7D, F4, 1C
        jnz     ?_004                                   ; 0490 _ 75, 60
        mov     ecx, dword [xsize]                      ; 0492 _ 8B. 0D, 00000218(d)
        mov     edx, dword [ebp-20H]                    ; 0498 _ 8B. 55, E0
        mov     eax, edx                                ; 049B _ 89. D0
        shl     eax, 2                                  ; 049D _ C1. E0, 02
        add     eax, edx                                ; 04A0 _ 01. D0
        shl     eax, 2                                  ; 04A2 _ C1. E0, 02
        mov     edx, eax                                ; 04A5 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 04A7 _ 8B. 45, F0
        add     eax, edx                                ; 04AA _ 01. D0
        sub     esp, 12                                 ; 04AC _ 83. EC, 0C
        push    7                                       ; 04AF _ 6A, 07
        push    ecx                                     ; 04B1 _ 51
        push    dword [ebp-20H]                         ; 04B2 _ FF. 75, E0
        push    dword [ebp-1CH]                         ; 04B5 _ FF. 75, E4
        push    eax                                     ; 04B8 _ 50
        call    showMemoryInfo                          ; 04B9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04BE _ 83. C4, 20
        add     dword [ebp-20H], 1                      ; 04C1 _ 83. 45, E0, 01
        mov     eax, dword [ebp-20H]                    ; 04C5 _ 8B. 45, E0
        cmp     eax, dword [ebp-18H]                    ; 04C8 _ 3B. 45, E8
        jle     ?_004                                   ; 04CB _ 7E, 25
        mov     dword [ebp-20H], 0                      ; 04CD _ C7. 45, E0, 00000000
        jmp     ?_001                                   ; 04D4 _ E9, FFFFFF50

?_003:  sub     esp, 12                                 ; 04D9 _ 83. EC, 0C
        push    mouseinfo                               ; 04DC _ 68, 00000120(d)
        call    fifo8_status                            ; 04E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E6 _ 83. C4, 10
        test    eax, eax                                ; 04E9 _ 85. C0
        jz      ?_004                                   ; 04EB _ 74, 05
        call    show_mouse_info                         ; 04ED _ E8, FFFFFFFC(rel)
?_004:  jmp     ?_001                                   ; 04F2 _ E9, FFFFFF32
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 04F7 _ 55
        mov     ebp, esp                                ; 04F8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 04FA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 04FD _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0500 _ A1, 00000210(d)
        add     eax, edx                                ; 0505 _ 01. D0
        mov     dword [mx], eax                         ; 0507 _ A3, 00000210(d)
        mov     eax, dword [ebp+8H]                     ; 050C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 050F _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0512 _ A1, 00000214(d)
        add     eax, edx                                ; 0517 _ 01. D0
        mov     dword [my], eax                         ; 0519 _ A3, 00000214(d)
        mov     eax, dword [mx]                         ; 051E _ A1, 00000210(d)
        test    eax, eax                                ; 0523 _ 85. C0
        jns     ?_005                                   ; 0525 _ 79, 0A
        mov     dword [mx], 0                           ; 0527 _ C7. 05, 00000210(d), 00000000
?_005:  mov     eax, dword [my]                         ; 0531 _ A1, 00000214(d)
        test    eax, eax                                ; 0536 _ 85. C0
        jns     ?_006                                   ; 0538 _ 79, 0A
        mov     dword [my], 0                           ; 053A _ C7. 05, 00000214(d), 00000000
?_006:  mov     eax, dword [xsize]                      ; 0544 _ A1, 00000218(d)
        lea     edx, [eax-10H]                          ; 0549 _ 8D. 50, F0
        mov     eax, dword [mx]                         ; 054C _ A1, 00000210(d)
        cmp     edx, eax                                ; 0551 _ 39. C2
        jge     ?_007                                   ; 0553 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 0555 _ A1, 00000218(d)
        sub     eax, 16                                 ; 055A _ 83. E8, 10
        mov     dword [mx], eax                         ; 055D _ A3, 00000210(d)
?_007:  mov     eax, dword [ysize]                      ; 0562 _ A1, 0000021C(d)
        lea     edx, [eax-10H]                          ; 0567 _ 8D. 50, F0
        mov     eax, dword [my]                         ; 056A _ A1, 00000214(d)
        cmp     edx, eax                                ; 056F _ 39. C2
        jge     ?_008                                   ; 0571 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 0573 _ A1, 0000021C(d)
        sub     eax, 16                                 ; 0578 _ 83. E8, 10
        mov     dword [my], eax                         ; 057B _ A3, 00000214(d)
?_008:  pop     ebp                                     ; 0580 _ 5D
        ret                                             ; 0581 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0582 _ 55
        mov     ebp, esp                                ; 0583 _ 89. E5
        push    esi                                     ; 0585 _ 56
        push    ebx                                     ; 0586 _ 53
        mov     eax, dword [my]                         ; 0587 _ A1, 00000214(d)
        lea     esi, [eax+0FH]                          ; 058C _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 058F _ A1, 00000210(d)
        lea     ebx, [eax+0FH]                          ; 0594 _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 0597 _ 8B. 0D, 00000214(d)
        mov     edx, dword [mx]                         ; 059D _ 8B. 15, 00000210(d)
        mov     eax, dword [xsize]                      ; 05A3 _ A1, 00000218(d)
        sub     esp, 4                                  ; 05A8 _ 83. EC, 04
        push    esi                                     ; 05AB _ 56
        push    ebx                                     ; 05AC _ 53
        push    ecx                                     ; 05AD _ 51
        push    edx                                     ; 05AE _ 52
        push    14                                      ; 05AF _ 6A, 0E
        push    eax                                     ; 05B1 _ 50
        push    dword [ebp+8H]                          ; 05B2 _ FF. 75, 08
        call    boxfill8                                ; 05B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05BA _ 83. C4, 20
        lea     esp, [ebp-8H]                           ; 05BD _ 8D. 65, F8
        pop     ebx                                     ; 05C0 _ 5B
        pop     esi                                     ; 05C1 _ 5E
        pop     ebp                                     ; 05C2 _ 5D
        ret                                             ; 05C3 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 05C4 _ 55
        mov     ebp, esp                                ; 05C5 _ 89. E5
        sub     esp, 8                                  ; 05C7 _ 83. EC, 08
        mov     ecx, dword [my]                         ; 05CA _ 8B. 0D, 00000214(d)
        mov     edx, dword [mx]                         ; 05D0 _ 8B. 15, 00000210(d)
        mov     eax, dword [xsize]                      ; 05D6 _ A1, 00000218(d)
        push    16                                      ; 05DB _ 6A, 10
        push    mcursor                                 ; 05DD _ 68, 00000000(d)
        push    ecx                                     ; 05E2 _ 51
        push    edx                                     ; 05E3 _ 52
        push    16                                      ; 05E4 _ 6A, 10
        push    16                                      ; 05E6 _ 6A, 10
        push    eax                                     ; 05E8 _ 50
        push    dword [ebp+8H]                          ; 05E9 _ FF. 75, 08
        call    putblock                                ; 05EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F1 _ 83. C4, 20
        leave                                           ; 05F4 _ C9
        ret                                             ; 05F5 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 05F6 _ 55
        mov     ebp, esp                                ; 05F7 _ 89. E5
        sub     esp, 24                                 ; 05F9 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 05FC _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0601 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0604 _ C6. 45, F3, 00
        call    io_sti                                  ; 0608 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 060D _ 83. EC, 0C
        push    mouseinfo                               ; 0610 _ 68, 00000120(d)
        call    fifo8_get                               ; 0615 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 061A _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 061D _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0620 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0624 _ 83. EC, 08
        push    eax                                     ; 0627 _ 50
        push    mdec                                    ; 0628 _ 68, 00000200(d)
        call    mouse_decode                            ; 062D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0632 _ 83. C4, 10
        test    eax, eax                                ; 0635 _ 85. C0
        jz      ?_009                                   ; 0637 _ 74, 2C
        sub     esp, 12                                 ; 0639 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 063C _ FF. 75, F4
        call    eraseMouse                              ; 063F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0644 _ 83. C4, 10
        sub     esp, 12                                 ; 0647 _ 83. EC, 0C
        push    mdec                                    ; 064A _ 68, 00000200(d)
        call    computeMousePosition                    ; 064F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0654 _ 83. C4, 10
        sub     esp, 12                                 ; 0657 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 065A _ FF. 75, F4
        call    drawMouse                               ; 065D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0662 _ 83. C4, 10
?_009:  leave                                           ; 0665 _ C9
        ret                                             ; 0666 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0667 _ 55
        mov     ebp, esp                                ; 0668 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 066A _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 066D _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0673 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0676 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 067C _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 067F _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0685 _ 5D
        ret                                             ; 0686 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0687 _ 55
        mov     ebp, esp                                ; 0688 _ 89. E5
        sub     esp, 24                                 ; 068A _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 068D _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0690 _ 88. 45, F4
        jmp     ?_011                                   ; 0693 _ EB, 37

?_010:  mov     eax, dword [ebp+1CH]                    ; 0695 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0698 _ 0F B6. 00
        movzx   eax, al                                 ; 069B _ 0F B6. C0
        shl     eax, 4                                  ; 069E _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06A1 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06A7 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 06AB _ 83. EC, 08
        push    edx                                     ; 06AE _ 52
        push    eax                                     ; 06AF _ 50
        push    dword [ebp+14H]                         ; 06B0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 06B3 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 06B6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 06B9 _ FF. 75, 08
        call    showFont8                               ; 06BC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06C1 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 06C4 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 06C8 _ 83. 45, 1C, 01
?_011:  mov     eax, dword [ebp+1CH]                    ; 06CC _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 06CF _ 0F B6. 00
        test    al, al                                  ; 06D2 _ 84. C0
        jnz     ?_010                                   ; 06D4 _ 75, BF
        leave                                           ; 06D6 _ C9
        ret                                             ; 06D7 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 06D8 _ 55
        mov     ebp, esp                                ; 06D9 _ 89. E5
        sub     esp, 8                                  ; 06DB _ 83. EC, 08
        sub     esp, 4                                  ; 06DE _ 83. EC, 04
        push    table_rgb.1583                          ; 06E1 _ 68, 00000020(d)
        push    15                                      ; 06E6 _ 6A, 0F
        push    0                                       ; 06E8 _ 6A, 00
        call    set_palette                             ; 06EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06EF _ 83. C4, 10
        nop                                             ; 06F2 _ 90
        leave                                           ; 06F3 _ C9
        ret                                             ; 06F4 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 06F5 _ 55
        mov     ebp, esp                                ; 06F6 _ 89. E5
        sub     esp, 24                                 ; 06F8 _ 83. EC, 18
        call    io_load_eflags                          ; 06FB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0700 _ 89. 45, F4
        call    io_cli                                  ; 0703 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0708 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 070B _ FF. 75, 08
        push    968                                     ; 070E _ 68, 000003C8
        call    io_out8                                 ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0718 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 071B _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 071E _ 89. 45, F0
        jmp     ?_013                                   ; 0721 _ EB, 65

?_012:  mov     eax, dword [ebp+10H]                    ; 0723 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0726 _ 0F B6. 00
        shr     al, 2                                   ; 0729 _ C0. E8, 02
        movzx   eax, al                                 ; 072C _ 0F B6. C0
        sub     esp, 8                                  ; 072F _ 83. EC, 08
        push    eax                                     ; 0732 _ 50
        push    969                                     ; 0733 _ 68, 000003C9
        call    io_out8                                 ; 0738 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 073D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0740 _ 8B. 45, 10
        add     eax, 1                                  ; 0743 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0746 _ 0F B6. 00
        shr     al, 2                                   ; 0749 _ C0. E8, 02
        movzx   eax, al                                 ; 074C _ 0F B6. C0
        sub     esp, 8                                  ; 074F _ 83. EC, 08
        push    eax                                     ; 0752 _ 50
        push    969                                     ; 0753 _ 68, 000003C9
        call    io_out8                                 ; 0758 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 075D _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0760 _ 8B. 45, 10
        add     eax, 2                                  ; 0763 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0766 _ 0F B6. 00
        shr     al, 2                                   ; 0769 _ C0. E8, 02
        movzx   eax, al                                 ; 076C _ 0F B6. C0
        sub     esp, 8                                  ; 076F _ 83. EC, 08
        push    eax                                     ; 0772 _ 50
        push    969                                     ; 0773 _ 68, 000003C9
        call    io_out8                                 ; 0778 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 077D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0780 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0784 _ 83. 45, F0, 01
?_013:  mov     eax, dword [ebp-10H]                    ; 0788 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 078B _ 3B. 45, 0C
        jle     ?_012                                   ; 078E _ 7E, 93
        sub     esp, 12                                 ; 0790 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0793 _ FF. 75, F4
        call    io_store_eflags                         ; 0796 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 079B _ 83. C4, 10
        nop                                             ; 079E _ 90
        leave                                           ; 079F _ C9
        ret                                             ; 07A0 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07A1 _ 55
        mov     ebp, esp                                ; 07A2 _ 89. E5
        sub     esp, 20                                 ; 07A4 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07A7 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07AA _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07AD _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 07B0 _ 89. 45, FC
        jmp     ?_017                                   ; 07B3 _ EB, 33

?_014:  mov     eax, dword [ebp+14H]                    ; 07B5 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 07B8 _ 89. 45, F8
        jmp     ?_016                                   ; 07BB _ EB, 1F

?_015:  mov     eax, dword [ebp-4H]                     ; 07BD _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 07C0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07C4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 07C6 _ 8B. 45, F8
        add     eax, edx                                ; 07C9 _ 01. D0
        mov     edx, eax                                ; 07CB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07CD _ 8B. 45, 08
        add     edx, eax                                ; 07D0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 07D2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 07D6 _ 88. 02
        add     dword [ebp-8H], 1                       ; 07D8 _ 83. 45, F8, 01
?_016:  mov     eax, dword [ebp-8H]                     ; 07DC _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 07DF _ 3B. 45, 1C
        jle     ?_015                                   ; 07E2 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 07E4 _ 83. 45, FC, 01
?_017:  mov     eax, dword [ebp-4H]                     ; 07E8 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 07EB _ 3B. 45, 20
        jle     ?_014                                   ; 07EE _ 7E, C5
        leave                                           ; 07F0 _ C9
        ret                                             ; 07F1 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 07F2 _ 55
        mov     ebp, esp                                ; 07F3 _ 89. E5
        sub     esp, 20                                 ; 07F5 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 07F8 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 07FB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07FE _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 0805 _ E9, 0000016C

?_018:  mov     edx, dword [ebp-4H]                     ; 080A _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 080D _ 8B. 45, 1C
        add     eax, edx                                ; 0810 _ 01. D0
        movzx   eax, byte [eax]                         ; 0812 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0815 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0818 _ 80. 7D, FB, 00
        jns     ?_019                                   ; 081C _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 081E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0821 _ 8B. 45, FC
        add     eax, edx                                ; 0824 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0826 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 082A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 082C _ 8B. 45, 10
        add     eax, edx                                ; 082F _ 01. D0
        mov     edx, eax                                ; 0831 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0833 _ 8B. 45, 08
        add     edx, eax                                ; 0836 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0838 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 083C _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 083E _ 0F BE. 45, FB
        and     eax, 40H                                ; 0842 _ 83. E0, 40
        test    eax, eax                                ; 0845 _ 85. C0
        jz      ?_020                                   ; 0847 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0849 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 084C _ 8B. 45, FC
        add     eax, edx                                ; 084F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0851 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0855 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0857 _ 8B. 45, 10
        add     eax, edx                                ; 085A _ 01. D0
        lea     edx, [eax+1H]                           ; 085C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 085F _ 8B. 45, 08
        add     edx, eax                                ; 0862 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0864 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0868 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 086A _ 0F BE. 45, FB
        and     eax, 20H                                ; 086E _ 83. E0, 20
        test    eax, eax                                ; 0871 _ 85. C0
        jz      ?_021                                   ; 0873 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0875 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0878 _ 8B. 45, FC
        add     eax, edx                                ; 087B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 087D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0881 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0883 _ 8B. 45, 10
        add     eax, edx                                ; 0886 _ 01. D0
        lea     edx, [eax+2H]                           ; 0888 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 088B _ 8B. 45, 08
        add     edx, eax                                ; 088E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0890 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0894 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0896 _ 0F BE. 45, FB
        and     eax, 10H                                ; 089A _ 83. E0, 10
        test    eax, eax                                ; 089D _ 85. C0
        jz      ?_022                                   ; 089F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08A1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08A4 _ 8B. 45, FC
        add     eax, edx                                ; 08A7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08AD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08AF _ 8B. 45, 10
        add     eax, edx                                ; 08B2 _ 01. D0
        lea     edx, [eax+3H]                           ; 08B4 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 08B7 _ 8B. 45, 08
        add     edx, eax                                ; 08BA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08BC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08C0 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 08C2 _ 0F BE. 45, FB
        and     eax, 08H                                ; 08C6 _ 83. E0, 08
        test    eax, eax                                ; 08C9 _ 85. C0
        jz      ?_023                                   ; 08CB _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08CD _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08D0 _ 8B. 45, FC
        add     eax, edx                                ; 08D3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08D5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08DB _ 8B. 45, 10
        add     eax, edx                                ; 08DE _ 01. D0
        lea     edx, [eax+4H]                           ; 08E0 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 08E3 _ 8B. 45, 08
        add     edx, eax                                ; 08E6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 08E8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 08EC _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08EE _ 0F BE. 45, FB
        and     eax, 04H                                ; 08F2 _ 83. E0, 04
        test    eax, eax                                ; 08F5 _ 85. C0
        jz      ?_024                                   ; 08F7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 08F9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08FC _ 8B. 45, FC
        add     eax, edx                                ; 08FF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0901 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0905 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0907 _ 8B. 45, 10
        add     eax, edx                                ; 090A _ 01. D0
        lea     edx, [eax+5H]                           ; 090C _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 090F _ 8B. 45, 08
        add     edx, eax                                ; 0912 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0914 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0918 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 091A _ 0F BE. 45, FB
        and     eax, 02H                                ; 091E _ 83. E0, 02
        test    eax, eax                                ; 0921 _ 85. C0
        jz      ?_025                                   ; 0923 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0925 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0928 _ 8B. 45, FC
        add     eax, edx                                ; 092B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 092D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0931 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0933 _ 8B. 45, 10
        add     eax, edx                                ; 0936 _ 01. D0
        lea     edx, [eax+6H]                           ; 0938 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 093B _ 8B. 45, 08
        add     edx, eax                                ; 093E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0940 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0944 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0946 _ 0F BE. 45, FB
        and     eax, 01H                                ; 094A _ 83. E0, 01
        test    eax, eax                                ; 094D _ 85. C0
        jz      ?_026                                   ; 094F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0951 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0954 _ 8B. 45, FC
        add     eax, edx                                ; 0957 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0959 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 095D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 095F _ 8B. 45, 10
        add     eax, edx                                ; 0962 _ 01. D0
        lea     edx, [eax+7H]                           ; 0964 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0967 _ 8B. 45, 08
        add     edx, eax                                ; 096A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 096C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0970 _ 88. 02
?_026:  add     dword [ebp-4H], 1                       ; 0972 _ 83. 45, FC, 01
?_027:  cmp     dword [ebp-4H], 15                      ; 0976 _ 83. 7D, FC, 0F
        jle     ?_018                                   ; 097A _ 0F 8E, FFFFFE8A
        leave                                           ; 0980 _ C9
        ret                                             ; 0981 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0982 _ 55
        mov     ebp, esp                                ; 0983 _ 89. E5
        sub     esp, 20                                 ; 0985 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0988 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 098B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 098E _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0995 _ E9, 000000B1

?_028:  mov     dword [ebp-8H], 0                       ; 099A _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 09A1 _ E9, 00000097

?_029:  mov     eax, dword [ebp-4H]                     ; 09A6 _ 8B. 45, FC
        shl     eax, 4                                  ; 09A9 _ C1. E0, 04
        mov     edx, eax                                ; 09AC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09AE _ 8B. 45, F8
        add     eax, edx                                ; 09B1 _ 01. D0
        add     eax, cursor.1630                        ; 09B3 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 09B8 _ 0F B6. 00
        cmp     al, 42                                  ; 09BB _ 3C, 2A
        jnz     ?_030                                   ; 09BD _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 09BF _ 8B. 45, FC
        shl     eax, 4                                  ; 09C2 _ C1. E0, 04
        mov     edx, eax                                ; 09C5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09C7 _ 8B. 45, F8
        add     eax, edx                                ; 09CA _ 01. D0
        mov     edx, eax                                ; 09CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09CE _ 8B. 45, 08
        add     eax, edx                                ; 09D1 _ 01. D0
        mov     byte [eax], 0                           ; 09D3 _ C6. 00, 00
?_030:  mov     eax, dword [ebp-4H]                     ; 09D6 _ 8B. 45, FC
        shl     eax, 4                                  ; 09D9 _ C1. E0, 04
        mov     edx, eax                                ; 09DC _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09DE _ 8B. 45, F8
        add     eax, edx                                ; 09E1 _ 01. D0
        add     eax, cursor.1630                        ; 09E3 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 09E8 _ 0F B6. 00
        cmp     al, 79                                  ; 09EB _ 3C, 4F
        jnz     ?_031                                   ; 09ED _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 09EF _ 8B. 45, FC
        shl     eax, 4                                  ; 09F2 _ C1. E0, 04
        mov     edx, eax                                ; 09F5 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09F7 _ 8B. 45, F8
        add     eax, edx                                ; 09FA _ 01. D0
        mov     edx, eax                                ; 09FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09FE _ 8B. 45, 08
        add     eax, edx                                ; 0A01 _ 01. D0
        mov     byte [eax], 7                           ; 0A03 _ C6. 00, 07
?_031:  mov     eax, dword [ebp-4H]                     ; 0A06 _ 8B. 45, FC
        shl     eax, 4                                  ; 0A09 _ C1. E0, 04
        mov     edx, eax                                ; 0A0C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A0E _ 8B. 45, F8
        add     eax, edx                                ; 0A11 _ 01. D0
        add     eax, cursor.1630                        ; 0A13 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0A18 _ 0F B6. 00
        cmp     al, 46                                  ; 0A1B _ 3C, 2E
        jnz     ?_032                                   ; 0A1D _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 0A1F _ 8B. 45, FC
        shl     eax, 4                                  ; 0A22 _ C1. E0, 04
        mov     edx, eax                                ; 0A25 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A27 _ 8B. 45, F8
        add     eax, edx                                ; 0A2A _ 01. D0
        mov     edx, eax                                ; 0A2C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A2E _ 8B. 45, 08
        add     edx, eax                                ; 0A31 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A33 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A37 _ 88. 02
?_032:  add     dword [ebp-8H], 1                       ; 0A39 _ 83. 45, F8, 01
?_033:  cmp     dword [ebp-8H], 15                      ; 0A3D _ 83. 7D, F8, 0F
        jle     ?_029                                   ; 0A41 _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0A47 _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 0A4B _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 0A4F _ 0F 8E, FFFFFF45
        leave                                           ; 0A55 _ C9
        ret                                             ; 0A56 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A57 _ 55
        mov     ebp, esp                                ; 0A58 _ 89. E5
        sub     esp, 16                                 ; 0A5A _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0A5D _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0A64 _ EB, 50

?_035:  mov     dword [ebp-8H], 0                       ; 0A66 _ C7. 45, F8, 00000000
        jmp     ?_037                                   ; 0A6D _ EB, 3B

?_036:  mov     edx, dword [ebp+1CH]                    ; 0A6F _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 0A72 _ 8B. 45, FC
        add     eax, edx                                ; 0A75 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A77 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 0A7B _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 0A7E _ 8B. 55, F8
        add     edx, ecx                                ; 0A81 _ 01. CA
        add     eax, edx                                ; 0A83 _ 01. D0
        mov     edx, eax                                ; 0A85 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A87 _ 8B. 45, 08
        add     edx, eax                                ; 0A8A _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0A8C _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 0A8F _ 0F AF. 45, 24
        mov     ecx, eax                                ; 0A93 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0A95 _ 8B. 45, F8
        add     eax, ecx                                ; 0A98 _ 01. C8
        mov     ecx, eax                                ; 0A9A _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0A9C _ 8B. 45, 20
        add     eax, ecx                                ; 0A9F _ 01. C8
        movzx   eax, byte [eax]                         ; 0AA1 _ 0F B6. 00
        mov     byte [edx], al                          ; 0AA4 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0AA6 _ 83. 45, F8, 01
?_037:  mov     eax, dword [ebp-8H]                     ; 0AAA _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0AAD _ 3B. 45, 10
        jl      ?_036                                   ; 0AB0 _ 7C, BD
        add     dword [ebp-4H], 1                       ; 0AB2 _ 83. 45, FC, 01
?_038:  mov     eax, dword [ebp-4H]                     ; 0AB6 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0AB9 _ 3B. 45, 14
        jl      ?_035                                   ; 0ABC _ 7C, A8
        leave                                           ; 0ABE _ C9
        ret                                             ; 0ABF _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0AC0 _ 55
        mov     ebp, esp                                ; 0AC1 _ 89. E5
        sub     esp, 24                                 ; 0AC3 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0AC6 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 0ACB _ 89. 45, EC
        movzx   eax, word [?_095]                       ; 0ACE _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0AD5 _ 98
        mov     dword [ebp-10H], eax                    ; 0AD6 _ 89. 45, F0
        movzx   eax, word [?_096]                       ; 0AD9 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0AE0 _ 98
        mov     dword [ebp-0CH], eax                    ; 0AE1 _ 89. 45, F4
        sub     esp, 8                                  ; 0AE4 _ 83. EC, 08
        push    32                                      ; 0AE7 _ 6A, 20
        push    32                                      ; 0AE9 _ 6A, 20
        call    io_out8                                 ; 0AEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF0 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0AF3 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0AF7 _ 83. EC, 0C
        push    96                                      ; 0AFA _ 6A, 60
        call    io_in8                                  ; 0AFC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B01 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B04 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B07 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B0B _ 83. EC, 08
        push    eax                                     ; 0B0E _ 50
        push    keyinfo                                 ; 0B0F _ 68, 00000108(d)
        call    fifo8_put                               ; 0B14 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B19 _ 83. C4, 10
        nop                                             ; 0B1C _ 90
        leave                                           ; 0B1D _ C9
        ret                                             ; 0B1E _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B1F _ 55
        mov     ebp, esp                                ; 0B20 _ 89. E5
        sub     esp, 4                                  ; 0B22 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B25 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B28 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B2B _ 80. 7D, FC, 09
        jle     ?_039                                   ; 0B2F _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 0B31 _ 0F B6. 45, FC
        add     eax, 55                                 ; 0B35 _ 83. C0, 37
        jmp     ?_040                                   ; 0B38 _ EB, 07

?_039:  movzx   eax, byte [ebp-4H]                      ; 0B3A _ 0F B6. 45, FC
        add     eax, 48                                 ; 0B3E _ 83. C0, 30
?_040:  leave                                           ; 0B41 _ C9
        ret                                             ; 0B42 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B43 _ 55
        mov     ebp, esp                                ; 0B44 _ 89. E5
        sub     esp, 20                                 ; 0B46 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B49 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B4C _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B4F _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0B56 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0B5A _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B5D _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B60 _ 0F BE. 45, FB
        push    eax                                     ; 0B64 _ 50
        call    charToHexVal                            ; 0B65 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B6A _ 83. C4, 04
        mov     byte [?_094], al                        ; 0B6D _ A2, 00000007(d)
        movzx   eax, byte [ebp-14H]                     ; 0B72 _ 0F B6. 45, EC
        shr     al, 4                                   ; 0B76 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B79 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0B7C _ 0F B6. 45, EC
        movsx   eax, al                                 ; 0B80 _ 0F BE. C0
        push    eax                                     ; 0B83 _ 50
        call    charToHexVal                            ; 0B84 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B89 _ 83. C4, 04
        mov     byte [?_093], al                        ; 0B8C _ A2, 00000006(d)
        mov     eax, keyval                             ; 0B91 _ B8, 00000004(d)
        leave                                           ; 0B96 _ C9
        ret                                             ; 0B97 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0B98 _ 55
        mov     ebp, esp                                ; 0B99 _ 89. E5
        sub     esp, 16                                 ; 0B9B _ 83. EC, 10
        mov     byte [str.1678], 48                     ; 0B9E _ C6. 05, 00000220(d), 30
        mov     byte [?_097], 88                        ; 0BA5 _ C6. 05, 00000221(d), 58
        mov     byte [?_098], 0                         ; 0BAC _ C6. 05, 0000022A(d), 00
        mov     dword [ebp-0CH], 2                      ; 0BB3 _ C7. 45, F4, 00000002
        jmp     ?_042                                   ; 0BBA _ EB, 0F

?_041:  mov     eax, dword [ebp-0CH]                    ; 0BBC _ 8B. 45, F4
        add     eax, str.1678                           ; 0BBF _ 05, 00000220(d)
        mov     byte [eax], 48                          ; 0BC4 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 0BC7 _ 83. 45, F4, 01
?_042:  cmp     dword [ebp-0CH], 9                      ; 0BCB _ 83. 7D, F4, 09
        jle     ?_041                                   ; 0BCF _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 0BD1 _ C7. 45, F8, 00000009
        jmp     ?_046                                   ; 0BD8 _ EB, 42

?_043:  mov     eax, dword [ebp+8H]                     ; 0BDA _ 8B. 45, 08
        and     eax, 0FH                                ; 0BDD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 0BE0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0BE3 _ 8B. 45, 08
        shr     eax, 4                                  ; 0BE6 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0BE9 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 0BEC _ 83. 7D, FC, 09
        jle     ?_044                                   ; 0BF0 _ 7E, 14
        mov     eax, dword [ebp-4H]                     ; 0BF2 _ 8B. 45, FC
        add     eax, 55                                 ; 0BF5 _ 83. C0, 37
        mov     edx, eax                                ; 0BF8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0BFA _ 8B. 45, F8
        add     eax, str.1678                           ; 0BFD _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C02 _ 88. 10
        jmp     ?_045                                   ; 0C04 _ EB, 12

?_044:  mov     eax, dword [ebp-4H]                     ; 0C06 _ 8B. 45, FC
        add     eax, 48                                 ; 0C09 _ 83. C0, 30
        mov     edx, eax                                ; 0C0C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0C0E _ 8B. 45, F8
        add     eax, str.1678                           ; 0C11 _ 05, 00000220(d)
        mov     byte [eax], dl                          ; 0C16 _ 88. 10
?_045:  sub     dword [ebp-8H], 1                       ; 0C18 _ 83. 6D, F8, 01
?_046:  cmp     dword [ebp-8H], 1                       ; 0C1C _ 83. 7D, F8, 01
        jle     ?_047                                   ; 0C20 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0C22 _ 83. 7D, 08, 00
        jnz     ?_043                                   ; 0C26 _ 75, B2
?_047:  mov     eax, str.1678                           ; 0C28 _ B8, 00000220(d)
        leave                                           ; 0C2D _ C9
        ret                                             ; 0C2E _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C2F _ 55
        mov     ebp, esp                                ; 0C30 _ 89. E5
        sub     esp, 8                                  ; 0C32 _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0C35 _ 83. EC, 0C
        push    100                                     ; 0C38 _ 6A, 64
        call    io_in8                                  ; 0C3A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C3F _ 83. C4, 10
        and     eax, 02H                                ; 0C42 _ 83. E0, 02
        test    eax, eax                                ; 0C45 _ 85. C0
        jnz     ?_049                                   ; 0C47 _ 75, 02
        jmp     ?_050                                   ; 0C49 _ EB, 02

?_049:  jmp     ?_048                                   ; 0C4B _ EB, E8

?_050:  leave                                           ; 0C4D _ C9
        ret                                             ; 0C4E _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C4F _ 55
        mov     ebp, esp                                ; 0C50 _ 89. E5
        sub     esp, 8                                  ; 0C52 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C55 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C5A _ 83. EC, 08
        push    96                                      ; 0C5D _ 6A, 60
        push    100                                     ; 0C5F _ 6A, 64
        call    io_out8                                 ; 0C61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C66 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C69 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C6E _ 83. EC, 08
        push    71                                      ; 0C71 _ 6A, 47
        push    96                                      ; 0C73 _ 6A, 60
        call    io_out8                                 ; 0C75 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C7A _ 83. C4, 10
        nop                                             ; 0C7D _ 90
        leave                                           ; 0C7E _ C9
        ret                                             ; 0C7F _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C80 _ 55
        mov     ebp, esp                                ; 0C81 _ 89. E5
        sub     esp, 8                                  ; 0C83 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C86 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C8B _ 83. EC, 08
        push    212                                     ; 0C8E _ 68, 000000D4
        push    100                                     ; 0C93 _ 6A, 64
        call    io_out8                                 ; 0C95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C9A _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C9D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CA2 _ 83. EC, 08
        push    244                                     ; 0CA5 _ 68, 000000F4
        push    96                                      ; 0CAA _ 6A, 60
        call    io_out8                                 ; 0CAC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB1 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CB4 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CB7 _ C6. 40, 03, 00
        nop                                             ; 0CBB _ 90
        leave                                           ; 0CBC _ C9
        ret                                             ; 0CBD _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CBE _ 55
        mov     ebp, esp                                ; 0CBF _ 89. E5
        sub     esp, 24                                 ; 0CC1 _ 83. EC, 18
        sub     esp, 8                                  ; 0CC4 _ 83. EC, 08
        push    32                                      ; 0CC7 _ 6A, 20
        push    160                                     ; 0CC9 _ 68, 000000A0
        call    io_out8                                 ; 0CCE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD3 _ 83. C4, 10
        sub     esp, 8                                  ; 0CD6 _ 83. EC, 08
        push    32                                      ; 0CD9 _ 6A, 20
        push    32                                      ; 0CDB _ 6A, 20
        call    io_out8                                 ; 0CDD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CE2 _ 83. C4, 10
        sub     esp, 12                                 ; 0CE5 _ 83. EC, 0C
        push    96                                      ; 0CE8 _ 6A, 60
        call    io_in8                                  ; 0CEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEF _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0CF2 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0CF5 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0CF9 _ 83. EC, 08
        push    eax                                     ; 0CFC _ 50
        push    mouseinfo                               ; 0CFD _ 68, 00000120(d)
        call    fifo8_put                               ; 0D02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D07 _ 83. C4, 10
        leave                                           ; 0D0A _ C9
        ret                                             ; 0D0B _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D0C _ 55
        mov     ebp, esp                                ; 0D0D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D0F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D12 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D15 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D18 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D1B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D1E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D20 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D23 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D26 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D29 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D2C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D33 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D36 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D3D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D40 _ C7. 40, 08, 00000000
        nop                                             ; 0D47 _ 90
        pop     ebp                                     ; 0D48 _ 5D
        ret                                             ; 0D49 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D4A _ 55
        mov     ebp, esp                                ; 0D4B _ 89. E5
        sub     esp, 4                                  ; 0D4D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D50 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D53 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D56 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D59 _ 8B. 40, 10
        test    eax, eax                                ; 0D5C _ 85. C0
        jnz     ?_051                                   ; 0D5E _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D60 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D63 _ 8B. 40, 14
        or      eax, 01H                                ; 0D66 _ 83. C8, 01
        mov     edx, eax                                ; 0D69 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D6B _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D6E _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D71 _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0D76 _ EB, 50

?_051:  mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D7B _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D7D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D80 _ 8B. 40, 04
        add     edx, eax                                ; 0D83 _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 0D85 _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 0D89 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D8E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D91 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D94 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D97 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D9A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D9D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DA0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DA3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DA6 _ 39. C2
        jnz     ?_052                                   ; 0DA8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DAA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DAD _ C7. 40, 04, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0DB4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DB7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DBA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DBD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DC0 _ 89. 50, 10
        mov     eax, 0                                  ; 0DC3 _ B8, 00000000
?_053:  leave                                           ; 0DC8 _ C9
        ret                                             ; 0DC9 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0DCA _ 55
        mov     ebp, esp                                ; 0DCB _ 89. E5
        sub     esp, 16                                 ; 0DCD _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0DD0 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0DD3 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0DD6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DD9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DDC _ 39. C2
        jnz     ?_054                                   ; 0DDE _ 75, 07
        mov     eax, 4294967295                         ; 0DE0 _ B8, FFFFFFFF
        jmp     ?_056                                   ; 0DE5 _ EB, 51

?_054:  mov     eax, dword [ebp+8H]                     ; 0DE7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DEA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DEC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0DEF _ 8B. 40, 08
        add     eax, edx                                ; 0DF2 _ 01. D0
        movzx   eax, byte [eax]                         ; 0DF4 _ 0F B6. 00
        movzx   eax, al                                 ; 0DF7 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0DFA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DFD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E00 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E03 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E06 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E09 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E0C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E0F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E12 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E15 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E18 _ 39. C2
        jnz     ?_055                                   ; 0E1A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0E1C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E1F _ C7. 40, 08, 00000000
?_055:  mov     eax, dword [ebp+8H]                     ; 0E26 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E29 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E2C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E2F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E32 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E35 _ 8B. 45, FC
?_056:  leave                                           ; 0E38 _ C9
        ret                                             ; 0E39 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E3A _ 55
        mov     ebp, esp                                ; 0E3B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E3D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E40 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E43 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E46 _ 8B. 40, 10
        sub     edx, eax                                ; 0E49 _ 29. C2
        mov     eax, edx                                ; 0E4B _ 89. D0
        pop     ebp                                     ; 0E4D _ 5D
        ret                                             ; 0E4E _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E4F _ 55
        mov     ebp, esp                                ; 0E50 _ 89. E5
        sub     esp, 4                                  ; 0E52 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E55 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E58 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E5B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E5E _ 0F B6. 40, 03
        test    al, al                                  ; 0E62 _ 84. C0
        jnz     ?_058                                   ; 0E64 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E66 _ 80. 7D, FC, FA
        jnz     ?_057                                   ; 0E6A _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E6C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E6F _ C6. 40, 03, 01
?_057:  mov     eax, 0                                  ; 0E73 _ B8, 00000000
        jmp     ?_065                                   ; 0E78 _ E9, 0000010F

?_058:  mov     eax, dword [ebp+8H]                     ; 0E7D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0E80 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 0E84 _ 3C, 01
        jnz     ?_060                                   ; 0E86 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 0E88 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E8C _ 25, 000000C8
        cmp     eax, 8                                  ; 0E91 _ 83. F8, 08
        jnz     ?_059                                   ; 0E94 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 0E96 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0E99 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 0E9D _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0E9F _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0EA2 _ C6. 40, 03, 02
?_059:  mov     eax, 0                                  ; 0EA6 _ B8, 00000000
        jmp     ?_065                                   ; 0EAB _ E9, 000000DC

?_060:  mov     eax, dword [ebp+8H]                     ; 0EB0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0EB3 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 0EB7 _ 3C, 02
        jnz     ?_061                                   ; 0EB9 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 0EBB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EBE _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 0EC2 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EC5 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0EC8 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0ECC _ B8, 00000000
        jmp     ?_065                                   ; 0ED1 _ E9, 000000B6

?_061:  mov     eax, dword [ebp+8H]                     ; 0ED6 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 0ED9 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 0EDD _ 3C, 03
        jne     ?_064                                   ; 0EDF _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 0EE5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 0EE8 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 0EEC _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0EEF _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EF2 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0EF6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0EF9 _ 0F B6. 00
        movzx   eax, al                                 ; 0EFC _ 0F B6. C0
        and     eax, 07H                                ; 0EFF _ 83. E0, 07
        mov     edx, eax                                ; 0F02 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F04 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F07 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F0A _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 0F0D _ 0F B6. 40, 01
        movzx   edx, al                                 ; 0F11 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F14 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F17 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F1A _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 0F1D _ 0F B6. 40, 02
        movzx   edx, al                                 ; 0F21 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F24 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F27 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F2A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F2D _ 0F B6. 00
        movzx   eax, al                                 ; 0F30 _ 0F B6. C0
        and     eax, 10H                                ; 0F33 _ 83. E0, 10
        test    eax, eax                                ; 0F36 _ 85. C0
        jz      ?_062                                   ; 0F38 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F3A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F3D _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F40 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F47 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F4A _ 89. 50, 04
?_062:  mov     eax, dword [ebp+8H]                     ; 0F4D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 0F50 _ 0F B6. 00
        movzx   eax, al                                 ; 0F53 _ 0F B6. C0
        and     eax, 20H                                ; 0F56 _ 83. E0, 20
        test    eax, eax                                ; 0F59 _ 85. C0
        jz      ?_063                                   ; 0F5B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F5D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F60 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F63 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F68 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F6A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F6D _ 89. 50, 08
?_063:  mov     eax, dword [ebp+8H]                     ; 0F70 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F73 _ 8B. 40, 08
        neg     eax                                     ; 0F76 _ F7. D8
        mov     edx, eax                                ; 0F78 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F7A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F7D _ 89. 50, 08
        mov     eax, 1                                  ; 0F80 _ B8, 00000001
        jmp     ?_065                                   ; 0F85 _ EB, 05

?_064:  mov     eax, 4294967295                         ; 0F87 _ B8, FFFFFFFF
?_065:  leave                                           ; 0F8C _ C9
        ret                                             ; 0F8D _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F8E _ 55
        mov     ebp, esp                                ; 0F8F _ 89. E5
        sub     esp, 56                                 ; 0F91 _ 83. EC, 38
        mov     dword [ebp-30H], 0                      ; 0F94 _ C7. 45, D0, 00000000
        mov     dword [ebp-2CH], 0                      ; 0F9B _ C7. 45, D4, 00000000
        mov     dword [ebp-28H], 104                    ; 0FA2 _ C7. 45, D8, 00000068
        mov     dword [ebp-24H], 80                     ; 0FA9 _ C7. 45, DC, 00000050
        push    100                                     ; 0FB0 _ 6A, 64
        push    dword [ebp+14H]                         ; 0FB2 _ FF. 75, 14
        push    0                                       ; 0FB5 _ 6A, 00
        push    0                                       ; 0FB7 _ 6A, 00
        push    14                                      ; 0FB9 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FBB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FBE _ FF. 75, 0C
        call    boxfill8                                ; 0FC1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FC6 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FC9 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FCC _ 0F BE. C0
        sub     esp, 8                                  ; 0FCF _ 83. EC, 08
        push    ?_087                                   ; 0FD2 _ 68, 00000015(d)
        push    eax                                     ; 0FD7 _ 50
        push    dword [ebp-2CH]                         ; 0FD8 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 0FDB _ FF. 75, D0
        push    dword [ebp+14H]                         ; 0FDE _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FE1 _ FF. 75, 0C
        call    showString                              ; 0FE4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FE9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FEC _ 8B. 45, 10
        sub     esp, 12                                 ; 0FEF _ 83. EC, 0C
        push    eax                                     ; 0FF2 _ 50
        call    intToHexStr                             ; 0FF3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FF8 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0FFB _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 0FFE _ 8B. 45, 18
        movsx   eax, al                                 ; 1001 _ 0F BE. C0
        sub     esp, 8                                  ; 1004 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1007 _ FF. 75, E0
        push    eax                                     ; 100A _ 50
        push    dword [ebp-2CH]                         ; 100B _ FF. 75, D4
        push    dword [ebp-28H]                         ; 100E _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1011 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1014 _ FF. 75, 0C
        call    showString                              ; 1017 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 101C _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 101F _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1023 _ 8B. 45, 18
        movsx   eax, al                                 ; 1026 _ 0F BE. C0
        sub     esp, 8                                  ; 1029 _ 83. EC, 08
        push    ?_088                                   ; 102C _ 68, 0000001F(d)
        push    eax                                     ; 1031 _ 50
        push    dword [ebp-2CH]                         ; 1032 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1035 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1038 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 103B _ FF. 75, 0C
        call    showString                              ; 103E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1043 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1046 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1049 _ 8B. 00
        sub     esp, 12                                 ; 104B _ 83. EC, 0C
        push    eax                                     ; 104E _ 50
        call    intToHexStr                             ; 104F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1054 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1057 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 105A _ 8B. 45, 18
        movsx   eax, al                                 ; 105D _ 0F BE. C0
        sub     esp, 8                                  ; 1060 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1063 _ FF. 75, E4
        push    eax                                     ; 1066 _ 50
        push    dword [ebp-2CH]                         ; 1067 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 106A _ FF. 75, D8
        push    dword [ebp+14H]                         ; 106D _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1070 _ FF. 75, 0C
        call    showString                              ; 1073 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1078 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 107B _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 107F _ 8B. 45, 18
        movsx   eax, al                                 ; 1082 _ 0F BE. C0
        sub     esp, 8                                  ; 1085 _ 83. EC, 08
        push    ?_089                                   ; 1088 _ 68, 0000002B(d)
        push    eax                                     ; 108D _ 50
        push    dword [ebp-2CH]                         ; 108E _ FF. 75, D4
        push    dword [ebp-30H]                         ; 1091 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 1094 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1097 _ FF. 75, 0C
        call    showString                              ; 109A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 109F _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10A2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10A5 _ 8B. 40, 04
        sub     esp, 12                                 ; 10A8 _ 83. EC, 0C
        push    eax                                     ; 10AB _ 50
        call    intToHexStr                             ; 10AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10B1 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 10B4 _ 89. 45, E8
        mov     eax, dword [ebp+18H]                    ; 10B7 _ 8B. 45, 18
        movsx   eax, al                                 ; 10BA _ 0F BE. C0
        sub     esp, 8                                  ; 10BD _ 83. EC, 08
        push    dword [ebp-18H]                         ; 10C0 _ FF. 75, E8
        push    eax                                     ; 10C3 _ 50
        push    dword [ebp-2CH]                         ; 10C4 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 10C7 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 10CA _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10CD _ FF. 75, 0C
        call    showString                              ; 10D0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10D5 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 10D8 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 10DC _ 8B. 45, 18
        movsx   eax, al                                 ; 10DF _ 0F BE. C0
        sub     esp, 8                                  ; 10E2 _ 83. EC, 08
        push    ?_090                                   ; 10E5 _ 68, 00000037(d)
        push    eax                                     ; 10EA _ 50
        push    dword [ebp-2CH]                         ; 10EB _ FF. 75, D4
        push    dword [ebp-30H]                         ; 10EE _ FF. 75, D0
        push    dword [ebp+14H]                         ; 10F1 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10F4 _ FF. 75, 0C
        call    showString                              ; 10F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10FC _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10FF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1102 _ 8B. 40, 08
        sub     esp, 12                                 ; 1105 _ 83. EC, 0C
        push    eax                                     ; 1108 _ 50
        call    intToHexStr                             ; 1109 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 110E _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 1111 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1114 _ 8B. 45, 18
        movsx   eax, al                                 ; 1117 _ 0F BE. C0
        sub     esp, 8                                  ; 111A _ 83. EC, 08
        push    dword [ebp-14H]                         ; 111D _ FF. 75, EC
        push    eax                                     ; 1120 _ 50
        push    dword [ebp-2CH]                         ; 1121 _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1124 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1127 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 112A _ FF. 75, 0C
        call    showString                              ; 112D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1132 _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1135 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1139 _ 8B. 45, 18
        movsx   eax, al                                 ; 113C _ 0F BE. C0
        sub     esp, 8                                  ; 113F _ 83. EC, 08
        push    ?_091                                   ; 1142 _ 68, 00000043(d)
        push    eax                                     ; 1147 _ 50
        push    dword [ebp-2CH]                         ; 1148 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 114B _ FF. 75, D0
        push    dword [ebp+14H]                         ; 114E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1151 _ FF. 75, 0C
        call    showString                              ; 1154 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1159 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 115C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 115F _ 8B. 40, 0C
        sub     esp, 12                                 ; 1162 _ 83. EC, 0C
        push    eax                                     ; 1165 _ 50
        call    intToHexStr                             ; 1166 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 116B _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 116E _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 1171 _ 8B. 45, 18
        movsx   eax, al                                 ; 1174 _ 0F BE. C0
        sub     esp, 8                                  ; 1177 _ 83. EC, 08
        push    dword [ebp-10H]                         ; 117A _ FF. 75, F0
        push    eax                                     ; 117D _ 50
        push    dword [ebp-2CH]                         ; 117E _ FF. 75, D4
        push    dword [ebp-28H]                         ; 1181 _ FF. 75, D8
        push    dword [ebp+14H]                         ; 1184 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1187 _ FF. 75, 0C
        call    showString                              ; 118A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 118F _ 83. C4, 20
        add     dword [ebp-2CH], 16                     ; 1192 _ 83. 45, D4, 10
        mov     eax, dword [ebp+18H]                    ; 1196 _ 8B. 45, 18
        movsx   eax, al                                 ; 1199 _ 0F BE. C0
        sub     esp, 8                                  ; 119C _ 83. EC, 08
        push    ?_092                                   ; 119F _ 68, 00000050(d)
        push    eax                                     ; 11A4 _ 50
        push    dword [ebp-2CH]                         ; 11A5 _ FF. 75, D4
        push    dword [ebp-30H]                         ; 11A8 _ FF. 75, D0
        push    dword [ebp+14H]                         ; 11AB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11AE _ FF. 75, 0C
        call    showString                              ; 11B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11B6 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11B9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11BC _ 8B. 40, 10
        sub     esp, 12                                 ; 11BF _ 83. EC, 0C
        push    eax                                     ; 11C2 _ 50
        call    intToHexStr                             ; 11C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11C8 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11CB _ 89. 45, F4
        mov     eax, dword [ebp+18H]                    ; 11CE _ 8B. 45, 18
        movsx   eax, al                                 ; 11D1 _ 0F BE. C0
        sub     esp, 8                                  ; 11D4 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 11D7 _ FF. 75, F4
        push    eax                                     ; 11DA _ 50
        push    dword [ebp-2CH]                         ; 11DB _ FF. 75, D4
        push    dword [ebp-28H]                         ; 11DE _ FF. 75, D8
        push    dword [ebp+14H]                         ; 11E1 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11E4 _ FF. 75, 0C
        call    showString                              ; 11E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11EC _ 83. C4, 20
        leave                                           ; 11EF _ C9
        ret                                             ; 11F0 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 11F1 _ 55
        mov     ebp, esp                                ; 11F2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 11F4 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 11F7 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 11FD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1200 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1207 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 120A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1211 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1214 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 121B _ 5D
        ret                                             ; 121C _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 121D _ 55
        mov     ebp, esp                                ; 121E _ 89. E5
        sub     esp, 16                                 ; 1220 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1223 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 122A _ C7. 45, F8, 00000000
        jmp     ?_067                                   ; 1231 _ EB, 14

?_066:  mov     eax, dword [ebp+8H]                     ; 1233 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1236 _ 8B. 55, F8
        add     edx, 2                                  ; 1239 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 123C _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1240 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1243 _ 83. 45, F8, 01
?_067:  mov     eax, dword [ebp+8H]                     ; 1247 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 124A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 124C _ 3B. 45, F8
        ja      ?_066                                   ; 124F _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1251 _ 8B. 45, FC
        leave                                           ; 1254 _ C9
        ret                                             ; 1255 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1256 _ 55
        mov     ebp, esp                                ; 1257 _ 89. E5
        sub     esp, 16                                 ; 1259 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 125C _ C7. 45, F8, 00000000
        jmp     ?_071                                   ; 1263 _ EB, 67

?_068:  mov     eax, dword [ebp+8H]                     ; 1265 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1268 _ 8B. 55, F8
        add     edx, 2                                  ; 126B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 126E _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1272 _ 3B. 45, 0C
        jc      ?_070                                   ; 1275 _ 72, 51
        mov     eax, dword [ebp+8H]                     ; 1277 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 127A _ 8B. 55, F8
        add     edx, 2                                  ; 127D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1280 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1283 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1286 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1289 _ 8B. 55, F8
        add     edx, 2                                  ; 128C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 128F _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1293 _ 2B. 45, 0C
        mov     edx, eax                                ; 1296 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1298 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 129B _ 8B. 4D, F8
        add     ecx, 2                                  ; 129E _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12A1 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12A5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 12A8 _ 8B. 55, F8
        add     edx, 2                                  ; 12AB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12AE _ 8B. 44 D0, 04
        test    eax, eax                                ; 12B2 _ 85. C0
        jnz     ?_069                                   ; 12B4 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 12B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12B9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 12BB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 12BE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 12C1 _ 89. 10
?_069:  mov     eax, dword [ebp-4H]                     ; 12C3 _ 8B. 45, FC
        jmp     ?_072                                   ; 12C6 _ EB, 13

?_070:  add     dword [ebp-8H], 1                       ; 12C8 _ 83. 45, F8, 01
?_071:  mov     eax, dword [ebp+8H]                     ; 12CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12CF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 12D1 _ 3B. 45, F8
        ja      ?_068                                   ; 12D4 _ 77, 8F
        mov     eax, 0                                  ; 12D6 _ B8, 00000000
?_072:  leave                                           ; 12DB _ C9
        ret                                             ; 12DC _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 12DD _ 55
        mov     ebp, esp                                ; 12DE _ 89. E5
        push    ebx                                     ; 12E0 _ 53
        sub     esp, 16                                 ; 12E1 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 12E4 _ C7. 45, F4, 00000000
        jmp     ?_075                                   ; 12EB _ EB, 17

?_073:  mov     eax, dword [ebp+8H]                     ; 12ED _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 12F0 _ 8B. 55, F4
        add     edx, 2                                  ; 12F3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12F6 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 12F9 _ 3B. 45, 0C
        jbe     ?_074                                   ; 12FC _ 76, 02
        jmp     ?_076                                   ; 12FE _ EB, 0E

?_074:  add     dword [ebp-0CH], 1                      ; 1300 _ 83. 45, F4, 01
?_075:  mov     eax, dword [ebp+8H]                     ; 1304 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1307 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1309 _ 3B. 45, F4
        jg      ?_073                                   ; 130C _ 7F, DF
?_076:  cmp     dword [ebp-0CH], 0                      ; 130E _ 83. 7D, F4, 00
        jle     ?_078                                   ; 1312 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1318 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 131B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 131E _ 8B. 45, 08
        add     edx, 2                                  ; 1321 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1324 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1327 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 132A _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 132D _ 8B. 45, 08
        add     ecx, 2                                  ; 1330 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1333 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1337 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1339 _ 3B. 45, 0C
        jne     ?_078                                   ; 133C _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1342 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1345 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1348 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 134B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 134E _ 8B. 45, 08
        add     edx, 2                                  ; 1351 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1354 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1358 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 135B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 135E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1361 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1364 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1368 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 136B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 136D _ 3B. 45, F4
        jle     ?_077                                   ; 1370 _ 7E, 56
        mov     edx, dword [ebp+0CH]                    ; 1372 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1375 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1378 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 137B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 137E _ 8B. 55, F4
        add     edx, 2                                  ; 1381 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1384 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1387 _ 39. C1
        jnz     ?_077                                   ; 1389 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 138B _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 138E _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1391 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1394 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1397 _ 8B. 45, 08
        add     edx, 2                                  ; 139A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 139D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13A1 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 13A4 _ 8B. 4D, F4
        add     ecx, 2                                  ; 13A7 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13AA _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 13AE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13B1 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13B4 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13B7 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13BE _ 8B. 00
        lea     edx, [eax-1H]                           ; 13C0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13C3 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 13C6 _ 89. 10
?_077:  mov     eax, 0                                  ; 13C8 _ B8, 00000000
        jmp     ?_084                                   ; 13CD _ E9, 0000011A

?_078:  mov     eax, dword [ebp+8H]                     ; 13D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13D5 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 13D7 _ 3B. 45, F4
        jle     ?_079                                   ; 13DA _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 13DC _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13DF _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13E2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13E5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 13E8 _ 8B. 55, F4
        add     edx, 2                                  ; 13EB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13EE _ 8B. 04 D0
        cmp     ecx, eax                                ; 13F1 _ 39. C1
        jnz     ?_079                                   ; 13F3 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 13F5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 13F8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 13FB _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 13FE _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1401 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1404 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1407 _ 8B. 55, F4
        add     edx, 2                                  ; 140A _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 140D _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1411 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1414 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1417 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 141A _ 8B. 55, F4
        add     edx, 2                                  ; 141D _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1420 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1424 _ B8, 00000000
        jmp     ?_084                                   ; 1429 _ E9, 000000BE

?_079:  mov     eax, dword [ebp+8H]                     ; 142E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1431 _ 8B. 00
        cmp     eax, 5                                  ; 1433 _ 83. F8, 05
        jg      ?_083                                   ; 1436 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 143C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 143F _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1441 _ 89. 45, F8
        jmp     ?_081                                   ; 1444 _ EB, 28

?_080:  mov     eax, dword [ebp-8H]                     ; 1446 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1449 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 144C _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 144F _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1452 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1455 _ 8B. 45, 08
        add     edx, 2                                  ; 1458 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 145B _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 145E _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1460 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1463 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1466 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 146A _ 83. 6D, F8, 01
?_081:  mov     eax, dword [ebp-8H]                     ; 146E _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1471 _ 3B. 45, F4
        jg      ?_080                                   ; 1474 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1476 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1479 _ 8B. 00
        lea     edx, [eax+1H]                           ; 147B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 147E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1481 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1483 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1486 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1489 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 148C _ 8B. 00
        cmp     edx, eax                                ; 148E _ 39. C2
        jge     ?_082                                   ; 1490 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1492 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1495 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1497 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 149A _ 89. 50, 04
?_082:  mov     eax, dword [ebp+8H]                     ; 149D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 14A0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 14A3 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14A6 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14A9 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 14AC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 14AF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 14B2 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 14B5 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 14B8 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 14BC _ B8, 00000000
        jmp     ?_084                                   ; 14C1 _ EB, 29

?_083:  mov     eax, dword [ebp+8H]                     ; 14C3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 14C6 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 14C9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14CC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 14CF _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 14D2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 14D5 _ 8B. 40, 08
        mov     edx, eax                                ; 14D8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14DA _ 8B. 45, 10
        add     eax, edx                                ; 14DD _ 01. D0
        mov     edx, eax                                ; 14DF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 14E1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 14E4 _ 89. 50, 08
        mov     eax, 4294967295                         ; 14E7 _ B8, FFFFFFFF
?_084:  add     esp, 16                                 ; 14EC _ 83. C4, 10
        pop     ebx                                     ; 14EF _ 5B
        pop     ebp                                     ; 14F0 _ 5D
        ret                                             ; 14F1 _ C3
; memman_free End of function


?_085:                                                  ; byte
        db 74H, 6FH, 74H, 61H, 6CH, 20H, 6DH, 65H       ; 0000 _ total me
        db 6DH, 6FH, 72H, 79H, 20H, 69H, 73H, 3AH       ; 0008 _ mory is:
        db 20H, 00H                                     ; 0010 _  .

?_086:                                                  ; byte
        db 4DH, 42H, 00H                                ; 0012 _ MB.

?_087:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0015 _ page is:
        db 20H, 00H                                     ; 001D _  .

?_088:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 001F _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0027 _ L: .

?_089:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002B _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0033 _ H: .

?_090:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0037 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 003F _ w: .

?_091:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0043 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004B _ gh: .

?_092:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0050 _ type: .


memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_093:  db 00H                                          ; 0006 _ .

?_094:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1583:                                         ; byte
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

cursor.1630:                                            ; byte
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

?_095:  resw    1                                       ; 0104

?_096:  resw    1                                       ; 0106

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

str.1678:                                               ; byte
        resb    1                                       ; 0220

?_097:  resb    9                                       ; 0221

?_098:  resb    1                                       ; 022A


