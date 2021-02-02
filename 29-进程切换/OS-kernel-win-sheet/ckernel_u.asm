; Disassembly of file: ckernel.o
; Mon Feb  1 16:44:12 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global task_b_main: function
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
global make_textbox8: function
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
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global set_segmdesc: function
global memman

extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern taskswitch9                                      ; near
extern get_code32_addr                                  ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern taskswitch7                                      ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern taskswitch8                                      ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 80                                 ; 0005 _ 83. EC, 50
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-18H], eax                    ; 001D _ 89. 45, E8
        mov     eax, dword [?_179]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 00000118(d)
        mov     ax, word [?_180]                        ; 002B _ 66: A1, 00000006(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ysize], eax                      ; 0032 _ A3, 0000011C(d)
        call    init_pit                                ; 0037 _ E8, FFFFFFFC(rel)
        sub     esp, 4                                  ; 003C _ 83. EC, 04
        push    timerbuf                                ; 003F _ 68, 00000108(d)
        push    8                                       ; 0044 _ 6A, 08
        push    timerinfo                               ; 0046 _ 68, 000000F0(d)
        call    fifo8_init                              ; 004B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0050 _ 83. C4, 10
        call    timer_alloc                             ; 0053 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0058 _ 89. 45, E4
        sub     esp, 4                                  ; 005B _ 83. EC, 04
        push    10                                      ; 005E _ 6A, 0A
        push    timerinfo                               ; 0060 _ 68, 000000F0(d)
        push    dword [ebp-1CH]                         ; 0065 _ FF. 75, E4
        call    timer_init                              ; 0068 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006D _ 83. C4, 10
        sub     esp, 8                                  ; 0070 _ 83. EC, 08
        push    500                                     ; 0073 _ 68, 000001F4
        push    dword [ebp-1CH]                         ; 0078 _ FF. 75, E4
        call    timer_settime                           ; 007B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0080 _ 83. C4, 10
        call    timer_alloc                             ; 0083 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0088 _ 89. 45, E0
        sub     esp, 4                                  ; 008B _ 83. EC, 04
        push    2                                       ; 008E _ 6A, 02
        push    timerinfo                               ; 0090 _ 68, 000000F0(d)
        push    dword [ebp-20H]                         ; 0095 _ FF. 75, E0
        call    timer_init                              ; 0098 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009D _ 83. C4, 10
        sub     esp, 8                                  ; 00A0 _ 83. EC, 08
        push    300                                     ; 00A3 _ 68, 0000012C
        push    dword [ebp-20H]                         ; 00A8 _ FF. 75, E0
        call    timer_settime                           ; 00AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00B0 _ 83. C4, 10
        call    timer_alloc                             ; 00B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00B8 _ 89. 45, DC
        sub     esp, 4                                  ; 00BB _ 83. EC, 04
        push    1                                       ; 00BE _ 6A, 01
        push    timerinfo                               ; 00C0 _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 00C5 _ FF. 75, DC
        call    timer_init                              ; 00C8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00CD _ 83. C4, 10
        sub     esp, 8                                  ; 00D0 _ 83. EC, 08
        push    50                                      ; 00D3 _ 6A, 32
        push    dword [ebp-24H]                         ; 00D5 _ FF. 75, DC
        call    timer_settime                           ; 00D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DD _ 83. C4, 10
        sub     esp, 4                                  ; 00E0 _ 83. EC, 04
        push    keybuf                                  ; 00E3 _ 68, 00000040(d)
        push    32                                      ; 00E8 _ 6A, 20
        push    keyinfo                                 ; 00EA _ 68, 00000008(d)
        call    fifo8_init                              ; 00EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F4 _ 83. C4, 10
        sub     esp, 4                                  ; 00F7 _ 83. EC, 04
        push    mousebuf                                ; 00FA _ 68, 00000060(d)
        push    128                                     ; 00FF _ 68, 00000080
        push    mouseinfo                               ; 0104 _ 68, 00000020(d)
        call    fifo8_init                              ; 0109 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010E _ 83. C4, 10
        call    init_palette                            ; 0111 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0116 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 011B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0120 _ 89. 45, D8
        call    get_adr_buffer                          ; 0123 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0128 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 012B _ A1, 00000000(d)
        sub     esp, 12                                 ; 0130 _ 83. EC, 0C
        push    eax                                     ; 0133 _ 50
        call    memman_init                             ; 0134 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0139 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 013C _ A1, 00000000(d)
        sub     esp, 4                                  ; 0141 _ 83. EC, 04
        push    1072594944                              ; 0144 _ 68, 3FEE8000
        push    16809984                                ; 0149 _ 68, 01008000
        push    eax                                     ; 014E _ 50
        call    memman_free                             ; 014F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0154 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0157 _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 015D _ 8B. 15, 00000118(d)
        mov     eax, dword [memman]                     ; 0163 _ A1, 00000000(d)
        push    ecx                                     ; 0168 _ 51
        push    edx                                     ; 0169 _ 52
        push    dword [ebp-18H]                         ; 016A _ FF. 75, E8
        push    eax                                     ; 016D _ 50
        call    shtctl_init                             ; 016E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0173 _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0176 _ A3, 00000244(d)
        mov     eax, dword [shtctl]                     ; 017B _ A1, 00000244(d)
        sub     esp, 12                                 ; 0180 _ 83. EC, 0C
        push    eax                                     ; 0183 _ 50
        call    sheet_alloc                             ; 0184 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0189 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 018C _ A3, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0191 _ A1, 00000244(d)
        sub     esp, 12                                 ; 0196 _ 83. EC, 0C
        push    eax                                     ; 0199 _ 50
        call    sheet_alloc                             ; 019A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019F _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 01A2 _ A3, 0000024C(d)
        mov     edx, dword [xsize]                      ; 01A7 _ 8B. 15, 00000118(d)
        mov     eax, dword [ysize]                      ; 01AD _ A1, 0000011C(d)
        imul    edx, eax                                ; 01B2 _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B5 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01BA _ 83. EC, 08
        push    edx                                     ; 01BD _ 52
        push    eax                                     ; 01BE _ 50
        call    memman_alloc_4k                         ; 01BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C4 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C7 _ A3, 00000120(d)
        mov     ebx, dword [ysize]                      ; 01CC _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [xsize]                      ; 01D2 _ 8B. 0D, 00000118(d)
        mov     edx, dword [buf_back]                   ; 01D8 _ 8B. 15, 00000120(d)
        mov     eax, dword [sht_back]                   ; 01DE _ A1, 00000248(d)
        sub     esp, 12                                 ; 01E3 _ 83. EC, 0C
        push    99                                      ; 01E6 _ 6A, 63
        push    ebx                                     ; 01E8 _ 53
        push    ecx                                     ; 01E9 _ 51
        push    edx                                     ; 01EA _ 52
        push    eax                                     ; 01EB _ 50
        call    sheet_setbuf                            ; 01EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01F1 _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01F4 _ A1, 0000024C(d)
        sub     esp, 12                                 ; 01F9 _ 83. EC, 0C
        push    99                                      ; 01FC _ 6A, 63
        push    16                                      ; 01FE _ 6A, 10
        push    16                                      ; 0200 _ 6A, 10
        push    buf_mouse                               ; 0202 _ 68, 00000140(d)
        push    eax                                     ; 0207 _ 50
        call    sheet_setbuf                            ; 0208 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 020D _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0210 _ 8B. 0D, 0000011C(d)
        mov     edx, dword [xsize]                      ; 0216 _ 8B. 15, 00000118(d)
        mov     eax, dword [buf_back]                   ; 021C _ A1, 00000120(d)
        sub     esp, 4                                  ; 0221 _ 83. EC, 04
        push    ecx                                     ; 0224 _ 51
        push    edx                                     ; 0225 _ 52
        push    eax                                     ; 0226 _ 50
        call    init_screen8                            ; 0227 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 022C _ 83. C4, 10
        sub     esp, 8                                  ; 022F _ 83. EC, 08
        push    99                                      ; 0232 _ 6A, 63
        push    buf_mouse                               ; 0234 _ 68, 00000140(d)
        call    init_mouse_cursor                       ; 0239 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023E _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 0241 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0247 _ A1, 00000244(d)
        push    0                                       ; 024C _ 6A, 00
        push    0                                       ; 024E _ 6A, 00
        push    edx                                     ; 0250 _ 52
        push    eax                                     ; 0251 _ 50
        call    sheet_slide                             ; 0252 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0257 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 025A _ A1, 00000118(d)
        sub     eax, 16                                 ; 025F _ 83. E8, 10
        mov     edx, eax                                ; 0262 _ 89. C2
        shr     edx, 31                                 ; 0264 _ C1. EA, 1F
        add     eax, edx                                ; 0267 _ 01. D0
        sar     eax, 1                                  ; 0269 _ D1. F8
        mov     dword [mx], eax                         ; 026B _ A3, 00000110(d)
        mov     eax, dword [ysize]                      ; 0270 _ A1, 0000011C(d)
        sub     eax, 44                                 ; 0275 _ 83. E8, 2C
        mov     edx, eax                                ; 0278 _ 89. C2
        shr     edx, 31                                 ; 027A _ C1. EA, 1F
        add     eax, edx                                ; 027D _ 01. D0
        sar     eax, 1                                  ; 027F _ D1. F8
        mov     dword [my], eax                         ; 0281 _ A3, 00000114(d)
        mov     ebx, dword [my]                         ; 0286 _ 8B. 1D, 00000114(d)
        mov     ecx, dword [mx]                         ; 028C _ 8B. 0D, 00000110(d)
        mov     edx, dword [sht_mouse]                  ; 0292 _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 0298 _ A1, 00000244(d)
        push    ebx                                     ; 029D _ 53
        push    ecx                                     ; 029E _ 51
        push    edx                                     ; 029F _ 52
        push    eax                                     ; 02A0 _ 50
        call    sheet_slide                             ; 02A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A6 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A9 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02B0 _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B7 _ A1, 00000244(d)
        sub     esp, 8                                  ; 02BC _ 83. EC, 08
        push    ?_167                                   ; 02BF _ 68, 00000000(d)
        push    eax                                     ; 02C4 _ 50
        call    message_box                             ; 02C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02CA _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02CD _ A3, 00000240(d)
        mov     edx, dword [sht_back]                   ; 02D2 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 02D8 _ A1, 00000244(d)
        sub     esp, 4                                  ; 02DD _ 83. EC, 04
        push    0                                       ; 02E0 _ 6A, 00
        push    edx                                     ; 02E2 _ 52
        push    eax                                     ; 02E3 _ 50
        call    sheet_updown                            ; 02E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E9 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02EC _ 8B. 15, 0000024C(d)
        mov     eax, dword [shtctl]                     ; 02F2 _ A1, 00000244(d)
        sub     esp, 4                                  ; 02F7 _ 83. EC, 04
        push    100                                     ; 02FA _ 6A, 64
        push    edx                                     ; 02FC _ 52
        push    eax                                     ; 02FD _ 50
        call    sheet_updown                            ; 02FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0303 _ 83. C4, 10
        call    io_sti                                  ; 0306 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 030B _ 83. EC, 0C
        push    mdec                                    ; 030E _ 68, 000000E0(d)
        call    enable_mouse                            ; 0313 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0318 _ 83. C4, 10
        call    get_code32_addr                         ; 031B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0320 _ 89. 45, D0
        call    get_addr_gdt                            ; 0323 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0328 _ 89. 45, CC
        mov     dword [?_191], 0                        ; 032B _ C7. 05, 000002C0(d), 00000000
        mov     dword [?_192], 1073741824               ; 0335 _ C7. 05, 000002C4(d), 40000000
        mov     dword [?_209], 0                        ; 033F _ C7. 05, 00000340(d), 00000000
        mov     dword [?_210], 1073741824               ; 0349 _ C7. 05, 00000344(d), 40000000
        mov     edx, tss_a.1819                         ; 0353 _ BA, 00000260(d)
        mov     eax, dword [ebp-34H]                    ; 0358 _ 8B. 45, CC
        add     eax, 56                                 ; 035B _ 83. C0, 38
        push    137                                     ; 035E _ 68, 00000089
        push    edx                                     ; 0363 _ 52
        push    103                                     ; 0364 _ 6A, 67
        push    eax                                     ; 0366 _ 50
        call    set_segmdesc                            ; 0367 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 036C _ 83. C4, 10
        mov     edx, tss_a.1819                         ; 036F _ BA, 00000260(d)
        mov     eax, dword [ebp-34H]                    ; 0374 _ 8B. 45, CC
        add     eax, 64                                 ; 0377 _ 83. C0, 40
        push    137                                     ; 037A _ 68, 00000089
        push    edx                                     ; 037F _ 52
        push    103                                     ; 0380 _ 6A, 67
        push    eax                                     ; 0382 _ 50
        call    set_segmdesc                            ; 0383 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0388 _ 83. C4, 10
        mov     edx, tss_b.1820                         ; 038B _ BA, 000002E0(d)
        mov     eax, dword [ebp-34H]                    ; 0390 _ 8B. 45, CC
        add     eax, 72                                 ; 0393 _ 83. C0, 48
        push    137                                     ; 0396 _ 68, 00000089
        push    edx                                     ; 039B _ 52
        push    103                                     ; 039C _ 6A, 67
        push    eax                                     ; 039E _ 50
        call    set_segmdesc                            ; 039F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A4 _ 83. C4, 10
        mov     edx, task_b_main                        ; 03A7 _ BA, 00000000(d)
        mov     eax, dword [ebp-34H]                    ; 03AC _ 8B. 45, CC
        add     eax, 48                                 ; 03AF _ 83. C0, 30
        push    16538                                   ; 03B2 _ 68, 0000409A
        push    edx                                     ; 03B7 _ 52
        push    65535                                   ; 03B8 _ 68, 0000FFFF
        push    eax                                     ; 03BD _ 50
        call    set_segmdesc                            ; 03BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C3 _ 83. C4, 10
        sub     esp, 12                                 ; 03C6 _ 83. EC, 0C
        push    56                                      ; 03C9 _ 6A, 38
        call    load_tr                                 ; 03CB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D0 _ 83. C4, 10
        call    taskswitch8                             ; 03D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_183]                      ; 03D8 _ A1, 00000284(d)
        sub     esp, 12                                 ; 03DD _ 83. EC, 0C
        push    eax                                     ; 03E0 _ 50
        call    intToHexStr                             ; 03E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E6 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 03E9 _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 03EC _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 03F2 _ A1, 00000244(d)
        sub     esp, 8                                  ; 03F7 _ 83. EC, 08
        push    dword [ebp-38H]                         ; 03FA _ FF. 75, C8
        push    7                                       ; 03FD _ 6A, 07
        push    0                                       ; 03FF _ 6A, 00
        push    0                                       ; 0401 _ 6A, 00
        push    edx                                     ; 0403 _ 52
        push    eax                                     ; 0404 _ 50
        call    showString                              ; 0405 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 040A _ 83. C4, 20
        mov     eax, dword [?_184]                      ; 040D _ A1, 00000298(d)
        sub     esp, 12                                 ; 0412 _ 83. EC, 0C
        push    eax                                     ; 0415 _ 50
        call    intToHexStr                             ; 0416 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 041B _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 041E _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 0421 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0427 _ A1, 00000244(d)
        sub     esp, 8                                  ; 042C _ 83. EC, 08
        push    dword [ebp-38H]                         ; 042F _ FF. 75, C8
        push    7                                       ; 0432 _ 6A, 07
        push    16                                      ; 0434 _ 6A, 10
        push    0                                       ; 0436 _ 6A, 00
        push    edx                                     ; 0438 _ 52
        push    eax                                     ; 0439 _ 50
        call    showString                              ; 043A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 043F _ 83. C4, 20
        mov     eax, dword [?_185]                      ; 0442 _ A1, 000002A8(d)
        test    eax, eax                                ; 0447 _ 85. C0
        jns     ?_001                                   ; 0449 _ 79, 03
        add     eax, 7                                  ; 044B _ 83. C0, 07
?_001:  sar     eax, 3                                  ; 044E _ C1. F8, 03
        sub     esp, 12                                 ; 0451 _ 83. EC, 0C
        push    eax                                     ; 0454 _ 50
        call    intToHexStr                             ; 0455 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 045A _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 045D _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 0460 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0466 _ A1, 00000244(d)
        sub     esp, 8                                  ; 046B _ 83. EC, 08
        push    dword [ebp-38H]                         ; 046E _ FF. 75, C8
        push    7                                       ; 0471 _ 6A, 07
        push    32                                      ; 0473 _ 6A, 20
        push    0                                       ; 0475 _ 6A, 00
        push    edx                                     ; 0477 _ 52
        push    eax                                     ; 0478 _ 50
        call    showString                              ; 0479 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 047E _ 83. C4, 20
        mov     eax, dword [?_186]                      ; 0481 _ A1, 000002AC(d)
        test    eax, eax                                ; 0486 _ 85. C0
        jns     ?_002                                   ; 0488 _ 79, 03
        add     eax, 7                                  ; 048A _ 83. C0, 07
?_002:  sar     eax, 3                                  ; 048D _ C1. F8, 03
        sub     esp, 12                                 ; 0490 _ 83. EC, 0C
        push    eax                                     ; 0493 _ 50
        call    intToHexStr                             ; 0494 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0499 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 049C _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 049F _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 04A5 _ A1, 00000244(d)
        sub     esp, 8                                  ; 04AA _ 83. EC, 08
        push    dword [ebp-38H]                         ; 04AD _ FF. 75, C8
        push    7                                       ; 04B0 _ 6A, 07
        push    48                                      ; 04B2 _ 6A, 30
        push    0                                       ; 04B4 _ 6A, 00
        push    edx                                     ; 04B6 _ 52
        push    eax                                     ; 04B7 _ 50
        call    showString                              ; 04B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04BD _ 83. C4, 20
        mov     eax, dword [?_187]                      ; 04C0 _ A1, 000002B0(d)
        test    eax, eax                                ; 04C5 _ 85. C0
        jns     ?_003                                   ; 04C7 _ 79, 03
        add     eax, 7                                  ; 04C9 _ 83. C0, 07
?_003:  sar     eax, 3                                  ; 04CC _ C1. F8, 03
        sub     esp, 12                                 ; 04CF _ 83. EC, 0C
        push    eax                                     ; 04D2 _ 50
        call    intToHexStr                             ; 04D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04D8 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 04DB _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 04DE _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 04E4 _ A1, 00000244(d)
        sub     esp, 8                                  ; 04E9 _ 83. EC, 08
        push    dword [ebp-38H]                         ; 04EC _ FF. 75, C8
        push    7                                       ; 04EF _ 6A, 07
        push    64                                      ; 04F1 _ 6A, 40
        push    0                                       ; 04F3 _ 6A, 00
        push    edx                                     ; 04F5 _ 52
        push    eax                                     ; 04F6 _ 50
        call    showString                              ; 04F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04FC _ 83. C4, 20
        mov     eax, dword [?_188]                      ; 04FF _ A1, 000002B4(d)
        test    eax, eax                                ; 0504 _ 85. C0
        jns     ?_004                                   ; 0506 _ 79, 03
        add     eax, 7                                  ; 0508 _ 83. C0, 07
?_004:  sar     eax, 3                                  ; 050B _ C1. F8, 03
        sub     esp, 12                                 ; 050E _ 83. EC, 0C
        push    eax                                     ; 0511 _ 50
        call    intToHexStr                             ; 0512 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0517 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 051A _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 051D _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0523 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0528 _ 83. EC, 08
        push    dword [ebp-38H]                         ; 052B _ FF. 75, C8
        push    7                                       ; 052E _ 6A, 07
        push    80                                      ; 0530 _ 6A, 50
        push    0                                       ; 0532 _ 6A, 00
        push    edx                                     ; 0534 _ 52
        push    eax                                     ; 0535 _ 50
        call    showString                              ; 0536 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 053B _ 83. C4, 20
        mov     eax, dword [?_190]                      ; 053E _ A1, 000002BC(d)
        test    eax, eax                                ; 0543 _ 85. C0
        jns     ?_005                                   ; 0545 _ 79, 03
        add     eax, 7                                  ; 0547 _ 83. C0, 07
?_005:  sar     eax, 3                                  ; 054A _ C1. F8, 03
        sub     esp, 12                                 ; 054D _ 83. EC, 0C
        push    eax                                     ; 0550 _ 50
        call    intToHexStr                             ; 0551 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0556 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 0559 _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 055C _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0562 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0567 _ 83. EC, 08
        push    dword [ebp-38H]                         ; 056A _ FF. 75, C8
        push    7                                       ; 056D _ 6A, 07
        push    96                                      ; 056F _ 6A, 60
        push    0                                       ; 0571 _ 6A, 00
        push    edx                                     ; 0573 _ 52
        push    eax                                     ; 0574 _ 50
        call    showString                              ; 0575 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 057A _ 83. C4, 20
        mov     eax, dword [?_189]                      ; 057D _ A1, 000002B8(d)
        test    eax, eax                                ; 0582 _ 85. C0
        jns     ?_006                                   ; 0584 _ 79, 03
        add     eax, 7                                  ; 0586 _ 83. C0, 07
