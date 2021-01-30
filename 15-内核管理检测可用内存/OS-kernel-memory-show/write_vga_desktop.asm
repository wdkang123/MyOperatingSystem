; Disassembly of file: write_vga_desktop.o
; Fri Jan 29 19:09:38 2021
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
        mov     dword [ebp-0CH], eax                    ; 001D _ 89. 45, F4
        mov     eax, dword [?_065]                      ; 0020 _ A1, 00000104(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 000001F8(d)
        mov     ax, word [?_066]                        ; 002B _ 66: A1, 00000106(d)
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
        push    dword [ebp-0CH]                         ; 0093 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 00C6 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 00F9 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 012C _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 0158 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 0184 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 01B0 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 01DC _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 0208 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 0234 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 026E _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 02A8 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 02E2 _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 031C _ FF. 75, F4
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
        push    dword [ebp-0CH]                         ; 0384 _ FF. 75, F4
        call    putblock                                ; 0387 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 038C _ 83. C4, 20
        call    get_memory_block_count                  ; 038F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0394 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0397 _ 8B. 45, F0
        sub     esp, 12                                 ; 039A _ 83. EC, 0C
        push    eax                                     ; 039D _ 50
        call    intToHexStr                             ; 039E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A3 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 03A6 _ 89. 45, EC
        mov     eax, dword [xsize]                      ; 03A9 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 03AE _ 83. EC, 08
        push    dword [ebp-14H]                         ; 03B1 _ FF. 75, EC
        push    7                                       ; 03B4 _ 6A, 07
        push    0                                       ; 03B6 _ 6A, 00
        push    0                                       ; 03B8 _ 6A, 00
        push    eax                                     ; 03BA _ 50
        push    dword [ebp-0CH]                         ; 03BB _ FF. 75, F4
        call    showString                              ; 03BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C3 _ 83. C4, 20
        call    io_sti                                  ; 03C6 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03CB _ 83. EC, 0C
        push    mdec                                    ; 03CE _ 68, 000001E0(d)
        call    enable_mouse                            ; 03D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D8 _ 83. C4, 10
        mov     dword [ebp-18H], 0                      ; 03DB _ C7. 45, E8, 00000000
?_001:  call    io_cli                                  ; 03E2 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03E7 _ 83. EC, 0C
        push    keyinfo                                 ; 03EA _ 68, 00000108(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F4 _ 83. C4, 10
        mov     ebx, eax                                ; 03F7 _ 89. C3
        sub     esp, 12                                 ; 03F9 _ 83. EC, 0C
        push    mouseinfo                               ; 03FC _ 68, 00000120(d)
        call    fifo8_status                            ; 0401 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0406 _ 83. C4, 10
        add     eax, ebx                                ; 0409 _ 01. D8
        test    eax, eax                                ; 040B _ 85. C0
        jnz     ?_002                                   ; 040D _ 75, 07
        call    io_stihlt                               ; 040F _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0414 _ EB, CC

?_002:  sub     esp, 12                                 ; 0416 _ 83. EC, 0C
        push    keyinfo                                 ; 0419 _ 68, 00000108(d)
        call    fifo8_status                            ; 041E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0423 _ 83. C4, 10
        test    eax, eax                                ; 0426 _ 85. C0
        jz      ?_003                                   ; 0428 _ 74, 61
        call    io_sti                                  ; 042A _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 042F _ 83. EC, 0C
        push    keyinfo                                 ; 0432 _ 68, 00000108(d)
        call    fifo8_get                               ; 0437 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 043C _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 043F _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0442 _ 8B. 45, E8
        movzx   eax, al                                 ; 0445 _ 0F B6. C0
        sub     esp, 12                                 ; 0448 _ 83. EC, 0C
        push    eax                                     ; 044B _ 50
        call    charToHexStr                            ; 044C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0451 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0454 _ 89. 45, E4
        mov     edx, dword [showPos.1620]               ; 0457 _ 8B. 15, 00000200(d)
        mov     eax, dword [xsize]                      ; 045D _ A1, 000001F8(d)
        sub     esp, 8                                  ; 0462 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0465 _ FF. 75, E4
        push    7                                       ; 0468 _ 6A, 07
        push    16                                      ; 046A _ 6A, 10
        push    edx                                     ; 046C _ 52
        push    eax                                     ; 046D _ 50
        push    dword [ebp-0CH]                         ; 046E _ FF. 75, F4
        call    showString                              ; 0471 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0476 _ 83. C4, 20
        mov     eax, dword [showPos.1620]               ; 0479 _ A1, 00000200(d)
        add     eax, 32                                 ; 047E _ 83. C0, 20
        mov     dword [showPos.1620], eax               ; 0481 _ A3, 00000200(d)
        jmp     ?_001                                   ; 0486 _ E9, FFFFFF57

?_003:  sub     esp, 12                                 ; 048B _ 83. EC, 0C
        push    mouseinfo                               ; 048E _ 68, 00000120(d)
        call    fifo8_status                            ; 0493 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0498 _ 83. C4, 10
        test    eax, eax                                ; 049B _ 85. C0
        je      ?_001                                   ; 049D _ 0F 84, FFFFFF3F
        call    show_mouse_info                         ; 04A3 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 04A8 _ E9, FFFFFF35
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 04AD _ 55
        mov     ebp, esp                                ; 04AE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 04B0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 04B3 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 04B6 _ A1, 000001F0(d)
        add     eax, edx                                ; 04BB _ 01. D0
        mov     dword [mx], eax                         ; 04BD _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 04C2 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 04C5 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 04C8 _ A1, 000001F4(d)
        add     eax, edx                                ; 04CD _ 01. D0
        mov     dword [my], eax                         ; 04CF _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 04D4 _ A1, 000001F0(d)
        test    eax, eax                                ; 04D9 _ 85. C0
        jns     ?_004                                   ; 04DB _ 79, 0A
        mov     dword [mx], 0                           ; 04DD _ C7. 05, 000001F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 04E7 _ A1, 000001F4(d)
        test    eax, eax                                ; 04EC _ 85. C0
        jns     ?_005                                   ; 04EE _ 79, 0A
        mov     dword [my], 0                           ; 04F0 _ C7. 05, 000001F4(d), 00000000
?_005:  mov     eax, dword [xsize]                      ; 04FA _ A1, 000001F8(d)
        lea     edx, [eax-0FH]                          ; 04FF _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 0502 _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0507 _ 39. C2
        jg      ?_006                                   ; 0509 _ 7F, 0D
        mov     eax, dword [xsize]                      ; 050B _ A1, 000001F8(d)
        sub     eax, 16                                 ; 0510 _ 83. E8, 10
        mov     dword [mx], eax                         ; 0513 _ A3, 000001F0(d)
?_006:  mov     eax, dword [ysize]                      ; 0518 _ A1, 000001FC(d)
        lea     edx, [eax-0FH]                          ; 051D _ 8D. 50, F1
        mov     eax, dword [my]                         ; 0520 _ A1, 000001F4(d)
        cmp     edx, eax                                ; 0525 _ 39. C2
        jg      ?_007                                   ; 0527 _ 7F, 0D
        mov     eax, dword [ysize]                      ; 0529 _ A1, 000001FC(d)
        sub     eax, 16                                 ; 052E _ 83. E8, 10
        mov     dword [my], eax                         ; 0531 _ A3, 000001F4(d)
?_007:  nop                                             ; 0536 _ 90
        pop     ebp                                     ; 0537 _ 5D
        ret                                             ; 0538 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0539 _ 55
        mov     ebp, esp                                ; 053A _ 89. E5
        push    esi                                     ; 053C _ 56
        push    ebx                                     ; 053D _ 53
        mov     eax, dword [my]                         ; 053E _ A1, 000001F4(d)
        lea     esi, [eax+0FH]                          ; 0543 _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 0546 _ A1, 000001F0(d)
        lea     ebx, [eax+0FH]                          ; 054B _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 054E _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 0554 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 055A _ A1, 000001F8(d)
        sub     esp, 4                                  ; 055F _ 83. EC, 04
        push    esi                                     ; 0562 _ 56
        push    ebx                                     ; 0563 _ 53
        push    ecx                                     ; 0564 _ 51
        push    edx                                     ; 0565 _ 52
        push    14                                      ; 0566 _ 6A, 0E
        push    eax                                     ; 0568 _ 50
        push    dword [ebp+8H]                          ; 0569 _ FF. 75, 08
        call    boxfill8                                ; 056C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0571 _ 83. C4, 20
        nop                                             ; 0574 _ 90
        lea     esp, [ebp-8H]                           ; 0575 _ 8D. 65, F8
        pop     ebx                                     ; 0578 _ 5B
        pop     esi                                     ; 0579 _ 5E
        pop     ebp                                     ; 057A _ 5D
        ret                                             ; 057B _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 057C _ 55
        mov     ebp, esp                                ; 057D _ 89. E5
        sub     esp, 8                                  ; 057F _ 83. EC, 08
        mov     ecx, dword [my]                         ; 0582 _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 0588 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 058E _ A1, 000001F8(d)
        push    16                                      ; 0593 _ 6A, 10
        push    mcursor                                 ; 0595 _ 68, 00000000(d)
        push    ecx                                     ; 059A _ 51
        push    edx                                     ; 059B _ 52
        push    16                                      ; 059C _ 6A, 10
        push    16                                      ; 059E _ 6A, 10
        push    eax                                     ; 05A0 _ 50
        push    dword [ebp+8H]                          ; 05A1 _ FF. 75, 08
        call    putblock                                ; 05A4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05A9 _ 83. C4, 20
        nop                                             ; 05AC _ 90
        leave                                           ; 05AD _ C9
        ret                                             ; 05AE _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 05AF _ 55
        mov     ebp, esp                                ; 05B0 _ 89. E5
        sub     esp, 24                                 ; 05B2 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 05B5 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 05BA _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 05BD _ C6. 45, F3, 00
        call    io_sti                                  ; 05C1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05C6 _ 83. EC, 0C
        push    mouseinfo                               ; 05C9 _ 68, 00000120(d)
        call    fifo8_get                               ; 05CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05D3 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 05D6 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 05D9 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 05DD _ 83. EC, 08
        push    eax                                     ; 05E0 _ 50
        push    mdec                                    ; 05E1 _ 68, 000001E0(d)
        call    mouse_decode                            ; 05E6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05EB _ 83. C4, 10
        test    eax, eax                                ; 05EE _ 85. C0
        jz      ?_008                                   ; 05F0 _ 74, 2C
        sub     esp, 12                                 ; 05F2 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 05F5 _ FF. 75, F4
        call    eraseMouse                              ; 05F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05FD _ 83. C4, 10
        sub     esp, 12                                 ; 0600 _ 83. EC, 0C
        push    mdec                                    ; 0603 _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0608 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 060D _ 83. C4, 10
        sub     esp, 12                                 ; 0610 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 0613 _ FF. 75, F4
        call    drawMouse                               ; 0616 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 061B _ 83. C4, 10
?_008:  nop                                             ; 061E _ 90
        leave                                           ; 061F _ C9
        ret                                             ; 0620 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0621 _ 55
        mov     ebp, esp                                ; 0622 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0624 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0627 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 062D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0630 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0636 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0639 _ 66: C7. 40, 06, 00C8
        nop                                             ; 063F _ 90
        pop     ebp                                     ; 0640 _ 5D
        ret                                             ; 0641 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0642 _ 55
        mov     ebp, esp                                ; 0643 _ 89. E5
        sub     esp, 24                                 ; 0645 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0648 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 064B _ 88. 45, F4
        jmp     ?_010                                   ; 064E _ EB, 35

?_009:  mov     eax, dword [ebp+1CH]                    ; 0650 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0653 _ 8A. 00
        movzx   eax, al                                 ; 0655 _ 0F B6. C0
        shl     eax, 4                                  ; 0658 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 065B _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0661 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0665 _ 83. EC, 08
        push    edx                                     ; 0668 _ 52
        push    eax                                     ; 0669 _ 50
        push    dword [ebp+14H]                         ; 066A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 066D _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0670 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0673 _ FF. 75, 08
        call    showFont8                               ; 0676 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 067B _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 067E _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0682 _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 0685 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0688 _ 8A. 00
        test    al, al                                  ; 068A _ 84. C0
        jnz     ?_009                                   ; 068C _ 75, C2
        nop                                             ; 068E _ 90
        nop                                             ; 068F _ 90
        leave                                           ; 0690 _ C9
        ret                                             ; 0691 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0692 _ 55
        mov     ebp, esp                                ; 0693 _ 89. E5
        sub     esp, 8                                  ; 0695 _ 83. EC, 08
        sub     esp, 4                                  ; 0698 _ 83. EC, 04
        push    table_rgb.1653                          ; 069B _ 68, 00000020(d)
        push    15                                      ; 06A0 _ 6A, 0F
        push    0                                       ; 06A2 _ 6A, 00
        call    set_palette                             ; 06A4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A9 _ 83. C4, 10
        nop                                             ; 06AC _ 90
        leave                                           ; 06AD _ C9
        ret                                             ; 06AE _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 06AF _ 55
        mov     ebp, esp                                ; 06B0 _ 89. E5
        sub     esp, 24                                 ; 06B2 _ 83. EC, 18
        call    io_load_eflags                          ; 06B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 06BA _ 89. 45, F0
        call    io_cli                                  ; 06BD _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 06C2 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 06C5 _ FF. 75, 08
        push    968                                     ; 06C8 _ 68, 000003C8
        call    io_out8                                 ; 06CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D2 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 06D5 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 06D8 _ 89. 45, F4
        jmp     ?_012                                   ; 06DB _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 06DD _ 8B. 45, 10
        mov     al, byte [eax]                          ; 06E0 _ 8A. 00
        shr     al, 2                                   ; 06E2 _ C0. E8, 02
        movzx   eax, al                                 ; 06E5 _ 0F B6. C0
        sub     esp, 8                                  ; 06E8 _ 83. EC, 08
        push    eax                                     ; 06EB _ 50
        push    969                                     ; 06EC _ 68, 000003C9
        call    io_out8                                 ; 06F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06F6 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06F9 _ 8B. 45, 10
        inc     eax                                     ; 06FC _ 40
        mov     al, byte [eax]                          ; 06FD _ 8A. 00
        shr     al, 2                                   ; 06FF _ C0. E8, 02
        movzx   eax, al                                 ; 0702 _ 0F B6. C0
        sub     esp, 8                                  ; 0705 _ 83. EC, 08
        push    eax                                     ; 0708 _ 50
        push    969                                     ; 0709 _ 68, 000003C9
        call    io_out8                                 ; 070E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0713 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0716 _ 8B. 45, 10
        add     eax, 2                                  ; 0719 _ 83. C0, 02
        mov     al, byte [eax]                          ; 071C _ 8A. 00
        shr     al, 2                                   ; 071E _ C0. E8, 02
        movzx   eax, al                                 ; 0721 _ 0F B6. C0
        sub     esp, 8                                  ; 0724 _ 83. EC, 08
        push    eax                                     ; 0727 _ 50
        push    969                                     ; 0728 _ 68, 000003C9
        call    io_out8                                 ; 072D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0732 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0735 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0739 _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 073C _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 073F _ 3B. 45, 0C
        jle     ?_011                                   ; 0742 _ 7E, 99
        sub     esp, 12                                 ; 0744 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0747 _ FF. 75, F0
        call    io_store_eflags                         ; 074A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 074F _ 83. C4, 10
        nop                                             ; 0752 _ 90
        leave                                           ; 0753 _ C9
        ret                                             ; 0754 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0755 _ 55
        mov     ebp, esp                                ; 0756 _ 89. E5
        sub     esp, 20                                 ; 0758 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 075B _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 075E _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0761 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0764 _ 89. 45, F8
        jmp     ?_016                                   ; 0767 _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 0769 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 076C _ 89. 45, FC
        jmp     ?_015                                   ; 076F _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 0771 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0774 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0778 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 077A _ 8B. 45, FC
        add     eax, edx                                ; 077D _ 01. D0
        mov     edx, eax                                ; 077F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0781 _ 8B. 45, 08
        add     edx, eax                                ; 0784 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0786 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0789 _ 88. 02
        inc     dword [ebp-4H]                          ; 078B _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 078E _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0791 _ 3B. 45, 1C
        jle     ?_014                                   ; 0794 _ 7E, DB
        inc     dword [ebp-8H]                          ; 0796 _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 0799 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 079C _ 3B. 45, 20
        jle     ?_013                                   ; 079F _ 7E, C8
        nop                                             ; 07A1 _ 90
        nop                                             ; 07A2 _ 90
        leave                                           ; 07A3 _ C9
        ret                                             ; 07A4 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 07A5 _ 55
        mov     ebp, esp                                ; 07A6 _ 89. E5
        sub     esp, 20                                 ; 07A8 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 07AB _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 07AE _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07B1 _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 07B8 _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 07BD _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 07C0 _ 8B. 45, 1C
        add     eax, edx                                ; 07C3 _ 01. D0
        mov     al, byte [eax]                          ; 07C5 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 07C7 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 07CA _ 80. 7D, FB, 00
        jns     ?_018                                   ; 07CE _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 07D0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07D3 _ 8B. 45, FC
        add     eax, edx                                ; 07D6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07D8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07DC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07DE _ 8B. 45, 10
        add     eax, edx                                ; 07E1 _ 01. D0
        mov     edx, eax                                ; 07E3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07E5 _ 8B. 45, 08
        add     edx, eax                                ; 07E8 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 07EA _ 8A. 45, EC
        mov     byte [edx], al                          ; 07ED _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 07EF _ 0F BE. 45, FB
        and     eax, 40H                                ; 07F3 _ 83. E0, 40
        test    eax, eax                                ; 07F6 _ 85. C0
        jz      ?_019                                   ; 07F8 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 07FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07FD _ 8B. 45, FC
        add     eax, edx                                ; 0800 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0802 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0806 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0808 _ 8B. 45, 10
        add     eax, edx                                ; 080B _ 01. D0
        lea     edx, [eax+1H]                           ; 080D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0810 _ 8B. 45, 08
        add     edx, eax                                ; 0813 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0815 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0818 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 081A _ 0F BE. 45, FB
        and     eax, 20H                                ; 081E _ 83. E0, 20
        test    eax, eax                                ; 0821 _ 85. C0
        jz      ?_020                                   ; 0823 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0825 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0828 _ 8B. 45, FC
        add     eax, edx                                ; 082B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 082D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0831 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0833 _ 8B. 45, 10
        add     eax, edx                                ; 0836 _ 01. D0
        lea     edx, [eax+2H]                           ; 0838 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 083B _ 8B. 45, 08
        add     edx, eax                                ; 083E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0840 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0843 _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 0845 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0849 _ 83. E0, 10
        test    eax, eax                                ; 084C _ 85. C0
        jz      ?_021                                   ; 084E _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0850 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0853 _ 8B. 45, FC
        add     eax, edx                                ; 0856 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0858 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 085C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 085E _ 8B. 45, 10
        add     eax, edx                                ; 0861 _ 01. D0
        lea     edx, [eax+3H]                           ; 0863 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0866 _ 8B. 45, 08
        add     edx, eax                                ; 0869 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 086B _ 8A. 45, EC
        mov     byte [edx], al                          ; 086E _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0870 _ 0F BE. 45, FB
        and     eax, 08H                                ; 0874 _ 83. E0, 08
        test    eax, eax                                ; 0877 _ 85. C0
        jz      ?_022                                   ; 0879 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 087B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 087E _ 8B. 45, FC
        add     eax, edx                                ; 0881 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0883 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0887 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0889 _ 8B. 45, 10
        add     eax, edx                                ; 088C _ 01. D0
        lea     edx, [eax+4H]                           ; 088E _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0891 _ 8B. 45, 08
        add     edx, eax                                ; 0894 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0896 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0899 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 089B _ 0F BE. 45, FB
        and     eax, 04H                                ; 089F _ 83. E0, 04
        test    eax, eax                                ; 08A2 _ 85. C0
        jz      ?_023                                   ; 08A4 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08A6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08A9 _ 8B. 45, FC
        add     eax, edx                                ; 08AC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08AE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08B2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08B4 _ 8B. 45, 10
        add     eax, edx                                ; 08B7 _ 01. D0
        lea     edx, [eax+5H]                           ; 08B9 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08BC _ 8B. 45, 08
        add     edx, eax                                ; 08BF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08C1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08C4 _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08C6 _ 0F BE. 45, FB
        and     eax, 02H                                ; 08CA _ 83. E0, 02
        test    eax, eax                                ; 08CD _ 85. C0
        jz      ?_024                                   ; 08CF _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08D1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08D4 _ 8B. 45, FC
        add     eax, edx                                ; 08D7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08D9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08DD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08DF _ 8B. 45, 10
        add     eax, edx                                ; 08E2 _ 01. D0
        lea     edx, [eax+6H]                           ; 08E4 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08E7 _ 8B. 45, 08
        add     edx, eax                                ; 08EA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08EC _ 8A. 45, EC
        mov     byte [edx], al                          ; 08EF _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 08F1 _ 0F BE. 45, FB
        and     eax, 01H                                ; 08F5 _ 83. E0, 01
        test    eax, eax                                ; 08F8 _ 85. C0
        jz      ?_025                                   ; 08FA _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08FC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08FF _ 8B. 45, FC
        add     eax, edx                                ; 0902 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0904 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0908 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 090A _ 8B. 45, 10
        add     eax, edx                                ; 090D _ 01. D0
        lea     edx, [eax+7H]                           ; 090F _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0912 _ 8B. 45, 08
        add     edx, eax                                ; 0915 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0917 _ 8A. 45, EC
        mov     byte [edx], al                          ; 091A _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 091C _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 091F _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 0923 _ 0F 8E, FFFFFE94
        nop                                             ; 0929 _ 90
        nop                                             ; 092A _ 90
        leave                                           ; 092B _ C9
        ret                                             ; 092C _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 092D _ 55
        mov     ebp, esp                                ; 092E _ 89. E5
        sub     esp, 20                                 ; 0930 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0933 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0936 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0939 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0940 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 0945 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 094C _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 0951 _ 8B. 45, F8
        shl     eax, 4                                  ; 0954 _ C1. E0, 04
        mov     edx, eax                                ; 0957 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0959 _ 8B. 45, FC
        add     eax, edx                                ; 095C _ 01. D0
        add     eax, cursor.1700                        ; 095E _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0963 _ 8A. 00
        cmp     al, 42                                  ; 0965 _ 3C, 2A
        jnz     ?_029                                   ; 0967 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0969 _ 8B. 45, F8
        shl     eax, 4                                  ; 096C _ C1. E0, 04
        mov     edx, eax                                ; 096F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0971 _ 8B. 45, FC
        add     eax, edx                                ; 0974 _ 01. D0
        mov     edx, eax                                ; 0976 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0978 _ 8B. 45, 08
        add     eax, edx                                ; 097B _ 01. D0
        mov     byte [eax], 0                           ; 097D _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0980 _ 8B. 45, F8
        shl     eax, 4                                  ; 0983 _ C1. E0, 04
        mov     edx, eax                                ; 0986 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0988 _ 8B. 45, FC
        add     eax, edx                                ; 098B _ 01. D0
        add     eax, cursor.1700                        ; 098D _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0992 _ 8A. 00
        cmp     al, 79                                  ; 0994 _ 3C, 4F
        jnz     ?_030                                   ; 0996 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0998 _ 8B. 45, F8
        shl     eax, 4                                  ; 099B _ C1. E0, 04
        mov     edx, eax                                ; 099E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09A0 _ 8B. 45, FC
        add     eax, edx                                ; 09A3 _ 01. D0
        mov     edx, eax                                ; 09A5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09A7 _ 8B. 45, 08
        add     eax, edx                                ; 09AA _ 01. D0
        mov     byte [eax], 7                           ; 09AC _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 09AF _ 8B. 45, F8
        shl     eax, 4                                  ; 09B2 _ C1. E0, 04
        mov     edx, eax                                ; 09B5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09B7 _ 8B. 45, FC
        add     eax, edx                                ; 09BA _ 01. D0
        add     eax, cursor.1700                        ; 09BC _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 09C1 _ 8A. 00
        cmp     al, 46                                  ; 09C3 _ 3C, 2E
        jnz     ?_031                                   ; 09C5 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09C7 _ 8B. 45, F8
        shl     eax, 4                                  ; 09CA _ C1. E0, 04
        mov     edx, eax                                ; 09CD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09CF _ 8B. 45, FC
        add     eax, edx                                ; 09D2 _ 01. D0
        mov     edx, eax                                ; 09D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09D6 _ 8B. 45, 08
        add     edx, eax                                ; 09D9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09DB _ 8A. 45, EC
        mov     byte [edx], al                          ; 09DE _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 09E0 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 09E3 _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 09E7 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 09ED _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 09F0 _ 83. 7D, F8, 0F
        jle     ?_027                                   ; 09F4 _ 0F 8E, FFFFFF4B
        nop                                             ; 09FA _ 90
        nop                                             ; 09FB _ 90
        leave                                           ; 09FC _ C9
        ret                                             ; 09FD _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 09FE _ 55
        mov     ebp, esp                                ; 09FF _ 89. E5
        push    ebx                                     ; 0A01 _ 53
        sub     esp, 16                                 ; 0A02 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0A05 _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0A0C _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0A0E _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0A15 _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0A17 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0A1A _ 0F AF. 45, 24
        mov     edx, eax                                ; 0A1E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A20 _ 8B. 45, F8
        add     eax, edx                                ; 0A23 _ 01. D0
        mov     edx, eax                                ; 0A25 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0A27 _ 8B. 45, 20
        add     eax, edx                                ; 0A2A _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0A2C _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0A2F _ 8B. 55, F4
        add     edx, ecx                                ; 0A32 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0A34 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0A38 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0A3B _ 8B. 4D, F8
        add     ecx, ebx                                ; 0A3E _ 01. D9
        add     edx, ecx                                ; 0A40 _ 01. CA
        mov     ecx, edx                                ; 0A42 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0A44 _ 8B. 55, 08
        add     edx, ecx                                ; 0A47 _ 01. CA
        mov     al, byte [eax]                          ; 0A49 _ 8A. 00
        mov     byte [edx], al                          ; 0A4B _ 88. 02
        inc     dword [ebp-8H]                          ; 0A4D _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0A50 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0A53 _ 3B. 45, 10
        jl      ?_035                                   ; 0A56 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0A58 _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0A5B _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0A5E _ 3B. 45, 14
        jl      ?_034                                   ; 0A61 _ 7C, AB
        nop                                             ; 0A63 _ 90
        nop                                             ; 0A64 _ 90
        add     esp, 16                                 ; 0A65 _ 83. C4, 10
        pop     ebx                                     ; 0A68 _ 5B
        pop     ebp                                     ; 0A69 _ 5D
        ret                                             ; 0A6A _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0A6B _ 55
        mov     ebp, esp                                ; 0A6C _ 89. E5
        sub     esp, 24                                 ; 0A6E _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0A71 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0A76 _ 89. 45, F4
        mov     eax, dword [?_065]                      ; 0A79 _ A1, 00000104(d)
        cwde                                            ; 0A7E _ 98
        mov     dword [ebp-10H], eax                    ; 0A7F _ 89. 45, F0
        mov     ax, word [?_066]                        ; 0A82 _ 66: A1, 00000106(d)
        cwde                                            ; 0A88 _ 98
        mov     dword [ebp-14H], eax                    ; 0A89 _ 89. 45, EC
        sub     esp, 8                                  ; 0A8C _ 83. EC, 08
        push    32                                      ; 0A8F _ 6A, 20
        push    32                                      ; 0A91 _ 6A, 20
        call    io_out8                                 ; 0A93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A98 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0A9B _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0A9F _ 83. EC, 0C
        push    96                                      ; 0AA2 _ 6A, 60
        call    io_in8                                  ; 0AA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA9 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0AAC _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0AAF _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0AB3 _ 83. EC, 08
        push    eax                                     ; 0AB6 _ 50
        push    keyinfo                                 ; 0AB7 _ 68, 00000108(d)
        call    fifo8_put                               ; 0ABC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AC1 _ 83. C4, 10
        nop                                             ; 0AC4 _ 90
        leave                                           ; 0AC5 _ C9
        ret                                             ; 0AC6 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0AC7 _ 55
        mov     ebp, esp                                ; 0AC8 _ 89. E5
        sub     esp, 4                                  ; 0ACA _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0ACD _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0AD0 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0AD3 _ 80. 7D, FC, 09
        jle     ?_038                                   ; 0AD7 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0AD9 _ 8A. 45, FC
        add     eax, 55                                 ; 0ADC _ 83. C0, 37
        jmp     ?_039                                   ; 0ADF _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0AE1 _ 8A. 45, FC
        add     eax, 48                                 ; 0AE4 _ 83. C0, 30
?_039:  leave                                           ; 0AE7 _ C9
        ret                                             ; 0AE8 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0AE9 _ 55
        mov     ebp, esp                                ; 0AEA _ 89. E5
        sub     esp, 20                                 ; 0AEC _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0AEF _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0AF2 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0AF5 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0AFC _ 8A. 45, EC
        and     eax, 0FH                                ; 0AFF _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0B02 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0B05 _ 0F BE. 45, FB
        push    eax                                     ; 0B09 _ 50
        call    charToHexVal                            ; 0B0A _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B0F _ 83. C4, 04
        mov     byte [?_064], al                        ; 0B12 _ A2, 00000003(d)
        mov     al, byte [ebp-14H]                      ; 0B17 _ 8A. 45, EC
        shr     al, 4                                   ; 0B1A _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B1D _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0B20 _ 8A. 45, EC
        movsx   eax, al                                 ; 0B23 _ 0F BE. C0
        push    eax                                     ; 0B26 _ 50
        call    charToHexVal                            ; 0B27 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B2C _ 83. C4, 04
        mov     byte [?_063], al                        ; 0B2F _ A2, 00000002(d)
        mov     eax, keyval                             ; 0B34 _ B8, 00000000(d)
        leave                                           ; 0B39 _ C9
        ret                                             ; 0B3A _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0B3B _ 55
        mov     ebp, esp                                ; 0B3C _ 89. E5
        sub     esp, 16                                 ; 0B3E _ 83. EC, 10
        mov     byte [str.1748], 48                     ; 0B41 _ C6. 05, 00000204(d), 30
        mov     byte [?_067], 88                        ; 0B48 _ C6. 05, 00000205(d), 58
        mov     byte [?_068], 0                         ; 0B4F _ C6. 05, 0000020E(d), 00
        mov     dword [ebp-4H], 2                       ; 0B56 _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0B5D _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0B5F _ 8B. 45, FC
        add     eax, str.1748                           ; 0B62 _ 05, 00000204(d)
        mov     byte [eax], 48                          ; 0B67 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0B6A _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0B6D _ 83. 7D, FC, 09
        jle     ?_040                                   ; 0B71 _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 0B73 _ C7. 45, F8, 00000009
        jmp     ?_044                                   ; 0B7A _ EB, 3E

?_042:  mov     eax, dword [ebp+8H]                     ; 0B7C _ 8B. 45, 08
        and     eax, 0FH                                ; 0B7F _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0B82 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0B85 _ 8B. 45, 08
        shr     eax, 4                                  ; 0B88 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0B8B _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0B8E _ 83. 7D, F4, 09
        jle     ?_043                                   ; 0B92 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 0B94 _ 8B. 45, F4
        add     eax, 55                                 ; 0B97 _ 83. C0, 37
        mov     dl, al                                  ; 0B9A _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0B9C _ 8B. 45, F8
        add     eax, str.1748                           ; 0B9F _ 05, 00000204(d)
        mov     byte [eax], dl                          ; 0BA4 _ 88. 10
        jmp     ?_044                                   ; 0BA6 _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0BA8 _ 8B. 45, F4
        add     eax, 48                                 ; 0BAB _ 83. C0, 30
        mov     dl, al                                  ; 0BAE _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0BB0 _ 8B. 45, F8
        add     eax, str.1748                           ; 0BB3 _ 05, 00000204(d)
        mov     byte [eax], dl                          ; 0BB8 _ 88. 10
?_044:  cmp     dword [ebp-8H], 1                       ; 0BBA _ 83. 7D, F8, 01
        jle     ?_045                                   ; 0BBE _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0BC0 _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0BC4 _ 75, B6
?_045:  mov     eax, str.1748                           ; 0BC6 _ B8, 00000204(d)
        leave                                           ; 0BCB _ C9
        ret                                             ; 0BCC _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0BCD _ 55
        mov     ebp, esp                                ; 0BCE _ 89. E5
        sub     esp, 8                                  ; 0BD0 _ 83. EC, 08
?_046:  sub     esp, 12                                 ; 0BD3 _ 83. EC, 0C
        push    100                                     ; 0BD6 _ 6A, 64
        call    io_in8                                  ; 0BD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BDD _ 83. C4, 10
        and     eax, 02H                                ; 0BE0 _ 83. E0, 02
        test    eax, eax                                ; 0BE3 _ 85. C0
        jz      ?_047                                   ; 0BE5 _ 74, 02
        jmp     ?_046                                   ; 0BE7 _ EB, EA

?_047:  nop                                             ; 0BE9 _ 90
        nop                                             ; 0BEA _ 90
        leave                                           ; 0BEB _ C9
        ret                                             ; 0BEC _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0BED _ 55
        mov     ebp, esp                                ; 0BEE _ 89. E5
        sub     esp, 8                                  ; 0BF0 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0BF3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0BF8 _ 83. EC, 08
        push    96                                      ; 0BFB _ 6A, 60
        push    100                                     ; 0BFD _ 6A, 64
        call    io_out8                                 ; 0BFF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C04 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C07 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C0C _ 83. EC, 08
        push    71                                      ; 0C0F _ 6A, 47
        push    96                                      ; 0C11 _ 6A, 60
        call    io_out8                                 ; 0C13 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C18 _ 83. C4, 10
        nop                                             ; 0C1B _ 90
        leave                                           ; 0C1C _ C9
        ret                                             ; 0C1D _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C1E _ 55
        mov     ebp, esp                                ; 0C1F _ 89. E5
        sub     esp, 8                                  ; 0C21 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C24 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C29 _ 83. EC, 08
        push    212                                     ; 0C2C _ 68, 000000D4
        push    100                                     ; 0C31 _ 6A, 64
        call    io_out8                                 ; 0C33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C38 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C3B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C40 _ 83. EC, 08
        push    244                                     ; 0C43 _ 68, 000000F4
        push    96                                      ; 0C48 _ 6A, 60
        call    io_out8                                 ; 0C4A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C4F _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0C52 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0C55 _ C6. 40, 03, 00
        nop                                             ; 0C59 _ 90
        leave                                           ; 0C5A _ C9
        ret                                             ; 0C5B _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0C5C _ 55
        mov     ebp, esp                                ; 0C5D _ 89. E5
        sub     esp, 24                                 ; 0C5F _ 83. EC, 18
        sub     esp, 8                                  ; 0C62 _ 83. EC, 08
        push    32                                      ; 0C65 _ 6A, 20
        push    160                                     ; 0C67 _ 68, 000000A0
        call    io_out8                                 ; 0C6C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C71 _ 83. C4, 10
        sub     esp, 8                                  ; 0C74 _ 83. EC, 08
        push    32                                      ; 0C77 _ 6A, 20
        push    32                                      ; 0C79 _ 6A, 20
        call    io_out8                                 ; 0C7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C80 _ 83. C4, 10
        sub     esp, 12                                 ; 0C83 _ 83. EC, 0C
        push    96                                      ; 0C86 _ 6A, 60
        call    io_in8                                  ; 0C88 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C8D _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0C90 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C93 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0C97 _ 83. EC, 08
        push    eax                                     ; 0C9A _ 50
        push    mouseinfo                               ; 0C9B _ 68, 00000120(d)
        call    fifo8_put                               ; 0CA0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA5 _ 83. C4, 10
        nop                                             ; 0CA8 _ 90
        leave                                           ; 0CA9 _ C9
        ret                                             ; 0CAA _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0CAB _ 55
        mov     ebp, esp                                ; 0CAC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0CAE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CB1 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0CB4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CB7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0CBA _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0CBD _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0CBF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CC2 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0CC5 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0CC8 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0CCB _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CD2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0CD5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CDC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0CDF _ C7. 40, 08, 00000000
        nop                                             ; 0CE6 _ 90
        pop     ebp                                     ; 0CE7 _ 5D
        ret                                             ; 0CE8 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0CE9 _ 55
        mov     ebp, esp                                ; 0CEA _ 89. E5
        sub     esp, 4                                  ; 0CEC _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CEF _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CF2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CF5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0CF8 _ 8B. 40, 10
        test    eax, eax                                ; 0CFB _ 85. C0
        jnz     ?_048                                   ; 0CFD _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0CFF _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0D02 _ 8B. 40, 14
        or      eax, 01H                                ; 0D05 _ 83. C8, 01
        mov     edx, eax                                ; 0D08 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D0A _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D0D _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D10 _ B8, FFFFFFFF
        jmp     ?_050                                   ; 0D15 _ EB, 4F

?_048:  mov     eax, dword [ebp+8H]                     ; 0D17 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D1A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D1C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D1F _ 8B. 40, 04
        add     edx, eax                                ; 0D22 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0D24 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0D27 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D29 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D2C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D2F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D32 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D35 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D38 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D3B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D3E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D41 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D44 _ 39. C2
        jnz     ?_049                                   ; 0D46 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0D48 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D4B _ C7. 40, 04, 00000000
?_049:  mov     eax, dword [ebp+8H]                     ; 0D52 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D55 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0D58 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0D5B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0D5E _ 89. 50, 10
        mov     eax, 0                                  ; 0D61 _ B8, 00000000
?_050:  leave                                           ; 0D66 _ C9
        ret                                             ; 0D67 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0D68 _ 55
        mov     ebp, esp                                ; 0D69 _ 89. E5
        sub     esp, 16                                 ; 0D6B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0D6E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0D71 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D74 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D77 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D7A _ 39. C2
        jnz     ?_051                                   ; 0D7C _ 75, 07
        mov     eax, 4294967295                         ; 0D7E _ B8, FFFFFFFF
        jmp     ?_053                                   ; 0D83 _ EB, 50

?_051:  mov     eax, dword [ebp+8H]                     ; 0D85 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D88 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D8A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D8D _ 8B. 40, 08
        add     eax, edx                                ; 0D90 _ 01. D0
        mov     al, byte [eax]                          ; 0D92 _ 8A. 00
        movzx   eax, al                                 ; 0D94 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0D97 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D9A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D9D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0DA0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DA3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DA6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DA9 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0DAC _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DAF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DB2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DB5 _ 39. C2
        jnz     ?_052                                   ; 0DB7 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DB9 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0DBC _ C7. 40, 08, 00000000
?_052:  mov     eax, dword [ebp+8H]                     ; 0DC3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DC6 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0DC9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DCC _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DCF _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0DD2 _ 8B. 45, FC
?_053:  leave                                           ; 0DD5 _ C9
        ret                                             ; 0DD6 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0DD7 _ 55
        mov     ebp, esp                                ; 0DD8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DDA _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0DDD _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DE0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DE3 _ 8B. 40, 10
        sub     edx, eax                                ; 0DE6 _ 29. C2
        mov     eax, edx                                ; 0DE8 _ 89. D0
        pop     ebp                                     ; 0DEA _ 5D
        ret                                             ; 0DEB _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0DEC _ 55
        mov     ebp, esp                                ; 0DED _ 89. E5
        sub     esp, 4                                  ; 0DEF _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0DF2 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0DF5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DF8 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0DFB _ 8A. 40, 03
        test    al, al                                  ; 0DFE _ 84. C0
        jnz     ?_055                                   ; 0E00 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E02 _ 80. 7D, FC, FA
        jnz     ?_054                                   ; 0E06 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E08 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E0B _ C6. 40, 03, 01
?_054:  mov     eax, 0                                  ; 0E0F _ B8, 00000000
        jmp     ?_062                                   ; 0E14 _ E9, 00000104

?_055:  mov     eax, dword [ebp+8H]                     ; 0E19 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E1C _ 8A. 40, 03
        cmp     al, 1                                   ; 0E1F _ 3C, 01
        jnz     ?_057                                   ; 0E21 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0E23 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E27 _ 25, 000000C8
        cmp     eax, 8                                  ; 0E2C _ 83. F8, 08
        jnz     ?_056                                   ; 0E2F _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0E31 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E34 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0E37 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0E39 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0E3C _ C6. 40, 03, 02
?_056:  mov     eax, 0                                  ; 0E40 _ B8, 00000000
        jmp     ?_062                                   ; 0E45 _ E9, 000000D3

?_057:  mov     eax, dword [ebp+8H]                     ; 0E4A _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E4D _ 8A. 40, 03
        cmp     al, 2                                   ; 0E50 _ 3C, 02
        jnz     ?_058                                   ; 0E52 _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0E54 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E57 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0E5A _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E5D _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0E60 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0E64 _ B8, 00000000
        jmp     ?_062                                   ; 0E69 _ E9, 000000AF

?_058:  mov     eax, dword [ebp+8H]                     ; 0E6E _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E71 _ 8A. 40, 03
        cmp     al, 3                                   ; 0E74 _ 3C, 03
        jne     ?_061                                   ; 0E76 _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0E7C _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E7F _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0E82 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0E85 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E88 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0E8C _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0E8F _ 8A. 00
        movzx   eax, al                                 ; 0E91 _ 0F B6. C0
        and     eax, 07H                                ; 0E94 _ 83. E0, 07
        mov     edx, eax                                ; 0E97 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E99 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0E9C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E9F _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0EA2 _ 8A. 40, 01
        movzx   edx, al                                 ; 0EA5 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EA8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0EAB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EAE _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0EB1 _ 8A. 40, 02
        movzx   edx, al                                 ; 0EB4 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EB7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EBA _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0EBD _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EC0 _ 8A. 00
        movzx   eax, al                                 ; 0EC2 _ 0F B6. C0
        and     eax, 10H                                ; 0EC5 _ 83. E0, 10
        test    eax, eax                                ; 0EC8 _ 85. C0
        jz      ?_059                                   ; 0ECA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0ECC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0ECF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0ED2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0ED7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ED9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0EDC _ 89. 50, 04
?_059:  mov     eax, dword [ebp+8H]                     ; 0EDF _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EE2 _ 8A. 00
        movzx   eax, al                                 ; 0EE4 _ 0F B6. C0
        and     eax, 20H                                ; 0EE7 _ 83. E0, 20
        test    eax, eax                                ; 0EEA _ 85. C0
        jz      ?_060                                   ; 0EEC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0EEE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0EF1 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0EF4 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0EF9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EFB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EFE _ 89. 50, 08
?_060:  mov     eax, dword [ebp+8H]                     ; 0F01 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F04 _ 8B. 40, 08
        neg     eax                                     ; 0F07 _ F7. D8
        mov     edx, eax                                ; 0F09 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F0B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F0E _ 89. 50, 08
        mov     eax, 1                                  ; 0F11 _ B8, 00000001
        jmp     ?_062                                   ; 0F16 _ EB, 05

?_061:  mov     eax, 4294967295                         ; 0F18 _ B8, FFFFFFFF
?_062:  leave                                           ; 0F1D _ C9
        ret                                             ; 0F1E _ C3
; mouse_decode End of function

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0000 _ 0X

?_063:  db 00H                                          ; 0002 _ .

?_064:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1653:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1700:                                            ; byte
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

?_065:                                                  ; dword
        resb    2                                       ; 0104

?_066:  resw    1                                       ; 0106

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

showPos.1620:                                           ; dword
        resd    1                                       ; 0200

str.1748:                                               ; byte
        resb    1                                       ; 0204

?_067:  resb    9                                       ; 0205

?_068:  resb    1                                       ; 020E


