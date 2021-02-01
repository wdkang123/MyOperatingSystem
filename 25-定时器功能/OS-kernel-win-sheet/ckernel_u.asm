; Disassembly of file: ckernel.o
; Sun Jan 31 17:05:50 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global init_screen8: function
global computeMousePosition: function
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
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refreshsub: function
global sheet_refreshmap: function
global init_pit: function
global intHandlerForTimer: function
global settimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global memman

extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern io_sti                                           ; near
extern io_store_eflags                                  ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 52                                 ; 0004 _ 83. EC, 34
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000000(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000000(d)
        mov     dword [ebp-10H], eax                    ; 001C _ 89. 45, F0
        mov     eax, dword [?_158]                      ; 001F _ A1, 00000004(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 00000118(d)
        mov     ax, word [?_159]                        ; 002A _ 66: A1, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ysize], eax                      ; 0031 _ A3, 0000011C(d)
        mov     dword [ebp-14H], 0                      ; 0036 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 003D _ C7. 45, E8, 00000000
        call    init_pit                                ; 0044 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 0049 _ 83. EC, 04
        push    timerbuf                                ; 004C _ 68, 00000108(d)
        push    8                                       ; 0051 _ 6A, 08
        push    timerinfo                               ; 0053 _ 68, 000000F0(d)
        call    fifo8_init                              ; 0058 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 005D _ 83. C4, 10
        sub     esp, 4                                  ; 0060 _ 83. EC, 04
        push    1                                       ; 0063 _ 6A, 01
        push    timerinfo                               ; 0065 _ 68, 000000F0(d)
        push    500                                     ; 006A _ 68, 000001F4
        call    settimer                                ; 006F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0074 _ 83. C4, 10
        sub     esp, 4                                  ; 0077 _ 83. EC, 04
        push    keybuf                                  ; 007A _ 68, 00000040(d)
        push    32                                      ; 007F _ 6A, 20
        push    keyinfo                                 ; 0081 _ 68, 00000008(d)
        call    fifo8_init                              ; 0086 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 008B _ 83. C4, 10
        sub     esp, 4                                  ; 008E _ 83. EC, 04
        push    mousebuf                                ; 0091 _ 68, 00000060(d)
        push    128                                     ; 0096 _ 68, 00000080
        push    mouseinfo                               ; 009B _ 68, 00000020(d)
        call    fifo8_init                              ; 00A0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00A5 _ 83. C4, 10
        call    init_palette                            ; 00A8 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 00AD _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 00B2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 00B7 _ 89. 45, E4
        call    get_adr_buffer                          ; 00BA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 00BF _ 89. 45, E0
        mov     eax, dword [memman]                     ; 00C2 _ A1, 00000000(d)
        sub     esp, 12                                 ; 00C7 _ 83. EC, 0C
        push    eax                                     ; 00CA _ 50
        call    memman_init                             ; 00CB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D0 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 00D3 _ A1, 00000000(d)
        sub     esp, 4                                  ; 00D8 _ 83. EC, 04
        push    1072594944                              ; 00DB _ 68, 3FEE8000
        push    16809984                                ; 00E0 _ 68, 01008000
        push    eax                                     ; 00E5 _ 50
        call    memman_free                             ; 00E6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EB _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 00EE _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 00F4 _ 8B. 15, 00000118(d)
        mov     eax, dword [memman]                     ; 00FA _ A1, 00000000(d)
        push    ecx                                     ; 00FF _ 51
        push    edx                                     ; 0100 _ 52
        push    dword [ebp-10H]                         ; 0101 _ FF. 75, F0
        push    eax                                     ; 0104 _ 50
        call    shtctl_init                             ; 0105 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010A _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 010D _ 89. 45, DC
        sub     esp, 12                                 ; 0110 _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 0113 _ FF. 75, DC
        call    sheet_alloc                             ; 0116 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 011B _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 011E _ 89. 45, EC
        sub     esp, 12                                 ; 0121 _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 0124 _ FF. 75, DC
        call    sheet_alloc                             ; 0127 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 012C _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 012F _ 89. 45, E8
        mov     edx, dword [xsize]                      ; 0132 _ 8B. 15, 00000118(d)
        mov     eax, dword [ysize]                      ; 0138 _ A1, 0000011C(d)
        imul    edx, eax                                ; 013D _ 0F AF. D0
        mov     eax, dword [memman]                     ; 0140 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0145 _ 83. EC, 08
        push    edx                                     ; 0148 _ 52
        push    eax                                     ; 0149 _ 50
        call    memman_alloc_4k                         ; 014A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 014F _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 0152 _ A3, 00000120(d)
        mov     ecx, dword [ysize]                      ; 0157 _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 015D _ 8B. 15, 00000118(d)
        mov     eax, dword [buf_back]                   ; 0163 _ A1, 00000120(d)
        sub     esp, 12                                 ; 0168 _ 83. EC, 0C
        push    99                                      ; 016B _ 6A, 63
        push    ecx                                     ; 016D _ 51
        push    edx                                     ; 016E _ 52
        push    eax                                     ; 016F _ 50
        push    dword [ebp-14H]                         ; 0170 _ FF. 75, EC
        call    sheet_setbuf                            ; 0173 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0178 _ 83. C4, 20
        sub     esp, 12                                 ; 017B _ 83. EC, 0C
        push    99                                      ; 017E _ 6A, 63
        push    16                                      ; 0180 _ 6A, 10
        push    16                                      ; 0182 _ 6A, 10
        push    buf_mouse                               ; 0184 _ 68, 00000140(d)
        push    dword [ebp-18H]                         ; 0189 _ FF. 75, E8
        call    sheet_setbuf                            ; 018C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0191 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0194 _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 019A _ 8B. 15, 00000118(d)
        mov     eax, dword [buf_back]                   ; 01A0 _ A1, 00000120(d)
        sub     esp, 4                                  ; 01A5 _ 83. EC, 04
        push    ecx                                     ; 01A8 _ 51
        push    edx                                     ; 01A9 _ 52
        push    eax                                     ; 01AA _ 50
        call    init_screen8                            ; 01AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01B0 _ 83. C4, 10
        sub     esp, 8                                  ; 01B3 _ 83. EC, 08
        push    99                                      ; 01B6 _ 6A, 63
        push    buf_mouse                               ; 01B8 _ 68, 00000140(d)
        call    init_mouse_cursor                       ; 01BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C2 _ 83. C4, 10
        push    0                                       ; 01C5 _ 6A, 00
        push    0                                       ; 01C7 _ 6A, 00
        push    dword [ebp-14H]                         ; 01C9 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 01CC _ FF. 75, DC
        call    sheet_slide                             ; 01CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01D4 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 01D7 _ A1, 00000118(d)
        sub     eax, 16                                 ; 01DC _ 83. E8, 10
        mov     edx, eax                                ; 01DF _ 89. C2
        shr     edx, 31                                 ; 01E1 _ C1. EA, 1F
        add     eax, edx                                ; 01E4 _ 01. D0
        sar     eax, 1                                  ; 01E6 _ D1. F8
        mov     dword [mx], eax                         ; 01E8 _ A3, 00000110(d)
        mov     eax, dword [ysize]                      ; 01ED _ A1, 0000011C(d)
        sub     eax, 44                                 ; 01F2 _ 83. E8, 2C
        mov     edx, eax                                ; 01F5 _ 89. C2
        shr     edx, 31                                 ; 01F7 _ C1. EA, 1F
        add     eax, edx                                ; 01FA _ 01. D0
        sar     eax, 1                                  ; 01FC _ D1. F8
        mov     dword [my], eax                         ; 01FE _ A3, 00000114(d)
        mov     edx, dword [my]                         ; 0203 _ 8B. 15, 00000114(d)
        mov     eax, dword [mx]                         ; 0209 _ A1, 00000110(d)
        push    edx                                     ; 020E _ 52
        push    eax                                     ; 020F _ 50
        push    dword [ebp-18H]                         ; 0210 _ FF. 75, E8
        push    dword [ebp-24H]                         ; 0213 _ FF. 75, DC
        call    sheet_slide                             ; 0216 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 021B _ 83. C4, 10
        sub     esp, 8                                  ; 021E _ 83. EC, 08
        push    ?_146                                   ; 0221 _ 68, 00000000(d)
        push    dword [ebp-24H]                         ; 0226 _ FF. 75, DC
        call    message_box                             ; 0229 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 022E _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0231 _ 89. 45, D8
        sub     esp, 4                                  ; 0234 _ 83. EC, 04
        push    0                                       ; 0237 _ 6A, 00
        push    dword [ebp-14H]                         ; 0239 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 023C _ FF. 75, DC
        call    sheet_updown                            ; 023F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0244 _ 83. C4, 10
        sub     esp, 4                                  ; 0247 _ 83. EC, 04
        push    100                                     ; 024A _ 6A, 64
        push    dword [ebp-18H]                         ; 024C _ FF. 75, E8
        push    dword [ebp-24H]                         ; 024F _ FF. 75, DC
        call    sheet_updown                            ; 0252 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0257 _ 83. C4, 10
        call    io_sti                                  ; 025A _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 025F _ 83. EC, 0C
        push    mdec                                    ; 0262 _ 68, 000000E0(d)
        call    enable_mouse                            ; 0267 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 026C _ 83. C4, 10
        mov     dword [ebp-2CH], 0                      ; 026F _ C7. 45, D4, 00000000
        mov     dword [ebp-0CH], 0                      ; 0276 _ C7. 45, F4, 00000000
        call    getTimerController                      ; 027D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0282 _ 89. 45, D0
?_001:  mov     eax, dword [ebp-30H]                    ; 0285 _ 8B. 45, D0
        mov     eax, dword [eax+4H]                     ; 0288 _ 8B. 40, 04
        sub     esp, 12                                 ; 028B _ 83. EC, 0C
        push    eax                                     ; 028E _ 50
        call    intToHexStr                             ; 028F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0294 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0297 _ 89. 45, CC
        mov     eax, dword [ebp-28H]                    ; 029A _ 8B. 45, D8
        mov     eax, dword [eax]                        ; 029D _ 8B. 00
        sub     esp, 4                                  ; 029F _ 83. EC, 04
        push    43                                      ; 02A2 _ 6A, 2B
        push    119                                     ; 02A4 _ 6A, 77
        push    28                                      ; 02A6 _ 6A, 1C
        push    40                                      ; 02A8 _ 6A, 28
        push    8                                       ; 02AA _ 6A, 08
        push    160                                     ; 02AC _ 68, 000000A0
        push    eax                                     ; 02B1 _ 50
        call    boxfill8                                ; 02B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02B7 _ 83. C4, 20
        sub     esp, 8                                  ; 02BA _ 83. EC, 08
        push    dword [ebp-34H]                         ; 02BD _ FF. 75, CC
        push    0                                       ; 02C0 _ 6A, 00
        push    28                                      ; 02C2 _ 6A, 1C
        push    40                                      ; 02C4 _ 6A, 28
        push    dword [ebp-28H]                         ; 02C6 _ FF. 75, D8
        push    dword [ebp-24H]                         ; 02C9 _ FF. 75, DC
        call    showString                              ; 02CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02D1 _ 83. C4, 20
        call    io_cli                                  ; 02D4 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02D9 _ 83. EC, 0C
        push    keyinfo                                 ; 02DC _ 68, 00000008(d)
        call    fifo8_status                            ; 02E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E6 _ 83. C4, 10
        mov     ebx, eax                                ; 02E9 _ 89. C3
        sub     esp, 12                                 ; 02EB _ 83. EC, 0C
        push    mouseinfo                               ; 02EE _ 68, 00000020(d)
        call    fifo8_status                            ; 02F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02F8 _ 83. C4, 10
        add     ebx, eax                                ; 02FB _ 01. C3
        sub     esp, 12                                 ; 02FD _ 83. EC, 0C
        push    timerinfo                               ; 0300 _ 68, 000000F0(d)
        call    fifo8_status                            ; 0305 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 030A _ 83. C4, 10
        add     eax, ebx                                ; 030D _ 01. D8
        test    eax, eax                                ; 030F _ 85. C0
        jnz     ?_002                                   ; 0311 _ 75, 0A
        call    io_sti                                  ; 0313 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0318 _ E9, FFFFFF68

?_002:  sub     esp, 12                                 ; 031D _ 83. EC, 0C
        push    keyinfo                                 ; 0320 _ 68, 00000008(d)
        call    fifo8_status                            ; 0325 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 032A _ 83. C4, 10
        test    eax, eax                                ; 032D _ 85. C0
        jz      ?_003                                   ; 032F _ 74, 76
        call    io_sti                                  ; 0331 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0336 _ 83. EC, 0C
        push    keyinfo                                 ; 0339 _ 68, 00000008(d)
        call    fifo8_get                               ; 033E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0343 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 0346 _ 89. 45, D4
        cmp     dword [ebp-2CH], 28                     ; 0349 _ 83. 7D, D4, 1C
        jne     ?_001                                   ; 034D _ 0F 85, FFFFFF32
        mov     ecx, dword [xsize]                      ; 0353 _ 8B. 0D, 00000118(d)
        mov     edx, dword [buf_back]                   ; 0359 _ 8B. 15, 00000120(d)
        mov     ebx, dword [ebp-0CH]                    ; 035F _ 8B. 5D, F4
        mov     eax, ebx                                ; 0362 _ 89. D8
        shl     eax, 2                                  ; 0364 _ C1. E0, 02
        add     eax, ebx                                ; 0367 _ 01. D8
        shl     eax, 2                                  ; 0369 _ C1. E0, 02
        mov     ebx, eax                                ; 036C _ 89. C3
        mov     eax, dword [ebp-20H]                    ; 036E _ 8B. 45, E0
        add     eax, ebx                                ; 0371 _ 01. D8
        sub     esp, 4                                  ; 0373 _ 83. EC, 04
        push    7                                       ; 0376 _ 6A, 07
        push    ecx                                     ; 0378 _ 51
        push    dword [ebp-0CH]                         ; 0379 _ FF. 75, F4
        push    edx                                     ; 037C _ 52
        push    eax                                     ; 037D _ 50
        push    dword [ebp-14H]                         ; 037E _ FF. 75, EC
        push    dword [ebp-24H]                         ; 0381 _ FF. 75, DC
        call    showMemoryInfo                          ; 0384 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0389 _ 83. C4, 20
        inc     dword [ebp-0CH]                         ; 038C _ FF. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 038F _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 0392 _ 3B. 45, E4
        jle     ?_001                                   ; 0395 _ 0F 8E, FFFFFEEA
        mov     dword [ebp-0CH], 0                      ; 039B _ C7. 45, F4, 00000000
        jmp     ?_001                                   ; 03A2 _ E9, FFFFFEDE

?_003:  sub     esp, 12                                 ; 03A7 _ 83. EC, 0C
        push    mouseinfo                               ; 03AA _ 68, 00000020(d)
        call    fifo8_status                            ; 03AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B4 _ 83. C4, 10
        test    eax, eax                                ; 03B7 _ 85. C0
        jz      ?_004                                   ; 03B9 _ 74, 19
        sub     esp, 4                                  ; 03BB _ 83. EC, 04
        push    dword [ebp-18H]                         ; 03BE _ FF. 75, E8
        push    dword [ebp-14H]                         ; 03C1 _ FF. 75, EC
        push    dword [ebp-24H]                         ; 03C4 _ FF. 75, DC
        call    show_mouse_info                         ; 03C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CC _ 83. C4, 10
        jmp     ?_001                                   ; 03CF _ E9, FFFFFEB1

?_004:  sub     esp, 12                                 ; 03D4 _ 83. EC, 0C
        push    timerinfo                               ; 03D7 _ 68, 000000F0(d)
        call    fifo8_status                            ; 03DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E1 _ 83. C4, 10
        test    eax, eax                                ; 03E4 _ 85. C0
        je      ?_001                                   ; 03E6 _ 0F 84, FFFFFE99
        call    io_sti                                  ; 03EC _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03F1 _ 83. EC, 08
        push    ?_147                                   ; 03F4 _ 68, 00000008(d)
        push    7                                       ; 03F9 _ 6A, 07
        push    0                                       ; 03FB _ 6A, 00
        push    0                                       ; 03FD _ 6A, 00
        push    dword [ebp-14H]                         ; 03FF _ FF. 75, EC
        push    dword [ebp-24H]                         ; 0402 _ FF. 75, DC
        call    showString                              ; 0405 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 040A _ 83. C4, 20
        jmp     ?_001                                   ; 040D _ E9, FFFFFE73
; CMain End of function

init_screen8:; Function begin
        push    ebp                                     ; 0412 _ 55
        mov     ebp, esp                                ; 0413 _ 89. E5
        push    ebx                                     ; 0415 _ 53
        sub     esp, 4                                  ; 0416 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0419 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 041C _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 041F _ 8B. 45, 0C
        dec     eax                                     ; 0422 _ 48
        sub     esp, 4                                  ; 0423 _ 83. EC, 04
        push    edx                                     ; 0426 _ 52
        push    eax                                     ; 0427 _ 50
        push    0                                       ; 0428 _ 6A, 00
        push    0                                       ; 042A _ 6A, 00
        push    14                                      ; 042C _ 6A, 0E
        push    dword [ebp+0CH]                         ; 042E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0431 _ FF. 75, 08
        call    boxfill8                                ; 0434 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0439 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 043C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 043F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0442 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0445 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0448 _ 8B. 45, 10
        sub     eax, 28                                 ; 044B _ 83. E8, 1C
        sub     esp, 4                                  ; 044E _ 83. EC, 04
        push    ecx                                     ; 0451 _ 51
        push    edx                                     ; 0452 _ 52
        push    eax                                     ; 0453 _ 50
        push    0                                       ; 0454 _ 6A, 00
        push    8                                       ; 0456 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0458 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 045B _ FF. 75, 08
        call    boxfill8                                ; 045E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0463 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0466 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0469 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 046C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 046F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0472 _ 8B. 45, 10
        sub     eax, 27                                 ; 0475 _ 83. E8, 1B
        sub     esp, 4                                  ; 0478 _ 83. EC, 04
        push    ecx                                     ; 047B _ 51
        push    edx                                     ; 047C _ 52
        push    eax                                     ; 047D _ 50
        push    0                                       ; 047E _ 6A, 00
        push    7                                       ; 0480 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0482 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0485 _ FF. 75, 08
        call    boxfill8                                ; 0488 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 048D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0490 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0493 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0496 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0499 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 049C _ 8B. 45, 10
        sub     eax, 26                                 ; 049F _ 83. E8, 1A
        sub     esp, 4                                  ; 04A2 _ 83. EC, 04
        push    ecx                                     ; 04A5 _ 51
        push    edx                                     ; 04A6 _ 52
        push    eax                                     ; 04A7 _ 50
        push    0                                       ; 04A8 _ 6A, 00
        push    8                                       ; 04AA _ 6A, 08
        push    dword [ebp+0CH]                         ; 04AC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04AF _ FF. 75, 08
        call    boxfill8                                ; 04B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04B7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04BA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 04BD _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 04C0 _ 8B. 45, 10
        sub     eax, 24                                 ; 04C3 _ 83. E8, 18
        sub     esp, 4                                  ; 04C6 _ 83. EC, 04
        push    edx                                     ; 04C9 _ 52
        push    59                                      ; 04CA _ 6A, 3B
        push    eax                                     ; 04CC _ 50
        push    3                                       ; 04CD _ 6A, 03
        push    7                                       ; 04CF _ 6A, 07
        push    dword [ebp+0CH]                         ; 04D1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04D4 _ FF. 75, 08
        call    boxfill8                                ; 04D7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04DC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 04DF _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 04E2 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 04E5 _ 8B. 45, 10
        sub     eax, 24                                 ; 04E8 _ 83. E8, 18
        sub     esp, 4                                  ; 04EB _ 83. EC, 04
        push    edx                                     ; 04EE _ 52
        push    2                                       ; 04EF _ 6A, 02
        push    eax                                     ; 04F1 _ 50
        push    2                                       ; 04F2 _ 6A, 02
        push    7                                       ; 04F4 _ 6A, 07
        push    dword [ebp+0CH]                         ; 04F6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 04F9 _ FF. 75, 08
        call    boxfill8                                ; 04FC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0501 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0504 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0507 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 050A _ 8B. 45, 10
        sub     eax, 4                                  ; 050D _ 83. E8, 04
        sub     esp, 4                                  ; 0510 _ 83. EC, 04
        push    edx                                     ; 0513 _ 52
        push    59                                      ; 0514 _ 6A, 3B
        push    eax                                     ; 0516 _ 50
        push    3                                       ; 0517 _ 6A, 03
        push    15                                      ; 0519 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 051B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 051E _ FF. 75, 08
        call    boxfill8                                ; 0521 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0526 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0529 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 052C _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 052F _ 8B. 45, 10
        sub     eax, 23                                 ; 0532 _ 83. E8, 17
        sub     esp, 4                                  ; 0535 _ 83. EC, 04
        push    edx                                     ; 0538 _ 52
        push    59                                      ; 0539 _ 6A, 3B
        push    eax                                     ; 053B _ 50
        push    59                                      ; 053C _ 6A, 3B
        push    15                                      ; 053E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0540 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0543 _ FF. 75, 08
        call    boxfill8                                ; 0546 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 054B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 054E _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0551 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0554 _ 8B. 45, 10
        sub     eax, 3                                  ; 0557 _ 83. E8, 03
        sub     esp, 4                                  ; 055A _ 83. EC, 04
        push    edx                                     ; 055D _ 52
        push    59                                      ; 055E _ 6A, 3B
        push    eax                                     ; 0560 _ 50
        push    2                                       ; 0561 _ 6A, 02
        push    0                                       ; 0563 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0565 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0568 _ FF. 75, 08
        call    boxfill8                                ; 056B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0570 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0573 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0576 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0579 _ 8B. 45, 10
        sub     eax, 24                                 ; 057C _ 83. E8, 18
        sub     esp, 4                                  ; 057F _ 83. EC, 04
        push    edx                                     ; 0582 _ 52
        push    60                                      ; 0583 _ 6A, 3C
        push    eax                                     ; 0585 _ 50
        push    60                                      ; 0586 _ 6A, 3C
        push    0                                       ; 0588 _ 6A, 00
        push    dword [ebp+0CH]                         ; 058A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 058D _ FF. 75, 08
        call    boxfill8                                ; 0590 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0595 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0598 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 059B _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 059E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05A1 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 05A4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 05A7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 05AA _ 8B. 45, 0C
        sub     eax, 47                                 ; 05AD _ 83. E8, 2F
        sub     esp, 4                                  ; 05B0 _ 83. EC, 04
        push    ebx                                     ; 05B3 _ 53
        push    ecx                                     ; 05B4 _ 51
        push    edx                                     ; 05B5 _ 52
        push    eax                                     ; 05B6 _ 50
        push    15                                      ; 05B7 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 05B9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05BC _ FF. 75, 08
        call    boxfill8                                ; 05BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05C4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 05C7 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 05CA _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 05CD _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 05D0 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 05D3 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 05D6 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 05D9 _ 8B. 45, 0C
        sub     eax, 47                                 ; 05DC _ 83. E8, 2F
        sub     esp, 4                                  ; 05DF _ 83. EC, 04
        push    ebx                                     ; 05E2 _ 53
        push    ecx                                     ; 05E3 _ 51
        push    edx                                     ; 05E4 _ 52
        push    eax                                     ; 05E5 _ 50
        push    15                                      ; 05E6 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 05E8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 05EB _ FF. 75, 08
        call    boxfill8                                ; 05EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 05F6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 05F9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 05FC _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 05FF _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0602 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0605 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0608 _ 8B. 45, 0C
        sub     eax, 47                                 ; 060B _ 83. E8, 2F
        sub     esp, 4                                  ; 060E _ 83. EC, 04
        push    ebx                                     ; 0611 _ 53
        push    ecx                                     ; 0612 _ 51
        push    edx                                     ; 0613 _ 52
        push    eax                                     ; 0614 _ 50
        push    7                                       ; 0615 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0617 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 061A _ FF. 75, 08
        call    boxfill8                                ; 061D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0622 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0625 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0628 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 062B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 062E _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0631 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0634 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0637 _ 8B. 45, 0C
        sub     eax, 3                                  ; 063A _ 83. E8, 03
        sub     esp, 4                                  ; 063D _ 83. EC, 04
        push    ebx                                     ; 0640 _ 53
        push    ecx                                     ; 0641 _ 51
        push    edx                                     ; 0642 _ 52
        push    eax                                     ; 0643 _ 50
        push    7                                       ; 0644 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0646 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0649 _ FF. 75, 08
        call    boxfill8                                ; 064C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0651 _ 83. C4, 20
        nop                                             ; 0654 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0655 _ 8B. 5D, FC
        leave                                           ; 0658 _ C9
        ret                                             ; 0659 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 065A _ 55
        mov     ebp, esp                                ; 065B _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 065D _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0660 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0663 _ A1, 00000110(d)
        add     eax, edx                                ; 0668 _ 01. D0
        mov     dword [mx], eax                         ; 066A _ A3, 00000110(d)
        mov     eax, dword [ebp+10H]                    ; 066F _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0672 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0675 _ A1, 00000114(d)
        add     eax, edx                                ; 067A _ 01. D0
        mov     dword [my], eax                         ; 067C _ A3, 00000114(d)
        mov     eax, dword [mx]                         ; 0681 _ A1, 00000110(d)
        test    eax, eax                                ; 0686 _ 85. C0
        jns     ?_005                                   ; 0688 _ 79, 0A
        mov     dword [mx], 0                           ; 068A _ C7. 05, 00000110(d), 00000000
?_005:  mov     eax, dword [my]                         ; 0694 _ A1, 00000114(d)
        test    eax, eax                                ; 0699 _ 85. C0
        jns     ?_006                                   ; 069B _ 79, 0A
        mov     dword [my], 0                           ; 069D _ C7. 05, 00000114(d), 00000000
?_006:  mov     edx, dword [xsize]                      ; 06A7 _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 06AD _ A1, 00000110(d)
        cmp     edx, eax                                ; 06B2 _ 39. C2
        jg      ?_007                                   ; 06B4 _ 7F, 0B
        mov     eax, dword [xsize]                      ; 06B6 _ A1, 00000118(d)
        dec     eax                                     ; 06BB _ 48
        mov     dword [mx], eax                         ; 06BC _ A3, 00000110(d)
?_007:  mov     edx, dword [ysize]                      ; 06C1 _ 8B. 15, 0000011C(d)
        mov     eax, dword [my]                         ; 06C7 _ A1, 00000114(d)
        cmp     edx, eax                                ; 06CC _ 39. C2
        jg      ?_008                                   ; 06CE _ 7F, 0B
        mov     eax, dword [ysize]                      ; 06D0 _ A1, 0000011C(d)
        dec     eax                                     ; 06D5 _ 48
        mov     dword [my], eax                         ; 06D6 _ A3, 00000114(d)
?_008:  nop                                             ; 06DB _ 90
        pop     ebp                                     ; 06DC _ 5D
        ret                                             ; 06DD _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 06DE _ 55
        mov     ebp, esp                                ; 06DF _ 89. E5
        sub     esp, 24                                 ; 06E1 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 06E4 _ A1, 00000120(d)
        mov     dword [ebp-0CH], eax                    ; 06E9 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 06EC _ C6. 45, F3, 00
        call    io_sti                                  ; 06F0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06F5 _ 83. EC, 0C
        push    mouseinfo                               ; 06F8 _ 68, 00000020(d)
        call    fifo8_get                               ; 06FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0702 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0705 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0708 _ 0F B6. 45, F3
        sub     esp, 8                                  ; 070C _ 83. EC, 08
        push    eax                                     ; 070F _ 50
        push    mdec                                    ; 0710 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0715 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 071A _ 83. C4, 10
        test    eax, eax                                ; 071D _ 85. C0
        jz      ?_009                                   ; 071F _ 74, 31
        sub     esp, 4                                  ; 0721 _ 83. EC, 04
        push    mdec                                    ; 0724 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0729 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 072C _ FF. 75, 08
        call    computeMousePosition                    ; 072F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0734 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0737 _ 8B. 15, 00000114(d)
        mov     eax, dword [mx]                         ; 073D _ A1, 00000110(d)
        push    edx                                     ; 0742 _ 52
        push    eax                                     ; 0743 _ 50
        push    dword [ebp+10H]                         ; 0744 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0747 _ FF. 75, 08
        call    sheet_slide                             ; 074A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 074F _ 83. C4, 10
?_009:  nop                                             ; 0752 _ 90
        leave                                           ; 0753 _ C9
        ret                                             ; 0754 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0755 _ 55
        mov     ebp, esp                                ; 0756 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0758 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 075B _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 0761 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0764 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 076A _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 076D _ 66: C7. 40, 06, 00C8
        nop                                             ; 0773 _ 90
        pop     ebp                                     ; 0774 _ 5D
        ret                                             ; 0775 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0776 _ 55
        mov     ebp, esp                                ; 0777 _ 89. E5
        push    ebx                                     ; 0779 _ 53
        sub     esp, 36                                 ; 077A _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 077D _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0780 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0783 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0786 _ 89. 45, F4
        jmp     ?_011                                   ; 0789 _ EB, 3C

?_010:  mov     eax, dword [ebp+1CH]                    ; 078B _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 078E _ 8A. 00
        movzx   eax, al                                 ; 0790 _ 0F B6. C0
        shl     eax, 4                                  ; 0793 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0796 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 079C _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 07A0 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 07A3 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 07A6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 07A9 _ 8B. 00
        sub     esp, 8                                  ; 07AB _ 83. EC, 08
        push    ebx                                     ; 07AE _ 53
        push    ecx                                     ; 07AF _ 51
        push    dword [ebp+14H]                         ; 07B0 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 07B3 _ FF. 75, 10
        push    edx                                     ; 07B6 _ 52
        push    eax                                     ; 07B7 _ 50
        call    showFont8                               ; 07B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07BD _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 07C0 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 07C4 _ FF. 45, 1C
?_011:  mov     eax, dword [ebp+1CH]                    ; 07C7 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 07CA _ 8A. 00
        test    al, al                                  ; 07CC _ 84. C0
        jnz     ?_010                                   ; 07CE _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 07D0 _ 8B. 45, 14
        add     eax, 16                                 ; 07D3 _ 83. C0, 10
        sub     esp, 8                                  ; 07D6 _ 83. EC, 08
        push    eax                                     ; 07D9 _ 50
        push    dword [ebp+10H]                         ; 07DA _ FF. 75, 10
        push    dword [ebp+14H]                         ; 07DD _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 07E0 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 07E3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07E6 _ FF. 75, 08
        call    sheet_refresh                           ; 07E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07EE _ 83. C4, 20
        nop                                             ; 07F1 _ 90
        mov     ebx, dword [ebp-4H]                     ; 07F2 _ 8B. 5D, FC
        leave                                           ; 07F5 _ C9
        ret                                             ; 07F6 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 07F7 _ 55
        mov     ebp, esp                                ; 07F8 _ 89. E5
        sub     esp, 8                                  ; 07FA _ 83. EC, 08
        sub     esp, 4                                  ; 07FD _ 83. EC, 04
        push    table_rgb.1794                          ; 0800 _ 68, 00000020(d)
        push    15                                      ; 0805 _ 6A, 0F
        push    0                                       ; 0807 _ 6A, 00
        call    set_palette                             ; 0809 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 080E _ 83. C4, 10
        nop                                             ; 0811 _ 90
        leave                                           ; 0812 _ C9
        ret                                             ; 0813 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0814 _ 55
        mov     ebp, esp                                ; 0815 _ 89. E5
        sub     esp, 24                                 ; 0817 _ 83. EC, 18
        call    io_load_eflags                          ; 081A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 081F _ 89. 45, F0
        call    io_cli                                  ; 0822 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0827 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 082A _ FF. 75, 08
        push    968                                     ; 082D _ 68, 000003C8
        call    io_out8                                 ; 0832 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0837 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 083A _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 083D _ 89. 45, F4
        jmp     ?_013                                   ; 0840 _ EB, 5F

?_012:  mov     eax, dword [ebp+10H]                    ; 0842 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0845 _ 8A. 00
        shr     al, 2                                   ; 0847 _ C0. E8, 02
        movzx   eax, al                                 ; 084A _ 0F B6. C0
        sub     esp, 8                                  ; 084D _ 83. EC, 08
        push    eax                                     ; 0850 _ 50
        push    969                                     ; 0851 _ 68, 000003C9
        call    io_out8                                 ; 0856 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 085B _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 085E _ 8B. 45, 10
        inc     eax                                     ; 0861 _ 40
        mov     al, byte [eax]                          ; 0862 _ 8A. 00
        shr     al, 2                                   ; 0864 _ C0. E8, 02
        movzx   eax, al                                 ; 0867 _ 0F B6. C0
        sub     esp, 8                                  ; 086A _ 83. EC, 08
        push    eax                                     ; 086D _ 50
        push    969                                     ; 086E _ 68, 000003C9
        call    io_out8                                 ; 0873 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0878 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 087B _ 8B. 45, 10
        add     eax, 2                                  ; 087E _ 83. C0, 02
        mov     al, byte [eax]                          ; 0881 _ 8A. 00
        shr     al, 2                                   ; 0883 _ C0. E8, 02
        movzx   eax, al                                 ; 0886 _ 0F B6. C0
        sub     esp, 8                                  ; 0889 _ 83. EC, 08
        push    eax                                     ; 088C _ 50
        push    969                                     ; 088D _ 68, 000003C9
        call    io_out8                                 ; 0892 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0897 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 089A _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 089E _ FF. 45, F4
?_013:  mov     eax, dword [ebp-0CH]                    ; 08A1 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 08A4 _ 3B. 45, 0C
        jle     ?_012                                   ; 08A7 _ 7E, 99
        sub     esp, 12                                 ; 08A9 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 08AC _ FF. 75, F0
        call    io_store_eflags                         ; 08AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B4 _ 83. C4, 10
        nop                                             ; 08B7 _ 90
        leave                                           ; 08B8 _ C9
        ret                                             ; 08B9 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 08BA _ 55
        mov     ebp, esp                                ; 08BB _ 89. E5
        sub     esp, 20                                 ; 08BD _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 08C0 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 08C3 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 08C6 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 08C9 _ 89. 45, F8
        jmp     ?_017                                   ; 08CC _ EB, 30

?_014:  mov     eax, dword [ebp+14H]                    ; 08CE _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 08D1 _ 89. 45, FC
        jmp     ?_016                                   ; 08D4 _ EB, 1D

?_015:  mov     eax, dword [ebp-8H]                     ; 08D6 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 08D9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 08DD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 08DF _ 8B. 45, FC
        add     eax, edx                                ; 08E2 _ 01. D0
        mov     edx, eax                                ; 08E4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 08E6 _ 8B. 45, 08
        add     edx, eax                                ; 08E9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 08EB _ 8A. 45, EC
        mov     byte [edx], al                          ; 08EE _ 88. 02
        inc     dword [ebp-4H]                          ; 08F0 _ FF. 45, FC
?_016:  mov     eax, dword [ebp-4H]                     ; 08F3 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 08F6 _ 3B. 45, 1C
        jle     ?_015                                   ; 08F9 _ 7E, DB
        inc     dword [ebp-8H]                          ; 08FB _ FF. 45, F8
?_017:  mov     eax, dword [ebp-8H]                     ; 08FE _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0901 _ 3B. 45, 20
        jle     ?_014                                   ; 0904 _ 7E, C8
        nop                                             ; 0906 _ 90
        nop                                             ; 0907 _ 90
        leave                                           ; 0908 _ C9
        ret                                             ; 0909 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 090A _ 55
        mov     ebp, esp                                ; 090B _ 89. E5
        sub     esp, 20                                 ; 090D _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0910 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0913 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0916 _ C7. 45, FC, 00000000
        jmp     ?_027                                   ; 091D _ E9, 00000162

?_018:  mov     edx, dword [ebp-4H]                     ; 0922 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0925 _ 8B. 45, 1C
        add     eax, edx                                ; 0928 _ 01. D0
        mov     al, byte [eax]                          ; 092A _ 8A. 00
        mov     byte [ebp-5H], al                       ; 092C _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 092F _ 80. 7D, FB, 00
        jns     ?_019                                   ; 0933 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0935 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0938 _ 8B. 45, FC
        add     eax, edx                                ; 093B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 093D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0941 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0943 _ 8B. 45, 10
        add     eax, edx                                ; 0946 _ 01. D0
        mov     edx, eax                                ; 0948 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 094A _ 8B. 45, 08
        add     edx, eax                                ; 094D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 094F _ 8A. 45, EC
        mov     byte [edx], al                          ; 0952 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0954 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0958 _ 83. E0, 40
        test    eax, eax                                ; 095B _ 85. C0
        jz      ?_020                                   ; 095D _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 095F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0962 _ 8B. 45, FC
        add     eax, edx                                ; 0965 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0967 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 096B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 096D _ 8B. 45, 10
        add     eax, edx                                ; 0970 _ 01. D0
        lea     edx, [eax+1H]                           ; 0972 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0975 _ 8B. 45, 08
        add     edx, eax                                ; 0978 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 097A _ 8A. 45, EC
        mov     byte [edx], al                          ; 097D _ 88. 02
?_020:  movsx   eax, byte [ebp-5H]                      ; 097F _ 0F BE. 45, FB
        and     eax, 20H                                ; 0983 _ 83. E0, 20
        test    eax, eax                                ; 0986 _ 85. C0
        jz      ?_021                                   ; 0988 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 098A _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 098D _ 8B. 45, FC
        add     eax, edx                                ; 0990 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0992 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0996 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0998 _ 8B. 45, 10
        add     eax, edx                                ; 099B _ 01. D0
        lea     edx, [eax+2H]                           ; 099D _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 09A0 _ 8B. 45, 08
        add     edx, eax                                ; 09A3 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09A5 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09A8 _ 88. 02
?_021:  movsx   eax, byte [ebp-5H]                      ; 09AA _ 0F BE. 45, FB
        and     eax, 10H                                ; 09AE _ 83. E0, 10
        test    eax, eax                                ; 09B1 _ 85. C0
        jz      ?_022                                   ; 09B3 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 09B5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09B8 _ 8B. 45, FC
        add     eax, edx                                ; 09BB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09BD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09C1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09C3 _ 8B. 45, 10
        add     eax, edx                                ; 09C6 _ 01. D0
        lea     edx, [eax+3H]                           ; 09C8 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 09CB _ 8B. 45, 08
        add     edx, eax                                ; 09CE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09D0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 09D3 _ 88. 02
?_022:  movsx   eax, byte [ebp-5H]                      ; 09D5 _ 0F BE. 45, FB
        and     eax, 08H                                ; 09D9 _ 83. E0, 08
        test    eax, eax                                ; 09DC _ 85. C0
        jz      ?_023                                   ; 09DE _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 09E0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 09E3 _ 8B. 45, FC
        add     eax, edx                                ; 09E6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 09E8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 09EC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 09EE _ 8B. 45, 10
        add     eax, edx                                ; 09F1 _ 01. D0
        lea     edx, [eax+4H]                           ; 09F3 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 09F6 _ 8B. 45, 08
        add     edx, eax                                ; 09F9 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 09FB _ 8A. 45, EC
        mov     byte [edx], al                          ; 09FE _ 88. 02
?_023:  movsx   eax, byte [ebp-5H]                      ; 0A00 _ 0F BE. 45, FB
        and     eax, 04H                                ; 0A04 _ 83. E0, 04
        test    eax, eax                                ; 0A07 _ 85. C0
        jz      ?_024                                   ; 0A09 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0A0B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A0E _ 8B. 45, FC
        add     eax, edx                                ; 0A11 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A13 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A17 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A19 _ 8B. 45, 10
        add     eax, edx                                ; 0A1C _ 01. D0
        lea     edx, [eax+5H]                           ; 0A1E _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0A21 _ 8B. 45, 08
        add     edx, eax                                ; 0A24 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A26 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A29 _ 88. 02
?_024:  movsx   eax, byte [ebp-5H]                      ; 0A2B _ 0F BE. 45, FB
        and     eax, 02H                                ; 0A2F _ 83. E0, 02
        test    eax, eax                                ; 0A32 _ 85. C0
        jz      ?_025                                   ; 0A34 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0A36 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A39 _ 8B. 45, FC
        add     eax, edx                                ; 0A3C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A3E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A44 _ 8B. 45, 10
        add     eax, edx                                ; 0A47 _ 01. D0
        lea     edx, [eax+6H]                           ; 0A49 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0A4C _ 8B. 45, 08
        add     edx, eax                                ; 0A4F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A51 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A54 _ 88. 02
?_025:  movsx   eax, byte [ebp-5H]                      ; 0A56 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0A5A _ 83. E0, 01
        test    eax, eax                                ; 0A5D _ 85. C0
        jz      ?_026                                   ; 0A5F _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0A61 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0A64 _ 8B. 45, FC
        add     eax, edx                                ; 0A67 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0A69 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A6D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0A6F _ 8B. 45, 10
        add     eax, edx                                ; 0A72 _ 01. D0
        lea     edx, [eax+7H]                           ; 0A74 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0A77 _ 8B. 45, 08
        add     edx, eax                                ; 0A7A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0A7C _ 8A. 45, EC
        mov     byte [edx], al                          ; 0A7F _ 88. 02
?_026:  inc     dword [ebp-4H]                          ; 0A81 _ FF. 45, FC
?_027:  cmp     dword [ebp-4H], 15                      ; 0A84 _ 83. 7D, FC, 0F
        jle     ?_018                                   ; 0A88 _ 0F 8E, FFFFFE94
        nop                                             ; 0A8E _ 90
        nop                                             ; 0A8F _ 90
        leave                                           ; 0A90 _ C9
        ret                                             ; 0A91 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0A92 _ 55
        mov     ebp, esp                                ; 0A93 _ 89. E5
        sub     esp, 20                                 ; 0A95 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0A98 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0A9B _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0A9E _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0AA5 _ E9, 000000AB

?_028:  mov     dword [ebp-4H], 0                       ; 0AAA _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0AB1 _ E9, 00000092

?_029:  mov     eax, dword [ebp-8H]                     ; 0AB6 _ 8B. 45, F8
        shl     eax, 4                                  ; 0AB9 _ C1. E0, 04
        mov     edx, eax                                ; 0ABC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0ABE _ 8B. 45, FC
        add     eax, edx                                ; 0AC1 _ 01. D0
        add     eax, cursor.1841                        ; 0AC3 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0AC8 _ 8A. 00
        cmp     al, 42                                  ; 0ACA _ 3C, 2A
        jnz     ?_030                                   ; 0ACC _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0ACE _ 8B. 45, F8
        shl     eax, 4                                  ; 0AD1 _ C1. E0, 04
        mov     edx, eax                                ; 0AD4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AD6 _ 8B. 45, FC
        add     eax, edx                                ; 0AD9 _ 01. D0
        mov     edx, eax                                ; 0ADB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0ADD _ 8B. 45, 08
        add     eax, edx                                ; 0AE0 _ 01. D0
        mov     byte [eax], 0                           ; 0AE2 _ C6. 00, 00
?_030:  mov     eax, dword [ebp-8H]                     ; 0AE5 _ 8B. 45, F8
        shl     eax, 4                                  ; 0AE8 _ C1. E0, 04
        mov     edx, eax                                ; 0AEB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0AED _ 8B. 45, FC
        add     eax, edx                                ; 0AF0 _ 01. D0
        add     eax, cursor.1841                        ; 0AF2 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0AF7 _ 8A. 00
        cmp     al, 79                                  ; 0AF9 _ 3C, 4F
        jnz     ?_031                                   ; 0AFB _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0AFD _ 8B. 45, F8
        shl     eax, 4                                  ; 0B00 _ C1. E0, 04
        mov     edx, eax                                ; 0B03 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B05 _ 8B. 45, FC
        add     eax, edx                                ; 0B08 _ 01. D0
        mov     edx, eax                                ; 0B0A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B0C _ 8B. 45, 08
        add     eax, edx                                ; 0B0F _ 01. D0
        mov     byte [eax], 7                           ; 0B11 _ C6. 00, 07
?_031:  mov     eax, dword [ebp-8H]                     ; 0B14 _ 8B. 45, F8
        shl     eax, 4                                  ; 0B17 _ C1. E0, 04
        mov     edx, eax                                ; 0B1A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B1C _ 8B. 45, FC
        add     eax, edx                                ; 0B1F _ 01. D0
        add     eax, cursor.1841                        ; 0B21 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 0B26 _ 8A. 00
        cmp     al, 46                                  ; 0B28 _ 3C, 2E
        jnz     ?_032                                   ; 0B2A _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0B2C _ 8B. 45, F8
        shl     eax, 4                                  ; 0B2F _ C1. E0, 04
        mov     edx, eax                                ; 0B32 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B34 _ 8B. 45, FC
        add     eax, edx                                ; 0B37 _ 01. D0
        mov     edx, eax                                ; 0B39 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B3B _ 8B. 45, 08
        add     edx, eax                                ; 0B3E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0B40 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0B43 _ 88. 02
?_032:  inc     dword [ebp-4H]                          ; 0B45 _ FF. 45, FC
?_033:  cmp     dword [ebp-4H], 15                      ; 0B48 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0B4C _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0B52 _ FF. 45, F8
?_034:  cmp     dword [ebp-8H], 15                      ; 0B55 _ 83. 7D, F8, 0F
        jle     ?_028                                   ; 0B59 _ 0F 8E, FFFFFF4B
        nop                                             ; 0B5F _ 90
        nop                                             ; 0B60 _ 90
        leave                                           ; 0B61 _ C9
        ret                                             ; 0B62 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0B63 _ 55
        mov     ebp, esp                                ; 0B64 _ 89. E5
        push    ebx                                     ; 0B66 _ 53
        sub     esp, 16                                 ; 0B67 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0B6A _ C7. 45, F4, 00000000
        jmp     ?_038                                   ; 0B71 _ EB, 4D

?_035:  mov     dword [ebp-8H], 0                       ; 0B73 _ C7. 45, F8, 00000000
        jmp     ?_037                                   ; 0B7A _ EB, 39

?_036:  mov     eax, dword [ebp-0CH]                    ; 0B7C _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 0B7F _ 0F AF. 45, 24
        mov     edx, eax                                ; 0B83 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B85 _ 8B. 45, F8
        add     eax, edx                                ; 0B88 _ 01. D0
        mov     edx, eax                                ; 0B8A _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 0B8C _ 8B. 45, 20
        add     eax, edx                                ; 0B8F _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 0B91 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 0B94 _ 8B. 55, F4
        add     edx, ecx                                ; 0B97 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 0B99 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 0B9D _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 0BA0 _ 8B. 4D, F8
        add     ecx, ebx                                ; 0BA3 _ 01. D9
        add     edx, ecx                                ; 0BA5 _ 01. CA
        mov     ecx, edx                                ; 0BA7 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 0BA9 _ 8B. 55, 08
        add     edx, ecx                                ; 0BAC _ 01. CA
        mov     al, byte [eax]                          ; 0BAE _ 8A. 00
        mov     byte [edx], al                          ; 0BB0 _ 88. 02
        inc     dword [ebp-8H]                          ; 0BB2 _ FF. 45, F8
?_037:  mov     eax, dword [ebp-8H]                     ; 0BB5 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0BB8 _ 3B. 45, 10
        jl      ?_036                                   ; 0BBB _ 7C, BF
        inc     dword [ebp-0CH]                         ; 0BBD _ FF. 45, F4
?_038:  mov     eax, dword [ebp-0CH]                    ; 0BC0 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 0BC3 _ 3B. 45, 14
        jl      ?_035                                   ; 0BC6 _ 7C, AB
        nop                                             ; 0BC8 _ 90
        nop                                             ; 0BC9 _ 90
        add     esp, 16                                 ; 0BCA _ 83. C4, 10
        pop     ebx                                     ; 0BCD _ 5B
        pop     ebp                                     ; 0BCE _ 5D
        ret                                             ; 0BCF _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 0BD0 _ 55
        mov     ebp, esp                                ; 0BD1 _ 89. E5
        sub     esp, 24                                 ; 0BD3 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0BD6 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 0BDB _ 89. 45, F4
        mov     eax, dword [?_158]                      ; 0BDE _ A1, 00000004(d)
        cwde                                            ; 0BE3 _ 98
        mov     dword [ebp-10H], eax                    ; 0BE4 _ 89. 45, F0
        mov     ax, word [?_159]                        ; 0BE7 _ 66: A1, 00000006(d)
        cwde                                            ; 0BED _ 98
        mov     dword [ebp-14H], eax                    ; 0BEE _ 89. 45, EC
        sub     esp, 8                                  ; 0BF1 _ 83. EC, 08
        push    32                                      ; 0BF4 _ 6A, 20
        push    32                                      ; 0BF6 _ 6A, 20
        call    io_out8                                 ; 0BF8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BFD _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0C00 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 0C04 _ 83. EC, 0C
        push    96                                      ; 0C07 _ 6A, 60
        call    io_in8                                  ; 0C09 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C0E _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0C11 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 0C14 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 0C18 _ 83. EC, 08
        push    eax                                     ; 0C1B _ 50
        push    keyinfo                                 ; 0C1C _ 68, 00000008(d)
        call    fifo8_put                               ; 0C21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C26 _ 83. C4, 10
        nop                                             ; 0C29 _ 90
        leave                                           ; 0C2A _ C9
        ret                                             ; 0C2B _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 0C2C _ 55
        mov     ebp, esp                                ; 0C2D _ 89. E5
        sub     esp, 4                                  ; 0C2F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0C32 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0C35 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0C38 _ 80. 7D, FC, 09
        jle     ?_039                                   ; 0C3C _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 0C3E _ 8A. 45, FC
        add     eax, 55                                 ; 0C41 _ 83. C0, 37
        jmp     ?_040                                   ; 0C44 _ EB, 06

?_039:  mov     al, byte [ebp-4H]                       ; 0C46 _ 8A. 45, FC
        add     eax, 48                                 ; 0C49 _ 83. C0, 30
?_040:  leave                                           ; 0C4C _ C9
        ret                                             ; 0C4D _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 0C4E _ 55
        mov     ebp, esp                                ; 0C4F _ 89. E5
        sub     esp, 20                                 ; 0C51 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0C54 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0C57 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0C5A _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 0C61 _ 8A. 45, EC
        and     eax, 0FH                                ; 0C64 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0C67 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 0C6A _ 0F BE. 45, FB
        push    eax                                     ; 0C6E _ 50
        call    charToHexVal                            ; 0C6F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0C74 _ 83. C4, 04
        mov     byte [?_157], al                        ; 0C77 _ A2, 00000007(d)
        mov     al, byte [ebp-14H]                      ; 0C7C _ 8A. 45, EC
        shr     al, 4                                   ; 0C7F _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0C82 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 0C85 _ 8A. 45, EC
        movsx   eax, al                                 ; 0C88 _ 0F BE. C0
        push    eax                                     ; 0C8B _ 50
        call    charToHexVal                            ; 0C8C _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0C91 _ 83. C4, 04
        mov     byte [?_156], al                        ; 0C94 _ A2, 00000006(d)
        mov     eax, keyval                             ; 0C99 _ B8, 00000004(d)
        leave                                           ; 0C9E _ C9
        ret                                             ; 0C9F _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 0CA0 _ 55
        mov     ebp, esp                                ; 0CA1 _ 89. E5
        sub     esp, 16                                 ; 0CA3 _ 83. EC, 10
        mov     byte [str.1889], 48                     ; 0CA6 _ C6. 05, 00000240(d), 30
        mov     byte [?_160], 88                        ; 0CAD _ C6. 05, 00000241(d), 58
        mov     byte [?_161], 0                         ; 0CB4 _ C6. 05, 0000024A(d), 00
        mov     dword [ebp-4H], 2                       ; 0CBB _ C7. 45, FC, 00000002
        jmp     ?_042                                   ; 0CC2 _ EB, 0E

?_041:  mov     eax, dword [ebp-4H]                     ; 0CC4 _ 8B. 45, FC
        add     eax, str.1889                           ; 0CC7 _ 05, 00000240(d)
        mov     byte [eax], 48                          ; 0CCC _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 0CCF _ FF. 45, FC
?_042:  cmp     dword [ebp-4H], 9                       ; 0CD2 _ 83. 7D, FC, 09
        jle     ?_041                                   ; 0CD6 _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 0CD8 _ C7. 45, F8, 00000009
        jmp     ?_046                                   ; 0CDF _ EB, 41

?_043:  mov     eax, dword [ebp+8H]                     ; 0CE1 _ 8B. 45, 08
        and     eax, 0FH                                ; 0CE4 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 0CE7 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 0CEA _ 8B. 45, 08
        shr     eax, 4                                  ; 0CED _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 0CF0 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 0CF3 _ 83. 7D, F4, 09
        jle     ?_044                                   ; 0CF7 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 0CF9 _ 8B. 45, F4
        add     eax, 55                                 ; 0CFC _ 83. C0, 37
        mov     dl, al                                  ; 0CFF _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0D01 _ 8B. 45, F8
        add     eax, str.1889                           ; 0D04 _ 05, 00000240(d)
        mov     byte [eax], dl                          ; 0D09 _ 88. 10
        jmp     ?_045                                   ; 0D0B _ EB, 12

?_044:  mov     eax, dword [ebp-0CH]                    ; 0D0D _ 8B. 45, F4
        add     eax, 48                                 ; 0D10 _ 83. C0, 30
        mov     dl, al                                  ; 0D13 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 0D15 _ 8B. 45, F8
        add     eax, str.1889                           ; 0D18 _ 05, 00000240(d)
        mov     byte [eax], dl                          ; 0D1D _ 88. 10
?_045:  dec     dword [ebp-8H]                          ; 0D1F _ FF. 4D, F8
?_046:  cmp     dword [ebp-8H], 1                       ; 0D22 _ 83. 7D, F8, 01
        jle     ?_047                                   ; 0D26 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 0D28 _ 83. 7D, 08, 00
        jnz     ?_043                                   ; 0D2C _ 75, B3
?_047:  mov     eax, str.1889                           ; 0D2E _ B8, 00000240(d)
        leave                                           ; 0D33 _ C9
        ret                                             ; 0D34 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0D35 _ 55
        mov     ebp, esp                                ; 0D36 _ 89. E5
        sub     esp, 8                                  ; 0D38 _ 83. EC, 08
?_048:  sub     esp, 12                                 ; 0D3B _ 83. EC, 0C
        push    100                                     ; 0D3E _ 6A, 64
        call    io_in8                                  ; 0D40 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D45 _ 83. C4, 10
        and     eax, 02H                                ; 0D48 _ 83. E0, 02
        test    eax, eax                                ; 0D4B _ 85. C0
        jz      ?_049                                   ; 0D4D _ 74, 02
        jmp     ?_048                                   ; 0D4F _ EB, EA

?_049:  nop                                             ; 0D51 _ 90
        nop                                             ; 0D52 _ 90
        leave                                           ; 0D53 _ C9
        ret                                             ; 0D54 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0D55 _ 55
        mov     ebp, esp                                ; 0D56 _ 89. E5
        sub     esp, 8                                  ; 0D58 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0D5B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D60 _ 83. EC, 08
        push    96                                      ; 0D63 _ 6A, 60
        push    100                                     ; 0D65 _ 6A, 64
        call    io_out8                                 ; 0D67 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D6C _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0D6F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D74 _ 83. EC, 08
        push    71                                      ; 0D77 _ 6A, 47
        push    96                                      ; 0D79 _ 6A, 60
        call    io_out8                                 ; 0D7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D80 _ 83. C4, 10
        nop                                             ; 0D83 _ 90
        leave                                           ; 0D84 _ C9
        ret                                             ; 0D85 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 0D86 _ 55
        mov     ebp, esp                                ; 0D87 _ 89. E5
        sub     esp, 8                                  ; 0D89 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 0D8C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0D91 _ 83. EC, 08
        push    212                                     ; 0D94 _ 68, 000000D4
        push    100                                     ; 0D99 _ 6A, 64
        call    io_out8                                 ; 0D9B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DA0 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 0DA3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0DA8 _ 83. EC, 08
        push    244                                     ; 0DAB _ 68, 000000F4
        push    96                                      ; 0DB0 _ 6A, 60
        call    io_out8                                 ; 0DB2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB7 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0DBA _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 0DBD _ C6. 40, 03, 00
        nop                                             ; 0DC1 _ 90
        leave                                           ; 0DC2 _ C9
        ret                                             ; 0DC3 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 0DC4 _ 55
        mov     ebp, esp                                ; 0DC5 _ 89. E5
        sub     esp, 24                                 ; 0DC7 _ 83. EC, 18
        sub     esp, 8                                  ; 0DCA _ 83. EC, 08
        push    32                                      ; 0DCD _ 6A, 20
        push    160                                     ; 0DCF _ 68, 000000A0
        call    io_out8                                 ; 0DD4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DD9 _ 83. C4, 10
        sub     esp, 8                                  ; 0DDC _ 83. EC, 08
        push    32                                      ; 0DDF _ 6A, 20
        push    32                                      ; 0DE1 _ 6A, 20
        call    io_out8                                 ; 0DE3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DE8 _ 83. C4, 10
        sub     esp, 12                                 ; 0DEB _ 83. EC, 0C
        push    96                                      ; 0DEE _ 6A, 60
        call    io_in8                                  ; 0DF0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF5 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 0DF8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0DFB _ 0F B6. 45, F7
        sub     esp, 8                                  ; 0DFF _ 83. EC, 08
        push    eax                                     ; 0E02 _ 50
        push    mouseinfo                               ; 0E03 _ 68, 00000020(d)
        call    fifo8_put                               ; 0E08 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E0D _ 83. C4, 10
        nop                                             ; 0E10 _ 90
        leave                                           ; 0E11 _ C9
        ret                                             ; 0E12 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 0E13 _ 55
        mov     ebp, esp                                ; 0E14 _ 89. E5
        sub     esp, 4                                  ; 0E16 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0E19 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 0E1C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0E1F _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E22 _ 8A. 40, 03
        test    al, al                                  ; 0E25 _ 84. C0
        jnz     ?_051                                   ; 0E27 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 0E29 _ 80. 7D, FC, FA
        jnz     ?_050                                   ; 0E2D _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 0E2F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0E32 _ C6. 40, 03, 01
?_050:  mov     eax, 0                                  ; 0E36 _ B8, 00000000
        jmp     ?_058                                   ; 0E3B _ E9, 00000104

?_051:  mov     eax, dword [ebp+8H]                     ; 0E40 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E43 _ 8A. 40, 03
        cmp     al, 1                                   ; 0E46 _ 3C, 01
        jnz     ?_053                                   ; 0E48 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 0E4A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 0E4E _ 25, 000000C8
        cmp     eax, 8                                  ; 0E53 _ 83. F8, 08
        jnz     ?_052                                   ; 0E56 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 0E58 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E5B _ 8A. 55, FC
        mov     byte [eax], dl                          ; 0E5E _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 0E60 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 0E63 _ C6. 40, 03, 02
?_052:  mov     eax, 0                                  ; 0E67 _ B8, 00000000
        jmp     ?_058                                   ; 0E6C _ E9, 000000D3

?_053:  mov     eax, dword [ebp+8H]                     ; 0E71 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E74 _ 8A. 40, 03
        cmp     al, 2                                   ; 0E77 _ 3C, 02
        jnz     ?_054                                   ; 0E79 _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 0E7B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0E7E _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 0E81 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E84 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 0E87 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 0E8B _ B8, 00000000
        jmp     ?_058                                   ; 0E90 _ E9, 000000AF

?_054:  mov     eax, dword [ebp+8H]                     ; 0E95 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 0E98 _ 8A. 40, 03
        cmp     al, 3                                   ; 0E9B _ 3C, 03
        jne     ?_057                                   ; 0E9D _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 0EA3 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 0EA6 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 0EA9 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0EAC _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 0EAF _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 0EB3 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EB6 _ 8A. 00
        movzx   eax, al                                 ; 0EB8 _ 0F B6. C0
        and     eax, 07H                                ; 0EBB _ 83. E0, 07
        mov     edx, eax                                ; 0EBE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EC0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 0EC3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0EC6 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 0EC9 _ 8A. 40, 01
        movzx   edx, al                                 ; 0ECC _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0ECF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0ED2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0ED5 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 0ED8 _ 8A. 40, 02
        movzx   edx, al                                 ; 0EDB _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 0EDE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0EE1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0EE4 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0EE7 _ 8A. 00
        movzx   eax, al                                 ; 0EE9 _ 0F B6. C0
        and     eax, 10H                                ; 0EEC _ 83. E0, 10
        test    eax, eax                                ; 0EEF _ 85. C0
        jz      ?_055                                   ; 0EF1 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0EF3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 0EF6 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 0EF9 _ 0D, FFFFFF00
        mov     edx, eax                                ; 0EFE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F00 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 0F03 _ 89. 50, 04
?_055:  mov     eax, dword [ebp+8H]                     ; 0F06 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 0F09 _ 8A. 00
        movzx   eax, al                                 ; 0F0B _ 0F B6. C0
        and     eax, 20H                                ; 0F0E _ 83. E0, 20
        test    eax, eax                                ; 0F11 _ 85. C0
        jz      ?_056                                   ; 0F13 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 0F15 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F18 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 0F1B _ 0D, FFFFFF00
        mov     edx, eax                                ; 0F20 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F22 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F25 _ 89. 50, 08
?_056:  mov     eax, dword [ebp+8H]                     ; 0F28 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0F2B _ 8B. 40, 08
        neg     eax                                     ; 0F2E _ F7. D8
        mov     edx, eax                                ; 0F30 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F32 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0F35 _ 89. 50, 08
        mov     eax, 1                                  ; 0F38 _ B8, 00000001
        jmp     ?_058                                   ; 0F3D _ EB, 05

?_057:  mov     eax, 4294967295                         ; 0F3F _ B8, FFFFFFFF
?_058:  leave                                           ; 0F44 _ C9
        ret                                             ; 0F45 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 0F46 _ 55
        mov     ebp, esp                                ; 0F47 _ 89. E5
        sub     esp, 56                                 ; 0F49 _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 0F4C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0F53 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 0F5A _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 0F61 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 0F68 _ 8B. 15, 0000011C(d)
        mov     eax, dword [ebp+0CH]                    ; 0F6E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0F71 _ 8B. 00
        sub     esp, 4                                  ; 0F73 _ 83. EC, 04
        push    edx                                     ; 0F76 _ 52
        push    dword [ebp+1CH]                         ; 0F77 _ FF. 75, 1C
        push    eax                                     ; 0F7A _ 50
        call    init_screen8                            ; 0F7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F80 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 0F83 _ 8B. 45, 20
        movsx   eax, al                                 ; 0F86 _ 0F BE. C0
        sub     esp, 8                                  ; 0F89 _ 83. EC, 08
        push    ?_148                                   ; 0F8C _ 68, 0000000F(d)
        push    eax                                     ; 0F91 _ 50
        push    dword [ebp-10H]                         ; 0F92 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0F95 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0F98 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F9B _ FF. 75, 08
        call    showString                              ; 0F9E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FA3 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 0FA6 _ 8B. 45, 18
        sub     esp, 12                                 ; 0FA9 _ 83. EC, 0C
        push    eax                                     ; 0FAC _ 50
        call    intToHexStr                             ; 0FAD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FB2 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0FB5 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 0FB8 _ 8B. 45, 20
        movsx   eax, al                                 ; 0FBB _ 0F BE. C0
        sub     esp, 8                                  ; 0FBE _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0FC1 _ FF. 75, E4
        push    eax                                     ; 0FC4 _ 50
        push    dword [ebp-10H]                         ; 0FC5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0FC8 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 0FCB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FCE _ FF. 75, 08
        call    showString                              ; 0FD1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FD6 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 0FD9 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 0FDD _ 8B. 45, 20
        movsx   eax, al                                 ; 0FE0 _ 0F BE. C0
        sub     esp, 8                                  ; 0FE3 _ 83. EC, 08
        push    ?_149                                   ; 0FE6 _ 68, 00000019(d)
        push    eax                                     ; 0FEB _ 50
        push    dword [ebp-10H]                         ; 0FEC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0FEF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0FF2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FF5 _ FF. 75, 08
        call    showString                              ; 0FF8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FFD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1000 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1003 _ 8B. 00
        sub     esp, 12                                 ; 1005 _ 83. EC, 0C
        push    eax                                     ; 1008 _ 50
        call    intToHexStr                             ; 1009 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 100E _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1011 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1014 _ 8B. 45, 20
        movsx   eax, al                                 ; 1017 _ 0F BE. C0
        sub     esp, 8                                  ; 101A _ 83. EC, 08
        push    dword [ebp-20H]                         ; 101D _ FF. 75, E0
        push    eax                                     ; 1020 _ 50
        push    dword [ebp-10H]                         ; 1021 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1024 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1027 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 102A _ FF. 75, 08
        call    showString                              ; 102D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1032 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1035 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1039 _ 8B. 45, 20
        movsx   eax, al                                 ; 103C _ 0F BE. C0
        sub     esp, 8                                  ; 103F _ 83. EC, 08
        push    ?_150                                   ; 1042 _ 68, 00000025(d)
        push    eax                                     ; 1047 _ 50
        push    dword [ebp-10H]                         ; 1048 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 104B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 104E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1051 _ FF. 75, 08
        call    showString                              ; 1054 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1059 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 105C _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 105F _ 8B. 40, 04
        sub     esp, 12                                 ; 1062 _ 83. EC, 0C
        push    eax                                     ; 1065 _ 50
        call    intToHexStr                             ; 1066 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 106B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 106E _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1071 _ 8B. 45, 20
        movsx   eax, al                                 ; 1074 _ 0F BE. C0
        sub     esp, 8                                  ; 1077 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 107A _ FF. 75, DC
        push    eax                                     ; 107D _ 50
        push    dword [ebp-10H]                         ; 107E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1081 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1084 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1087 _ FF. 75, 08
        call    showString                              ; 108A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 108F _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1092 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1096 _ 8B. 45, 20
        movsx   eax, al                                 ; 1099 _ 0F BE. C0
        sub     esp, 8                                  ; 109C _ 83. EC, 08
        push    ?_151                                   ; 109F _ 68, 00000031(d)
        push    eax                                     ; 10A4 _ 50
        push    dword [ebp-10H]                         ; 10A5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 10A8 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 10AB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AE _ FF. 75, 08
        call    showString                              ; 10B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10B9 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 10BC _ 8B. 40, 08
        sub     esp, 12                                 ; 10BF _ 83. EC, 0C
        push    eax                                     ; 10C2 _ 50
        call    intToHexStr                             ; 10C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10C8 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 10CB _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 10CE _ 8B. 45, 20
        movsx   eax, al                                 ; 10D1 _ 0F BE. C0
        sub     esp, 8                                  ; 10D4 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 10D7 _ FF. 75, D8
        push    eax                                     ; 10DA _ 50
        push    dword [ebp-10H]                         ; 10DB _ FF. 75, F0
        push    dword [ebp-14H]                         ; 10DE _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 10E1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10E4 _ FF. 75, 08
        call    showString                              ; 10E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10EC _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 10EF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 10F3 _ 8B. 45, 20
        movsx   eax, al                                 ; 10F6 _ 0F BE. C0
        sub     esp, 8                                  ; 10F9 _ 83. EC, 08
        push    ?_152                                   ; 10FC _ 68, 0000003D(d)
        push    eax                                     ; 1101 _ 50
        push    dword [ebp-10H]                         ; 1102 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1105 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1108 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 110B _ FF. 75, 08
        call    showString                              ; 110E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1113 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1116 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1119 _ 8B. 40, 0C
        sub     esp, 12                                 ; 111C _ 83. EC, 0C
        push    eax                                     ; 111F _ 50
        call    intToHexStr                             ; 1120 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1125 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 1128 _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 112B _ 8B. 45, 20
        movsx   eax, al                                 ; 112E _ 0F BE. C0
        sub     esp, 8                                  ; 1131 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 1134 _ FF. 75, D4
        push    eax                                     ; 1137 _ 50
        push    dword [ebp-10H]                         ; 1138 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 113B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 113E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1141 _ FF. 75, 08
        call    showString                              ; 1144 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1149 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 114C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1150 _ 8B. 45, 20
        movsx   eax, al                                 ; 1153 _ 0F BE. C0
        sub     esp, 8                                  ; 1156 _ 83. EC, 08
        push    ?_153                                   ; 1159 _ 68, 0000004A(d)
        push    eax                                     ; 115E _ 50
        push    dword [ebp-10H]                         ; 115F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1162 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1165 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1168 _ FF. 75, 08
        call    showString                              ; 116B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1170 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1173 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1176 _ 8B. 40, 10
        sub     esp, 12                                 ; 1179 _ 83. EC, 0C
        push    eax                                     ; 117C _ 50
        call    intToHexStr                             ; 117D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1182 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 1185 _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 1188 _ 8B. 45, 20
        movsx   eax, al                                 ; 118B _ 0F BE. C0
        sub     esp, 8                                  ; 118E _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1191 _ FF. 75, D0
        push    eax                                     ; 1194 _ 50
        push    dword [ebp-10H]                         ; 1195 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1198 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 119B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 119E _ FF. 75, 08
        call    showString                              ; 11A1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11A6 _ 83. C4, 20
        nop                                             ; 11A9 _ 90
        leave                                           ; 11AA _ C9
        ret                                             ; 11AB _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 11AC _ 55
        mov     ebp, esp                                ; 11AD _ 89. E5
        sub     esp, 24                                 ; 11AF _ 83. EC, 18
        sub     esp, 12                                 ; 11B2 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 11B5 _ FF. 75, 08
        call    sheet_alloc                             ; 11B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11BD _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 11C0 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 11C3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 11C8 _ 83. EC, 08
        push    10880                                   ; 11CB _ 68, 00002A80
        push    eax                                     ; 11D0 _ 50
        call    memman_alloc_4k                         ; 11D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11D6 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 11D9 _ 89. 45, F0
        sub     esp, 12                                 ; 11DC _ 83. EC, 0C
        push    -1                                      ; 11DF _ 6A, FF
        push    68                                      ; 11E1 _ 6A, 44
        push    160                                     ; 11E3 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 11E8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 11EB _ FF. 75, F4
        call    sheet_setbuf                            ; 11EE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11F3 _ 83. C4, 20
        sub     esp, 4                                  ; 11F6 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 11F9 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 11FC _ FF. 75, F4
        push    dword [ebp+8H]                          ; 11FF _ FF. 75, 08
        call    make_window8                            ; 1202 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1207 _ 83. C4, 10
        sub     esp, 8                                  ; 120A _ 83. EC, 08
        push    ?_154                                   ; 120D _ 68, 00000051(d)
        push    0                                       ; 1212 _ 6A, 00
        push    28                                      ; 1214 _ 6A, 1C
        push    24                                      ; 1216 _ 6A, 18
        push    dword [ebp-0CH]                         ; 1218 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 121B _ FF. 75, 08
        call    showString                              ; 121E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1223 _ 83. C4, 20
        sub     esp, 8                                  ; 1226 _ 83. EC, 08
        push    ?_155                                   ; 1229 _ 68, 0000005C(d)
        push    0                                       ; 122E _ 6A, 00
        push    44                                      ; 1230 _ 6A, 2C
        push    24                                      ; 1232 _ 6A, 18
        push    dword [ebp-0CH]                         ; 1234 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1237 _ FF. 75, 08
        call    showString                              ; 123A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 123F _ 83. C4, 20
        push    72                                      ; 1242 _ 6A, 48
        push    80                                      ; 1244 _ 6A, 50
        push    dword [ebp-0CH]                         ; 1246 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1249 _ FF. 75, 08
        call    sheet_slide                             ; 124C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1251 _ 83. C4, 10
        sub     esp, 4                                  ; 1254 _ 83. EC, 04
        push    2                                       ; 1257 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1259 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 125C _ FF. 75, 08
        call    sheet_updown                            ; 125F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1264 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1267 _ 8B. 45, F4
        leave                                           ; 126A _ C9
        ret                                             ; 126B _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 126C _ 55
        mov     ebp, esp                                ; 126D _ 89. E5
        push    ebx                                     ; 126F _ 53
        sub     esp, 36                                 ; 1270 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1273 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1276 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1279 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 127C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 127F _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1282 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1285 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1288 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 128B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 128E _ 8B. 00
        push    0                                       ; 1290 _ 6A, 00
        push    edx                                     ; 1292 _ 52
        push    0                                       ; 1293 _ 6A, 00
        push    0                                       ; 1295 _ 6A, 00
        push    8                                       ; 1297 _ 6A, 08
        push    dword [ebp-18H]                         ; 1299 _ FF. 75, E8
        push    eax                                     ; 129C _ 50
        call    boxfill8                                ; 129D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12A2 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 12A5 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 12A8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 12AB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12AE _ 8B. 00
        push    1                                       ; 12B0 _ 6A, 01
        push    edx                                     ; 12B2 _ 52
        push    1                                       ; 12B3 _ 6A, 01
        push    1                                       ; 12B5 _ 6A, 01
        push    7                                       ; 12B7 _ 6A, 07
        push    dword [ebp-18H]                         ; 12B9 _ FF. 75, E8
        push    eax                                     ; 12BC _ 50
        call    boxfill8                                ; 12BD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12C2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 12C5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 12C8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12CE _ 8B. 00
        push    edx                                     ; 12D0 _ 52
        push    0                                       ; 12D1 _ 6A, 00
        push    0                                       ; 12D3 _ 6A, 00
        push    0                                       ; 12D5 _ 6A, 00
        push    8                                       ; 12D7 _ 6A, 08
        push    dword [ebp-18H]                         ; 12D9 _ FF. 75, E8
        push    eax                                     ; 12DC _ 50
        call    boxfill8                                ; 12DD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 12E2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 12E5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 12E8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 12EB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 12EE _ 8B. 00
        push    edx                                     ; 12F0 _ 52
        push    1                                       ; 12F1 _ 6A, 01
        push    1                                       ; 12F3 _ 6A, 01
        push    1                                       ; 12F5 _ 6A, 01
        push    7                                       ; 12F7 _ 6A, 07
        push    dword [ebp-18H]                         ; 12F9 _ FF. 75, E8
        push    eax                                     ; 12FC _ 50
        call    boxfill8                                ; 12FD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1302 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1305 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1308 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 130B _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 130E _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 1311 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1314 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1317 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 131A _ 8B. 00
        push    ebx                                     ; 131C _ 53
        push    ecx                                     ; 131D _ 51
        push    1                                       ; 131E _ 6A, 01
        push    edx                                     ; 1320 _ 52
        push    15                                      ; 1321 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1323 _ FF. 75, E8
        push    eax                                     ; 1326 _ 50
        call    boxfill8                                ; 1327 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 132C _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 132F _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1332 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1335 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1338 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 133B _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 133E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1341 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1344 _ 8B. 00
        push    ebx                                     ; 1346 _ 53
        push    ecx                                     ; 1347 _ 51
        push    0                                       ; 1348 _ 6A, 00
        push    edx                                     ; 134A _ 52
        push    0                                       ; 134B _ 6A, 00
        push    dword [ebp-18H]                         ; 134D _ FF. 75, E8
        push    eax                                     ; 1350 _ 50
        call    boxfill8                                ; 1351 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1356 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1359 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 135C _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 135F _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1362 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1365 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1368 _ 8B. 00
        push    ecx                                     ; 136A _ 51
        push    edx                                     ; 136B _ 52
        push    2                                       ; 136C _ 6A, 02
        push    2                                       ; 136E _ 6A, 02
        push    8                                       ; 1370 _ 6A, 08
        push    dword [ebp-18H]                         ; 1372 _ FF. 75, E8
        push    eax                                     ; 1375 _ 50
        call    boxfill8                                ; 1376 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 137B _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 137E _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1381 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1384 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1387 _ 8B. 00
        push    20                                      ; 1389 _ 6A, 14
        push    edx                                     ; 138B _ 52
        push    3                                       ; 138C _ 6A, 03
        push    3                                       ; 138E _ 6A, 03
        push    12                                      ; 1390 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1392 _ FF. 75, E8
        push    eax                                     ; 1395 _ 50
        call    boxfill8                                ; 1396 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 139B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 139E _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 13A1 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 13A4 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 13A7 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 13AA _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 13AD _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 13B0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13B3 _ 8B. 00
        push    ebx                                     ; 13B5 _ 53
        push    ecx                                     ; 13B6 _ 51
        push    edx                                     ; 13B7 _ 52
        push    1                                       ; 13B8 _ 6A, 01
        push    15                                      ; 13BA _ 6A, 0F
        push    dword [ebp-18H]                         ; 13BC _ FF. 75, E8
        push    eax                                     ; 13BF _ 50
        call    boxfill8                                ; 13C0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13C5 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 13C8 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 13CB _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 13CE _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 13D1 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 13D4 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 13D7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13DA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13DD _ 8B. 00
        push    ebx                                     ; 13DF _ 53
        push    ecx                                     ; 13E0 _ 51
        push    edx                                     ; 13E1 _ 52
        push    0                                       ; 13E2 _ 6A, 00
        push    0                                       ; 13E4 _ 6A, 00
        push    dword [ebp-18H]                         ; 13E6 _ FF. 75, E8
        push    eax                                     ; 13E9 _ 50
        call    boxfill8                                ; 13EA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 13EF _ 83. C4, 1C
        sub     esp, 8                                  ; 13F2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 13F5 _ FF. 75, 10
        push    7                                       ; 13F8 _ 6A, 07
        push    4                                       ; 13FA _ 6A, 04
        push    24                                      ; 13FC _ 6A, 18
        push    dword [ebp+0CH]                         ; 13FE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1401 _ FF. 75, 08
        call    showString                              ; 1404 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1409 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 140C _ C7. 45, F0, 00000000
        jmp     ?_066                                   ; 1413 _ EB, 7F

?_059:  mov     dword [ebp-0CH], 0                      ; 1415 _ C7. 45, F4, 00000000
        jmp     ?_065                                   ; 141C _ EB, 6D

?_060:  mov     eax, dword [ebp-10H]                    ; 141E _ 8B. 45, F0
        shl     eax, 4                                  ; 1421 _ C1. E0, 04
        mov     edx, eax                                ; 1424 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1426 _ 8B. 45, F4
        add     eax, edx                                ; 1429 _ 01. D0
        add     eax, closebtn.1953                      ; 142B _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 1430 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1432 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1435 _ 80. 7D, EF, 40
        jnz     ?_061                                   ; 1439 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 143B _ C6. 45, EF, 00
        jmp     ?_064                                   ; 143F _ EB, 1C

?_061:  cmp     byte [ebp-11H], 36                      ; 1441 _ 80. 7D, EF, 24
        jnz     ?_062                                   ; 1445 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1447 _ C6. 45, EF, 0F
        jmp     ?_064                                   ; 144B _ EB, 10

?_062:  cmp     byte [ebp-11H], 81                      ; 144D _ 80. 7D, EF, 51
        jnz     ?_063                                   ; 1451 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1453 _ C6. 45, EF, 08
        jmp     ?_064                                   ; 1457 _ EB, 04

?_063:  mov     byte [ebp-11H], 7                       ; 1459 _ C6. 45, EF, 07
?_064:  mov     eax, dword [ebp+0CH]                    ; 145D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1460 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1462 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1465 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1468 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 146B _ 8B. 40, 04
        imul    ecx, eax                                ; 146E _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1471 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1474 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1477 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 147A _ 8B. 45, F4
        add     eax, ebx                                ; 147D _ 01. D8
        add     eax, ecx                                ; 147F _ 01. C8
        add     edx, eax                                ; 1481 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1483 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1486 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1488 _ FF. 45, F4
?_065:  cmp     dword [ebp-0CH], 15                     ; 148B _ 83. 7D, F4, 0F
        jle     ?_060                                   ; 148F _ 7E, 8D
        inc     dword [ebp-10H]                         ; 1491 _ FF. 45, F0
?_066:  cmp     dword [ebp-10H], 13                     ; 1494 _ 83. 7D, F0, 0D
        jle     ?_059                                   ; 1498 _ 0F 8E, FFFFFF77
        nop                                             ; 149E _ 90
        mov     ebx, dword [ebp-4H]                     ; 149F _ 8B. 5D, FC
        leave                                           ; 14A2 _ C9
        ret                                             ; 14A3 _ C3
; make_window8 End of function

memman_init:; Function begin
        push    ebp                                     ; 14A4 _ 55
        mov     ebp, esp                                ; 14A5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 14A7 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 14AA _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 14B0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 14B3 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 14BA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 14BD _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 14C4 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 14C7 _ C7. 40, 0C, 00000000
        nop                                             ; 14CE _ 90
        pop     ebp                                     ; 14CF _ 5D
        ret                                             ; 14D0 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 14D1 _ 55
        mov     ebp, esp                                ; 14D2 _ 89. E5
        sub     esp, 16                                 ; 14D4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 14D7 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 14DE _ C7. 45, FC, 00000000
        jmp     ?_068                                   ; 14E5 _ EB, 13

?_067:  mov     eax, dword [ebp+8H]                     ; 14E7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 14EA _ 8B. 55, FC
        add     edx, 2                                  ; 14ED _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 14F0 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 14F4 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 14F7 _ FF. 45, FC
?_068:  mov     eax, dword [ebp+8H]                     ; 14FA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 14FD _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 14FF _ 39. 45, FC
        jc      ?_067                                   ; 1502 _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1504 _ 8B. 45, F8
        leave                                           ; 1507 _ C9
        ret                                             ; 1508 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1509 _ 55
        mov     ebp, esp                                ; 150A _ 89. E5
        sub     esp, 16                                 ; 150C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 150F _ C7. 45, FC, 00000000
        jmp     ?_072                                   ; 1516 _ E9, 00000084

?_069:  mov     eax, dword [ebp+8H]                     ; 151B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 151E _ 8B. 55, FC
        add     edx, 2                                  ; 1521 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1524 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1528 _ 39. 45, 0C
        ja      ?_071                                   ; 152B _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 152D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1530 _ 8B. 55, FC
        add     edx, 2                                  ; 1533 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1536 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1539 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 153C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 153F _ 8B. 55, FC
        add     edx, 2                                  ; 1542 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1545 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1548 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 154B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 154E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1551 _ 8B. 55, FC
        add     edx, 2                                  ; 1554 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1557 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 155A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 155D _ 8B. 55, FC
        add     edx, 2                                  ; 1560 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1563 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1567 _ 2B. 45, 0C
        mov     edx, eax                                ; 156A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 156C _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 156F _ 8B. 4D, FC
        add     ecx, 2                                  ; 1572 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1575 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1579 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 157C _ 8B. 55, FC
        add     edx, 2                                  ; 157F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1582 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1586 _ 85. C0
        jnz     ?_070                                   ; 1588 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 158A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 158D _ 8B. 00
        lea     edx, [eax-1H]                           ; 158F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1592 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1595 _ 89. 10
?_070:  mov     eax, dword [ebp-8H]                     ; 1597 _ 8B. 45, F8
        jmp     ?_073                                   ; 159A _ EB, 16

?_071:  inc     dword [ebp-4H]                          ; 159C _ FF. 45, FC
?_072:  mov     eax, dword [ebp+8H]                     ; 159F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15A2 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 15A4 _ 39. 45, FC
        jc      ?_069                                   ; 15A7 _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 15AD _ B8, 00000000
?_073:  leave                                           ; 15B2 _ C9
        ret                                             ; 15B3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 15B4 _ 55
        mov     ebp, esp                                ; 15B5 _ 89. E5
        push    ebx                                     ; 15B7 _ 53
        sub     esp, 16                                 ; 15B8 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 15BB _ C7. 45, F8, 00000000
        jmp     ?_075                                   ; 15C2 _ EB, 14

?_074:  mov     eax, dword [ebp+8H]                     ; 15C4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 15C7 _ 8B. 55, F8
        add     edx, 2                                  ; 15CA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 15CD _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 15D0 _ 39. 45, 0C
        jc      ?_076                                   ; 15D3 _ 72, 0F
        inc     dword [ebp-8H]                          ; 15D5 _ FF. 45, F8
?_075:  mov     eax, dword [ebp+8H]                     ; 15D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15DB _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 15DD _ 39. 45, F8
        jl      ?_074                                   ; 15E0 _ 7C, E2
        jmp     ?_077                                   ; 15E2 _ EB, 01

?_076:  nop                                             ; 15E4 _ 90
?_077:  cmp     dword [ebp-8H], 0                       ; 15E5 _ 83. 7D, F8, 00
        jle     ?_079                                   ; 15E9 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 15EF _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 15F2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 15F5 _ 8B. 45, 08
        add     edx, 2                                  ; 15F8 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 15FB _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 15FE _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1601 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1604 _ 8B. 45, 08
        add     ecx, 2                                  ; 1607 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 160A _ 8B. 44 C8, 04
        add     eax, edx                                ; 160E _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1610 _ 39. 45, 0C
        jne     ?_079                                   ; 1613 _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1619 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 161C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 161F _ 8B. 45, 08
        add     edx, 2                                  ; 1622 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1625 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1629 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 162C _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 162F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1632 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1635 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1638 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 163B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 163F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1642 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1644 _ 39. 45, F8
        jge     ?_078                                   ; 1647 _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 1649 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 164C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 164F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1652 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1655 _ 8B. 55, F8
        add     edx, 2                                  ; 1658 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 165B _ 8B. 04 D0
        cmp     ecx, eax                                ; 165E _ 39. C1
        jnz     ?_078                                   ; 1660 _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 1662 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1665 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1668 _ 8B. 45, 08
        add     edx, 2                                  ; 166B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 166E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1672 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1675 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1678 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 167B _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 167F _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1682 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1685 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1688 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 168B _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 168E _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1692 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1695 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1697 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 169A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 169D _ 89. 10
?_078:  mov     eax, 0                                  ; 169F _ B8, 00000000
        jmp     ?_085                                   ; 16A4 _ E9, 0000011B

?_079:  mov     eax, dword [ebp+8H]                     ; 16A9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16AC _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 16AE _ 39. 45, F8
        jge     ?_080                                   ; 16B1 _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 16B3 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 16B6 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 16B9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16BC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16BF _ 8B. 55, F8
        add     edx, 2                                  ; 16C2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 16C5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 16C8 _ 39. C1
        jnz     ?_080                                   ; 16CA _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 16CC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16CF _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 16D2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 16D5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 16D8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 16DB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16DE _ 8B. 55, F8
        add     edx, 2                                  ; 16E1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 16E4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 16E8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 16EB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 16EE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 16F1 _ 8B. 55, F8
        add     edx, 2                                  ; 16F4 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 16F7 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 16FB _ B8, 00000000
        jmp     ?_085                                   ; 1700 _ E9, 000000BF

?_080:  mov     eax, dword [ebp+8H]                     ; 1705 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1708 _ 8B. 00
        cmp     eax, 4095                               ; 170A _ 3D, 00000FFF
        jg      ?_084                                   ; 170F _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 1715 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1718 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 171A _ 89. 45, F4
        jmp     ?_082                                   ; 171D _ EB, 27

?_081:  mov     eax, dword [ebp-0CH]                    ; 171F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1722 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1725 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1728 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 172B _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 172E _ 8B. 45, 08
        add     edx, 2                                  ; 1731 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1734 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1737 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1739 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 173C _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 173F _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1743 _ FF. 4D, F4
?_082:  mov     eax, dword [ebp-0CH]                    ; 1746 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1749 _ 3B. 45, F8
        jg      ?_081                                   ; 174C _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 174E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1751 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1753 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1756 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1759 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 175B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 175E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1761 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1764 _ 8B. 00
        cmp     edx, eax                                ; 1766 _ 39. C2
        jge     ?_083                                   ; 1768 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 176A _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 176D _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 176F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1772 _ 89. 50, 04
?_083:  mov     eax, dword [ebp+8H]                     ; 1775 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1778 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 177B _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 177E _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1781 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1784 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1787 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 178A _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 178D _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1790 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1794 _ B8, 00000000
        jmp     ?_085                                   ; 1799 _ EB, 29

?_084:  mov     eax, dword [ebp+8H]                     ; 179B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 179E _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 17A1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 17A4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 17A7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 17AA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 17AD _ 8B. 40, 08
        mov     edx, eax                                ; 17B0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 17B2 _ 8B. 45, 10
        add     eax, edx                                ; 17B5 _ 01. D0
        mov     edx, eax                                ; 17B7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 17B9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 17BC _ 89. 50, 08
        mov     eax, 4294967295                         ; 17BF _ B8, FFFFFFFF
?_085:  add     esp, 16                                 ; 17C4 _ 83. C4, 10
        pop     ebx                                     ; 17C7 _ 5B
        pop     ebp                                     ; 17C8 _ 5D
        ret                                             ; 17C9 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 17CA _ 55
        mov     ebp, esp                                ; 17CB _ 89. E5
        sub     esp, 16                                 ; 17CD _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 17D0 _ 8B. 45, 0C
        add     eax, 4095                               ; 17D3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 17D8 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 17DD _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 17E0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17E3 _ FF. 75, 08
        call    memman_alloc                            ; 17E6 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 17EB _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 17EE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 17F1 _ 8B. 45, FC
        leave                                           ; 17F4 _ C9
        ret                                             ; 17F5 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 17F6 _ 55
        mov     ebp, esp                                ; 17F7 _ 89. E5
        sub     esp, 16                                 ; 17F9 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 17FC _ 8B. 45, 10
        add     eax, 4095                               ; 17FF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1804 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1809 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 180C _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 180F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1812 _ FF. 75, 08
        call    memman_free                             ; 1815 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 181A _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 181D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1820 _ 8B. 45, FC
        leave                                           ; 1823 _ C9
        ret                                             ; 1824 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1825 _ 55
        mov     ebp, esp                                ; 1826 _ 89. E5
        sub     esp, 24                                 ; 1828 _ 83. EC, 18
        sub     esp, 8                                  ; 182B _ 83. EC, 08
        push    9232                                    ; 182E _ 68, 00002410
        push    dword [ebp+8H]                          ; 1833 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1836 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 183B _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 183E _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1841 _ 83. 7D, F0, 00
        jnz     ?_086                                   ; 1845 _ 75, 0A
        mov     eax, 0                                  ; 1847 _ B8, 00000000
        jmp     ?_090                                   ; 184C _ E9, 00000099

?_086:  mov     eax, dword [ebp+10H]                    ; 1851 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 1854 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 1858 _ 83. EC, 08
        push    eax                                     ; 185B _ 50
        push    dword [ebp+8H]                          ; 185C _ FF. 75, 08
        call    memman_alloc_4k                         ; 185F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1864 _ 83. C4, 10
        mov     edx, eax                                ; 1867 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1869 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 186C _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 186F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 1872 _ 8B. 40, 04
        test    eax, eax                                ; 1875 _ 85. C0
        jnz     ?_087                                   ; 1877 _ 75, 1E
        mov     eax, dword [ebp-10H]                    ; 1879 _ 8B. 45, F0
        sub     esp, 4                                  ; 187C _ 83. EC, 04
        push    9232                                    ; 187F _ 68, 00002410
        push    eax                                     ; 1884 _ 50
        push    dword [ebp+8H]                          ; 1885 _ FF. 75, 08
        call    memman_free_4k                          ; 1888 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 188D _ 83. C4, 10
        mov     eax, 0                                  ; 1890 _ B8, 00000000
        jmp     ?_090                                   ; 1895 _ EB, 53

?_087:  mov     eax, dword [ebp-10H]                    ; 1897 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 189A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 189D _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 189F _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 18A2 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 18A5 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 18A8 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 18AB _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 18AE _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 18B1 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 18B4 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 18BB _ C7. 45, F4, 00000000
        jmp     ?_089                                   ; 18C2 _ EB, 1A

?_088:  mov     eax, dword [ebp-10H]                    ; 18C4 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 18C7 _ 8B. 55, F4
        add     edx, 33                                 ; 18CA _ 83. C2, 21
        shl     edx, 5                                  ; 18CD _ C1. E2, 05
        add     eax, edx                                ; 18D0 _ 01. D0
        add     eax, 16                                 ; 18D2 _ 83. C0, 10
        mov     dword [eax], 0                          ; 18D5 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 18DB _ FF. 45, F4
?_089:  cmp     dword [ebp-0CH], 255                    ; 18DE _ 81. 7D, F4, 000000FF
        jle     ?_088                                   ; 18E5 _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 18E7 _ 8B. 45, F0
?_090:  leave                                           ; 18EA _ C9
        ret                                             ; 18EB _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 18EC _ 55
        mov     ebp, esp                                ; 18ED _ 89. E5
        sub     esp, 16                                 ; 18EF _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 18F2 _ C7. 45, FC, 00000000
        jmp     ?_093                                   ; 18F9 _ EB, 5A

?_091:  mov     eax, dword [ebp+8H]                     ; 18FB _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 18FE _ 8B. 55, FC
        add     edx, 33                                 ; 1901 _ 83. C2, 21
        shl     edx, 5                                  ; 1904 _ C1. E2, 05
        add     eax, edx                                ; 1907 _ 01. D0
        add     eax, 16                                 ; 1909 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 190C _ 8B. 00
        test    eax, eax                                ; 190E _ 85. C0
        jnz     ?_092                                   ; 1910 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 1912 _ 8B. 45, FC
        shl     eax, 5                                  ; 1915 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 1918 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 191E _ 8B. 45, 08
        add     eax, edx                                ; 1921 _ 01. D0
        add     eax, 4                                  ; 1923 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 1926 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1929 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 192C _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 192F _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 1932 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 1935 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 1939 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 193C _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 1943 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 1946 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 194D _ 8B. 45, F8
        jmp     ?_094                                   ; 1950 _ EB, 11

?_092:  inc     dword [ebp-4H]                          ; 1952 _ FF. 45, FC
?_093:  cmp     dword [ebp-4H], 255                     ; 1955 _ 81. 7D, FC, 000000FF
        jle     ?_091                                   ; 195C _ 7E, 9D
        mov     eax, 0                                  ; 195E _ B8, 00000000
?_094:  leave                                           ; 1963 _ C9
        ret                                             ; 1964 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 1965 _ 55
        mov     ebp, esp                                ; 1966 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1968 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 196B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 196E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1970 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1973 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1976 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1979 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 197C _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 197F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1982 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 1985 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 1988 _ 89. 50, 14
        nop                                             ; 198B _ 90
        pop     ebp                                     ; 198C _ 5D
        ret                                             ; 198D _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 198E _ 55
        mov     ebp, esp                                ; 198F _ 89. E5
        push    esi                                     ; 1991 _ 56
        push    ebx                                     ; 1992 _ 53
        sub     esp, 16                                 ; 1993 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1996 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1999 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 199C _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 199F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 19A2 _ 8B. 40, 10
        inc     eax                                     ; 19A5 _ 40
        cmp     dword [ebp+10H], eax                    ; 19A6 _ 39. 45, 10
        jle     ?_095                                   ; 19A9 _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 19AB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 19AE _ 8B. 40, 10
        inc     eax                                     ; 19B1 _ 40
        mov     dword [ebp+10H], eax                    ; 19B2 _ 89. 45, 10
?_095:  cmp     dword [ebp+10H], -1                     ; 19B5 _ 83. 7D, 10, FF
        jge     ?_096                                   ; 19B9 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 19BB _ C7. 45, 10, FFFFFFFF
?_096:  mov     eax, dword [ebp+0CH]                    ; 19C2 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 19C5 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 19C8 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 19CB _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 19CE _ 3B. 45, 10
        jle     ?_103                                   ; 19D1 _ 0F 8E, 000001D3
        cmp     dword [ebp+10H], 0                      ; 19D7 _ 83. 7D, 10, 00
        js      ?_099                                   ; 19DB _ 0F 88, 000000E1
        mov     eax, dword [ebp-10H]                    ; 19E1 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 19E4 _ 89. 45, F4
        jmp     ?_098                                   ; 19E7 _ EB, 33

?_097:  mov     eax, dword [ebp-0CH]                    ; 19E9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 19EC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 19EF _ 8B. 45, 08
        add     edx, 4                                  ; 19F2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 19F5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 19F9 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 19FC _ 8B. 4D, F4
        add     ecx, 4                                  ; 19FF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1A02 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1A06 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1A09 _ 8B. 55, F4
        add     edx, 4                                  ; 1A0C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1A0F _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1A13 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1A16 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1A19 _ FF. 4D, F4
?_098:  mov     eax, dword [ebp-0CH]                    ; 1A1C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1A1F _ 3B. 45, 10
        jg      ?_097                                   ; 1A22 _ 7F, C5
        mov     eax, dword [ebp+8H]                     ; 1A24 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A27 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1A2A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1A2D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1A30 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 1A34 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1A37 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A3A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A3D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A40 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A43 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1A46 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1A49 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1A4C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A4F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A52 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1A55 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1A58 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A5B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A5E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1A61 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1A64 _ 83. EC, 08
        push    esi                                     ; 1A67 _ 56
        push    ebx                                     ; 1A68 _ 53
        push    ecx                                     ; 1A69 _ 51
        push    edx                                     ; 1A6A _ 52
        push    eax                                     ; 1A6B _ 50
        push    dword [ebp+8H]                          ; 1A6C _ FF. 75, 08
        call    sheet_refreshmap                        ; 1A6F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A74 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1A77 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 1A7A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A7D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A80 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1A83 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1A86 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1A89 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1A8C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1A8F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1A92 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A95 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1A98 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1A9B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1A9E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1AA1 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1AA4 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1AA7 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 1AAA _ FF. 75, F0
        push    esi                                     ; 1AAD _ 56
        push    ebx                                     ; 1AAE _ 53
        push    ecx                                     ; 1AAF _ 51
        push    edx                                     ; 1AB0 _ 52
        push    eax                                     ; 1AB1 _ 50
        push    dword [ebp+8H]                          ; 1AB2 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1AB5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1ABA _ 83. C4, 20
        jmp     ?_110                                   ; 1ABD _ E9, 00000239

?_099:  mov     eax, dword [ebp+8H]                     ; 1AC2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AC5 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 1AC8 _ 39. 45, F0
        jge     ?_102                                   ; 1ACB _ 7D, 46
        mov     eax, dword [ebp-10H]                    ; 1ACD _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1AD0 _ 89. 45, F4
        jmp     ?_101                                   ; 1AD3 _ EB, 33

?_100:  mov     eax, dword [ebp-0CH]                    ; 1AD5 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1AD8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1ADB _ 8B. 45, 08
        add     edx, 4                                  ; 1ADE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1AE1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1AE5 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1AE8 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1AEB _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1AEE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1AF2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1AF5 _ 8B. 55, F4
        add     edx, 4                                  ; 1AF8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1AFB _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1AFF _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1B02 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1B05 _ FF. 45, F4
?_101:  mov     eax, dword [ebp+8H]                     ; 1B08 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B0B _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 1B0E _ 39. 45, F4
        jl      ?_100                                   ; 1B11 _ 7C, C2
?_102:  mov     eax, dword [ebp+8H]                     ; 1B13 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B16 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1B19 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B1C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1B1F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B22 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B25 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B28 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B2E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B31 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B34 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B37 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B3A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B3D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B40 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B43 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B46 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B49 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1B4C _ 83. EC, 08
        push    0                                       ; 1B4F _ 6A, 00
        push    ebx                                     ; 1B51 _ 53
        push    ecx                                     ; 1B52 _ 51
        push    edx                                     ; 1B53 _ 52
        push    eax                                     ; 1B54 _ 50
        push    dword [ebp+8H]                          ; 1B55 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1B58 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B5D _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1B60 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 1B63 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1B66 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B69 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B6C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B6F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1B72 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1B75 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1B78 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1B7B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B7E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1B81 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1B84 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1B87 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1B8A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1B8D _ 8B. 40, 0C
        sub     esp, 4                                  ; 1B90 _ 83. EC, 04
        push    esi                                     ; 1B93 _ 56
        push    0                                       ; 1B94 _ 6A, 00
        push    ebx                                     ; 1B96 _ 53
        push    ecx                                     ; 1B97 _ 51
        push    edx                                     ; 1B98 _ 52
        push    eax                                     ; 1B99 _ 50
        push    dword [ebp+8H]                          ; 1B9A _ FF. 75, 08
        call    sheet_refreshsub                        ; 1B9D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BA2 _ 83. C4, 20
        jmp     ?_110                                   ; 1BA5 _ E9, 00000151

?_103:  mov     eax, dword [ebp-10H]                    ; 1BAA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 1BAD _ 3B. 45, 10
        jge     ?_110                                   ; 1BB0 _ 0F 8D, 00000145
        cmp     dword [ebp-10H], 0                      ; 1BB6 _ 83. 7D, F0, 00
        js      ?_106                                   ; 1BBA _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 1BBC _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 1BBF _ 89. 45, F4
        jmp     ?_105                                   ; 1BC2 _ EB, 33

?_104:  mov     eax, dword [ebp-0CH]                    ; 1BC4 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1BC7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1BCA _ 8B. 45, 08
        add     edx, 4                                  ; 1BCD _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1BD0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1BD4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1BD7 _ 8B. 4D, F4
        add     ecx, 4                                  ; 1BDA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1BDD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1BE1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1BE4 _ 8B. 55, F4
        add     edx, 4                                  ; 1BE7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1BEA _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1BEE _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 1BF1 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 1BF4 _ FF. 45, F4
?_105:  mov     eax, dword [ebp-0CH]                    ; 1BF7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1BFA _ 3B. 45, 10
        jl      ?_104                                   ; 1BFD _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 1BFF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C02 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C05 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C08 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1C0B _ 89. 54 88, 04
        jmp     ?_109                                   ; 1C0F _ EB, 69

?_106:  mov     eax, dword [ebp+8H]                     ; 1C11 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1C14 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 1C17 _ 89. 45, F4
        jmp     ?_108                                   ; 1C1A _ EB, 37

?_107:  mov     eax, dword [ebp-0CH]                    ; 1C1C _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 1C1F _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C22 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1C25 _ 8B. 55, F4
        add     edx, 4                                  ; 1C28 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 1C2B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 1C2F _ 8B. 45, 08
        add     ecx, 4                                  ; 1C32 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 1C35 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 1C39 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 1C3C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C3F _ 8B. 45, 08
        add     edx, 4                                  ; 1C42 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1C45 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 1C49 _ 8B. 55, F4
        inc     edx                                     ; 1C4C _ 42
        mov     dword [eax+18H], edx                    ; 1C4D _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 1C50 _ FF. 4D, F4
?_108:  mov     eax, dword [ebp-0CH]                    ; 1C53 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 1C56 _ 3B. 45, 10
        jge     ?_107                                   ; 1C59 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 1C5B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1C5E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 1C61 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 1C64 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 1C67 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 1C6B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1C6E _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1C71 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C74 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1C77 _ 89. 50, 10
?_109:  mov     eax, dword [ebp+0CH]                    ; 1C7A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C7D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C80 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C83 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1C86 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1C89 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1C8C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1C8F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C92 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1C95 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1C98 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1C9B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1C9E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CA1 _ 8B. 40, 0C
        sub     esp, 8                                  ; 1CA4 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1CA7 _ FF. 75, 10
        push    ebx                                     ; 1CAA _ 53
        push    ecx                                     ; 1CAB _ 51
        push    edx                                     ; 1CAC _ 52
        push    eax                                     ; 1CAD _ 50
        push    dword [ebp+8H]                          ; 1CAE _ FF. 75, 08
        call    sheet_refreshmap                        ; 1CB1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CB6 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1CB9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CBC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CBF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1CC2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 1CC5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 1CC8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1CCB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1CCE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CD1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 1CD4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 1CD7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1CDA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1CDD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1CE0 _ 8B. 40, 0C
        sub     esp, 4                                  ; 1CE3 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 1CE6 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 1CE9 _ FF. 75, 10
        push    ebx                                     ; 1CEC _ 53
        push    ecx                                     ; 1CED _ 51
        push    edx                                     ; 1CEE _ 52
        push    eax                                     ; 1CEF _ 50
        push    dword [ebp+8H]                          ; 1CF0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1CF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CF8 _ 83. C4, 20
?_110:  nop                                             ; 1CFB _ 90
        lea     esp, [ebp-8H]                           ; 1CFC _ 8D. 65, F8
        pop     ebx                                     ; 1CFF _ 5B
        pop     esi                                     ; 1D00 _ 5E
        pop     ebp                                     ; 1D01 _ 5D
        ret                                             ; 1D02 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 1D03 _ 55
        mov     ebp, esp                                ; 1D04 _ 89. E5
        push    edi                                     ; 1D06 _ 57
        push    esi                                     ; 1D07 _ 56
        push    ebx                                     ; 1D08 _ 53
        sub     esp, 28                                 ; 1D09 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 1D0C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1D0F _ 8B. 40, 18
        test    eax, eax                                ; 1D12 _ 85. C0
        js      ?_111                                   ; 1D14 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 1D16 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 1D19 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 1D1C _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 1D1F _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 1D22 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D25 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 1D28 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 1D2B _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 1D2E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 1D31 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 1D34 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 1D37 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 1D3A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 1D3D _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 1D40 _ 8B. 45, 14
        add     edx, eax                                ; 1D43 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1D45 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D48 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 1D4B _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1D4E _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 1D51 _ 03. 45, E4
        sub     esp, 4                                  ; 1D54 _ 83. EC, 04
        push    ebx                                     ; 1D57 _ 53
        push    ecx                                     ; 1D58 _ 51
        push    edi                                     ; 1D59 _ 57
        push    esi                                     ; 1D5A _ 56
        push    edx                                     ; 1D5B _ 52
        push    eax                                     ; 1D5C _ 50
        push    dword [ebp+8H]                          ; 1D5D _ FF. 75, 08
        call    sheet_refreshsub                        ; 1D60 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1D65 _ 83. C4, 20
?_111:  mov     eax, 0                                  ; 1D68 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 1D6D _ 8D. 65, F4
        pop     ebx                                     ; 1D70 _ 5B
        pop     esi                                     ; 1D71 _ 5E
        pop     edi                                     ; 1D72 _ 5F
        pop     ebp                                     ; 1D73 _ 5D
        ret                                             ; 1D74 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 1D75 _ 55
        mov     ebp, esp                                ; 1D76 _ 89. E5
        push    esi                                     ; 1D78 _ 56
        push    ebx                                     ; 1D79 _ 53
        sub     esp, 16                                 ; 1D7A _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1D7D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 1D80 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 1D83 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1D86 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 1D89 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 1D8C _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D8F _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 1D92 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 1D95 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 1D98 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1D9B _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 1D9E _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 1DA1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DA4 _ 8B. 40, 18
        test    eax, eax                                ; 1DA7 _ 85. C0
        js      ?_112                                   ; 1DA9 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 1DAF _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1DB2 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1DB5 _ 8B. 45, F0
        add     edx, eax                                ; 1DB8 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1DBA _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 1DBD _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 1DC0 _ 8B. 45, F4
        add     eax, ecx                                ; 1DC3 _ 01. C8
        sub     esp, 8                                  ; 1DC5 _ 83. EC, 08
        push    0                                       ; 1DC8 _ 6A, 00
        push    edx                                     ; 1DCA _ 52
        push    eax                                     ; 1DCB _ 50
        push    dword [ebp-10H]                         ; 1DCC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1DCF _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1DD2 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1DD5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DDA _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1DDD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1DE0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 1DE3 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 1DE6 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 1DE9 _ 8B. 55, 14
        add     ecx, edx                                ; 1DEC _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 1DEE _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 1DF1 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 1DF4 _ 8B. 55, 10
        add     edx, ebx                                ; 1DF7 _ 01. DA
        sub     esp, 8                                  ; 1DF9 _ 83. EC, 08
        push    eax                                     ; 1DFC _ 50
        push    ecx                                     ; 1DFD _ 51
        push    edx                                     ; 1DFE _ 52
        push    dword [ebp+14H]                         ; 1DFF _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1E02 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E05 _ FF. 75, 08
        call    sheet_refreshmap                        ; 1E08 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E0D _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E10 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E13 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 1E16 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1E19 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 1E1C _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 1E1F _ 8B. 45, F0
        add     edx, eax                                ; 1E22 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 1E24 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 1E27 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 1E2A _ 8B. 45, F4
        add     eax, ebx                                ; 1E2D _ 01. D8
        sub     esp, 4                                  ; 1E2F _ 83. EC, 04
        push    ecx                                     ; 1E32 _ 51
        push    0                                       ; 1E33 _ 6A, 00
        push    edx                                     ; 1E35 _ 52
        push    eax                                     ; 1E36 _ 50
        push    dword [ebp-10H]                         ; 1E37 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1E3A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1E3D _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E40 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E45 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 1E48 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 1E4B _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 1E4E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 1E51 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 1E54 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 1E57 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 1E5A _ 8B. 4D, 14
        add     ebx, ecx                                ; 1E5D _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 1E5F _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 1E62 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 1E65 _ 8B. 4D, 10
        add     ecx, esi                                ; 1E68 _ 01. F1
        sub     esp, 4                                  ; 1E6A _ 83. EC, 04
        push    edx                                     ; 1E6D _ 52
        push    eax                                     ; 1E6E _ 50
        push    ebx                                     ; 1E6F _ 53
        push    ecx                                     ; 1E70 _ 51
        push    dword [ebp+14H]                         ; 1E71 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1E74 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 1E77 _ FF. 75, 08
        call    sheet_refreshsub                        ; 1E7A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E7F _ 83. C4, 20
?_112:  nop                                             ; 1E82 _ 90
        lea     esp, [ebp-8H]                           ; 1E83 _ 8D. 65, F8
        pop     ebx                                     ; 1E86 _ 5B
        pop     esi                                     ; 1E87 _ 5E
        pop     ebp                                     ; 1E88 _ 5D
        ret                                             ; 1E89 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 1E8A _ 55
        mov     ebp, esp                                ; 1E8B _ 89. E5
        sub     esp, 48                                 ; 1E8D _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 1E90 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E93 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 1E95 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 1E98 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E9B _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 1E9E _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 1EA1 _ 83. 7D, 0C, 00
        jns     ?_113                                   ; 1EA5 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 1EA7 _ C7. 45, 0C, 00000000
?_113:  cmp     dword [ebp+10H], 8                      ; 1EAE _ 83. 7D, 10, 08
        jg      ?_114                                   ; 1EB2 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 1EB4 _ C7. 45, 10, 00000000
?_114:  mov     eax, dword [ebp+8H]                     ; 1EBB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EBE _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 1EC1 _ 39. 45, 14
        jle     ?_115                                   ; 1EC4 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 1EC6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EC9 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 1ECC _ 89. 45, 14
?_115:  mov     eax, dword [ebp+8H]                     ; 1ECF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1ED2 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 1ED5 _ 39. 45, 18
        jle     ?_116                                   ; 1ED8 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 1EDA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1EDD _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 1EE0 _ 89. 45, 18
?_116:  mov     eax, dword [ebp+1CH]                    ; 1EE3 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 1EE6 _ 89. 45, FC
        jmp     ?_123                                   ; 1EE9 _ E9, 0000010E

?_117:  mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1EF1 _ 8B. 55, FC
        add     edx, 4                                  ; 1EF4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 1EF7 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 1EFB _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 1EFE _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 1F01 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 1F03 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 1F06 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 1F09 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 1F0F _ 8B. 45, E8
        sub     eax, edx                                ; 1F12 _ 29. D0
        sar     eax, 5                                  ; 1F14 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 1F17 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 1F1A _ C7. 45, F4, 00000000
        jmp     ?_122                                   ; 1F21 _ E9, 000000C4

?_118:  mov     eax, dword [ebp-18H]                    ; 1F26 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 1F29 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 1F2C _ 8B. 45, F4
        add     eax, edx                                ; 1F2F _ 01. D0
        mov     dword [ebp-24H], eax                    ; 1F31 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 1F34 _ C7. 45, F8, 00000000
        jmp     ?_121                                   ; 1F3B _ E9, 00000098

?_119:  mov     eax, dword [ebp-18H]                    ; 1F40 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 1F43 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 1F46 _ 8B. 45, F8
        add     eax, edx                                ; 1F49 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 1F4B _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 1F4E _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 1F51 _ 3B. 45, D8
        jg      ?_120                                   ; 1F54 _ 7F, 7F
        mov     eax, dword [ebp-28H]                    ; 1F56 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 1F59 _ 3B. 45, 14
        jge     ?_120                                   ; 1F5C _ 7D, 77
        mov     eax, dword [ebp+10H]                    ; 1F5E _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 1F61 _ 3B. 45, DC
        jg      ?_120                                   ; 1F64 _ 7F, 6F
        mov     eax, dword [ebp-24H]                    ; 1F66 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 1F69 _ 3B. 45, 18
        jge     ?_120                                   ; 1F6C _ 7D, 67
        mov     eax, dword [ebp-18H]                    ; 1F6E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 1F71 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 1F74 _ 0F AF. 45, F4
        mov     edx, eax                                ; 1F78 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1F7A _ 8B. 45, F8
        add     eax, edx                                ; 1F7D _ 01. D0
        mov     edx, eax                                ; 1F7F _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 1F81 _ 8B. 45, E4
        add     eax, edx                                ; 1F84 _ 01. D0
        mov     al, byte [eax]                          ; 1F86 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 1F88 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 1F8B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F8E _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 1F91 _ 0F AF. 45, DC
        mov     edx, eax                                ; 1F95 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 1F97 _ 8B. 45, D8
        add     eax, edx                                ; 1F9A _ 01. D0
        mov     edx, eax                                ; 1F9C _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 1F9E _ 8B. 45, EC
        add     eax, edx                                ; 1FA1 _ 01. D0
        mov     al, byte [eax]                          ; 1FA3 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 1FA5 _ 38. 45, E3
        jnz     ?_120                                   ; 1FA8 _ 75, 2B
        movzx   edx, byte [ebp-29H]                     ; 1FAA _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 1FAE _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 1FB1 _ 8B. 40, 14
        cmp     edx, eax                                ; 1FB4 _ 39. C2
        jz      ?_120                                   ; 1FB6 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 1FB8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1FBB _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 1FBE _ 0F AF. 45, DC
        mov     edx, eax                                ; 1FC2 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 1FC4 _ 8B. 45, D8
        add     eax, edx                                ; 1FC7 _ 01. D0
        mov     edx, eax                                ; 1FC9 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1FCB _ 8B. 45, F0
        add     edx, eax                                ; 1FCE _ 01. C2
        mov     al, byte [ebp-29H]                      ; 1FD0 _ 8A. 45, D7
        mov     byte [edx], al                          ; 1FD3 _ 88. 02
?_120:  inc     dword [ebp-8H]                          ; 1FD5 _ FF. 45, F8
?_121:  mov     eax, dword [ebp-18H]                    ; 1FD8 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 1FDB _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 1FDE _ 39. 45, F8
        jl      ?_119                                   ; 1FE1 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 1FE7 _ FF. 45, F4
?_122:  mov     eax, dword [ebp-18H]                    ; 1FEA _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 1FED _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 1FF0 _ 39. 45, F4
        jl      ?_118                                   ; 1FF3 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 1FF9 _ FF. 45, FC
?_123:  mov     eax, dword [ebp-4H]                     ; 1FFC _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 1FFF _ 3B. 45, 20
        jle     ?_117                                   ; 2002 _ 0F 8E, FFFFFEE6
        nop                                             ; 2008 _ 90
        nop                                             ; 2009 _ 90
        leave                                           ; 200A _ C9
        ret                                             ; 200B _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 200C _ 55
        mov     ebp, esp                                ; 200D _ 89. E5
        sub     esp, 64                                 ; 200F _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2012 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2015 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2018 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 201B _ 83. 7D, 0C, 00
        jns     ?_124                                   ; 201F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2021 _ C7. 45, 0C, 00000000
?_124:  cmp     dword [ebp+10H], 0                      ; 2028 _ 83. 7D, 10, 00
        jns     ?_125                                   ; 202C _ 79, 07
        mov     dword [ebp+10H], 0                      ; 202E _ C7. 45, 10, 00000000
?_125:  mov     eax, dword [ebp+8H]                     ; 2035 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2038 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 203B _ 39. 45, 14
        jle     ?_126                                   ; 203E _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2040 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2043 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2046 _ 89. 45, 14
?_126:  mov     eax, dword [ebp+8H]                     ; 2049 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 204C _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 204F _ 39. 45, 18
        jle     ?_127                                   ; 2052 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2054 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2057 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 205A _ 89. 45, 18
?_127:  mov     eax, dword [ebp+1CH]                    ; 205D _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2060 _ 89. 45, FC
        jmp     ?_138                                   ; 2063 _ E9, 00000137

?_128:  mov     eax, dword [ebp+8H]                     ; 2068 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 206B _ 8B. 55, FC
        add     edx, 4                                  ; 206E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2071 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2075 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2078 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 207B _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2081 _ 8B. 45, DC
        sub     eax, edx                                ; 2084 _ 29. D0
        sar     eax, 5                                  ; 2086 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2089 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 208C _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 208F _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2091 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2094 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2097 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 209A _ 8B. 55, 0C
        sub     edx, eax                                ; 209D _ 29. C2
        mov     eax, edx                                ; 209F _ 89. D0
        mov     dword [ebp-10H], eax                    ; 20A1 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 20A4 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 20A7 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 20AA _ 8B. 55, 10
        sub     edx, eax                                ; 20AD _ 29. C2
        mov     eax, edx                                ; 20AF _ 89. D0
        mov     dword [ebp-14H], eax                    ; 20B1 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 20B4 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 20B7 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 20BA _ 8B. 55, 14
        sub     edx, eax                                ; 20BD _ 29. C2
        mov     eax, edx                                ; 20BF _ 89. D0
        mov     dword [ebp-18H], eax                    ; 20C1 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 20C4 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 20C7 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 20CA _ 8B. 55, 18
        sub     edx, eax                                ; 20CD _ 29. C2
        mov     eax, edx                                ; 20CF _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 20D1 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 20D4 _ 83. 7D, F0, 00
        jns     ?_129                                   ; 20D8 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 20DA _ C7. 45, F0, 00000000
?_129:  cmp     dword [ebp-14H], 0                      ; 20E1 _ 83. 7D, EC, 00
        jns     ?_130                                   ; 20E5 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 20E7 _ C7. 45, EC, 00000000
?_130:  mov     eax, dword [ebp-24H]                    ; 20EE _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 20F1 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 20F4 _ 39. 45, E8
        jle     ?_131                                   ; 20F7 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 20F9 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 20FC _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 20FF _ 89. 45, E8
?_131:  mov     eax, dword [ebp-24H]                    ; 2102 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2105 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2108 _ 39. 45, E4
        jle     ?_132                                   ; 210B _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 210D _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2110 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2113 _ 89. 45, E4
?_132:  mov     eax, dword [ebp-14H]                    ; 2116 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2119 _ 89. 45, F4
        jmp     ?_137                                   ; 211C _ EB, 76

?_133:  mov     eax, dword [ebp-24H]                    ; 211E _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2121 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2124 _ 8B. 45, F4
        add     eax, edx                                ; 2127 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2129 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 212C _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 212F _ 89. 45, F8
        jmp     ?_136                                   ; 2132 _ EB, 55

?_134:  mov     eax, dword [ebp-24H]                    ; 2134 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2137 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 213A _ 8B. 45, F8
        add     eax, edx                                ; 213D _ 01. D0
        mov     dword [ebp-34H], eax                    ; 213F _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2142 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2145 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2148 _ 0F AF. 45, F4
        mov     edx, eax                                ; 214C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 214E _ 8B. 45, F8
        add     eax, edx                                ; 2151 _ 01. D0
        mov     edx, eax                                ; 2153 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2155 _ 8B. 45, D4
        add     eax, edx                                ; 2158 _ 01. D0
        mov     al, byte [eax]                          ; 215A _ 8A. 00
        movzx   edx, al                                 ; 215C _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 215F _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2162 _ 8B. 40, 14
        cmp     edx, eax                                ; 2165 _ 39. C2
        jz      ?_135                                   ; 2167 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2169 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 216C _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 216F _ 0F AF. 45, D0
        mov     edx, eax                                ; 2173 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2175 _ 8B. 45, CC
        add     eax, edx                                ; 2178 _ 01. D0
        mov     edx, eax                                ; 217A _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 217C _ 8B. 45, E0
        add     edx, eax                                ; 217F _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2181 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2184 _ 88. 02
?_135:  inc     dword [ebp-8H]                          ; 2186 _ FF. 45, F8
?_136:  mov     eax, dword [ebp-8H]                     ; 2189 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 218C _ 3B. 45, E8
        jl      ?_134                                   ; 218F _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2191 _ FF. 45, F4
?_137:  mov     eax, dword [ebp-0CH]                    ; 2194 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2197 _ 3B. 45, E4
        jl      ?_133                                   ; 219A _ 7C, 82
        inc     dword [ebp-4H]                          ; 219C _ FF. 45, FC
?_138:  mov     eax, dword [ebp+8H]                     ; 219F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 21A2 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 21A5 _ 39. 45, FC
        jle     ?_128                                   ; 21A8 _ 0F 8E, FFFFFEBA
        nop                                             ; 21AE _ 90
        leave                                           ; 21AF _ C9
        ret                                             ; 21B0 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 21B1 _ 55
        mov     ebp, esp                                ; 21B2 _ 89. E5
        sub     esp, 8                                  ; 21B4 _ 83. EC, 08
        sub     esp, 8                                  ; 21B7 _ 83. EC, 08
        push    52                                      ; 21BA _ 6A, 34
        push    67                                      ; 21BC _ 6A, 43
        call    io_out8                                 ; 21BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21C3 _ 83. C4, 10
        sub     esp, 8                                  ; 21C6 _ 83. EC, 08
        push    156                                     ; 21C9 _ 68, 0000009C
        push    64                                      ; 21CE _ 6A, 40
        call    io_out8                                 ; 21D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21D5 _ 83. C4, 10
        sub     esp, 8                                  ; 21D8 _ 83. EC, 08
        push    46                                      ; 21DB _ 6A, 2E
        push    64                                      ; 21DD _ 6A, 40
        call    io_out8                                 ; 21DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21E4 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 21E7 _ C7. 05, 0000024C(d), 00000000
        mov     dword [?_162], 0                        ; 21F1 _ C7. 05, 00000250(d), 00000000
        nop                                             ; 21FB _ 90
        leave                                           ; 21FC _ C9
        ret                                             ; 21FD _ C3
; init_pit End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 21FE _ 55
        mov     ebp, esp                                ; 21FF _ 89. E5
        sub     esp, 8                                  ; 2201 _ 83. EC, 08
        sub     esp, 8                                  ; 2204 _ 83. EC, 08
        push    96                                      ; 2207 _ 6A, 60
        push    32                                      ; 2209 _ 6A, 20
        call    io_out8                                 ; 220B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2210 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2213 _ A1, 0000024C(d)
        inc     eax                                     ; 2218 _ 40
        mov     dword [timerctl], eax                   ; 2219 _ A3, 0000024C(d)
        mov     eax, dword [?_162]                      ; 221E _ A1, 00000250(d)
        test    eax, eax                                ; 2223 _ 85. C0
        jz      ?_139                                   ; 2225 _ 74, 2F
        mov     eax, dword [?_162]                      ; 2227 _ A1, 00000250(d)
        dec     eax                                     ; 222C _ 48
        mov     dword [?_162], eax                      ; 222D _ A3, 00000250(d)
        mov     eax, dword [?_162]                      ; 2232 _ A1, 00000250(d)
        test    eax, eax                                ; 2237 _ 85. C0
        jnz     ?_139                                   ; 2239 _ 75, 1B
        mov     al, byte [?_164]                        ; 223B _ A0, 00000258(d)
        movzx   edx, al                                 ; 2240 _ 0F B6. D0
        mov     eax, dword [?_163]                      ; 2243 _ A1, 00000254(d)
        sub     esp, 8                                  ; 2248 _ 83. EC, 08
        push    edx                                     ; 224B _ 52
        push    eax                                     ; 224C _ 50
        call    fifo8_put                               ; 224D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2252 _ 83. C4, 10
        nop                                             ; 2255 _ 90
?_139:  nop                                             ; 2256 _ 90
        leave                                           ; 2257 _ C9
        ret                                             ; 2258 _ C3
; intHandlerForTimer End of function

settimer:; Function begin
        push    ebp                                     ; 2259 _ 55
        mov     ebp, esp                                ; 225A _ 89. E5
        sub     esp, 40                                 ; 225C _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 225F _ 8B. 45, 10
        mov     byte [ebp-1CH], al                      ; 2262 _ 88. 45, E4
        call    io_load_eflags                          ; 2265 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 226A _ 89. 45, F4
        call    io_cli                                  ; 226D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2272 _ 8B. 45, 08
        mov     dword [?_162], eax                      ; 2275 _ A3, 00000250(d)
        mov     eax, dword [ebp+0CH]                    ; 227A _ 8B. 45, 0C
        mov     dword [?_163], eax                      ; 227D _ A3, 00000254(d)
        mov     al, byte [ebp-1CH]                      ; 2282 _ 8A. 45, E4
        mov     byte [?_164], al                        ; 2285 _ A2, 00000258(d)
        sub     esp, 12                                 ; 228A _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 228D _ FF. 75, F4
        call    io_store_eflags                         ; 2290 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2295 _ 83. C4, 10
        nop                                             ; 2298 _ 90
        leave                                           ; 2299 _ C9
        ret                                             ; 229A _ C3
; settimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 229B _ 55
        mov     ebp, esp                                ; 229C _ 89. E5
        mov     eax, timerctl                           ; 229E _ B8, 0000024C(d)
        pop     ebp                                     ; 22A3 _ 5D
        ret                                             ; 22A4 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 22A5 _ 55
        mov     ebp, esp                                ; 22A6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 22AB _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 22AE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 22B1 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22B4 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 22B7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 22B9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 22BC _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 22BF _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 22C2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 22C5 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 22CC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22CF _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 22D6 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 22D9 _ C7. 40, 08, 00000000
        nop                                             ; 22E0 _ 90
        pop     ebp                                     ; 22E1 _ 5D
        ret                                             ; 22E2 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 22E3 _ 55
        mov     ebp, esp                                ; 22E4 _ 89. E5
        sub     esp, 4                                  ; 22E6 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 22E9 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 22EC _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 22EF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22F2 _ 8B. 40, 10
        test    eax, eax                                ; 22F5 _ 85. C0
        jnz     ?_140                                   ; 22F7 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 22F9 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 22FC _ 8B. 40, 14
        or      eax, 01H                                ; 22FF _ 83. C8, 01
        mov     edx, eax                                ; 2302 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2304 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2307 _ 89. 50, 14
        mov     eax, 4294967295                         ; 230A _ B8, FFFFFFFF
        jmp     ?_142                                   ; 230F _ EB, 4F

?_140:  mov     eax, dword [ebp+8H]                     ; 2311 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2314 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2316 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2319 _ 8B. 40, 04
        add     edx, eax                                ; 231C _ 01. C2
        mov     al, byte [ebp-4H]                       ; 231E _ 8A. 45, FC
        mov     byte [edx], al                          ; 2321 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2323 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2326 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2329 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 232C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 232F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2332 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2335 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2338 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 233B _ 8B. 40, 0C
        cmp     edx, eax                                ; 233E _ 39. C2
        jnz     ?_141                                   ; 2340 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2342 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2345 _ C7. 40, 04, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 234C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 234F _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2352 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2355 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2358 _ 89. 50, 10
        mov     eax, 0                                  ; 235B _ B8, 00000000
?_142:  leave                                           ; 2360 _ C9
        ret                                             ; 2361 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2362 _ 55
        mov     ebp, esp                                ; 2363 _ 89. E5
        sub     esp, 16                                 ; 2365 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2368 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 236B _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 236E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2371 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2374 _ 39. C2
        jnz     ?_143                                   ; 2376 _ 75, 07
        mov     eax, 4294967295                         ; 2378 _ B8, FFFFFFFF
        jmp     ?_145                                   ; 237D _ EB, 50

?_143:  mov     eax, dword [ebp+8H]                     ; 237F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2382 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2384 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2387 _ 8B. 40, 08
        add     eax, edx                                ; 238A _ 01. D0
        mov     al, byte [eax]                          ; 238C _ 8A. 00
        movzx   eax, al                                 ; 238E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2391 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2394 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2397 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 239A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 239D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 23A0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23A3 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 23A6 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23A9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23AC _ 8B. 40, 0C
        cmp     edx, eax                                ; 23AF _ 39. C2
        jnz     ?_144                                   ; 23B1 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 23B3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 23B6 _ C7. 40, 08, 00000000
?_144:  mov     eax, dword [ebp+8H]                     ; 23BD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23C0 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 23C3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23C6 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 23C9 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 23CC _ 8B. 45, FC
?_145:  leave                                           ; 23CF _ C9
        ret                                             ; 23D0 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 23D1 _ 55
        mov     ebp, esp                                ; 23D2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 23D4 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 23D7 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 23DA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23DD _ 8B. 40, 10
        sub     edx, eax                                ; 23E0 _ 29. C2
        mov     eax, edx                                ; 23E2 _ 89. D0
        pop     ebp                                     ; 23E4 _ 5D
        ret                                             ; 23E5 _ C3
; fifo8_status End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_146:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_147:                                                  ; byte
        db 35H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 0008 _ 5[sec].

?_148:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 000F _ page is:
        db 20H, 00H                                     ; 0017 _  .

?_149:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0019 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0021 _ L: .

?_150:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0025 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 002D _ H: .

?_151:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0031 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0039 _ w: .

?_152:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 003D _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0045 _ gh: .

?_153:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 004A _ type: .

?_154:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0051 _ Welcome 
        db 74H, 6FH, 00H                                ; 0059 _ to.

?_155:                                                  ; byte
        db 4DH, 79H, 4FH, 53H, 00H                      ; 005C _ MyOS.


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H                                    ; 0000 _ 1048576 

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0004 _ 0X

?_156:  db 00H                                          ; 0006 _ .

?_157:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0007 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 000F _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0017 _ ........
        db 00H                                          ; 001F _ .

table_rgb.1794:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1841:                                            ; byte
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

closebtn.1953:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_158:                                                  ; dword
        resb    2                                       ; 0004

?_159:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    16                                      ; 00E0

timerinfo:                                              ; byte
        resb    24                                      ; 00F0

timerbuf: resq  1                                       ; 0108

mx:     resd    1                                       ; 0110

my:     resd    1                                       ; 0114

xsize:  resd    1                                       ; 0118

ysize:  resd    1                                       ; 011C

buf_back: resd  8                                       ; 0120

buf_mouse:                                              ; byte
        resb    256                                     ; 0140

str.1889:                                               ; byte
        resb    1                                       ; 0240

?_160:  resb    9                                       ; 0241

?_161:  resb    2                                       ; 024A

timerctl:                                               ; oword
        resd    1                                       ; 024C

?_162:  resd    1                                       ; 0250

?_163:  resd    1                                       ; 0254

?_164:  resb    4                                       ; 0258