?_006:  sar     eax, 3                                  ; 0589 _ C1. F8, 03
        sub     esp, 12                                 ; 058C _ 83. EC, 0C
        push    eax                                     ; 058F _ 50
        call    intToHexStr                             ; 0590 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0595 _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 0598 _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 059B _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 05A1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 05A6 _ 83. EC, 08
        push    dword [ebp-38H]                         ; 05A9 _ FF. 75, C8
        push    7                                       ; 05AC _ 6A, 07
        push    112                                     ; 05AE _ 6A, 70
        push    0                                       ; 05B0 _ 6A, 00
        push    edx                                     ; 05B2 _ 52
        push    eax                                     ; 05B3 _ 50
        call    showString                              ; 05B4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B9 _ 83. C4, 20
        mov     eax, dword [?_182]                      ; 05BC _ A1, 0000027C(d)
        sub     esp, 12                                 ; 05C1 _ 83. EC, 0C
        push    eax                                     ; 05C4 _ 50
        call    intToHexStr                             ; 05C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05CA _ 83. C4, 10
        mov     dword [ebp-38H], eax                    ; 05CD _ 89. 45, C8
        mov     edx, dword [sht_back]                   ; 05D0 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 05D6 _ A1, 00000244(d)
        sub     esp, 8                                  ; 05DB _ 83. EC, 08
        push    dword [ebp-38H]                         ; 05DE _ FF. 75, C8
        push    7                                       ; 05E1 _ 6A, 07
        push    128                                     ; 05E3 _ 68, 00000080
        push    0                                       ; 05E8 _ 6A, 00
        push    edx                                     ; 05EA _ 52
        push    eax                                     ; 05EB _ 50
        call    showString                              ; 05EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F1 _ 83. C4, 20
        mov     eax, dword [memman]                     ; 05F4 _ A1, 00000000(d)
        sub     esp, 8                                  ; 05F9 _ 83. EC, 08
        push    65536                                   ; 05FC _ 68, 00010000
        push    eax                                     ; 0601 _ 50
        call    memman_alloc_4k                         ; 0602 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0607 _ 83. C4, 10
        add     eax, 65536                              ; 060A _ 05, 00010000
        mov     dword [ebp-3CH], eax                    ; 060F _ 89. 45, C4
        mov     eax, dword [ebp-30H]                    ; 0612 _ 8B. 45, D0
        neg     eax                                     ; 0615 _ F7. D8
        add     eax, task_b_main                        ; 0617 _ 05, 00000000(d)
        mov     dword [?_193], eax                      ; 061C _ A3, 00000300(d)
        mov     dword [?_194], 514                      ; 0621 _ C7. 05, 00000304(d), 00000202
        mov     dword [?_195], 0                        ; 062B _ C7. 05, 00000308(d), 00000000
        mov     dword [?_196], 0                        ; 0635 _ C7. 05, 0000030C(d), 00000000
        mov     dword [?_197], 0                        ; 063F _ C7. 05, 00000310(d), 00000000
        mov     dword [?_198], 0                        ; 0649 _ C7. 05, 00000314(d), 00000000
        mov     dword [?_199], 1024                     ; 0653 _ C7. 05, 00000318(d), 00000400
        mov     dword [?_200], 0                        ; 065D _ C7. 05, 0000031C(d), 00000000
        mov     dword [?_201], 0                        ; 0667 _ C7. 05, 00000320(d), 00000000
        mov     dword [?_202], 0                        ; 0671 _ C7. 05, 00000324(d), 00000000
        mov     eax, dword [?_185]                      ; 067B _ A1, 000002A8(d)
        mov     dword [?_203], eax                      ; 0680 _ A3, 00000328(d)
        mov     eax, dword [?_186]                      ; 0685 _ A1, 000002AC(d)
        mov     dword [?_204], eax                      ; 068A _ A3, 0000032C(d)
        mov     eax, dword [?_187]                      ; 068F _ A1, 000002B0(d)
        mov     dword [?_205], eax                      ; 0694 _ A3, 00000330(d)
        mov     eax, dword [?_188]                      ; 0699 _ A1, 000002B4(d)
        mov     dword [?_206], eax                      ; 069E _ A3, 00000334(d)
        mov     eax, dword [?_189]                      ; 06A3 _ A1, 000002B8(d)
        mov     dword [?_207], eax                      ; 06A8 _ A3, 00000338(d)
        mov     eax, dword [?_190]                      ; 06AD _ A1, 000002BC(d)
        mov     dword [?_208], eax                      ; 06B2 _ A3, 0000033C(d)
        mov     dword [ebp-40H], 0                      ; 06B7 _ C7. 45, C0, 00000000
        mov     dword [ebp-14H], 0                      ; 06BE _ C7. 45, EC, 00000000
        mov     dword [ebp-44H], 0                      ; 06C5 _ C7. 45, BC, 00000000
?_007:  call    io_cli                                  ; 06CC _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06D1 _ 83. EC, 0C
        push    keyinfo                                 ; 06D4 _ 68, 00000008(d)
        call    fifo8_status                            ; 06D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06DE _ 83. C4, 10
        mov     ebx, eax                                ; 06E1 _ 89. C3
        sub     esp, 12                                 ; 06E3 _ 83. EC, 0C
        push    mouseinfo                               ; 06E6 _ 68, 00000020(d)
        call    fifo8_status                            ; 06EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06F0 _ 83. C4, 10
        add     ebx, eax                                ; 06F3 _ 01. C3
        sub     esp, 12                                 ; 06F5 _ 83. EC, 0C
        push    timerinfo                               ; 06F8 _ 68, 000000F0(d)
        call    fifo8_status                            ; 06FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0702 _ 83. C4, 10
        add     eax, ebx                                ; 0705 _ 01. D8
        test    eax, eax                                ; 0707 _ 85. C0
        jnz     ?_008                                   ; 0709 _ 75, 07
        call    io_sti                                  ; 070B _ E8, FFFFFFFC(rel)
        jmp     ?_007                                   ; 0710 _ EB, BA

?_008:  sub     esp, 12                                 ; 0712 _ 83. EC, 0C
        push    keyinfo                                 ; 0715 _ 68, 00000008(d)
        call    fifo8_status                            ; 071A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 071F _ 83. C4, 10
        test    eax, eax                                ; 0722 _ 85. C0
        je      ?_010                                   ; 0724 _ 0F 84, 0000017F
        call    io_sti                                  ; 072A _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 072F _ 83. EC, 0C
        push    keyinfo                                 ; 0732 _ 68, 00000008(d)
        call    fifo8_get                               ; 0737 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 073C _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 073F _ 89. 45, C0
        cmp     dword [ebp-40H], 28                     ; 0742 _ 83. 7D, C0, 1C
        jnz     ?_009                                   ; 0746 _ 75, 5C
        mov     ebx, dword [xsize]                      ; 0748 _ 8B. 1D, 00000118(d)
        mov     ecx, dword [buf_back]                   ; 074E _ 8B. 0D, 00000120(d)
        mov     edx, dword [ebp-14H]                    ; 0754 _ 8B. 55, EC
        mov     eax, edx                                ; 0757 _ 89. D0
        shl     eax, 2                                  ; 0759 _ C1. E0, 02
        add     eax, edx                                ; 075C _ 01. D0
        shl     eax, 2                                  ; 075E _ C1. E0, 02
        mov     edx, eax                                ; 0761 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 0763 _ 8B. 45, D4
        lea     esi, [edx+eax]                          ; 0766 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0769 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 076F _ A1, 00000244(d)
        sub     esp, 4                                  ; 0774 _ 83. EC, 04
        push    7                                       ; 0777 _ 6A, 07
        push    ebx                                     ; 0779 _ 53
        push    dword [ebp-14H]                         ; 077A _ FF. 75, EC
        push    ecx                                     ; 077D _ 51
        push    esi                                     ; 077E _ 56
        push    edx                                     ; 077F _ 52
        push    eax                                     ; 0780 _ 50
        call    showMemoryInfo                          ; 0781 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0786 _ 83. C4, 20
        inc     dword [ebp-14H]                         ; 0789 _ FF. 45, EC
        mov     eax, dword [ebp-14H]                    ; 078C _ 8B. 45, EC
        cmp     eax, dword [ebp-28H]                    ; 078F _ 3B. 45, D8
        jle     ?_007                                   ; 0792 _ 0F 8E, FFFFFF34
        mov     dword [ebp-14H], 0                      ; 0798 _ C7. 45, EC, 00000000
        jmp     ?_007                                   ; 079F _ E9, FFFFFF28

?_009:  mov     eax, dword [ebp-40H]                    ; 07A4 _ 8B. 45, C0
        add     eax, keytable                           ; 07A7 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 07AC _ 8A. 00
        test    al, al                                  ; 07AE _ 84. C0
        je      ?_007                                   ; 07B0 _ 0F 84, FFFFFF16
        cmp     dword [ebp-0CH], 143                    ; 07B6 _ 81. 7D, F4, 0000008F
        jg      ?_007                                   ; 07BD _ 0F 8F, FFFFFF09
        mov     eax, dword [ebp-0CH]                    ; 07C3 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 07C6 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 07C9 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 07CE _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 07D1 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 07D6 _ 8B. 00
        sub     esp, 4                                  ; 07D8 _ 83. EC, 04
        push    43                                      ; 07DB _ 6A, 2B
        push    ecx                                     ; 07DD _ 51
        push    28                                      ; 07DE _ 6A, 1C
        push    dword [ebp-0CH]                         ; 07E0 _ FF. 75, F4
        push    7                                       ; 07E3 _ 6A, 07
        push    edx                                     ; 07E5 _ 52
        push    eax                                     ; 07E6 _ 50
        call    boxfill8                                ; 07E7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07EC _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 07EF _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 07F2 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 07F5 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 07FB _ A1, 00000244(d)
        sub     esp, 8                                  ; 0800 _ 83. EC, 08
        push    44                                      ; 0803 _ 6A, 2C
        push    ecx                                     ; 0805 _ 51
        push    28                                      ; 0806 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0808 _ FF. 75, F4
        push    edx                                     ; 080B _ 52
        push    eax                                     ; 080C _ 50
        call    sheet_refresh                           ; 080D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0812 _ 83. C4, 20
        mov     eax, dword [ebp-40H]                    ; 0815 _ 8B. 45, C0
        add     eax, keytable                           ; 0818 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 081D _ 8A. 00
        mov     byte [ebp-4AH], al                      ; 081F _ 88. 45, B6
        mov     byte [ebp-49H], 0                       ; 0822 _ C6. 45, B7, 00
        mov     edx, dword [shtMsgBox]                  ; 0826 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 082C _ A1, 00000244(d)
        sub     esp, 8                                  ; 0831 _ 83. EC, 08
        lea     ecx, [ebp-4AH]                          ; 0834 _ 8D. 4D, B6
        push    ecx                                     ; 0837 _ 51
        push    0                                       ; 0838 _ 6A, 00
        push    28                                      ; 083A _ 6A, 1C
        push    dword [ebp-0CH]                         ; 083C _ FF. 75, F4
        push    edx                                     ; 083F _ 52
        push    eax                                     ; 0840 _ 50
        call    showString                              ; 0841 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0846 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0849 _ 83. 45, F4, 08
        mov     eax, dword [ebp-0CH]                    ; 084D _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0850 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0853 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0856 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0859 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 085E _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0861 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0866 _ 8B. 00
        sub     esp, 4                                  ; 0868 _ 83. EC, 04
        push    43                                      ; 086B _ 6A, 2B
        push    ebx                                     ; 086D _ 53
        push    28                                      ; 086E _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0870 _ FF. 75, F4
        push    ecx                                     ; 0873 _ 51
        push    edx                                     ; 0874 _ 52
        push    eax                                     ; 0875 _ 50
        call    boxfill8                                ; 0876 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 087B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 087E _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0881 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0884 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 088A _ A1, 00000244(d)
        sub     esp, 8                                  ; 088F _ 83. EC, 08
        push    44                                      ; 0892 _ 6A, 2C
        push    ecx                                     ; 0894 _ 51
        push    28                                      ; 0895 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0897 _ FF. 75, F4
        push    edx                                     ; 089A _ 52
        push    eax                                     ; 089B _ 50
        call    sheet_refresh                           ; 089C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08A1 _ 83. C4, 20
        jmp     ?_007                                   ; 08A4 _ E9, FFFFFE23

?_010:  sub     esp, 12                                 ; 08A9 _ 83. EC, 0C
        push    mouseinfo                               ; 08AC _ 68, 00000020(d)
        call    fifo8_status                            ; 08B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B6 _ 83. C4, 10
        test    eax, eax                                ; 08B9 _ 85. C0
        jz      ?_011                                   ; 08BB _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 08BD _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 08C3 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 08C9 _ A1, 00000244(d)
        sub     esp, 4                                  ; 08CE _ 83. EC, 04
        push    ecx                                     ; 08D1 _ 51
        push    edx                                     ; 08D2 _ 52
        push    eax                                     ; 08D3 _ 50
        call    show_mouse_info                         ; 08D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D9 _ 83. C4, 10
        jmp     ?_007                                   ; 08DC _ E9, FFFFFDEB

?_011:  sub     esp, 12                                 ; 08E1 _ 83. EC, 0C
        push    timerinfo                               ; 08E4 _ 68, 000000F0(d)
        call    fifo8_status                            ; 08E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08EE _ 83. C4, 10
        test    eax, eax                                ; 08F1 _ 85. C0
        je      ?_007                                   ; 08F3 _ 0F 84, FFFFFDD3
        call    io_sti                                  ; 08F9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 08FE _ 83. EC, 0C
        push    timerinfo                               ; 0901 _ 68, 000000F0(d)
        call    fifo8_get                               ; 0906 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 090B _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 090E _ 89. 45, B8
        cmp     dword [ebp-48H], 10                     ; 0911 _ 83. 7D, B8, 0A
        jnz     ?_012                                   ; 0915 _ 75, 30
        mov     edx, dword [sht_back]                   ; 0917 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 091D _ A1, 00000244(d)
        sub     esp, 8                                  ; 0922 _ 83. EC, 08
        push    ?_168                                   ; 0925 _ 68, 00000008(d)
        push    7                                       ; 092A _ 6A, 07
        push    176                                     ; 092C _ 68, 000000B0
        push    0                                       ; 0931 _ 6A, 00
        push    edx                                     ; 0933 _ 52
        push    eax                                     ; 0934 _ 50
        call    showString                              ; 0935 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 093A _ 83. C4, 20
        call    taskswitch9                             ; 093D _ E8, FFFFFFFC(rel)
        jmp     ?_007                                   ; 0942 _ E9, FFFFFD85

?_012:  cmp     dword [ebp-48H], 2                      ; 0947 _ 83. 7D, B8, 02
        je      ?_007                                   ; 094B _ 0F 84, FFFFFD7B
        cmp     dword [ebp-48H], 0                      ; 0951 _ 83. 7D, B8, 00
        jz      ?_013                                   ; 0955 _ 74, 1E
        sub     esp, 4                                  ; 0957 _ 83. EC, 04
        push    0                                       ; 095A _ 6A, 00
        push    timerinfo                               ; 095C _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 0961 _ FF. 75, DC
        call    timer_init                              ; 0964 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0969 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 096C _ C7. 45, F0, 00000000
        jmp     ?_014                                   ; 0973 _ EB, 1C

?_013:  sub     esp, 4                                  ; 0975 _ 83. EC, 04
        push    1                                       ; 0978 _ 6A, 01
        push    timerinfo                               ; 097A _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 097F _ FF. 75, DC
        call    timer_init                              ; 0982 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0987 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 098A _ C7. 45, F0, 00000007
?_014:  sub     esp, 8                                  ; 0991 _ 83. EC, 08
        push    50                                      ; 0994 _ 6A, 32
        push    dword [ebp-24H]                         ; 0996 _ FF. 75, DC
        call    timer_settime                           ; 0999 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 099E _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 09A1 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 09A4 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 09A7 _ 8B. 45, F0
        movzx   ecx, al                                 ; 09AA _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 09AD _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 09B2 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 09B5 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 09BA _ 8B. 00
        sub     esp, 4                                  ; 09BC _ 83. EC, 04
        push    43                                      ; 09BF _ 6A, 2B
        push    ebx                                     ; 09C1 _ 53
        push    28                                      ; 09C2 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 09C4 _ FF. 75, F4
        push    ecx                                     ; 09C7 _ 51
        push    edx                                     ; 09C8 _ 52
        push    eax                                     ; 09C9 _ 50
        call    boxfill8                                ; 09CA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09CF _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 09D2 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 09D5 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 09D8 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 09DE _ A1, 00000244(d)
        sub     esp, 8                                  ; 09E3 _ 83. EC, 08
        push    44                                      ; 09E6 _ 6A, 2C
        push    ecx                                     ; 09E8 _ 51
        push    28                                      ; 09E9 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 09EB _ FF. 75, F4
        push    edx                                     ; 09EE _ 52
        push    eax                                     ; 09EF _ 50
        call    sheet_refresh                           ; 09F0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09F5 _ 83. C4, 20
        jmp     ?_007                                   ; 09F8 _ E9, FFFFFCCF
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 09FD _ 55
        mov     ebp, esp                                ; 09FE _ 89. E5
        sub     esp, 56                                 ; 0A00 _ 83. EC, 38
        mov     edx, dword [sht_back]                   ; 0A03 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0A09 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A0E _ 83. EC, 08
        push    ?_169                                   ; 0A11 _ 68, 00000019(d)
        push    7                                       ; 0A16 _ 6A, 07
        push    144                                     ; 0A18 _ 68, 00000090
        push    0                                       ; 0A1D _ 6A, 00
        push    edx                                     ; 0A1F _ 52
        push    eax                                     ; 0A20 _ 50
        call    showString                              ; 0A21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A26 _ 83. C4, 20
        mov     dword [ebp-0CH], 0                      ; 0A29 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0A30 _ C7. 45, F0, 00000000
        sub     esp, 4                                  ; 0A37 _ 83. EC, 04
        lea     eax, [ebp-30H]                          ; 0A3A _ 8D. 45, D0
        push    eax                                     ; 0A3D _ 50
        push    8                                       ; 0A3E _ 6A, 08
        lea     eax, [ebp-28H]                          ; 0A40 _ 8D. 45, D8
        push    eax                                     ; 0A43 _ 50
        call    fifo8_init                              ; 0A44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A49 _ 83. C4, 10
        call    timer_alloc                             ; 0A4C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0A51 _ 89. 45, F4
        sub     esp, 4                                  ; 0A54 _ 83. EC, 04
        push    123                                     ; 0A57 _ 6A, 7B
        lea     eax, [ebp-28H]                          ; 0A59 _ 8D. 45, D8
        push    eax                                     ; 0A5C _ 50
        push    dword [ebp-0CH]                         ; 0A5D _ FF. 75, F4
        call    timer_init                              ; 0A60 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A65 _ 83. C4, 10
        sub     esp, 8                                  ; 0A68 _ 83. EC, 08
        push    500                                     ; 0A6B _ 68, 000001F4
        push    dword [ebp-0CH]                         ; 0A70 _ FF. 75, F4
        call    timer_settime                           ; 0A73 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A78 _ 83. C4, 10
?_015:  call    io_cli                                  ; 0A7B _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0A80 _ 83. EC, 0C
        lea     eax, [ebp-28H]                          ; 0A83 _ 8D. 45, D8
        push    eax                                     ; 0A86 _ 50
        call    fifo8_status                            ; 0A87 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A8C _ 83. C4, 10
        test    eax, eax                                ; 0A8F _ 85. C0
        jnz     ?_016                                   ; 0A91 _ 75, 07
        call    io_sti                                  ; 0A93 _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 0A98 _ EB, E1

