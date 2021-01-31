; Disassembly of file: ckernel.o
; Fri Jan 29 20:42:02 2021
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
        mov     dword [ebp-10H], eax                    ; 001D _ 89. 45, F0
        mov     eax, dword [?_093]                      ; 0020 _ A1, 00000104(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 000001F8(d)
        mov     ax, word [?_094]                        ; 002B _ 66: A1, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ysize], eax                      ; 0032 _ A3, 000001FC(d)
        sub     esp, 4                                  ; 0037 _ 83. EC, 04
        push    keybuf                                  ; 003A _ 68, 00000140(d)
        push    32                                      ; 003F _ 6A, 20
        push    keyinfo                                 ; 0041 _ 68, 00000108(d)
        call    fifo8_init                              ; 0046 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004B _ 83. C4, 10
        sub     esp, 4                                  ; 004E _ 83. EC, 04
        push    mousebuf                                ; 0051 _ 68, 00000160(d)
        push    128                                     ; 0056 _ 68, 00000080
        push    mouseinfo                               ; 005B _ 68, 00000120(d)
        call    fifo8_init                              ; 0060 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0065 _ 83. C4, 10
        call    init_palette                            ; 0068 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 006D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ysize]                      ; 0072 _ A1, 000001FC(d)
        lea     ecx, [eax-1DH]                          ; 0077 _ 8D. 48, E3
        mov     eax, dword [xsize]                      ; 007A _ A1, 000001F8(d)
        lea     edx, [eax-1H]                           ; 007F _ 8D. 50, FF
        mov     eax, dword [xsize]                      ; 0082 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0087 _ 83. EC, 04
        push    ecx                                     ; 008A _ 51
        push    edx                                     ; 008B _ 52
        push    0                                       ; 008C _ 6A, 00
        push    0                                       ; 008E _ 6A, 00
        push    14                                      ; 0090 _ 6A, 0E
        push    eax                                     ; 0092 _ 50
        push    dword [ebp-10H]                         ; 0093 _ FF. 75, F0
        call    boxfill8                                ; 0096 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 009B _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 009E _ A1, 000001FC(d)
        lea     ebx, [eax-1CH]                          ; 00A3 _ 8D. 58, E4
        mov     eax, dword [xsize]                      ; 00A6 _ A1, 000001F8(d)
        lea     ecx, [eax-1H]                           ; 00AB _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 00AE _ A1, 000001FC(d)
        lea     edx, [eax-1CH]                          ; 00B3 _ 8D. 50, E4
        mov     eax, dword [xsize]                      ; 00B6 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 00BB _ 83. EC, 04
        push    ebx                                     ; 00BE _ 53
        push    ecx                                     ; 00BF _ 51
        push    edx                                     ; 00C0 _ 52
        push    0                                       ; 00C1 _ 6A, 00
        push    8                                       ; 00C3 _ 6A, 08
        push    eax                                     ; 00C5 _ 50
        push    dword [ebp-10H]                         ; 00C6 _ FF. 75, F0
        call    boxfill8                                ; 00C9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00CE _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 00D1 _ A1, 000001FC(d)
        lea     ebx, [eax-1BH]                          ; 00D6 _ 8D. 58, E5
        mov     eax, dword [xsize]                      ; 00D9 _ A1, 000001F8(d)
        lea     ecx, [eax-1H]                           ; 00DE _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 00E1 _ A1, 000001FC(d)
        lea     edx, [eax-1BH]                          ; 00E6 _ 8D. 50, E5
        mov     eax, dword [xsize]                      ; 00E9 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 00EE _ 83. EC, 04
        push    ebx                                     ; 00F1 _ 53
        push    ecx                                     ; 00F2 _ 51
        push    edx                                     ; 00F3 _ 52
        push    0                                       ; 00F4 _ 6A, 00
        push    7                                       ; 00F6 _ 6A, 07
        push    eax                                     ; 00F8 _ 50
        push    dword [ebp-10H]                         ; 00F9 _ FF. 75, F0
        call    boxfill8                                ; 00FC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0101 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0104 _ A1, 000001FC(d)
        lea     ebx, [eax-1H]                           ; 0109 _ 8D. 58, FF
        mov     eax, dword [xsize]                      ; 010C _ A1, 000001F8(d)
        lea     ecx, [eax-1H]                           ; 0111 _ 8D. 48, FF
        mov     eax, dword [ysize]                      ; 0114 _ A1, 000001FC(d)
        lea     edx, [eax-1AH]                          ; 0119 _ 8D. 50, E6
        mov     eax, dword [xsize]                      ; 011C _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0121 _ 83. EC, 04
        push    ebx                                     ; 0124 _ 53
        push    ecx                                     ; 0125 _ 51
        push    edx                                     ; 0126 _ 52
        push    0                                       ; 0127 _ 6A, 00
        push    8                                       ; 0129 _ 6A, 08
        push    eax                                     ; 012B _ 50
        push    dword [ebp-10H]                         ; 012C _ FF. 75, F0
        call    boxfill8                                ; 012F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0134 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0137 _ A1, 000001FC(d)
        lea     ecx, [eax-18H]                          ; 013C _ 8D. 48, E8
        mov     eax, dword [ysize]                      ; 013F _ A1, 000001FC(d)
        lea     edx, [eax-18H]                          ; 0144 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0147 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 014C _ 83. EC, 04
        push    ecx                                     ; 014F _ 51
        push    59                                      ; 0150 _ 6A, 3B
        push    edx                                     ; 0152 _ 52
        push    3                                       ; 0153 _ 6A, 03
        push    7                                       ; 0155 _ 6A, 07
        push    eax                                     ; 0157 _ 50
        push    dword [ebp-10H]                         ; 0158 _ FF. 75, F0
        call    boxfill8                                ; 015B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0160 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0163 _ A1, 000001FC(d)
        lea     ecx, [eax-4H]                           ; 0168 _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 016B _ A1, 000001FC(d)
        lea     edx, [eax-18H]                          ; 0170 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0173 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0178 _ 83. EC, 04
        push    ecx                                     ; 017B _ 51
        push    2                                       ; 017C _ 6A, 02
        push    edx                                     ; 017E _ 52
        push    2                                       ; 017F _ 6A, 02
        push    7                                       ; 0181 _ 6A, 07
        push    eax                                     ; 0183 _ 50
        push    dword [ebp-10H]                         ; 0184 _ FF. 75, F0
        call    boxfill8                                ; 0187 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 018C _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 018F _ A1, 000001FC(d)
        lea     ecx, [eax-4H]                           ; 0194 _ 8D. 48, FC
        mov     eax, dword [ysize]                      ; 0197 _ A1, 000001FC(d)
        lea     edx, [eax-4H]                           ; 019C _ 8D. 50, FC
        mov     eax, dword [xsize]                      ; 019F _ A1, 000001F8(d)
        sub     esp, 4                                  ; 01A4 _ 83. EC, 04
        push    ecx                                     ; 01A7 _ 51
        push    59                                      ; 01A8 _ 6A, 3B
        push    edx                                     ; 01AA _ 52
        push    3                                       ; 01AB _ 6A, 03
        push    15                                      ; 01AD _ 6A, 0F
        push    eax                                     ; 01AF _ 50
        push    dword [ebp-10H]                         ; 01B0 _ FF. 75, F0
        call    boxfill8                                ; 01B3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B8 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01BB _ A1, 000001FC(d)
        lea     ecx, [eax-5H]                           ; 01C0 _ 8D. 48, FB
        mov     eax, dword [ysize]                      ; 01C3 _ A1, 000001FC(d)
        lea     edx, [eax-17H]                          ; 01C8 _ 8D. 50, E9
        mov     eax, dword [xsize]                      ; 01CB _ A1, 000001F8(d)
        sub     esp, 4                                  ; 01D0 _ 83. EC, 04
        push    ecx                                     ; 01D3 _ 51
        push    59                                      ; 01D4 _ 6A, 3B
        push    edx                                     ; 01D6 _ 52
        push    59                                      ; 01D7 _ 6A, 3B
        push    15                                      ; 01D9 _ 6A, 0F
        push    eax                                     ; 01DB _ 50
        push    dword [ebp-10H]                         ; 01DC _ FF. 75, F0
        call    boxfill8                                ; 01DF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E4 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 01E7 _ A1, 000001FC(d)
        lea     ecx, [eax-3H]                           ; 01EC _ 8D. 48, FD
        mov     eax, dword [ysize]                      ; 01EF _ A1, 000001FC(d)
        lea     edx, [eax-3H]                           ; 01F4 _ 8D. 50, FD
        mov     eax, dword [xsize]                      ; 01F7 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 01FC _ 83. EC, 04
        push    ecx                                     ; 01FF _ 51
        push    59                                      ; 0200 _ 6A, 3B
        push    edx                                     ; 0202 _ 52
        push    2                                       ; 0203 _ 6A, 02
        push    0                                       ; 0205 _ 6A, 00
        push    eax                                     ; 0207 _ 50
        push    dword [ebp-10H]                         ; 0208 _ FF. 75, F0
        call    boxfill8                                ; 020B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0210 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0213 _ A1, 000001FC(d)
        lea     ecx, [eax-3H]                           ; 0218 _ 8D. 48, FD
        mov     eax, dword [ysize]                      ; 021B _ A1, 000001FC(d)
        lea     edx, [eax-18H]                          ; 0220 _ 8D. 50, E8
        mov     eax, dword [xsize]                      ; 0223 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0228 _ 83. EC, 04
        push    ecx                                     ; 022B _ 51
        push    60                                      ; 022C _ 6A, 3C
        push    edx                                     ; 022E _ 52
        push    60                                      ; 022F _ 6A, 3C
        push    0                                       ; 0231 _ 6A, 00
        push    eax                                     ; 0233 _ 50
        push    dword [ebp-10H]                         ; 0234 _ FF. 75, F0
        call    boxfill8                                ; 0237 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 023C _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 023F _ A1, 000001FC(d)
        lea     esi, [eax-18H]                          ; 0244 _ 8D. 70, E8
        mov     eax, dword [xsize]                      ; 0247 _ A1, 000001F8(d)
        lea     ebx, [eax-4H]                           ; 024C _ 8D. 58, FC
        mov     eax, dword [ysize]                      ; 024F _ A1, 000001FC(d)
        lea     ecx, [eax-18H]                          ; 0254 _ 8D. 48, E8
        mov     eax, dword [xsize]                      ; 0257 _ A1, 000001F8(d)
        lea     edx, [eax-2FH]                          ; 025C _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 025F _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0264 _ 83. EC, 04
        push    esi                                     ; 0267 _ 56
        push    ebx                                     ; 0268 _ 53
        push    ecx                                     ; 0269 _ 51
        push    edx                                     ; 026A _ 52
        push    15                                      ; 026B _ 6A, 0F
        push    eax                                     ; 026D _ 50
        push    dword [ebp-10H]                         ; 026E _ FF. 75, F0
        call    boxfill8                                ; 0271 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0276 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 0279 _ A1, 000001FC(d)
        lea     esi, [eax-4H]                           ; 027E _ 8D. 70, FC
        mov     eax, dword [xsize]                      ; 0281 _ A1, 000001F8(d)
        lea     ebx, [eax-2FH]                          ; 0286 _ 8D. 58, D1
        mov     eax, dword [ysize]                      ; 0289 _ A1, 000001FC(d)
        lea     ecx, [eax-17H]                          ; 028E _ 8D. 48, E9
        mov     eax, dword [xsize]                      ; 0291 _ A1, 000001F8(d)
        lea     edx, [eax-2FH]                          ; 0296 _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 0299 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 029E _ 83. EC, 04
        push    esi                                     ; 02A1 _ 56
        push    ebx                                     ; 02A2 _ 53
        push    ecx                                     ; 02A3 _ 51
        push    edx                                     ; 02A4 _ 52
        push    15                                      ; 02A5 _ 6A, 0F
        push    eax                                     ; 02A7 _ 50
        push    dword [ebp-10H]                         ; 02A8 _ FF. 75, F0
        call    boxfill8                                ; 02AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B0 _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 02B3 _ A1, 000001FC(d)
        lea     esi, [eax-3H]                           ; 02B8 _ 8D. 70, FD
        mov     eax, dword [xsize]                      ; 02BB _ A1, 000001F8(d)
        lea     ebx, [eax-4H]                           ; 02C0 _ 8D. 58, FC
        mov     eax, dword [ysize]                      ; 02C3 _ A1, 000001FC(d)
        lea     ecx, [eax-3H]                           ; 02C8 _ 8D. 48, FD
        mov     eax, dword [xsize]                      ; 02CB _ A1, 000001F8(d)
        lea     edx, [eax-2FH]                          ; 02D0 _ 8D. 50, D1
        mov     eax, dword [xsize]                      ; 02D3 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 02D8 _ 83. EC, 04
        push    esi                                     ; 02DB _ 56
        push    ebx                                     ; 02DC _ 53
        push    ecx                                     ; 02DD _ 51
        push    edx                                     ; 02DE _ 52
        push    7                                       ; 02DF _ 6A, 07
        push    eax                                     ; 02E1 _ 50
        push    dword [ebp-10H]                         ; 02E2 _ FF. 75, F0
        call    boxfill8                                ; 02E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02EA _ 83. C4, 20
        mov     eax, dword [ysize]                      ; 02ED _ A1, 000001FC(d)
        lea     esi, [eax-3H]                           ; 02F2 _ 8D. 70, FD
        mov     eax, dword [xsize]                      ; 02F5 _ A1, 000001F8(d)
        lea     ebx, [eax-3H]                           ; 02FA _ 8D. 58, FD
        mov     eax, dword [ysize]                      ; 02FD _ A1, 000001FC(d)
        lea     ecx, [eax-18H]                          ; 0302 _ 8D. 48, E8
        mov     eax, dword [xsize]                      ; 0305 _ A1, 000001F8(d)
        lea     edx, [eax-3H]                           ; 030A _ 8D. 50, FD
        mov     eax, dword [xsize]                      ; 030D _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0312 _ 83. EC, 04
        push    esi                                     ; 0315 _ 56
        push    ebx                                     ; 0316 _ 53
        push    ecx                                     ; 0317 _ 51
        push    edx                                     ; 0318 _ 52
        push    7                                       ; 0319 _ 6A, 07
        push    eax                                     ; 031B _ 50
        push    dword [ebp-10H]                         ; 031C _ FF. 75, F0
        call    boxfill8                                ; 031F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0324 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 0327 _ A1, 000001F8(d)
        sub     eax, 16                                 ; 032C _ 83. E8, 10
        mov     edx, eax                                ; 032F _ 89. C2
        shr     edx, 31                                 ; 0331 _ C1. EA, 1F
        add     eax, edx                                ; 0334 _ 01. D0
        sar     eax, 1                                  ; 0336 _ D1. F8
        mov     dword [mx], eax                         ; 0338 _ A3, 000001F0(d)
        mov     eax, dword [ysize]                      ; 033D _ A1, 000001FC(d)
        sub     eax, 44                                 ; 0342 _ 83. E8, 2C
        mov     edx, eax                                ; 0345 _ 89. C2
        shr     edx, 31                                 ; 0347 _ C1. EA, 1F
        add     eax, edx                                ; 034A _ 01. D0
        sar     eax, 1                                  ; 034C _ D1. F8
        mov     dword [my], eax                         ; 034E _ A3, 000001F4(d)
        sub     esp, 8                                  ; 0353 _ 83. EC, 08
        push    14                                      ; 0356 _ 6A, 0E
        push    mcursor                                 ; 0358 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 035D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0362 _ 83. C4, 10
        mov     ecx, dword [my]                         ; 0365 _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 036B _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 0371 _ A1, 000001F8(d)
        push    16                                      ; 0376 _ 6A, 10
        push    mcursor                                 ; 0378 _ 68, 00000000(d)
        push    ecx                                     ; 037D _ 51
        push    edx                                     ; 037E _ 52
        push    16                                      ; 037F _ 6A, 10
        push    16                                      ; 0381 _ 6A, 10
        push    eax                                     ; 0383 _ 50
        push    dword [ebp-10H]                         ; 0384 _ FF. 75, F0
        call    putblock                                ; 0387 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 038C _ 83. C4, 20
        call    get_memory_block_count                  ; 038F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0394 _ 89. 45, EC
        call    get_adr_buffer                          ; 0397 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 039C _ 89. 45, E8
        mov     eax, dword [memman]                     ; 039F _ A1, 00000000(d)
        sub     esp, 12                                 ; 03A4 _ 83. EC, 0C
        push    eax                                     ; 03A7 _ 50
        call    memman_init                             ; 03A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AD _ 83. C4, 10
        mov     eax, dword [memman]                     ; 03B0 _ A1, 00000000(d)
        sub     esp, 4                                  ; 03B5 _ 83. EC, 04
        push    1072594944                              ; 03B8 _ 68, 3FEE8000
        push    17301504                                ; 03BD _ 68, 01080000
        push    eax                                     ; 03C2 _ 50
        call    memman_free                             ; 03C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C8 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 03CB _ A1, 00000000(d)
        sub     esp, 12                                 ; 03D0 _ 83. EC, 0C
        push    eax                                     ; 03D3 _ 50
        call    memman_total                            ; 03D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D9 _ 83. C4, 10
        shr     eax, 20                                 ; 03DC _ C1. E8, 14
        mov     dword [ebp-1CH], eax                    ; 03DF _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 03E2 _ 8B. 45, E4
        sub     esp, 12                                 ; 03E5 _ 83. EC, 0C
        push    eax                                     ; 03E8 _ 50
        call    intToHexStr                             ; 03E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03EE _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 03F1 _ 89. 45, E0
        mov     eax, dword [xsize]                      ; 03F4 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 03F9 _ 83. EC, 08
        push    ?_083                                   ; 03FC _ 68, 00000000(d)
        push    7                                       ; 0401 _ 6A, 07
        push    0                                       ; 0403 _ 6A, 00
        push    0                                       ; 0405 _ 6A, 00
        push    eax                                     ; 0407 _ 50
        push    dword [ebp-10H]                         ; 0408 _ FF. 75, F0
        call    showString                              ; 040B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0410 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 0413 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 0418 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 041B _ FF. 75, E0
        push    7                                       ; 041E _ 6A, 07
        push    0                                       ; 0420 _ 6A, 00
        push    136                                     ; 0422 _ 68, 00000088
        push    eax                                     ; 0427 _ 50
        push    dword [ebp-10H]                         ; 0428 _ FF. 75, F0
        call    showString                              ; 042B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0430 _ 83. C4, 20
        mov     eax, dword [xsize]                      ; 0433 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 0438 _ 83. EC, 08
        push    ?_084                                   ; 043B _ 68, 0000000F(d)
        push    7                                       ; 0440 _ 6A, 07
        push    0                                       ; 0442 _ 6A, 00
        push    224                                     ; 0444 _ 68, 000000E0
        push    eax                                     ; 0449 _ 50
        push    dword [ebp-10H]                         ; 044A _ FF. 75, F0
        call    showString                              ; 044D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0452 _ 83. C4, 20
        call    io_sti                                  ; 0455 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 045A _ 83. EC, 0C
        push    mdec                                    ; 045D _ 68, 000001E0(d)
        call    enable_mouse                            ; 0462 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0467 _ 83. C4, 10
        mov     dword [ebp-24H], 0                      ; 046A _ C7. 45, DC, 00000000
        mov     dword [ebp-0CH], 0                      ; 0471 _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 0478 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 047D _ 83. EC, 0C
        push    keyinfo                                 ; 0480 _ 68, 00000108(d)
        call    fifo8_status                            ; 0485 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 048A _ 83. C4, 10
        mov     ebx, eax                                ; 048D _ 89. C3
        sub     esp, 12                                 ; 048F _ 83. EC, 0C
        push    mouseinfo                               ; 0492 _ 68, 00000120(d)
        call    fifo8_status                            ; 0497 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 049C _ 83. C4, 10
        add     eax, ebx                                ; 049F _ 01. D8
        test    eax, eax                                ; 04A1 _ 85. C0
        jnz     ?_002                                   ; 04A3 _ 75, 07
        call    io_stihlt                               ; 04A5 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 04AA _ EB, CC

