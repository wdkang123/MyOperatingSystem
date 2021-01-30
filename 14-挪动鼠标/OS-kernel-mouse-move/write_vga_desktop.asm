; Disassembly of file: write_vga_desktop.o
; Fri Jan 29 19:09:04 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global computeMousePosition: function
global eraseMouse: function
global drawMouse: function
global show_mouse_info: function
global initBootInfo: function
global showString: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global mouse_decode: function

extern io_in8                                           ; near
extern io_store_eflags                                  ; near
extern io_out8                                          ; near
extern io_load_eflags                                   ; near
extern systemFont                                       ; byte
extern io_stihlt                                        ; near
extern io_cli                                           ; near
extern io_sti                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 16                                 ; 0005 _ 83. EC, 10
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000100(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 001D _ 89. 45, F4
        mov     eax, dword [?_059]                      ; 0020 _ A1, 00000104(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 000001F8(d)
        mov     ax, word [?_060]                        ; 002B _ 66: A1, 00000106(d)
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
        call    io_sti                                  ; 038F _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0394 _ 83. EC, 0C
        push    mdec                                    ; 0397 _ 68, 000001E0(d)
        call    enable_mouse                            ; 039C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A1 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 03A4 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 03AB _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03B0 _ 83. EC, 0C
        push    keyinfo                                 ; 03B3 _ 68, 00000108(d)
        call    fifo8_status                            ; 03B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BD _ 83. C4, 10
        mov     ebx, eax                                ; 03C0 _ 89. C3
        sub     esp, 12                                 ; 03C2 _ 83. EC, 0C
        push    mouseinfo                               ; 03C5 _ 68, 00000120(d)
        call    fifo8_status                            ; 03CA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CF _ 83. C4, 10
        add     eax, ebx                                ; 03D2 _ 01. D8
        test    eax, eax                                ; 03D4 _ 85. C0
        jnz     ?_002                                   ; 03D6 _ 75, 07
        call    io_stihlt                               ; 03D8 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03DD _ EB, CC

?_002:  sub     esp, 12                                 ; 03DF _ 83. EC, 0C
        push    keyinfo                                 ; 03E2 _ 68, 00000108(d)
        call    fifo8_status                            ; 03E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03EC _ 83. C4, 10
        test    eax, eax                                ; 03EF _ 85. C0
        jz      ?_003                                   ; 03F1 _ 74, 61
        call    io_sti                                  ; 03F3 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03F8 _ 83. EC, 0C
        push    keyinfo                                 ; 03FB _ 68, 00000108(d)
        call    fifo8_get                               ; 0400 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0405 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0408 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 040B _ 8B. 45, F0
        movzx   eax, al                                 ; 040E _ 0F B6. C0
        sub     esp, 12                                 ; 0411 _ 83. EC, 0C
        push    eax                                     ; 0414 _ 50
        call    charToHexStr                            ; 0415 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 041A _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 041D _ 89. 45, EC
        mov     edx, dword [showPos.1615]               ; 0420 _ 8B. 15, 00000200(d)
        mov     eax, dword [xsize]                      ; 0426 _ A1, 000001F8(d)
        sub     esp, 8                                  ; 042B _ 83. EC, 08
        push    dword [ebp-14H]                         ; 042E _ FF. 75, EC
        push    7                                       ; 0431 _ 6A, 07
        push    0                                       ; 0433 _ 6A, 00
        push    edx                                     ; 0435 _ 52
        push    eax                                     ; 0436 _ 50
        push    dword [ebp-0CH]                         ; 0437 _ FF. 75, F4
        call    showString                              ; 043A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 043F _ 83. C4, 20
        mov     eax, dword [showPos.1615]               ; 0442 _ A1, 00000200(d)
        add     eax, 32                                 ; 0447 _ 83. C0, 20
        mov     dword [showPos.1615], eax               ; 044A _ A3, 00000200(d)
        jmp     ?_001                                   ; 044F _ E9, FFFFFF57

?_003:  sub     esp, 12                                 ; 0454 _ 83. EC, 0C
        push    mouseinfo                               ; 0457 _ 68, 00000120(d)
        call    fifo8_status                            ; 045C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0461 _ 83. C4, 10
        test    eax, eax                                ; 0464 _ 85. C0
        je      ?_001                                   ; 0466 _ 0F 84, FFFFFF3F
        call    show_mouse_info                         ; 046C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0471 _ E9, FFFFFF35
; CMain End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0476 _ 55
        mov     ebp, esp                                ; 0477 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0479 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 047C _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 047F _ A1, 000001F0(d)
        add     eax, edx                                ; 0484 _ 01. D0
        mov     dword [mx], eax                         ; 0486 _ A3, 000001F0(d)
        mov     eax, dword [ebp+8H]                     ; 048B _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 048E _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0491 _ A1, 000001F4(d)
        add     eax, edx                                ; 0496 _ 01. D0
        mov     dword [my], eax                         ; 0498 _ A3, 000001F4(d)
        mov     eax, dword [mx]                         ; 049D _ A1, 000001F0(d)
        test    eax, eax                                ; 04A2 _ 85. C0
        jns     ?_004                                   ; 04A4 _ 79, 0A
        mov     dword [mx], 0                           ; 04A6 _ C7. 05, 000001F0(d), 00000000
?_004:  mov     eax, dword [my]                         ; 04B0 _ A1, 000001F4(d)
        test    eax, eax                                ; 04B5 _ 85. C0
        jns     ?_005                                   ; 04B7 _ 79, 0A
        mov     dword [my], 0                           ; 04B9 _ C7. 05, 000001F4(d), 00000000
?_005:  mov     eax, dword [xsize]                      ; 04C3 _ A1, 000001F8(d)
        lea     edx, [eax-0FH]                          ; 04C8 _ 8D. 50, F1
        mov     eax, dword [mx]                         ; 04CB _ A1, 000001F0(d)
        cmp     edx, eax                                ; 04D0 _ 39. C2
        jg      ?_006                                   ; 04D2 _ 7F, 0D
        mov     eax, dword [xsize]                      ; 04D4 _ A1, 000001F8(d)
        sub     eax, 16                                 ; 04D9 _ 83. E8, 10
        mov     dword [mx], eax                         ; 04DC _ A3, 000001F0(d)
?_006:  mov     eax, dword [ysize]                      ; 04E1 _ A1, 000001FC(d)
        lea     edx, [eax-0FH]                          ; 04E6 _ 8D. 50, F1
        mov     eax, dword [my]                         ; 04E9 _ A1, 000001F4(d)
        cmp     edx, eax                                ; 04EE _ 39. C2
        jg      ?_007                                   ; 04F0 _ 7F, 0D
        mov     eax, dword [ysize]                      ; 04F2 _ A1, 000001FC(d)
        sub     eax, 16                                 ; 04F7 _ 83. E8, 10
        mov     dword [my], eax                         ; 04FA _ A3, 000001F4(d)
?_007:  nop                                             ; 04FF _ 90
        pop     ebp                                     ; 0500 _ 5D
        ret                                             ; 0501 _ C3
; computeMousePosition End of function

eraseMouse:; Function begin
        push    ebp                                     ; 0502 _ 55
        mov     ebp, esp                                ; 0503 _ 89. E5
        push    esi                                     ; 0505 _ 56
        push    ebx                                     ; 0506 _ 53
        mov     eax, dword [my]                         ; 0507 _ A1, 000001F4(d)
        lea     esi, [eax+0FH]                          ; 050C _ 8D. 70, 0F
        mov     eax, dword [mx]                         ; 050F _ A1, 000001F0(d)
        lea     ebx, [eax+0FH]                          ; 0514 _ 8D. 58, 0F
        mov     ecx, dword [my]                         ; 0517 _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 051D _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 0523 _ A1, 000001F8(d)
        sub     esp, 4                                  ; 0528 _ 83. EC, 04
        push    esi                                     ; 052B _ 56
        push    ebx                                     ; 052C _ 53
        push    ecx                                     ; 052D _ 51
        push    edx                                     ; 052E _ 52
        push    14                                      ; 052F _ 6A, 0E
        push    eax                                     ; 0531 _ 50
        push    dword [ebp+8H]                          ; 0532 _ FF. 75, 08
        call    boxfill8                                ; 0535 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 053A _ 83. C4, 20
        nop                                             ; 053D _ 90
        lea     esp, [ebp-8H]                           ; 053E _ 8D. 65, F8
        pop     ebx                                     ; 0541 _ 5B
        pop     esi                                     ; 0542 _ 5E
        pop     ebp                                     ; 0543 _ 5D
        ret                                             ; 0544 _ C3
; eraseMouse End of function

drawMouse:; Function begin
        push    ebp                                     ; 0545 _ 55
        mov     ebp, esp                                ; 0546 _ 89. E5
        sub     esp, 8                                  ; 0548 _ 83. EC, 08
        mov     ecx, dword [my]                         ; 054B _ 8B. 0D, 000001F4(d)
        mov     edx, dword [mx]                         ; 0551 _ 8B. 15, 000001F0(d)
        mov     eax, dword [xsize]                      ; 0557 _ A1, 000001F8(d)
        push    16                                      ; 055C _ 6A, 10
        push    mcursor                                 ; 055E _ 68, 00000000(d)
        push    ecx                                     ; 0563 _ 51
        push    edx                                     ; 0564 _ 52
        push    16                                      ; 0565 _ 6A, 10
        push    16                                      ; 0567 _ 6A, 10
        push    eax                                     ; 0569 _ 50
        push    dword [ebp+8H]                          ; 056A _ FF. 75, 08
        call    putblock                                ; 056D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0572 _ 83. C4, 20
        nop                                             ; 0575 _ 90
        leave                                           ; 0576 _ C9
        ret                                             ; 0577 _ C3
; drawMouse End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0578 _ 55
        mov     ebp, esp                                ; 0579 _ 89. E5
        sub     esp, 24                                 ; 057B _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 057E _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0583 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0586 _ C6. 45, F3, 00
        call    io_sti                                  ; 058A _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 058F _ 83. EC, 0C
        push    mouseinfo                               ; 0592 _ 68, 00000120(d)
        call    fifo8_get                               ; 0597 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 059C _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 059F _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 05A2 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 05A6 _ 83. EC, 08
        push    eax                                     ; 05A9 _ 50
        push    mdec                                    ; 05AA _ 68, 000001E0(d)
        call    mouse_decode                            ; 05AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05B4 _ 83. C4, 10
        test    eax, eax                                ; 05B7 _ 85. C0
        jz      ?_008                                   ; 05B9 _ 74, 2C
        sub     esp, 12                                 ; 05BB _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 05BE _ FF. 75, F4
        call    eraseMouse                              ; 05C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C6 _ 83. C4, 10
        sub     esp, 12                                 ; 05C9 _ 83. EC, 0C
        push    mdec                                    ; 05CC _ 68, 000001E0(d)
        call    computeMousePosition                    ; 05D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05D6 _ 83. C4, 10
        sub     esp, 12                                 ; 05D9 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 05DC _ FF. 75, F4
        call    drawMouse                               ; 05DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E4 _ 83. C4, 10
?_008:  nop                                             ; 05E7 _ 90
        leave                                           ; 05E8 _ C9
        ret                                             ; 05E9 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 05EA _ 55
        mov     ebp, esp                                ; 05EB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 05ED _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 05F0 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 05F6 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 05F9 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 05FF _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 0602 _ 66: C7. 40, 06, 00C8
        nop                                             ; 0608 _ 90
        pop     ebp                                     ; 0609 _ 5D
        ret                                             ; 060A _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 060B _ 55
        mov     ebp, esp                                ; 060C _ 89. E5
        sub     esp, 24                                 ; 060E _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0611 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 0614 _ 88. 45, F4
        jmp     ?_010                                   ; 0617 _ EB, 35

?_009:  mov     eax, dword [ebp+1CH]                    ; 0619 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 061C _ 8A. 00
        movzx   eax, al                                 ; 061E _ 0F B6. C0
        shl     eax, 4                                  ; 0621 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 0624 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 062A _ 0F BE. 45, F4
        sub     esp, 8                                  ; 062E _ 83. EC, 08
        push    edx                                     ; 0631 _ 52
        push    eax                                     ; 0632 _ 50
        push    dword [ebp+14H]                         ; 0633 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0636 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0639 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 063C _ FF. 75, 08
        call    showFont8                               ; 063F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0644 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0647 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 064B _ FF. 45, 1C
?_010:  mov     eax, dword [ebp+1CH]                    ; 064E _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0651 _ 8A. 00
        test    al, al                                  ; 0653 _ 84. C0
        jnz     ?_009                                   ; 0655 _ 75, C2
        nop                                             ; 0657 _ 90
        nop                                             ; 0658 _ 90
        leave                                           ; 0659 _ C9
        ret                                             ; 065A _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 065B _ 55
        mov     ebp, esp                                ; 065C _ 89. E5
        sub     esp, 8                                  ; 065E _ 83. EC, 08
        sub     esp, 4                                  ; 0661 _ 83. EC, 04
        push    table_rgb.1648                          ; 0664 _ 68, 00000020(d)
        push    15                                      ; 0669 _ 6A, 0F
        push    0                                       ; 066B _ 6A, 00
        call    set_palette                             ; 066D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0672 _ 83. C4, 10
        nop                                             ; 0675 _ 90
        leave                                           ; 0676 _ C9
        ret                                             ; 0677 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0678 _ 55
        mov     ebp, esp                                ; 0679 _ 89. E5
        sub     esp, 24                                 ; 067B _ 83. EC, 18
        call    io_load_eflags                          ; 067E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0683 _ 89. 45, F0
        call    io_cli                                  ; 0686 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 068B _ 83. EC, 08
        push    dword [ebp+8H]                          ; 068E _ FF. 75, 08
        push    968                                     ; 0691 _ 68, 000003C8
        call    io_out8                                 ; 0696 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 069B _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 069E _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 06A1 _ 89. 45, F4
        jmp     ?_012                                   ; 06A4 _ EB, 5F

?_011:  mov     eax, dword [ebp+10H]                    ; 06A6 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 06A9 _ 8A. 00
        shr     al, 2                                   ; 06AB _ C0. E8, 02
        movzx   eax, al                                 ; 06AE _ 0F B6. C0
        sub     esp, 8                                  ; 06B1 _ 83. EC, 08
        push    eax                                     ; 06B4 _ 50
        push    969                                     ; 06B5 _ 68, 000003C9
        call    io_out8                                 ; 06BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06BF _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06C2 _ 8B. 45, 10
        inc     eax                                     ; 06C5 _ 40
        mov     al, byte [eax]                          ; 06C6 _ 8A. 00
        shr     al, 2                                   ; 06C8 _ C0. E8, 02
        movzx   eax, al                                 ; 06CB _ 0F B6. C0
        sub     esp, 8                                  ; 06CE _ 83. EC, 08
        push    eax                                     ; 06D1 _ 50
        push    969                                     ; 06D2 _ 68, 000003C9
        call    io_out8                                 ; 06D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06DC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 06DF _ 8B. 45, 10
        add     eax, 2                                  ; 06E2 _ 83. C0, 02
        mov     al, byte [eax]                          ; 06E5 _ 8A. 00
        shr     al, 2                                   ; 06E7 _ C0. E8, 02
        movzx   eax, al                                 ; 06EA _ 0F B6. C0
        sub     esp, 8                                  ; 06ED _ 83. EC, 08
        push    eax                                     ; 06F0 _ 50
        push    969                                     ; 06F1 _ 68, 000003C9
        call    io_out8                                 ; 06F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06FB _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 06FE _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0702 _ FF. 45, F4
?_012:  mov     eax, dword [ebp-0CH]                    ; 0705 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0708 _ 3B. 45, 0C
        jle     ?_011                                   ; 070B _ 7E, 99
        sub     esp, 12                                 ; 070D _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0710 _ FF. 75, F0
        call    io_store_eflags                         ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0718 _ 83. C4, 10
        nop                                             ; 071B _ 90
        leave                                           ; 071C _ C9
        ret                                             ; 071D _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 071E _ 55
        mov     ebp, esp                                ; 071F _ 89. E5
        sub     esp, 20                                 ; 0721 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0724 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0727 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 072A _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 072D _ 89. 45, F8
        jmp     ?_016                                   ; 0730 _ EB, 30

?_013:  mov     eax, dword [ebp+14H]                    ; 0732 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0735 _ 89. 45, FC
        jmp     ?_015                                   ; 0738 _ EB, 1D

?_014:  mov     eax, dword [ebp-8H]                     ; 073A _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 073D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0741 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0743 _ 8B. 45, FC
        add     eax, edx                                ; 0746 _ 01. D0
        mov     edx, eax                                ; 0748 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 074A _ 8B. 45, 08
        add     edx, eax                                ; 074D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 074F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0752 _ 88. 02
        inc     dword [ebp-4H]                          ; 0754 _ FF. 45, FC
?_015:  mov     eax, dword [ebp-4H]                     ; 0757 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 075A _ 3B. 45, 1C
        jle     ?_014                                   ; 075D _ 7E, DB
        inc     dword [ebp-8H]                          ; 075F _ FF. 45, F8
?_016:  mov     eax, dword [ebp-8H]                     ; 0762 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0765 _ 3B. 45, 20
        jle     ?_013                                   ; 0768 _ 7E, C8
        nop                                             ; 076A _ 90
        nop                                             ; 076B _ 90
        leave                                           ; 076C _ C9
        ret                                             ; 076D _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 076E _ 55
        mov     ebp, esp                                ; 076F _ 89. E5
        sub     esp, 20                                 ; 0771 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0774 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0777 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 077A _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0781 _ E9, 00000162

?_017:  mov     edx, dword [ebp-4H]                     ; 0786 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0789 _ 8B. 45, 1C
        add     eax, edx                                ; 078C _ 01. D0
        mov     al, byte [eax]                          ; 078E _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0790 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0793 _ 80. 7D, FB, 00
        jns     ?_018                                   ; 0797 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0799 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 079C _ 8B. 45, FC
        add     eax, edx                                ; 079F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07A1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07A5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07A7 _ 8B. 45, 10
        add     eax, edx                                ; 07AA _ 01. D0
        mov     edx, eax                                ; 07AC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 07AE _ 8B. 45, 08
        add     edx, eax                                ; 07B1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 07B3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 07B6 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 07B8 _ 0F BE. 45, FB
        and     eax, 40H                                ; 07BC _ 83. E0, 40
        test    eax, eax                                ; 07BF _ 85. C0
        jz      ?_019                                   ; 07C1 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 07C3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07C6 _ 8B. 45, FC
        add     eax, edx                                ; 07C9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07CB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07CF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07D1 _ 8B. 45, 10
        add     eax, edx                                ; 07D4 _ 01. D0
        lea     edx, [eax+1H]                           ; 07D6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 07D9 _ 8B. 45, 08
        add     edx, eax                                ; 07DC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 07DE _ 8A. 45, EC
        mov     byte [edx], al                          ; 07E1 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 07E3 _ 0F BE. 45, FB
        and     eax, 20H                                ; 07E7 _ 83. E0, 20
        test    eax, eax                                ; 07EA _ 85. C0
        jz      ?_020                                   ; 07EC _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 07EE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 07F1 _ 8B. 45, FC
        add     eax, edx                                ; 07F4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 07F6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 07FA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 07FC _ 8B. 45, 10
        add     eax, edx                                ; 07FF _ 01. D0
        lea     edx, [eax+2H]                           ; 0801 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0804 _ 8B. 45, 08
        add     edx, eax                                ; 0807 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0809 _ 8A. 45, EC
        mov     byte [edx], al                          ; 080C _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 080E _ 0F BE. 45, FB
        and     eax, 10H                                ; 0812 _ 83. E0, 10
        test    eax, eax                                ; 0815 _ 85. C0
        jz      ?_021                                   ; 0817 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0819 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 081C _ 8B. 45, FC
        add     eax, edx                                ; 081F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0821 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0825 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0827 _ 8B. 45, 10
        add     eax, edx                                ; 082A _ 01. D0
        lea     edx, [eax+3H]                           ; 082C _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 082F _ 8B. 45, 08
        add     edx, eax                                ; 0832 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0834 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0837 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 0839 _ 0F BE. 45, FB
        and     eax, 08H                                ; 083D _ 83. E0, 08
        test    eax, eax                                ; 0840 _ 85. C0
        jz      ?_022                                   ; 0842 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0844 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0847 _ 8B. 45, FC
        add     eax, edx                                ; 084A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 084C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0850 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0852 _ 8B. 45, 10
        add     eax, edx                                ; 0855 _ 01. D0
        lea     edx, [eax+4H]                           ; 0857 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 085A _ 8B. 45, 08
        add     edx, eax                                ; 085D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 085F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0862 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 0864 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0868 _ 83. E0, 04
        test    eax, eax                                ; 086B _ 85. C0
        jz      ?_023                                   ; 086D _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 086F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0872 _ 8B. 45, FC
        add     eax, edx                                ; 0875 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0877 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 087B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 087D _ 8B. 45, 10
        add     eax, edx                                ; 0880 _ 01. D0
        lea     edx, [eax+5H]                           ; 0882 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0885 _ 8B. 45, 08
        add     edx, eax                                ; 0888 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 088A _ 8A. 45, EC
        mov     byte [edx], al                          ; 088D _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 088F _ 0F BE. 45, FB
        and     eax, 02H                                ; 0893 _ 83. E0, 02
        test    eax, eax                                ; 0896 _ 85. C0
        jz      ?_024                                   ; 0898 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 089A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 089D _ 8B. 45, FC
        add     eax, edx                                ; 08A0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08A2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08A6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08A8 _ 8B. 45, 10
        add     eax, edx                                ; 08AB _ 01. D0
        lea     edx, [eax+6H]                           ; 08AD _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 08B0 _ 8B. 45, 08
        add     edx, eax                                ; 08B3 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08B5 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08B8 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 08BA _ 0F BE. 45, FB
        and     eax, 01H                                ; 08BE _ 83. E0, 01
        test    eax, eax                                ; 08C1 _ 85. C0
        jz      ?_025                                   ; 08C3 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 08C5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 08C8 _ 8B. 45, FC
        add     eax, edx                                ; 08CB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 08CD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08D1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 08D3 _ 8B. 45, 10
        add     eax, edx                                ; 08D6 _ 01. D0
        lea     edx, [eax+7H]                           ; 08D8 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 08DB _ 8B. 45, 08
        add     edx, eax                                ; 08DE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08E0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 08E3 _ 88. 02
?_025:  inc     dword [ebp-4H]                          ; 08E5 _ FF. 45, FC
?_026:  cmp     dword [ebp-4H], 15                      ; 08E8 _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 08EC _ 0F 8E, FFFFFE94
        nop                                             ; 08F2 _ 90
        nop                                             ; 08F3 _ 90
        leave                                           ; 08F4 _ C9
        ret                                             ; 08F5 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 08F6 _ 55
        mov     ebp, esp                                ; 08F7 _ 89. E5
        sub     esp, 20                                 ; 08F9 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 08FC _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 08FF _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0902 _ C7. 45, F8, 00000000
        jmp     ?_033                                   ; 0909 _ E9, 000000AB

?_027:  mov     dword [ebp-4H], 0                       ; 090E _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0915 _ E9, 00000092

?_028:  mov     eax, dword [ebp-8H]                     ; 091A _ 8B. 45, F8
        shl     eax, 4                                  ; 091D _ C1. E0, 04
        mov     edx, eax                                ; 0920 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0922 _ 8B. 45, FC
        add     eax, edx                                ; 0925 _ 01. D0
        add     eax, cursor.1695                        ; 0927 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 092C _ 8A. 00
        cmp     al, 42                                  ; 092E _ 3C, 2A
        jnz     ?_029                                   ; 0930 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0932 _ 8B. 45, F8
        shl     eax, 4                                  ; 0935 _ C1. E0, 04
        mov     edx, eax                                ; 0938 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 093A _ 8B. 45, FC
        add     eax, edx                                ; 093D _ 01. D0
        mov     edx, eax                                ; 093F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0941 _ 8B. 45, 08
        add     eax, edx                                ; 0944 _ 01. D0
        mov     byte [eax], 0                           ; 0946 _ C6. 00, 00
?_029:  mov     eax, dword [ebp-8H]                     ; 0949 _ 8B. 45, F8
        shl     eax, 4                                  ; 094C _ C1. E0, 04
        mov     edx, eax                                ; 094F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0951 _ 8B. 45, FC
        add     eax, edx                                ; 0954 _ 01. D0
        add     eax, cursor.1695                        ; 0956 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 095B _ 8A. 00
        cmp     al, 79                                  ; 095D _ 3C, 4F
        jnz     ?_030                                   ; 095F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0961 _ 8B. 45, F8
        shl     eax, 4                                  ; 0964 _ C1. E0, 04
        mov     edx, eax                                ; 0967 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0969 _ 8B. 45, FC
        add     eax, edx                                ; 096C _ 01. D0
        mov     edx, eax                                ; 096E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0970 _ 8B. 45, 08
        add     eax, edx                                ; 0973 _ 01. D0
        mov     byte [eax], 7                           ; 0975 _ C6. 00, 07
?_030:  mov     eax, dword [ebp-8H]                     ; 0978 _ 8B. 45, F8
        shl     eax, 4                                  ; 097B _ C1. E0, 04
        mov     edx, eax                                ; 097E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0980 _ 8B. 45, FC
        add     eax, edx                                ; 0983 _ 01. D0
        add     eax, cursor.1695                        ; 0985 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 098A _ 8A. 00
        cmp     al, 46                                  ; 098C _ 3C, 2E
        jnz     ?_031                                   ; 098E _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0990 _ 8B. 45, F8
        shl     eax, 4                                  ; 0993 _ C1. E0, 04
        mov     edx, eax                                ; 0996 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0998 _ 8B. 45, FC
        add     eax, edx                                ; 099B _ 01. D0
        mov     edx, eax                                ; 099D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 099F _ 8B. 45, 08
        add     edx, eax                                ; 09A2 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09A4 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09A7 _ 88. 02
?_031:  inc     dword [ebp-4H]                          ; 09A9 _ FF. 45, FC
?_032:  cmp     dword [ebp-4H], 15                      ; 09AC _ 83. 7D, FC, 0F
        jle     ?_028                                   ; 09B0 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 09B6 _ FF. 45, F8
?_033:  cmp     dword [ebp-8H], 15                      ; 09B9 _ 83. 7D, F8, 0F
        jle     ?_027                                   ; 09BD _ 0F 8E, FFFFFF4B
        nop                                             ; 09C3 _ 90
        nop                                             ; 09C4 _ 90
        leave                                           ; 09C5 _ C9
        ret                                             ; 09C6 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 09C7 _ 55
        mov     ebp, esp                                ; 09C8 _ 89. E5
        push    ebx                                     ; 09CA _ 53
        sub     esp, 16                                 ; 09CB _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 09CE _ C7. 45, F4, 00000000
        jmp     ?_037                                   ; 09D5 _ EB, 4D

?_034:  mov     dword [ebp-8H], 0                       ; 09D7 _ C7. 45, F8, 00000000
        jmp     ?_036                                   ; 09DE _ EB, 39

?_035:  mov     eax, dword [ebp-0CH]                    ; 09E0 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 09E3 _ 0F AF. 45, 24
        mov     edx, eax                                ; 09E7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 09E9 _ 8B. 45, F8
        add     eax, edx                                ; 09EC _ 01. D0
        mov     edx, eax                                ; 09EE _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 09F0 _ 8B. 45, 20
        add     eax, edx                                ; 09F3 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 09F5 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 09F8 _ 8B. 55, F4
        add     edx, ecx                                ; 09FB _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 09FD _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0A01 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0A04 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0A07 _ 01. D9
        add     edx, ecx                                ; 0A09 _ 01. CA
        mov     ecx, edx                                ; 0A0B _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0A0D _ 8B. 55, 08
        add     edx, ecx                                ; 0A10 _ 01. CA
        mov     al, byte [eax]                          ; 0A12 _ 8A. 00
        mov     byte [edx], al                          ; 0A14 _ 88. 02
        inc     dword [ebp-8H]                          ; 0A16 _ FF. 45, F8
?_036:  mov     eax, dword [ebp-8H]                     ; 0A19 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0A1C _ 3B. 45, 10
        jl      ?_035                                   ; 0A1F _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0A21 _ FF. 45, F4
?_037:  mov     eax, dword [ebp-0CH]                    ; 0A24 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0A27 _ 3B. 45, 14
        jl      ?_034                                   ; 0A2A _ 7C, AB
        nop                                             ; 0A2C _ 90
        nop                                             ; 0A2D _ 90
        add     esp, 16                                 ; 0A2E _ 83. C4, 10
        pop     ebx                                     ; 0A31 _ 5B
        pop     ebp                                     ; 0A32 _ 5D
        ret                                             ; 0A33 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0A34 _ 55
        mov     ebp, esp                                ; 0A35 _ 89. E5
        sub     esp, 24                                 ; 0A37 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0A3A _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0A3F _ 89. 45, F4
        mov     eax, dword [?_059]                      ; 0A42 _ A1, 00000104(d)
        cwde                                            ; 0A47 _ 98
        mov     dword [ebp-10H], eax                    ; 0A48 _ 89. 45, F0
        mov     ax, word [?_060]                        ; 0A4B _ 66: A1, 00000106(d)
        cwde                                            ; 0A51 _ 98
        mov     dword [ebp-14H], eax                    ; 0A52 _ 89. 45, EC
        sub     esp, 8                                  ; 0A55 _ 83. EC, 08
        push    32                                      ; 0A58 _ 6A, 20
        push    32                                      ; 0A5A _ 6A, 20
        call    io_out8                                 ; 0A5C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A61 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0A64 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0A68 _ 83. EC, 0C
        push    96                                      ; 0A6B _ 6A, 60
        call    io_in8                                  ; 0A6D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A72 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0A75 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0A78 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0A7C _ 83. EC, 08
        push    eax                                     ; 0A7F _ 50
        push    keyinfo                                 ; 0A80 _ 68, 00000108(d)
        call    fifo8_put                               ; 0A85 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A8A _ 83. C4, 10
        nop                                             ; 0A8D _ 90
        leave                                           ; 0A8E _ C9
        ret                                             ; 0A8F _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0A90 _ 55
        mov     ebp, esp                                ; 0A91 _ 89. E5
        sub     esp, 4                                  ; 0A93 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0A96 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0A99 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0A9C _ 80. 7D, FC, 09
        jle     ?_038                                   ; 0AA0 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0AA2 _ 8A. 45, FC
        add     eax, 55                                 ; 0AA5 _ 83. C0, 37
        jmp     ?_039                                   ; 0AA8 _ EB, 06

?_038:  mov     al, byte [ebp-4H]                       ; 0AAA _ 8A. 45, FC
        add     eax, 48                                 ; 0AAD _ 83. C0, 30
?_039:  leave                                           ; 0AB0 _ C9
        ret                                             ; 0AB1 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0AB2 _ 55
        mov     ebp, esp                                ; 0AB3 _ 89. E5
        sub     esp, 20                                 ; 0AB5 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0AB8 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0ABB _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0ABE _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0AC5 _ 8A. 45, EC
        and     eax, 0FH                                ; 0AC8 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0ACB _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0ACE _ 0F BE. 45, FB
        push    eax                                     ; 0AD2 _ 50
        call    charToHexVal                            ; 0AD3 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0AD8 _ 83. C4, 04
        mov     byte [?_058], al                        ; 0ADB _ A2, 00000013(d)
        mov     al, byte [ebp-14H]                      ; 0AE0 _ 8A. 45, EC
        shr     al, 4                                   ; 0AE3 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0AE6 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0AE9 _ 8A. 45, EC
        movsx   eax, al                                 ; 0AEC _ 0F BE. C0
        push    eax                                     ; 0AEF _ 50
        call    charToHexVal                            ; 0AF0 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0AF5 _ 83. C4, 04
        mov     byte [?_057], al                        ; 0AF8 _ A2, 00000012(d)
        mov     eax, keyval                             ; 0AFD _ B8, 00000010(d)
        leave                                           ; 0B02 _ C9
        ret                                             ; 0B03 _ C3
; charToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0B04 _ 55
        mov     ebp, esp                                ; 0B05 _ 89. E5
        sub     esp, 8                                  ; 0B07 _ 83. EC, 08
?_040:  sub     esp, 12                                 ; 0B0A _ 83. EC, 0C
        push    100                                     ; 0B0D _ 6A, 64
        call    io_in8                                  ; 0B0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B14 _ 83. C4, 10
        and     eax, 02H                                ; 0B17 _ 83. E0, 02
        test    eax, eax                                ; 0B1A _ 85. C0
        jz      ?_041                                   ; 0B1C _ 74, 02
        jmp     ?_040                                   ; 0B1E _ EB, EA

?_041:  nop                                             ; 0B20 _ 90
        nop                                             ; 0B21 _ 90
        leave                                           ; 0B22 _ C9
        ret                                             ; 0B23 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0B24 _ 55
        mov     ebp, esp                                ; 0B25 _ 89. E5
        sub     esp, 8                                  ; 0B27 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0B2A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B2F _ 83. EC, 08
        push    96                                      ; 0B32 _ 6A, 60
        push    100                                     ; 0B34 _ 6A, 64
        call    io_out8                                 ; 0B36 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B3B _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0B3E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B43 _ 83. EC, 08
        push    71                                      ; 0B46 _ 6A, 47
        push    96                                      ; 0B48 _ 6A, 60
        call    io_out8                                 ; 0B4A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B4F _ 83. C4, 10
        nop                                             ; 0B52 _ 90
        leave                                           ; 0B53 _ C9
        ret                                             ; 0B54 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0B55 _ 55
        mov     ebp, esp                                ; 0B56 _ 89. E5
        sub     esp, 8                                  ; 0B58 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0B5B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B60 _ 83. EC, 08
        push    212                                     ; 0B63 _ 68, 000000D4
        push    100                                     ; 0B68 _ 6A, 64
        call    io_out8                                 ; 0B6A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B6F _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0B72 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0B77 _ 83. EC, 08
        push    244                                     ; 0B7A _ 68, 000000F4
        push    96                                      ; 0B7F _ 6A, 60
        call    io_out8                                 ; 0B81 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B86 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0B89 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0B8C _ C6. 40, 03, 00
        nop                                             ; 0B90 _ 90
        leave                                           ; 0B91 _ C9
        ret                                             ; 0B92 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0B93 _ 55
        mov     ebp, esp                                ; 0B94 _ 89. E5
        sub     esp, 24                                 ; 0B96 _ 83. EC, 18
        sub     esp, 8                                  ; 0B99 _ 83. EC, 08
        push    32                                      ; 0B9C _ 6A, 20
        push    160                                     ; 0B9E _ 68, 000000A0
        call    io_out8                                 ; 0BA3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BA8 _ 83. C4, 10
        sub     esp, 8                                  ; 0BAB _ 83. EC, 08
        push    32                                      ; 0BAE _ 6A, 20
        push    32                                      ; 0BB0 _ 6A, 20
        call    io_out8                                 ; 0BB2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BB7 _ 83. C4, 10
        sub     esp, 12                                 ; 0BBA _ 83. EC, 0C
        push    96                                      ; 0BBD _ 6A, 60
        call    io_in8                                  ; 0BBF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BC4 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0BC7 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0BCA _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0BCE _ 83. EC, 08
        push    eax                                     ; 0BD1 _ 50
        push    mouseinfo                               ; 0BD2 _ 68, 00000120(d)
        call    fifo8_put                               ; 0BD7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BDC _ 83. C4, 10
        nop                                             ; 0BDF _ 90
        leave                                           ; 0BE0 _ C9
        ret                                             ; 0BE1 _ C3
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0BE2 _ 55
        mov     ebp, esp                                ; 0BE3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0BE5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0BE8 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 0BEB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0BEE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0BF1 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0BF4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0BF6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0BF9 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 0BFC _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0BFF _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0C02 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 0C09 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0C0C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0C13 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0C16 _ C7. 40, 08, 00000000
        nop                                             ; 0C1D _ 90
        pop     ebp                                     ; 0C1E _ 5D
        ret                                             ; 0C1F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0C20 _ 55
        mov     ebp, esp                                ; 0C21 _ 89. E5
        sub     esp, 4                                  ; 0C23 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0C26 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0C29 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0C2C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C2F _ 8B. 40, 10
        test    eax, eax                                ; 0C32 _ 85. C0
        jnz     ?_042                                   ; 0C34 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0C36 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 0C39 _ 8B. 40, 14
        or      eax, 01H                                ; 0C3C _ 83. C8, 01
        mov     edx, eax                                ; 0C3F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C41 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 0C44 _ 89. 50, 14
        mov     eax, 4294967295                         ; 0C47 _ B8, FFFFFFFF
        jmp     ?_044                                   ; 0C4C _ EB, 4F

?_042:  mov     eax, dword [ebp+8H]                     ; 0C4E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0C51 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0C53 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C56 _ 8B. 40, 04
        add     edx, eax                                ; 0C59 _ 01. C2
        mov     al, byte [ebp-4H]                       ; 0C5B _ 8A. 45, FC
        mov     byte [edx], al                          ; 0C5E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 0C60 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0C63 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 0C66 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C69 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0C6C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C6F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0C72 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C75 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0C78 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0C7B _ 39. C2
        jnz     ?_043                                   ; 0C7D _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0C7F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 0C82 _ C7. 40, 04, 00000000
?_043:  mov     eax, dword [ebp+8H]                     ; 0C89 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0C8C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 0C8F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 0C92 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0C95 _ 89. 50, 10
        mov     eax, 0                                  ; 0C98 _ B8, 00000000
?_044:  leave                                           ; 0C9D _ C9
        ret                                             ; 0C9E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0C9F _ 55
        mov     ebp, esp                                ; 0CA0 _ 89. E5
        sub     esp, 16                                 ; 0CA2 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0CA5 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0CA8 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0CAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0CAE _ 8B. 40, 0C
        cmp     edx, eax                                ; 0CB1 _ 39. C2
        jnz     ?_045                                   ; 0CB3 _ 75, 07
        mov     eax, 4294967295                         ; 0CB5 _ B8, FFFFFFFF
        jmp     ?_047                                   ; 0CBA _ EB, 50

?_045:  mov     eax, dword [ebp+8H]                     ; 0CBC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0CBF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0CC1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CC4 _ 8B. 40, 08
        add     eax, edx                                ; 0CC7 _ 01. D0
        mov     al, byte [eax]                          ; 0CC9 _ 8A. 00
        movzx   eax, al                                 ; 0CCB _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0CCE _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0CD1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0CD4 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0CD7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0CDA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0CDD _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CE0 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0CE3 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0CE6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0CE9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0CEC _ 39. C2
        jnz     ?_046                                   ; 0CEE _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0CF0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0CF3 _ C7. 40, 08, 00000000
?_046:  mov     eax, dword [ebp+8H]                     ; 0CFA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0CFD _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0D00 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D03 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0D06 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0D09 _ 8B. 45, FC
?_047:  leave                                           ; 0D0C _ C9
        ret                                             ; 0D0D _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0D0E _ 55
        mov     ebp, esp                                ; 0D0F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0D11 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0D14 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0D17 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0D1A _ 8B. 40, 10
        sub     edx, eax                                ; 0D1D _ 29. C2
        mov     eax, edx                                ; 0D1F _ 89. D0
        pop     ebp                                     ; 0D21 _ 5D
        ret                                             ; 0D22 _ C3
; fifo8_status End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0D23 _ 55
        mov     ebp, esp                                ; 0D24 _ 89. E5
        sub     esp, 4                                  ; 0D26 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0D29 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0D2C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0D2F _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0D32 _ 8A. 40, 03
        test    al, al                                  ; 0D35 _ 84. C0
        jnz     ?_049                                   ; 0D37 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0D39 _ 80. 7D, FC, FA
        jnz     ?_048                                   ; 0D3D _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0D3F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0D42 _ C6. 40, 03, 01
?_048:  mov     eax, 0                                  ; 0D46 _ B8, 00000000
        jmp     ?_056                                   ; 0D4B _ E9, 00000104

?_049:  mov     eax, dword [ebp+8H]                     ; 0D50 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0D53 _ 8A. 40, 03
        cmp     al, 1                                   ; 0D56 _ 3C, 01
        jnz     ?_051                                   ; 0D58 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0D5A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0D5E _ 25, 000000C8
        cmp     eax, 8                                  ; 0D63 _ 83. F8, 08
        jnz     ?_050                                   ; 0D66 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0D68 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0D6B _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0D6E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0D70 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0D73 _ C6. 40, 03, 02
?_050:  mov     eax, 0                                  ; 0D77 _ B8, 00000000
        jmp     ?_056                                   ; 0D7C _ E9, 000000D3

?_051:  mov     eax, dword [ebp+8H]                     ; 0D81 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0D84 _ 8A. 40, 03
        cmp     al, 2                                   ; 0D87 _ 3C, 02
        jnz     ?_052                                   ; 0D89 _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0D8E _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0D91 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0D94 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0D97 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0D9B _ B8, 00000000
        jmp     ?_056                                   ; 0DA0 _ E9, 000000AF

?_052:  mov     eax, dword [ebp+8H]                     ; 0DA5 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0DA8 _ 8A. 40, 03
        cmp     al, 3                                   ; 0DAB _ 3C, 03
        jne     ?_055                                   ; 0DAD _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0DB3 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0DB6 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0DB9 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0DBC _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0DBF _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0DC3 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0DC6 _ 8A. 00
        movzx   eax, al                                 ; 0DC8 _ 0F B6. C0
        and     eax, 07H                                ; 0DCB _ 83. E0, 07
        mov     edx, eax                                ; 0DCE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DD0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0DD3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0DD6 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0DD9 _ 8A. 40, 01
        movzx   edx, al                                 ; 0DDC _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DDF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0DE2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0DE5 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0DE8 _ 8A. 40, 02
        movzx   edx, al                                 ; 0DEB _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0DEE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0DF1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0DF7 _ 8A. 00
        movzx   eax, al                                 ; 0DF9 _ 0F B6. C0
        and     eax, 10H                                ; 0DFC _ 83. E0, 10
        test    eax, eax                                ; 0DFF _ 85. C0
        jz      ?_053                                   ; 0E01 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0E03 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0E06 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0E09 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0E0E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E10 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0E13 _ 89. 50, 04
?_053:  mov     eax, dword [ebp+8H]                     ; 0E16 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0E19 _ 8A. 00
        movzx   eax, al                                 ; 0E1B _ 0F B6. C0
        and     eax, 20H                                ; 0E1E _ 83. E0, 20
        test    eax, eax                                ; 0E21 _ 85. C0
        jz      ?_054                                   ; 0E23 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0E25 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E28 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0E2B _ 0D, FFFFFF00
        mov     edx, eax                                ; 0E30 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E32 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E35 _ 89. 50, 08
?_054:  mov     eax, dword [ebp+8H]                     ; 0E38 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0E3B _ 8B. 40, 08
        neg     eax                                     ; 0E3E _ F7. D8
        mov     edx, eax                                ; 0E40 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E42 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0E45 _ 89. 50, 08
        mov     eax, 1                                  ; 0E48 _ B8, 00000001
        jmp     ?_056                                   ; 0E4D _ EB, 05

?_055:  mov     eax, 4294967295                         ; 0E4F _ B8, FFFFFFFF
?_056:  leave                                           ; 0E54 _ C9
        ret                                             ; 0E55 _ C3
; mouse_decode End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_057:  db 00H                                          ; 0012 _ .

?_058:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1648:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1695:                                            ; byte
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


SECTION .bss    align=32 noexecute                      ; section number 3, bss

mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_059:                                                  ; dword
        resb    2                                       ; 0104

?_060:  resw    1                                       ; 0106

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

showPos.1615:                                           ; dword
        resd    1                                       ; 0200