?_016:  sub     esp, 12                                 ; 0A9A _ 83. EC, 0C
        lea     eax, [ebp-28H]                          ; 0A9D _ 8D. 45, D8
        push    eax                                     ; 0AA0 _ 50
        call    fifo8_get                               ; 0AA1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AA6 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0AA9 _ 89. 45, F0
        call    io_sti                                  ; 0AAC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-10H], 123                    ; 0AB1 _ 83. 7D, F0, 7B
        jnz     ?_015                                   ; 0AB5 _ 75, C4
        mov     edx, dword [sht_back]                   ; 0AB7 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0ABD _ A1, 00000244(d)
        sub     esp, 8                                  ; 0AC2 _ 83. EC, 08
        push    ?_170                                   ; 0AC5 _ 68, 00000026(d)
        push    7                                       ; 0ACA _ 6A, 07
        push    160                                     ; 0ACC _ 68, 000000A0
        push    0                                       ; 0AD1 _ 6A, 00
        push    edx                                     ; 0AD3 _ 52
        push    eax                                     ; 0AD4 _ 50
        call    showString                              ; 0AD5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ADA _ 83. C4, 20
        call    taskswitch7                             ; 0ADD _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 0AE2 _ EB, 97
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0AE4 _ 55
        mov     ebp, esp                                ; 0AE5 _ 89. E5
        push    ebx                                     ; 0AE7 _ 53
        sub     esp, 4                                  ; 0AE8 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0AEB _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0AEE _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0AF1 _ 8B. 45, 0C
        dec     eax                                     ; 0AF4 _ 48
        sub     esp, 4                                  ; 0AF5 _ 83. EC, 04
        push    edx                                     ; 0AF8 _ 52
        push    eax                                     ; 0AF9 _ 50
        push    0                                       ; 0AFA _ 6A, 00
        push    0                                       ; 0AFC _ 6A, 00
        push    14                                      ; 0AFE _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0B00 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B03 _ FF. 75, 08
        call    boxfill8                                ; 0B06 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B0B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B0E _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0B11 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0B14 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B17 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B1A _ 8B. 45, 10
        sub     eax, 28                                 ; 0B1D _ 83. E8, 1C
        sub     esp, 4                                  ; 0B20 _ 83. EC, 04
        push    ecx                                     ; 0B23 _ 51
        push    edx                                     ; 0B24 _ 52
        push    eax                                     ; 0B25 _ 50
        push    0                                       ; 0B26 _ 6A, 00
        push    8                                       ; 0B28 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B2A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B2D _ FF. 75, 08
        call    boxfill8                                ; 0B30 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B35 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B38 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0B3B _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0B3E _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B41 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B44 _ 8B. 45, 10
        sub     eax, 27                                 ; 0B47 _ 83. E8, 1B
        sub     esp, 4                                  ; 0B4A _ 83. EC, 04
        push    ecx                                     ; 0B4D _ 51
        push    edx                                     ; 0B4E _ 52
        push    eax                                     ; 0B4F _ 50
        push    0                                       ; 0B50 _ 6A, 00
        push    7                                       ; 0B52 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B54 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B57 _ FF. 75, 08
        call    boxfill8                                ; 0B5A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B5F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B62 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B65 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B68 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B6B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B6E _ 8B. 45, 10
        sub     eax, 26                                 ; 0B71 _ 83. E8, 1A
        sub     esp, 4                                  ; 0B74 _ 83. EC, 04
        push    ecx                                     ; 0B77 _ 51
        push    edx                                     ; 0B78 _ 52
        push    eax                                     ; 0B79 _ 50
        push    0                                       ; 0B7A _ 6A, 00
        push    8                                       ; 0B7C _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B7E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B81 _ FF. 75, 08
        call    boxfill8                                ; 0B84 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B89 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B8C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B8F _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B92 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B95 _ 83. E8, 18
        sub     esp, 4                                  ; 0B98 _ 83. EC, 04
        push    edx                                     ; 0B9B _ 52
        push    59                                      ; 0B9C _ 6A, 3B
        push    eax                                     ; 0B9E _ 50
        push    3                                       ; 0B9F _ 6A, 03
        push    7                                       ; 0BA1 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0BA3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BA6 _ FF. 75, 08
        call    boxfill8                                ; 0BA9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BAE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BB1 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BB4 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BB7 _ 8B. 45, 10
        sub     eax, 24                                 ; 0BBA _ 83. E8, 18
        sub     esp, 4                                  ; 0BBD _ 83. EC, 04
        push    edx                                     ; 0BC0 _ 52
        push    2                                       ; 0BC1 _ 6A, 02
        push    eax                                     ; 0BC3 _ 50
        push    2                                       ; 0BC4 _ 6A, 02
        push    7                                       ; 0BC6 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0BC8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BCB _ FF. 75, 08
        call    boxfill8                                ; 0BCE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BD3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BD6 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BD9 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BDC _ 8B. 45, 10
        sub     eax, 4                                  ; 0BDF _ 83. E8, 04
        sub     esp, 4                                  ; 0BE2 _ 83. EC, 04
        push    edx                                     ; 0BE5 _ 52
        push    59                                      ; 0BE6 _ 6A, 3B
        push    eax                                     ; 0BE8 _ 50
        push    3                                       ; 0BE9 _ 6A, 03
        push    15                                      ; 0BEB _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BF0 _ FF. 75, 08
        call    boxfill8                                ; 0BF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BF8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BFB _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0BFE _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0C01 _ 8B. 45, 10
        sub     eax, 23                                 ; 0C04 _ 83. E8, 17
        sub     esp, 4                                  ; 0C07 _ 83. EC, 04
        push    edx                                     ; 0C0A _ 52
        push    59                                      ; 0C0B _ 6A, 3B
        push    eax                                     ; 0C0D _ 50
        push    59                                      ; 0C0E _ 6A, 3B
        push    15                                      ; 0C10 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C12 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C15 _ FF. 75, 08
        call    boxfill8                                ; 0C18 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C1D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C20 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C23 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C26 _ 8B. 45, 10
        sub     eax, 3                                  ; 0C29 _ 83. E8, 03
        sub     esp, 4                                  ; 0C2C _ 83. EC, 04
        push    edx                                     ; 0C2F _ 52
        push    59                                      ; 0C30 _ 6A, 3B
        push    eax                                     ; 0C32 _ 50
        push    2                                       ; 0C33 _ 6A, 02
        push    0                                       ; 0C35 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C37 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C3A _ FF. 75, 08
        call    boxfill8                                ; 0C3D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C42 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C45 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C48 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C4B _ 8B. 45, 10
        sub     eax, 24                                 ; 0C4E _ 83. E8, 18
        sub     esp, 4                                  ; 0C51 _ 83. EC, 04
        push    edx                                     ; 0C54 _ 52
        push    60                                      ; 0C55 _ 6A, 3C
        push    eax                                     ; 0C57 _ 50
        push    60                                      ; 0C58 _ 6A, 3C
        push    0                                       ; 0C5A _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C5C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C5F _ FF. 75, 08
        call    boxfill8                                ; 0C62 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C67 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C6A _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0C6D _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0C70 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C73 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C76 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C79 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C7C _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C7F _ 83. E8, 2F
        sub     esp, 4                                  ; 0C82 _ 83. EC, 04
        push    ebx                                     ; 0C85 _ 53
        push    ecx                                     ; 0C86 _ 51
        push    edx                                     ; 0C87 _ 52
        push    eax                                     ; 0C88 _ 50
        push    15                                      ; 0C89 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C8B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C8E _ FF. 75, 08
        call    boxfill8                                ; 0C91 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C96 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C99 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0C9C _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0C9F _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0CA2 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0CA5 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0CA8 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0CAB _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CAE _ 83. E8, 2F
        sub     esp, 4                                  ; 0CB1 _ 83. EC, 04
        push    ebx                                     ; 0CB4 _ 53
        push    ecx                                     ; 0CB5 _ 51
        push    edx                                     ; 0CB6 _ 52
        push    eax                                     ; 0CB7 _ 50
        push    15                                      ; 0CB8 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0CBA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CBD _ FF. 75, 08
        call    boxfill8                                ; 0CC0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CC5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CC8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CCB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CCE _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0CD1 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0CD4 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CD7 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0CDA _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CDD _ 83. E8, 2F
        sub     esp, 4                                  ; 0CE0 _ 83. EC, 04
        push    ebx                                     ; 0CE3 _ 53
        push    ecx                                     ; 0CE4 _ 51
        push    edx                                     ; 0CE5 _ 52
        push    eax                                     ; 0CE6 _ 50
        push    7                                       ; 0CE7 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CE9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CEC _ FF. 75, 08
        call    boxfill8                                ; 0CEF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CF4 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CF7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CFA _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CFD _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0D00 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0D03 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0D06 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0D09 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0D0C _ 83. E8, 03
        sub     esp, 4                                  ; 0D0F _ 83. EC, 04
        push    ebx                                     ; 0D12 _ 53
        push    ecx                                     ; 0D13 _ 51
        push    edx                                     ; 0D14 _ 52
        push    eax                                     ; 0D15 _ 50
        push    7                                       ; 0D16 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0D18 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D1B _ FF. 75, 08
        call    boxfill8                                ; 0D1E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D23 _ 83. C4, 20
        nop                                             ; 0D26 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0D27 _ 8B. 5D, FC
        leave                                           ; 0D2A _ C9
        ret                                             ; 0D2B _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D2C _ 55
        mov     ebp, esp                                ; 0D2D _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0D2F _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0D32 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D35 _ A1, 00000110(d)
        add     eax, edx                                ; 0D3A _ 01. D0
        mov     dword [mx], eax                         ; 0D3C _ A3, 00000110(d)
        mov     eax, dword [ebp+10H]                    ; 0D41 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0D44 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D47 _ A1, 00000114(d)
        add     eax, edx                                ; 0D4C _ 01. D0
        mov     dword [my], eax                         ; 0D4E _ A3, 00000114(d)
        mov     eax, dword [mx]                         ; 0D53 _ A1, 00000110(d)
        test    eax, eax                                ; 0D58 _ 85. C0
        jns     ?_017                                   ; 0D5A _ 79, 0A
        mov     dword [mx], 0                           ; 0D5C _ C7. 05, 00000110(d), 00000000
?_017:  mov     eax, dword [my]                         ; 0D66 _ A1, 00000114(d)
        test    eax, eax                                ; 0D6B _ 85. C0
        jns     ?_018                                   ; 0D6D _ 79, 0A
        mov     dword [my], 0                           ; 0D6F _ C7. 05, 00000114(d), 00000000
?_018:  mov     edx, dword [xsize]                      ; 0D79 _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0D7F _ A1, 00000110(d)
        cmp     edx, eax                                ; 0D84 _ 39. C2
        jg      ?_019                                   ; 0D86 _ 7F, 0B
        mov     eax, dword [xsize]                      ; 0D88 _ A1, 00000118(d)
        dec     eax                                     ; 0D8D _ 48
        mov     dword [mx], eax                         ; 0D8E _ A3, 00000110(d)
?_019:  mov     edx, dword [ysize]                      ; 0D93 _ 8B. 15, 0000011C(d)
        mov     eax, dword [my]                         ; 0D99 _ A1, 00000114(d)
        cmp     edx, eax                                ; 0D9E _ 39. C2
        jg      ?_020                                   ; 0DA0 _ 7F, 0B
        mov     eax, dword [ysize]                      ; 0DA2 _ A1, 0000011C(d)
        dec     eax                                     ; 0DA7 _ 48
        mov     dword [my], eax                         ; 0DA8 _ A3, 00000114(d)
?_020:  nop                                             ; 0DAD _ 90
        pop     ebp                                     ; 0DAE _ 5D
        ret                                             ; 0DAF _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0DB0 _ 55
        mov     ebp, esp                                ; 0DB1 _ 89. E5
        sub     esp, 24                                 ; 0DB3 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0DB6 _ A1, 00000120(d)
        mov     dword [ebp-0CH], eax                    ; 0DBB _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0DBE _ C6. 45, F3, 00
        call    io_sti                                  ; 0DC2 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0DC7 _ 83. EC, 0C
        push    mouseinfo                               ; 0DCA _ 68, 00000020(d)
        call    fifo8_get                               ; 0DCF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DD4 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0DD7 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0DDA _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0DDE _ 83. EC, 08
        push    eax                                     ; 0DE1 _ 50
        push    mdec                                    ; 0DE2 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0DE7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DEC _ 83. C4, 10
        test    eax, eax                                ; 0DEF _ 85. C0
        jz      ?_021                                   ; 0DF1 _ 74, 60
        sub     esp, 4                                  ; 0DF3 _ 83. EC, 04
        push    mdec                                    ; 0DF6 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0DFB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DFE _ FF. 75, 08
        call    computeMousePosition                    ; 0E01 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E06 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0E09 _ 8B. 15, 00000114(d)
        mov     eax, dword [mx]                         ; 0E0F _ A1, 00000110(d)
        push    edx                                     ; 0E14 _ 52
        push    eax                                     ; 0E15 _ 50
        push    dword [ebp+10H]                         ; 0E16 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0E19 _ FF. 75, 08
        call    sheet_slide                             ; 0E1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E21 _ 83. C4, 10
        mov     eax, dword [?_181]                      ; 0E24 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0E29 _ 83. E0, 01
        test    eax, eax                                ; 0E2C _ 85. C0
        jz      ?_021                                   ; 0E2E _ 74, 23
        mov     eax, dword [my]                         ; 0E30 _ A1, 00000114(d)
        lea     ecx, [eax-8H]                           ; 0E35 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0E38 _ A1, 00000110(d)
        lea     edx, [eax-50H]                          ; 0E3D _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0E40 _ A1, 00000240(d)
        push    ecx                                     ; 0E45 _ 51
        push    edx                                     ; 0E46 _ 52
        push    eax                                     ; 0E47 _ 50
        push    dword [ebp+8H]                          ; 0E48 _ FF. 75, 08
        call    sheet_slide                             ; 0E4B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E50 _ 83. C4, 10
?_021:  nop                                             ; 0E53 _ 90
        leave                                           ; 0E54 _ C9
        ret                                             ; 0E55 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0E56 _ 55
        mov     ebp, esp                                ; 0E57 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E59 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0E5C _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0E62 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0E65 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0E6B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0E6E _ 66: C7. 40, 06, 01E0
        nop                                             ; 0E74 _ 90
        pop     ebp                                     ; 0E75 _ 5D
        ret                                             ; 0E76 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0E77 _ 55
        mov     ebp, esp                                ; 0E78 _ 89. E5
        push    ebx                                     ; 0E7A _ 53
        sub     esp, 36                                 ; 0E7B _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0E7E _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0E81 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0E84 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0E87 _ 89. 45, F4
        jmp     ?_023                                   ; 0E8A _ EB, 3C

?_022:  mov     eax, dword [ebp+1CH]                    ; 0E8C _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E8F _ 8A. 00
        movzx   eax, al                                 ; 0E91 _ 0F B6. C0
        shl     eax, 4                                  ; 0E94 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0E97 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0E9D _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0EA1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0EA4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0EA7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0EAA _ 8B. 00
        sub     esp, 8                                  ; 0EAC _ 83. EC, 08
        push    ebx                                     ; 0EAF _ 53
        push    ecx                                     ; 0EB0 _ 51
        push    dword [ebp+14H]                         ; 0EB1 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0EB4 _ FF. 75, 10
        push    edx                                     ; 0EB7 _ 52
        push    eax                                     ; 0EB8 _ 50
        call    showFont8                               ; 0EB9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EBE _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0EC1 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0EC5 _ FF. 45, 1C
?_023:  mov     eax, dword [ebp+1CH]                    ; 0EC8 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0ECB _ 8A. 00
        test    al, al                                  ; 0ECD _ 84. C0
        jnz     ?_022                                   ; 0ECF _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 0ED1 _ 8B. 45, 14
        add     eax, 16                                 ; 0ED4 _ 83. C0, 10
        sub     esp, 8                                  ; 0ED7 _ 83. EC, 08
        push    eax                                     ; 0EDA _ 50
        push    dword [ebp+10H]                         ; 0EDB _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0EDE _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0EE1 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0EE4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EE7 _ FF. 75, 08
        call    sheet_refresh                           ; 0EEA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EEF _ 83. C4, 20
        nop                                             ; 0EF2 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0EF3 _ 8B. 5D, FC
        leave                                           ; 0EF6 _ C9
        ret                                             ; 0EF7 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0EF8 _ 55
        mov     ebp, esp                                ; 0EF9 _ 89. E5
        sub     esp, 8                                  ; 0EFB _ 83. EC, 08
        sub     esp, 4                                  ; 0EFE _ 83. EC, 04
        push    table_rgb.1883                          ; 0F01 _ 68, 00000080(d)
        push    15                                      ; 0F06 _ 6A, 0F
        push    0                                       ; 0F08 _ 6A, 00
        call    set_palette                             ; 0F0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F0F _ 83. C4, 10
        nop                                             ; 0F12 _ 90
        leave                                           ; 0F13 _ C9
        ret                                             ; 0F14 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0F15 _ 55
        mov     ebp, esp                                ; 0F16 _ 89. E5
        sub     esp, 24                                 ; 0F18 _ 83. EC, 18
        call    io_load_eflags                          ; 0F1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0F20 _ 89. 45, F0
        call    io_cli                                  ; 0F23 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0F28 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0F2B _ FF. 75, 08
        push    968                                     ; 0F2E _ 68, 000003C8
        call    io_out8                                 ; 0F33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F38 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0F3B _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0F3E _ 89. 45, F4
        jmp     ?_025                                   ; 0F41 _ EB, 5F

?_024:  mov     eax, dword [ebp+10H]                    ; 0F43 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0F46 _ 8A. 00
        shr     al, 2                                   ; 0F48 _ C0. E8, 02
        movzx   eax, al                                 ; 0F4B _ 0F B6. C0
        sub     esp, 8                                  ; 0F4E _ 83. EC, 08
        push    eax                                     ; 0F51 _ 50
        push    969                                     ; 0F52 _ 68, 000003C9
        call    io_out8                                 ; 0F57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F5C _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F5F _ 8B. 45, 10
        inc     eax                                     ; 0F62 _ 40
        mov     al, byte [eax]                          ; 0F63 _ 8A. 00
        shr     al, 2                                   ; 0F65 _ C0. E8, 02
        movzx   eax, al                                 ; 0F68 _ 0F B6. C0
        sub     esp, 8                                  ; 0F6B _ 83. EC, 08
        push    eax                                     ; 0F6E _ 50
        push    969                                     ; 0F6F _ 68, 000003C9
        call    io_out8                                 ; 0F74 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F79 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F7C _ 8B. 45, 10
        add     eax, 2                                  ; 0F7F _ 83. C0, 02
        mov     al, byte [eax]                          ; 0F82 _ 8A. 00
        shr     al, 2                                   ; 0F84 _ C0. E8, 02
        movzx   eax, al                                 ; 0F87 _ 0F B6. C0
        sub     esp, 8                                  ; 0F8A _ 83. EC, 08
        push    eax                                     ; 0F8D _ 50
        push    969                                     ; 0F8E _ 68, 000003C9
        call    io_out8                                 ; 0F93 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F98 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0F9B _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0F9F _ FF. 45, F4
?_025:  mov     eax, dword [ebp-0CH]                    ; 0FA2 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0FA5 _ 3B. 45, 0C
        jle     ?_024                                   ; 0FA8 _ 7E, 99
        sub     esp, 12                                 ; 0FAA _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0FAD _ FF. 75, F0
        call    io_store_eflags                         ; 0FB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0FB5 _ 83. C4, 10
        nop                                             ; 0FB8 _ 90
        leave                                           ; 0FB9 _ C9
        ret                                             ; 0FBA _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0FBB _ 55
        mov     ebp, esp                                ; 0FBC _ 89. E5
        sub     esp, 20                                 ; 0FBE _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0FC1 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0FC4 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0FC7 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0FCA _ 89. 45, F8
        jmp     ?_029                                   ; 0FCD _ EB, 30

?_026:  mov     eax, dword [ebp+14H]                    ; 0FCF _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0FD2 _ 89. 45, FC
        jmp     ?_028                                   ; 0FD5 _ EB, 1D

?_027:  mov     eax, dword [ebp-8H]                     ; 0FD7 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0FDA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FDE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FE0 _ 8B. 45, FC
        add     eax, edx                                ; 0FE3 _ 01. D0
        mov     edx, eax                                ; 0FE5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FE7 _ 8B. 45, 08
        add     edx, eax                                ; 0FEA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0FEC _ 8A. 45, EC
        mov     byte [edx], al                          ; 0FEF _ 88. 02
        inc     dword [ebp-4H]                          ; 0FF1 _ FF. 45, FC
?_028:  mov     eax, dword [ebp-4H]                     ; 0FF4 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0FF7 _ 3B. 45, 1C
        jle     ?_027                                   ; 0FFA _ 7E, DB
        inc     dword [ebp-8H]                          ; 0FFC _ FF. 45, F8
?_029:  mov     eax, dword [ebp-8H]                     ; 0FFF _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 1002 _ 3B. 45, 20
        jle     ?_026                                   ; 1005 _ 7E, C8
        nop                                             ; 1007 _ 90
        nop                                             ; 1008 _ 90
        leave                                           ; 1009 _ C9
        ret                                             ; 100A _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 100B _ 55
        mov     ebp, esp                                ; 100C _ 89. E5
        sub     esp, 20                                 ; 100E _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 1011 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 1014 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1017 _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 101E _ E9, 00000162