?_002:  sub     esp, 12                                 ; 04AC _ 83. EC, 0C
        push    keyinfo                                 ; 04AF _ 68, 00000108(d)
        call    fifo8_status                            ; 04B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04B9 _ 83. C4, 10
        test    eax, eax                                ; 04BC _ 85. C0
        jz      ?_003                                   ; 04BE _ 74, 68
        call    io_sti                                  ; 04C0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 04C5 _ 83. EC, 0C
        push    keyinfo                                 ; 04C8 _ 68, 00000108(d)
        call    fifo8_get                               ; 04CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D2 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 04D5 _ 89. 45, DC
        cmp     dword [ebp-24H], 28                     ; 04D8 _ 83. 7D, DC, 1C
        jnz     ?_001                                   ; 04DC _ 75, 9A
        mov     edx, dword [xsize]                      ; 04DE _ 8B. 15, 000001F8(d)
        mov     ecx, dword [ebp-0CH]                    ; 04E4 _ 8B. 4D, F4
        mov     eax, ecx                                ; 04E7 _ 89. C8
        shl     eax, 2                                  ; 04E9 _ C1. E0, 02
        add     eax, ecx                                ; 04EC _ 01. C8
        shl     eax, 2                                  ; 04EE _ C1. E0, 02
        mov     ecx, eax                                ; 04F1 _ 89. C1
        mov     eax, dword [ebp-18H]                    ; 04F3 _ 8B. 45, E8
        add     eax, ecx                                ; 04F6 _ 01. C8
        sub     esp, 12                                 ; 04F8 _ 83. EC, 0C
        push    7                                       ; 04FB _ 6A, 07
        push    edx                                     ; 04FD _ 52
        push    dword [ebp-0CH]                         ; 04FE _ FF. 75, F4
        push    dword [ebp-10H]                         ; 0501 _ FF. 75, F0
        push    eax                                     ; 0504 _ 50
        call    showMemoryInfo                          ; 0505 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 050A _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 050D _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0510 _ 8B. 45, F4
        cmp     eax, dword [ebp-14H]                    ; 0513 _ 3B. 45, EC
        jle     ?_001                                   ; 0516 _ 0F 8E, FFFFFF5C
        mov     dword [ebp-0CH], 0                      ; 051C _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 0523 _ E9, FFFFFF50

