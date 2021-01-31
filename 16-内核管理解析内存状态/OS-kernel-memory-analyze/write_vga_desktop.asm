; Disassembly of file: write_vga_desktop.o
; Fri Jan 29 19:36:16 2021
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
        mov     eax, dword [?_066]                      ; 0020 _ A1, 00000104(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 000001F8(d)
        mov     ax, word [?_067]                        ; 002B _ 66: A1, 00000106(d)
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
        mov     eax, dword [ebp-14H]                    ; 0397 _ 8B. 45, EC
        sub     esp, 12                                 ; 039A _ 83. EC, 0C
        push    eax                                     ; 039D _ 50
        call    intToHexStr                             ; 039E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A3 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 03A6 _ 89. 45, E8
        call    get_adr_buffer                          ; 03A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 03AE _ 89. 45, E4
        call    io_sti                                  ; 03B1 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03B6 _ 83. EC, 0C
        push    mdec                                    ; 03B9 _ 68, 000001E0(d)
        call    enable_mouse                            ; 03BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C3 _ 83. C4, 10
        mov     dword [ebp-20H], 0                      ; 03C6 _ C7. 45, E0, 00000000
        mov     dword [ebp-0CH], 0                      ; 03CD _ C7. 45, F4, 00000000
?_001:  call    io_cli                                  ; 03D4 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03D9 _ 83. EC, 0C
        push    keyinfo                                 ; 03DC _ 68, 00000108(d)
        call    fifo8_status                            ; 03E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E6 _ 83. C4, 10
        mov     ebx, eax                                ; 03E9 _ 89. C3
        sub     esp, 12                                 ; 03EB _ 83. EC, 0C
        push    mouseinfo                               ; 03EE _ 68, 00000120(d)
        call    fifo8_status                            ; 03F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F8 _ 83. C4, 10
        add     eax, ebx                                ; 03FB _ 01. D8
        test    eax, eax                                ; 03FD _ 85. C0
        jnz     ?_002                                   ; 03FF _ 75, 07
        call    io_stihlt                               ; 0401 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0406 _ EB, CC

?_002:  sub     esp, 12                                 ; 0408 _ 83. EC, 0C
        push    keyinfo                                 ; 040B _ 68, 00000108(d)
        call    fifo8_status                            ; 0410 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0415 _ 83. C4, 10
        test    eax, eax                                ; 0418 _ 85. C0
        jz      ?_003                                   ; 041A _ 74, 68
        call    io_sti                                  ; 041C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0421 _ 83. EC, 0C
        push    keyinfo                                 ; 0424 _ 68, 00000108(d)
        call    fifo8_get                               ; 0429 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 042E _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0431 _ 89. 45, E0
        cmp     dword [ebp-20H], 28                     ; 0434 _ 83. 7D, E0, 1C
        jnz     ?_001                                   ; 0438 _ 75, 9A
        mov     edx, dword [xsize]                      ; 043A _ 8B. 15, 000001F8(d)
        mov     ecx, dword [ebp-0CH]                    ; 0440 _ 8B. 4D, F4
        mov     eax, ecx                                ; 0443 _ 89. C8
        shl     eax, 2                                  ; 0445 _ C1. E0, 02
        add     eax, ecx                                ; 0448 _ 01. C8
        shl     eax, 2                                  ; 044A _ C1. E0, 02
        mov     ecx, eax                                ; 044D _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 044F _ 8B. 45, E4
        add     eax, ecx                                ; 0452 _ 01. C8
        sub     esp, 12                                 ; 0454 _ 83. EC, 0C
        push    7                                       ; 0457 _ 6A, 07
        push    edx                                     ; 0459 _ 52
        push    dword [ebp-0CH]                         ; 045A _ FF. 75, F4
        push    dword [ebp-10H]                         ; 045D _ FF. 75, F0
        push    eax                                     ; 0460 _ 50
        call    showMemoryInfo                          ; 0461 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0466 _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 0469 _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 046C _ 8B. 45, F4
        cmp     eax, dword [ebp-14H]                    ; 046F _ 3B. 45, EC
        jle     ?_001                                   ; 0472 _ 0F 8E, FFFFFF5C
        mov     dword [ebp-0CH], 0                      ; 0478 _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 047F _ E9, FFFFFF50

?_003:  sub     esp, 12                                 ; 0484 _ 83. EC, 0C
        push    mouseinfo                               ; 0487 _ 68, 00000120(d)
        call    fifo8_status                            ; 048C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0491 _ 83. C4, 10
        test    eax, eax                                ; 0494 _ 85. C0
        je      ?_001                                   ; 0496 _ 0F 84, FFFFFF38
        call    show_mouse_info                         ; 049C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 04A1 _ E9, FFFFFF2E
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 04A6 _ 55
        mov     ebp, esp                                ; 04A7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 04A9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 04AC _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 04AF _ A1, 000001F0(d)
        add     eax, edx                                ; 04B4 _ 01. D0
        mov     dword [mx], eax                         ; 04B6 _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 04BB _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 04BE _ 8B. 50, 08
        mov     eax, dword [my]                         ; 04C1 _ A1, 000001F4(d)
        add     eax, edx                                ; 04C6 _ 01. D0
        mov     dword [my], eax                         ; 04C8 _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 04CD _ A1, 000001F0(d)
        test    eax, eax                                ; 04D2 _ 85. C0
        jns     ?_004                                   ; 04D4 _ 79, 0A
        mov     dword [mx], 0                           ; 04D6 _ C7. 05, 000001F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 04E0 _ A1, 000001F4(d)
        test    eax, eax                                ; 04E5 _ 85. C0
        jns     ?_005                                   ; 04E7 _ 79, 0A
        mov     dword [my], 0                           ; 04E9 _ C7. 05, 000001F4(d), 00000000
?_005:  mov     eax, dword [xsize]                      ; 04F3 _ A1, 000001F8(d)
        lea     edx, [eax-0FH]                          ; 04F8 _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 04FB _ A1, 000001F0(d)
        cmp     edx, eax                                ; 0500 _ 39. C2
        jg      ?_006                                   ; 0502 _ 7F, 0D
        mov     eax, dword [xsize]                      ; 0504 _ A1, 000001F8(d)
        sub     eax, 16                                 ; 0509 _ 83. E8, 10
        mov     dword [mx], eax                         ; 050C _ A3, 000001F0(d)
?_006:  mov     eax, dword [ysize]                      ; 0511 _ A1, 000001FC(d)
        lea     edx, [eax-0FH]                          ; 0516 _ 8D. 50, F1
        mov     eax, dword [my]                         ; 0519 _ A1, 000001F4(d)
        cmp     edx, eax                                ; 051E _ 39. C2
        jg      ?_007                                   ; 0520 _ 7F, 0D
        mov     eax, dword [ysize]                      ; 0522 _ A1, 000001FC(d)
        sub     eax, 16                                 ; 0527 _ 83. E8, 10
        mov     dword [my], eax                         ; 052A _ A3, 000001F4(d)
?_007:  nop                                             ; 052F _ 90
        pop     ebp                                     ; 0530 _ 5D
        ret                                             ; 0531 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0532 _ 55
        mov     ebp, esp                                ; 0533 _ 89. E5
        push    esi                                     ; 0535 _ 56
        push    ebx                                     ; 0536 _ 53
        mov     eax, dword [my]                         ; 0537 _ A1, 000001F4(d)
        lea     esi, [eax+0FH]                          ; 053C _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 053F _ A1, 000001F0(d)
        lea     ebx, [eax+0FH]                          ; 0544 _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 0547 _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 054D _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 0553 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0558 _ 83. EC, 04
        push    esi                                     ; 055B _ 56
        push    ebx                                     ; 055C _ 53
        push    ecx                                     ; 055D _ 51
        push    edx                                     ; 055E _ 52
        push    14                                      ; 055F _ 6A, 0E
        push    eax                                     ; 0561 _ 50
        push    dword [ebp+8H]                          ; 0562 _ FF. 75, 08
        call    boxfill8                                ; 0565 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 056A _ 83. C4, 20
        nop                                             ; 056D _ 90
        lea     esp, [ebp-8H]                           ; 056E _ 8D. 65, F8
        pop     ebx                                     ; 0571 _ 5B
        pop     esi                                     ; 0572 _ 5E
        pop     ebp                                     ; 0573 _ 5D
        ret                                             ; 0574 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0575 _ 55
        mov     ebp, esp                                ; 0576 _ 89. E5
        sub     esp, 8                                  ; 0578 _ 83. EC, 08
        mov     ecx, dword [my]                         ; 057B _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 0581 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 0587 _ A1, 000001F8(d)
        push    16                                      ; 058C _ 6A, 10
        push    mcursor                                 ; 058E _ 68, 00000000(d)
        push    ecx                                     ; 0593 _ 51
        push    edx                                     ; 0594 _ 52
        push    16                                      ; 0595 _ 6A, 10
        push    16                                      ; 0597 _ 6A, 10
        push    eax                                     ; 0599 _ 50
        push    dword [ebp+8H]                          ; 059A _ FF. 75, 08
        call    putblock                                ; 059D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05A2 _ 83. C4, 20
        nop                                             ; 05A5 _ 90
        leave                                           ; 05A6 _ C9
        ret                                             ; 05A7 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 05A8 _ 55
        mov     ebp, esp                                ; 05A9 _ 89. E5
        sub     esp, 24                                 ; 05AB _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 05AE _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 05B3 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 05B6 _ C6. 45, F3, 00
        call    io_sti                                  ; 05BA _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05BF _ 83. EC, 0C
        push    mouseinfo                               ; 05C2 _ 68, 00000120(d)
        call    fifo8_get                               ; 05C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05CC _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 05CF _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 05D2 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 05D6 _ 83. EC, 08
        push    eax                                     ; 05D9 _ 50
        push    mdec                                    ; 05DA _ 68, 000001E0(d)
        call    mouse_decode                            ; 05DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E4 _ 83. C4, 10
        test    eax, eax                                ; 05E7 _ 85. C0
        jz      ?_008                                   ; 05E9 _ 74, 2C
        sub     esp, 12                                 ; 05EB _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 05EE _ FF. 75, F4
        call    eraseMouse                              ; 05F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05F6 _ 83. C4, 10
        sub     esp, 12                                 ; 05F9 _ 83. EC, 0C
        push    mdec                                    ; 05FC _ 68, 000001E0(d)
        call    computeMousePosition                    ; 0601 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0606 _ 83. C4, 10
        sub     esp, 12                                 ; 0609 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 060C _ FF. 75, F4
        call    drawMouse                               ; 060F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0614 _ 83. C4, 10
?_008:  nop                                             ; 0617 _ 90
        leave                                           ; 0618 _ C9
        ret                                             ; 0619 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 061A _ 55
        mov     ebp, esp                                ; 061B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 061D _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0620 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0626 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0629 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 062F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0632 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0638 _ 90
        pop     ebp                                     ; 0639 _ 5D
        ret                                             ; 063A _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 063B _ 55
        mov     ebp, esp                                ; 063C _ 89. E5
        sub     esp, 24                                 ; 063E _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0641 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0644 _ 88. 45, F4
        jmp     ?_010                                   ; 0647 _ EB, 35

?_009:  mov     eax, dword [ebp+1CH]                    ; 0649 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 064C _ 8A. 00
        movzx   eax, al                                 ; 064E _ 0F B6. C0
        shl     eax, 4                                  ; 0651 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0654 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 065A _ 0F BE. 45, F4
        sub     esp, 8                                  ; 065E _ 83. EC, 08
        push    edx                                     ; 0661 _ 52
        push    eax                                     ; 0662 _ 50
        push    dword [ebp+14H]                         ; 0663 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0666 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0669 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 066C _ FF. 75, 08
        call    showFont8                               ; 066F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0674 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0677 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 067B _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 067E _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0681 _ 8A. 00
        test    al, al                                  ; 0683 _ 84. C0
        jnz     ?_009                                   ; 0685 _ 75, C2
        nop                                             ; 0687 _ 90
        nop                                             ; 0688 _ 90
        leave                                           ; 0689 _ C9
        ret                                             ; 068A _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 068B _ 55
        mov     ebp, esp                                ; 068C _ 89. E5
        sub     esp, 8                                  ; 068E _ 83. EC, 08
        sub     esp, 4                                  ; 0691 _ 83. EC, 04
        push    table_rgb.1667                          ; 0694 _ 68, 00000020(d)
        push    15                                      ; 0699 _ 6A, 0F
        push    0                                       ; 069B _ 6A, 00
        call    set_palette                             ; 069D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A2 _ 83. C4, 10
        nop                                             ; 06A5 _ 90
        leave                                           ; 06A6 _ C9
        ret                                             ; 06A7 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 06A8 _ 55
        mov     ebp, esp                                ; 06A9 _ 89. E5
        sub     esp, 24                                 ; 06AB _ 83. EC, 18
        call    io_load_eflags                          ; 06AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 06B3 _ 89. 45, F0
        call    io_cli                                  ; 06B6 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 06BB _ 83. EC, 08
        push    dword [ebp+8H]                          ; 06BE _ FF. 75, 08
        push    968                                     ; 06C1 _ 68, 000003C8
        call    io_out8                                 ; 06C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06CB _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 06CE _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 06D1 _ 89. 45, F4
        jmp     ?_012                                   ; 06D4 _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 06D6 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 06D9 _ 8A. 00
        shr     al, 2                                   ; 06DB _ C0. E8, 02
        movzx   eax, al                                 ; 06DE _ 0F B6. C0
        sub     esp, 8                                  ; 06E1 _ 83. EC, 08
        push    eax                                     ; 06E4 _ 50
        push    969                                     ; 06E5 _ 68, 000003C9
        call    io_out8                                 ; 06EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06EF _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06F2 _ 8B. 45, 10
        inc     eax                                     ; 06F5 _ 40
        mov     al, byte [eax]                          ; 06F6 _ 8A. 00
        shr     al, 2                                   ; 06F8 _ C0. E8, 02
        movzx   eax, al                                 ; 06FB _ 0F B6. C0
        sub     esp, 8                                  ; 06FE _ 83. EC, 08
        push    eax                                     ; 0701 _ 50
        push    969                                     ; 0702 _ 68, 000003C9
        call    io_out8                                 ; 0707 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 070C _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 070F _ 8B. 45, 10
        add     eax, 2                                  ; 0712 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0715 _ 8A. 00
        shr     al, 2                                   ; 0717 _ C0. E8, 02
        movzx   eax, al                                 ; 071A _ 0F B6. C0
        sub     esp, 8                                  ; 071D _ 83. EC, 08
        push    eax                                     ; 0720 _ 50
        push    969                                     ; 0721 _ 68, 000003C9
        call    io_out8                                 ; 0726 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 072B _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 072E _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0732 _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 0735 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0738 _ 3B. 45, 0C
        jle     ?_011                                   ; 073B _ 7E, 99
        sub     esp, 12                                 ; 073D _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0740 _ FF. 75, F0
        call    io_store_eflags                         ; 0743 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0748 _ 83. C4, 10
        nop                                             ; 074B _ 90
        leave                                           ; 074C _ C9
        ret                                             ; 074D _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 074E _ 55
        mov     ebp, esp                                ; 074F _ 89. E5
        sub     esp, 20                                 ; 0751 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0754 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0757 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 075A _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 075D _ 89. 45, F8
        jmp     ?_016                                   ; 0760 _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 0762 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0765 _ 89. 45, FC
        jmp     ?_015                                   ; 0768 _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 076A _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 076D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0771 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0773 _ 8B. 45, FC
        add     eax, edx                                ; 0776 _ 01. D0
        mov     edx, eax                                ; 0778 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 077A _ 8B. 45, 08
        add     edx, eax                                ; 077D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 077F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0782 _ 88. 02
        inc     dword [ebp-4H]                          ; 0784 _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 0787 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 078A _ 3B. 45, 1C
        jle     ?_014                                   ; 078D _ 7E, DB
        inc     dword [ebp-8H]                          ; 078F _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 0792 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0795 _ 3B. 45, 20
        jle     ?_013                                   ; 0798 _ 7E, C8
        nop                                             ; 079A _ 90
        nop                                             ; 079B _ 90
        leave                                           ; 079C _ C9
        ret                                             ; 079D _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 079E _ 55
        mov     ebp, esp                                ; 079F _ 89. E5
        sub     esp, 20                                 ; 07A1 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 07A4 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 07A7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07AA _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 07B1 _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 07B6 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 07B9 _ 8B. 45, 1C
        add     eax, edx                                ; 07BC _ 01. D0
        mov     al, byte [eax]                          ; 07BE _ 8A. 00
        mov     byte [ebp-5H], al                       ; 07C0 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 07C3 _ 80. 7D, FB, 00
        jns     ?_018                                   ; 07C7 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 07C9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07CC _ 8B. 45, FC
        add     eax, edx                                ; 07CF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07D1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07D5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07D7 _ 8B. 45, 10
        add     eax, edx                                ; 07DA _ 01. D0
        mov     edx, eax                                ; 07DC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07DE _ 8B. 45, 08
        add     edx, eax                                ; 07E1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 07E3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 07E6 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 07E8 _ 0F BE. 45, FB
        and     eax, 40H                                ; 07EC _ 83. E0, 40
        test    eax, eax                                ; 07EF _ 85. C0
        jz      ?_019                                   ; 07F1 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 07F3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07F6 _ 8B. 45, FC
        add     eax, edx                                ; 07F9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07FB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07FF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0801 _ 8B. 45, 10
        add     eax, edx                                ; 0804 _ 01. D0
        lea     edx, [eax+1H]                           ; 0806 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0809 _ 8B. 45, 08
        add     edx, eax                                ; 080C _ 01. C2
        mov     al, byte [ebp-14H]                      ; 080E _ 8A. 45, EC
        mov     byte [edx], al                          ; 0811 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0813 _ 0F BE. 45, FB
        and     eax, 20H                                ; 0817 _ 83. E0, 20
        test    eax, eax                                ; 081A _ 85. C0
        jz      ?_020                                   ; 081C _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 081E _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0821 _ 8B. 45, FC
        add     eax, edx                                ; 0824 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0826 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 082A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 082C _ 8B. 45, 10
        add     eax, edx                                ; 082F _ 01. D0
        lea     edx, [eax+2H]                           ; 0831 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0834 _ 8B. 45, 08
        add     edx, eax                                ; 0837 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0839 _ 8A. 45, EC
        mov     byte [edx], al                          ; 083C _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 083E _ 0F BE. 45, FB
        and     eax, 10H                                ; 0842 _ 83. E0, 10
        test    eax, eax                                ; 0845 _ 85. C0
        jz      ?_021                                   ; 0847 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0849 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 084C _ 8B. 45, FC
        add     eax, edx                                ; 084F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0851 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0855 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0857 _ 8B. 45, 10
        add     eax, edx                                ; 085A _ 01. D0
        lea     edx, [eax+3H]                           ; 085C _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 085F _ 8B. 45, 08
        add     edx, eax                                ; 0862 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0864 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0867 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0869 _ 0F BE. 45, FB
        and     eax, 08H                                ; 086D _ 83. E0, 08
        test    eax, eax                                ; 0870 _ 85. C0
        jz      ?_022                                   ; 0872 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0874 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0877 _ 8B. 45, FC
        add     eax, edx                                ; 087A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 087C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0880 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0882 _ 8B. 45, 10
        add     eax, edx                                ; 0885 _ 01. D0
        lea     edx, [eax+4H]                           ; 0887 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 088A _ 8B. 45, 08
        add     edx, eax                                ; 088D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 088F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0892 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0894 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0898 _ 83. E0, 04
        test    eax, eax                                ; 089B _ 85. C0
        jz      ?_023                                   ; 089D _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 089F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08A2 _ 8B. 45, FC
        add     eax, edx                                ; 08A5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08AB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08AD _ 8B. 45, 10
        add     eax, edx                                ; 08B0 _ 01. D0
        lea     edx, [eax+5H]                           ; 08B2 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 08B5 _ 8B. 45, 08
        add     edx, eax                                ; 08B8 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08BA _ 8A. 45, EC
        mov     byte [edx], al                          ; 08BD _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 08BF _ 0F BE. 45, FB
        and     eax, 02H                                ; 08C3 _ 83. E0, 02
        test    eax, eax                                ; 08C6 _ 85. C0
        jz      ?_024                                   ; 08C8 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08CA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08CD _ 8B. 45, FC
        add     eax, edx                                ; 08D0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08D2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D8 _ 8B. 45, 10
        add     eax, edx                                ; 08DB _ 01. D0
        lea     edx, [eax+6H]                           ; 08DD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08E0 _ 8B. 45, 08
        add     edx, eax                                ; 08E3 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08E5 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08E8 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 08EA _ 0F BE. 45, FB
        and     eax, 01H                                ; 08EE _ 83. E0, 01
        test    eax, eax                                ; 08F1 _ 85. C0
        jz      ?_025                                   ; 08F3 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08F5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08F8 _ 8B. 45, FC
        add     eax, edx                                ; 08FB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08FD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0901 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0903 _ 8B. 45, 10
        add     eax, edx                                ; 0906 _ 01. D0
        lea     edx, [eax+7H]                           ; 0908 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 090B _ 8B. 45, 08
        add     edx, eax                                ; 090E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0910 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0913 _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 0915 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 0918 _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 091C _ 0F 8E, FFFFFE94
        nop                                             ; 0922 _ 90
        nop                                             ; 0923 _ 90
        leave                                           ; 0924 _ C9
        ret                                             ; 0925 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0926 _ 55
        mov     ebp, esp                                ; 0927 _ 89. E5
        sub     esp, 20                                 ; 0929 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 092C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 092F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0932 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0939 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 093E _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0945 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 094A _ 8B. 45, F8
        shl     eax, 4                                  ; 094D _ C1. E0, 04
        mov     edx, eax                                ; 0950 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0952 _ 8B. 45, FC
        add     eax, edx                                ; 0955 _ 01. D0
        add     eax, cursor.1714                        ; 0957 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 095C _ 8A. 00
        cmp     al, 42                                  ; 095E _ 3C, 2A
        jnz     ?_029                                   ; 0960 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0962 _ 8B. 45, F8
        shl     eax, 4                                  ; 0965 _ C1. E0, 04
        mov     edx, eax                                ; 0968 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 096A _ 8B. 45, FC
        add     eax, edx                                ; 096D _ 01. D0
        mov     edx, eax                                ; 096F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0971 _ 8B. 45, 08
        add     eax, edx                                ; 0974 _ 01. D0
        mov     byte [eax], 0                           ; 0976 _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0979 _ 8B. 45, F8
        shl     eax, 4                                  ; 097C _ C1. E0, 04
        mov     edx, eax                                ; 097F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0981 _ 8B. 45, FC
        add     eax, edx                                ; 0984 _ 01. D0
        add     eax, cursor.1714                        ; 0986 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 098B _ 8A. 00
        cmp     al, 79                                  ; 098D _ 3C, 4F
        jnz     ?_030                                   ; 098F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0991 _ 8B. 45, F8
        shl     eax, 4                                  ; 0994 _ C1. E0, 04
        mov     edx, eax                                ; 0997 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0999 _ 8B. 45, FC
        add     eax, edx                                ; 099C _ 01. D0
        mov     edx, eax                                ; 099E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09A0 _ 8B. 45, 08
        add     eax, edx                                ; 09A3 _ 01. D0
        mov     byte [eax], 7                           ; 09A5 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 09A8 _ 8B. 45, F8
        shl     eax, 4                                  ; 09AB _ C1. E0, 04
        mov     edx, eax                                ; 09AE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09B0 _ 8B. 45, FC
        add     eax, edx                                ; 09B3 _ 01. D0
        add     eax, cursor.1714                        ; 09B5 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 09BA _ 8A. 00
        cmp     al, 46                                  ; 09BC _ 3C, 2E
        jnz     ?_031                                   ; 09BE _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 09C0 _ 8B. 45, F8
        shl     eax, 4                                  ; 09C3 _ C1. E0, 04
        mov     edx, eax                                ; 09C6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 09C8 _ 8B. 45, FC
        add     eax, edx                                ; 09CB _ 01. D0
        mov     edx, eax                                ; 09CD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09CF _ 8B. 45, 08
        add     edx, eax                                ; 09D2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09D4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09D7 _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 09D9 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 09DC _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 09E0 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 09E6 _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 09E9 _ 83. 7D, F8, 0F
        jle     ?_027                                   ; 09ED _ 0F 8E, FFFFFF4B
        nop                                             ; 09F3 _ 90
        nop                                             ; 09F4 _ 90
        leave                                           ; 09F5 _ C9
        ret                                             ; 09F6 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 09F7 _ 55
        mov     ebp, esp                                ; 09F8 _ 89. E5
        push    ebx                                     ; 09FA _ 53
        sub     esp, 16                                 ; 09FB _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 09FE _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 0A05 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 0A07 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 0A0E _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 0A10 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0A13 _ 0F AF. 45, 24
        mov     edx, eax                                ; 0A17 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A19 _ 8B. 45, F8
        add     eax, edx                                ; 0A1C _ 01. D0
        mov     edx, eax                                ; 0A1E _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0A20 _ 8B. 45, 20
        add     eax, edx                                ; 0A23 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0A25 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0A28 _ 8B. 55, F4
        add     edx, ecx                                ; 0A2B _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0A2D _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0A31 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0A34 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0A37 _ 01. D9
        add     edx, ecx                                ; 0A39 _ 01. CA
        mov     ecx, edx                                ; 0A3B _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0A3D _ 8B. 55, 08
        add     edx, ecx                                ; 0A40 _ 01. CA
        mov     al, byte [eax]                          ; 0A42 _ 8A. 00
        mov     byte [edx], al                          ; 0A44 _ 88. 02
        inc     dword [ebp-8H]                          ; 0A46 _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0A49 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0A4C _ 3B. 45, 10
        jl      ?_035                                   ; 0A4F _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0A51 _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0A54 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0A57 _ 3B. 45, 14
        jl      ?_034                                   ; 0A5A _ 7C, AB
        nop                                             ; 0A5C _ 90
        nop                                             ; 0A5D _ 90
        add     esp, 16                                 ; 0A5E _ 83. C4, 10
        pop     ebx                                     ; 0A61 _ 5B
        pop     ebp                                     ; 0A62 _ 5D
        ret                                             ; 0A63 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0A64 _ 55
        mov     ebp, esp                                ; 0A65 _ 89. E5
        sub     esp, 24                                 ; 0A67 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0A6A _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0A6F _ 89. 45, F4
        mov     eax, dword [?_066]                      ; 0A72 _ A1, 00000104(d)
        cwde                                            ; 0A77 _ 98
        mov     dword [ebp-10H], eax                    ; 0A78 _ 89. 45, F0
        mov     ax, word [?_067]                        ; 0A7B _ 66: A1, 00000106(d)
        cwde                                            ; 0A81 _ 98
        mov     dword [ebp-14H], eax                    ; 0A82 _ 89. 45, EC
        sub     esp, 8                                  ; 0A85 _ 83. EC, 08
        push    32                                      ; 0A88 _ 6A, 20
        push    32                                      ; 0A8A _ 6A, 20
        call    io_out8                                 ; 0A8C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A91 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0A94 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0A98 _ 83. EC, 0C
        push    96                                      ; 0A9B _ 6A, 60
        call    io_in8                                  ; 0A9D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA2 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0AA5 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0AA8 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0AAC _ 83. EC, 08
        push    eax                                     ; 0AAF _ 50
        push    keyinfo                                 ; 0AB0 _ 68, 00000108(d)
        call    fifo8_put                               ; 0AB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ABA _ 83. C4, 10
        nop                                             ; 0ABD _ 90
        leave                                           ; 0ABE _ C9
        ret                                             ; 0ABF _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0AC0 _ 55
        mov     ebp, esp                                ; 0AC1 _ 89. E5
        sub     esp, 4                                  ; 0AC3 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0AC6 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0AC9 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0ACC _ 80. 7D, FC, 09
        jle     ?_038                                   ; 0AD0 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0AD2 _ 8A. 45, FC
        add     eax, 55                                 ; 0AD5 _ 83. C0, 37
        jmp     ?_039                                   ; 0AD8 _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0ADA _ 8A. 45, FC
        add     eax, 48                                 ; 0ADD _ 83. C0, 30
?_039:  leave                                           ; 0AE0 _ C9
        ret                                             ; 0AE1 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0AE2 _ 55
        mov     ebp, esp                                ; 0AE3 _ 89. E5
        sub     esp, 20                                 ; 0AE5 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0AE8 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0AEB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0AEE _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0AF5 _ 8A. 45, EC
        and     eax, 0FH                                ; 0AF8 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0AFB _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0AFE _ 0F BE. 45, FB
        push    eax                                     ; 0B02 _ 50
        call    charToHexVal                            ; 0B03 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B08 _ 83. C4, 04
        mov     byte [?_065], al                        ; 0B0B _ A2, 00000003(d)
        mov     al, byte [ebp-14H]                      ; 0B10 _ 8A. 45, EC
        shr     al, 4                                   ; 0B13 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0B16 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0B19 _ 8A. 45, EC
        movsx   eax, al                                 ; 0B1C _ 0F BE. C0
        push    eax                                     ; 0B1F _ 50
        call    charToHexVal                            ; 0B20 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0B25 _ 83. C4, 04
        mov     byte [?_064], al                        ; 0B28 _ A2, 00000002(d)
        mov     eax, keyval                             ; 0B2D _ B8, 00000000(d)
        leave                                           ; 0B32 _ C9
        ret                                             ; 0B33 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0B34 _ 55
        mov     ebp, esp                                ; 0B35 _ 89. E5
        sub     esp, 16                                 ; 0B37 _ 83. EC, 10
        mov     byte [str.1762], 48                     ; 0B3A _ C6. 05, 00000200(d), 30
        mov     byte [?_068], 88                        ; 0B41 _ C6. 05, 00000201(d), 58
        mov     byte [?_069], 0                         ; 0B48 _ C6. 05, 0000020A(d), 00
        mov     dword [ebp-4H], 2                       ; 0B4F _ C7. 45, FC, 00000002
        jmp     ?_041                                   ; 0B56 _ EB, 0E

?_040:  mov     eax, dword [ebp-4H]                     ; 0B58 _ 8B. 45, FC
        add     eax, str.1762                           ; 0B5B _ 05, 00000200(d)
        mov     byte [eax], 48                          ; 0B60 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0B63 _ FF. 45, FC
?_041:  cmp     dword [ebp-4H], 9                       ; 0B66 _ 83. 7D, FC, 09
        jle     ?_040                                   ; 0B6A _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 0B6C _ C7. 45, F8, 00000009
        jmp     ?_045                                   ; 0B73 _ EB, 41

?_042:  mov     eax, dword [ebp+8H]                     ; 0B75 _ 8B. 45, 08
        and     eax, 0FH                                ; 0B78 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0B7B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0B7E _ 8B. 45, 08
        shr     eax, 4                                  ; 0B81 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0B84 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0B87 _ 83. 7D, F4, 09
        jle     ?_043                                   ; 0B8B _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 0B8D _ 8B. 45, F4
        add     eax, 55                                 ; 0B90 _ 83. C0, 37
        mov     dl, al                                  ; 0B93 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0B95 _ 8B. 45, F8
        add     eax, str.1762                           ; 0B98 _ 05, 00000200(d)
        mov     byte [eax], dl                          ; 0B9D _ 88. 10
        jmp     ?_044                                   ; 0B9F _ EB, 12

?_043:  mov     eax, dword [ebp-0CH]                    ; 0BA1 _ 8B. 45, F4
        add     eax, 48                                 ; 0BA4 _ 83. C0, 30
        mov     dl, al                                  ; 0BA7 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0BA9 _ 8B. 45, F8
        add     eax, str.1762                           ; 0BAC _ 05, 00000200(d)
        mov     byte [eax], dl                          ; 0BB1 _ 88. 10
?_044:  dec     dword [ebp-8H]                          ; 0BB3 _ FF. 4D, F8
?_045:  cmp     dword [ebp-8H], 1                       ; 0BB6 _ 83. 7D, F8, 01
        jle     ?_046                                   ; 0BBA _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0BBC _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0BC0 _ 75, B3
?_046:  mov     eax, str.1762                           ; 0BC2 _ B8, 00000200(d)
        leave                                           ; 0BC7 _ C9
        ret                                             ; 0BC8 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0BC9 _ 55
        mov     ebp, esp                                ; 0BCA _ 89. E5
        sub     esp, 8                                  ; 0BCC _ 83. EC, 08
?_047:  sub     esp, 12                                 ; 0BCF _ 83. EC, 0C
        push    100                                     ; 0BD2 _ 6A, 64
        call    io_in8                                  ; 0BD4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BD9 _ 83. C4, 10
        and     eax, 02H                                ; 0BDC _ 83. E0, 02
        test    eax, eax                                ; 0BDF _ 85. C0
        jz      ?_048                                   ; 0BE1 _ 74, 02
        jmp     ?_047                                   ; 0BE3 _ EB, EA

?_048:  nop                                             ; 0BE5 _ 90
        nop                                             ; 0BE6 _ 90
        leave                                           ; 0BE7 _ C9
        ret                                             ; 0BE8 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0BE9 _ 55
        mov     ebp, esp                                ; 0BEA _ 89. E5
        sub     esp, 8                                  ; 0BEC _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0BEF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0BF4 _ 83. EC, 08
        push    96                                      ; 0BF7 _ 6A, 60
        push    100                                     ; 0BF9 _ 6A, 64
        call    io_out8                                 ; 0BFB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C00 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C03 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C08 _ 83. EC, 08
        push    71                                      ; 0C0B _ 6A, 47
        push    96                                      ; 0C0D _ 6A, 60
        call    io_out8                                 ; 0C0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C14 _ 83. C4, 10
        nop                                             ; 0C17 _ 90
        leave                                           ; 0C18 _ C9
        ret                                             ; 0C19 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0C1A _ 55
        mov     ebp, esp                                ; 0C1B _ 89. E5
        sub     esp, 8                                  ; 0C1D _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0C20 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C25 _ 83. EC, 08
        push    212                                     ; 0C28 _ 68, 000000D4
        push    100                                     ; 0C2D _ 6A, 64
        call    io_out8                                 ; 0C2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C34 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0C37 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0C3C _ 83. EC, 08
        push    244                                     ; 0C3F _ 68, 000000F4
        push    96                                      ; 0C44 _ 6A, 60
        call    io_out8                                 ; 0C46 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C4B _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0C4E _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0C51 _ C6. 40, 03, 00
        nop                                             ; 0C55 _ 90
        leave                                           ; 0C56 _ C9
        ret                                             ; 0C57 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0C58 _ 55
        mov     ebp, esp                                ; 0C59 _ 89. E5
        sub     esp, 24                                 ; 0C5B _ 83. EC, 18
        sub     esp, 8                                  ; 0C5E _ 83. EC, 08
        push    32                                      ; 0C61 _ 6A, 20
        push    160                                     ; 0C63 _ 68, 000000A0
        call    io_out8                                 ; 0C68 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C6D _ 83. C4, 10
        sub     esp, 8                                  ; 0C70 _ 83. EC, 08
        push    32                                      ; 0C73 _ 6A, 20
        push    32                                      ; 0C75 _ 6A, 20
        call    io_out8                                 ; 0C77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C7C _ 83. C4, 10
        sub     esp, 12                                 ; 0C7F _ 83. EC, 0C
        push    96                                      ; 0C82 _ 6A, 60
        call    io_in8                                  ; 0C84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C89 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0C8C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0C8F _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0C93 _ 83. EC, 08
        push    eax                                     ; 0C96 _ 50
        push    mouseinfo                               ; 0C97 _ 68, 00000120(d)
        call    fifo8_put                               ; 0C9C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CA1 _ 83. C4, 10
        nop                                             ; 0CA4 _ 90
        leave                                           ; 0CA5 _ C9
        ret                                             ; 0CA6 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0CA7 _ 55
        mov     ebp, esp                                ; 0CA8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0CAA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CAD _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0CB0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0CB3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0CB6 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0CB9 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0CBB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0CBE _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0CC1 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0CC4 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0CC7 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CCE _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0CD1 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0CD8 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0CDB _ C7. 40, 08, 00000000
        nop                                             ; 0CE2 _ 90
        pop     ebp                                     ; 0CE3 _ 5D
        ret                                             ; 0CE4 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0CE5 _ 55
        mov     ebp, esp                                ; 0CE6 _ 89. E5
        sub     esp, 4                                  ; 0CE8 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0CEB _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0CEE _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CF1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0CF4 _ 8B. 40, 10
        test    eax, eax                                ; 0CF7 _ 85. C0
        jnz     ?_049                                   ; 0CF9 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0CFB _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0CFE _ 8B. 40, 14
        or      eax, 01H                                ; 0D01 _ 83. C8, 01
        mov     edx, eax                                ; 0D04 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D06 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0D09 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0D0C _ B8, FFFFFFFF
        jmp     ?_051                                   ; 0D11 _ EB, 4F

?_049:  mov     eax, dword [ebp+8H]                     ; 0D13 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D16 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D18 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D1B _ 8B. 40, 04
        add     edx, eax                                ; 0D1E _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0D20 _ 8A. 45, FC
        mov     byte [edx], al                          ; 0D23 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0D25 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0D28 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0D2B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D2E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0D31 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D34 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0D37 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D3A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D3D _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D40 _ 39. C2
        jnz     ?_050                                   ; 0D42 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0D44 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0D47 _ C7. 40, 04, 00000000
?_050:  mov     eax, dword [ebp+8H]                     ; 0D4E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D51 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0D54 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0D57 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0D5A _ 89. 50, 10
        mov     eax, 0                                  ; 0D5D _ B8, 00000000
?_051:  leave                                           ; 0D62 _ C9
        ret                                             ; 0D63 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0D64 _ 55
        mov     ebp, esp                                ; 0D65 _ 89. E5
        sub     esp, 16                                 ; 0D67 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0D6A _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0D6D _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0D70 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0D73 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0D76 _ 39. C2
        jnz     ?_052                                   ; 0D78 _ 75, 07
        mov     eax, 4294967295                         ; 0D7A _ B8, FFFFFFFF
        jmp     ?_054                                   ; 0D7F _ EB, 50

?_052:  mov     eax, dword [ebp+8H]                     ; 0D81 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0D84 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0D86 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D89 _ 8B. 40, 08
        add     eax, edx                                ; 0D8C _ 01. D0
        mov     al, byte [eax]                          ; 0D8E _ 8A. 00
        movzx   eax, al                                 ; 0D90 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0D93 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D96 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0D99 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0D9C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D9F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DA2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DA5 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0DA8 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0DAE _ 8B. 40, 0C
        cmp     edx, eax                                ; 0DB1 _ 39. C2
        jnz     ?_053                                   ; 0DB3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0DB5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0DB8 _ C7. 40, 08, 00000000
?_053:  mov     eax, dword [ebp+8H]                     ; 0DBF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DC2 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0DC5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0DC8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0DCB _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0DCE _ 8B. 45, FC
?_054:  leave                                           ; 0DD1 _ C9
        ret                                             ; 0DD2 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0DD3 _ 55
        mov     ebp, esp                                ; 0DD4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DD6 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0DD9 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DDC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0DDF _ 8B. 40, 10
        sub     edx, eax                                ; 0DE2 _ 29. C2
        mov     eax, edx                                ; 0DE4 _ 89. D0
        pop     ebp                                     ; 0DE6 _ 5D
        ret                                             ; 0DE7 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0DE8 _ 55
        mov     ebp, esp                                ; 0DE9 _ 89. E5
        sub     esp, 4                                  ; 0DEB _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0DEE _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0DF1 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0DF7 _ 8A. 40, 03
        test    al, al                                  ; 0DFA _ 84. C0
        jnz     ?_056                                   ; 0DFC _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0DFE _ 80. 7D, FC, FA
        jnz     ?_055                                   ; 0E02 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E04 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E07 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 0E0B _ B8, 00000000
        jmp     ?_063                                   ; 0E10 _ E9, 00000104

?_056:  mov     eax, dword [ebp+8H]                     ; 0E15 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E18 _ 8A. 40, 03
        cmp     al, 1                                   ; 0E1B _ 3C, 01
        jnz     ?_058                                   ; 0E1D _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0E1F _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E23 _ 25, 000000C8
        cmp     eax, 8                                  ; 0E28 _ 83. F8, 08
        jnz     ?_057                                   ; 0E2B _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0E2D _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E30 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0E33 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0E35 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0E38 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 0E3C _ B8, 00000000
        jmp     ?_063                                   ; 0E41 _ E9, 000000D3

?_058:  mov     eax, dword [ebp+8H]                     ; 0E46 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E49 _ 8A. 40, 03
        cmp     al, 2                                   ; 0E4C _ 3C, 02
        jnz     ?_059                                   ; 0E4E _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0E50 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E53 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0E56 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E59 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0E5C _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0E60 _ B8, 00000000
        jmp     ?_063                                   ; 0E65 _ E9, 000000AF

?_059:  mov     eax, dword [ebp+8H]                     ; 0E6A _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E6D _ 8A. 40, 03
        cmp     al, 3                                   ; 0E70 _ 3C, 03
        jne     ?_062                                   ; 0E72 _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0E78 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E7B _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0E7E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0E81 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E84 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0E88 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0E8B _ 8A. 00
        movzx   eax, al                                 ; 0E8D _ 0F B6. C0
        and     eax, 07H                                ; 0E90 _ 83. E0, 07
        mov     edx, eax                                ; 0E93 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E95 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0E98 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0E9B _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0E9E _ 8A. 40, 01
        movzx   edx, al                                 ; 0EA1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EA4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0EA7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0EAA _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0EAD _ 8A. 40, 02
        movzx   edx, al                                 ; 0EB0 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EB3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EB6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0EB9 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EBC _ 8A. 00
        movzx   eax, al                                 ; 0EBE _ 0F B6. C0
        and     eax, 10H                                ; 0EC1 _ 83. E0, 10
        test    eax, eax                                ; 0EC4 _ 85. C0
        jz      ?_060                                   ; 0EC6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0EC8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0ECB _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0ECE _ 0D, FFFFFF00
        mov     edx, eax                                ; 0ED3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ED5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0ED8 _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 0EDB _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EDE _ 8A. 00
        movzx   eax, al                                 ; 0EE0 _ 0F B6. C0
        and     eax, 20H                                ; 0EE3 _ 83. E0, 20
        test    eax, eax                                ; 0EE6 _ 85. C0
        jz      ?_061                                   ; 0EE8 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0EEA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0EED _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0EF0 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0EF5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EF7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EFA _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 0EFD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F00 _ 8B. 40, 08
        neg     eax                                     ; 0F03 _ F7. D8
        mov     edx, eax                                ; 0F05 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F07 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F0A _ 89. 50, 08
        mov     eax, 1                                  ; 0F0D _ B8, 00000001
        jmp     ?_063                                   ; 0F12 _ EB, 05

?_062:  mov     eax, 4294967295                         ; 0F14 _ B8, FFFFFFFF
?_063:  leave                                           ; 0F19 _ C9
        ret                                             ; 0F1A _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F1B _ 55
        mov     ebp, esp                                ; 0F1C _ 89. E5
        sub     esp, 56                                 ; 0F1E _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0F21 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0F28 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0F2F _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0F36 _ C7. 45, E8, 00000050
        push    100                                     ; 0F3D _ 6A, 64
        push    dword [ebp+14H]                         ; 0F3F _ FF. 75, 14
        push    0                                       ; 0F42 _ 6A, 00
        push    0                                       ; 0F44 _ 6A, 00
        push    14                                      ; 0F46 _ 6A, 0E
        push    dword [ebp+14H]                         ; 0F48 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F4B _ FF. 75, 0C
        call    boxfill8                                ; 0F4E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F53 _ 83. C4, 1C
        mov     eax, dword [ebp+18H]                    ; 0F56 _ 8B. 45, 18
        movsx   eax, al                                 ; 0F59 _ 0F BE. C0
        sub     esp, 8                                  ; 0F5C _ 83. EC, 08
        push    ?_070                                   ; 0F5F _ 68, 00000000(d)
        push    eax                                     ; 0F64 _ 50
        push    dword [ebp-10H]                         ; 0F65 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0F68 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 0F6B _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0F6E _ FF. 75, 0C
        call    showString                              ; 0F71 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F76 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F79 _ 8B. 45, 10
        sub     esp, 12                                 ; 0F7C _ 83. EC, 0C
        push    eax                                     ; 0F7F _ 50
        call    intToHexStr                             ; 0F80 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F85 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0F88 _ 89. 45, E4
        mov     eax, dword [ebp+18H]                    ; 0F8B _ 8B. 45, 18
        movsx   eax, al                                 ; 0F8E _ 0F BE. C0
        sub     esp, 8                                  ; 0F91 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0F94 _ FF. 75, E4
        push    eax                                     ; 0F97 _ 50
        push    dword [ebp-10H]                         ; 0F98 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0F9B _ FF. 75, EC
        push    dword [ebp+14H]                         ; 0F9E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FA1 _ FF. 75, 0C
        call    showString                              ; 0FA4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA9 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 0FAC _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 0FB0 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FB3 _ 0F BE. C0
        sub     esp, 8                                  ; 0FB6 _ 83. EC, 08
        push    ?_071                                   ; 0FB9 _ 68, 0000000A(d)
        push    eax                                     ; 0FBE _ 50
        push    dword [ebp-10H]                         ; 0FBF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0FC2 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 0FC5 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FC8 _ FF. 75, 0C
        call    showString                              ; 0FCB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD0 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 0FD3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0FD6 _ 8B. 00
        sub     esp, 12                                 ; 0FD8 _ 83. EC, 0C
        push    eax                                     ; 0FDB _ 50
        call    intToHexStr                             ; 0FDC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FE1 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 0FE4 _ 89. 45, E0
        mov     eax, dword [ebp+18H]                    ; 0FE7 _ 8B. 45, 18
        movsx   eax, al                                 ; 0FEA _ 0F BE. C0
        sub     esp, 8                                  ; 0FED _ 83. EC, 08
        push    dword [ebp-20H]                         ; 0FF0 _ FF. 75, E0
        push    eax                                     ; 0FF3 _ 50
        push    dword [ebp-10H]                         ; 0FF4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0FF7 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 0FFA _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 0FFD _ FF. 75, 0C
        call    showString                              ; 1000 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1005 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1008 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 100C _ 8B. 45, 18
        movsx   eax, al                                 ; 100F _ 0F BE. C0
        sub     esp, 8                                  ; 1012 _ 83. EC, 08
        push    ?_072                                   ; 1015 _ 68, 00000016(d)
        push    eax                                     ; 101A _ 50
        push    dword [ebp-10H]                         ; 101B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 101E _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1021 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1024 _ FF. 75, 0C
        call    showString                              ; 1027 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 102C _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 102F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1032 _ 8B. 40, 04
        sub     esp, 12                                 ; 1035 _ 83. EC, 0C
        push    eax                                     ; 1038 _ 50
        call    intToHexStr                             ; 1039 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 103E _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1041 _ 89. 45, DC
        mov     eax, dword [ebp+18H]                    ; 1044 _ 8B. 45, 18
        movsx   eax, al                                 ; 1047 _ 0F BE. C0
        sub     esp, 8                                  ; 104A _ 83. EC, 08
        push    dword [ebp-24H]                         ; 104D _ FF. 75, DC
        push    eax                                     ; 1050 _ 50
        push    dword [ebp-10H]                         ; 1051 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1054 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1057 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 105A _ FF. 75, 0C
        call    showString                              ; 105D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1062 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1065 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1069 _ 8B. 45, 18
        movsx   eax, al                                 ; 106C _ 0F BE. C0
        sub     esp, 8                                  ; 106F _ 83. EC, 08
        push    ?_073                                   ; 1072 _ 68, 00000022(d)
        push    eax                                     ; 1077 _ 50
        push    dword [ebp-10H]                         ; 1078 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 107B _ FF. 75, F4
        push    dword [ebp+14H]                         ; 107E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1081 _ FF. 75, 0C
        call    showString                              ; 1084 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1089 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 108C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 108F _ 8B. 40, 08
        sub     esp, 12                                 ; 1092 _ 83. EC, 0C
        push    eax                                     ; 1095 _ 50
        call    intToHexStr                             ; 1096 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 109B _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 109E _ 89. 45, D8
        mov     eax, dword [ebp+18H]                    ; 10A1 _ 8B. 45, 18
        movsx   eax, al                                 ; 10A4 _ 0F BE. C0
        sub     esp, 8                                  ; 10A7 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 10AA _ FF. 75, D8
        push    eax                                     ; 10AD _ 50
        push    dword [ebp-10H]                         ; 10AE _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10B1 _ FF. 75, EC
        push    dword [ebp+14H]                         ; 10B4 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10B7 _ FF. 75, 0C
        call    showString                              ; 10BA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10BF _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10C2 _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 10C6 _ 8B. 45, 18
        movsx   eax, al                                 ; 10C9 _ 0F BE. C0
        sub     esp, 8                                  ; 10CC _ 83. EC, 08
        push    ?_074                                   ; 10CF _ 68, 0000002E(d)
        push    eax                                     ; 10D4 _ 50
        push    dword [ebp-10H]                         ; 10D5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10D8 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 10DB _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 10DE _ FF. 75, 0C
        call    showString                              ; 10E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E6 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 10E9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 10EC _ 8B. 40, 0C
        sub     esp, 12                                 ; 10EF _ 83. EC, 0C
        push    eax                                     ; 10F2 _ 50
        call    intToHexStr                             ; 10F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10F8 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 10FB _ 89. 45, D4
        mov     eax, dword [ebp+18H]                    ; 10FE _ 8B. 45, 18
        movsx   eax, al                                 ; 1101 _ 0F BE. C0
        sub     esp, 8                                  ; 1104 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 1107 _ FF. 75, D4
        push    eax                                     ; 110A _ 50
        push    dword [ebp-10H]                         ; 110B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 110E _ FF. 75, EC
        push    dword [ebp+14H]                         ; 1111 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1114 _ FF. 75, 0C
        call    showString                              ; 1117 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 111C _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 111F _ 83. 45, F0, 10
        mov     eax, dword [ebp+18H]                    ; 1123 _ 8B. 45, 18
        movsx   eax, al                                 ; 1126 _ 0F BE. C0
        sub     esp, 8                                  ; 1129 _ 83. EC, 08
        push    ?_075                                   ; 112C _ 68, 0000003B(d)
        push    eax                                     ; 1131 _ 50
        push    dword [ebp-10H]                         ; 1132 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1135 _ FF. 75, F4
        push    dword [ebp+14H]                         ; 1138 _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 113B _ FF. 75, 0C
        call    showString                              ; 113E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1143 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 1146 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1149 _ 8B. 40, 10
        sub     esp, 12                                 ; 114C _ 83. EC, 0C
        push    eax                                     ; 114F _ 50
        call    intToHexStr                             ; 1150 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1155 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 1158 _ 89. 45, D0
        mov     eax, dword [ebp+18H]                    ; 115B _ 8B. 45, 18
        movsx   eax, al                                 ; 115E _ 0F BE. C0
        sub     esp, 8                                  ; 1161 _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1164 _ FF. 75, D0
        push    eax                                     ; 1167 _ 50
        push    dword [ebp-10H]                         ; 1168 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 116B _ FF. 75, EC
        push    dword [ebp+14H]                         ; 116E _ FF. 75, 14
        push    dword [ebp+0CH]                         ; 1171 _ FF. 75, 0C
        call    showString                              ; 1174 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1179 _ 83. C4, 20
        nop                                             ; 117C _ 90
        leave                                           ; 117D _ C9
        ret                                             ; 117E _ C3
; showMemoryInfo End of function

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0000 _ 0X

?_064:  db 00H                                          ; 0002 _ .

?_065:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0003 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000B _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1667:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1714:                                            ; byte
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

?_066:                                                  ; dword
        resb    2                                       ; 0104

?_067:  resw    1                                       ; 0106

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

str.1762:                                               ; byte
        resb    1                                       ; 0200

?_068:  resb    9                                       ; 0201

?_069:  resb    1                                       ; 020A


?_070:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0000 _ page is:
        db 20H, 00H                                     ; 0008 _  .

?_071:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 000A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0012 _ L: .

?_072:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0016 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 001E _ H: .

?_073:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0022 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 002A _ w: .

?_074:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 002E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0036 _ gh: .

?_075:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 003B _ type: .