?_030:  mov     edx, dword [ebp-4H]                     ; 1023 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 1026 _ 8B. 45, 1C
        add     eax, edx                                ; 1029 _ 01. D0
        mov     al, byte [eax]                          ; 102B _ 8A. 00
        mov     byte [ebp-5H], al                       ; 102D _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 1030 _ 80. 7D, FB, 00
        jns     ?_031                                   ; 1034 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 1036 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1039 _ 8B. 45, FC
        add     eax, edx                                ; 103C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 103E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1042 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1044 _ 8B. 45, 10
        add     eax, edx                                ; 1047 _ 01. D0
        mov     edx, eax                                ; 1049 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 104B _ 8B. 45, 08
        add     edx, eax                                ; 104E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1050 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1053 _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 1055 _ 0F BE. 45, FB
        and     eax, 40H                                ; 1059 _ 83. E0, 40
        test    eax, eax                                ; 105C _ 85. C0
        jz      ?_032                                   ; 105E _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1060 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1063 _ 8B. 45, FC
        add     eax, edx                                ; 1066 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1068 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 106C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 106E _ 8B. 45, 10
        add     eax, edx                                ; 1071 _ 01. D0
        lea     edx, [eax+1H]                           ; 1073 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1076 _ 8B. 45, 08
        add     edx, eax                                ; 1079 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 107B _ 8A. 45, EC
        mov     byte [edx], al                          ; 107E _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 1080 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1084 _ 83. E0, 20
        test    eax, eax                                ; 1087 _ 85. C0
        jz      ?_033                                   ; 1089 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 108B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 108E _ 8B. 45, FC
        add     eax, edx                                ; 1091 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1093 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1097 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1099 _ 8B. 45, 10
        add     eax, edx                                ; 109C _ 01. D0
        lea     edx, [eax+2H]                           ; 109E _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 10A1 _ 8B. 45, 08
        add     edx, eax                                ; 10A4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10A6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10A9 _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 10AB _ 0F BE. 45, FB
        and     eax, 10H                                ; 10AF _ 83. E0, 10
        test    eax, eax                                ; 10B2 _ 85. C0
        jz      ?_034                                   ; 10B4 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10B6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10B9 _ 8B. 45, FC
        add     eax, edx                                ; 10BC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10BE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10C2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10C4 _ 8B. 45, 10
        add     eax, edx                                ; 10C7 _ 01. D0
        lea     edx, [eax+3H]                           ; 10C9 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 10CC _ 8B. 45, 08
        add     edx, eax                                ; 10CF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10D1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10D4 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 10D6 _ 0F BE. 45, FB
        and     eax, 08H                                ; 10DA _ 83. E0, 08
        test    eax, eax                                ; 10DD _ 85. C0
        jz      ?_035                                   ; 10DF _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10E1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10E4 _ 8B. 45, FC
        add     eax, edx                                ; 10E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10E9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10ED _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10EF _ 8B. 45, 10
        add     eax, edx                                ; 10F2 _ 01. D0
        lea     edx, [eax+4H]                           ; 10F4 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 10F7 _ 8B. 45, 08
        add     edx, eax                                ; 10FA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10FC _ 8A. 45, EC
        mov     byte [edx], al                          ; 10FF _ 88. 02
?_035:  movsx   eax, byte [ebp-5H]                      ; 1101 _ 0F BE. 45, FB
        and     eax, 04H                                ; 1105 _ 83. E0, 04
        test    eax, eax                                ; 1108 _ 85. C0
        jz      ?_036                                   ; 110A _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 110C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 110F _ 8B. 45, FC
        add     eax, edx                                ; 1112 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1114 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1118 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 111A _ 8B. 45, 10
        add     eax, edx                                ; 111D _ 01. D0
        lea     edx, [eax+5H]                           ; 111F _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1122 _ 8B. 45, 08
        add     edx, eax                                ; 1125 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1127 _ 8A. 45, EC
        mov     byte [edx], al                          ; 112A _ 88. 02
?_036:  movsx   eax, byte [ebp-5H]                      ; 112C _ 0F BE. 45, FB
        and     eax, 02H                                ; 1130 _ 83. E0, 02
        test    eax, eax                                ; 1133 _ 85. C0
        jz      ?_037                                   ; 1135 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1137 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 113A _ 8B. 45, FC
        add     eax, edx                                ; 113D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 113F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1143 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1145 _ 8B. 45, 10
        add     eax, edx                                ; 1148 _ 01. D0
        lea     edx, [eax+6H]                           ; 114A _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 114D _ 8B. 45, 08
        add     edx, eax                                ; 1150 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1152 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1155 _ 88. 02
?_037:  movsx   eax, byte [ebp-5H]                      ; 1157 _ 0F BE. 45, FB
        and     eax, 01H                                ; 115B _ 83. E0, 01
        test    eax, eax                                ; 115E _ 85. C0
        jz      ?_038                                   ; 1160 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1162 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1165 _ 8B. 45, FC
        add     eax, edx                                ; 1168 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 116A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 116E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1170 _ 8B. 45, 10
        add     eax, edx                                ; 1173 _ 01. D0
        lea     edx, [eax+7H]                           ; 1175 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1178 _ 8B. 45, 08
        add     edx, eax                                ; 117B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 117D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1180 _ 88. 02
?_038:  inc     dword [ebp-4H]                          ; 1182 _ FF. 45, FC
?_039:  cmp     dword [ebp-4H], 15                      ; 1185 _ 83. 7D, FC, 0F
        jle     ?_030                                   ; 1189 _ 0F 8E, FFFFFE94
        nop                                             ; 118F _ 90
        nop                                             ; 1190 _ 90
        leave                                           ; 1191 _ C9
        ret                                             ; 1192 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1193 _ 55
        mov     ebp, esp                                ; 1194 _ 89. E5
        sub     esp, 20                                 ; 1196 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1199 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 119C _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 119F _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 11A6 _ E9, 000000AB

?_040:  mov     dword [ebp-4H], 0                       ; 11AB _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 11B2 _ E9, 00000092

?_041:  mov     eax, dword [ebp-8H]                     ; 11B7 _ 8B. 45, F8
        shl     eax, 4                                  ; 11BA _ C1. E0, 04
        mov     edx, eax                                ; 11BD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11BF _ 8B. 45, FC
        add     eax, edx                                ; 11C2 _ 01. D0
        add     eax, cursor.1930                        ; 11C4 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11C9 _ 8A. 00
        cmp     al, 42                                  ; 11CB _ 3C, 2A
        jnz     ?_042                                   ; 11CD _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 11CF _ 8B. 45, F8
        shl     eax, 4                                  ; 11D2 _ C1. E0, 04
        mov     edx, eax                                ; 11D5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11D7 _ 8B. 45, FC
        add     eax, edx                                ; 11DA _ 01. D0
        mov     edx, eax                                ; 11DC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11DE _ 8B. 45, 08
        add     eax, edx                                ; 11E1 _ 01. D0
        mov     byte [eax], 0                           ; 11E3 _ C6. 00, 00
?_042:  mov     eax, dword [ebp-8H]                     ; 11E6 _ 8B. 45, F8
        shl     eax, 4                                  ; 11E9 _ C1. E0, 04
        mov     edx, eax                                ; 11EC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11EE _ 8B. 45, FC
        add     eax, edx                                ; 11F1 _ 01. D0
        add     eax, cursor.1930                        ; 11F3 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11F8 _ 8A. 00
        cmp     al, 79                                  ; 11FA _ 3C, 4F
        jnz     ?_043                                   ; 11FC _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 11FE _ 8B. 45, F8
        shl     eax, 4                                  ; 1201 _ C1. E0, 04
        mov     edx, eax                                ; 1204 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1206 _ 8B. 45, FC
        add     eax, edx                                ; 1209 _ 01. D0
        mov     edx, eax                                ; 120B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 120D _ 8B. 45, 08
        add     eax, edx                                ; 1210 _ 01. D0
        mov     byte [eax], 7                           ; 1212 _ C6. 00, 07
?_043:  mov     eax, dword [ebp-8H]                     ; 1215 _ 8B. 45, F8
        shl     eax, 4                                  ; 1218 _ C1. E0, 04
        mov     edx, eax                                ; 121B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 121D _ 8B. 45, FC
        add     eax, edx                                ; 1220 _ 01. D0
        add     eax, cursor.1930                        ; 1222 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1227 _ 8A. 00
        cmp     al, 46                                  ; 1229 _ 3C, 2E
        jnz     ?_044                                   ; 122B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 122D _ 8B. 45, F8
        shl     eax, 4                                  ; 1230 _ C1. E0, 04
        mov     edx, eax                                ; 1233 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1235 _ 8B. 45, FC
        add     eax, edx                                ; 1238 _ 01. D0
        mov     edx, eax                                ; 123A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 123C _ 8B. 45, 08
        add     edx, eax                                ; 123F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1241 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1244 _ 88. 02
?_044:  inc     dword [ebp-4H]                          ; 1246 _ FF. 45, FC
?_045:  cmp     dword [ebp-4H], 15                      ; 1249 _ 83. 7D, FC, 0F
        jle     ?_041                                   ; 124D _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 1253 _ FF. 45, F8
?_046:  cmp     dword [ebp-8H], 15                      ; 1256 _ 83. 7D, F8, 0F
        jle     ?_040                                   ; 125A _ 0F 8E, FFFFFF4B
        nop                                             ; 1260 _ 90
        nop                                             ; 1261 _ 90
        leave                                           ; 1262 _ C9
        ret                                             ; 1263 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1264 _ 55
        mov     ebp, esp                                ; 1265 _ 89. E5
        push    ebx                                     ; 1267 _ 53
        sub     esp, 16                                 ; 1268 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 126B _ C7. 45, F4, 00000000
        jmp     ?_050                                   ; 1272 _ EB, 4D

?_047:  mov     dword [ebp-8H], 0                       ; 1274 _ C7. 45, F8, 00000000
        jmp     ?_049                                   ; 127B _ EB, 39

?_048:  mov     eax, dword [ebp-0CH]                    ; 127D _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1280 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1284 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1286 _ 8B. 45, F8
        add     eax, edx                                ; 1289 _ 01. D0
        mov     edx, eax                                ; 128B _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 128D _ 8B. 45, 20
        add     eax, edx                                ; 1290 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1292 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 1295 _ 8B. 55, F4
        add     edx, ecx                                ; 1298 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 129A _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 129E _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 12A1 _ 8B. 4D, F8
        add     ecx, ebx                                ; 12A4 _ 01. D9
        add     edx, ecx                                ; 12A6 _ 01. CA
        mov     ecx, edx                                ; 12A8 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 12AA _ 8B. 55, 08
        add     edx, ecx                                ; 12AD _ 01. CA
        mov     al, byte [eax]                          ; 12AF _ 8A. 00
        mov     byte [edx], al                          ; 12B1 _ 88. 02
        inc     dword [ebp-8H]                          ; 12B3 _ FF. 45, F8
?_049:  mov     eax, dword [ebp-8H]                     ; 12B6 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 12B9 _ 3B. 45, 10
        jl      ?_048                                   ; 12BC _ 7C, BF
        inc     dword [ebp-0CH]                         ; 12BE _ FF. 45, F4
?_050:  mov     eax, dword [ebp-0CH]                    ; 12C1 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 12C4 _ 3B. 45, 14
        jl      ?_047                                   ; 12C7 _ 7C, AB
        nop                                             ; 12C9 _ 90
        nop                                             ; 12CA _ 90
        add     esp, 16                                 ; 12CB _ 83. C4, 10
        pop     ebx                                     ; 12CE _ 5B
        pop     ebp                                     ; 12CF _ 5D
        ret                                             ; 12D0 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 12D1 _ 55
        mov     ebp, esp                                ; 12D2 _ 89. E5
        sub     esp, 24                                 ; 12D4 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 12D7 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 12DC _ 89. 45, F4
        mov     eax, dword [?_179]                      ; 12DF _ A1, 00000004(d)
        cwde                                            ; 12E4 _ 98
        mov     dword [ebp-10H], eax                    ; 12E5 _ 89. 45, F0
        mov     ax, word [?_180]                        ; 12E8 _ 66: A1, 00000006(d)
        cwde                                            ; 12EE _ 98
        mov     dword [ebp-14H], eax                    ; 12EF _ 89. 45, EC
        sub     esp, 8                                  ; 12F2 _ 83. EC, 08
        push    32                                      ; 12F5 _ 6A, 20
        push    32                                      ; 12F7 _ 6A, 20
        call    io_out8                                 ; 12F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12FE _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 1301 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 1305 _ 83. EC, 0C
        push    96                                      ; 1308 _ 6A, 60
        call    io_in8                                  ; 130A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 130F _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 1312 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 1315 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 1319 _ 83. EC, 08
        push    eax                                     ; 131C _ 50
        push    keyinfo                                 ; 131D _ 68, 00000008(d)
        call    fifo8_put                               ; 1322 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1327 _ 83. C4, 10
        nop                                             ; 132A _ 90
        leave                                           ; 132B _ C9
        ret                                             ; 132C _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 132D _ 55
        mov     ebp, esp                                ; 132E _ 89. E5
        sub     esp, 4                                  ; 1330 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1333 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1336 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1339 _ 80. 7D, FC, 09
        jle     ?_051                                   ; 133D _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 133F _ 8A. 45, FC
        add     eax, 55                                 ; 1342 _ 83. C0, 37
        jmp     ?_052                                   ; 1345 _ EB, 06

?_051:  mov     al, byte [ebp-4H]                       ; 1347 _ 8A. 45, FC
        add     eax, 48                                 ; 134A _ 83. C0, 30
?_052:  leave                                           ; 134D _ C9
        ret                                             ; 134E _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 134F _ 55
        mov     ebp, esp                                ; 1350 _ 89. E5
        sub     esp, 20                                 ; 1352 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 1355 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1358 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 135B _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1362 _ 8A. 45, EC
        and     eax, 0FH                                ; 1365 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1368 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 136B _ 0F BE. 45, FB
        push    eax                                     ; 136F _ 50
        call    charToHexVal                            ; 1370 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1375 _ 83. C4, 04
        mov     byte [?_178], al                        ; 1378 _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 137D _ 8A. 45, EC
        shr     al, 4                                   ; 1380 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1383 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 1386 _ 8A. 45, EC
        movsx   eax, al                                 ; 1389 _ 0F BE. C0
        push    eax                                     ; 138C _ 50
        call    charToHexVal                            ; 138D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1392 _ 83. C4, 04
        mov     byte [?_177], al                        ; 1395 _ A2, 00000076(d)
        mov     eax, keyval                             ; 139A _ B8, 00000074(d)
        leave                                           ; 139F _ C9
        ret                                             ; 13A0 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 13A1 _ 55
        mov     ebp, esp                                ; 13A2 _ 89. E5
        sub     esp, 16                                 ; 13A4 _ 83. EC, 10
        mov     byte [str.1978], 48                     ; 13A7 _ C6. 05, 00000348(d), 30
        mov     byte [?_211], 88                        ; 13AE _ C6. 05, 00000349(d), 58
        mov     byte [?_212], 0                         ; 13B5 _ C6. 05, 00000352(d), 00
        mov     dword [ebp-4H], 2                       ; 13BC _ C7. 45, FC, 00000002
        jmp     ?_054                                   ; 13C3 _ EB, 0E

?_053:  mov     eax, dword [ebp-4H]                     ; 13C5 _ 8B. 45, FC
        add     eax, str.1978                           ; 13C8 _ 05, 00000348(d)
        mov     byte [eax], 48                          ; 13CD _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 13D0 _ FF. 45, FC
?_054:  cmp     dword [ebp-4H], 9                       ; 13D3 _ 83. 7D, FC, 09
        jle     ?_053                                   ; 13D7 _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 13D9 _ C7. 45, F8, 00000009
        jmp     ?_058                                   ; 13E0 _ EB, 41

?_055:  mov     eax, dword [ebp+8H]                     ; 13E2 _ 8B. 45, 08
        and     eax, 0FH                                ; 13E5 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 13E8 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 13EB _ 8B. 45, 08
        shr     eax, 4                                  ; 13EE _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 13F1 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 13F4 _ 83. 7D, F4, 09
        jle     ?_056                                   ; 13F8 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 13FA _ 8B. 45, F4
        add     eax, 55                                 ; 13FD _ 83. C0, 37
        mov     dl, al                                  ; 1400 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1402 _ 8B. 45, F8
        add     eax, str.1978                           ; 1405 _ 05, 00000348(d)
        mov     byte [eax], dl                          ; 140A _ 88. 10
        jmp     ?_057                                   ; 140C _ EB, 12

?_056:  mov     eax, dword [ebp-0CH]                    ; 140E _ 8B. 45, F4
        add     eax, 48                                 ; 1411 _ 83. C0, 30
        mov     dl, al                                  ; 1414 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 1416 _ 8B. 45, F8
        add     eax, str.1978                           ; 1419 _ 05, 00000348(d)
        mov     byte [eax], dl                          ; 141E _ 88. 10
?_057:  dec     dword [ebp-8H]                          ; 1420 _ FF. 4D, F8
?_058:  cmp     dword [ebp-8H], 1                       ; 1423 _ 83. 7D, F8, 01
        jle     ?_059                                   ; 1427 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1429 _ 83. 7D, 08, 00
        jnz     ?_055                                   ; 142D _ 75, B3
?_059:  mov     eax, str.1978                           ; 142F _ B8, 00000348(d)
        leave                                           ; 1434 _ C9
        ret                                             ; 1435 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1436 _ 55
        mov     ebp, esp                                ; 1437 _ 89. E5
        sub     esp, 8                                  ; 1439 _ 83. EC, 08
?_060:  sub     esp, 12                                 ; 143C _ 83. EC, 0C
        push    100                                     ; 143F _ 6A, 64
        call    io_in8                                  ; 1441 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1446 _ 83. C4, 10
        and     eax, 02H                                ; 1449 _ 83. E0, 02
        test    eax, eax                                ; 144C _ 85. C0
        jz      ?_061                                   ; 144E _ 74, 02
        jmp     ?_060                                   ; 1450 _ EB, EA

?_061:  nop                                             ; 1452 _ 90
        nop                                             ; 1453 _ 90
        leave                                           ; 1454 _ C9
        ret                                             ; 1455 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1456 _ 55
        mov     ebp, esp                                ; 1457 _ 89. E5
        sub     esp, 8                                  ; 1459 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 145C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1461 _ 83. EC, 08
        push    96                                      ; 1464 _ 6A, 60
        push    100                                     ; 1466 _ 6A, 64
        call    io_out8                                 ; 1468 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 146D _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1470 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1475 _ 83. EC, 08
        push    71                                      ; 1478 _ 6A, 47
        push    96                                      ; 147A _ 6A, 60
        call    io_out8                                 ; 147C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1481 _ 83. C4, 10
        nop                                             ; 1484 _ 90
        leave                                           ; 1485 _ C9
        ret                                             ; 1486 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1487 _ 55
        mov     ebp, esp                                ; 1488 _ 89. E5
        sub     esp, 8                                  ; 148A _ 83. EC, 08
        call    wait_KBC_sendready                      ; 148D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1492 _ 83. EC, 08
        push    212                                     ; 1495 _ 68, 000000D4
        push    100                                     ; 149A _ 6A, 64
        call    io_out8                                 ; 149C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14A1 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 14A4 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 14A9 _ 83. EC, 08
        push    244                                     ; 14AC _ 68, 000000F4
        push    96                                      ; 14B1 _ 6A, 60
        call    io_out8                                 ; 14B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14B8 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 14BB _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 14BE _ C6. 40, 03, 00
        nop                                             ; 14C2 _ 90
        leave                                           ; 14C3 _ C9
        ret                                             ; 14C4 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 14C5 _ 55
        mov     ebp, esp                                ; 14C6 _ 89. E5
        sub     esp, 24                                 ; 14C8 _ 83. EC, 18
        sub     esp, 8                                  ; 14CB _ 83. EC, 08
        push    32                                      ; 14CE _ 6A, 20
        push    160                                     ; 14D0 _ 68, 000000A0
        call    io_out8                                 ; 14D5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14DA _ 83. C4, 10
        sub     esp, 8                                  ; 14DD _ 83. EC, 08
        push    32                                      ; 14E0 _ 6A, 20
        push    32                                      ; 14E2 _ 6A, 20
        call    io_out8                                 ; 14E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14E9 _ 83. C4, 10
        sub     esp, 12                                 ; 14EC _ 83. EC, 0C
        push    96                                      ; 14EF _ 6A, 60
        call    io_in8                                  ; 14F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14F6 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 14F9 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 14FC _ 0F B6. 45, F7
        sub     esp, 8                                  ; 1500 _ 83. EC, 08
        push    eax                                     ; 1503 _ 50
        push    mouseinfo                               ; 1504 _ 68, 00000020(d)
        call    fifo8_put                               ; 1509 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 150E _ 83. C4, 10
        nop                                             ; 1511 _ 90
        leave                                           ; 1512 _ C9
        ret                                             ; 1513 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1514 _ 55
        mov     ebp, esp                                ; 1515 _ 89. E5
        sub     esp, 4                                  ; 1517 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 151A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 151D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1520 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1523 _ 8A. 40, 03
        test    al, al                                  ; 1526 _ 84. C0
        jnz     ?_063                                   ; 1528 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 152A _ 80. 7D, FC, FA
        jnz     ?_062                                   ; 152E _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1530 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1533 _ C6. 40, 03, 01
?_062:  mov     eax, 0                                  ; 1537 _ B8, 00000000
        jmp     ?_070                                   ; 153C _ E9, 00000104

?_063:  mov     eax, dword [ebp+8H]                     ; 1541 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1544 _ 8A. 40, 03
        cmp     al, 1                                   ; 1547 _ 3C, 01
        jnz     ?_065                                   ; 1549 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 154B _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 154F _ 25, 000000C8
        cmp     eax, 8                                  ; 1554 _ 83. F8, 08
        jnz     ?_064                                   ; 1557 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 1559 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 155C _ 8A. 55, FC
        mov     byte [eax], dl                          ; 155F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1561 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1564 _ C6. 40, 03, 02
?_064:  mov     eax, 0                                  ; 1568 _ B8, 00000000
        jmp     ?_070                                   ; 156D _ E9, 000000D3