?_003:  sub     esp, 12                                 ; 0528 _ 83. EC, 0C
        push    mouseinfo                               ; 052B _ 68, 00000120(d)
        call    fifo8_status                            ; 0530 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0535 _ 83. C4, 10
        test    eax, eax                                ; 0538 _ 85. C0
        je      ?_001                                   ; 053A _ 0F 84, FFFFFF38
        call    show_mouse_info                         ; 0540 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0545 _ E9, FFFFFF2E
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 054A _ 55
        mov     ebp, esp                                ; 054B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 054D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0550 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0553 _ A1, 000001F0(d)
        add     eax, edx                                ; 0558 _ 01. D0
        mov     dword [mx], eax                         ; 055A _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 055F _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0562 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0565 _ A1, 000001F4(d)
        add     eax, edx                                ; 056A _ 01. D0
        mov     dword [my], eax                         ; 056C _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 0571 _ A1, 000001F0(d)
        test    eax, eax                                ; 0576 _ 85. C0
        jns     ?_004                                   ; 0578 _ 79, 0A
        mov     dword [mx], 0                           ; 057A _ C7. 05, 000001F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 0584 _ A1, 000001F4(d)
        test    eax, eax                                ; 0589 _ 85. C0
        jns     ?_005                                   ; 058B _ 79, 0A
        mov     dword [my], 0                           ; 058D _ C7. 05, 000001F4(d), 00000000
?_005:  mov     eax, dword [xsize]                      ; 0597 _ A1, 000001F8(d)
        lea     edx, [eax-0FH]                          ; 059C _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 059F _ A1, 000001F0(d)
        cmp     edx, eax                                ; 05A4 _ 39. C2
        jg      ?_006                                   ; 05A6 _ 7F, 0D
        mov     eax, dword [xsize]                      ; 05A8 _ A1, 000001F8(d)
        sub     eax, 16                                 ; 05AD _ 83. E8, 10
        mov     dword [mx], eax                         ; 05B0 _ A3, 000001F0(d)
?_006:  mov     eax, dword [ysize]                      ; 05B5 _ A1, 000001FC(d)
        lea     edx, [eax-0FH]                          ; 05BA _ 8D. 50, F1
        mov     eax, dword [my]                         ; 05BD _ A1, 000001F4(d)
        cmp     edx, eax                                ; 05C2 _ 39. C2
        jg      ?_007                                   ; 05C4 _ 7F, 0D
        mov     eax, dword [ysize]                      ; 05C6 _ A1, 000001FC(d)
        sub     eax, 16                                 ; 05CB _ 83. E8, 10
        mov     dword [my], eax                         ; 05CE _ A3, 000001F4(d)
?_007:  nop                                             ; 05D3 _ 90
        pop     ebp                                     ; 05D4 _ 5D
        ret                                             ; 05D5 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 05D6 _ 55
        mov     ebp, esp                                ; 05D7 _ 89. E5
        push    esi                                     ; 05D9 _ 56
        push    ebx                                     ; 05DA _ 53
        mov     eax, dword [my]                         ; 05DB _ A1, 000001F4(d)
        lea     esi, [eax+0FH]                          ; 05E0 _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 05E3 _ A1, 000001F0(d)
        lea     ebx, [eax+0FH]                          ; 05E8 _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 05EB _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 05F1 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 05F7 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 05FC _ 83. EC, 04
        push    esi                                     ; 05FF _ 56
        push    ebx                                     ; 0600 _ 53
        push    ecx                                     ; 0601 _ 51
        push    edx                                     ; 0602 _ 52
        push    14                                      ; 0603 _ 6A, 0E
        push    eax                                     ; 0605 _ 50
        push    dword [ebp+8H]                          ; 0606 _ FF. 75, 08
        call    boxfill8                                ; 0609 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 060E _ 83. C4, 20
        nop                                             ; 0611 _ 90
        lea     esp, [ebp-8H]                           ; 0612 _ 8D. 65, F8
        pop     ebx                                     ; 0615 _ 5B
        pop     esi                                     ; 0616 _ 5E
        pop     ebp                                     ; 0617 _ 5D
        ret                                             ; 0618 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0619 _ 55
        mov     ebp, esp                                ; 061A _ 89. E5
        sub     esp, 8                                  ; 061C _ 83. EC, 08
        mov     ecx, dword [my]                         ; 061F _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 0625 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 062B _ A1, 000001F8(d)
        push    16                                      ; 0630 _ 6A, 10
        push    mcursor                                 ; 0632 _ 68, 00000000(d)
        push    ecx                                     ; 0637 _ 51
        push    edx                                     ; 0638 _ 52
        push    16                                      ; 0639 _ 6A, 10
        push    16                                      ; 063B _ 6A, 10
        push    eax                                     ; 063D _ 50
        push    dword [ebp+8H]                          ; 063E _ FF. 75, 08
        call    putblock                                ; 0641 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0646 _ 83. C4, 20
        nop                                             ; 0649 _ 90
        leave                                           ; 064A _ C9
        ret                                             ; 064B _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 064C _ 55
        mov     ebp, esp                                ; 064D _ 89. E5
        sub     esp, 24                                 ; 064F _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0652 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0657 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 065A _ C6. 45, F3, 00
        call    io_sti                                  ; 065E _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0663 _ 83. EC, 0C
        push    mouseinfo                               ; 0666 _ 68, 00000120(d)
        call    fifo8_get                               ; 066B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0670 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0673 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0676 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 067A _ 83. EC, 08
        push    eax                                     ; 067D _ 50
        push    mdec                                    ; 067E _ 68, 000001E0(d)
        call    mouse_decode                            ; 0683 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0688 _ 83. C4, 10
        test    eax, eax                                ; 068B _ 85. C0
        jz      ?_008                                   ; 068D _ 74, 2C
        sub     esp, 12                                 ; 068F _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0692 _ FF. 75, F4
        call    eraseMouse                              ; 0695 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 069A _ 83. C4, 10
        sub     esp, 12                                 ; 069D _ 83. EC, 0C
        push    mdec                                    ; 06A0 _ 68, 000001E0(d)
        call    computeMousePosition                    ; 06A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06AA _ 83. C4, 10
        sub     esp, 12                                 ; 06AD _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 06B0 _ FF. 75, F4
        call    drawMouse                               ; 06B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B8 _ 83. C4, 10
?_008:  nop                                             ; 06BB _ 90
        leave                                           ; 06BC _ C9
        ret                                             ; 06BD _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 06BE _ 55
        mov     ebp, esp                                ; 06BF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 06C1 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 06C4 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 06CA _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 06CD _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 06D3 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 06D6 _ 66: C7. 40, 06, 00C8
        nop                                             ; 06DC _ 90
        pop     ebp                                     ; 06DD _ 5D
        ret                                             ; 06DE _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 06DF _ 55
        mov     ebp, esp                                ; 06E0 _ 89. E5
        sub     esp, 24                                 ; 06E2 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 06E5 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 06E8 _ 88. 45, F4
        jmp     ?_010                                   ; 06EB _ EB, 35