?_065:  mov     eax, dword [ebp+8H]                     ; 1572 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1575 _ 8A. 40, 03
        cmp     al, 2                                   ; 1578 _ 3C, 02
        jnz     ?_066                                   ; 157A _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 157C _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 157F _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1582 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1585 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1588 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 158C _ B8, 00000000
        jmp     ?_070                                   ; 1591 _ E9, 000000AF

?_066:  mov     eax, dword [ebp+8H]                     ; 1596 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1599 _ 8A. 40, 03
        cmp     al, 3                                   ; 159C _ 3C, 03
        jne     ?_069                                   ; 159E _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 15A4 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 15A7 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 15AA _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 15AD _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 15B0 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 15B4 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 15B7 _ 8A. 00
        movzx   eax, al                                 ; 15B9 _ 0F B6. C0
        and     eax, 07H                                ; 15BC _ 83. E0, 07
        mov     edx, eax                                ; 15BF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15C1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 15C4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 15C7 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 15CA _ 8A. 40, 01
        movzx   edx, al                                 ; 15CD _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15D0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15D3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15D6 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 15D9 _ 8A. 40, 02
        movzx   edx, al                                 ; 15DC _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15DF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15E2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 15E5 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 15E8 _ 8A. 00
        movzx   eax, al                                 ; 15EA _ 0F B6. C0
        and     eax, 10H                                ; 15ED _ 83. E0, 10
        test    eax, eax                                ; 15F0 _ 85. C0
        jz      ?_067                                   ; 15F2 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15F4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 15F7 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 15FA _ 0D, FFFFFF00
        mov     edx, eax                                ; 15FF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1601 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1604 _ 89. 50, 04
?_067:  mov     eax, dword [ebp+8H]                     ; 1607 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 160A _ 8A. 00
        movzx   eax, al                                 ; 160C _ 0F B6. C0
        and     eax, 20H                                ; 160F _ 83. E0, 20
        test    eax, eax                                ; 1612 _ 85. C0
        jz      ?_068                                   ; 1614 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1616 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1619 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 161C _ 0D, FFFFFF00
        mov     edx, eax                                ; 1621 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1623 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1626 _ 89. 50, 08
?_068:  mov     eax, dword [ebp+8H]                     ; 1629 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 162C _ 8B. 40, 08
        neg     eax                                     ; 162F _ F7. D8
        mov     edx, eax                                ; 1631 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1633 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1636 _ 89. 50, 08
        mov     eax, 1                                  ; 1639 _ B8, 00000001
        jmp     ?_070                                   ; 163E _ EB, 05

?_069:  mov     eax, 4294967295                         ; 1640 _ B8, FFFFFFFF
?_070:  leave                                           ; 1645 _ C9
        ret                                             ; 1646 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1647 _ 55
        mov     ebp, esp                                ; 1648 _ 89. E5
        sub     esp, 56                                 ; 164A _ 83. EC, 38
        mov     dword [ebp-0CH], 0                      ; 164D _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1654 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 165B _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1662 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 1669 _ 8B. 15, 0000011C(d)
        mov     eax, dword [ebp+0CH]                    ; 166F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1672 _ 8B. 00
        sub     esp, 4                                  ; 1674 _ 83. EC, 04
        push    edx                                     ; 1677 _ 52
        push    dword [ebp+1CH]                         ; 1678 _ FF. 75, 1C
        push    eax                                     ; 167B _ 50
        call    init_screen8                            ; 167C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1681 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1684 _ 8B. 45, 20
        movsx   eax, al                                 ; 1687 _ 0F BE. C0
        sub     esp, 8                                  ; 168A _ 83. EC, 08
        push    ?_171                                   ; 168D _ 68, 00000032(d)
        push    eax                                     ; 1692 _ 50
        push    dword [ebp-10H]                         ; 1693 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1696 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1699 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 169C _ FF. 75, 08
        call    showString                              ; 169F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16A4 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 16A7 _ 8B. 45, 18
        sub     esp, 12                                 ; 16AA _ 83. EC, 0C
        push    eax                                     ; 16AD _ 50
        call    intToHexStr                             ; 16AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16B3 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 16B6 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 16B9 _ 8B. 45, 20
        movsx   eax, al                                 ; 16BC _ 0F BE. C0
        sub     esp, 8                                  ; 16BF _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 16C2 _ FF. 75, E4
        push    eax                                     ; 16C5 _ 50
        push    dword [ebp-10H]                         ; 16C6 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 16C9 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 16CC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16CF _ FF. 75, 08
        call    showString                              ; 16D2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16D7 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 16DA _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 16DE _ 8B. 45, 20
        movsx   eax, al                                 ; 16E1 _ 0F BE. C0
        sub     esp, 8                                  ; 16E4 _ 83. EC, 08
        push    ?_172                                   ; 16E7 _ 68, 0000003C(d)
        push    eax                                     ; 16EC _ 50
        push    dword [ebp-10H]                         ; 16ED _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 16F0 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 16F3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16F6 _ FF. 75, 08
        call    showString                              ; 16F9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16FE _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1701 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1704 _ 8B. 00
        sub     esp, 12                                 ; 1706 _ 83. EC, 0C
        push    eax                                     ; 1709 _ 50
        call    intToHexStr                             ; 170A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 170F _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1712 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1715 _ 8B. 45, 20
        movsx   eax, al                                 ; 1718 _ 0F BE. C0
        sub     esp, 8                                  ; 171B _ 83. EC, 08
        push    dword [ebp-20H]                         ; 171E _ FF. 75, E0
        push    eax                                     ; 1721 _ 50
        push    dword [ebp-10H]                         ; 1722 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1725 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1728 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 172B _ FF. 75, 08
        call    showString                              ; 172E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1733 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1736 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 173A _ 8B. 45, 20
        movsx   eax, al                                 ; 173D _ 0F BE. C0
        sub     esp, 8                                  ; 1740 _ 83. EC, 08
        push    ?_173                                   ; 1743 _ 68, 00000048(d)
        push    eax                                     ; 1748 _ 50
        push    dword [ebp-10H]                         ; 1749 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 174C _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 174F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1752 _ FF. 75, 08
        call    showString                              ; 1755 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 175A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 175D _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1760 _ 8B. 40, 04
        sub     esp, 12                                 ; 1763 _ 83. EC, 0C
        push    eax                                     ; 1766 _ 50
        call    intToHexStr                             ; 1767 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 176C _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 176F _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1772 _ 8B. 45, 20
        movsx   eax, al                                 ; 1775 _ 0F BE. C0
        sub     esp, 8                                  ; 1778 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 177B _ FF. 75, DC
        push    eax                                     ; 177E _ 50
        push    dword [ebp-10H]                         ; 177F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1782 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1785 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1788 _ FF. 75, 08
        call    showString                              ; 178B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1790 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1793 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1797 _ 8B. 45, 20
        movsx   eax, al                                 ; 179A _ 0F BE. C0
        sub     esp, 8                                  ; 179D _ 83. EC, 08
        push    ?_174                                   ; 17A0 _ 68, 00000054(d)
        push    eax                                     ; 17A5 _ 50
        push    dword [ebp-10H]                         ; 17A6 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 17A9 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 17AC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17AF _ FF. 75, 08
        call    showString                              ; 17B2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17B7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 17BA _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 17BD _ 8B. 40, 08
        sub     esp, 12                                 ; 17C0 _ 83. EC, 0C
        push    eax                                     ; 17C3 _ 50
        call    intToHexStr                             ; 17C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17C9 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 17CC _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 17CF _ 8B. 45, 20
        movsx   eax, al                                 ; 17D2 _ 0F BE. C0
        sub     esp, 8                                  ; 17D5 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 17D8 _ FF. 75, D8
        push    eax                                     ; 17DB _ 50
        push    dword [ebp-10H]                         ; 17DC _ FF. 75, F0
        push    dword [ebp-14H]                         ; 17DF _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 17E2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17E5 _ FF. 75, 08
        call    showString                              ; 17E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17ED _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 17F0 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 17F4 _ 8B. 45, 20
        movsx   eax, al                                 ; 17F7 _ 0F BE. C0
        sub     esp, 8                                  ; 17FA _ 83. EC, 08
        push    ?_175                                   ; 17FD _ 68, 00000060(d)
        push    eax                                     ; 1802 _ 50
        push    dword [ebp-10H]                         ; 1803 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1806 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1809 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 180C _ FF. 75, 08
        call    showString                              ; 180F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1814 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1817 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 181A _ 8B. 40, 0C
        sub     esp, 12                                 ; 181D _ 83. EC, 0C
        push    eax                                     ; 1820 _ 50
        call    intToHexStr                             ; 1821 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1826 _ 83. C4, 10
        mov     dword [ebp-2CH], eax                    ; 1829 _ 89. 45, D4
        mov     eax, dword [ebp+20H]                    ; 182C _ 8B. 45, 20
        movsx   eax, al                                 ; 182F _ 0F BE. C0
        sub     esp, 8                                  ; 1832 _ 83. EC, 08
        push    dword [ebp-2CH]                         ; 1835 _ FF. 75, D4
        push    eax                                     ; 1838 _ 50
        push    dword [ebp-10H]                         ; 1839 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 183C _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 183F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1842 _ FF. 75, 08
        call    showString                              ; 1845 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 184A _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 184D _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1851 _ 8B. 45, 20
        movsx   eax, al                                 ; 1854 _ 0F BE. C0
        sub     esp, 8                                  ; 1857 _ 83. EC, 08
        push    ?_176                                   ; 185A _ 68, 0000006D(d)
        push    eax                                     ; 185F _ 50
        push    dword [ebp-10H]                         ; 1860 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1863 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1866 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1869 _ FF. 75, 08
        call    showString                              ; 186C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1871 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1874 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1877 _ 8B. 40, 10
        sub     esp, 12                                 ; 187A _ 83. EC, 0C
        push    eax                                     ; 187D _ 50
        call    intToHexStr                             ; 187E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1883 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 1886 _ 89. 45, D0
        mov     eax, dword [ebp+20H]                    ; 1889 _ 8B. 45, 20
        movsx   eax, al                                 ; 188C _ 0F BE. C0
        sub     esp, 8                                  ; 188F _ 83. EC, 08
        push    dword [ebp-30H]                         ; 1892 _ FF. 75, D0
        push    eax                                     ; 1895 _ 50
        push    dword [ebp-10H]                         ; 1896 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1899 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 189C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 189F _ FF. 75, 08
        call    showString                              ; 18A2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18A7 _ 83. C4, 20
        nop                                             ; 18AA _ 90
        leave                                           ; 18AB _ C9
        ret                                             ; 18AC _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 18AD _ 55
        mov     ebp, esp                                ; 18AE _ 89. E5
        sub     esp, 24                                 ; 18B0 _ 83. EC, 18
        sub     esp, 12                                 ; 18B3 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 18B6 _ FF. 75, 08
        call    sheet_alloc                             ; 18B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18BE _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 18C1 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 18C4 _ A1, 00000000(d)
        sub     esp, 8                                  ; 18C9 _ 83. EC, 08
        push    10880                                   ; 18CC _ 68, 00002A80
        push    eax                                     ; 18D1 _ 50
        call    memman_alloc_4k                         ; 18D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18D7 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 18DA _ 89. 45, F0
        sub     esp, 12                                 ; 18DD _ 83. EC, 0C
        push    -1                                      ; 18E0 _ 6A, FF
        push    68                                      ; 18E2 _ 6A, 44
        push    160                                     ; 18E4 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 18E9 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 18EC _ FF. 75, F4
        call    sheet_setbuf                            ; 18EF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18F4 _ 83. C4, 20
        sub     esp, 4                                  ; 18F7 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 18FA _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 18FD _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1900 _ FF. 75, 08
        call    make_window8                            ; 1903 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1908 _ 83. C4, 10
        sub     esp, 8                                  ; 190B _ 83. EC, 08
        push    7                                       ; 190E _ 6A, 07
        push    16                                      ; 1910 _ 6A, 10
        push    144                                     ; 1912 _ 68, 00000090
        push    28                                      ; 1917 _ 6A, 1C
        push    8                                       ; 1919 _ 6A, 08
        push    dword [ebp-0CH]                         ; 191B _ FF. 75, F4
        call    make_textbox8                           ; 191E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1923 _ 83. C4, 20
        push    72                                      ; 1926 _ 6A, 48
        push    160                                     ; 1928 _ 68, 000000A0
        push    dword [ebp-0CH]                         ; 192D _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1930 _ FF. 75, 08
        call    sheet_slide                             ; 1933 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1938 _ 83. C4, 10
        sub     esp, 4                                  ; 193B _ 83. EC, 04
        push    2                                       ; 193E _ 6A, 02
        push    dword [ebp-0CH]                         ; 1940 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1943 _ FF. 75, 08
        call    sheet_updown                            ; 1946 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 194B _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 194E _ 8B. 45, F4
        leave                                           ; 1951 _ C9
        ret                                             ; 1952 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1953 _ 55
        mov     ebp, esp                                ; 1954 _ 89. E5
        push    ebx                                     ; 1956 _ 53
        sub     esp, 36                                 ; 1957 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 195A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 195D _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1960 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1963 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1966 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1969 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 196C _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 196F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1972 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1975 _ 8B. 00
        push    0                                       ; 1977 _ 6A, 00
        push    edx                                     ; 1979 _ 52
        push    0                                       ; 197A _ 6A, 00
        push    0                                       ; 197C _ 6A, 00
        push    8                                       ; 197E _ 6A, 08
        push    dword [ebp-18H]                         ; 1980 _ FF. 75, E8
        push    eax                                     ; 1983 _ 50
        call    boxfill8                                ; 1984 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1989 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 198C _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 198F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1992 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1995 _ 8B. 00
        push    1                                       ; 1997 _ 6A, 01
        push    edx                                     ; 1999 _ 52
        push    1                                       ; 199A _ 6A, 01
        push    1                                       ; 199C _ 6A, 01
        push    7                                       ; 199E _ 6A, 07
        push    dword [ebp-18H]                         ; 19A0 _ FF. 75, E8
        push    eax                                     ; 19A3 _ 50
        call    boxfill8                                ; 19A4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19A9 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 19AC _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 19AF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19B2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19B5 _ 8B. 00
        push    edx                                     ; 19B7 _ 52
        push    0                                       ; 19B8 _ 6A, 00
        push    0                                       ; 19BA _ 6A, 00
        push    0                                       ; 19BC _ 6A, 00
        push    8                                       ; 19BE _ 6A, 08
        push    dword [ebp-18H]                         ; 19C0 _ FF. 75, E8
        push    eax                                     ; 19C3 _ 50
        call    boxfill8                                ; 19C4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19C9 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 19CC _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 19CF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19D2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19D5 _ 8B. 00
        push    edx                                     ; 19D7 _ 52
        push    1                                       ; 19D8 _ 6A, 01
        push    1                                       ; 19DA _ 6A, 01
        push    1                                       ; 19DC _ 6A, 01
        push    7                                       ; 19DE _ 6A, 07
        push    dword [ebp-18H]                         ; 19E0 _ FF. 75, E8
        push    eax                                     ; 19E3 _ 50
        call    boxfill8                                ; 19E4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19E9 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 19EC _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 19EF _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 19F2 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 19F5 _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 19F8 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 19FB _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19FE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A01 _ 8B. 00
        push    ebx                                     ; 1A03 _ 53
        push    ecx                                     ; 1A04 _ 51
        push    1                                       ; 1A05 _ 6A, 01
        push    edx                                     ; 1A07 _ 52
        push    15                                      ; 1A08 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1A0A _ FF. 75, E8
        push    eax                                     ; 1A0D _ 50
        call    boxfill8                                ; 1A0E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A13 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1A16 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1A19 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1A1C _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1A1F _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 1A22 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1A25 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A28 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A2B _ 8B. 00
        push    ebx                                     ; 1A2D _ 53
        push    ecx                                     ; 1A2E _ 51
        push    0                                       ; 1A2F _ 6A, 00
        push    edx                                     ; 1A31 _ 52
        push    0                                       ; 1A32 _ 6A, 00
        push    dword [ebp-18H]                         ; 1A34 _ FF. 75, E8
        push    eax                                     ; 1A37 _ 50
        call    boxfill8                                ; 1A38 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A3D _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1A40 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 1A43 _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 1A46 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1A49 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1A4C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A4F _ 8B. 00
        push    ecx                                     ; 1A51 _ 51
        push    edx                                     ; 1A52 _ 52
        push    2                                       ; 1A53 _ 6A, 02
        push    2                                       ; 1A55 _ 6A, 02
        push    8                                       ; 1A57 _ 6A, 08
        push    dword [ebp-18H]                         ; 1A59 _ FF. 75, E8
        push    eax                                     ; 1A5C _ 50
        call    boxfill8                                ; 1A5D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A62 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1A65 _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1A68 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1A6B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A6E _ 8B. 00
        push    20                                      ; 1A70 _ 6A, 14
        push    edx                                     ; 1A72 _ 52
        push    3                                       ; 1A73 _ 6A, 03
        push    3                                       ; 1A75 _ 6A, 03
        push    12                                      ; 1A77 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1A79 _ FF. 75, E8
        push    eax                                     ; 1A7C _ 50
        call    boxfill8                                ; 1A7D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1A82 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1A85 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1A88 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1A8B _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1A8E _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 1A91 _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 1A94 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1A97 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A9A _ 8B. 00
        push    ebx                                     ; 1A9C _ 53
        push    ecx                                     ; 1A9D _ 51
        push    edx                                     ; 1A9E _ 52
        push    1                                       ; 1A9F _ 6A, 01
        push    15                                      ; 1AA1 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1AA3 _ FF. 75, E8
        push    eax                                     ; 1AA6 _ 50
        call    boxfill8                                ; 1AA7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AAC _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1AAF _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1AB2 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1AB5 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1AB8 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 1ABB _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1ABE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AC1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AC4 _ 8B. 00
        push    ebx                                     ; 1AC6 _ 53
        push    ecx                                     ; 1AC7 _ 51
        push    edx                                     ; 1AC8 _ 52
        push    0                                       ; 1AC9 _ 6A, 00
        push    0                                       ; 1ACB _ 6A, 00
        push    dword [ebp-18H]                         ; 1ACD _ FF. 75, E8
        push    eax                                     ; 1AD0 _ 50
        call    boxfill8                                ; 1AD1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AD6 _ 83. C4, 1C
        sub     esp, 8                                  ; 1AD9 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1ADC _ FF. 75, 10
        push    7                                       ; 1ADF _ 6A, 07
        push    4                                       ; 1AE1 _ 6A, 04
        push    24                                      ; 1AE3 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1AE5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AE8 _ FF. 75, 08
        call    showString                              ; 1AEB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AF0 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1AF3 _ C7. 45, F0, 00000000
        jmp     ?_078                                   ; 1AFA _ EB, 7F

?_071:  mov     dword [ebp-0CH], 0                      ; 1AFC _ C7. 45, F4, 00000000
        jmp     ?_077                                   ; 1B03 _ EB, 6D

?_072:  mov     eax, dword [ebp-10H]                    ; 1B05 _ 8B. 45, F0
        shl     eax, 4                                  ; 1B08 _ C1. E0, 04
        mov     edx, eax                                ; 1B0B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1B0D _ 8B. 45, F4
        add     eax, edx                                ; 1B10 _ 01. D0
        add     eax, closebtn.2042                      ; 1B12 _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1B17 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1B19 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1B1C _ 80. 7D, EF, 40
        jnz     ?_073                                   ; 1B20 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1B22 _ C6. 45, EF, 00
        jmp     ?_076                                   ; 1B26 _ EB, 1C

?_073:  cmp     byte [ebp-11H], 36                      ; 1B28 _ 80. 7D, EF, 24
        jnz     ?_074                                   ; 1B2C _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1B2E _ C6. 45, EF, 0F
        jmp     ?_076                                   ; 1B32 _ EB, 10

?_074:  cmp     byte [ebp-11H], 81                      ; 1B34 _ 80. 7D, EF, 51
        jnz     ?_075                                   ; 1B38 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1B3A _ C6. 45, EF, 08
        jmp     ?_076                                   ; 1B3E _ EB, 04

?_075:  mov     byte [ebp-11H], 7                       ; 1B40 _ C6. 45, EF, 07
?_076:  mov     eax, dword [ebp+0CH]                    ; 1B44 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1B47 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1B49 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1B4C _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1B4F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B52 _ 8B. 40, 04
        imul    ecx, eax                                ; 1B55 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1B58 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B5B _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1B5E _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1B61 _ 8B. 45, F4
        add     eax, ebx                                ; 1B64 _ 01. D8
        add     eax, ecx                                ; 1B66 _ 01. C8
        add     edx, eax                                ; 1B68 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1B6A _ 8A. 45, EF
        mov     byte [edx], al                          ; 1B6D _ 88. 02
        inc     dword [ebp-0CH]                         ; 1B6F _ FF. 45, F4
?_077:  cmp     dword [ebp-0CH], 15                     ; 1B72 _ 83. 7D, F4, 0F
        jle     ?_072                                   ; 1B76 _ 7E, 8D
        inc     dword [ebp-10H]                         ; 1B78 _ FF. 45, F0
?_078:  cmp     dword [ebp-10H], 13                     ; 1B7B _ 83. 7D, F0, 0D
        jle     ?_071                                   ; 1B7F _ 0F 8E, FFFFFF77
        nop                                             ; 1B85 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1B86 _ 8B. 5D, FC
        leave                                           ; 1B89 _ C9
        ret                                             ; 1B8A _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1B8B _ 55
        mov     ebp, esp                                ; 1B8C _ 89. E5
        push    edi                                     ; 1B8E _ 57
        push    esi                                     ; 1B8F _ 56
        push    ebx                                     ; 1B90 _ 53
        sub     esp, 16                                 ; 1B91 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1B94 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1B97 _ 8B. 45, 14
        add     eax, edx                                ; 1B9A _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1B9C _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1B9F _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1BA2 _ 8B. 45, 18
        add     eax, edx                                ; 1BA5 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1BA7 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1BAA _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1BAD _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1BB0 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1BB3 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1BB6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1BB9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1BBC _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1BBF _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1BC2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BC5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BC8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BCB _ 8B. 00
        push    edi                                     ; 1BCD _ 57
        push    esi                                     ; 1BCE _ 56
        push    ebx                                     ; 1BCF _ 53
        push    ecx                                     ; 1BD0 _ 51
        push    15                                      ; 1BD1 _ 6A, 0F
        push    edx                                     ; 1BD3 _ 52
        push    eax                                     ; 1BD4 _ 50
        call    boxfill8                                ; 1BD5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BDA _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BDD _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1BE0 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1BE3 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1BE6 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1BE9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1BEC _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1BEF _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1BF2 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1BF5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BF8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BFB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BFE _ 8B. 00
        push    edi                                     ; 1C00 _ 57
        push    esi                                     ; 1C01 _ 56
        push    ebx                                     ; 1C02 _ 53
        push    ecx                                     ; 1C03 _ 51
        push    15                                      ; 1C04 _ 6A, 0F
        push    edx                                     ; 1C06 _ 52
        push    eax                                     ; 1C07 _ 50
        call    boxfill8                                ; 1C08 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C0D _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1C10 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1C13 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1C16 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C19 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1C1C _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1C1F _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1C22 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1C25 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1C28 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C2B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C2E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C31 _ 8B. 00
        push    edi                                     ; 1C33 _ 57
        push    esi                                     ; 1C34 _ 56
        push    ebx                                     ; 1C35 _ 53
        push    ecx                                     ; 1C36 _ 51
        push    7                                       ; 1C37 _ 6A, 07
        push    edx                                     ; 1C39 _ 52
        push    eax                                     ; 1C3A _ 50
        call    boxfill8                                ; 1C3B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C40 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1C43 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1C46 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1C49 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1C4C _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1C4F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1C52 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1C55 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1C58 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1C5B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C5E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C61 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C64 _ 8B. 00
        push    edi                                     ; 1C66 _ 57
        push    esi                                     ; 1C67 _ 56
        push    ebx                                     ; 1C68 _ 53
        push    ecx                                     ; 1C69 _ 51
        push    7                                       ; 1C6A _ 6A, 07
        push    edx                                     ; 1C6C _ 52
        push    eax                                     ; 1C6D _ 50
        call    boxfill8                                ; 1C6E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C73 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1C76 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1C79 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1C7C _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1C7F _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1C82 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1C85 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1C88 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C8B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C8E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C91 _ 8B. 00
        push    esi                                     ; 1C93 _ 56
        push    dword [ebp-10H]                         ; 1C94 _ FF. 75, F0
        push    ebx                                     ; 1C97 _ 53
        push    ecx                                     ; 1C98 _ 51
        push    0                                       ; 1C99 _ 6A, 00
        push    edx                                     ; 1C9B _ 52
        push    eax                                     ; 1C9C _ 50
        call    boxfill8                                ; 1C9D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CA2 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1CA5 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1CA8 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1CAB _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1CAE _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1CB1 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1CB4 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1CB7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CBA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CBD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CC0 _ 8B. 00
        push    dword [ebp-14H]                         ; 1CC2 _ FF. 75, EC
        push    esi                                     ; 1CC5 _ 56
        push    ebx                                     ; 1CC6 _ 53
        push    ecx                                     ; 1CC7 _ 51
        push    0                                       ; 1CC8 _ 6A, 00
        push    edx                                     ; 1CCA _ 52
        push    eax                                     ; 1CCB _ 50
        call    boxfill8                                ; 1CCC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CD1 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1CD4 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1CD7 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1CDA _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1CDD _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1CE0 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1CE3 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1CE6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1CE9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1CEC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CEF _ 8B. 00
        push    esi                                     ; 1CF1 _ 56
        push    dword [ebp-10H]                         ; 1CF2 _ FF. 75, F0
        push    ebx                                     ; 1CF5 _ 53
        push    ecx                                     ; 1CF6 _ 51
        push    8                                       ; 1CF7 _ 6A, 08
        push    edx                                     ; 1CF9 _ 52
        push    eax                                     ; 1CFA _ 50
        call    boxfill8                                ; 1CFB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D00 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1D03 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1D06 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1D09 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1D0C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1D0F _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1D12 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D15 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1D18 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1D1B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D1E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D21 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D24 _ 8B. 00
        push    edi                                     ; 1D26 _ 57
        push    esi                                     ; 1D27 _ 56
        push    ebx                                     ; 1D28 _ 53
        push    ecx                                     ; 1D29 _ 51
        push    8                                       ; 1D2A _ 6A, 08
        push    edx                                     ; 1D2C _ 52
        push    eax                                     ; 1D2D _ 50
        call    boxfill8                                ; 1D2E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D33 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1D36 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1D39 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1D3C _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1D3F _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1D42 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1D45 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1D48 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1D4B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1D4E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D51 _ 8B. 00
        push    dword [ebp-14H]                         ; 1D53 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1D56 _ FF. 75, F0
        push    esi                                     ; 1D59 _ 56
        push    ebx                                     ; 1D5A _ 53
        push    ecx                                     ; 1D5B _ 51
        push    edx                                     ; 1D5C _ 52
        push    eax                                     ; 1D5D _ 50
        call    boxfill8                                ; 1D5E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D63 _ 83. C4, 1C
        nop                                             ; 1D66 _ 90
        lea     esp, [ebp-0CH]                          ; 1D67 _ 8D. 65, F4
        pop     ebx                                     ; 1D6A _ 5B
        pop     esi                                     ; 1D6B _ 5E
        pop     edi                                     ; 1D6C _ 5F
        pop     ebp                                     ; 1D6D _ 5D
        ret                                             ; 1D6E _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1D6F _ 55
        mov     ebp, esp                                ; 1D70 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1D72 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1D75 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1D7B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1D7E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1D85 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1D88 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1D8F _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1D92 _ C7. 40, 0C, 00000000
        nop                                             ; 1D99 _ 90
        pop     ebp                                     ; 1D9A _ 5D
        ret                                             ; 1D9B _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1D9C _ 55
        mov     ebp, esp                                ; 1D9D _ 89. E5
        sub     esp, 16                                 ; 1D9F _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1DA2 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1DA9 _ C7. 45, FC, 00000000
        jmp     ?_080                                   ; 1DB0 _ EB, 13

?_079:  mov     eax, dword [ebp+8H]                     ; 1DB2 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1DB5 _ 8B. 55, FC
        add     edx, 2                                  ; 1DB8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1DBB _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1DBF _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1DC2 _ FF. 45, FC
?_080:  mov     eax, dword [ebp+8H]                     ; 1DC5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DC8 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1DCA _ 39. 45, FC
        jc      ?_079                                   ; 1DCD _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1DCF _ 8B. 45, F8
        leave                                           ; 1DD2 _ C9
        ret                                             ; 1DD3 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1DD4 _ 55
        mov     ebp, esp                                ; 1DD5 _ 89. E5
        sub     esp, 16                                 ; 1DD7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1DDA _ C7. 45, FC, 00000000
        jmp     ?_084                                   ; 1DE1 _ E9, 00000084

?_081:  mov     eax, dword [ebp+8H]                     ; 1DE6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1DE9 _ 8B. 55, FC
        add     edx, 2                                  ; 1DEC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1DEF _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1DF3 _ 39. 45, 0C
        ja      ?_083                                   ; 1DF6 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1DF8 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1DFB _ 8B. 55, FC
        add     edx, 2                                  ; 1DFE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E01 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1E04 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1E07 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E0A _ 8B. 55, FC
        add     edx, 2                                  ; 1E0D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1E10 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1E13 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1E16 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E19 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E1C _ 8B. 55, FC
        add     edx, 2                                  ; 1E1F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1E22 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1E25 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E28 _ 8B. 55, FC
        add     edx, 2                                  ; 1E2B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E2E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1E32 _ 2B. 45, 0C
        mov     edx, eax                                ; 1E35 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1E37 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1E3A _ 8B. 4D, FC
        add     ecx, 2                                  ; 1E3D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1E40 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1E44 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1E47 _ 8B. 55, FC
        add     edx, 2                                  ; 1E4A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1E4D _ 8B. 44 D0, 04
        test    eax, eax                                ; 1E51 _ 85. C0
        jnz     ?_082                                   ; 1E53 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1E55 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E58 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1E5A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E5D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E60 _ 89. 10
?_082:  mov     eax, dword [ebp-8H]                     ; 1E62 _ 8B. 45, F8
        jmp     ?_085                                   ; 1E65 _ EB, 16

?_083:  inc     dword [ebp-4H]                          ; 1E67 _ FF. 45, FC
?_084:  mov     eax, dword [ebp+8H]                     ; 1E6A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E6D _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1E6F _ 39. 45, FC
        jc      ?_081                                   ; 1E72 _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 1E78 _ B8, 00000000
?_085:  leave                                           ; 1E7D _ C9
        ret                                             ; 1E7E _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1E7F _ 55
        mov     ebp, esp                                ; 1E80 _ 89. E5
        push    ebx                                     ; 1E82 _ 53
        sub     esp, 16                                 ; 1E83 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1E86 _ C7. 45, F8, 00000000
        jmp     ?_087                                   ; 1E8D _ EB, 14

?_086:  mov     eax, dword [ebp+8H]                     ; 1E8F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E92 _ 8B. 55, F8
        add     edx, 2                                  ; 1E95 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E98 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1E9B _ 39. 45, 0C
        jc      ?_088                                   ; 1E9E _ 72, 0F
        inc     dword [ebp-8H]                          ; 1EA0 _ FF. 45, F8
?_087:  mov     eax, dword [ebp+8H]                     ; 1EA3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EA6 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1EA8 _ 39. 45, F8
        jl      ?_086                                   ; 1EAB _ 7C, E2
        jmp     ?_089                                   ; 1EAD _ EB, 01

?_088:  nop                                             ; 1EAF _ 90
?_089:  cmp     dword [ebp-8H], 0                       ; 1EB0 _ 83. 7D, F8, 00
        jle     ?_091                                   ; 1EB4 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 1EBA _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1EBD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EC0 _ 8B. 45, 08
        add     edx, 2                                  ; 1EC3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1EC6 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1EC9 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1ECC _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1ECF _ 8B. 45, 08
        add     ecx, 2                                  ; 1ED2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1ED5 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1ED9 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1EDB _ 39. 45, 0C
        jne     ?_091                                   ; 1EDE _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1EE4 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1EE7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EEA _ 8B. 45, 08
        add     edx, 2                                  ; 1EED _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1EF0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1EF4 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1EF7 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1EFA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1EFD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F00 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1F03 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1F06 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1F0A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F0D _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1F0F _ 39. 45, F8
        jge     ?_090                                   ; 1F12 _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 1F14 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1F17 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1F1A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F1D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F20 _ 8B. 55, F8
        add     edx, 2                                  ; 1F23 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1F26 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1F29 _ 39. C1
        jnz     ?_090                                   ; 1F2B _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 1F2D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F30 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F33 _ 8B. 45, 08
        add     edx, 2                                  ; 1F36 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1F39 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1F3D _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1F40 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1F43 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1F46 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1F4A _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1F4D _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1F50 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F53 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1F56 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1F59 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1F5D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F60 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1F62 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1F65 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F68 _ 89. 10
?_090:  mov     eax, 0                                  ; 1F6A _ B8, 00000000
        jmp     ?_097                                   ; 1F6F _ E9, 0000011B

?_091:  mov     eax, dword [ebp+8H]                     ; 1F74 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F77 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1F79 _ 39. 45, F8
        jge     ?_092                                   ; 1F7C _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 1F7E _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1F81 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1F84 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1F87 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F8A _ 8B. 55, F8
        add     edx, 2                                  ; 1F8D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1F90 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1F93 _ 39. C1
        jnz     ?_092                                   ; 1F95 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1F97 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F9A _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F9D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1FA0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1FA3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1FA6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FA9 _ 8B. 55, F8
        add     edx, 2                                  ; 1FAC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1FAF _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1FB3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1FB6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1FB9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1FBC _ 8B. 55, F8
        add     edx, 2                                  ; 1FBF _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1FC2 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1FC6 _ B8, 00000000
        jmp     ?_097                                   ; 1FCB _ E9, 000000BF

?_092:  mov     eax, dword [ebp+8H]                     ; 1FD0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FD3 _ 8B. 00
        cmp     eax, 4095                               ; 1FD5 _ 3D, 00000FFF
        jg      ?_096                                   ; 1FDA _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 1FE0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FE3 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1FE5 _ 89. 45, F4
        jmp     ?_094                                   ; 1FE8 _ EB, 27

?_093:  mov     eax, dword [ebp-0CH]                    ; 1FEA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1FED _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1FF0 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1FF3 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1FF6 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1FF9 _ 8B. 45, 08
        add     edx, 2                                  ; 1FFC _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1FFF _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2002 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2004 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2007 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 200A _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 200E _ FF. 4D, F4
?_094:  mov     eax, dword [ebp-0CH]                    ; 2011 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 2014 _ 3B. 45, F8
        jg      ?_093                                   ; 2017 _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 2019 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 201C _ 8B. 00
        lea     edx, [eax+1H]                           ; 201E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2021 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2024 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2026 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2029 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 202C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 202F _ 8B. 00
        cmp     edx, eax                                ; 2031 _ 39. C2
        jge     ?_095                                   ; 2033 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2035 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2038 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 203A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 203D _ 89. 50, 04
?_095:  mov     eax, dword [ebp+8H]                     ; 2040 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2043 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2046 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2049 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 204C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 204F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2052 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 2055 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2058 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 205B _ 89. 54 C8, 04
        mov     eax, 0                                  ; 205F _ B8, 00000000
        jmp     ?_097                                   ; 2064 _ EB, 29

?_096:  mov     eax, dword [ebp+8H]                     ; 2066 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2069 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 206C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 206F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2072 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2075 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2078 _ 8B. 40, 08
        mov     edx, eax                                ; 207B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 207D _ 8B. 45, 10
        add     eax, edx                                ; 2080 _ 01. D0
        mov     edx, eax                                ; 2082 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2084 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2087 _ 89. 50, 08
        mov     eax, 4294967295                         ; 208A _ B8, FFFFFFFF
?_097:  add     esp, 16                                 ; 208F _ 83. C4, 10
        pop     ebx                                     ; 2092 _ 5B
        pop     ebp                                     ; 2093 _ 5D
        ret                                             ; 2094 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2095 _ 55
        mov     ebp, esp                                ; 2096 _ 89. E5
        sub     esp, 16                                 ; 2098 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 209B _ 8B. 45, 0C
        add     eax, 4095                               ; 209E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 20A3 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 20A8 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 20AB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 20AE _ FF. 75, 08
        call    memman_alloc                            ; 20B1 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 20B6 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 20B9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 20BC _ 8B. 45, FC
        leave                                           ; 20BF _ C9
        ret                                             ; 20C0 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 20C1 _ 55
        mov     ebp, esp                                ; 20C2 _ 89. E5
        sub     esp, 16                                 ; 20C4 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 20C7 _ 8B. 45, 10
        add     eax, 4095                               ; 20CA _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 20CF _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 20D4 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 20D7 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 20DA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 20DD _ FF. 75, 08
        call    memman_free                             ; 20E0 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 20E5 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 20E8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 20EB _ 8B. 45, FC
        leave                                           ; 20EE _ C9
        ret                                             ; 20EF _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 20F0 _ 55
        mov     ebp, esp                                ; 20F1 _ 89. E5
        sub     esp, 24                                 ; 20F3 _ 83. EC, 18
        sub     esp, 8                                  ; 20F6 _ 83. EC, 08
        push    9232                                    ; 20F9 _ 68, 00002410
        push    dword [ebp+8H]                          ; 20FE _ FF. 75, 08
        call    memman_alloc_4k                         ; 2101 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2106 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 2109 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 210C _ 83. 7D, F0, 00
        jnz     ?_098                                   ; 2110 _ 75, 0A
        mov     eax, 0                                  ; 2112 _ B8, 00000000
        jmp     ?_102                                   ; 2117 _ E9, 00000099

?_098:  mov     eax, dword [ebp+10H]                    ; 211C _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 211F _ 0F AF. 45, 14
        sub     esp, 8                                  ; 2123 _ 83. EC, 08
        push    eax                                     ; 2126 _ 50
        push    dword [ebp+8H]                          ; 2127 _ FF. 75, 08
        call    memman_alloc_4k                         ; 212A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 212F _ 83. C4, 10
        mov     edx, eax                                ; 2132 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2134 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2137 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 213A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 213D _ 8B. 40, 04
        test    eax, eax                                ; 2140 _ 85. C0
        jnz     ?_099                                   ; 2142 _ 75, 1E
        mov     eax, dword [ebp-10H]                    ; 2144 _ 8B. 45, F0
        sub     esp, 4                                  ; 2147 _ 83. EC, 04
        push    9232                                    ; 214A _ 68, 00002410
        push    eax                                     ; 214F _ 50
        push    dword [ebp+8H]                          ; 2150 _ FF. 75, 08
        call    memman_free_4k                          ; 2153 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2158 _ 83. C4, 10
        mov     eax, 0                                  ; 215B _ B8, 00000000
        jmp     ?_102                                   ; 2160 _ EB, 53

?_099:  mov     eax, dword [ebp-10H]                    ; 2162 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 2165 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2168 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 216A _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 216D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2170 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2173 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 2176 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2179 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 217C _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 217F _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 2186 _ C7. 45, F4, 00000000
        jmp     ?_101                                   ; 218D _ EB, 1A

?_100:  mov     eax, dword [ebp-10H]                    ; 218F _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2192 _ 8B. 55, F4
        add     edx, 33                                 ; 2195 _ 83. C2, 21
        shl     edx, 5                                  ; 2198 _ C1. E2, 05
        add     eax, edx                                ; 219B _ 01. D0
        add     eax, 16                                 ; 219D _ 83. C0, 10
        mov     dword [eax], 0                          ; 21A0 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 21A6 _ FF. 45, F4
?_101:  cmp     dword [ebp-0CH], 255                    ; 21A9 _ 81. 7D, F4, 000000FF
        jle     ?_100                                   ; 21B0 _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 21B2 _ 8B. 45, F0
?_102:  leave                                           ; 21B5 _ C9
        ret                                             ; 21B6 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 21B7 _ 55
        mov     ebp, esp                                ; 21B8 _ 89. E5
        sub     esp, 16                                 ; 21BA _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 21BD _ C7. 45, FC, 00000000
        jmp     ?_105                                   ; 21C4 _ EB, 5A

?_103:  mov     eax, dword [ebp+8H]                     ; 21C6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21C9 _ 8B. 55, FC
        add     edx, 33                                 ; 21CC _ 83. C2, 21
        shl     edx, 5                                  ; 21CF _ C1. E2, 05
        add     eax, edx                                ; 21D2 _ 01. D0
        add     eax, 16                                 ; 21D4 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 21D7 _ 8B. 00
        test    eax, eax                                ; 21D9 _ 85. C0
        jnz     ?_104                                   ; 21DB _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 21DD _ 8B. 45, FC
        shl     eax, 5                                  ; 21E0 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 21E3 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 21E9 _ 8B. 45, 08
        add     eax, edx                                ; 21EC _ 01. D0
        add     eax, 4                                  ; 21EE _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 21F1 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 21F4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21F7 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 21FA _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 21FD _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 2200 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 2204 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 2207 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 220E _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 2211 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2218 _ 8B. 45, F8
        jmp     ?_106                                   ; 221B _ EB, 11

?_104:  inc     dword [ebp-4H]                          ; 221D _ FF. 45, FC
?_105:  cmp     dword [ebp-4H], 255                     ; 2220 _ 81. 7D, FC, 000000FF
        jle     ?_103                                   ; 2227 _ 7E, 9D
        mov     eax, 0                                  ; 2229 _ B8, 00000000