?_009:  mov     eax, dword [ebp+1CH]                    ; 06ED _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 06F0 _ 8A. 00
        movzx   eax, al                                 ; 06F2 _ 0F B6. C0
        shl     eax, 4                                  ; 06F5 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 06F8 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 06FE _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0702 _ 83. EC, 08
        push    edx                                     ; 0705 _ 52
        push    eax                                     ; 0706 _ 50
        push    dword [ebp+14H]                         ; 0707 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 070A _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 070D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0710 _ FF. 75, 08
        call    showFont8                               ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0718 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 071B _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 071F _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 0722 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0725 _ 8A. 00
        test    al, al                                  ; 0727 _ 84. C0
        jnz     ?_009                                   ; 0729 _ 75, C2
        nop                                             ; 072B _ 90
        nop                                             ; 072C _ 90
        leave                                           ; 072D _ C9
        ret                                             ; 072E _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 072F _ 55
        mov     ebp, esp                                ; 0730 _ 89. E5
        sub     esp, 8                                  ; 0732 _ 83. EC, 08
        sub     esp, 4                                  ; 0735 _ 83. EC, 04
        push    table_rgb.1693                          ; 0738 _ 68, 00000020(d)
        push    15                                      ; 073D _ 6A, 0F
        push    0                                       ; 073F _ 6A, 00
        call    set_palette                             ; 0741 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0746 _ 83. C4, 10
        nop                                             ; 0749 _ 90
        leave                                           ; 074A _ C9
        ret                                             ; 074B _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 074C _ 55
        mov     ebp, esp                                ; 074D _ 89. E5
        sub     esp, 24                                 ; 074F _ 83. EC, 18
        call    io_load_eflags                          ; 0752 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0757 _ 89. 45, F0
        call    io_cli                                  ; 075A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 075F _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0762 _ FF. 75, 08
        push    968                                     ; 0765 _ 68, 000003C8
        call    io_out8                                 ; 076A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 076F _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0772 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0775 _ 89. 45, F4
        jmp     ?_012                                   ; 0778 _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 077A _ 8B. 45, 10
        mov     al, byte [eax]                          ; 077D _ 8A. 00
        shr     al, 2                                   ; 077F _ C0. E8, 02
        movzx   eax, al                                 ; 0782 _ 0F B6. C0
        sub     esp, 8                                  ; 0785 _ 83. EC, 08
        push    eax                                     ; 0788 _ 50
        push    969                                     ; 0789 _ 68, 000003C9
        call    io_out8                                 ; 078E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0793 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0796 _ 8B. 45, 10
        inc     eax                                     ; 0799 _ 40
        mov     al, byte [eax]                          ; 079A _ 8A. 00
        shr     al, 2                                   ; 079C _ C0. E8, 02
        movzx   eax, al                                 ; 079F _ 0F B6. C0
        sub     esp, 8                                  ; 07A2 _ 83. EC, 08
        push    eax                                     ; 07A5 _ 50
        push    969                                     ; 07A6 _ 68, 000003C9
        call    io_out8                                 ; 07AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07B0 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 07B3 _ 8B. 45, 10
        add     eax, 2                                  ; 07B6 _ 83. C0, 02
        mov     al, byte [eax]                          ; 07B9 _ 8A. 00
        shr     al, 2                                   ; 07BB _ C0. E8, 02
        movzx   eax, al                                 ; 07BE _ 0F B6. C0
        sub     esp, 8                                  ; 07C1 _ 83. EC, 08
        push    eax                                     ; 07C4 _ 50
        push    969                                     ; 07C5 _ 68, 000003C9
        call    io_out8                                 ; 07CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07CF _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 07D2 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 07D6 _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 07D9 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 07DC _ 3B. 45, 0C
        jle     ?_011                                   ; 07DF _ 7E, 99
        sub     esp, 12                                 ; 07E1 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 07E4 _ FF. 75, F0
        call    io_store_eflags                         ; 07E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07EC _ 83. C4, 10
        nop                                             ; 07EF _ 90
        leave                                           ; 07F0 _ C9
        ret                                             ; 07F1 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 07F2 _ 55
        mov     ebp, esp                                ; 07F3 _ 89. E5
        sub     esp, 20                                 ; 07F5 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07F8 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07FB _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 07FE _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0801 _ 89. 45, F8
        jmp     ?_016                                   ; 0804 _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 0806 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0809 _ 89. 45, FC
        jmp     ?_015                                   ; 080C _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 080E _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0811 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0815 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0817 _ 8B. 45, FC
        add     eax, edx                                ; 081A _ 01. D0
        mov     edx, eax                                ; 081C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 081E _ 8B. 45, 08
        add     edx, eax                                ; 0821 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0823 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0826 _ 88. 02
        inc     dword [ebp-4H]                          ; 0828 _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 082B _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 082E _ 3B. 45, 1C
        jle     ?_014                                   ; 0831 _ 7E, DB
        inc     dword [ebp-8H]                          ; 0833 _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 0836 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0839 _ 3B. 45, 20
        jle     ?_013                                   ; 083C _ 7E, C8
        nop                                             ; 083E _ 90
        nop                                             ; 083F _ 90
        leave                                           ; 0840 _ C9
        ret                                             ; 0841 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0842 _ 55
        mov     ebp, esp                                ; 0843 _ 89. E5
        sub     esp, 20                                 ; 0845 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0848 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 084B _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 084E _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0855 _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 085A _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 085D _ 8B. 45, 1C
        add     eax, edx                                ; 0860 _ 01. D0
        mov     al, byte [eax]                          ; 0862 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0864 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0867 _ 80. 7D, FB, 00
        jns     ?_018                                   ; 086B _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 086D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0870 _ 8B. 45, FC
        add     eax, edx                                ; 0873 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0875 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0879 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 087B _ 8B. 45, 10
        add     eax, edx                                ; 087E _ 01. D0
        mov     edx, eax                                ; 0880 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0882 _ 8B. 45, 08
        add     edx, eax                                ; 0885 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0887 _ 8A. 45, EC
        mov     byte [edx], al                          ; 088A _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 088C _ 0F BE. 45, FB
        and     eax, 40H                                ; 0890 _ 83. E0, 40
        test    eax, eax                                ; 0893 _ 85. C0
        jz      ?_019                                   ; 0895 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0897 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 089A _ 8B. 45, FC
        add     eax, edx                                ; 089D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 089F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08A3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A5 _ 8B. 45, 10
        add     eax, edx                                ; 08A8 _ 01. D0
        lea     edx, [eax+1H]                           ; 08AA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 08AD _ 8B. 45, 08
        add     edx, eax                                ; 08B0 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08B2 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08B5 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 08B7 _ 0F BE. 45, FB
        and     eax, 20H                                ; 08BB _ 83. E0, 20
        test    eax, eax                                ; 08BE _ 85. C0
        jz      ?_020                                   ; 08C0 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08C2 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08C5 _ 8B. 45, FC
        add     eax, edx                                ; 08C8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08CA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08CE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D0 _ 8B. 45, 10
        add     eax, edx                                ; 08D3 _ 01. D0
        lea     edx, [eax+2H]                           ; 08D5 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 08D8 _ 8B. 45, 08
        add     edx, eax                                ; 08DB _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08DD _ 8A. 45, EC
        mov     byte [edx], al                          ; 08E0 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 08E2 _ 0F BE. 45, FB
        and     eax, 10H                                ; 08E6 _ 83. E0, 10
        test    eax, eax                                ; 08E9 _ 85. C0
        jz      ?_021                                   ; 08EB _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08ED _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08F0 _ 8B. 45, FC
        add     eax, edx                                ; 08F3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08F5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08F9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08FB _ 8B. 45, 10
        add     eax, edx                                ; 08FE _ 01. D0
        lea     edx, [eax+3H]                           ; 0900 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0903 _ 8B. 45, 08
        add     edx, eax                                ; 0906 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0908 _ 8A. 45, EC
        mov     byte [edx], al                          ; 090B _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 090D _ 0F BE. 45, FB
        and     eax, 08H                                ; 0911 _ 83. E0, 08
        test    eax, eax                                ; 0914 _ 85. C0
        jz      ?_022                                   ; 0916 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0918 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 091B _ 8B. 45, FC
        add     eax, edx                                ; 091E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0920 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0924 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0926 _ 8B. 45, 10
        add     eax, edx                                ; 0929 _ 01. D0
        lea     edx, [eax+4H]                           ; 092B _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 092E _ 8B. 45, 08
        add     edx, eax                                ; 0931 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0933 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0936 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0938 _ 0F BE. 45, FB
        and     eax, 04H                                ; 093C _ 83. E0, 04
        test    eax, eax                                ; 093F _ 85. C0
        jz      ?_023                                   ; 0941 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0943 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0946 _ 8B. 45, FC
        add     eax, edx                                ; 0949 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 094B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 094F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0951 _ 8B. 45, 10
        add     eax, edx                                ; 0954 _ 01. D0
        lea     edx, [eax+5H]                           ; 0956 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0959 _ 8B. 45, 08
        add     edx, eax                                ; 095C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 095E _ 8A. 45, EC
        mov     byte [edx], al                          ; 0961 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0963 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0967 _ 83. E0, 02
        test    eax, eax                                ; 096A _ 85. C0
        jz      ?_024                                   ; 096C _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 096E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0971 _ 8B. 45, FC
        add     eax, edx                                ; 0974 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0976 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 097A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 097C _ 8B. 45, 10
        add     eax, edx                                ; 097F _ 01. D0
        lea     edx, [eax+6H]                           ; 0981 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0984 _ 8B. 45, 08
        add     edx, eax                                ; 0987 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0989 _ 8A. 45, EC
        mov     byte [edx], al                          ; 098C _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 098E _ 0F BE. 45, FB
        and     eax, 01H                                ; 0992 _ 83. E0, 01
        test    eax, eax                                ; 0995 _ 85. C0
        jz      ?_025                                   ; 0997 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0999 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 099C _ 8B. 45, FC
        add     eax, edx                                ; 099F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09A1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09A5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09A7 _ 8B. 45, 10
        add     eax, edx                                ; 09AA _ 01. D0
        lea     edx, [eax+7H]                           ; 09AC _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 09AF _ 8B. 45, 08
        add     edx, eax                                ; 09B2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09B4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09B7 _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 09B9 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 09BC _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 09C0 _ 0F 8E, FFFFFE94
        nop                                             ; 09C6 _ 90
        nop                                             ; 09C7 _ 90
        leave                                           ; 09C8 _ C9
        ret                                             ; 09C9 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 09CA _ 55
        mov     ebp, esp                                ; 09CB _ 89. E5
        sub     esp, 20                                 ; 09CD _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 09D0 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 09D3 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 09D6 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 09DD _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 09E2 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 09E9 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 09EE _ 8B. 45, F8
        shl     eax, 4                                  ; 09F1 _ C1. E0, 04
        mov     edx, eax                                ; 09F4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09F6 _ 8B. 45, FC
        add     eax, edx                                ; 09F9 _ 01. D0
        add     eax, cursor.1740                        ; 09FB _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A00 _ 8A. 00
        cmp     al, 42                                  ; 0A02 _ 3C, 2A
        jnz     ?_029                                   ; 0A04 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A06 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A09 _ C1. E0, 04
        mov     edx, eax                                ; 0A0C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A0E _ 8B. 45, FC
        add     eax, edx                                ; 0A11 _ 01. D0
        mov     edx, eax                                ; 0A13 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A15 _ 8B. 45, 08
        add     eax, edx                                ; 0A18 _ 01. D0
        mov     byte [eax], 0                           ; 0A1A _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0A1D _ 8B. 45, F8
        shl     eax, 4                                  ; 0A20 _ C1. E0, 04
        mov     edx, eax                                ; 0A23 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A25 _ 8B. 45, FC
        add     eax, edx                                ; 0A28 _ 01. D0
        add     eax, cursor.1740                        ; 0A2A _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A2F _ 8A. 00
        cmp     al, 79                                  ; 0A31 _ 3C, 4F
        jnz     ?_030                                   ; 0A33 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0A35 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A38 _ C1. E0, 04
        mov     edx, eax                                ; 0A3B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A3D _ 8B. 45, FC
        add     eax, edx                                ; 0A40 _ 01. D0
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A44 _ 8B. 45, 08
        add     eax, edx                                ; 0A47 _ 01. D0
        mov     byte [eax], 7                           ; 0A49 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 0A4C _ 8B. 45, F8
        shl     eax, 4                                  ; 0A4F _ C1. E0, 04
        mov     edx, eax                                ; 0A52 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A54 _ 8B. 45, FC
        add     eax, edx                                ; 0A57 _ 01. D0
        add     eax, cursor.1740                        ; 0A59 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0A5E _ 8A. 00
        cmp     al, 46                                  ; 0A60 _ 3C, 2E
        jnz     ?_031                                   ; 0A62 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0A64 _ 8B. 45, F8
        shl     eax, 4                                  ; 0A67 _ C1. E0, 04
        mov     edx, eax                                ; 0A6A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0A6C _ 8B. 45, FC
        add     eax, edx                                ; 0A6F _ 01. D0
        mov     edx, eax                                ; 0A71 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A73 _ 8B. 45, 08
        add     edx, eax                                ; 0A76 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A78 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A7B _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 0A7D _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 0A80 _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 0A84 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0A8A _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 0A8D _ 83. 7D, F8, 0F
        jle     ?_027                                   ; 0A91 _ 0F 8E, FFFFFF4B
        nop                                             ; 0A97 _ 90
        nop                                             ; 0A98 _ 90
        leave                                           ; 0A99 _ C9
        ret                                             ; 0A9A _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0A9B _ 55
        mov     ebp, esp                                ; 0A9C _ 89. E5
        push    ebx                                     ; 0A9E _ 53
        sub     esp, 16                                 ; 0A9F _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0AA2 _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0AA9 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0AAB _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0AB2 _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0AB4 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0AB7 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0ABB _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0ABD _ 8B. 45, F8
        add     eax, edx                                ; 0AC0 _ 01. D0
        mov     edx, eax                                ; 0AC2 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0AC4 _ 8B. 45, 20
        add     eax, edx                                ; 0AC7 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0AC9 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0ACC _ 8B. 55, F4
        add     edx, ecx                                ; 0ACF _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0AD1 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0AD5 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0AD8 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0ADB _ 01. D9
        add     edx, ecx                                ; 0ADD _ 01. CA
        mov     ecx, edx                                ; 0ADF _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0AE1 _ 8B. 55, 08
        add     edx, ecx                                ; 0AE4 _ 01. CA
        mov     al, byte [eax]                          ; 0AE6 _ 8A. 00
        mov     byte [edx], al                          ; 0AE8 _ 88. 02
        inc     dword [ebp-8H]                          ; 0AEA _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0AED _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0AF0 _ 3B. 45, 10
        jl      ?_035                                   ; 0AF3 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0AF5 _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0AF8 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0AFB _ 3B. 45, 14
        jl      ?_034                                   ; 0AFE _ 7C, AB
        nop                                             ; 0B00 _ 90
        nop                                             ; 0B01 _ 90
        add     esp, 16                                 ; 0B02 _ 83. C4, 10
        pop     ebx                                     ; 0B05 _ 5B
        pop     ebp                                     ; 0B06 _ 5D
        ret                                             ; 0B07 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0B08 _ 55
        mov     ebp, esp                                ; 0B09 _ 89. E5
        sub     esp, 24                                 ; 0B0B _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0B0E _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0B13 _ 89. 45, F4
        mov     eax, dword [?_093]                      ; 0B16 _ A1, 00000104(d)
        cwde                                            ; 0B1B _ 98
        mov     dword [ebp-10H], eax                    ; 0B1C _ 89. 45, F0
        mov     ax, word [?_094]                        ; 0B1F _ 66: A1, 00000106(d)
        cwde                                            ; 0B25 _ 98
        mov     dword [ebp-14H], eax                    ; 0B26 _ 89. 45, EC
        sub     esp, 8                                  ; 0B29 _ 83. EC, 08
        push    32                                      ; 0B2C _ 6A, 20
        push    32                                      ; 0B2E _ 6A, 20
        call    io_out8                                 ; 0B30 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B35 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0B38 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0B3C _ 83. EC, 0C
        push    96                                      ; 0B3F _ 6A, 60
        call    io_in8                                  ; 0B41 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B46 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0B49 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0B4C _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0B50 _ 83. EC, 08
        push    eax                                     ; 0B53 _ 50
        push    keyinfo                                 ; 0B54 _ 68, 00000108(d)
        call    fifo8_put                               ; 0B59 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B5E _ 83. C4, 10
        nop                                             ; 0B61 _ 90
        leave                                           ; 0B62 _ C9
        ret                                             ; 0B63 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0B64 _ 55
        mov     ebp, esp                                ; 0B65 _ 89. E5
        sub     esp, 4                                  ; 0B67 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0B6A _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0B6D _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0B70 _ 80. 7D, FC, 09
        jle     ?_038                                   ; 0B74 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0B76 _ 8A. 45, FC
        add     eax, 55                                 ; 0B79 _ 83. C0, 37
        jmp     ?_039                                   ; 0B7C _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0B7E _ 8A. 45, FC
        add     eax, 48                                 ; 0B81 _ 83. C0, 30
?_039:  leave                                           ; 0B84 _ C9
        ret                                             ; 0B85 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0B86 _ 55
        mov     ebp, esp                                ; 0B87 _ 89. E5
        sub     esp, 20                                 ; 0B89 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0B8C _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0B8F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B92 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0B99 _ 8A. 45, EC
        and     eax, 0FH                                ; 0B9C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B9F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0BA2 _ 0F BE. 45, FB
        push    eax                                     ; 0BA6 _ 50
        call    charToHexVal                            ; 0BA7 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BAC _ 83. C4, 04
        mov     byte [?_092], al                        ; 0BAF _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0BB4 _ 8A. 45, EC
        shr     al, 4                                   ; 0BB7 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0BBA _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0BBD _ 8A. 45, EC
        movsx   eax, al                                 ; 0BC0 _ 0F BE. C0
        push    eax                                     ; 0BC3 _ 50
        call    charToHexVal                            ; 0BC4 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0BC9 _ 83. C4, 04
        mov     byte [?_091], al                        ; 0BCC _ A2, 00000006(d)
        mov     eax, keyval                             ; 0BD1 _ B8, 00000004(d)
        leave                                           ; 0BD6 _ C9
        ret                                             ; 0BD7 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0BD8 _ 55
        mov     ebp, esp                                ; 0BD9 _ 89. E5
        sub     esp, 16                                 ; 0BDB _ 83. EC, 10
        mov     byte [str.1788], 48                     ; 0BDE _ C6. 05, 00000200(d), 30
        mov     byte [?_095], 88                        ; 0BE5 _ C6. 05, 00000201(d), 58
        mov     byte [?_096], 0                         ; 0BEC _ C6. 05, 0000020A(d), 00
        mov     dword [ebp-4H], 2                       ; 0BF3 _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0BFA _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0BFC _ 8B. 45, FC
        add     eax, str.1788                           ; 0BFF _ 05, 00000200(d)
        mov     byte [eax], 48                          ; 0C04 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0C07 _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0C0A _ 83. 7D, FC, 09
        jle     ?_040                                   ; 0C0E _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 0C10 _ C7. 45, F8, 00000009
        jmp     ?_045                                   ; 0C17 _ EB, 41