?_106:  leave                                           ; 222E _ C9
        ret                                             ; 222F _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2230 _ 55
        mov     ebp, esp                                ; 2231 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2233 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2236 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2239 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 223B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 223E _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2241 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2244 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2247 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 224A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 224D _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2250 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2253 _ 89. 50, 14
        nop                                             ; 2256 _ 90
        pop     ebp                                     ; 2257 _ 5D
        ret                                             ; 2258 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2259 _ 55
        mov     ebp, esp                                ; 225A _ 89. E5
        push    esi                                     ; 225C _ 56
        push    ebx                                     ; 225D _ 53
        sub     esp, 16                                 ; 225E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2261 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2264 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2267 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 226A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 226D _ 8B. 40, 10
        inc     eax                                     ; 2270 _ 40
        cmp     dword [ebp+10H], eax                    ; 2271 _ 39. 45, 10
        jle     ?_107                                   ; 2274 _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 2276 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2279 _ 8B. 40, 10
        inc     eax                                     ; 227C _ 40
        mov     dword [ebp+10H], eax                    ; 227D _ 89. 45, 10
?_107:  cmp     dword [ebp+10H], -1                     ; 2280 _ 83. 7D, 10, FF
        jge     ?_108                                   ; 2284 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2286 _ C7. 45, 10, FFFFFFFF
?_108:  mov     eax, dword [ebp+0CH]                    ; 228D _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2290 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2293 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 2296 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2299 _ 3B. 45, 10
        jle     ?_115                                   ; 229C _ 0F 8E, 000001D3
        cmp     dword [ebp+10H], 0                      ; 22A2 _ 83. 7D, 10, 00
        js      ?_111                                   ; 22A6 _ 0F 88, 000000E1
        mov     eax, dword [ebp-10H]                    ; 22AC _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 22AF _ 89. 45, F4
        jmp     ?_110                                   ; 22B2 _ EB, 33

?_109:  mov     eax, dword [ebp-0CH]                    ; 22B4 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 22B7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22BA _ 8B. 45, 08
        add     edx, 4                                  ; 22BD _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 22C0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 22C4 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 22C7 _ 8B. 4D, F4
        add     ecx, 4                                  ; 22CA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22CD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 22D1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22D4 _ 8B. 55, F4
        add     edx, 4                                  ; 22D7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22DA _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 22DE _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 22E1 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 22E4 _ FF. 4D, F4
?_110:  mov     eax, dword [ebp-0CH]                    ; 22E7 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 22EA _ 3B. 45, 10
        jg      ?_109                                   ; 22ED _ 7F, C5
        mov     eax, dword [ebp+8H]                     ; 22EF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 22F2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 22F5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 22F8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 22FB _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 22FF _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2302 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2305 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2308 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 230B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 230E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2311 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2314 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2317 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 231A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 231D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2320 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2323 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2326 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2329 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 232C _ 8B. 40, 0C
        sub     esp, 8                                  ; 232F _ 83. EC, 08
        push    esi                                     ; 2332 _ 56
        push    ebx                                     ; 2333 _ 53
        push    ecx                                     ; 2334 _ 51
        push    edx                                     ; 2335 _ 52
        push    eax                                     ; 2336 _ 50
        push    dword [ebp+8H]                          ; 2337 _ FF. 75, 08
        call    sheet_refreshmap                        ; 233A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 233F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2342 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2345 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2348 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 234B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 234E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2351 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2354 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2357 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 235A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 235D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2360 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2363 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2366 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2369 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 236C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 236F _ 8B. 40, 0C
        sub     esp, 4                                  ; 2372 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 2375 _ FF. 75, F0
        push    esi                                     ; 2378 _ 56
        push    ebx                                     ; 2379 _ 53
        push    ecx                                     ; 237A _ 51
        push    edx                                     ; 237B _ 52
        push    eax                                     ; 237C _ 50
        push    dword [ebp+8H]                          ; 237D _ FF. 75, 08
        call    sheet_refreshsub                        ; 2380 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2385 _ 83. C4, 20
        jmp     ?_122                                   ; 2388 _ E9, 00000239

?_111:  mov     eax, dword [ebp+8H]                     ; 238D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2390 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 2393 _ 39. 45, F0
        jge     ?_114                                   ; 2396 _ 7D, 46
        mov     eax, dword [ebp-10H]                    ; 2398 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 239B _ 89. 45, F4
        jmp     ?_113                                   ; 239E _ EB, 33

?_112:  mov     eax, dword [ebp-0CH]                    ; 23A0 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 23A3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23A6 _ 8B. 45, 08
        add     edx, 4                                  ; 23A9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23AC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23B0 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 23B3 _ 8B. 4D, F4
        add     ecx, 4                                  ; 23B6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 23B9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 23BD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23C0 _ 8B. 55, F4
        add     edx, 4                                  ; 23C3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 23C6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 23CA _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 23CD _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 23D0 _ FF. 45, F4
?_113:  mov     eax, dword [ebp+8H]                     ; 23D3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23D6 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 23D9 _ 39. 45, F4
        jl      ?_112                                   ; 23DC _ 7C, C2
?_114:  mov     eax, dword [ebp+8H]                     ; 23DE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23E1 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 23E4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 23E7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 23EA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23ED _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23F0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23F3 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 23F6 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 23F9 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23FC _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23FF _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2402 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2405 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2408 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 240B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 240E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2411 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2414 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2417 _ 83. EC, 08
        push    0                                       ; 241A _ 6A, 00
        push    ebx                                     ; 241C _ 53
        push    ecx                                     ; 241D _ 51
        push    edx                                     ; 241E _ 52
        push    eax                                     ; 241F _ 50
        push    dword [ebp+8H]                          ; 2420 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2423 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2428 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 242B _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 242E _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 2431 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2434 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2437 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 243A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 243D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2440 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2443 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2446 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2449 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 244C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 244F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2452 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2455 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2458 _ 8B. 40, 0C
        sub     esp, 4                                  ; 245B _ 83. EC, 04
        push    esi                                     ; 245E _ 56
        push    0                                       ; 245F _ 6A, 00
        push    ebx                                     ; 2461 _ 53
        push    ecx                                     ; 2462 _ 51
        push    edx                                     ; 2463 _ 52
        push    eax                                     ; 2464 _ 50
        push    dword [ebp+8H]                          ; 2465 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2468 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 246D _ 83. C4, 20
        jmp     ?_122                                   ; 2470 _ E9, 00000151

?_115:  mov     eax, dword [ebp-10H]                    ; 2475 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2478 _ 3B. 45, 10
        jge     ?_122                                   ; 247B _ 0F 8D, 00000145
        cmp     dword [ebp-10H], 0                      ; 2481 _ 83. 7D, F0, 00
        js      ?_118                                   ; 2485 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2487 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 248A _ 89. 45, F4
        jmp     ?_117                                   ; 248D _ EB, 33

?_116:  mov     eax, dword [ebp-0CH]                    ; 248F _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2492 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2495 _ 8B. 45, 08
        add     edx, 4                                  ; 2498 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 249B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 249F _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 24A2 _ 8B. 4D, F4
        add     ecx, 4                                  ; 24A5 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 24A8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 24AC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24AF _ 8B. 55, F4
        add     edx, 4                                  ; 24B2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 24B5 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 24B9 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 24BC _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 24BF _ FF. 45, F4
?_117:  mov     eax, dword [ebp-0CH]                    ; 24C2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 24C5 _ 3B. 45, 10
        jl      ?_116                                   ; 24C8 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 24CA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 24CD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 24D0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 24D3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 24D6 _ 89. 54 88, 04
        jmp     ?_121                                   ; 24DA _ EB, 69

?_118:  mov     eax, dword [ebp+8H]                     ; 24DC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 24DF _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 24E2 _ 89. 45, F4
        jmp     ?_120                                   ; 24E5 _ EB, 37

?_119:  mov     eax, dword [ebp-0CH]                    ; 24E7 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 24EA _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 24ED _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24F0 _ 8B. 55, F4
        add     edx, 4                                  ; 24F3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 24F6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 24FA _ 8B. 45, 08
        add     ecx, 4                                  ; 24FD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2500 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 2504 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2507 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 250A _ 8B. 45, 08
        add     edx, 4                                  ; 250D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2510 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2514 _ 8B. 55, F4
        inc     edx                                     ; 2517 _ 42
        mov     dword [eax+18H], edx                    ; 2518 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 251B _ FF. 4D, F4
?_120:  mov     eax, dword [ebp-0CH]                    ; 251E _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2521 _ 3B. 45, 10
        jge     ?_119                                   ; 2524 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 2526 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2529 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 252C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 252F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2532 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2536 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2539 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 253C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 253F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2542 _ 89. 50, 10
?_121:  mov     eax, dword [ebp+0CH]                    ; 2545 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2548 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 254B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 254E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2551 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2554 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2557 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 255A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 255D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2560 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2563 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2566 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2569 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 256C _ 8B. 40, 0C
        sub     esp, 8                                  ; 256F _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2572 _ FF. 75, 10
        push    ebx                                     ; 2575 _ 53
        push    ecx                                     ; 2576 _ 51
        push    edx                                     ; 2577 _ 52
        push    eax                                     ; 2578 _ 50
        push    dword [ebp+8H]                          ; 2579 _ FF. 75, 08
        call    sheet_refreshmap                        ; 257C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2581 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2584 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2587 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 258A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 258D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2590 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2593 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2596 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2599 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 259C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 259F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 25A2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25A5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25A8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25AB _ 8B. 40, 0C
        sub     esp, 4                                  ; 25AE _ 83. EC, 04
        push    dword [ebp+10H]                         ; 25B1 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 25B4 _ FF. 75, 10
        push    ebx                                     ; 25B7 _ 53
        push    ecx                                     ; 25B8 _ 51
        push    edx                                     ; 25B9 _ 52
        push    eax                                     ; 25BA _ 50
        push    dword [ebp+8H]                          ; 25BB _ FF. 75, 08
        call    sheet_refreshsub                        ; 25BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25C3 _ 83. C4, 20
?_122:  nop                                             ; 25C6 _ 90
        lea     esp, [ebp-8H]                           ; 25C7 _ 8D. 65, F8
        pop     ebx                                     ; 25CA _ 5B
        pop     esi                                     ; 25CB _ 5E
        pop     ebp                                     ; 25CC _ 5D
        ret                                             ; 25CD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 25CE _ 55
        mov     ebp, esp                                ; 25CF _ 89. E5
        push    edi                                     ; 25D1 _ 57
        push    esi                                     ; 25D2 _ 56
        push    ebx                                     ; 25D3 _ 53
        sub     esp, 28                                 ; 25D4 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 25D7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25DA _ 8B. 40, 18
        test    eax, eax                                ; 25DD _ 85. C0
        js      ?_123                                   ; 25DF _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 25E1 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 25E4 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 25E7 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 25EA _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 25ED _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25F0 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 25F3 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 25F6 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 25F9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 25FC _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 25FF _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2602 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2605 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2608 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 260B _ 8B. 45, 14
        add     edx, eax                                ; 260E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2610 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2613 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2616 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2619 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 261C _ 03. 45, E4
        sub     esp, 4                                  ; 261F _ 83. EC, 04
        push    ebx                                     ; 2622 _ 53
        push    ecx                                     ; 2623 _ 51
        push    edi                                     ; 2624 _ 57
        push    esi                                     ; 2625 _ 56
        push    edx                                     ; 2626 _ 52
        push    eax                                     ; 2627 _ 50
        push    dword [ebp+8H]                          ; 2628 _ FF. 75, 08
        call    sheet_refreshsub                        ; 262B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2630 _ 83. C4, 20
?_123:  mov     eax, 0                                  ; 2633 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2638 _ 8D. 65, F4
        pop     ebx                                     ; 263B _ 5B
        pop     esi                                     ; 263C _ 5E
        pop     edi                                     ; 263D _ 5F
        pop     ebp                                     ; 263E _ 5D
        ret                                             ; 263F _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2640 _ 55
        mov     ebp, esp                                ; 2641 _ 89. E5
        push    esi                                     ; 2643 _ 56
        push    ebx                                     ; 2644 _ 53
        sub     esp, 16                                 ; 2645 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2648 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 264B _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 264E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2651 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2654 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2657 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 265A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 265D _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2660 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2663 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2666 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2669 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 266C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 266F _ 8B. 40, 18
        test    eax, eax                                ; 2672 _ 85. C0
        js      ?_124                                   ; 2674 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 267A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 267D _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2680 _ 8B. 45, F0
        add     edx, eax                                ; 2683 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2685 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2688 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 268B _ 8B. 45, F4
        add     eax, ecx                                ; 268E _ 01. C8
        sub     esp, 8                                  ; 2690 _ 83. EC, 08
        push    0                                       ; 2693 _ 6A, 00
        push    edx                                     ; 2695 _ 52
        push    eax                                     ; 2696 _ 50
        push    dword [ebp-10H]                         ; 2697 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 269A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 269D _ FF. 75, 08
        call    sheet_refreshmap                        ; 26A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26A5 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 26A8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26AB _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 26AE _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 26B1 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 26B4 _ 8B. 55, 14
        add     ecx, edx                                ; 26B7 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 26B9 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 26BC _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 26BF _ 8B. 55, 10
        add     edx, ebx                                ; 26C2 _ 01. DA
        sub     esp, 8                                  ; 26C4 _ 83. EC, 08
        push    eax                                     ; 26C7 _ 50
        push    ecx                                     ; 26C8 _ 51
        push    edx                                     ; 26C9 _ 52
        push    dword [ebp+14H]                         ; 26CA _ FF. 75, 14
        push    dword [ebp+10H]                         ; 26CD _ FF. 75, 10
        push    dword [ebp+8H]                          ; 26D0 _ FF. 75, 08
        call    sheet_refreshmap                        ; 26D3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26D8 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 26DB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26DE _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 26E1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 26E4 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 26E7 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 26EA _ 8B. 45, F0
        add     edx, eax                                ; 26ED _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 26EF _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 26F2 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 26F5 _ 8B. 45, F4
        add     eax, ebx                                ; 26F8 _ 01. D8
        sub     esp, 4                                  ; 26FA _ 83. EC, 04
        push    ecx                                     ; 26FD _ 51
        push    0                                       ; 26FE _ 6A, 00
        push    edx                                     ; 2700 _ 52
        push    eax                                     ; 2701 _ 50
        push    dword [ebp-10H]                         ; 2702 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2705 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2708 _ FF. 75, 08
        call    sheet_refreshsub                        ; 270B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2710 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2713 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2716 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2719 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 271C _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 271F _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2722 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2725 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2728 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 272A _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 272D _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2730 _ 8B. 4D, 10
        add     ecx, esi                                ; 2733 _ 01. F1
        sub     esp, 4                                  ; 2735 _ 83. EC, 04
        push    edx                                     ; 2738 _ 52
        push    eax                                     ; 2739 _ 50
        push    ebx                                     ; 273A _ 53
        push    ecx                                     ; 273B _ 51
        push    dword [ebp+14H]                         ; 273C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 273F _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2742 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2745 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 274A _ 83. C4, 20
?_124:  nop                                             ; 274D _ 90
        lea     esp, [ebp-8H]                           ; 274E _ 8D. 65, F8
        pop     ebx                                     ; 2751 _ 5B
        pop     esi                                     ; 2752 _ 5E
        pop     ebp                                     ; 2753 _ 5D
        ret                                             ; 2754 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2755 _ 55
        mov     ebp, esp                                ; 2756 _ 89. E5
        sub     esp, 48                                 ; 2758 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 275B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 275E _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2760 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2763 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2766 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2769 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 276C _ 83. 7D, 0C, 00
        jns     ?_125                                   ; 2770 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2772 _ C7. 45, 0C, 00000000
?_125:  cmp     dword [ebp+10H], 8                      ; 2779 _ 83. 7D, 10, 08
        jg      ?_126                                   ; 277D _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 277F _ C7. 45, 10, 00000000
?_126:  mov     eax, dword [ebp+8H]                     ; 2786 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2789 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 278C _ 39. 45, 14
        jle     ?_127                                   ; 278F _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2791 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2794 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2797 _ 89. 45, 14
?_127:  mov     eax, dword [ebp+8H]                     ; 279A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 279D _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 27A0 _ 39. 45, 18
        jle     ?_128                                   ; 27A3 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27A5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27A8 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 27AB _ 89. 45, 18
?_128:  mov     eax, dword [ebp+1CH]                    ; 27AE _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 27B1 _ 89. 45, FC
        jmp     ?_135                                   ; 27B4 _ E9, 0000010E

?_129:  mov     eax, dword [ebp+8H]                     ; 27B9 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 27BC _ 8B. 55, FC
        add     edx, 4                                  ; 27BF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27C2 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 27C6 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 27C9 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 27CC _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 27CE _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 27D1 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 27D4 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 27DA _ 8B. 45, E8
        sub     eax, edx                                ; 27DD _ 29. D0
        sar     eax, 5                                  ; 27DF _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 27E2 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 27E5 _ C7. 45, F4, 00000000
        jmp     ?_134                                   ; 27EC _ E9, 000000C4

?_130:  mov     eax, dword [ebp-18H]                    ; 27F1 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 27F4 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 27F7 _ 8B. 45, F4
        add     eax, edx                                ; 27FA _ 01. D0
        mov     dword [ebp-24H], eax                    ; 27FC _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 27FF _ C7. 45, F8, 00000000
        jmp     ?_133                                   ; 2806 _ E9, 00000098

?_131:  mov     eax, dword [ebp-18H]                    ; 280B _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 280E _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2811 _ 8B. 45, F8
        add     eax, edx                                ; 2814 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2816 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2819 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 281C _ 3B. 45, D8
        jg      ?_132                                   ; 281F _ 7F, 7F
        mov     eax, dword [ebp-28H]                    ; 2821 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2824 _ 3B. 45, 14
        jge     ?_132                                   ; 2827 _ 7D, 77
        mov     eax, dword [ebp+10H]                    ; 2829 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 282C _ 3B. 45, DC
        jg      ?_132                                   ; 282F _ 7F, 6F
        mov     eax, dword [ebp-24H]                    ; 2831 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2834 _ 3B. 45, 18
        jge     ?_132                                   ; 2837 _ 7D, 67
        mov     eax, dword [ebp-18H]                    ; 2839 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 283C _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 283F _ 0F AF. 45, F4
        mov     edx, eax                                ; 2843 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2845 _ 8B. 45, F8
        add     eax, edx                                ; 2848 _ 01. D0
        mov     edx, eax                                ; 284A _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 284C _ 8B. 45, E4
        add     eax, edx                                ; 284F _ 01. D0
        mov     al, byte [eax]                          ; 2851 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2853 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2856 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2859 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 285C _ 0F AF. 45, DC
        mov     edx, eax                                ; 2860 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2862 _ 8B. 45, D8
        add     eax, edx                                ; 2865 _ 01. D0
        mov     edx, eax                                ; 2867 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2869 _ 8B. 45, EC
        add     eax, edx                                ; 286C _ 01. D0
        mov     al, byte [eax]                          ; 286E _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2870 _ 38. 45, E3
        jnz     ?_132                                   ; 2873 _ 75, 2B
        movzx   edx, byte [ebp-29H]                     ; 2875 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2879 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 287C _ 8B. 40, 14
        cmp     edx, eax                                ; 287F _ 39. C2
        jz      ?_132                                   ; 2881 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2883 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2886 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2889 _ 0F AF. 45, DC
        mov     edx, eax                                ; 288D _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 288F _ 8B. 45, D8
        add     eax, edx                                ; 2892 _ 01. D0
        mov     edx, eax                                ; 2894 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2896 _ 8B. 45, F0
        add     edx, eax                                ; 2899 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 289B _ 8A. 45, D7
        mov     byte [edx], al                          ; 289E _ 88. 02
?_132:  inc     dword [ebp-8H]                          ; 28A0 _ FF. 45, F8
?_133:  mov     eax, dword [ebp-18H]                    ; 28A3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 28A6 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 28A9 _ 39. 45, F8
        jl      ?_131                                   ; 28AC _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 28B2 _ FF. 45, F4
?_134:  mov     eax, dword [ebp-18H]                    ; 28B5 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 28B8 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 28BB _ 39. 45, F4
        jl      ?_130                                   ; 28BE _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 28C4 _ FF. 45, FC
?_135:  mov     eax, dword [ebp-4H]                     ; 28C7 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 28CA _ 3B. 45, 20
        jle     ?_129                                   ; 28CD _ 0F 8E, FFFFFEE6
        nop                                             ; 28D3 _ 90
        nop                                             ; 28D4 _ 90
        leave                                           ; 28D5 _ C9
        ret                                             ; 28D6 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 28D7 _ 55
        mov     ebp, esp                                ; 28D8 _ 89. E5
        sub     esp, 64                                 ; 28DA _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 28DD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28E0 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 28E3 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 28E6 _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 28EA _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 28EC _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 28F3 _ 83. 7D, 10, 00
        jns     ?_137                                   ; 28F7 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 28F9 _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 2900 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2903 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2906 _ 39. 45, 14
        jle     ?_138                                   ; 2909 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 290B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 290E _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2911 _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 2914 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2917 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 291A _ 39. 45, 18
        jle     ?_139                                   ; 291D _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 291F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2922 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2925 _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 2928 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 292B _ 89. 45, FC
        jmp     ?_150                                   ; 292E _ E9, 00000137