?_042:  mov     eax, dword [ebp+8H]                     ; 0C19 _ 8B. 45, 08
        and     eax, 0FH                                ; 0C1C _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0C1F _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0C22 _ 8B. 45, 08
        shr     eax, 4                                  ; 0C25 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0C28 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0C2B _ 83. 7D, F4, 09
        jle     ?_043                                   ; 0C2F _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 0C31 _ 8B. 45, F4
        add     eax, 55                                 ; 0C34 _ 83. C0, 37
        mov     dl, al                                  ; 0C37 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C39 _ 8B. 45, F8
        add     eax, str.1788                           ; 0C3C _ 05, 00000200(d)
        mov     byte [eax], dl                          ; 0C41 _ 88. 10
        jmp     ?_044                                   ; 0C43 _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0C45 _ 8B. 45, F4
        add     eax, 48                                 ; 0C48 _ 83. C0, 30
        mov     dl, al                                  ; 0C4B _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0C4D _ 8B. 45, F8
        add     eax, str.1788                           ; 0C50 _ 05, 00000200(d)
        mov     byte [eax], dl                          ; 0C55 _ 88. 10
?_044:  dec     dword [ebp-8H]                          ; 0C57 _ FF. 4D, F8
?_045:  cmp     dword [ebp-8H], 1                       ; 0C5A _ 83. 7D, F8, 01
        jle     ?_046                                   ; 0C5E _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0C60 _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0C64 _ 75, B3
?_046:  mov     eax, str.1788                           ; 0C66 _ B8, 00000200(d)
        leave                                           ; 0C6B _ C9
        ret                                             ; 0C6C _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0C6D _ 55
        mov     ebp, esp                                ; 0C6E _ 89. E5
        sub     esp, 8                                  ; 0C70 _ 83. EC, 08
?_047:  sub     esp, 12                                 ; 0C73 _ 83. EC, 0C
        push    100                                     ; 0C76 _ 6A, 64
        call    io_in8                                  ; 0C78 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C7D _ 83. C4, 10
        and     eax, 02H                                ; 0C80 _ 83. E0, 02
        test    eax, eax                                ; 0C83 _ 85. C0
        jz      ?_048                                   ; 0C85 _ 74, 02
        jmp     ?_047                                   ; 0C87 _ EB, EA

?_048:  nop                                             ; 0C89 _ 90
        nop                                             ; 0C8A _ 90
        leave                                           ; 0C8B _ C9
        ret                                             ; 0C8C _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0C8D _ 55
        mov     ebp, esp                                ; 0C8E _ 89. E5
        sub     esp, 8                                  ; 0C90 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C93 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C98 _ 83. EC, 08
        push    96                                      ; 0C9B _ 6A, 60
        push    100                                     ; 0C9D _ 6A, 64
        call    io_out8                                 ; 0C9F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA4 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CA7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CAC _ 83. EC, 08
        push    71                                      ; 0CAF _ 6A, 47
        push    96                                      ; 0CB1 _ 6A, 60
        call    io_out8                                 ; 0CB3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB8 _ 83. C4, 10
        nop                                             ; 0CBB _ 90
        leave                                           ; 0CBC _ C9
        ret                                             ; 0CBD _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0CBE _ 55
        mov     ebp, esp                                ; 0CBF _ 89. E5
        sub     esp, 8                                  ; 0CC1 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0CC4 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CC9 _ 83. EC, 08
        push    212                                     ; 0CCC _ 68, 000000D4
        push    100                                     ; 0CD1 _ 6A, 64
        call    io_out8                                 ; 0CD3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD8 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0CDB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0CE0 _ 83. EC, 08
        push    244                                     ; 0CE3 _ 68, 000000F4
        push    96                                      ; 0CE8 _ 6A, 60
        call    io_out8                                 ; 0CEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CEF _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0CF2 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0CF5 _ C6. 40, 03, 00
        nop                                             ; 0CF9 _ 90
        leave                                           ; 0CFA _ C9
        ret                                             ; 0CFB _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0CFC _ 55
        mov     ebp, esp                                ; 0CFD _ 89. E5
        sub     esp, 24                                 ; 0CFF _ 83. EC, 18
        sub     esp, 8                                  ; 0D02 _ 83. EC, 08
        push    32                                      ; 0D05 _ 6A, 20
        push    160                                     ; 0D07 _ 68, 000000A0
        call    io_out8                                 ; 0D0C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D11 _ 83. C4, 10
        sub     esp, 8                                  ; 0D14 _ 83. EC, 08
        push    32                                      ; 0D17 _ 6A, 20
        push    32                                      ; 0D19 _ 6A, 20
        call    io_out8                                 ; 0D1B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D20 _ 83. C4, 10
        sub     esp, 12                                 ; 0D23 _ 83. EC, 0C
        push    96                                      ; 0D26 _ 6A, 60
        call    io_in8                                  ; 0D28 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D2D _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0D30 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0D33 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0D37 _ 83. EC, 08
        push    eax                                     ; 0D3A _ 50
        push    mouseinfo                               ; 0D3B _ 68, 00000120(d)
        call    fifo8_put                               ; 0D40 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D45 _ 83. C4, 10
        nop                                             ; 0D48 _ 90
        leave                                           ; 0D49 _ C9
        ret                                             ; 0D4A _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0D4B _ 55
        mov     ebp, esp                                ; 0D4C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D4E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D51 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0D54 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0D5A _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0D5D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0D5F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0D62 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0D65 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D68 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0D6B _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D72 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D75 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0D7C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0D7F _ C7. 40, 08, 00000000
        nop                                             ; 0D86 _ 90
        pop     ebp                                     ; 0D87 _ 5D
        ret                                             ; 0D88 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0D89 _ 55
        mov     ebp, esp                                ; 0D8A _ 89. E5
        sub     esp, 4                                  ; 0D8C _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D8F _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D92 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D95 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D98 _ 8B. 40, 10
        test    eax, eax                                ; 0D9B _ 85. C0
        jnz     ?_049                                   ; 0D9D _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0D9F _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0DA2 _ 8B. 40, 14
        or      eax, 01H                                ; 0DA5 _ 83. C8, 01
        mov     edx, eax                                ; 0DA8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DAA _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0DAD _ 89. 50, 14
        mov     eax, 4294967295                         ; 0DB0 _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0DB5 _ EB, 4F

?_049:  mov     eax, dword [ebp+8H]                     ; 0DB7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0DBA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0DBC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DBF _ 8B. 40, 04
        add     edx, eax                                ; 0DC2 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0DC4 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0DC7 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0DC9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0DCC _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0DCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DD2 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DD5 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DD8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0DDB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DDE _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DE1 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DE4 _ 39. C2
        jnz     ?_050                                   ; 0DE6 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DE8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0DEB _ C7. 40, 04, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0DF2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DF5 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0DF8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0DFB _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DFE _ 89. 50, 10
        mov     eax, 0                                  ; 0E01 _ B8, 00000000
?_051:  leave                                           ; 0E06 _ C9
        ret                                             ; 0E07 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0E08 _ 55
        mov     ebp, esp                                ; 0E09 _ 89. E5
        sub     esp, 16                                 ; 0E0B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0E0E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0E11 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0E14 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E17 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E1A _ 39. C2
        jnz     ?_052                                   ; 0E1C _ 75, 07
        mov     eax, 4294967295                         ; 0E1E _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0E23 _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0E25 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0E28 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0E2A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E2D _ 8B. 40, 08
        add     eax, edx                                ; 0E30 _ 01. D0
        mov     al, byte [eax]                          ; 0E32 _ 8A. 00
        movzx   eax, al                                 ; 0E34 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0E37 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E3A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E3D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0E40 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E43 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E46 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E49 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0E4C _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0E4F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0E52 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0E55 _ 39. C2
        jnz     ?_053                                   ; 0E57 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0E59 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0E5C _ C7. 40, 08, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0E63 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E66 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0E69 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E6C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0E6F _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0E72 _ 8B. 45, FC
?_054:  leave                                           ; 0E75 _ C9
        ret                                             ; 0E76 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0E77 _ 55
        mov     ebp, esp                                ; 0E78 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E7A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0E7D _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E80 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0E83 _ 8B. 40, 10
        sub     edx, eax                                ; 0E86 _ 29. C2
        mov     eax, edx                                ; 0E88 _ 89. D0
        pop     ebp                                     ; 0E8A _ 5D
        ret                                             ; 0E8B _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E8C _ 55
        mov     ebp, esp                                ; 0E8D _ 89. E5
        sub     esp, 4                                  ; 0E8F _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E92 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E95 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E98 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E9B _ 8A. 40, 03
        test    al, al                                  ; 0E9E _ 84. C0
        jnz     ?_056                                   ; 0EA0 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0EA2 _ 80. 7D, FC, FA
        jnz     ?_055                                   ; 0EA6 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0EA8 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EAB _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 0EAF _ B8, 00000000
        jmp     ?_063                                   ; 0EB4 _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EBC _ 8A. 40, 03
        cmp     al, 1                                   ; 0EBF _ 3C, 01
        jnz     ?_058                                   ; 0EC1 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0EC3 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0EC7 _ 25, 000000C8
        cmp     eax, 8                                  ; 0ECC _ 83. F8, 08
        jnz     ?_057                                   ; 0ECF _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0ED1 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0ED4 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0ED7 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0ED9 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0EDC _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 0EE0 _ B8, 00000000
        jmp     ?_063                                   ; 0EE5 _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 0EEA _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0EED _ 8A. 40, 03
        cmp     al, 2                                   ; 0EF0 _ 3C, 02
        jnz     ?_059                                   ; 0EF2 _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0EF4 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EF7 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0EFA _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0EFD _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0F00 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0F04 _ B8, 00000000
        jmp     ?_063                                   ; 0F09 _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 0F0E _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0F11 _ 8A. 40, 03
        cmp     al, 3                                   ; 0F14 _ 3C, 03
        jne     ?_062                                   ; 0F16 _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0F1C _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0F1F _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0F22 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0F25 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0F28 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0F2C _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F2F _ 8A. 00
        movzx   eax, al                                 ; 0F31 _ 0F B6. C0
        and     eax, 07H                                ; 0F34 _ 83. E0, 07
        mov     edx, eax                                ; 0F37 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F39 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0F3C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0F3F _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0F42 _ 8A. 40, 01
        movzx   edx, al                                 ; 0F45 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F48 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F4B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F4E _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0F51 _ 8A. 40, 02
        movzx   edx, al                                 ; 0F54 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0F57 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F5A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0F5D _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F60 _ 8A. 00
        movzx   eax, al                                 ; 0F62 _ 0F B6. C0
        and     eax, 10H                                ; 0F65 _ 83. E0, 10
        test    eax, eax                                ; 0F68 _ 85. C0
        jz      ?_060                                   ; 0F6A _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F6C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0F6F _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0F72 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F77 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F79 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F7C _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 0F7F _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F82 _ 8A. 00
        movzx   eax, al                                 ; 0F84 _ 0F B6. C0
        and     eax, 20H                                ; 0F87 _ 83. E0, 20
        test    eax, eax                                ; 0F8A _ 85. C0
        jz      ?_061                                   ; 0F8C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F8E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F91 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F94 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F99 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F9B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F9E _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 0FA1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0FA4 _ 8B. 40, 08
        neg     eax                                     ; 0FA7 _ F7. D8
        mov     edx, eax                                ; 0FA9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FAB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0FAE _ 89. 50, 08
        mov     eax, 1                                  ; 0FB1 _ B8, 00000001
        jmp     ?_063                                   ; 0FB6 _ EB, 05

?_062:  mov     eax, 4294967295                         ; 0FB8 _ B8, FFFFFFFF
?_063:  leave                                           ; 0FBD _ C9
        ret                                             ; 0FBE _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0FBF _ 55
        mov     ebp, esp                                ; 0FC0 _ 89. E5
        sub     esp, 56                                 ; 0FC2 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0FC5 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0FCC _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0FD3 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0FDA _ C7. 45, E8, 00000050
        push    100                                     ; 0FE1 _ 6A, 64
        push    dword [ebp+14H]                         ; 0FE3 _ FF. 75, 14
        push    0                                       ; 0FE6 _ 6A, 00
        push    0                                       ; 0FE8 _ 6A, 00
        push    14                                      ; 0FEA _ 6A, 0E
        push    dword [ebp+14H]                         ; 0FEC _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FEF _ FF. 75, 0C
        call    boxfill8                                ; 0FF2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0FF7 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0FFA _ 8B. 45, 18
        movsx   eax, al                                 ; 0FFD _ 0F BE. C0
        sub     esp, 8                                  ; 1000 _ 83. EC, 08
        push    ?_085                                   ; 1003 _ 68, 00000013(d)
        push    eax                                     ; 1008 _ 50
        push    dword [ebp-10H]                         ; 1009 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 100C _ FF. 75, F4
        push    dword [ebp+14H]                         ; 100F _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1012 _ FF. 75, 0C
        call    showString                              ; 1015 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 101A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 101D _ 8B. 45, 10
        sub     esp, 12                                 ; 1020 _ 83. EC, 0C
        push    eax                                     ; 1023 _ 50
        call    intToHexStr                             ; 1024 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1029 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 102C _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 102F _ 8B. 45, 18
        movsx   eax, al                                 ; 1032 _ 0F BE. C0
        sub     esp, 8                                  ; 1035 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1038 _ FF. 75, E4
        push    eax                                     ; 103B _ 50
        push    dword [ebp-10H]                         ; 103C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 103F _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1042 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1045 _ FF. 75, 0C
        call    showString                              ; 1048 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 104D _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1050 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1054 _ 8B. 45, 18
        movsx   eax, al                                 ; 1057 _ 0F BE. C0
        sub     esp, 8                                  ; 105A _ 83. EC, 08
        push    ?_086                                   ; 105D _ 68, 0000001D(d)
        push    eax                                     ; 1062 _ 50
        push    dword [ebp-10H]                         ; 1063 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1066 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1069 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 106C _ FF. 75, 0C
        call    showString                              ; 106F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1074 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1077 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 107A _ 8B. 00
        sub     esp, 12                                 ; 107C _ 83. EC, 0C
        push    eax                                     ; 107F _ 50
        call    intToHexStr                             ; 1080 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1085 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1088 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 108B _ 8B. 45, 18
        movsx   eax, al                                 ; 108E _ 0F BE. C0
        sub     esp, 8                                  ; 1091 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1094 _ FF. 75, E0
        push    eax                                     ; 1097 _ 50
        push    dword [ebp-10H]                         ; 1098 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 109B _ FF. 75, EC
        push    dword [ebp+14H]                         ; 109E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10A1 _ FF. 75, 0C
        call    showString                              ; 10A4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10A9 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10AC _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 10B0 _ 8B. 45, 18
        movsx   eax, al                                 ; 10B3 _ 0F BE. C0
        sub     esp, 8                                  ; 10B6 _ 83. EC, 08
        push    ?_087                                   ; 10B9 _ 68, 00000029(d)
        push    eax                                     ; 10BE _ 50
        push    dword [ebp-10H]                         ; 10BF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10C2 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 10C5 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10C8 _ FF. 75, 0C
        call    showString                              ; 10CB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10D0 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10D3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 10D6 _ 8B. 40, 04
        sub     esp, 12                                 ; 10D9 _ 83. EC, 0C
        push    eax                                     ; 10DC _ 50
        call    intToHexStr                             ; 10DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10E2 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 10E5 _ 89. 45, DC
        mov     eax, dword [ebp+18H]                    ; 10E8 _ 8B. 45, 18
        movsx   eax, al                                 ; 10EB _ 0F BE. C0
        sub     esp, 8                                  ; 10EE _ 83. EC, 08
        push    dword [ebp-24H]                         ; 10F1 _ FF. 75, DC
        push    eax                                     ; 10F4 _ 50
        push    dword [ebp-10H]                         ; 10F5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10F8 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 10FB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10FE _ FF. 75, 0C
        call    showString                              ; 1101 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1106 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1109 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 110D _ 8B. 45, 18
        movsx   eax, al                                 ; 1110 _ 0F BE. C0
        sub     esp, 8                                  ; 1113 _ 83. EC, 08
        push    ?_088                                   ; 1116 _ 68, 00000035(d)
        push    eax                                     ; 111B _ 50
        push    dword [ebp-10H]                         ; 111C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 111F _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1122 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1125 _ FF. 75, 0C
        call    showString                              ; 1128 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 112D _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1130 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1133 _ 8B. 40, 08
        sub     esp, 12                                 ; 1136 _ 83. EC, 0C
        push    eax                                     ; 1139 _ 50
        call    intToHexStr                             ; 113A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 113F _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1142 _ 89. 45, D8
        mov     eax, dword [ebp+18H]                    ; 1145 _ 8B. 45, 18
        movsx   eax, al                                 ; 1148 _ 0F BE. C0
        sub     esp, 8                                  ; 114B _ 83. EC, 08
        push    dword [ebp-28H]                         ; 114E _ FF. 75, D8
        push    eax                                     ; 1151 _ 50
        push    dword [ebp-10H]                         ; 1152 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1155 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1158 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 115B _ FF. 75, 0C
        call    showString                              ; 115E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1163 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1166 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 116A _ 8B. 45, 18
        movsx   eax, al                                 ; 116D _ 0F BE. C0
        sub     esp, 8                                  ; 1170 _ 83. EC, 08
        push    ?_089                                   ; 1173 _ 68, 00000041(d)
        push    eax                                     ; 1178 _ 50
        push    dword [ebp-10H]                         ; 1179 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 117C _ FF. 75, F4
        push    dword [ebp+14H]                         ; 117F _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1182 _ FF. 75, 0C
        call    showString                              ; 1185 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 118A _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 118D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1190 _ 8B. 40, 0C
        sub     esp, 12                                 ; 1193 _ 83. EC, 0C
        push    eax                                     ; 1196 _ 50
        call    intToHexStr                             ; 1197 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 119C _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 119F _ 89. 45, D4
        mov     eax, dword [ebp+18H]                    ; 11A2 _ 8B. 45, 18
        movsx   eax, al                                 ; 11A5 _ 0F BE. C0
        sub     esp, 8                                  ; 11A8 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 11AB _ FF. 75, D4
        push    eax                                     ; 11AE _ 50
        push    dword [ebp-10H]                         ; 11AF _ FF. 75, F0
        push    dword [ebp-14H]                         ; 11B2 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 11B5 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11B8 _ FF. 75, 0C
        call    showString                              ; 11BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11C0 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 11C3 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 11C7 _ 8B. 45, 18
        movsx   eax, al                                 ; 11CA _ 0F BE. C0
        sub     esp, 8                                  ; 11CD _ 83. EC, 08
        push    ?_090                                   ; 11D0 _ 68, 0000004E(d)
        push    eax                                     ; 11D5 _ 50
        push    dword [ebp-10H]                         ; 11D6 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11D9 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 11DC _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 11DF _ FF. 75, 0C
        call    showString                              ; 11E2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11E7 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 11EA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 11ED _ 8B. 40, 10
        sub     esp, 12                                 ; 11F0 _ 83. EC, 0C
        push    eax                                     ; 11F3 _ 50
        call    intToHexStr                             ; 11F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11F9 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 11FC _ 89. 45, D0
        mov     eax, dword [ebp+18H]                    ; 11FF _ 8B. 45, 18
        movsx   eax, al                                 ; 1202 _ 0F BE. C0
        sub     esp, 8                                  ; 1205 _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1208 _ FF. 75, D0
        push    eax                                     ; 120B _ 50
        push    dword [ebp-10H]                         ; 120C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 120F _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1212 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1215 _ FF. 75, 0C
        call    showString                              ; 1218 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 121D _ 83. C4, 20
        nop                                             ; 1220 _ 90
        leave                                           ; 1221 _ C9
        ret                                             ; 1222 _ C3
; showMemoryInfo End of function