?_140:  mov     eax, dword [ebp+8H]                     ; 2933 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2936 _ 8B. 55, FC
        add     edx, 4                                  ; 2939 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 293C _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2940 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2943 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2946 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 294C _ 8B. 45, DC
        sub     eax, edx                                ; 294F _ 29. D0
        sar     eax, 5                                  ; 2951 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2954 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2957 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 295A _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 295C _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 295F _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2962 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2965 _ 8B. 55, 0C
        sub     edx, eax                                ; 2968 _ 29. C2
        mov     eax, edx                                ; 296A _ 89. D0
        mov     dword [ebp-10H], eax                    ; 296C _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 296F _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2972 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2975 _ 8B. 55, 10
        sub     edx, eax                                ; 2978 _ 29. C2
        mov     eax, edx                                ; 297A _ 89. D0
        mov     dword [ebp-14H], eax                    ; 297C _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 297F _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2982 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2985 _ 8B. 55, 14
        sub     edx, eax                                ; 2988 _ 29. C2
        mov     eax, edx                                ; 298A _ 89. D0
        mov     dword [ebp-18H], eax                    ; 298C _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 298F _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2992 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2995 _ 8B. 55, 18
        sub     edx, eax                                ; 2998 _ 29. C2
        mov     eax, edx                                ; 299A _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 299C _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 299F _ 83. 7D, F0, 00
        jns     ?_141                                   ; 29A3 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 29A5 _ C7. 45, F0, 00000000
?_141:  cmp     dword [ebp-14H], 0                      ; 29AC _ 83. 7D, EC, 00
        jns     ?_142                                   ; 29B0 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 29B2 _ C7. 45, EC, 00000000
?_142:  mov     eax, dword [ebp-24H]                    ; 29B9 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 29BC _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 29BF _ 39. 45, E8
        jle     ?_143                                   ; 29C2 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 29C4 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 29C7 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 29CA _ 89. 45, E8
?_143:  mov     eax, dword [ebp-24H]                    ; 29CD _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 29D0 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 29D3 _ 39. 45, E4
        jle     ?_144                                   ; 29D6 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 29D8 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 29DB _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 29DE _ 89. 45, E4
?_144:  mov     eax, dword [ebp-14H]                    ; 29E1 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 29E4 _ 89. 45, F4
        jmp     ?_149                                   ; 29E7 _ EB, 76

?_145:  mov     eax, dword [ebp-24H]                    ; 29E9 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 29EC _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 29EF _ 8B. 45, F4
        add     eax, edx                                ; 29F2 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 29F4 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 29F7 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 29FA _ 89. 45, F8
        jmp     ?_148                                   ; 29FD _ EB, 55

?_146:  mov     eax, dword [ebp-24H]                    ; 29FF _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2A02 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2A05 _ 8B. 45, F8
        add     eax, edx                                ; 2A08 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2A0A _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2A0D _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2A10 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2A13 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2A17 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2A19 _ 8B. 45, F8
        add     eax, edx                                ; 2A1C _ 01. D0
        mov     edx, eax                                ; 2A1E _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2A20 _ 8B. 45, D4
        add     eax, edx                                ; 2A23 _ 01. D0
        mov     al, byte [eax]                          ; 2A25 _ 8A. 00
        movzx   edx, al                                 ; 2A27 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2A2A _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2A2D _ 8B. 40, 14
        cmp     edx, eax                                ; 2A30 _ 39. C2
        jz      ?_147                                   ; 2A32 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2A34 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A37 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2A3A _ 0F AF. 45, D0
        mov     edx, eax                                ; 2A3E _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2A40 _ 8B. 45, CC
        add     eax, edx                                ; 2A43 _ 01. D0
        mov     edx, eax                                ; 2A45 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2A47 _ 8B. 45, E0
        add     edx, eax                                ; 2A4A _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2A4C _ 8A. 45, DB
        mov     byte [edx], al                          ; 2A4F _ 88. 02
?_147:  inc     dword [ebp-8H]                          ; 2A51 _ FF. 45, F8
?_148:  mov     eax, dword [ebp-8H]                     ; 2A54 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2A57 _ 3B. 45, E8
        jl      ?_146                                   ; 2A5A _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2A5C _ FF. 45, F4
?_149:  mov     eax, dword [ebp-0CH]                    ; 2A5F _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2A62 _ 3B. 45, E4
        jl      ?_145                                   ; 2A65 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2A67 _ FF. 45, FC
?_150:  mov     eax, dword [ebp+8H]                     ; 2A6A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A6D _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2A70 _ 39. 45, FC
        jle     ?_140                                   ; 2A73 _ 0F 8E, FFFFFEBA
        nop                                             ; 2A79 _ 90
        leave                                           ; 2A7A _ C9
        ret                                             ; 2A7B _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2A7C _ 55
        mov     ebp, esp                                ; 2A7D _ 89. E5
        sub     esp, 24                                 ; 2A7F _ 83. EC, 18
        sub     esp, 8                                  ; 2A82 _ 83. EC, 08
        push    52                                      ; 2A85 _ 6A, 34
        push    67                                      ; 2A87 _ 6A, 43
        call    io_out8                                 ; 2A89 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A8E _ 83. C4, 10
        sub     esp, 8                                  ; 2A91 _ 83. EC, 08
        push    156                                     ; 2A94 _ 68, 0000009C
        push    64                                      ; 2A99 _ 6A, 40
        call    io_out8                                 ; 2A9B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2AA0 _ 83. C4, 10
        sub     esp, 8                                  ; 2AA3 _ 83. EC, 08
        push    46                                      ; 2AA6 _ 6A, 2E
        push    64                                      ; 2AA8 _ 6A, 40
        call    io_out8                                 ; 2AAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2AAF _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2AB2 _ C7. 05, 00000360(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2ABC _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 2AC3 _ EB, 14

?_151:  mov     eax, dword [ebp-0CH]                    ; 2AC5 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AC8 _ C1. E0, 04
        add     eax, ?_214                              ; 2ACB _ 05, 00000368(d)
        mov     dword [eax], 0                          ; 2AD0 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2AD6 _ FF. 45, F4
?_152:  cmp     dword [ebp-0CH], 499                    ; 2AD9 _ 81. 7D, F4, 000001F3
        jle     ?_151                                   ; 2AE0 _ 7E, E3
        nop                                             ; 2AE2 _ 90
        nop                                             ; 2AE3 _ 90
        leave                                           ; 2AE4 _ C9
        ret                                             ; 2AE5 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2AE6 _ 55
        mov     ebp, esp                                ; 2AE7 _ 89. E5
        sub     esp, 16                                 ; 2AE9 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2AEC _ C7. 45, FC, 00000000
        jmp     ?_155                                   ; 2AF3 _ EB, 35

?_153:  mov     eax, dword [ebp-4H]                     ; 2AF5 _ 8B. 45, FC
        shl     eax, 4                                  ; 2AF8 _ C1. E0, 04
        add     eax, ?_214                              ; 2AFB _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2B00 _ 8B. 00
        test    eax, eax                                ; 2B02 _ 85. C0
        jnz     ?_154                                   ; 2B04 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2B06 _ 8B. 45, FC
        shl     eax, 4                                  ; 2B09 _ C1. E0, 04
        add     eax, ?_214                              ; 2B0C _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2B11 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2B17 _ 8B. 45, FC
        shl     eax, 4                                  ; 2B1A _ C1. E0, 04
        add     eax, timerctl                           ; 2B1D _ 05, 00000360(d)
        add     eax, 4                                  ; 2B22 _ 83. C0, 04
        jmp     ?_156                                   ; 2B25 _ EB, 11

?_154:  inc     dword [ebp-4H]                          ; 2B27 _ FF. 45, FC
?_155:  cmp     dword [ebp-4H], 499                     ; 2B2A _ 81. 7D, FC, 000001F3
        jle     ?_153                                   ; 2B31 _ 7E, C2
        mov     eax, 0                                  ; 2B33 _ B8, 00000000
?_156:  leave                                           ; 2B38 _ C9
        ret                                             ; 2B39 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2B3A _ 55
        mov     ebp, esp                                ; 2B3B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B3D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B40 _ C7. 40, 04, 00000000
        nop                                             ; 2B47 _ 90
        pop     ebp                                     ; 2B48 _ 5D
        ret                                             ; 2B49 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2B4A _ 55
        mov     ebp, esp                                ; 2B4B _ 89. E5
        sub     esp, 4                                  ; 2B4D _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2B50 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2B53 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B56 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B59 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2B5C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B5F _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2B62 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2B65 _ 88. 50, 0C
        nop                                             ; 2B68 _ 90
        leave                                           ; 2B69 _ C9
        ret                                             ; 2B6A _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2B6B _ 55
        mov     ebp, esp                                ; 2B6C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B6E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B71 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2B74 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2B76 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2B79 _ C7. 40, 04, 00000002
        nop                                             ; 2B80 _ 90
        pop     ebp                                     ; 2B81 _ 5D
        ret                                             ; 2B82 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2B83 _ 55
        mov     ebp, esp                                ; 2B84 _ 89. E5
        sub     esp, 24                                 ; 2B86 _ 83. EC, 18
        sub     esp, 8                                  ; 2B89 _ 83. EC, 08
        push    32                                      ; 2B8C _ 6A, 20
        push    32                                      ; 2B8E _ 6A, 20
        call    io_out8                                 ; 2B90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B95 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2B98 _ A1, 00000360(d)
        inc     eax                                     ; 2B9D _ 40
        mov     dword [timerctl], eax                   ; 2B9E _ A3, 00000360(d)
        mov     dword [ebp-0CH], 0                      ; 2BA3 _ C7. 45, F4, 00000000
        jmp     ?_159                                   ; 2BAA _ EB, 7E

?_157:  mov     eax, dword [ebp-0CH]                    ; 2BAC _ 8B. 45, F4
        shl     eax, 4                                  ; 2BAF _ C1. E0, 04
        add     eax, ?_214                              ; 2BB2 _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2BB7 _ 8B. 00
        cmp     eax, 2                                  ; 2BB9 _ 83. F8, 02
        jnz     ?_158                                   ; 2BBC _ 75, 69
        mov     eax, dword [ebp-0CH]                    ; 2BBE _ 8B. 45, F4
        shl     eax, 4                                  ; 2BC1 _ C1. E0, 04
        add     eax, ?_213                              ; 2BC4 _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2BC9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2BCB _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2BCE _ 8B. 45, F4
        shl     eax, 4                                  ; 2BD1 _ C1. E0, 04
        add     eax, ?_213                              ; 2BD4 _ 05, 00000364(d)
        mov     dword [eax], edx                        ; 2BD9 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2BDB _ 8B. 45, F4
        shl     eax, 4                                  ; 2BDE _ C1. E0, 04
        add     eax, ?_213                              ; 2BE1 _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2BE6 _ 8B. 00
        test    eax, eax                                ; 2BE8 _ 85. C0
        jnz     ?_158                                   ; 2BEA _ 75, 3B
        mov     eax, dword [ebp-0CH]                    ; 2BEC _ 8B. 45, F4
        shl     eax, 4                                  ; 2BEF _ C1. E0, 04
        add     eax, ?_214                              ; 2BF2 _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2BF7 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2BFD _ 8B. 45, F4
        shl     eax, 4                                  ; 2C00 _ C1. E0, 04
        add     eax, ?_216                              ; 2C03 _ 05, 00000370(d)
        mov     al, byte [eax]                          ; 2C08 _ 8A. 00
        movzx   edx, al                                 ; 2C0A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2C0D _ 8B. 45, F4
        shl     eax, 4                                  ; 2C10 _ C1. E0, 04
        add     eax, ?_215                              ; 2C13 _ 05, 0000036C(d)
        mov     eax, dword [eax]                        ; 2C18 _ 8B. 00
        sub     esp, 8                                  ; 2C1A _ 83. EC, 08
        push    edx                                     ; 2C1D _ 52
        push    eax                                     ; 2C1E _ 50
        call    fifo8_put                               ; 2C1F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C24 _ 83. C4, 10
?_158:  inc     dword [ebp-0CH]                         ; 2C27 _ FF. 45, F4
?_159:  cmp     dword [ebp-0CH], 499                    ; 2C2A _ 81. 7D, F4, 000001F3
        jle     ?_157                                   ; 2C31 _ 0F 8E, FFFFFF75
        nop                                             ; 2C37 _ 90
        leave                                           ; 2C38 _ C9
        ret                                             ; 2C39 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2C3A _ 55
        mov     ebp, esp                                ; 2C3B _ 89. E5
        mov     eax, timerctl                           ; 2C3D _ B8, 00000360(d)
        pop     ebp                                     ; 2C42 _ 5D
        ret                                             ; 2C43 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2C44 _ 55
        mov     ebp, esp                                ; 2C45 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2C47 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C4A _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2C4D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2C50 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2C53 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2C56 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2C58 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C5B _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2C5E _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C61 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2C64 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C6B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C6E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C75 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2C78 _ C7. 40, 08, 00000000
        nop                                             ; 2C7F _ 90
        pop     ebp                                     ; 2C80 _ 5D
        ret                                             ; 2C81 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2C82 _ 55
        mov     ebp, esp                                ; 2C83 _ 89. E5
        sub     esp, 4                                  ; 2C85 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2C88 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2C8B _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C8E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C91 _ 8B. 40, 10
        test    eax, eax                                ; 2C94 _ 85. C0
        jnz     ?_160                                   ; 2C96 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2C98 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2C9B _ 8B. 40, 14
        or      eax, 01H                                ; 2C9E _ 83. C8, 01
        mov     edx, eax                                ; 2CA1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2CA3 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2CA6 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2CA9 _ B8, FFFFFFFF
        jmp     ?_162                                   ; 2CAE _ EB, 4F

?_160:  mov     eax, dword [ebp+8H]                     ; 2CB0 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2CB3 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2CB5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2CB8 _ 8B. 40, 04
        add     edx, eax                                ; 2CBB _ 01. C2
        mov     al, byte [ebp-4H]                       ; 2CBD _ 8A. 45, FC
        mov     byte [edx], al                          ; 2CC0 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2CC2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2CC5 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2CC8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CCB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2CCE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2CD1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2CD4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2CD7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CDA _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CDD _ 39. C2
        jnz     ?_161                                   ; 2CDF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2CE1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2CE4 _ C7. 40, 04, 00000000
?_161:  mov     eax, dword [ebp+8H]                     ; 2CEB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CEE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2CF1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2CF4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2CF7 _ 89. 50, 10
        mov     eax, 0                                  ; 2CFA _ B8, 00000000
?_162:  leave                                           ; 2CFF _ C9
        ret                                             ; 2D00 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2D01 _ 55
        mov     ebp, esp                                ; 2D02 _ 89. E5
        sub     esp, 16                                 ; 2D04 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2D07 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2D0A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2D0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D10 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D13 _ 39. C2
        jnz     ?_163                                   ; 2D15 _ 75, 07
        mov     eax, 4294967295                         ; 2D17 _ B8, FFFFFFFF
        jmp     ?_165                                   ; 2D1C _ EB, 50

?_163:  mov     eax, dword [ebp+8H]                     ; 2D1E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2D21 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2D23 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D26 _ 8B. 40, 08
        add     eax, edx                                ; 2D29 _ 01. D0
        mov     al, byte [eax]                          ; 2D2B _ 8A. 00
        movzx   eax, al                                 ; 2D2D _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2D30 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2D33 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D36 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2D39 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D3C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D3F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D42 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2D45 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2D48 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D4B _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D4E _ 39. C2
        jnz     ?_164                                   ; 2D50 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2D52 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2D55 _ C7. 40, 08, 00000000
?_164:  mov     eax, dword [ebp+8H]                     ; 2D5C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D5F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2D62 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D65 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2D68 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2D6B _ 8B. 45, FC
?_165:  leave                                           ; 2D6E _ C9
        ret                                             ; 2D6F _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2D70 _ 55
        mov     ebp, esp                                ; 2D71 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2D73 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2D76 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D79 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D7C _ 8B. 40, 10
        sub     edx, eax                                ; 2D7F _ 29. C2
        mov     eax, edx                                ; 2D81 _ 89. D0
        pop     ebp                                     ; 2D83 _ 5D
        ret                                             ; 2D84 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2D85 _ 55
        mov     ebp, esp                                ; 2D86 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2D88 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_166                                   ; 2D8F _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2D91 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2D98 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2D9B _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2D9E _ 89. 45, 0C
?_166:  mov     eax, dword [ebp+0CH]                    ; 2DA1 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2DA4 _ 8B. 55, 08
        mov     word [edx], ax                          ; 2DA7 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2DAA _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2DAD _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2DB0 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2DB4 _ 8B. 45, 10
        sar     eax, 16                                 ; 2DB7 _ C1. F8, 10
        mov     dl, al                                  ; 2DBA _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2DBC _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2DBF _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2DC2 _ 8B. 45, 14
        mov     dl, al                                  ; 2DC5 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2DC7 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2DCA _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2DCD _ 8B. 45, 0C
        shr     eax, 16                                 ; 2DD0 _ C1. E8, 10
        and     eax, 0FH                                ; 2DD3 _ 83. E0, 0F
        mov     dl, al                                  ; 2DD6 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2DD8 _ 8B. 45, 14
        sar     eax, 8                                  ; 2DDB _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2DDE _ 83. E0, F0
        or      eax, edx                                ; 2DE1 _ 09. D0
        mov     dl, al                                  ; 2DE3 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2DE5 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2DE8 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2DEB _ 8B. 45, 10
        shr     eax, 24                                 ; 2DEE _ C1. E8, 18
        mov     dl, al                                  ; 2DF1 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2DF3 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2DF6 _ 88. 50, 07
        nop                                             ; 2DF9 _ 90
        pop     ebp                                     ; 2DFA _ 5D
        ret                                             ; 2DFB _ C3
; set_segmdesc End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_167:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_168:                                                  ; byte
        db 73H, 77H, 69H, 74H, 63H, 68H, 20H, 74H       ; 0008 _ switch t
        db 6FH, 20H, 74H, 61H, 73H, 6BH, 20H, 62H       ; 0010 _ o task b
        db 00H                                          ; 0018 _ .

?_169:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0019 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0021 _ sk b.

?_170:                                                  ; byte
        db 73H, 77H, 69H, 74H, 63H, 68H, 20H, 62H       ; 0026 _ switch b
        db 61H, 63H, 6BH, 00H                           ; 002E _ ack.

?_171:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0032 _ page is:
        db 20H, 00H                                     ; 003A _  .

?_172:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003C _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0044 _ L: .

?_173:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0048 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0050 _ H: .

?_174:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0054 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 005C _ w: .

?_175:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0060 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0068 _ gh: .

?_176:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 006D _ type: .


SECTION .data   align=32 noexecute                      ; section number 3, data

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

?_177:  db 00H                                          ; 0076 _ .

?_178:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1883:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1930:                                            ; byte
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

closebtn.2042:                                          ; byte
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


SECTION .bss    align=32 noexecute                      ; section number 4, bss

bootInfo:                                               ; qword
        resb    4                                       ; 0000

?_179:                                                  ; dword
        resb    2                                       ; 0004

?_180:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

mouseinfo:                                              ; byte
        resb    32                                      ; 0020

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_181:  resd    1                                       ; 00EC

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

shtMsgBox:                                              ; dword
        resd    1                                       ; 0240

shtctl: resd    1                                       ; 0244

sht_back: resd  1                                       ; 0248

sht_mouse:                                              ; dword
        resd    5                                       ; 024C

tss_a.1819:                                             ; byte
        resb    28                                      ; 0260

?_182:  resd    2                                       ; 027C

?_183:  resd    5                                       ; 0284

?_184:  resd    4                                       ; 0298

?_185:  resd    1                                       ; 02A8

?_186:  resd    1                                       ; 02AC

?_187:  resd    1                                       ; 02B0

?_188:  resd    1                                       ; 02B4

?_189:  resd    1                                       ; 02B8

?_190:  resd    1                                       ; 02BC

?_191:  resd    1                                       ; 02C0

?_192:  resd    7                                       ; 02C4

tss_b.1820:                                             ; byte
        resb    32                                      ; 02E0

?_193:  resd    1                                       ; 0300

?_194:  resd    1                                       ; 0304

?_195:  resd    1                                       ; 0308

?_196:  resd    1                                       ; 030C

?_197:  resd    1                                       ; 0310

?_198:  resd    1                                       ; 0314

?_199:  resd    1                                       ; 0318

?_200:  resd    1                                       ; 031C

?_201:  resd    1                                       ; 0320

?_202:  resd    1                                       ; 0324

?_203:  resd    1                                       ; 0328

?_204:  resd    1                                       ; 032C

?_205:  resd    1                                       ; 0330

?_206:  resd    1                                       ; 0334

?_207:  resd    1                                       ; 0338

?_208:  resd    1                                       ; 033C

?_209:  resd    1                                       ; 0340

?_210:  resd    1                                       ; 0344

str.1978:                                               ; byte
        resb    1                                       ; 0348

?_211:  resb    9                                       ; 0349

?_212:  resb    14                                      ; 0352

timerctl:                                               ; byte
        resd    1                                       ; 0360

?_213:                                                  ; byte
        resb    4                                       ; 0364

?_214:                                                  ; byte
        resb    4                                       ; 0368

?_215:                                                  ; byte
        resb    4                                       ; 036C

?_216:                                                  ; byte
        resb    7988                                    ; 0370