memman_init:; Function begin
        push    ebp                                     ; 1223 _ 55
        mov     ebp, esp                                ; 1224 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1226 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1229 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 122F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1232 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1239 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 123C _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1243 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1246 _ C7. 40, 0C, 00000000
        nop                                             ; 124D _ 90
        pop     ebp                                     ; 124E _ 5D
        ret                                             ; 124F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1250 _ 55
        mov     ebp, esp                                ; 1251 _ 89. E5
        sub     esp, 16                                 ; 1253 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1256 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 125D _ C7. 45, FC, 00000000
        jmp     ?_065                                   ; 1264 _ EB, 13

?_064:  mov     eax, dword [ebp+8H]                     ; 1266 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1269 _ 8B. 55, FC
        add     edx, 2                                  ; 126C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 126F _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1273 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1276 _ FF. 45, FC
?_065:  mov     eax, dword [ebp+8H]                     ; 1279 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 127C _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 127E _ 39. 45, FC
        jc      ?_064                                   ; 1281 _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1283 _ 8B. 45, F8
        leave                                           ; 1286 _ C9
        ret                                             ; 1287 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1288 _ 55
        mov     ebp, esp                                ; 1289 _ 89. E5
        sub     esp, 16                                 ; 128B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 128E _ C7. 45, FC, 00000000
        jmp     ?_069                                   ; 1295 _ EB, 66

?_066:  mov     eax, dword [ebp+8H]                     ; 1297 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 129A _ 8B. 55, FC
        add     edx, 2                                  ; 129D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12A0 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 12A4 _ 39. 45, 0C
        ja      ?_068                                   ; 12A7 _ 77, 51
        mov     eax, dword [ebp+8H]                     ; 12A9 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12AC _ 8B. 55, FC
        add     edx, 2                                  ; 12AF _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 12B2 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 12B5 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 12B8 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12BB _ 8B. 55, FC
        add     edx, 2                                  ; 12BE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12C1 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 12C5 _ 2B. 45, 0C
        mov     edx, eax                                ; 12C8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12CA _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 12CD _ 8B. 4D, FC
        add     ecx, 2                                  ; 12D0 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 12D3 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 12D7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 12DA _ 8B. 55, FC
        add     edx, 2                                  ; 12DD _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 12E0 _ 8B. 44 D0, 04
        test    eax, eax                                ; 12E4 _ 85. C0
        jnz     ?_067                                   ; 12E6 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 12E8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 12EB _ 8B. 00
        lea     edx, [eax-1H]                           ; 12ED _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 12F0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 12F3 _ 89. 10
?_067:  mov     eax, dword [ebp-8H]                     ; 12F5 _ 8B. 45, F8
        jmp     ?_070                                   ; 12F8 _ EB, 12

?_068:  inc     dword [ebp-4H]                          ; 12FA _ FF. 45, FC
?_069:  mov     eax, dword [ebp+8H]                     ; 12FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1300 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1302 _ 39. 45, FC
        jc      ?_066                                   ; 1305 _ 72, 90
        mov     eax, 0                                  ; 1307 _ B8, 00000000
?_070:  leave                                           ; 130C _ C9
        ret                                             ; 130D _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 130E _ 55
        mov     ebp, esp                                ; 130F _ 89. E5
        push    ebx                                     ; 1311 _ 53
        sub     esp, 16                                 ; 1312 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1315 _ C7. 45, F8, 00000000
        jmp     ?_072                                   ; 131C _ EB, 14

?_071:  mov     eax, dword [ebp+8H]                     ; 131E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1321 _ 8B. 55, F8
        add     edx, 2                                  ; 1324 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1327 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 132A _ 39. 45, 0C
        jc      ?_073                                   ; 132D _ 72, 0F
        inc     dword [ebp-8H]                          ; 132F _ FF. 45, F8
?_072:  mov     eax, dword [ebp+8H]                     ; 1332 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1335 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1337 _ 39. 45, F8
        jl      ?_071                                   ; 133A _ 7C, E2
        jmp     ?_074                                   ; 133C _ EB, 01

?_073:  nop                                             ; 133E _ 90
?_074:  cmp     dword [ebp-8H], 0                       ; 133F _ 83. 7D, F8, 00
        jle     ?_076                                   ; 1343 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 1349 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 134C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 134F _ 8B. 45, 08
        add     edx, 2                                  ; 1352 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1355 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1358 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 135B _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 135E _ 8B. 45, 08
        add     ecx, 2                                  ; 1361 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1364 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1368 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 136A _ 39. 45, 0C
        jne     ?_076                                   ; 136D _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1373 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1376 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1379 _ 8B. 45, 08
        add     edx, 2                                  ; 137C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 137F _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1383 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1386 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1389 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 138C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 138F _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1392 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1395 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1399 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 139C _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 139E _ 39. 45, F8
        jge     ?_075                                   ; 13A1 _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 13A3 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 13A6 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 13A9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13AC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 13AF _ 8B. 55, F8
        add     edx, 2                                  ; 13B2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 13B5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 13B8 _ 39. C1
        jnz     ?_075                                   ; 13BA _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 13BC _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 13BF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13C2 _ 8B. 45, 08
        add     edx, 2                                  ; 13C5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 13C8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 13CC _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 13CF _ 8B. 4D, F8
        add     ecx, 2                                  ; 13D2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 13D5 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 13D9 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 13DC _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 13DF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 13E2 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 13E5 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 13E8 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 13EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 13EF _ 8B. 00
        lea     edx, [eax-1H]                           ; 13F1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 13F4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 13F7 _ 89. 10
?_075:  mov     eax, 0                                  ; 13F9 _ B8, 00000000
        jmp     ?_082                                   ; 13FE _ E9, 0000011B

?_076:  mov     eax, dword [ebp+8H]                     ; 1403 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1406 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1408 _ 39. 45, F8
        jge     ?_077                                   ; 140B _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 140D _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1410 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1413 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1416 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1419 _ 8B. 55, F8
        add     edx, 2                                  ; 141C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 141F _ 8B. 04 D0
        cmp     ecx, eax                                ; 1422 _ 39. C1
        jnz     ?_077                                   ; 1424 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1426 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1429 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 142C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 142F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1432 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1435 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1438 _ 8B. 55, F8
        add     edx, 2                                  ; 143B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 143E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1442 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1445 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1448 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 144B _ 8B. 55, F8
        add     edx, 2                                  ; 144E _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1451 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1455 _ B8, 00000000
        jmp     ?_082                                   ; 145A _ E9, 000000BF

?_077:  mov     eax, dword [ebp+8H]                     ; 145F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1462 _ 8B. 00
        cmp     eax, 4095                               ; 1464 _ 3D, 00000FFF
        jg      ?_081                                   ; 1469 _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 146F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1472 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1474 _ 89. 45, F4
        jmp     ?_079                                   ; 1477 _ EB, 27

?_078:  mov     eax, dword [ebp-0CH]                    ; 1479 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 147C _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 147F _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1482 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1485 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1488 _ 8B. 45, 08
        add     edx, 2                                  ; 148B _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 148E _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1491 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1493 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1496 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1499 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 149D _ FF. 4D, F4
?_079:  mov     eax, dword [ebp-0CH]                    ; 14A0 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 14A3 _ 3B. 45, F8
        jg      ?_078                                   ; 14A6 _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 14A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14AB _ 8B. 00
        lea     edx, [eax+1H]                           ; 14AD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14B0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 14B3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 14B5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 14B8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14BE _ 8B. 00
        cmp     edx, eax                                ; 14C0 _ 39. C2
        jge     ?_080                                   ; 14C2 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 14C4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 14C7 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 14C9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 14CC _ 89. 50, 04
?_080:  mov     eax, dword [ebp+8H]                     ; 14CF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14D2 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14D5 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 14D8 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 14DB _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 14DE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 14E1 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 14E4 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 14E7 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 14EA _ 89. 54 C8, 04
        mov     eax, 0                                  ; 14EE _ B8, 00000000
        jmp     ?_082                                   ; 14F3 _ EB, 29

?_081:  mov     eax, dword [ebp+8H]                     ; 14F5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 14F8 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 14FB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 14FE _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1501 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1504 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1507 _ 8B. 40, 08
        mov     edx, eax                                ; 150A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 150C _ 8B. 45, 10
        add     eax, edx                                ; 150F _ 01. D0
        mov     edx, eax                                ; 1511 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1513 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1516 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1519 _ B8, FFFFFFFF
?_082:  add     esp, 16                                 ; 151E _ 83. C4, 10
        pop     ebx                                     ; 1521 _ 5B
        pop     ebp                                     ; 1522 _ 5D
        ret                                             ; 1523 _ C3
; memman_free End of function

?_083:                                                  ; byte
        db 74H, 6FH, 74H, 61H, 6CH, 20H, 6DH, 65H       ; 0000 _ total me
        db 6DH, 20H, 69H, 73H, 3AH, 20H, 00H            ; 0008 _ m is: .

?_084:                                                  ; byte
        db 20H, 4DH, 42H, 00H                           ; 000F _  MB.

?_085:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0013 _ page is:
        db 20H, 00H                                     ; 001B _  .

?_086:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 001D _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0025 _ L: .

?_087:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0029 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0031 _ H: .

?_088:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0035 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 003D _ w: .

?_089:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0041 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0049 _ gh: .

?_090:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 004E _ type: .

memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_091:  db 00H                                          ; 0006 _ .

?_092:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1693:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1740:                                            ; byte
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


mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_093:                                                  ; dword
        resb    2                                       ; 0104

?_094:  resw    1                                       ; 0106

keyinfo:                                                ; byte
        resb    24                                      ; 0108

mouseinfo:                                              ; byte
        resb    32                                      ; 0120

keybuf:                                                 ; yword
        resb    32                                      ; 0140

mousebuf:                                               ; byte
        resb    128                                     ; 0160

mdec:                                                   ; oword
        resb    16                                      ; 01E0

mx:     resd    1                                       ; 01F0

my:     resd    1                                       ; 01F4

xsize:  resd    1                                       ; 01F8

ysize:  resd    1                                       ; 01FC

str.1788:                                               ; byte
        resb    1                                       ; 0200

?_095:  resb    9                                       ; 0201

?_096:  resb    1                                       ; 020A


