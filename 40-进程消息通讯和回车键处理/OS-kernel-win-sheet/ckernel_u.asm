; Disassembly of file: ckernel.o
; Tue Feb  2 16:43:13 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global set_cursor: function
global isSpecialKey: function
global transferScanCode: function
global launch_console: function
global console_task: function
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
global make_wtitle8: function
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
global get_taskctl: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switchsub: function
global send_message: function
global memman
global key_shift
global caps_lock

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
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
        sub     esp, 116                                ; 0004 _ 83. EC, 74
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000008(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000008(d)
        mov     dword [ebp-1CH], eax                    ; 001C _ 89. 45, E4
        mov     eax, dword [?_237]                      ; 001F _ A1, 0000000C(d)
        cwde                                            ; 0024 _ 98
        mov     dword [xsize], eax                      ; 0025 _ A3, 0000013C(d)
        mov     ax, word [?_238]                        ; 002A _ 66: A1, 0000000E(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ysize], eax                      ; 0031 _ A3, 00000140(d)
        call    init_pit                                ; 0036 _ E8, FFFFFFFC(rel)
        push    0                                       ; 003B _ 6A, 00
        push    timerbuf                                ; 003D _ 68, 0000012C(d)
        push    8                                       ; 0042 _ 6A, 08
        push    timerinfo                               ; 0044 _ 68, 00000110(d)
        call    fifo8_init                              ; 0049 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 004E _ 83. C4, 10
        call    timer_alloc                             ; 0051 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0056 _ 89. 45, E0
        sub     esp, 4                                  ; 0059 _ 83. EC, 04
        push    10                                      ; 005C _ 6A, 0A
        push    timerinfo                               ; 005E _ 68, 00000110(d)
        push    dword [ebp-20H]                         ; 0063 _ FF. 75, E0
        call    timer_init                              ; 0066 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006B _ 83. C4, 10
        sub     esp, 8                                  ; 006E _ 83. EC, 08
        push    100                                     ; 0071 _ 6A, 64
        push    dword [ebp-20H]                         ; 0073 _ FF. 75, E0
        call    timer_settime                           ; 0076 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007B _ 83. C4, 10
        call    timer_alloc                             ; 007E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0083 _ 89. 45, DC
        sub     esp, 4                                  ; 0086 _ 83. EC, 04
        push    2                                       ; 0089 _ 6A, 02
        push    timerinfo                               ; 008B _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 0090 _ FF. 75, DC
        call    timer_init                              ; 0093 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0098 _ 83. C4, 10
        sub     esp, 8                                  ; 009B _ 83. EC, 08
        push    300                                     ; 009E _ 68, 0000012C
        push    dword [ebp-24H]                         ; 00A3 _ FF. 75, DC
        call    timer_settime                           ; 00A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AB _ 83. C4, 10
        call    timer_alloc                             ; 00AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 00B3 _ 89. 45, D8
        sub     esp, 4                                  ; 00B6 _ 83. EC, 04
        push    1                                       ; 00B9 _ 6A, 01
        push    timerinfo                               ; 00BB _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 00C0 _ FF. 75, D8
        call    timer_init                              ; 00C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C8 _ 83. C4, 10
        sub     esp, 8                                  ; 00CB _ 83. EC, 08
        push    50                                      ; 00CE _ 6A, 32
        push    dword [ebp-28H]                         ; 00D0 _ FF. 75, D8
        call    timer_settime                           ; 00D3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00D8 _ 83. C4, 10
        push    0                                       ; 00DB _ 6A, 00
        push    keybuf                                  ; 00DD _ 68, 00000060(d)
        push    32                                      ; 00E2 _ 6A, 20
        push    keyinfo                                 ; 00E4 _ 68, 00000010(d)
        call    fifo8_init                              ; 00E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00EE _ 83. C4, 10
        push    0                                       ; 00F1 _ 6A, 00
        push    mousebuf                                ; 00F3 _ 68, 00000080(d)
        push    128                                     ; 00F8 _ 68, 00000080
        push    mouseinfo                               ; 00FD _ 68, 0000002C(d)
        call    fifo8_init                              ; 0102 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0107 _ 83. C4, 10
        call    init_palette                            ; 010A _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 010F _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0114 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0119 _ 89. 45, D4
        call    get_adr_buffer                          ; 011C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0121 _ 89. 45, D0
        mov     eax, dword [memman]                     ; 0124 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0129 _ 83. EC, 0C
        push    eax                                     ; 012C _ 50
        call    memman_init                             ; 012D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0132 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0135 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013A _ 83. EC, 04
        push    1072594944                              ; 013D _ 68, 3FEE8000
        push    16809984                                ; 0142 _ 68, 01008000
        push    eax                                     ; 0147 _ 50
        call    memman_free                             ; 0148 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 014D _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0150 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0156 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 015C _ A1, 00000000(d)
        push    ecx                                     ; 0161 _ 51
        push    edx                                     ; 0162 _ 52
        push    dword [ebp-1CH]                         ; 0163 _ FF. 75, E4
        push    eax                                     ; 0166 _ 50
        call    shtctl_init                             ; 0167 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016C _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 016F _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 0174 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0179 _ 83. EC, 0C
        push    eax                                     ; 017C _ 50
        call    sheet_alloc                             ; 017D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0182 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0185 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 018A _ A1, 00000264(d)
        sub     esp, 12                                 ; 018F _ 83. EC, 0C
        push    eax                                     ; 0192 _ 50
        call    sheet_alloc                             ; 0193 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0198 _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019B _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01A0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01A6 _ A1, 00000140(d)
        imul    edx, eax                                ; 01AB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01AE _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B3 _ 83. EC, 08
        push    edx                                     ; 01B6 _ 52
        push    eax                                     ; 01B7 _ 50
        call    memman_alloc_4k                         ; 01B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01BD _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C0 _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 01C5 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 01CB _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 01D1 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 01D7 _ A1, 00000268(d)
        sub     esp, 12                                 ; 01DC _ 83. EC, 0C
        push    99                                      ; 01DF _ 6A, 63
        push    ebx                                     ; 01E1 _ 53
        push    ecx                                     ; 01E2 _ 51
        push    edx                                     ; 01E3 _ 52
        push    eax                                     ; 01E4 _ 50
        call    sheet_setbuf                            ; 01E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01EA _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01ED _ A1, 0000026C(d)
        sub     esp, 12                                 ; 01F2 _ 83. EC, 0C
        push    99                                      ; 01F5 _ 6A, 63
        push    16                                      ; 01F7 _ 6A, 10
        push    16                                      ; 01F9 _ 6A, 10
        push    buf_mouse                               ; 01FB _ 68, 00000160(d)
        push    eax                                     ; 0200 _ 50
        call    sheet_setbuf                            ; 0201 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0206 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 0209 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 020F _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0215 _ A1, 00000144(d)
        sub     esp, 4                                  ; 021A _ 83. EC, 04
        push    ecx                                     ; 021D _ 51
        push    edx                                     ; 021E _ 52
        push    eax                                     ; 021F _ 50
        call    init_screen8                            ; 0220 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0225 _ 83. C4, 10
        sub     esp, 8                                  ; 0228 _ 83. EC, 08
        push    99                                      ; 022B _ 6A, 63
        push    buf_mouse                               ; 022D _ 68, 00000160(d)
        call    init_mouse_cursor                       ; 0232 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0237 _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023A _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0240 _ A1, 00000264(d)
        push    0                                       ; 0245 _ 6A, 00
        push    0                                       ; 0247 _ 6A, 00
        push    edx                                     ; 0249 _ 52
        push    eax                                     ; 024A _ 50
        call    sheet_slide                             ; 024B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0250 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0253 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 0258 _ 83. E8, 10
        mov     edx, eax                                ; 025B _ 89. C2
        shr     edx, 31                                 ; 025D _ C1. EA, 1F
        add     eax, edx                                ; 0260 _ 01. D0
        sar     eax, 1                                  ; 0262 _ D1. F8
        mov     dword [mx], eax                         ; 0264 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 0269 _ A1, 00000140(d)
        sub     eax, 44                                 ; 026E _ 83. E8, 2C
        mov     edx, eax                                ; 0271 _ 89. C2
        shr     edx, 31                                 ; 0273 _ C1. EA, 1F
        add     eax, edx                                ; 0276 _ 01. D0
        sar     eax, 1                                  ; 0278 _ D1. F8
        mov     dword [my], eax                         ; 027A _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 027F _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0285 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 028B _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0291 _ A1, 00000264(d)
        push    ebx                                     ; 0296 _ 53
        push    ecx                                     ; 0297 _ 51
        push    edx                                     ; 0298 _ 52
        push    eax                                     ; 0299 _ 50
        call    sheet_slide                             ; 029A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 029F _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A2 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02A9 _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B0 _ A1, 00000264(d)
        sub     esp, 8                                  ; 02B5 _ 83. EC, 08
        push    ?_225                                   ; 02B8 _ 68, 00000000(d)
        push    eax                                     ; 02BD _ 50
        call    message_box                             ; 02BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C3 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C6 _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 02CB _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 02D1 _ A1, 00000264(d)
        sub     esp, 4                                  ; 02D6 _ 83. EC, 04
        push    0                                       ; 02D9 _ 6A, 00
        push    edx                                     ; 02DB _ 52
        push    eax                                     ; 02DC _ 50
        call    sheet_updown                            ; 02DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E2 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E5 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02EB _ A1, 00000264(d)
        sub     esp, 4                                  ; 02F0 _ 83. EC, 04
        push    100                                     ; 02F3 _ 6A, 64
        push    edx                                     ; 02F5 _ 52
        push    eax                                     ; 02F6 _ 50
        call    sheet_updown                            ; 02F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FC _ 83. C4, 10
        call    io_sti                                  ; 02FF _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0304 _ 83. EC, 0C
        push    mdec                                    ; 0307 _ 68, 00000100(d)
        call    enable_mouse                            ; 030C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0311 _ 83. C4, 10
        call    get_code32_addr                         ; 0314 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0319 _ 89. 45, CC
        call    get_addr_gdt                            ; 031C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0321 _ 89. 45, C8
        mov     eax, dword [memman]                     ; 0324 _ A1, 00000000(d)
        sub     esp, 12                                 ; 0329 _ 83. EC, 0C
        push    eax                                     ; 032C _ 50
        call    task_init                               ; 032D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0332 _ 83. C4, 10
        mov     dword [task_a.1882], eax                ; 0335 _ A3, 00000278(d)
        mov     eax, dword [task_a.1882]                ; 033A _ A1, 00000278(d)
        mov     dword [?_239], eax                      ; 033F _ A3, 00000028(d)
        mov     eax, dword [task_a.1882]                ; 0344 _ A1, 00000278(d)
        mov     dword [task_main], eax                  ; 0349 _ A3, 00000274(d)
        mov     eax, dword [task_a.1882]                ; 034E _ A1, 00000278(d)
        sub     esp, 4                                  ; 0353 _ 83. EC, 04
        push    0                                       ; 0356 _ 6A, 00
        push    0                                       ; 0358 _ 6A, 00
        push    eax                                     ; 035A _ 50
        call    task_run                                ; 035B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0360 _ 83. C4, 10
        call    launch_console                          ; 0363 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0368 _ 89. 45, C4
        mov     dword [ebp-40H], 0                      ; 036B _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0372 _ C7. 45, BC, 00000000
        mov     dword [ebp-48H], 0                      ; 0379 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 176                    ; 0380 _ C7. 45, B4, 000000B0
        mov     dword [ebp-50H], 0                      ; 0387 _ C7. 45, B0, 00000000
        mov     dword [ebp-14H], 0                      ; 038E _ C7. 45, EC, 00000000
        mov     dword [ebp-54H], 0                      ; 0395 _ C7. 45, AC, 00000000
?_001:  call    io_cli                                  ; 039C _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03A1 _ 83. EC, 0C
        push    keyinfo                                 ; 03A4 _ 68, 00000010(d)
        call    fifo8_status                            ; 03A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03AE _ 83. C4, 10
        mov     ebx, eax                                ; 03B1 _ 89. C3
        sub     esp, 12                                 ; 03B3 _ 83. EC, 0C
        push    mouseinfo                               ; 03B6 _ 68, 0000002C(d)
        call    fifo8_status                            ; 03BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03C0 _ 83. C4, 10
        add     ebx, eax                                ; 03C3 _ 01. C3
        sub     esp, 12                                 ; 03C5 _ 83. EC, 0C
        push    timerinfo                               ; 03C8 _ 68, 00000110(d)
        call    fifo8_status                            ; 03CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D2 _ 83. C4, 10
        add     eax, ebx                                ; 03D5 _ 01. D8
        test    eax, eax                                ; 03D7 _ 85. C0
        jnz     ?_002                                   ; 03D9 _ 75, 0A
        call    io_sti                                  ; 03DB _ E8, FFFFFFFC(rel)
        jmp     ?_008                                   ; 03E0 _ E9, 000002A7

?_002:  sub     esp, 12                                 ; 03E5 _ 83. EC, 0C
        push    keyinfo                                 ; 03E8 _ 68, 00000010(d)
        call    fifo8_status                            ; 03ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F2 _ 83. C4, 10
        test    eax, eax                                ; 03F5 _ 85. C0
        je      ?_007                                   ; 03F7 _ 0F 84, 0000025C
        call    io_sti                                  ; 03FD _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0402 _ 83. EC, 0C
        push    keyinfo                                 ; 0405 _ 68, 00000010(d)
        call    fifo8_get                               ; 040A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 040F _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 0412 _ 89. 45, C0
        cmp     dword [ebp-40H], 15                     ; 0415 _ 83. 7D, C0, 0F
        jne     ?_005                                   ; 0419 _ 0F 85, 0000012B
        mov     dword [ebp-18H], -1                     ; 041F _ C7. 45, E8, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 0426 _ 83. 7D, EC, 00
        jnz     ?_003                                   ; 042A _ 75, 63
        mov     dword [ebp-14H], 1                      ; 042C _ C7. 45, EC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0433 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0439 _ A1, 00000264(d)
        push    0                                       ; 043E _ 6A, 00
        push    ?_226                                   ; 0440 _ 68, 00000008(d)
        push    edx                                     ; 0445 _ 52
        push    eax                                     ; 0446 _ 50
        call    make_wtitle8                            ; 0447 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 044C _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 044F _ A1, 00000264(d)
        push    1                                       ; 0454 _ 6A, 01
        push    ?_227                                   ; 0456 _ 68, 0000000F(d)
        push    dword [ebp-3CH]                         ; 045B _ FF. 75, C4
        push    eax                                     ; 045E _ 50
        call    make_wtitle8                            ; 045F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0464 _ 83. C4, 10
        mov     edx, dword [shtMsgBox]                  ; 0467 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 046D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0472 _ 83. EC, 0C
        push    7                                       ; 0475 _ 6A, 07
        push    28                                      ; 0477 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0479 _ FF. 75, F4
        push    edx                                     ; 047C _ 52
        push    eax                                     ; 047D _ 50
        call    set_cursor                              ; 047E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0483 _ 83. C4, 20
        mov     dword [ebp-18H], 87                     ; 0486 _ C7. 45, E8, 00000057
        jmp     ?_004                                   ; 048D _ EB, 58

?_003:  mov     dword [ebp-14H], 0                      ; 048F _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 0496 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 049C _ A1, 00000264(d)
        push    1                                       ; 04A1 _ 6A, 01
        push    ?_226                                   ; 04A3 _ 68, 00000008(d)
        push    edx                                     ; 04A8 _ 52
        push    eax                                     ; 04A9 _ 50
        call    make_wtitle8                            ; 04AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04AF _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 04B2 _ A1, 00000264(d)
        push    0                                       ; 04B7 _ 6A, 00
        push    ?_227                                   ; 04B9 _ 68, 0000000F(d)
        push    dword [ebp-3CH]                         ; 04BE _ FF. 75, C4
        push    eax                                     ; 04C1 _ 50
        call    make_wtitle8                            ; 04C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04C7 _ 83. C4, 10
        mov     eax, dword [task_cons]                  ; 04CA _ A1, 00000270(d)
        add     eax, 16                                 ; 04CF _ 83. C0, 10
        sub     esp, 8                                  ; 04D2 _ 83. EC, 08
        push    88                                      ; 04D5 _ 6A, 58
        push    eax                                     ; 04D7 _ 50
        call    fifo8_put                               ; 04D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04DD _ 83. C4, 10
        mov     dword [ebp-18H], 88                     ; 04E0 _ C7. 45, E8, 00000058
?_004:  mov     eax, dword [shtMsgBox]                  ; 04E7 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 04EC _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 04EF _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 04F5 _ A1, 00000264(d)
        sub     esp, 8                                  ; 04FA _ 83. EC, 08
        push    21                                      ; 04FD _ 6A, 15
        push    ecx                                     ; 04FF _ 51
        push    0                                       ; 0500 _ 6A, 00
        push    0                                       ; 0502 _ 6A, 00
        push    edx                                     ; 0504 _ 52
        push    eax                                     ; 0505 _ 50
        call    sheet_refresh                           ; 0506 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 050B _ 83. C4, 20
        mov     eax, dword [ebp-3CH]                    ; 050E _ 8B. 45, C4
        mov     edx, dword [eax+4H]                     ; 0511 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0514 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0519 _ 83. EC, 08
        push    21                                      ; 051C _ 6A, 15
        push    edx                                     ; 051E _ 52
        push    0                                       ; 051F _ 6A, 00
        push    0                                       ; 0521 _ 6A, 00
        push    dword [ebp-3CH]                         ; 0523 _ FF. 75, C4
        push    eax                                     ; 0526 _ 50
        call    sheet_refresh                           ; 0527 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 052C _ 83. C4, 20
        mov     edx, dword [task_cons]                  ; 052F _ 8B. 15, 00000270(d)
        mov     eax, dword [task_a.1882]                ; 0535 _ A1, 00000278(d)
        sub     esp, 4                                  ; 053A _ 83. EC, 04
        push    dword [ebp-18H]                         ; 053D _ FF. 75, E8
        push    edx                                     ; 0540 _ 52
        push    eax                                     ; 0541 _ 50
        call    send_message                            ; 0542 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0547 _ 83. C4, 10
?_005:  cmp     dword [ebp-14H], 0                      ; 054A _ 83. 7D, EC, 00
        jne     ?_006                                   ; 054E _ 0F 85, 000000B0
        sub     esp, 12                                 ; 0554 _ 83. EC, 0C
        push    dword [ebp-40H]                         ; 0557 _ FF. 75, C0
        call    transferScanCode                        ; 055A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 055F _ 83. C4, 10
        test    al, al                                  ; 0562 _ 84. C0
        je      ?_008                                   ; 0564 _ 0F 84, 00000122
        cmp     dword [ebp-0CH], 143                    ; 056A _ 81. 7D, F4, 0000008F
        jg      ?_008                                   ; 0571 _ 0F 8F, 00000115
        mov     edx, dword [shtMsgBox]                  ; 0577 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 057D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0582 _ 83. EC, 0C
        push    7                                       ; 0585 _ 6A, 07
        push    28                                      ; 0587 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0589 _ FF. 75, F4
        push    edx                                     ; 058C _ 52
        push    eax                                     ; 058D _ 50
        call    set_cursor                              ; 058E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0593 _ 83. C4, 20
        sub     esp, 12                                 ; 0596 _ 83. EC, 0C
        push    dword [ebp-40H]                         ; 0599 _ FF. 75, C0
        call    transferScanCode                        ; 059C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05A1 _ 83. C4, 10
        mov     byte [ebp-55H], al                      ; 05A4 _ 88. 45, AB
        mov     al, byte [ebp-55H]                      ; 05A7 _ 8A. 45, AB
        mov     byte [ebp-6AH], al                      ; 05AA _ 88. 45, 96
        mov     byte [ebp-69H], 0                       ; 05AD _ C6. 45, 97, 00
        mov     edx, dword [shtMsgBox]                  ; 05B1 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05B7 _ A1, 00000264(d)
        sub     esp, 8                                  ; 05BC _ 83. EC, 08
        lea     ecx, [ebp-6AH]                          ; 05BF _ 8D. 4D, 96
        push    ecx                                     ; 05C2 _ 51
        push    0                                       ; 05C3 _ 6A, 00
        push    28                                      ; 05C5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05C7 _ FF. 75, F4
        push    edx                                     ; 05CA _ 52
        push    eax                                     ; 05CB _ 50
        call    showString                              ; 05CC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05D1 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 05D4 _ 83. 45, F4, 08
        mov     dword [ebp-50H], 1                      ; 05D8 _ C7. 45, B0, 00000001
        mov     edx, dword [shtMsgBox]                  ; 05DF _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05E5 _ A1, 00000264(d)
        sub     esp, 12                                 ; 05EA _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 05ED _ FF. 75, F0
        push    28                                      ; 05F0 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05F2 _ FF. 75, F4
        push    edx                                     ; 05F5 _ 52
        push    eax                                     ; 05F6 _ 50
        call    set_cursor                              ; 05F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05FC _ 83. C4, 20
        jmp     ?_008                                   ; 05FF _ E9, 00000088

?_006:  sub     esp, 12                                 ; 0604 _ 83. EC, 0C
        push    dword [ebp-40H]                         ; 0607 _ FF. 75, C0
        call    isSpecialKey                            ; 060A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 060F _ 83. C4, 10
        test    eax, eax                                ; 0612 _ 85. C0
        jnz     ?_008                                   ; 0614 _ 75, 76
        mov     eax, dword [ebp-40H]                    ; 0616 _ 8B. 45, C0
        movzx   eax, al                                 ; 0619 _ 0F B6. C0
        mov     edx, dword [task_cons]                  ; 061C _ 8B. 15, 00000270(d)
        add     edx, 16                                 ; 0622 _ 83. C2, 10
        sub     esp, 8                                  ; 0625 _ 83. EC, 08
        push    eax                                     ; 0628 _ 50
        push    edx                                     ; 0629 _ 52
        call    fifo8_put                               ; 062A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 062F _ 83. C4, 10
        sub     esp, 12                                 ; 0632 _ 83. EC, 0C
        push    keyinfo                                 ; 0635 _ 68, 00000010(d)
        call    fifo8_status                            ; 063A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 063F _ 83. C4, 10
        test    eax, eax                                ; 0642 _ 85. C0
        jnz     ?_008                                   ; 0644 _ 75, 46
        mov     eax, dword [task_a.1882]                ; 0646 _ A1, 00000278(d)
        sub     esp, 12                                 ; 064B _ 83. EC, 0C
        push    eax                                     ; 064E _ 50
        call    task_sleep                              ; 064F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0654 _ 83. C4, 10
        jmp     ?_008                                   ; 0657 _ EB, 33

?_007:  sub     esp, 12                                 ; 0659 _ 83. EC, 0C
        push    mouseinfo                               ; 065C _ 68, 0000002C(d)
        call    fifo8_status                            ; 0661 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0666 _ 83. C4, 10
        test    eax, eax                                ; 0669 _ 85. C0
        jz      ?_008                                   ; 066B _ 74, 1F
        mov     ecx, dword [sht_mouse]                  ; 066D _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 0673 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0679 _ A1, 00000264(d)
        sub     esp, 4                                  ; 067E _ 83. EC, 04
        push    ecx                                     ; 0681 _ 51
        push    edx                                     ; 0682 _ 52
        push    eax                                     ; 0683 _ 50
        call    show_mouse_info                         ; 0684 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0689 _ 83. C4, 10
?_008:  sub     esp, 12                                 ; 068C _ 83. EC, 0C
        push    timerinfo                               ; 068F _ 68, 00000110(d)
        call    fifo8_status                            ; 0694 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0699 _ 83. C4, 10
        test    eax, eax                                ; 069C _ 85. C0
        je      ?_001                                   ; 069E _ 0F 84, FFFFFCF8
        call    io_sti                                  ; 06A4 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 06A9 _ 83. EC, 0C
        push    timerinfo                               ; 06AC _ 68, 00000110(d)
        call    fifo8_get                               ; 06B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B6 _ 83. C4, 10
        mov     dword [ebp-5CH], eax                    ; 06B9 _ 89. 45, A4
        cmp     dword [ebp-5CH], 0                      ; 06BC _ 83. 7D, A4, 00
        jz      ?_009                                   ; 06C0 _ 74, 1E
        sub     esp, 4                                  ; 06C2 _ 83. EC, 04
        push    0                                       ; 06C5 _ 6A, 00
        push    timerinfo                               ; 06C7 _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 06CC _ FF. 75, D8
        call    timer_init                              ; 06CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06D4 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 06D7 _ C7. 45, F0, 00000000
        jmp     ?_010                                   ; 06DE _ EB, 1C

?_009:  sub     esp, 4                                  ; 06E0 _ 83. EC, 04
        push    1                                       ; 06E3 _ 6A, 01
        push    timerinfo                               ; 06E5 _ 68, 00000110(d)
        push    dword [ebp-28H]                         ; 06EA _ FF. 75, D8
        call    timer_init                              ; 06ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06F2 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 06F5 _ C7. 45, F0, 00000007
?_010:  sub     esp, 8                                  ; 06FC _ 83. EC, 08
        push    50                                      ; 06FF _ 6A, 32
        push    dword [ebp-28H]                         ; 0701 _ FF. 75, D8
        call    timer_settime                           ; 0704 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0709 _ 83. C4, 10
        cmp     dword [ebp-14H], 0                      ; 070C _ 83. 7D, EC, 00
        jnz     ?_011                                   ; 0710 _ 75, 25
        mov     edx, dword [shtMsgBox]                  ; 0712 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0718 _ A1, 00000264(d)
        sub     esp, 12                                 ; 071D _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0720 _ FF. 75, F0
        push    28                                      ; 0723 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0725 _ FF. 75, F4
        push    edx                                     ; 0728 _ 52
        push    eax                                     ; 0729 _ 50
        call    set_cursor                              ; 072A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 072F _ 83. C4, 20
        jmp     ?_001                                   ; 0732 _ E9, FFFFFC65

?_011:  mov     edx, dword [shtMsgBox]                  ; 0737 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 073D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0742 _ 83. EC, 0C
        push    7                                       ; 0745 _ 6A, 07
        push    28                                      ; 0747 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0749 _ FF. 75, F4
        push    edx                                     ; 074C _ 52
        push    eax                                     ; 074D _ 50
        call    set_cursor                              ; 074E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0753 _ 83. C4, 20
        jmp     ?_001                                   ; 0756 _ E9, FFFFFC41
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 075B _ 55
        mov     ebp, esp                                ; 075C _ 89. E5
        push    esi                                     ; 075E _ 56
        push    ebx                                     ; 075F _ 53
        mov     eax, dword [ebp+14H]                    ; 0760 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 0763 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 0766 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 0769 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 076C _ 8B. 45, 18
        movzx   ecx, al                                 ; 076F _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 0772 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0775 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0778 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 077B _ 8B. 00
        sub     esp, 4                                  ; 077D _ 83. EC, 04
        push    esi                                     ; 0780 _ 56
        push    ebx                                     ; 0781 _ 53
        push    dword [ebp+14H]                         ; 0782 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0785 _ FF. 75, 10
        push    ecx                                     ; 0788 _ 51
        push    edx                                     ; 0789 _ 52
        push    eax                                     ; 078A _ 50
        call    boxfill8                                ; 078B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0790 _ 83. C4, 20
        mov     eax, dword [ebp+14H]                    ; 0793 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 0796 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 0799 _ 8B. 45, 10
        add     eax, 8                                  ; 079C _ 83. C0, 08
        sub     esp, 8                                  ; 079F _ 83. EC, 08
        push    edx                                     ; 07A2 _ 52
        push    eax                                     ; 07A3 _ 50
        push    dword [ebp+14H]                         ; 07A4 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 07A7 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 07AA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 07AD _ FF. 75, 08
        call    sheet_refresh                           ; 07B0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07B5 _ 83. C4, 20
        nop                                             ; 07B8 _ 90
        lea     esp, [ebp-8H]                           ; 07B9 _ 8D. 65, F8
        pop     ebx                                     ; 07BC _ 5B
        pop     esi                                     ; 07BD _ 5E
        pop     ebp                                     ; 07BE _ 5D
        ret                                             ; 07BF _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 07C0 _ 55
        mov     ebp, esp                                ; 07C1 _ 89. E5
        sub     esp, 8                                  ; 07C3 _ 83. EC, 08
        sub     esp, 12                                 ; 07C6 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 07C9 _ FF. 75, 08
        call    transferScanCode                        ; 07CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07D1 _ 83. C4, 10
        cmp     dword [ebp+8H], 58                      ; 07D4 _ 83. 7D, 08, 3A
        jz      ?_012                                   ; 07D8 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 07DA _ 81. 7D, 08, 000000BA
        jz      ?_012                                   ; 07E1 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 07E3 _ 83. 7D, 08, 2A
        jz      ?_012                                   ; 07E7 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 07E9 _ 83. 7D, 08, 36
        jz      ?_012                                   ; 07ED _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 07EF _ 81. 7D, 08, 000000AA
        jz      ?_012                                   ; 07F6 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 07F8 _ 81. 7D, 08, 000000B6
        jnz     ?_013                                   ; 07FF _ 75, 07
?_012:  mov     eax, 1                                  ; 0801 _ B8, 00000001
        jmp     ?_014                                   ; 0806 _ EB, 05

?_013:  mov     eax, 0                                  ; 0808 _ B8, 00000000
?_014:  leave                                           ; 080D _ C9
        ret                                             ; 080E _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 080F _ 55
        mov     ebp, esp                                ; 0810 _ 89. E5
        sub     esp, 16                                 ; 0812 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0815 _ 83. 7D, 08, 2A
        jnz     ?_015                                   ; 0819 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 081B _ A1, 00000000(d)
        or      eax, 01H                                ; 0820 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0823 _ A3, 00000000(d)
?_015:  cmp     dword [ebp+8H], 54                      ; 0828 _ 83. 7D, 08, 36
        jnz     ?_016                                   ; 082C _ 75, 0D
        mov     eax, dword [key_shift]                  ; 082E _ A1, 00000000(d)
        or      eax, 02H                                ; 0833 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0836 _ A3, 00000000(d)
?_016:  cmp     dword [ebp+8H], 170                     ; 083B _ 81. 7D, 08, 000000AA
        jnz     ?_017                                   ; 0842 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0844 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0849 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 084C _ A3, 00000000(d)
?_017:  cmp     dword [ebp+8H], 182                     ; 0851 _ 81. 7D, 08, 000000B6
        jnz     ?_018                                   ; 0858 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 085A _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 085F _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0862 _ A3, 00000000(d)
?_018:  cmp     dword [ebp+8H], 58                      ; 0867 _ 83. 7D, 08, 3A
        jnz     ?_020                                   ; 086B _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 086D _ A1, 00000000(d)
        test    eax, eax                                ; 0872 _ 85. C0
        jnz     ?_019                                   ; 0874 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0876 _ C7. 05, 00000000(d), 00000001
        jmp     ?_020                                   ; 0880 _ EB, 0A

?_019:  mov     dword [caps_lock], 0                    ; 0882 _ C7. 05, 00000000(d), 00000000
?_020:  cmp     dword [ebp+8H], 42                      ; 088C _ 83. 7D, 08, 2A
        jz      ?_021                                   ; 0890 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0892 _ 83. 7D, 08, 36
        jz      ?_021                                   ; 0896 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0898 _ 81. 7D, 08, 000000AA
        jz      ?_021                                   ; 089F _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 08A1 _ 81. 7D, 08, 000000B6
        jz      ?_021                                   ; 08A8 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 08AA _ 83. 7D, 08, 53
        jg      ?_021                                   ; 08AE _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 08B0 _ 83. 7D, 08, 3A
        jnz     ?_022                                   ; 08B4 _ 75, 07
?_021:  mov     al, 0                                   ; 08B6 _ B0, 00
        jmp     ?_027                                   ; 08B8 _ E9, 00000084

?_022:  mov     byte [ebp-1H], 0                        ; 08BD _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 08C1 _ A1, 00000000(d)
        test    eax, eax                                ; 08C6 _ 85. C0
        jnz     ?_023                                   ; 08C8 _ 75, 41
        cmp     dword [ebp+8H], 83                      ; 08CA _ 83. 7D, 08, 53
        jg      ?_023                                   ; 08CE _ 7F, 3B
        mov     eax, dword [ebp+8H]                     ; 08D0 _ 8B. 45, 08
        add     eax, keytable                           ; 08D3 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 08D8 _ 8A. 00
        test    al, al                                  ; 08DA _ 84. C0
        jz      ?_023                                   ; 08DC _ 74, 2D
        mov     eax, dword [ebp+8H]                     ; 08DE _ 8B. 45, 08
        add     eax, keytable                           ; 08E1 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 08E6 _ 8A. 00
        mov     byte [ebp-1H], al                       ; 08E8 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 08EB _ 80. 7D, FF, 40
        jle     ?_025                                   ; 08EF _ 7E, 4C
        cmp     byte [ebp-1H], 90                       ; 08F1 _ 80. 7D, FF, 5A
        jg      ?_025                                   ; 08F5 _ 7F, 46
        mov     eax, dword [caps_lock]                  ; 08F7 _ A1, 00000000(d)
        test    eax, eax                                ; 08FC _ 85. C0
        jnz     ?_025                                   ; 08FE _ 75, 3D
        mov     al, byte [ebp-1H]                       ; 0900 _ 8A. 45, FF
        add     eax, 32                                 ; 0903 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0906 _ 88. 45, FF
        jmp     ?_025                                   ; 0909 _ EB, 32

?_023:  mov     eax, dword [key_shift]                  ; 090B _ A1, 00000000(d)
        test    eax, eax                                ; 0910 _ 85. C0
        jz      ?_024                                   ; 0912 _ 74, 23
        cmp     dword [ebp+8H], 127                     ; 0914 _ 83. 7D, 08, 7F
        jg      ?_024                                   ; 0918 _ 7F, 1D
        mov     eax, dword [ebp+8H]                     ; 091A _ 8B. 45, 08
        add     eax, keytable1                          ; 091D _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 0922 _ 8A. 00
        test    al, al                                  ; 0924 _ 84. C0
        jz      ?_024                                   ; 0926 _ 74, 0F
        mov     eax, dword [ebp+8H]                     ; 0928 _ 8B. 45, 08
        add     eax, keytable1                          ; 092B _ 05, 00000080(d)
        mov     al, byte [eax]                          ; 0930 _ 8A. 00
        mov     byte [ebp-1H], al                       ; 0932 _ 88. 45, FF
        jmp     ?_026                                   ; 0935 _ EB, 07

?_024:  mov     byte [ebp-1H], 0                        ; 0937 _ C6. 45, FF, 00
        jmp     ?_026                                   ; 093B _ EB, 01

?_025:  nop                                             ; 093D _ 90
?_026:  mov     al, byte [ebp-1H]                       ; 093E _ 8A. 45, FF
?_027:  leave                                           ; 0941 _ C9
        ret                                             ; 0942 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0943 _ 55
        mov     ebp, esp                                ; 0944 _ 89. E5
        sub     esp, 24                                 ; 0946 _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 0949 _ A1, 00000264(d)
        sub     esp, 12                                 ; 094E _ 83. EC, 0C
        push    eax                                     ; 0951 _ 50
        call    sheet_alloc                             ; 0952 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0957 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 095A _ 89. 45, F4
        mov     eax, dword [memman]                     ; 095D _ A1, 00000000(d)
        sub     esp, 8                                  ; 0962 _ 83. EC, 08
        push    42240                                   ; 0965 _ 68, 0000A500
        push    eax                                     ; 096A _ 50
        call    memman_alloc_4k                         ; 096B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0970 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0973 _ 89. 45, F0
        sub     esp, 12                                 ; 0976 _ 83. EC, 0C
        push    99                                      ; 0979 _ 6A, 63
        push    165                                     ; 097B _ 68, 000000A5
        push    256                                     ; 0980 _ 68, 00000100
        push    dword [ebp-10H]                         ; 0985 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0988 _ FF. 75, F4
        call    sheet_setbuf                            ; 098B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0990 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0993 _ A1, 00000264(d)
        push    0                                       ; 0998 _ 6A, 00
        push    ?_227                                   ; 099A _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 099F _ FF. 75, F4
        push    eax                                     ; 09A2 _ 50
        call    make_window8                            ; 09A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09A8 _ 83. C4, 10
        sub     esp, 8                                  ; 09AB _ 83. EC, 08
        push    0                                       ; 09AE _ 6A, 00
        push    128                                     ; 09B0 _ 68, 00000080
        push    240                                     ; 09B5 _ 68, 000000F0
        push    28                                      ; 09BA _ 6A, 1C
        push    8                                       ; 09BC _ 6A, 08
        push    dword [ebp-0CH]                         ; 09BE _ FF. 75, F4
        call    make_textbox8                           ; 09C1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09C6 _ 83. C4, 20
        call    task_alloc                              ; 09C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 09CE _ 89. 45, EC
        call    get_code32_addr                         ; 09D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 09D6 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 09D9 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 09DC _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 09E3 _ 8B. 45, EC
        mov     dword [eax+78H], 1073741824             ; 09E6 _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-18H]                    ; 09ED _ 8B. 45, E8
        neg     eax                                     ; 09F0 _ F7. D8
        add     eax, console_task                       ; 09F2 _ 05, 00000000(d)
        mov     edx, eax                                ; 09F7 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 09F9 _ 8B. 45, EC
        mov     dword [eax+34H], edx                    ; 09FC _ 89. 50, 34
        mov     eax, dword [ebp-14H]                    ; 09FF _ 8B. 45, EC
        mov     dword [eax+5CH], 0                      ; 0A02 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A09 _ 8B. 45, EC
        mov     dword [eax+60H], 8                      ; 0A0C _ C7. 40, 60, 00000008
        mov     eax, dword [ebp-14H]                    ; 0A13 _ 8B. 45, EC
        mov     dword [eax+64H], 32                     ; 0A16 _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-14H]                    ; 0A1D _ 8B. 45, EC
        mov     dword [eax+68H], 24                     ; 0A20 _ C7. 40, 68, 00000018
        mov     eax, dword [ebp-14H]                    ; 0A27 _ 8B. 45, EC
        mov     dword [eax+6CH], 0                      ; 0A2A _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0A31 _ 8B. 45, EC
        mov     dword [eax+70H], 16                     ; 0A34 _ C7. 40, 70, 00000010
        mov     eax, dword [ebp-14H]                    ; 0A3B _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0A3E _ 8B. 40, 4C
        lea     edx, [eax-8H]                           ; 0A41 _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 0A44 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0A47 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0A4A _ 8B. 45, EC
        mov     eax, dword [eax+4CH]                    ; 0A4D _ 8B. 40, 4C
        add     eax, 4                                  ; 0A50 _ 83. C0, 04
        mov     edx, eax                                ; 0A53 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0A55 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0A58 _ 89. 02
        sub     esp, 4                                  ; 0A5A _ 83. EC, 04
        push    5                                       ; 0A5D _ 6A, 05
        push    1                                       ; 0A5F _ 6A, 01
        push    dword [ebp-14H]                         ; 0A61 _ FF. 75, EC
        call    task_run                                ; 0A64 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A69 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0A6C _ A1, 00000264(d)
        push    4                                       ; 0A71 _ 6A, 04
        push    32                                      ; 0A73 _ 6A, 20
        push    dword [ebp-0CH]                         ; 0A75 _ FF. 75, F4
        push    eax                                     ; 0A78 _ 50
        call    sheet_slide                             ; 0A79 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A7E _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0A81 _ A1, 00000264(d)
        sub     esp, 4                                  ; 0A86 _ 83. EC, 04
        push    1                                       ; 0A89 _ 6A, 01
        push    dword [ebp-0CH]                         ; 0A8B _ FF. 75, F4
        push    eax                                     ; 0A8E _ 50
        call    sheet_updown                            ; 0A8F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A94 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0A97 _ 8B. 45, EC
        mov     dword [task_cons], eax                  ; 0A9A _ A3, 00000270(d)
        mov     eax, dword [ebp-0CH]                    ; 0A9F _ 8B. 45, F4
        leave                                           ; 0AA2 _ C9
        ret                                             ; 0AA3 _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 0AA4 _ 55
        mov     ebp, esp                                ; 0AA5 _ 89. E5
        sub     esp, 568                                ; 0AA7 _ 81. EC, 00000238
        call    task_now                                ; 0AAD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0AB2 _ 89. 45, E8
        mov     dword [ebp-0CH], 16                     ; 0AB5 _ C7. 45, F4, 00000010
        mov     dword [ebp-10H], 0                      ; 0ABC _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 28                     ; 0AC3 _ C7. 45, EC, 0000001C
        mov     eax, dword [ebp-18H]                    ; 0ACA _ 8B. 45, E8
        lea     edx, [eax+10H]                          ; 0ACD _ 8D. 50, 10
        push    dword [ebp-18H]                         ; 0AD0 _ FF. 75, E8
        lea     eax, [ebp-228H]                         ; 0AD3 _ 8D. 85, FFFFFDD8
        push    eax                                     ; 0AD9 _ 50
        push    128                                     ; 0ADA _ 68, 00000080
        push    edx                                     ; 0ADF _ 52
        call    fifo8_init                              ; 0AE0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AE5 _ 83. C4, 10
        call    timer_alloc                             ; 0AE8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0AED _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 0AF0 _ 8B. 45, E8
        add     eax, 16                                 ; 0AF3 _ 83. C0, 10
        sub     esp, 4                                  ; 0AF6 _ 83. EC, 04
        push    1                                       ; 0AF9 _ 6A, 01
        push    eax                                     ; 0AFB _ 50
        push    dword [ebp-1CH]                         ; 0AFC _ FF. 75, E4
        call    timer_init                              ; 0AFF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B04 _ 83. C4, 10
        sub     esp, 8                                  ; 0B07 _ 83. EC, 08
        push    50                                      ; 0B0A _ 6A, 32
        push    dword [ebp-1CH]                         ; 0B0C _ FF. 75, E4
        call    timer_settime                           ; 0B0F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B14 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0B17 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0B1C _ 83. EC, 08
        push    ?_228                                   ; 0B1F _ 68, 00000017(d)
        push    7                                       ; 0B24 _ 6A, 07
        push    28                                      ; 0B26 _ 6A, 1C
        push    8                                       ; 0B28 _ 6A, 08
        push    dword [ebp+8H]                          ; 0B2A _ FF. 75, 08
        push    eax                                     ; 0B2D _ 50
        call    showString                              ; 0B2E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B33 _ 83. C4, 20
        mov     dword [ebp-20H], 0                      ; 0B36 _ C7. 45, E0, 00000000
?_028:  call    io_cli                                  ; 0B3D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0B42 _ 8B. 45, E8
        add     eax, 16                                 ; 0B45 _ 83. C0, 10
        sub     esp, 12                                 ; 0B48 _ 83. EC, 0C
        push    eax                                     ; 0B4B _ 50
        call    fifo8_status                            ; 0B4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B51 _ 83. C4, 10
        test    eax, eax                                ; 0B54 _ 85. C0
        jnz     ?_029                                   ; 0B56 _ 75, 07
        call    io_sti                                  ; 0B58 _ E8, FFFFFFFC(rel)
        jmp     ?_028                                   ; 0B5D _ EB, DE

?_029:  call    io_sti                                  ; 0B5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0B64 _ 8B. 45, E8
        add     eax, 16                                 ; 0B67 _ 83. C0, 10
        sub     esp, 12                                 ; 0B6A _ 83. EC, 0C
        push    eax                                     ; 0B6D _ 50
        call    fifo8_get                               ; 0B6E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B73 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0B76 _ 89. 45, DC
        cmp     dword [ebp-24H], 1                      ; 0B79 _ 83. 7D, DC, 01
        jg      ?_032                                   ; 0B7D _ 7F, 5F
        cmp     dword [ebp-10H], 0                      ; 0B7F _ 83. 7D, F0, 00
        js      ?_032                                   ; 0B83 _ 78, 59
        cmp     dword [ebp-24H], 0                      ; 0B85 _ 83. 7D, DC, 00
        jz      ?_030                                   ; 0B89 _ 74, 20
        mov     eax, dword [ebp-18H]                    ; 0B8B _ 8B. 45, E8
        add     eax, 16                                 ; 0B8E _ 83. C0, 10
        sub     esp, 4                                  ; 0B91 _ 83. EC, 04
        push    0                                       ; 0B94 _ 6A, 00
        push    eax                                     ; 0B96 _ 50
        push    dword [ebp-1CH]                         ; 0B97 _ FF. 75, E4
        call    timer_init                              ; 0B9A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B9F _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 0BA2 _ C7. 45, F0, 00000007
        jmp     ?_031                                   ; 0BA9 _ EB, 1E

?_030:  mov     eax, dword [ebp-18H]                    ; 0BAB _ 8B. 45, E8
        add     eax, 16                                 ; 0BAE _ 83. C0, 10
        sub     esp, 4                                  ; 0BB1 _ 83. EC, 04
        push    1                                       ; 0BB4 _ 6A, 01
        push    eax                                     ; 0BB6 _ 50
        push    dword [ebp-1CH]                         ; 0BB7 _ FF. 75, E4
        call    timer_init                              ; 0BBA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BBF _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0BC2 _ C7. 45, F0, 00000000
?_031:  sub     esp, 8                                  ; 0BC9 _ 83. EC, 08
        push    50                                      ; 0BCC _ 6A, 32
        push    dword [ebp-1CH]                         ; 0BCE _ FF. 75, E4
        call    timer_settime                           ; 0BD1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BD6 _ 83. C4, 10
        jmp     ?_037                                   ; 0BD9 _ E9, 00000198

?_032:  cmp     dword [ebp-24H], 87                     ; 0BDE _ 83. 7D, DC, 57
        jnz     ?_033                                   ; 0BE2 _ 75, 33
        mov     dword [ebp-10H], 7                      ; 0BE4 _ C7. 45, F0, 00000007
        mov     eax, dword [ebp-18H]                    ; 0BEB _ 8B. 45, E8
        add     eax, 16                                 ; 0BEE _ 83. C0, 10
        sub     esp, 4                                  ; 0BF1 _ 83. EC, 04
        push    0                                       ; 0BF4 _ 6A, 00
        push    eax                                     ; 0BF6 _ 50
        push    dword [ebp-1CH]                         ; 0BF7 _ FF. 75, E4
        call    timer_init                              ; 0BFA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0BFF _ 83. C4, 10
        sub     esp, 8                                  ; 0C02 _ 83. EC, 08
        push    50                                      ; 0C05 _ 6A, 32
        push    dword [ebp-1CH]                         ; 0C07 _ FF. 75, E4
        call    timer_settime                           ; 0C0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C0F _ 83. C4, 10
        jmp     ?_037                                   ; 0C12 _ E9, 0000015F

?_033:  cmp     dword [ebp-24H], 88                     ; 0C17 _ 83. 7D, DC, 58
        jnz     ?_034                                   ; 0C1B _ 75, 3D
        mov     eax, dword [shtctl]                     ; 0C1D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0C22 _ 83. EC, 0C
        push    0                                       ; 0C25 _ 6A, 00
        push    dword [ebp-14H]                         ; 0C27 _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0C2A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0C2D _ FF. 75, 08
        push    eax                                     ; 0C30 _ 50
        call    set_cursor                              ; 0C31 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C36 _ 83. C4, 20
        mov     dword [ebp-10H], -1                     ; 0C39 _ C7. 45, F0, FFFFFFFF
        mov     eax, dword [task_main]                  ; 0C40 _ A1, 00000274(d)
        sub     esp, 4                                  ; 0C45 _ 83. EC, 04
        push    0                                       ; 0C48 _ 6A, 00
        push    -1                                      ; 0C4A _ 6A, FF
        push    eax                                     ; 0C4C _ 50
        call    task_run                                ; 0C4D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C52 _ 83. C4, 10
        jmp     ?_037                                   ; 0C55 _ E9, 0000011C

?_034:  cmp     dword [ebp-24H], 28                     ; 0C5A _ 83. 7D, DC, 1C
        jnz     ?_035                                   ; 0C5E _ 75, 59
        cmp     dword [ebp-14H], 139                    ; 0C60 _ 81. 7D, EC, 0000008B
        jg      ?_037                                   ; 0C67 _ 0F 8F, 00000109
        mov     eax, dword [shtctl]                     ; 0C6D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0C72 _ 83. EC, 0C
        push    0                                       ; 0C75 _ 6A, 00
        push    dword [ebp-14H]                         ; 0C77 _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0C7A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0C7D _ FF. 75, 08
        push    eax                                     ; 0C80 _ 50
        call    set_cursor                              ; 0C81 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C86 _ 83. C4, 20
        add     dword [ebp-14H], 16                     ; 0C89 _ 83. 45, EC, 10
        mov     dword [ebp-0CH], 16                     ; 0C8D _ C7. 45, F4, 00000010
        mov     eax, dword [shtctl]                     ; 0C94 _ A1, 00000264(d)
        sub     esp, 8                                  ; 0C99 _ 83. EC, 08
        push    ?_228                                   ; 0C9C _ 68, 00000017(d)
        push    7                                       ; 0CA1 _ 6A, 07
        push    dword [ebp-14H]                         ; 0CA3 _ FF. 75, EC
        push    8                                       ; 0CA6 _ 6A, 08
        push    dword [ebp+8H]                          ; 0CA8 _ FF. 75, 08
        push    eax                                     ; 0CAB _ 50
        call    showString                              ; 0CAC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CB1 _ 83. C4, 20
        jmp     ?_037                                   ; 0CB4 _ E9, 000000BD

?_035:  cmp     dword [ebp-24H], 14                     ; 0CB9 _ 83. 7D, DC, 0E
        jnz     ?_036                                   ; 0CBD _ 75, 44
        cmp     dword [ebp-0CH], 8                      ; 0CBF _ 83. 7D, F4, 08
        jle     ?_036                                   ; 0CC3 _ 7E, 3E
        mov     eax, dword [shtctl]                     ; 0CC5 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0CCA _ 83. EC, 0C
        push    0                                       ; 0CCD _ 6A, 00
        push    dword [ebp-14H]                         ; 0CCF _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0CD2 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0CD5 _ FF. 75, 08
        push    eax                                     ; 0CD8 _ 50
        call    set_cursor                              ; 0CD9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CDE _ 83. C4, 20
        sub     dword [ebp-0CH], 8                      ; 0CE1 _ 83. 6D, F4, 08
        mov     eax, dword [shtctl]                     ; 0CE5 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0CEA _ 83. EC, 0C
        push    0                                       ; 0CED _ 6A, 00
        push    dword [ebp-14H]                         ; 0CEF _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0CF2 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0CF5 _ FF. 75, 08
        push    eax                                     ; 0CF8 _ 50
        call    set_cursor                              ; 0CF9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CFE _ 83. C4, 20
        jmp     ?_037                                   ; 0D01 _ EB, 73

?_036:  sub     esp, 12                                 ; 0D03 _ 83. EC, 0C
        push    dword [ebp-24H]                         ; 0D06 _ FF. 75, DC
        call    transferScanCode                        ; 0D09 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D0E _ 83. C4, 10
        mov     byte [ebp-25H], al                      ; 0D11 _ 88. 45, DB
        cmp     dword [ebp-0CH], 239                    ; 0D14 _ 81. 7D, F4, 000000EF
        jg      ?_037                                   ; 0D1B _ 7F, 59
        cmp     byte [ebp-25H], 0                       ; 0D1D _ 80. 7D, DB, 00
        jz      ?_037                                   ; 0D21 _ 74, 53
        mov     eax, dword [shtctl]                     ; 0D23 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0D28 _ 83. EC, 0C
        push    0                                       ; 0D2B _ 6A, 00
        push    dword [ebp-14H]                         ; 0D2D _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0D30 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D33 _ FF. 75, 08
        push    eax                                     ; 0D36 _ 50
        call    set_cursor                              ; 0D37 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D3C _ 83. C4, 20
        mov     al, byte [ebp-25H]                      ; 0D3F _ 8A. 45, DB
        mov     byte [ebp-22AH], al                     ; 0D42 _ 88. 85, FFFFFDD6
        mov     byte [ebp-229H], 0                      ; 0D48 _ C6. 85, FFFFFDD7, 00
        mov     eax, dword [shtctl]                     ; 0D4F _ A1, 00000264(d)
        sub     esp, 8                                  ; 0D54 _ 83. EC, 08
        lea     edx, [ebp-22AH]                         ; 0D57 _ 8D. 95, FFFFFDD6
        push    edx                                     ; 0D5D _ 52
        push    7                                       ; 0D5E _ 6A, 07
        push    dword [ebp-14H]                         ; 0D60 _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0D63 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D66 _ FF. 75, 08
        push    eax                                     ; 0D69 _ 50
        call    showString                              ; 0D6A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D6F _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 0D72 _ 83. 45, F4, 08
?_037:  cmp     dword [ebp-10H], 0                      ; 0D76 _ 83. 7D, F0, 00
        js      ?_028                                   ; 0D7A _ 0F 88, FFFFFDBD
        mov     eax, dword [shtctl]                     ; 0D80 _ A1, 00000264(d)
        sub     esp, 12                                 ; 0D85 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0D88 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0D8B _ FF. 75, EC
        push    dword [ebp-0CH]                         ; 0D8E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 0D91 _ FF. 75, 08
        push    eax                                     ; 0D94 _ 50
        call    set_cursor                              ; 0D95 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0D9A _ 83. C4, 20
        jmp     ?_028                                   ; 0D9D _ E9, FFFFFD9B
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 0DA2 _ 55
        mov     ebp, esp                                ; 0DA3 _ 89. E5
        sub     esp, 72                                 ; 0DA5 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0DA8 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0DAE _ A1, 00000264(d)
        sub     esp, 8                                  ; 0DB3 _ 83. EC, 08
        push    ?_229                                   ; 0DB6 _ 68, 00000019(d)
        push    7                                       ; 0DBB _ 6A, 07
        push    160                                     ; 0DBD _ 68, 000000A0
        push    0                                       ; 0DC2 _ 6A, 00
        push    edx                                     ; 0DC4 _ 52
        push    eax                                     ; 0DC5 _ 50
        call    showString                              ; 0DC6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0DCB _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 0DCE _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0DD5 _ C7. 45, E8, 00000000
        push    0                                       ; 0DDC _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 0DDE _ 8D. 45, C4
        push    eax                                     ; 0DE1 _ 50
        push    8                                       ; 0DE2 _ 6A, 08
        lea     eax, [ebp-34H]                          ; 0DE4 _ 8D. 45, CC
        push    eax                                     ; 0DE7 _ 50
        call    fifo8_init                              ; 0DE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DED _ 83. C4, 10
        call    timer_alloc                             ; 0DF0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0DF5 _ 89. 45, EC
        sub     esp, 4                                  ; 0DF8 _ 83. EC, 04
        push    123                                     ; 0DFB _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0DFD _ 8D. 45, CC
        push    eax                                     ; 0E00 _ 50
        push    dword [ebp-14H]                         ; 0E01 _ FF. 75, EC
        call    timer_init                              ; 0E04 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E09 _ 83. C4, 10
        sub     esp, 8                                  ; 0E0C _ 83. EC, 08
        push    100                                     ; 0E0F _ 6A, 64
        push    dword [ebp-14H]                         ; 0E11 _ FF. 75, EC
        call    timer_settime                           ; 0E14 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E19 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0E1C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0E23 _ C7. 45, F0, 00000000
?_038:  inc     dword [ebp-0CH]                         ; 0E2A _ FF. 45, F4
        call    io_cli                                  ; 0E2D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0E32 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0E35 _ 8D. 45, CC
        push    eax                                     ; 0E38 _ 50
        call    fifo8_status                            ; 0E39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E3E _ 83. C4, 10
        test    eax, eax                                ; 0E41 _ 85. C0
        jnz     ?_039                                   ; 0E43 _ 75, 07
        call    io_sti                                  ; 0E45 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0E4A _ EB, DE

?_039:  sub     esp, 12                                 ; 0E4C _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0E4F _ 8D. 45, CC
        push    eax                                     ; 0E52 _ 50
        call    fifo8_get                               ; 0E53 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E58 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0E5B _ 89. 45, E8
        call    io_sti                                  ; 0E5E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0E63 _ 83. 7D, E8, 7B
        jnz     ?_038                                   ; 0E67 _ 75, C1
        mov     edx, dword [sht_back]                   ; 0E69 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0E6F _ A1, 00000264(d)
        sub     esp, 8                                  ; 0E74 _ 83. EC, 08
        push    ?_230                                   ; 0E77 _ 68, 00000026(d)
        push    7                                       ; 0E7C _ 6A, 07
        push    192                                     ; 0E7E _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0E83 _ FF. 75, F0
        push    edx                                     ; 0E86 _ 52
        push    eax                                     ; 0E87 _ 50
        call    showString                              ; 0E88 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E8D _ 83. C4, 20
        sub     esp, 8                                  ; 0E90 _ 83. EC, 08
        push    100                                     ; 0E93 _ 6A, 64
        push    dword [ebp-14H]                         ; 0E95 _ FF. 75, EC
        call    timer_settime                           ; 0E98 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E9D _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0EA0 _ 83. 45, F0, 08
        jmp     ?_038                                   ; 0EA4 _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0EA6 _ 55
        mov     ebp, esp                                ; 0EA7 _ 89. E5
        push    ebx                                     ; 0EA9 _ 53
        sub     esp, 4                                  ; 0EAA _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0EAD _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0EB0 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0EB3 _ 8B. 45, 0C
        dec     eax                                     ; 0EB6 _ 48
        sub     esp, 4                                  ; 0EB7 _ 83. EC, 04
        push    edx                                     ; 0EBA _ 52
        push    eax                                     ; 0EBB _ 50
        push    0                                       ; 0EBC _ 6A, 00
        push    0                                       ; 0EBE _ 6A, 00
        push    14                                      ; 0EC0 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0EC2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EC5 _ FF. 75, 08
        call    boxfill8                                ; 0EC8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ECD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0ED0 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0ED3 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0ED6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0ED9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0EDC _ 8B. 45, 10
        sub     eax, 28                                 ; 0EDF _ 83. E8, 1C
        sub     esp, 4                                  ; 0EE2 _ 83. EC, 04
        push    ecx                                     ; 0EE5 _ 51
        push    edx                                     ; 0EE6 _ 52
        push    eax                                     ; 0EE7 _ 50
        push    0                                       ; 0EE8 _ 6A, 00
        push    8                                       ; 0EEA _ 6A, 08
        push    dword [ebp+0CH]                         ; 0EEC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EEF _ FF. 75, 08
        call    boxfill8                                ; 0EF2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EF7 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0EFA _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0EFD _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0F00 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0F03 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0F06 _ 8B. 45, 10
        sub     eax, 27                                 ; 0F09 _ 83. E8, 1B
        sub     esp, 4                                  ; 0F0C _ 83. EC, 04
        push    ecx                                     ; 0F0F _ 51
        push    edx                                     ; 0F10 _ 52
        push    eax                                     ; 0F11 _ 50
        push    0                                       ; 0F12 _ 6A, 00
        push    7                                       ; 0F14 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F16 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F19 _ FF. 75, 08
        call    boxfill8                                ; 0F1C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F21 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F24 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0F27 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0F2A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0F2D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0F30 _ 8B. 45, 10
        sub     eax, 26                                 ; 0F33 _ 83. E8, 1A
        sub     esp, 4                                  ; 0F36 _ 83. EC, 04
        push    ecx                                     ; 0F39 _ 51
        push    edx                                     ; 0F3A _ 52
        push    eax                                     ; 0F3B _ 50
        push    0                                       ; 0F3C _ 6A, 00
        push    8                                       ; 0F3E _ 6A, 08
        push    dword [ebp+0CH]                         ; 0F40 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F43 _ FF. 75, 08
        call    boxfill8                                ; 0F46 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F4B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F4E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F51 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0F54 _ 8B. 45, 10
        sub     eax, 24                                 ; 0F57 _ 83. E8, 18
        sub     esp, 4                                  ; 0F5A _ 83. EC, 04
        push    edx                                     ; 0F5D _ 52
        push    59                                      ; 0F5E _ 6A, 3B
        push    eax                                     ; 0F60 _ 50
        push    3                                       ; 0F61 _ 6A, 03
        push    7                                       ; 0F63 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F65 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F68 _ FF. 75, 08
        call    boxfill8                                ; 0F6B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F70 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F73 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F76 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F79 _ 8B. 45, 10
        sub     eax, 24                                 ; 0F7C _ 83. E8, 18
        sub     esp, 4                                  ; 0F7F _ 83. EC, 04
        push    edx                                     ; 0F82 _ 52
        push    2                                       ; 0F83 _ 6A, 02
        push    eax                                     ; 0F85 _ 50
        push    2                                       ; 0F86 _ 6A, 02
        push    7                                       ; 0F88 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0F8A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0F8D _ FF. 75, 08
        call    boxfill8                                ; 0F90 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0F95 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0F98 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0F9B _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0F9E _ 8B. 45, 10
        sub     eax, 4                                  ; 0FA1 _ 83. E8, 04
        sub     esp, 4                                  ; 0FA4 _ 83. EC, 04
        push    edx                                     ; 0FA7 _ 52
        push    59                                      ; 0FA8 _ 6A, 3B
        push    eax                                     ; 0FAA _ 50
        push    3                                       ; 0FAB _ 6A, 03
        push    15                                      ; 0FAD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0FAF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FB2 _ FF. 75, 08
        call    boxfill8                                ; 0FB5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FBA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FBD _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0FC0 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0FC3 _ 8B. 45, 10
        sub     eax, 23                                 ; 0FC6 _ 83. E8, 17
        sub     esp, 4                                  ; 0FC9 _ 83. EC, 04
        push    edx                                     ; 0FCC _ 52
        push    59                                      ; 0FCD _ 6A, 3B
        push    eax                                     ; 0FCF _ 50
        push    59                                      ; 0FD0 _ 6A, 3B
        push    15                                      ; 0FD2 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0FD4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FD7 _ FF. 75, 08
        call    boxfill8                                ; 0FDA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0FDF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0FE2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0FE5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0FE8 _ 8B. 45, 10
        sub     eax, 3                                  ; 0FEB _ 83. E8, 03
        sub     esp, 4                                  ; 0FEE _ 83. EC, 04
        push    edx                                     ; 0FF1 _ 52
        push    59                                      ; 0FF2 _ 6A, 3B
        push    eax                                     ; 0FF4 _ 50
        push    2                                       ; 0FF5 _ 6A, 02
        push    0                                       ; 0FF7 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0FF9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0FFC _ FF. 75, 08
        call    boxfill8                                ; 0FFF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1004 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1007 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 100A _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 100D _ 8B. 45, 10
        sub     eax, 24                                 ; 1010 _ 83. E8, 18
        sub     esp, 4                                  ; 1013 _ 83. EC, 04
        push    edx                                     ; 1016 _ 52
        push    60                                      ; 1017 _ 6A, 3C
        push    eax                                     ; 1019 _ 50
        push    60                                      ; 101A _ 6A, 3C
        push    0                                       ; 101C _ 6A, 00
        push    dword [ebp+0CH]                         ; 101E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1021 _ FF. 75, 08
        call    boxfill8                                ; 1024 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1029 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 102C _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 102F _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1032 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1035 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1038 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 103B _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 103E _ 8B. 45, 0C
        sub     eax, 47                                 ; 1041 _ 83. E8, 2F
        sub     esp, 4                                  ; 1044 _ 83. EC, 04
        push    ebx                                     ; 1047 _ 53
        push    ecx                                     ; 1048 _ 51
        push    edx                                     ; 1049 _ 52
        push    eax                                     ; 104A _ 50
        push    15                                      ; 104B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 104D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1050 _ FF. 75, 08
        call    boxfill8                                ; 1053 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1058 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 105B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 105E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 1061 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 1064 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 1067 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 106A _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 106D _ 8B. 45, 0C
        sub     eax, 47                                 ; 1070 _ 83. E8, 2F
        sub     esp, 4                                  ; 1073 _ 83. EC, 04
        push    ebx                                     ; 1076 _ 53
        push    ecx                                     ; 1077 _ 51
        push    edx                                     ; 1078 _ 52
        push    eax                                     ; 1079 _ 50
        push    15                                      ; 107A _ 6A, 0F
        push    dword [ebp+0CH]                         ; 107C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 107F _ FF. 75, 08
        call    boxfill8                                ; 1082 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1087 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 108A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 108D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1090 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 1093 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 1096 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1099 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 109C _ 8B. 45, 0C
        sub     eax, 47                                 ; 109F _ 83. E8, 2F
        sub     esp, 4                                  ; 10A2 _ 83. EC, 04
        push    ebx                                     ; 10A5 _ 53
        push    ecx                                     ; 10A6 _ 51
        push    edx                                     ; 10A7 _ 52
        push    eax                                     ; 10A8 _ 50
        push    7                                       ; 10A9 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10AB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10AE _ FF. 75, 08
        call    boxfill8                                ; 10B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10B6 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 10B9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 10BC _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 10BF _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 10C2 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 10C5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 10C8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 10CB _ 8B. 45, 0C
        sub     eax, 3                                  ; 10CE _ 83. E8, 03
        sub     esp, 4                                  ; 10D1 _ 83. EC, 04
        push    ebx                                     ; 10D4 _ 53
        push    ecx                                     ; 10D5 _ 51
        push    edx                                     ; 10D6 _ 52
        push    eax                                     ; 10D7 _ 50
        push    7                                       ; 10D8 _ 6A, 07
        push    dword [ebp+0CH]                         ; 10DA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 10DD _ FF. 75, 08
        call    boxfill8                                ; 10E0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E5 _ 83. C4, 20
        nop                                             ; 10E8 _ 90
        mov     ebx, dword [ebp-4H]                     ; 10E9 _ 8B. 5D, FC
        leave                                           ; 10EC _ C9
        ret                                             ; 10ED _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 10EE _ 55
        mov     ebp, esp                                ; 10EF _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 10F1 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 10F4 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 10F7 _ A1, 00000134(d)
        add     eax, edx                                ; 10FC _ 01. D0
        mov     dword [mx], eax                         ; 10FE _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 1103 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1106 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 1109 _ A1, 00000138(d)
        add     eax, edx                                ; 110E _ 01. D0
        mov     dword [my], eax                         ; 1110 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 1115 _ A1, 00000134(d)
        test    eax, eax                                ; 111A _ 85. C0
        jns     ?_040                                   ; 111C _ 79, 0A
        mov     dword [mx], 0                           ; 111E _ C7. 05, 00000134(d), 00000000
?_040:  mov     eax, dword [my]                         ; 1128 _ A1, 00000138(d)
        test    eax, eax                                ; 112D _ 85. C0
        jns     ?_041                                   ; 112F _ 79, 0A
        mov     dword [my], 0                           ; 1131 _ C7. 05, 00000138(d), 00000000
?_041:  mov     edx, dword [xsize]                      ; 113B _ 8B. 15, 0000013C(d)
        mov     eax, dword [mx]                         ; 1141 _ A1, 00000134(d)
        cmp     edx, eax                                ; 1146 _ 39. C2
        jg      ?_042                                   ; 1148 _ 7F, 0B
        mov     eax, dword [xsize]                      ; 114A _ A1, 0000013C(d)
        dec     eax                                     ; 114F _ 48
        mov     dword [mx], eax                         ; 1150 _ A3, 00000134(d)
?_042:  mov     edx, dword [ysize]                      ; 1155 _ 8B. 15, 00000140(d)
        mov     eax, dword [my]                         ; 115B _ A1, 00000138(d)
        cmp     edx, eax                                ; 1160 _ 39. C2
        jg      ?_043                                   ; 1162 _ 7F, 0B
        mov     eax, dword [ysize]                      ; 1164 _ A1, 00000140(d)
        dec     eax                                     ; 1169 _ 48
        mov     dword [my], eax                         ; 116A _ A3, 00000138(d)
?_043:  nop                                             ; 116F _ 90
        pop     ebp                                     ; 1170 _ 5D
        ret                                             ; 1171 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1172 _ 55
        mov     ebp, esp                                ; 1173 _ 89. E5
        sub     esp, 24                                 ; 1175 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 1178 _ A1, 00000144(d)
        mov     dword [ebp-0CH], eax                    ; 117D _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 1180 _ C6. 45, F3, 00
        call    io_sti                                  ; 1184 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 1189 _ 83. EC, 0C
        push    mouseinfo                               ; 118C _ 68, 0000002C(d)
        call    fifo8_get                               ; 1191 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1196 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 1199 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 119C _ 0F B6. 45, F3
        sub     esp, 8                                  ; 11A0 _ 83. EC, 08
        push    eax                                     ; 11A3 _ 50
        push    mdec                                    ; 11A4 _ 68, 00000100(d)
        call    mouse_decode                            ; 11A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11AE _ 83. C4, 10
        test    eax, eax                                ; 11B1 _ 85. C0
        jz      ?_044                                   ; 11B3 _ 74, 60
        sub     esp, 4                                  ; 11B5 _ 83. EC, 04
        push    mdec                                    ; 11B8 _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 11BD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 11C0 _ FF. 75, 08
        call    computeMousePosition                    ; 11C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11C8 _ 83. C4, 10
        mov     edx, dword [my]                         ; 11CB _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 11D1 _ A1, 00000134(d)
        push    edx                                     ; 11D6 _ 52
        push    eax                                     ; 11D7 _ 50
        push    dword [ebp+10H]                         ; 11D8 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 11DB _ FF. 75, 08
        call    sheet_slide                             ; 11DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11E3 _ 83. C4, 10
        mov     eax, dword [?_240]                      ; 11E6 _ A1, 0000010C(d)
        and     eax, 01H                                ; 11EB _ 83. E0, 01
        test    eax, eax                                ; 11EE _ 85. C0
        jz      ?_044                                   ; 11F0 _ 74, 23
        mov     eax, dword [my]                         ; 11F2 _ A1, 00000138(d)
        lea     ecx, [eax-8H]                           ; 11F7 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 11FA _ A1, 00000134(d)
        lea     edx, [eax-50H]                          ; 11FF _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 1202 _ A1, 00000260(d)
        push    ecx                                     ; 1207 _ 51
        push    edx                                     ; 1208 _ 52
        push    eax                                     ; 1209 _ 50
        push    dword [ebp+8H]                          ; 120A _ FF. 75, 08
        call    sheet_slide                             ; 120D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1212 _ 83. C4, 10
?_044:  nop                                             ; 1215 _ 90
        leave                                           ; 1216 _ C9
        ret                                             ; 1217 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 1218 _ 55
        mov     ebp, esp                                ; 1219 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 121B _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 121E _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 1224 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 1227 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 122D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 1230 _ 66: C7. 40, 06, 01E0
        nop                                             ; 1236 _ 90
        pop     ebp                                     ; 1237 _ 5D
        ret                                             ; 1238 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 1239 _ 55
        mov     ebp, esp                                ; 123A _ 89. E5
        push    ebx                                     ; 123C _ 53
        sub     esp, 36                                 ; 123D _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 1240 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 1243 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1246 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1249 _ 89. 45, F4
        jmp     ?_046                                   ; 124C _ EB, 3C

?_045:  mov     eax, dword [ebp+1CH]                    ; 124E _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 1251 _ 8A. 00
        movzx   eax, al                                 ; 1253 _ 0F B6. C0
        shl     eax, 4                                  ; 1256 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1259 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 125F _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 1263 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1266 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1269 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 126C _ 8B. 00
        sub     esp, 8                                  ; 126E _ 83. EC, 08
        push    ebx                                     ; 1271 _ 53
        push    ecx                                     ; 1272 _ 51
        push    dword [ebp+14H]                         ; 1273 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 1276 _ FF. 75, 10
        push    edx                                     ; 1279 _ 52
        push    eax                                     ; 127A _ 50
        call    showFont8                               ; 127B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1280 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 1283 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 1287 _ FF. 45, 1C
?_046:  mov     eax, dword [ebp+1CH]                    ; 128A _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 128D _ 8A. 00
        test    al, al                                  ; 128F _ 84. C0
        jnz     ?_045                                   ; 1291 _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 1293 _ 8B. 45, 14
        add     eax, 16                                 ; 1296 _ 83. C0, 10
        sub     esp, 8                                  ; 1299 _ 83. EC, 08
        push    eax                                     ; 129C _ 50
        push    dword [ebp+10H]                         ; 129D _ FF. 75, 10
        push    dword [ebp+14H]                         ; 12A0 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 12A3 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 12A6 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 12A9 _ FF. 75, 08
        call    sheet_refresh                           ; 12AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12B1 _ 83. C4, 20
        nop                                             ; 12B4 _ 90
        mov     ebx, dword [ebp-4H]                     ; 12B5 _ 8B. 5D, FC
        leave                                           ; 12B8 _ C9
        ret                                             ; 12B9 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 12BA _ 55
        mov     ebp, esp                                ; 12BB _ 89. E5
        sub     esp, 8                                  ; 12BD _ 83. EC, 08
        sub     esp, 4                                  ; 12C0 _ 83. EC, 04
        push    table_rgb.1984                          ; 12C3 _ 68, 00000120(d)
        push    15                                      ; 12C8 _ 6A, 0F
        push    0                                       ; 12CA _ 6A, 00
        call    set_palette                             ; 12CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12D1 _ 83. C4, 10
        nop                                             ; 12D4 _ 90
        leave                                           ; 12D5 _ C9
        ret                                             ; 12D6 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 12D7 _ 55
        mov     ebp, esp                                ; 12D8 _ 89. E5
        sub     esp, 24                                 ; 12DA _ 83. EC, 18
        call    io_load_eflags                          ; 12DD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 12E2 _ 89. 45, F0
        call    io_cli                                  ; 12E5 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 12EA _ 83. EC, 08
        push    dword [ebp+8H]                          ; 12ED _ FF. 75, 08
        push    968                                     ; 12F0 _ 68, 000003C8
        call    io_out8                                 ; 12F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12FA _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 12FD _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 1300 _ 89. 45, F4
        jmp     ?_048                                   ; 1303 _ EB, 5F

?_047:  mov     eax, dword [ebp+10H]                    ; 1305 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 1308 _ 8A. 00
        shr     al, 2                                   ; 130A _ C0. E8, 02
        movzx   eax, al                                 ; 130D _ 0F B6. C0
        sub     esp, 8                                  ; 1310 _ 83. EC, 08
        push    eax                                     ; 1313 _ 50
        push    969                                     ; 1314 _ 68, 000003C9
        call    io_out8                                 ; 1319 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 131E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 1321 _ 8B. 45, 10
        inc     eax                                     ; 1324 _ 40
        mov     al, byte [eax]                          ; 1325 _ 8A. 00
        shr     al, 2                                   ; 1327 _ C0. E8, 02
        movzx   eax, al                                 ; 132A _ 0F B6. C0
        sub     esp, 8                                  ; 132D _ 83. EC, 08
        push    eax                                     ; 1330 _ 50
        push    969                                     ; 1331 _ 68, 000003C9
        call    io_out8                                 ; 1336 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 133B _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 133E _ 8B. 45, 10
        add     eax, 2                                  ; 1341 _ 83. C0, 02
        mov     al, byte [eax]                          ; 1344 _ 8A. 00
        shr     al, 2                                   ; 1346 _ C0. E8, 02
        movzx   eax, al                                 ; 1349 _ 0F B6. C0
        sub     esp, 8                                  ; 134C _ 83. EC, 08
        push    eax                                     ; 134F _ 50
        push    969                                     ; 1350 _ 68, 000003C9
        call    io_out8                                 ; 1355 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 135A _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 135D _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 1361 _ FF. 45, F4
?_048:  mov     eax, dword [ebp-0CH]                    ; 1364 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 1367 _ 3B. 45, 0C
        jle     ?_047                                   ; 136A _ 7E, 99
        sub     esp, 12                                 ; 136C _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 136F _ FF. 75, F0
        call    io_store_eflags                         ; 1372 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1377 _ 83. C4, 10
        nop                                             ; 137A _ 90
        leave                                           ; 137B _ C9
        ret                                             ; 137C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 137D _ 55
        mov     ebp, esp                                ; 137E _ 89. E5
        sub     esp, 20                                 ; 1380 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 1383 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 1386 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1389 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 138C _ 89. 45, F8
        jmp     ?_052                                   ; 138F _ EB, 30

?_049:  mov     eax, dword [ebp+14H]                    ; 1391 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 1394 _ 89. 45, FC
        jmp     ?_051                                   ; 1397 _ EB, 1D

?_050:  mov     eax, dword [ebp-8H]                     ; 1399 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 139C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 13A0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 13A2 _ 8B. 45, FC
        add     eax, edx                                ; 13A5 _ 01. D0
        mov     edx, eax                                ; 13A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 13A9 _ 8B. 45, 08
        add     edx, eax                                ; 13AC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 13AE _ 8A. 45, EC
        mov     byte [edx], al                          ; 13B1 _ 88. 02
        inc     dword [ebp-4H]                          ; 13B3 _ FF. 45, FC
?_051:  mov     eax, dword [ebp-4H]                     ; 13B6 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 13B9 _ 3B. 45, 1C
        jle     ?_050                                   ; 13BC _ 7E, DB
        inc     dword [ebp-8H]                          ; 13BE _ FF. 45, F8
?_052:  mov     eax, dword [ebp-8H]                     ; 13C1 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 13C4 _ 3B. 45, 20
        jle     ?_049                                   ; 13C7 _ 7E, C8
        nop                                             ; 13C9 _ 90
        nop                                             ; 13CA _ 90
        leave                                           ; 13CB _ C9
        ret                                             ; 13CC _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 13CD _ 55
        mov     ebp, esp                                ; 13CE _ 89. E5
        sub     esp, 20                                 ; 13D0 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 13D3 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 13D6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 13D9 _ C7. 45, FC, 00000000
        jmp     ?_062                                   ; 13E0 _ E9, 00000162

?_053:  mov     edx, dword [ebp-4H]                     ; 13E5 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 13E8 _ 8B. 45, 1C
        add     eax, edx                                ; 13EB _ 01. D0
        mov     al, byte [eax]                          ; 13ED _ 8A. 00
        mov     byte [ebp-5H], al                       ; 13EF _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 13F2 _ 80. 7D, FB, 00
        jns     ?_054                                   ; 13F6 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 13F8 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 13FB _ 8B. 45, FC
        add     eax, edx                                ; 13FE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1400 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1404 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1406 _ 8B. 45, 10
        add     eax, edx                                ; 1409 _ 01. D0
        mov     edx, eax                                ; 140B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 140D _ 8B. 45, 08
        add     edx, eax                                ; 1410 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1412 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1415 _ 88. 02
?_054:  movsx   eax, byte [ebp-5H]                      ; 1417 _ 0F BE. 45, FB
        and     eax, 40H                                ; 141B _ 83. E0, 40
        test    eax, eax                                ; 141E _ 85. C0
        jz      ?_055                                   ; 1420 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1422 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1425 _ 8B. 45, FC
        add     eax, edx                                ; 1428 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 142A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 142E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1430 _ 8B. 45, 10
        add     eax, edx                                ; 1433 _ 01. D0
        lea     edx, [eax+1H]                           ; 1435 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1438 _ 8B. 45, 08
        add     edx, eax                                ; 143B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 143D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1440 _ 88. 02
?_055:  movsx   eax, byte [ebp-5H]                      ; 1442 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1446 _ 83. E0, 20
        test    eax, eax                                ; 1449 _ 85. C0
        jz      ?_056                                   ; 144B _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 144D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1450 _ 8B. 45, FC
        add     eax, edx                                ; 1453 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1455 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1459 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 145B _ 8B. 45, 10
        add     eax, edx                                ; 145E _ 01. D0
        lea     edx, [eax+2H]                           ; 1460 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1463 _ 8B. 45, 08
        add     edx, eax                                ; 1466 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1468 _ 8A. 45, EC
        mov     byte [edx], al                          ; 146B _ 88. 02
?_056:  movsx   eax, byte [ebp-5H]                      ; 146D _ 0F BE. 45, FB
        and     eax, 10H                                ; 1471 _ 83. E0, 10
        test    eax, eax                                ; 1474 _ 85. C0
        jz      ?_057                                   ; 1476 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1478 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 147B _ 8B. 45, FC
        add     eax, edx                                ; 147E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1480 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1484 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1486 _ 8B. 45, 10
        add     eax, edx                                ; 1489 _ 01. D0
        lea     edx, [eax+3H]                           ; 148B _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 148E _ 8B. 45, 08
        add     edx, eax                                ; 1491 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1493 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1496 _ 88. 02
?_057:  movsx   eax, byte [ebp-5H]                      ; 1498 _ 0F BE. 45, FB
        and     eax, 08H                                ; 149C _ 83. E0, 08
        test    eax, eax                                ; 149F _ 85. C0
        jz      ?_058                                   ; 14A1 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14A3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14A6 _ 8B. 45, FC
        add     eax, edx                                ; 14A9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14AB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 14AF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14B1 _ 8B. 45, 10
        add     eax, edx                                ; 14B4 _ 01. D0
        lea     edx, [eax+4H]                           ; 14B6 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 14B9 _ 8B. 45, 08
        add     edx, eax                                ; 14BC _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14BE _ 8A. 45, EC
        mov     byte [edx], al                          ; 14C1 _ 88. 02
?_058:  movsx   eax, byte [ebp-5H]                      ; 14C3 _ 0F BE. 45, FB
        and     eax, 04H                                ; 14C7 _ 83. E0, 04
        test    eax, eax                                ; 14CA _ 85. C0
        jz      ?_059                                   ; 14CC _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14CE _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14D1 _ 8B. 45, FC
        add     eax, edx                                ; 14D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 14D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 14DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 14DC _ 8B. 45, 10
        add     eax, edx                                ; 14DF _ 01. D0
        lea     edx, [eax+5H]                           ; 14E1 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 14E4 _ 8B. 45, 08
        add     edx, eax                                ; 14E7 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 14E9 _ 8A. 45, EC
        mov     byte [edx], al                          ; 14EC _ 88. 02
?_059:  movsx   eax, byte [ebp-5H]                      ; 14EE _ 0F BE. 45, FB
        and     eax, 02H                                ; 14F2 _ 83. E0, 02
        test    eax, eax                                ; 14F5 _ 85. C0
        jz      ?_060                                   ; 14F7 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 14F9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 14FC _ 8B. 45, FC
        add     eax, edx                                ; 14FF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1501 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1505 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1507 _ 8B. 45, 10
        add     eax, edx                                ; 150A _ 01. D0
        lea     edx, [eax+6H]                           ; 150C _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 150F _ 8B. 45, 08
        add     edx, eax                                ; 1512 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1514 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1517 _ 88. 02
?_060:  movsx   eax, byte [ebp-5H]                      ; 1519 _ 0F BE. 45, FB
        and     eax, 01H                                ; 151D _ 83. E0, 01
        test    eax, eax                                ; 1520 _ 85. C0
        jz      ?_061                                   ; 1522 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1524 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1527 _ 8B. 45, FC
        add     eax, edx                                ; 152A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 152C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1530 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1532 _ 8B. 45, 10
        add     eax, edx                                ; 1535 _ 01. D0
        lea     edx, [eax+7H]                           ; 1537 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 153A _ 8B. 45, 08
        add     edx, eax                                ; 153D _ 01. C2
        mov     al, byte [ebp-14H]                      ; 153F _ 8A. 45, EC
        mov     byte [edx], al                          ; 1542 _ 88. 02
?_061:  inc     dword [ebp-4H]                          ; 1544 _ FF. 45, FC
?_062:  cmp     dword [ebp-4H], 15                      ; 1547 _ 83. 7D, FC, 0F
        jle     ?_053                                   ; 154B _ 0F 8E, FFFFFE94
        nop                                             ; 1551 _ 90
        nop                                             ; 1552 _ 90
        leave                                           ; 1553 _ C9
        ret                                             ; 1554 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1555 _ 55
        mov     ebp, esp                                ; 1556 _ 89. E5
        sub     esp, 20                                 ; 1558 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 155B _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 155E _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1561 _ C7. 45, F8, 00000000
        jmp     ?_069                                   ; 1568 _ E9, 000000AB

?_063:  mov     dword [ebp-4H], 0                       ; 156D _ C7. 45, FC, 00000000
        jmp     ?_068                                   ; 1574 _ E9, 00000092

?_064:  mov     eax, dword [ebp-8H]                     ; 1579 _ 8B. 45, F8
        shl     eax, 4                                  ; 157C _ C1. E0, 04
        mov     edx, eax                                ; 157F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1581 _ 8B. 45, FC
        add     eax, edx                                ; 1584 _ 01. D0
        add     eax, cursor.2031                        ; 1586 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 158B _ 8A. 00
        cmp     al, 42                                  ; 158D _ 3C, 2A
        jnz     ?_065                                   ; 158F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 1591 _ 8B. 45, F8
        shl     eax, 4                                  ; 1594 _ C1. E0, 04
        mov     edx, eax                                ; 1597 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1599 _ 8B. 45, FC
        add     eax, edx                                ; 159C _ 01. D0
        mov     edx, eax                                ; 159E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15A0 _ 8B. 45, 08
        add     eax, edx                                ; 15A3 _ 01. D0
        mov     byte [eax], 0                           ; 15A5 _ C6. 00, 00
?_065:  mov     eax, dword [ebp-8H]                     ; 15A8 _ 8B. 45, F8
        shl     eax, 4                                  ; 15AB _ C1. E0, 04
        mov     edx, eax                                ; 15AE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15B0 _ 8B. 45, FC
        add     eax, edx                                ; 15B3 _ 01. D0
        add     eax, cursor.2031                        ; 15B5 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 15BA _ 8A. 00
        cmp     al, 79                                  ; 15BC _ 3C, 4F
        jnz     ?_066                                   ; 15BE _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 15C0 _ 8B. 45, F8
        shl     eax, 4                                  ; 15C3 _ C1. E0, 04
        mov     edx, eax                                ; 15C6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15C8 _ 8B. 45, FC
        add     eax, edx                                ; 15CB _ 01. D0
        mov     edx, eax                                ; 15CD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15CF _ 8B. 45, 08
        add     eax, edx                                ; 15D2 _ 01. D0
        mov     byte [eax], 7                           ; 15D4 _ C6. 00, 07
?_066:  mov     eax, dword [ebp-8H]                     ; 15D7 _ 8B. 45, F8
        shl     eax, 4                                  ; 15DA _ C1. E0, 04
        mov     edx, eax                                ; 15DD _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15DF _ 8B. 45, FC
        add     eax, edx                                ; 15E2 _ 01. D0
        add     eax, cursor.2031                        ; 15E4 _ 05, 00000160(d)
        mov     al, byte [eax]                          ; 15E9 _ 8A. 00
        cmp     al, 46                                  ; 15EB _ 3C, 2E
        jnz     ?_067                                   ; 15ED _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 15EF _ 8B. 45, F8
        shl     eax, 4                                  ; 15F2 _ C1. E0, 04
        mov     edx, eax                                ; 15F5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 15F7 _ 8B. 45, FC
        add     eax, edx                                ; 15FA _ 01. D0
        mov     edx, eax                                ; 15FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15FE _ 8B. 45, 08
        add     edx, eax                                ; 1601 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1603 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1606 _ 88. 02
?_067:  inc     dword [ebp-4H]                          ; 1608 _ FF. 45, FC
?_068:  cmp     dword [ebp-4H], 15                      ; 160B _ 83. 7D, FC, 0F
        jle     ?_064                                   ; 160F _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 1615 _ FF. 45, F8
?_069:  cmp     dword [ebp-8H], 15                      ; 1618 _ 83. 7D, F8, 0F
        jle     ?_063                                   ; 161C _ 0F 8E, FFFFFF4B
        nop                                             ; 1622 _ 90
        nop                                             ; 1623 _ 90
        leave                                           ; 1624 _ C9
        ret                                             ; 1625 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1626 _ 55
        mov     ebp, esp                                ; 1627 _ 89. E5
        push    ebx                                     ; 1629 _ 53
        sub     esp, 16                                 ; 162A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 162D _ C7. 45, F4, 00000000
        jmp     ?_073                                   ; 1634 _ EB, 4D

?_070:  mov     dword [ebp-8H], 0                       ; 1636 _ C7. 45, F8, 00000000
        jmp     ?_072                                   ; 163D _ EB, 39

?_071:  mov     eax, dword [ebp-0CH]                    ; 163F _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1642 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1646 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1648 _ 8B. 45, F8
        add     eax, edx                                ; 164B _ 01. D0
        mov     edx, eax                                ; 164D _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 164F _ 8B. 45, 20
        add     eax, edx                                ; 1652 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1654 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 1657 _ 8B. 55, F4
        add     edx, ecx                                ; 165A _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 165C _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 1660 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1663 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1666 _ 01. D9
        add     edx, ecx                                ; 1668 _ 01. CA
        mov     ecx, edx                                ; 166A _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 166C _ 8B. 55, 08
        add     edx, ecx                                ; 166F _ 01. CA
        mov     al, byte [eax]                          ; 1671 _ 8A. 00
        mov     byte [edx], al                          ; 1673 _ 88. 02
        inc     dword [ebp-8H]                          ; 1675 _ FF. 45, F8
?_072:  mov     eax, dword [ebp-8H]                     ; 1678 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 167B _ 3B. 45, 10
        jl      ?_071                                   ; 167E _ 7C, BF
        inc     dword [ebp-0CH]                         ; 1680 _ FF. 45, F4
?_073:  mov     eax, dword [ebp-0CH]                    ; 1683 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1686 _ 3B. 45, 14
        jl      ?_070                                   ; 1689 _ 7C, AB
        nop                                             ; 168B _ 90
        nop                                             ; 168C _ 90
        add     esp, 16                                 ; 168D _ 83. C4, 10
        pop     ebx                                     ; 1690 _ 5B
        pop     ebp                                     ; 1691 _ 5D
        ret                                             ; 1692 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1693 _ 55
        mov     ebp, esp                                ; 1694 _ 89. E5
        sub     esp, 24                                 ; 1696 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 1699 _ A1, 00000008(d)
        mov     dword [ebp-0CH], eax                    ; 169E _ 89. 45, F4
        mov     eax, dword [?_237]                      ; 16A1 _ A1, 0000000C(d)
        cwde                                            ; 16A6 _ 98
        mov     dword [ebp-10H], eax                    ; 16A7 _ 89. 45, F0
        mov     ax, word [?_238]                        ; 16AA _ 66: A1, 0000000E(d)
        cwde                                            ; 16B0 _ 98
        mov     dword [ebp-14H], eax                    ; 16B1 _ 89. 45, EC
        sub     esp, 8                                  ; 16B4 _ 83. EC, 08
        push    32                                      ; 16B7 _ 6A, 20
        push    32                                      ; 16B9 _ 6A, 20
        call    io_out8                                 ; 16BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16C0 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 16C3 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 16C7 _ 83. EC, 0C
        push    96                                      ; 16CA _ 6A, 60
        call    io_in8                                  ; 16CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16D1 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 16D4 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 16D7 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 16DB _ 83. EC, 08
        push    eax                                     ; 16DE _ 50
        push    keyinfo                                 ; 16DF _ 68, 00000010(d)
        call    fifo8_put                               ; 16E4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16E9 _ 83. C4, 10
        nop                                             ; 16EC _ 90
        leave                                           ; 16ED _ C9
        ret                                             ; 16EE _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 16EF _ 55
        mov     ebp, esp                                ; 16F0 _ 89. E5
        sub     esp, 4                                  ; 16F2 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 16F5 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 16F8 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 16FB _ 80. 7D, FC, 09
        jle     ?_074                                   ; 16FF _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 1701 _ 8A. 45, FC
        add     eax, 55                                 ; 1704 _ 83. C0, 37
        jmp     ?_075                                   ; 1707 _ EB, 06

?_074:  mov     al, byte [ebp-4H]                       ; 1709 _ 8A. 45, FC
        add     eax, 48                                 ; 170C _ 83. C0, 30
?_075:  leave                                           ; 170F _ C9
        ret                                             ; 1710 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1711 _ 55
        mov     ebp, esp                                ; 1712 _ 89. E5
        sub     esp, 20                                 ; 1714 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 1717 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 171A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 171D _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1724 _ 8A. 45, EC
        and     eax, 0FH                                ; 1727 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 172A _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 172D _ 0F BE. 45, FB
        push    eax                                     ; 1731 _ 50
        call    charToHexVal                            ; 1732 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1737 _ 83. C4, 04
        mov     byte [?_236], al                        ; 173A _ A2, 00000103(d)
        mov     al, byte [ebp-14H]                      ; 173F _ 8A. 45, EC
        shr     al, 4                                   ; 1742 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1745 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 1748 _ 8A. 45, EC
        movsx   eax, al                                 ; 174B _ 0F BE. C0
        push    eax                                     ; 174E _ 50
        call    charToHexVal                            ; 174F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1754 _ 83. C4, 04
        mov     byte [?_235], al                        ; 1757 _ A2, 00000102(d)
        mov     eax, keyval                             ; 175C _ B8, 00000100(d)
        leave                                           ; 1761 _ C9
        ret                                             ; 1762 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1763 _ 55
        mov     ebp, esp                                ; 1764 _ 89. E5
        sub     esp, 16                                 ; 1766 _ 83. EC, 10
        mov     byte [str.2079], 48                     ; 1769 _ C6. 05, 00000374(d), 30
        mov     byte [?_241], 88                        ; 1770 _ C6. 05, 00000375(d), 58
        mov     byte [?_242], 0                         ; 1777 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 177E _ C7. 45, FC, 00000002
        jmp     ?_077                                   ; 1785 _ EB, 0E

?_076:  mov     eax, dword [ebp-4H]                     ; 1787 _ 8B. 45, FC
        add     eax, str.2079                           ; 178A _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 178F _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1792 _ FF. 45, FC
?_077:  cmp     dword [ebp-4H], 9                       ; 1795 _ 83. 7D, FC, 09
        jle     ?_076                                   ; 1799 _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 179B _ C7. 45, F8, 00000009
        jmp     ?_081                                   ; 17A2 _ EB, 41

?_078:  mov     eax, dword [ebp+8H]                     ; 17A4 _ 8B. 45, 08
        and     eax, 0FH                                ; 17A7 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 17AA _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 17AD _ 8B. 45, 08
        shr     eax, 4                                  ; 17B0 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 17B3 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 17B6 _ 83. 7D, F4, 09
        jle     ?_079                                   ; 17BA _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 17BC _ 8B. 45, F4
        add     eax, 55                                 ; 17BF _ 83. C0, 37
        mov     dl, al                                  ; 17C2 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 17C4 _ 8B. 45, F8
        add     eax, str.2079                           ; 17C7 _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 17CC _ 88. 10
        jmp     ?_080                                   ; 17CE _ EB, 12

?_079:  mov     eax, dword [ebp-0CH]                    ; 17D0 _ 8B. 45, F4
        add     eax, 48                                 ; 17D3 _ 83. C0, 30
        mov     dl, al                                  ; 17D6 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 17D8 _ 8B. 45, F8
        add     eax, str.2079                           ; 17DB _ 05, 00000374(d)
        mov     byte [eax], dl                          ; 17E0 _ 88. 10
?_080:  dec     dword [ebp-8H]                          ; 17E2 _ FF. 4D, F8
?_081:  cmp     dword [ebp-8H], 1                       ; 17E5 _ 83. 7D, F8, 01
        jle     ?_082                                   ; 17E9 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 17EB _ 83. 7D, 08, 00
        jnz     ?_078                                   ; 17EF _ 75, B3
?_082:  mov     eax, str.2079                           ; 17F1 _ B8, 00000374(d)
        leave                                           ; 17F6 _ C9
        ret                                             ; 17F7 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 17F8 _ 55
        mov     ebp, esp                                ; 17F9 _ 89. E5
        sub     esp, 8                                  ; 17FB _ 83. EC, 08
?_083:  sub     esp, 12                                 ; 17FE _ 83. EC, 0C
        push    100                                     ; 1801 _ 6A, 64
        call    io_in8                                  ; 1803 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1808 _ 83. C4, 10
        and     eax, 02H                                ; 180B _ 83. E0, 02
        test    eax, eax                                ; 180E _ 85. C0
        jz      ?_084                                   ; 1810 _ 74, 02
        jmp     ?_083                                   ; 1812 _ EB, EA

?_084:  nop                                             ; 1814 _ 90
        nop                                             ; 1815 _ 90
        leave                                           ; 1816 _ C9
        ret                                             ; 1817 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1818 _ 55
        mov     ebp, esp                                ; 1819 _ 89. E5
        sub     esp, 8                                  ; 181B _ 83. EC, 08
        call    wait_KBC_sendready                      ; 181E _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1823 _ 83. EC, 08
        push    96                                      ; 1826 _ 6A, 60
        push    100                                     ; 1828 _ 6A, 64
        call    io_out8                                 ; 182A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 182F _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1832 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1837 _ 83. EC, 08
        push    71                                      ; 183A _ 6A, 47
        push    96                                      ; 183C _ 6A, 60
        call    io_out8                                 ; 183E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1843 _ 83. C4, 10
        nop                                             ; 1846 _ 90
        leave                                           ; 1847 _ C9
        ret                                             ; 1848 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1849 _ 55
        mov     ebp, esp                                ; 184A _ 89. E5
        sub     esp, 8                                  ; 184C _ 83. EC, 08
        call    wait_KBC_sendready                      ; 184F _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1854 _ 83. EC, 08
        push    212                                     ; 1857 _ 68, 000000D4
        push    100                                     ; 185C _ 6A, 64
        call    io_out8                                 ; 185E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1863 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1866 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 186B _ 83. EC, 08
        push    244                                     ; 186E _ 68, 000000F4
        push    96                                      ; 1873 _ 6A, 60
        call    io_out8                                 ; 1875 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 187A _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 187D _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 1880 _ C6. 40, 03, 00
        nop                                             ; 1884 _ 90
        leave                                           ; 1885 _ C9
        ret                                             ; 1886 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1887 _ 55
        mov     ebp, esp                                ; 1888 _ 89. E5
        sub     esp, 24                                 ; 188A _ 83. EC, 18
        sub     esp, 8                                  ; 188D _ 83. EC, 08
        push    32                                      ; 1890 _ 6A, 20
        push    160                                     ; 1892 _ 68, 000000A0
        call    io_out8                                 ; 1897 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 189C _ 83. C4, 10
        sub     esp, 8                                  ; 189F _ 83. EC, 08
        push    32                                      ; 18A2 _ 6A, 20
        push    32                                      ; 18A4 _ 6A, 20
        call    io_out8                                 ; 18A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18AB _ 83. C4, 10
        sub     esp, 12                                 ; 18AE _ 83. EC, 0C
        push    96                                      ; 18B1 _ 6A, 60
        call    io_in8                                  ; 18B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B8 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 18BB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 18BE _ 0F B6. 45, F7
        sub     esp, 8                                  ; 18C2 _ 83. EC, 08
        push    eax                                     ; 18C5 _ 50
        push    mouseinfo                               ; 18C6 _ 68, 0000002C(d)
        call    fifo8_put                               ; 18CB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18D0 _ 83. C4, 10
        nop                                             ; 18D3 _ 90
        leave                                           ; 18D4 _ C9
        ret                                             ; 18D5 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 18D6 _ 55
        mov     ebp, esp                                ; 18D7 _ 89. E5
        sub     esp, 4                                  ; 18D9 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 18DC _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 18DF _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 18E2 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 18E5 _ 8A. 40, 03
        test    al, al                                  ; 18E8 _ 84. C0
        jnz     ?_086                                   ; 18EA _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 18EC _ 80. 7D, FC, FA
        jnz     ?_085                                   ; 18F0 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 18F2 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 18F5 _ C6. 40, 03, 01
?_085:  mov     eax, 0                                  ; 18F9 _ B8, 00000000
        jmp     ?_093                                   ; 18FE _ E9, 00000104

?_086:  mov     eax, dword [ebp+8H]                     ; 1903 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1906 _ 8A. 40, 03
        cmp     al, 1                                   ; 1909 _ 3C, 01
        jnz     ?_088                                   ; 190B _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 190D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1911 _ 25, 000000C8
        cmp     eax, 8                                  ; 1916 _ 83. F8, 08
        jnz     ?_087                                   ; 1919 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 191B _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 191E _ 8A. 55, FC
        mov     byte [eax], dl                          ; 1921 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1923 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1926 _ C6. 40, 03, 02
?_087:  mov     eax, 0                                  ; 192A _ B8, 00000000
        jmp     ?_093                                   ; 192F _ E9, 000000D3

?_088:  mov     eax, dword [ebp+8H]                     ; 1934 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1937 _ 8A. 40, 03
        cmp     al, 2                                   ; 193A _ 3C, 02
        jnz     ?_089                                   ; 193C _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 193E _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1941 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1944 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1947 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 194A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 194E _ B8, 00000000
        jmp     ?_093                                   ; 1953 _ E9, 000000AF

?_089:  mov     eax, dword [ebp+8H]                     ; 1958 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 195B _ 8A. 40, 03
        cmp     al, 3                                   ; 195E _ 3C, 03
        jne     ?_092                                   ; 1960 _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 1966 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1969 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 196C _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 196F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1972 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1976 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1979 _ 8A. 00
        movzx   eax, al                                 ; 197B _ 0F B6. C0
        and     eax, 07H                                ; 197E _ 83. E0, 07
        mov     edx, eax                                ; 1981 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1983 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1986 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1989 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 198C _ 8A. 40, 01
        movzx   edx, al                                 ; 198F _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1992 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1995 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1998 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 199B _ 8A. 40, 02
        movzx   edx, al                                 ; 199E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 19A1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 19A4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 19A7 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 19AA _ 8A. 00
        movzx   eax, al                                 ; 19AC _ 0F B6. C0
        and     eax, 10H                                ; 19AF _ 83. E0, 10
        test    eax, eax                                ; 19B2 _ 85. C0
        jz      ?_090                                   ; 19B4 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 19B6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 19B9 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 19BC _ 0D, FFFFFF00
        mov     edx, eax                                ; 19C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19C3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 19C6 _ 89. 50, 04
?_090:  mov     eax, dword [ebp+8H]                     ; 19C9 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 19CC _ 8A. 00
        movzx   eax, al                                 ; 19CE _ 0F B6. C0
        and     eax, 20H                                ; 19D1 _ 83. E0, 20
        test    eax, eax                                ; 19D4 _ 85. C0
        jz      ?_091                                   ; 19D6 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 19D8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 19DB _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 19DE _ 0D, FFFFFF00
        mov     edx, eax                                ; 19E3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19E5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 19E8 _ 89. 50, 08
?_091:  mov     eax, dword [ebp+8H]                     ; 19EB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 19EE _ 8B. 40, 08
        neg     eax                                     ; 19F1 _ F7. D8
        mov     edx, eax                                ; 19F3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19F5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 19F8 _ 89. 50, 08
        mov     eax, 1                                  ; 19FB _ B8, 00000001
        jmp     ?_093                                   ; 1A00 _ EB, 05

?_092:  mov     eax, 4294967295                         ; 1A02 _ B8, FFFFFFFF
?_093:  leave                                           ; 1A07 _ C9
        ret                                             ; 1A08 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 1A09 _ 55
        mov     ebp, esp                                ; 1A0A _ 89. E5
        sub     esp, 40                                 ; 1A0C _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 1A0F _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1A16 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1A1D _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1A24 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 1A2B _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 1A31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A34 _ 8B. 00
        sub     esp, 4                                  ; 1A36 _ 83. EC, 04
        push    edx                                     ; 1A39 _ 52
        push    dword [ebp+1CH]                         ; 1A3A _ FF. 75, 1C
        push    eax                                     ; 1A3D _ 50
        call    init_screen8                            ; 1A3E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A43 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1A46 _ 8B. 45, 20
        movsx   eax, al                                 ; 1A49 _ 0F BE. C0
        sub     esp, 8                                  ; 1A4C _ 83. EC, 08
        push    ?_231                                   ; 1A4F _ 68, 00000028(d)
        push    eax                                     ; 1A54 _ 50
        push    dword [ebp-10H]                         ; 1A55 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1A58 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1A5B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A5E _ FF. 75, 08
        call    showString                              ; 1A61 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A66 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1A69 _ 8B. 45, 18
        sub     esp, 12                                 ; 1A6C _ 83. EC, 0C
        push    eax                                     ; 1A6F _ 50
        call    intToHexStr                             ; 1A70 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A75 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1A78 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1A7B _ 8B. 45, 20
        movsx   eax, al                                 ; 1A7E _ 0F BE. C0
        sub     esp, 8                                  ; 1A81 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1A84 _ FF. 75, E4
        push    eax                                     ; 1A87 _ 50
        push    dword [ebp-10H]                         ; 1A88 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1A8B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1A8E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A91 _ FF. 75, 08
        call    showString                              ; 1A94 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A99 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1A9C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1AA0 _ 8B. 45, 20
        movsx   eax, al                                 ; 1AA3 _ 0F BE. C0
        sub     esp, 8                                  ; 1AA6 _ 83. EC, 08
        push    ?_232                                   ; 1AA9 _ 68, 00000032(d)
        push    eax                                     ; 1AAE _ 50
        push    dword [ebp-10H]                         ; 1AAF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1AB2 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1AB5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AB8 _ FF. 75, 08
        call    showString                              ; 1ABB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AC0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1AC3 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1AC6 _ 8B. 00
        sub     esp, 12                                 ; 1AC8 _ 83. EC, 0C
        push    eax                                     ; 1ACB _ 50
        call    intToHexStr                             ; 1ACC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AD1 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1AD4 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 1AD7 _ 8B. 45, 20
        movsx   eax, al                                 ; 1ADA _ 0F BE. C0
        sub     esp, 8                                  ; 1ADD _ 83. EC, 08
        push    dword [ebp-20H]                         ; 1AE0 _ FF. 75, E0
        push    eax                                     ; 1AE3 _ 50
        push    dword [ebp-10H]                         ; 1AE4 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1AE7 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1AEA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1AED _ FF. 75, 08
        call    showString                              ; 1AF0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1AF5 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1AF8 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1AFC _ 8B. 45, 20
        movsx   eax, al                                 ; 1AFF _ 0F BE. C0
        sub     esp, 8                                  ; 1B02 _ 83. EC, 08
        push    ?_233                                   ; 1B05 _ 68, 0000003E(d)
        push    eax                                     ; 1B0A _ 50
        push    dword [ebp-10H]                         ; 1B0B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1B0E _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1B11 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B14 _ FF. 75, 08
        call    showString                              ; 1B17 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B1C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B1F _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1B22 _ 8B. 40, 04
        sub     esp, 12                                 ; 1B25 _ 83. EC, 0C
        push    eax                                     ; 1B28 _ 50
        call    intToHexStr                             ; 1B29 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B2E _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1B31 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1B34 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B37 _ 0F BE. C0
        sub     esp, 8                                  ; 1B3A _ 83. EC, 08
        push    dword [ebp-24H]                         ; 1B3D _ FF. 75, DC
        push    eax                                     ; 1B40 _ 50
        push    dword [ebp-10H]                         ; 1B41 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1B44 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1B47 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B4A _ FF. 75, 08
        call    showString                              ; 1B4D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B52 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1B55 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1B59 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B5C _ 0F BE. C0
        sub     esp, 8                                  ; 1B5F _ 83. EC, 08
        push    ?_234                                   ; 1B62 _ 68, 0000004A(d)
        push    eax                                     ; 1B67 _ 50
        push    dword [ebp-10H]                         ; 1B68 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1B6B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1B6E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1B71 _ FF. 75, 08
        call    showString                              ; 1B74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1B79 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1B7C _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1B7F _ 8B. 40, 08
        sub     esp, 12                                 ; 1B82 _ 83. EC, 0C
        push    eax                                     ; 1B85 _ 50
        call    intToHexStr                             ; 1B86 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B8B _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 1B8E _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 1B91 _ 8B. 45, 20
        movsx   eax, al                                 ; 1B94 _ 0F BE. C0
        sub     esp, 8                                  ; 1B97 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1B9A _ FF. 75, D8
        push    eax                                     ; 1B9D _ 50
        push    dword [ebp-10H]                         ; 1B9E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1BA1 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1BA4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1BA7 _ FF. 75, 08
        call    showString                              ; 1BAA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BAF _ 83. C4, 20
        nop                                             ; 1BB2 _ 90
        leave                                           ; 1BB3 _ C9
        ret                                             ; 1BB4 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1BB5 _ 55
        mov     ebp, esp                                ; 1BB6 _ 89. E5
        sub     esp, 24                                 ; 1BB8 _ 83. EC, 18
        sub     esp, 12                                 ; 1BBB _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1BBE _ FF. 75, 08
        call    sheet_alloc                             ; 1BC1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BC6 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1BC9 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1BCC _ A1, 00000000(d)
        sub     esp, 8                                  ; 1BD1 _ 83. EC, 08
        push    10880                                   ; 1BD4 _ 68, 00002A80
        push    eax                                     ; 1BD9 _ 50
        call    memman_alloc_4k                         ; 1BDA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BDF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1BE2 _ 89. 45, F0
        sub     esp, 12                                 ; 1BE5 _ 83. EC, 0C
        push    -1                                      ; 1BE8 _ 6A, FF
        push    68                                      ; 1BEA _ 6A, 44
        push    160                                     ; 1BEC _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1BF1 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1BF4 _ FF. 75, F4
        call    sheet_setbuf                            ; 1BF7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BFC _ 83. C4, 20
        push    1                                       ; 1BFF _ 6A, 01
        push    dword [ebp+0CH]                         ; 1C01 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1C04 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1C07 _ FF. 75, 08
        call    make_window8                            ; 1C0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C0F _ 83. C4, 10
        sub     esp, 8                                  ; 1C12 _ 83. EC, 08
        push    7                                       ; 1C15 _ 6A, 07
        push    16                                      ; 1C17 _ 6A, 10
        push    144                                     ; 1C19 _ 68, 00000090
        push    28                                      ; 1C1E _ 6A, 1C
        push    8                                       ; 1C20 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C22 _ FF. 75, F4
        call    make_textbox8                           ; 1C25 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C2A _ 83. C4, 20
        push    172                                     ; 1C2D _ 68, 000000AC
        push    260                                     ; 1C32 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1C37 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1C3A _ FF. 75, 08
        call    sheet_slide                             ; 1C3D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C42 _ 83. C4, 10
        sub     esp, 4                                  ; 1C45 _ 83. EC, 04
        push    2                                       ; 1C48 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1C4A _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1C4D _ FF. 75, 08
        call    sheet_updown                            ; 1C50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C55 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1C58 _ 8B. 45, F4
        leave                                           ; 1C5B _ C9
        ret                                             ; 1C5C _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1C5D _ 55
        mov     ebp, esp                                ; 1C5E _ 89. E5
        push    ebx                                     ; 1C60 _ 53
        sub     esp, 36                                 ; 1C61 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1C64 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1C67 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1C6A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1C6D _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1C70 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1C73 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1C76 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1C79 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1C7C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C7F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C82 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C85 _ 8B. 00
        push    0                                       ; 1C87 _ 6A, 00
        push    edx                                     ; 1C89 _ 52
        push    0                                       ; 1C8A _ 6A, 00
        push    0                                       ; 1C8C _ 6A, 00
        push    8                                       ; 1C8E _ 6A, 08
        push    dword [ebp-0CH]                         ; 1C90 _ FF. 75, F4
        push    eax                                     ; 1C93 _ 50
        call    boxfill8                                ; 1C94 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C99 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1C9C _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C9F _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1CA2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CA5 _ 8B. 00
        push    1                                       ; 1CA7 _ 6A, 01
        push    edx                                     ; 1CA9 _ 52
        push    1                                       ; 1CAA _ 6A, 01
        push    1                                       ; 1CAC _ 6A, 01
        push    7                                       ; 1CAE _ 6A, 07
        push    dword [ebp-0CH]                         ; 1CB0 _ FF. 75, F4
        push    eax                                     ; 1CB3 _ 50
        call    boxfill8                                ; 1CB4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CB9 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1CBC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1CBF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CC2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CC5 _ 8B. 00
        push    edx                                     ; 1CC7 _ 52
        push    0                                       ; 1CC8 _ 6A, 00
        push    0                                       ; 1CCA _ 6A, 00
        push    0                                       ; 1CCC _ 6A, 00
        push    8                                       ; 1CCE _ 6A, 08
        push    dword [ebp-0CH]                         ; 1CD0 _ FF. 75, F4
        push    eax                                     ; 1CD3 _ 50
        call    boxfill8                                ; 1CD4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CD9 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1CDC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1CDF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1CE2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CE5 _ 8B. 00
        push    edx                                     ; 1CE7 _ 52
        push    1                                       ; 1CE8 _ 6A, 01
        push    1                                       ; 1CEA _ 6A, 01
        push    1                                       ; 1CEC _ 6A, 01
        push    7                                       ; 1CEE _ 6A, 07
        push    dword [ebp-0CH]                         ; 1CF0 _ FF. 75, F4
        push    eax                                     ; 1CF3 _ 50
        call    boxfill8                                ; 1CF4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1CF9 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1CFC _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1CFF _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D02 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D05 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D08 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D0B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D0E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D11 _ 8B. 00
        push    ebx                                     ; 1D13 _ 53
        push    ecx                                     ; 1D14 _ 51
        push    1                                       ; 1D15 _ 6A, 01
        push    edx                                     ; 1D17 _ 52
        push    15                                      ; 1D18 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1D1A _ FF. 75, F4
        push    eax                                     ; 1D1D _ 50
        call    boxfill8                                ; 1D1E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D23 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D26 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D29 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D2C _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D2F _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D32 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D35 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D38 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D3B _ 8B. 00
        push    ebx                                     ; 1D3D _ 53
        push    ecx                                     ; 1D3E _ 51
        push    0                                       ; 1D3F _ 6A, 00
        push    edx                                     ; 1D41 _ 52
        push    0                                       ; 1D42 _ 6A, 00
        push    dword [ebp-0CH]                         ; 1D44 _ FF. 75, F4
        push    eax                                     ; 1D47 _ 50
        call    boxfill8                                ; 1D48 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D4D _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D50 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1D53 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1D56 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1D59 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1D5C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D5F _ 8B. 00
        push    ecx                                     ; 1D61 _ 51
        push    edx                                     ; 1D62 _ 52
        push    2                                       ; 1D63 _ 6A, 02
        push    2                                       ; 1D65 _ 6A, 02
        push    8                                       ; 1D67 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1D69 _ FF. 75, F4
        push    eax                                     ; 1D6C _ 50
        call    boxfill8                                ; 1D6D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D72 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 1D75 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1D78 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1D7B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D7E _ 8B. 00
        push    20                                      ; 1D80 _ 6A, 14
        push    edx                                     ; 1D82 _ 52
        push    3                                       ; 1D83 _ 6A, 03
        push    3                                       ; 1D85 _ 6A, 03
        push    12                                      ; 1D87 _ 6A, 0C
        push    dword [ebp-0CH]                         ; 1D89 _ FF. 75, F4
        push    eax                                     ; 1D8C _ 50
        call    boxfill8                                ; 1D8D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1D92 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1D95 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1D98 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D9B _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D9E _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1DA1 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1DA4 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1DA7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DAA _ 8B. 00
        push    ebx                                     ; 1DAC _ 53
        push    ecx                                     ; 1DAD _ 51
        push    edx                                     ; 1DAE _ 52
        push    1                                       ; 1DAF _ 6A, 01
        push    15                                      ; 1DB1 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 1DB3 _ FF. 75, F4
        push    eax                                     ; 1DB6 _ 50
        call    boxfill8                                ; 1DB7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DBC _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 1DBF _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1DC2 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1DC5 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1DC8 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1DCB _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1DCE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1DD1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DD4 _ 8B. 00
        push    ebx                                     ; 1DD6 _ 53
        push    ecx                                     ; 1DD7 _ 51
        push    edx                                     ; 1DD8 _ 52
        push    0                                       ; 1DD9 _ 6A, 00
        push    0                                       ; 1DDB _ 6A, 00
        push    dword [ebp-0CH]                         ; 1DDD _ FF. 75, F4
        push    eax                                     ; 1DE0 _ 50
        call    boxfill8                                ; 1DE1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1DE6 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 1DE9 _ 0F BE. 45, E4
        push    eax                                     ; 1DED _ 50
        push    dword [ebp+10H]                         ; 1DEE _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1DF1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1DF4 _ FF. 75, 08
        call    make_wtitle8                            ; 1DF7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1DFC _ 83. C4, 10
        nop                                             ; 1DFF _ 90
        mov     ebx, dword [ebp-4H]                     ; 1E00 _ 8B. 5D, FC
        leave                                           ; 1E03 _ C9
        ret                                             ; 1E04 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 1E05 _ 55
        mov     ebp, esp                                ; 1E06 _ 89. E5
        push    ebx                                     ; 1E08 _ 53
        sub     esp, 36                                 ; 1E09 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 1E0C _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1E0F _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1E12 _ 80. 7D, E4, 00
        jz      ?_094                                   ; 1E16 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1E18 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1E1C _ C6. 45, ED, 0C
        jmp     ?_095                                   ; 1E20 _ EB, 08

?_094:  mov     byte [ebp-12H], 8                       ; 1E22 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1E26 _ C6. 45, ED, 0F
?_095:  mov     eax, dword [ebp+0CH]                    ; 1E2A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E2D _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E30 _ 8D. 58, FC
        mov     al, byte [ebp-13H]                      ; 1E33 _ 8A. 45, ED
        movzx   ecx, al                                 ; 1E36 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1E39 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1E3C _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1E3F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E42 _ 8B. 00
        push    20                                      ; 1E44 _ 6A, 14
        push    ebx                                     ; 1E46 _ 53
        push    3                                       ; 1E47 _ 6A, 03
        push    3                                       ; 1E49 _ 6A, 03
        push    ecx                                     ; 1E4B _ 51
        push    edx                                     ; 1E4C _ 52
        push    eax                                     ; 1E4D _ 50
        call    boxfill8                                ; 1E4E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1E53 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 1E56 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 1E5A _ 83. EC, 08
        push    dword [ebp+10H]                         ; 1E5D _ FF. 75, 10
        push    eax                                     ; 1E60 _ 50
        push    4                                       ; 1E61 _ 6A, 04
        push    24                                      ; 1E63 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1E65 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1E68 _ FF. 75, 08
        call    showString                              ; 1E6B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1E70 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1E73 _ C7. 45, F0, 00000000
        jmp     ?_103                                   ; 1E7A _ EB, 7F

?_096:  mov     dword [ebp-0CH], 0                      ; 1E7C _ C7. 45, F4, 00000000
        jmp     ?_102                                   ; 1E83 _ EB, 6D

?_097:  mov     eax, dword [ebp-10H]                    ; 1E85 _ 8B. 45, F0
        shl     eax, 4                                  ; 1E88 _ C1. E0, 04
        mov     edx, eax                                ; 1E8B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E8D _ 8B. 45, F4
        add     eax, edx                                ; 1E90 _ 01. D0
        add     eax, closebtn.2150                      ; 1E92 _ 05, 00000260(d)
        mov     al, byte [eax]                          ; 1E97 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1E99 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1E9C _ 80. 7D, EF, 40
        jnz     ?_098                                   ; 1EA0 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1EA2 _ C6. 45, EF, 00
        jmp     ?_101                                   ; 1EA6 _ EB, 1C

?_098:  cmp     byte [ebp-11H], 36                      ; 1EA8 _ 80. 7D, EF, 24
        jnz     ?_099                                   ; 1EAC _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1EAE _ C6. 45, EF, 0F
        jmp     ?_101                                   ; 1EB2 _ EB, 10

?_099:  cmp     byte [ebp-11H], 81                      ; 1EB4 _ 80. 7D, EF, 51
        jnz     ?_100                                   ; 1EB8 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1EBA _ C6. 45, EF, 08
        jmp     ?_101                                   ; 1EBE _ EB, 04

?_100:  mov     byte [ebp-11H], 7                       ; 1EC0 _ C6. 45, EF, 07
?_101:  mov     eax, dword [ebp+0CH]                    ; 1EC4 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1EC7 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1EC9 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1ECC _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1ECF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ED2 _ 8B. 40, 04
        imul    ecx, eax                                ; 1ED5 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1ED8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDB _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EDE _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1EE1 _ 8B. 45, F4
        add     eax, ebx                                ; 1EE4 _ 01. D8
        add     eax, ecx                                ; 1EE6 _ 01. C8
        add     edx, eax                                ; 1EE8 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1EEA _ 8A. 45, EF
        mov     byte [edx], al                          ; 1EED _ 88. 02
        inc     dword [ebp-0CH]                         ; 1EEF _ FF. 45, F4
?_102:  cmp     dword [ebp-0CH], 15                     ; 1EF2 _ 83. 7D, F4, 0F
        jle     ?_097                                   ; 1EF6 _ 7E, 8D
        inc     dword [ebp-10H]                         ; 1EF8 _ FF. 45, F0
?_103:  cmp     dword [ebp-10H], 13                     ; 1EFB _ 83. 7D, F0, 0D
        jle     ?_096                                   ; 1EFF _ 0F 8E, FFFFFF77
        nop                                             ; 1F05 _ 90
        nop                                             ; 1F06 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1F07 _ 8B. 5D, FC
        leave                                           ; 1F0A _ C9
        ret                                             ; 1F0B _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1F0C _ 55
        mov     ebp, esp                                ; 1F0D _ 89. E5
        push    edi                                     ; 1F0F _ 57
        push    esi                                     ; 1F10 _ 56
        push    ebx                                     ; 1F11 _ 53
        sub     esp, 16                                 ; 1F12 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1F15 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1F18 _ 8B. 45, 14
        add     eax, edx                                ; 1F1B _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1F1D _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1F20 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1F23 _ 8B. 45, 18
        add     eax, edx                                ; 1F26 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1F28 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1F2B _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1F2E _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1F31 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1F34 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1F37 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F3A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1F3D _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1F40 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1F43 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F46 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F49 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F4C _ 8B. 00
        push    edi                                     ; 1F4E _ 57
        push    esi                                     ; 1F4F _ 56
        push    ebx                                     ; 1F50 _ 53
        push    ecx                                     ; 1F51 _ 51
        push    15                                      ; 1F52 _ 6A, 0F
        push    edx                                     ; 1F54 _ 52
        push    eax                                     ; 1F55 _ 50
        call    boxfill8                                ; 1F56 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F5B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1F5E _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1F61 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1F64 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1F67 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1F6A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F6D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1F70 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1F73 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1F76 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F79 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F7C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F7F _ 8B. 00
        push    edi                                     ; 1F81 _ 57
        push    esi                                     ; 1F82 _ 56
        push    ebx                                     ; 1F83 _ 53
        push    ecx                                     ; 1F84 _ 51
        push    15                                      ; 1F85 _ 6A, 0F
        push    edx                                     ; 1F87 _ 52
        push    eax                                     ; 1F88 _ 50
        call    boxfill8                                ; 1F89 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1F8E _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1F91 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1F94 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1F97 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1F9A _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1F9D _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1FA0 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1FA3 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1FA6 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1FA9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FAC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FAF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FB2 _ 8B. 00
        push    edi                                     ; 1FB4 _ 57
        push    esi                                     ; 1FB5 _ 56
        push    ebx                                     ; 1FB6 _ 53
        push    ecx                                     ; 1FB7 _ 51
        push    7                                       ; 1FB8 _ 6A, 07
        push    edx                                     ; 1FBA _ 52
        push    eax                                     ; 1FBB _ 50
        call    boxfill8                                ; 1FBC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FC1 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1FC4 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1FC7 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1FCA _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1FCD _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1FD0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1FD3 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1FD6 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1FD9 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1FDC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FDF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FE2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FE5 _ 8B. 00
        push    edi                                     ; 1FE7 _ 57
        push    esi                                     ; 1FE8 _ 56
        push    ebx                                     ; 1FE9 _ 53
        push    ecx                                     ; 1FEA _ 51
        push    7                                       ; 1FEB _ 6A, 07
        push    edx                                     ; 1FED _ 52
        push    eax                                     ; 1FEE _ 50
        call    boxfill8                                ; 1FEF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1FF4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1FF7 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1FFA _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1FFD _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2000 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 2003 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 2006 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2009 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 200C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 200F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2012 _ 8B. 00
        push    esi                                     ; 2014 _ 56
        push    dword [ebp-10H]                         ; 2015 _ FF. 75, F0
        push    ebx                                     ; 2018 _ 53
        push    ecx                                     ; 2019 _ 51
        push    0                                       ; 201A _ 6A, 00
        push    edx                                     ; 201C _ 52
        push    eax                                     ; 201D _ 50
        call    boxfill8                                ; 201E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2023 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 2026 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 2029 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 202C _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 202F _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 2032 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 2035 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 2038 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 203B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 203E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2041 _ 8B. 00
        push    dword [ebp-14H]                         ; 2043 _ FF. 75, EC
        push    esi                                     ; 2046 _ 56
        push    ebx                                     ; 2047 _ 53
        push    ecx                                     ; 2048 _ 51
        push    0                                       ; 2049 _ 6A, 00
        push    edx                                     ; 204B _ 52
        push    eax                                     ; 204C _ 50
        call    boxfill8                                ; 204D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2052 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 2055 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 2058 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 205B _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 205E _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 2061 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 2064 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 2067 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 206A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 206D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2070 _ 8B. 00
        push    esi                                     ; 2072 _ 56
        push    dword [ebp-10H]                         ; 2073 _ FF. 75, F0
        push    ebx                                     ; 2076 _ 53
        push    ecx                                     ; 2077 _ 51
        push    8                                       ; 2078 _ 6A, 08
        push    edx                                     ; 207A _ 52
        push    eax                                     ; 207B _ 50
        call    boxfill8                                ; 207C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 2081 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 2084 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 2087 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 208A _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 208D _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 2090 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2093 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 2096 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2099 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 209C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 209F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20A5 _ 8B. 00
        push    edi                                     ; 20A7 _ 57
        push    esi                                     ; 20A8 _ 56
        push    ebx                                     ; 20A9 _ 53
        push    ecx                                     ; 20AA _ 51
        push    8                                       ; 20AB _ 6A, 08
        push    edx                                     ; 20AD _ 52
        push    eax                                     ; 20AE _ 50
        call    boxfill8                                ; 20AF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 20B4 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 20B7 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 20BA _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 20BD _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 20C0 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 20C3 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 20C6 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 20C9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 20CC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20CF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20D2 _ 8B. 00
        push    dword [ebp-14H]                         ; 20D4 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 20D7 _ FF. 75, F0
        push    esi                                     ; 20DA _ 56
        push    ebx                                     ; 20DB _ 53
        push    ecx                                     ; 20DC _ 51
        push    edx                                     ; 20DD _ 52
        push    eax                                     ; 20DE _ 50
        call    boxfill8                                ; 20DF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 20E4 _ 83. C4, 1C
        nop                                             ; 20E7 _ 90
        lea     esp, [ebp-0CH]                          ; 20E8 _ 8D. 65, F4
        pop     ebx                                     ; 20EB _ 5B
        pop     esi                                     ; 20EC _ 5E
        pop     edi                                     ; 20ED _ 5F
        pop     ebp                                     ; 20EE _ 5D
        ret                                             ; 20EF _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 20F0 _ 55
        mov     ebp, esp                                ; 20F1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 20F3 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 20F6 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 20FC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20FF _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2106 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2109 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2110 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2113 _ C7. 40, 0C, 00000000
        nop                                             ; 211A _ 90
        pop     ebp                                     ; 211B _ 5D
        ret                                             ; 211C _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 211D _ 55
        mov     ebp, esp                                ; 211E _ 89. E5
        sub     esp, 16                                 ; 2120 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2123 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 212A _ C7. 45, FC, 00000000
        jmp     ?_105                                   ; 2131 _ EB, 13

?_104:  mov     eax, dword [ebp+8H]                     ; 2133 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2136 _ 8B. 55, FC
        add     edx, 2                                  ; 2139 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 213C _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 2140 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 2143 _ FF. 45, FC
?_105:  mov     eax, dword [ebp+8H]                     ; 2146 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2149 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 214B _ 39. 45, FC
        jc      ?_104                                   ; 214E _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 2150 _ 8B. 45, F8
        leave                                           ; 2153 _ C9
        ret                                             ; 2154 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2155 _ 55
        mov     ebp, esp                                ; 2156 _ 89. E5
        sub     esp, 16                                 ; 2158 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 215B _ C7. 45, FC, 00000000
        jmp     ?_109                                   ; 2162 _ E9, 00000084

?_106:  mov     eax, dword [ebp+8H]                     ; 2167 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 216A _ 8B. 55, FC
        add     edx, 2                                  ; 216D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2170 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 2174 _ 39. 45, 0C
        ja      ?_108                                   ; 2177 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 2179 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 217C _ 8B. 55, FC
        add     edx, 2                                  ; 217F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2182 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 2185 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2188 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 218B _ 8B. 55, FC
        add     edx, 2                                  ; 218E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2191 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2194 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2197 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 219A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 219D _ 8B. 55, FC
        add     edx, 2                                  ; 21A0 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 21A3 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 21A6 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21A9 _ 8B. 55, FC
        add     edx, 2                                  ; 21AC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 21AF _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 21B3 _ 2B. 45, 0C
        mov     edx, eax                                ; 21B6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 21B8 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 21BB _ 8B. 4D, FC
        add     ecx, 2                                  ; 21BE _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 21C1 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 21C5 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 21C8 _ 8B. 55, FC
        add     edx, 2                                  ; 21CB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 21CE _ 8B. 44 D0, 04
        test    eax, eax                                ; 21D2 _ 85. C0
        jnz     ?_107                                   ; 21D4 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 21D6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21D9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 21DB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21DE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 21E1 _ 89. 10
?_107:  mov     eax, dword [ebp-8H]                     ; 21E3 _ 8B. 45, F8
        jmp     ?_110                                   ; 21E6 _ EB, 16

?_108:  inc     dword [ebp-4H]                          ; 21E8 _ FF. 45, FC
?_109:  mov     eax, dword [ebp+8H]                     ; 21EB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21EE _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 21F0 _ 39. 45, FC
        jc      ?_106                                   ; 21F3 _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 21F9 _ B8, 00000000
?_110:  leave                                           ; 21FE _ C9
        ret                                             ; 21FF _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2200 _ 55
        mov     ebp, esp                                ; 2201 _ 89. E5
        push    ebx                                     ; 2203 _ 53
        sub     esp, 16                                 ; 2204 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2207 _ C7. 45, F8, 00000000
        jmp     ?_112                                   ; 220E _ EB, 14

?_111:  mov     eax, dword [ebp+8H]                     ; 2210 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2213 _ 8B. 55, F8
        add     edx, 2                                  ; 2216 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2219 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 221C _ 39. 45, 0C
        jc      ?_113                                   ; 221F _ 72, 0F
        inc     dword [ebp-8H]                          ; 2221 _ FF. 45, F8
?_112:  mov     eax, dword [ebp+8H]                     ; 2224 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2227 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 2229 _ 39. 45, F8
        jl      ?_111                                   ; 222C _ 7C, E2
        jmp     ?_114                                   ; 222E _ EB, 01

?_113:  nop                                             ; 2230 _ 90
?_114:  cmp     dword [ebp-8H], 0                       ; 2231 _ 83. 7D, F8, 00
        jle     ?_116                                   ; 2235 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 223B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 223E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2241 _ 8B. 45, 08
        add     edx, 2                                  ; 2244 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2247 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 224A _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 224D _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2250 _ 8B. 45, 08
        add     ecx, 2                                  ; 2253 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2256 _ 8B. 44 C8, 04
        add     eax, edx                                ; 225A _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 225C _ 39. 45, 0C
        jne     ?_116                                   ; 225F _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 2265 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2268 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 226B _ 8B. 45, 08
        add     edx, 2                                  ; 226E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2271 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 2275 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 2278 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 227B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 227E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2281 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2284 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2287 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 228B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 228E _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 2290 _ 39. 45, F8
        jge     ?_115                                   ; 2293 _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 2295 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2298 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 229B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 229E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22A1 _ 8B. 55, F8
        add     edx, 2                                  ; 22A4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 22A7 _ 8B. 04 D0
        cmp     ecx, eax                                ; 22AA _ 39. C1
        jnz     ?_115                                   ; 22AC _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 22AE _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 22B1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22B4 _ 8B. 45, 08
        add     edx, 2                                  ; 22B7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 22BA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 22BE _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 22C1 _ 8B. 4D, F8
        add     ecx, 2                                  ; 22C4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 22C7 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 22CB _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 22CE _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 22D1 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 22D4 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 22D7 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 22DA _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 22DE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22E1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 22E3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22E6 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 22E9 _ 89. 10
?_115:  mov     eax, 0                                  ; 22EB _ B8, 00000000
        jmp     ?_122                                   ; 22F0 _ E9, 0000011B

?_116:  mov     eax, dword [ebp+8H]                     ; 22F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22F8 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 22FA _ 39. 45, F8
        jge     ?_117                                   ; 22FD _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 22FF _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 2302 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2305 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2308 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 230B _ 8B. 55, F8
        add     edx, 2                                  ; 230E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2311 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2314 _ 39. C1
        jnz     ?_117                                   ; 2316 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2318 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 231B _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 231E _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2321 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2324 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2327 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 232A _ 8B. 55, F8
        add     edx, 2                                  ; 232D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2330 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2334 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2337 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 233A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 233D _ 8B. 55, F8
        add     edx, 2                                  ; 2340 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2343 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2347 _ B8, 00000000
        jmp     ?_122                                   ; 234C _ E9, 000000BF

?_117:  mov     eax, dword [ebp+8H]                     ; 2351 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2354 _ 8B. 00
        cmp     eax, 4095                               ; 2356 _ 3D, 00000FFF
        jg      ?_121                                   ; 235B _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 2361 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2364 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2366 _ 89. 45, F4
        jmp     ?_119                                   ; 2369 _ EB, 27

?_118:  mov     eax, dword [ebp-0CH]                    ; 236B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 236E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2371 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 2374 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 2377 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 237A _ 8B. 45, 08
        add     edx, 2                                  ; 237D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2380 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2383 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2385 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2388 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 238B _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 238F _ FF. 4D, F4
?_119:  mov     eax, dword [ebp-0CH]                    ; 2392 _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 2395 _ 3B. 45, F8
        jg      ?_118                                   ; 2398 _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 239A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 239D _ 8B. 00
        lea     edx, [eax+1H]                           ; 239F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23A2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 23A5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 23A7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 23AA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23AD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23B0 _ 8B. 00
        cmp     edx, eax                                ; 23B2 _ 39. C2
        jge     ?_120                                   ; 23B4 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 23B6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 23B9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 23BB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 23BE _ 89. 50, 04
?_120:  mov     eax, dword [ebp+8H]                     ; 23C1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 23C4 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 23C7 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 23CA _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 23CD _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 23D0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 23D3 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 23D6 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 23D9 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 23DC _ 89. 54 C8, 04
        mov     eax, 0                                  ; 23E0 _ B8, 00000000
        jmp     ?_122                                   ; 23E5 _ EB, 29

?_121:  mov     eax, dword [ebp+8H]                     ; 23E7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23EA _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 23ED _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23F0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 23F3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 23F6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 23F9 _ 8B. 40, 08
        mov     edx, eax                                ; 23FC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 23FE _ 8B. 45, 10
        add     eax, edx                                ; 2401 _ 01. D0
        mov     edx, eax                                ; 2403 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2405 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2408 _ 89. 50, 08
        mov     eax, 4294967295                         ; 240B _ B8, FFFFFFFF
?_122:  add     esp, 16                                 ; 2410 _ 83. C4, 10
        pop     ebx                                     ; 2413 _ 5B
        pop     ebp                                     ; 2414 _ 5D
        ret                                             ; 2415 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2416 _ 55
        mov     ebp, esp                                ; 2417 _ 89. E5
        sub     esp, 16                                 ; 2419 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 241C _ 8B. 45, 0C
        add     eax, 4095                               ; 241F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2424 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2429 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 242C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 242F _ FF. 75, 08
        call    memman_alloc                            ; 2432 _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 2437 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 243A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 243D _ 8B. 45, FC
        leave                                           ; 2440 _ C9
        ret                                             ; 2441 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2442 _ 55
        mov     ebp, esp                                ; 2443 _ 89. E5
        sub     esp, 16                                 ; 2445 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 2448 _ 8B. 45, 10
        add     eax, 4095                               ; 244B _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2450 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2455 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 2458 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 245B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 245E _ FF. 75, 08
        call    memman_free                             ; 2461 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2466 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 2469 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 246C _ 8B. 45, FC
        leave                                           ; 246F _ C9
        ret                                             ; 2470 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 2471 _ 55
        mov     ebp, esp                                ; 2472 _ 89. E5
        sub     esp, 24                                 ; 2474 _ 83. EC, 18
        sub     esp, 8                                  ; 2477 _ 83. EC, 08
        push    9232                                    ; 247A _ 68, 00002410
        push    dword [ebp+8H]                          ; 247F _ FF. 75, 08
        call    memman_alloc_4k                         ; 2482 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2487 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 248A _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 248D _ 83. 7D, F0, 00
        jnz     ?_123                                   ; 2491 _ 75, 0A
        mov     eax, 0                                  ; 2493 _ B8, 00000000
        jmp     ?_127                                   ; 2498 _ E9, 00000099

?_123:  mov     eax, dword [ebp+10H]                    ; 249D _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 24A0 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 24A4 _ 83. EC, 08
        push    eax                                     ; 24A7 _ 50
        push    dword [ebp+8H]                          ; 24A8 _ FF. 75, 08
        call    memman_alloc_4k                         ; 24AB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24B0 _ 83. C4, 10
        mov     edx, eax                                ; 24B3 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 24B5 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 24B8 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 24BB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 24BE _ 8B. 40, 04
        test    eax, eax                                ; 24C1 _ 85. C0
        jnz     ?_124                                   ; 24C3 _ 75, 1E
        mov     eax, dword [ebp-10H]                    ; 24C5 _ 8B. 45, F0
        sub     esp, 4                                  ; 24C8 _ 83. EC, 04
        push    9232                                    ; 24CB _ 68, 00002410
        push    eax                                     ; 24D0 _ 50
        push    dword [ebp+8H]                          ; 24D1 _ FF. 75, 08
        call    memman_free_4k                          ; 24D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24D9 _ 83. C4, 10
        mov     eax, 0                                  ; 24DC _ B8, 00000000
        jmp     ?_127                                   ; 24E1 _ EB, 53

?_124:  mov     eax, dword [ebp-10H]                    ; 24E3 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 24E6 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 24E9 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 24EB _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 24EE _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 24F1 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 24F4 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 24F7 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 24FA _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 24FD _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 2500 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 2507 _ C7. 45, F4, 00000000
        jmp     ?_126                                   ; 250E _ EB, 1A

?_125:  mov     eax, dword [ebp-10H]                    ; 2510 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2513 _ 8B. 55, F4
        add     edx, 33                                 ; 2516 _ 83. C2, 21
        shl     edx, 5                                  ; 2519 _ C1. E2, 05
        add     eax, edx                                ; 251C _ 01. D0
        add     eax, 16                                 ; 251E _ 83. C0, 10
        mov     dword [eax], 0                          ; 2521 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2527 _ FF. 45, F4
?_126:  cmp     dword [ebp-0CH], 255                    ; 252A _ 81. 7D, F4, 000000FF
        jle     ?_125                                   ; 2531 _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 2533 _ 8B. 45, F0
?_127:  leave                                           ; 2536 _ C9
        ret                                             ; 2537 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2538 _ 55
        mov     ebp, esp                                ; 2539 _ 89. E5
        sub     esp, 16                                 ; 253B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 253E _ C7. 45, FC, 00000000
        jmp     ?_130                                   ; 2545 _ EB, 5A

?_128:  mov     eax, dword [ebp+8H]                     ; 2547 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 254A _ 8B. 55, FC
        add     edx, 33                                 ; 254D _ 83. C2, 21
        shl     edx, 5                                  ; 2550 _ C1. E2, 05
        add     eax, edx                                ; 2553 _ 01. D0
        add     eax, 16                                 ; 2555 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2558 _ 8B. 00
        test    eax, eax                                ; 255A _ 85. C0
        jnz     ?_129                                   ; 255C _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 255E _ 8B. 45, FC
        shl     eax, 5                                  ; 2561 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2564 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 256A _ 8B. 45, 08
        add     eax, edx                                ; 256D _ 01. D0
        add     eax, 4                                  ; 256F _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 2572 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2575 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2578 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 257B _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 257E _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 2581 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 2585 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 2588 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 258F _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 2592 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2599 _ 8B. 45, F8
        jmp     ?_131                                   ; 259C _ EB, 11

?_129:  inc     dword [ebp-4H]                          ; 259E _ FF. 45, FC
?_130:  cmp     dword [ebp-4H], 255                     ; 25A1 _ 81. 7D, FC, 000000FF
        jle     ?_128                                   ; 25A8 _ 7E, 9D
        mov     eax, 0                                  ; 25AA _ B8, 00000000
?_131:  leave                                           ; 25AF _ C9
        ret                                             ; 25B0 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 25B1 _ 55
        mov     ebp, esp                                ; 25B2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 25B4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 25B7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 25BA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 25BC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 25BF _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 25C2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 25C5 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 25C8 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 25CB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 25CE _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 25D1 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 25D4 _ 89. 50, 14
        nop                                             ; 25D7 _ 90
        pop     ebp                                     ; 25D8 _ 5D
        ret                                             ; 25D9 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 25DA _ 55
        mov     ebp, esp                                ; 25DB _ 89. E5
        push    esi                                     ; 25DD _ 56
        push    ebx                                     ; 25DE _ 53
        sub     esp, 16                                 ; 25DF _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 25E2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25E5 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 25E8 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 25EB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25EE _ 8B. 40, 10
        inc     eax                                     ; 25F1 _ 40
        cmp     dword [ebp+10H], eax                    ; 25F2 _ 39. 45, 10
        jle     ?_132                                   ; 25F5 _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 25F7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25FA _ 8B. 40, 10
        inc     eax                                     ; 25FD _ 40
        mov     dword [ebp+10H], eax                    ; 25FE _ 89. 45, 10
?_132:  cmp     dword [ebp+10H], -1                     ; 2601 _ 83. 7D, 10, FF
        jge     ?_133                                   ; 2605 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2607 _ C7. 45, 10, FFFFFFFF
?_133:  mov     eax, dword [ebp+0CH]                    ; 260E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2611 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2614 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 2617 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 261A _ 3B. 45, 10
        jle     ?_140                                   ; 261D _ 0F 8E, 000001D3
        cmp     dword [ebp+10H], 0                      ; 2623 _ 83. 7D, 10, 00
        js      ?_136                                   ; 2627 _ 0F 88, 000000E1
        mov     eax, dword [ebp-10H]                    ; 262D _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2630 _ 89. 45, F4
        jmp     ?_135                                   ; 2633 _ EB, 33

?_134:  mov     eax, dword [ebp-0CH]                    ; 2635 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2638 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 263B _ 8B. 45, 08
        add     edx, 4                                  ; 263E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2641 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2645 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2648 _ 8B. 4D, F4
        add     ecx, 4                                  ; 264B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 264E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2652 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2655 _ 8B. 55, F4
        add     edx, 4                                  ; 2658 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 265B _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 265F _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 2662 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2665 _ FF. 4D, F4
?_135:  mov     eax, dword [ebp-0CH]                    ; 2668 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 266B _ 3B. 45, 10
        jg      ?_134                                   ; 266E _ 7F, C5
        mov     eax, dword [ebp+8H]                     ; 2670 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2673 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2676 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2679 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 267C _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2680 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2683 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2686 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2689 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 268C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 268F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2692 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2695 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2698 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 269B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 269E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 26A1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 26A4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26A7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26AA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 26AD _ 8B. 40, 0C
        sub     esp, 8                                  ; 26B0 _ 83. EC, 08
        push    esi                                     ; 26B3 _ 56
        push    ebx                                     ; 26B4 _ 53
        push    ecx                                     ; 26B5 _ 51
        push    edx                                     ; 26B6 _ 52
        push    eax                                     ; 26B7 _ 50
        push    dword [ebp+8H]                          ; 26B8 _ FF. 75, 08
        call    sheet_refreshmap                        ; 26BB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26C0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 26C3 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 26C6 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 26C9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26CC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26CF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 26D2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 26D5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 26D8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 26DB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 26DE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 26E1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 26E4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 26E7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26EA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26ED _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 26F0 _ 8B. 40, 0C
        sub     esp, 4                                  ; 26F3 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 26F6 _ FF. 75, F0
        push    esi                                     ; 26F9 _ 56
        push    ebx                                     ; 26FA _ 53
        push    ecx                                     ; 26FB _ 51
        push    edx                                     ; 26FC _ 52
        push    eax                                     ; 26FD _ 50
        push    dword [ebp+8H]                          ; 26FE _ FF. 75, 08
        call    sheet_refreshsub                        ; 2701 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2706 _ 83. C4, 20
        jmp     ?_147                                   ; 2709 _ E9, 00000239

?_136:  mov     eax, dword [ebp+8H]                     ; 270E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2711 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 2714 _ 39. 45, F0
        jge     ?_139                                   ; 2717 _ 7D, 46
        mov     eax, dword [ebp-10H]                    ; 2719 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 271C _ 89. 45, F4
        jmp     ?_138                                   ; 271F _ EB, 33

?_137:  mov     eax, dword [ebp-0CH]                    ; 2721 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2724 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2727 _ 8B. 45, 08
        add     edx, 4                                  ; 272A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 272D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2731 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2734 _ 8B. 4D, F4
        add     ecx, 4                                  ; 2737 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 273A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 273E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2741 _ 8B. 55, F4
        add     edx, 4                                  ; 2744 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2747 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 274B _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 274E _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 2751 _ FF. 45, F4
?_138:  mov     eax, dword [ebp+8H]                     ; 2754 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2757 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 275A _ 39. 45, F4
        jl      ?_137                                   ; 275D _ 7C, C2
?_139:  mov     eax, dword [ebp+8H]                     ; 275F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2762 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2765 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2768 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 276B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 276E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2771 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2774 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2777 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 277A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 277D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2780 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2783 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2786 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2789 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 278C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 278F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2792 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2795 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2798 _ 83. EC, 08
        push    0                                       ; 279B _ 6A, 00
        push    ebx                                     ; 279D _ 53
        push    ecx                                     ; 279E _ 51
        push    edx                                     ; 279F _ 52
        push    eax                                     ; 27A0 _ 50
        push    dword [ebp+8H]                          ; 27A1 _ FF. 75, 08
        call    sheet_refreshmap                        ; 27A4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27A9 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 27AC _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 27AF _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 27B2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27B5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27B8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27BB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 27BE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27C1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27C4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27C7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 27CA _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 27CD _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 27D0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27D3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27D6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 27D9 _ 8B. 40, 0C
        sub     esp, 4                                  ; 27DC _ 83. EC, 04
        push    esi                                     ; 27DF _ 56
        push    0                                       ; 27E0 _ 6A, 00
        push    ebx                                     ; 27E2 _ 53
        push    ecx                                     ; 27E3 _ 51
        push    edx                                     ; 27E4 _ 52
        push    eax                                     ; 27E5 _ 50
        push    dword [ebp+8H]                          ; 27E6 _ FF. 75, 08
        call    sheet_refreshsub                        ; 27E9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27EE _ 83. C4, 20
        jmp     ?_147                                   ; 27F1 _ E9, 00000151

?_140:  mov     eax, dword [ebp-10H]                    ; 27F6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 27F9 _ 3B. 45, 10
        jge     ?_147                                   ; 27FC _ 0F 8D, 00000145
        cmp     dword [ebp-10H], 0                      ; 2802 _ 83. 7D, F0, 00
        js      ?_143                                   ; 2806 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2808 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 280B _ 89. 45, F4
        jmp     ?_142                                   ; 280E _ EB, 33

?_141:  mov     eax, dword [ebp-0CH]                    ; 2810 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2813 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2816 _ 8B. 45, 08
        add     edx, 4                                  ; 2819 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 281C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2820 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2823 _ 8B. 4D, F4
        add     ecx, 4                                  ; 2826 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2829 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 282D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2830 _ 8B. 55, F4
        add     edx, 4                                  ; 2833 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2836 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 283A _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 283D _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 2840 _ FF. 45, F4
?_142:  mov     eax, dword [ebp-0CH]                    ; 2843 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2846 _ 3B. 45, 10
        jl      ?_141                                   ; 2849 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 284B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 284E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2851 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2854 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2857 _ 89. 54 88, 04
        jmp     ?_146                                   ; 285B _ EB, 69

?_143:  mov     eax, dword [ebp+8H]                     ; 285D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2860 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2863 _ 89. 45, F4
        jmp     ?_145                                   ; 2866 _ EB, 37

?_144:  mov     eax, dword [ebp-0CH]                    ; 2868 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 286B _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 286E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2871 _ 8B. 55, F4
        add     edx, 4                                  ; 2874 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2877 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 287B _ 8B. 45, 08
        add     ecx, 4                                  ; 287E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2881 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 2885 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2888 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 288B _ 8B. 45, 08
        add     edx, 4                                  ; 288E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2891 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2895 _ 8B. 55, F4
        inc     edx                                     ; 2898 _ 42
        mov     dword [eax+18H], edx                    ; 2899 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 289C _ FF. 4D, F4
?_145:  mov     eax, dword [ebp-0CH]                    ; 289F _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 28A2 _ 3B. 45, 10
        jge     ?_144                                   ; 28A5 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 28A7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 28AA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 28AD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 28B0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 28B3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 28B7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 28BA _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 28BD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 28C0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 28C3 _ 89. 50, 10
?_146:  mov     eax, dword [ebp+0CH]                    ; 28C6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28C9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28CC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 28CF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28D2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28D5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28D8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28DB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28DE _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 28E1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28E4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28E7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28EA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28ED _ 8B. 40, 0C
        sub     esp, 8                                  ; 28F0 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 28F3 _ FF. 75, 10
        push    ebx                                     ; 28F6 _ 53
        push    ecx                                     ; 28F7 _ 51
        push    edx                                     ; 28F8 _ 52
        push    eax                                     ; 28F9 _ 50
        push    dword [ebp+8H]                          ; 28FA _ FF. 75, 08
        call    sheet_refreshmap                        ; 28FD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2902 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2905 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2908 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 290B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 290E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2911 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2914 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2917 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 291A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 291D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2920 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2923 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2926 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2929 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 292C _ 8B. 40, 0C
        sub     esp, 4                                  ; 292F _ 83. EC, 04
        push    dword [ebp+10H]                         ; 2932 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 2935 _ FF. 75, 10
        push    ebx                                     ; 2938 _ 53
        push    ecx                                     ; 2939 _ 51
        push    edx                                     ; 293A _ 52
        push    eax                                     ; 293B _ 50
        push    dword [ebp+8H]                          ; 293C _ FF. 75, 08
        call    sheet_refreshsub                        ; 293F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2944 _ 83. C4, 20
?_147:  nop                                             ; 2947 _ 90
        lea     esp, [ebp-8H]                           ; 2948 _ 8D. 65, F8
        pop     ebx                                     ; 294B _ 5B
        pop     esi                                     ; 294C _ 5E
        pop     ebp                                     ; 294D _ 5D
        ret                                             ; 294E _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 294F _ 55
        mov     ebp, esp                                ; 2950 _ 89. E5
        push    edi                                     ; 2952 _ 57
        push    esi                                     ; 2953 _ 56
        push    ebx                                     ; 2954 _ 53
        sub     esp, 28                                 ; 2955 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 2958 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 295B _ 8B. 40, 18
        test    eax, eax                                ; 295E _ 85. C0
        js      ?_148                                   ; 2960 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 2962 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 2965 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 2968 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 296B _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 296E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2971 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 2974 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 2977 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 297A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 297D _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 2980 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2983 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2986 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2989 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 298C _ 8B. 45, 14
        add     edx, eax                                ; 298F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2991 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2994 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2997 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 299A _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 299D _ 03. 45, E4
        sub     esp, 4                                  ; 29A0 _ 83. EC, 04
        push    ebx                                     ; 29A3 _ 53
        push    ecx                                     ; 29A4 _ 51
        push    edi                                     ; 29A5 _ 57
        push    esi                                     ; 29A6 _ 56
        push    edx                                     ; 29A7 _ 52
        push    eax                                     ; 29A8 _ 50
        push    dword [ebp+8H]                          ; 29A9 _ FF. 75, 08
        call    sheet_refreshsub                        ; 29AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29B1 _ 83. C4, 20
?_148:  mov     eax, 0                                  ; 29B4 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 29B9 _ 8D. 65, F4
        pop     ebx                                     ; 29BC _ 5B
        pop     esi                                     ; 29BD _ 5E
        pop     edi                                     ; 29BE _ 5F
        pop     ebp                                     ; 29BF _ 5D
        ret                                             ; 29C0 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 29C1 _ 55
        mov     ebp, esp                                ; 29C2 _ 89. E5
        push    esi                                     ; 29C4 _ 56
        push    ebx                                     ; 29C5 _ 53
        sub     esp, 16                                 ; 29C6 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 29C9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 29CC _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 29CF _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 29D2 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 29D5 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 29D8 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 29DB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 29DE _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 29E1 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 29E4 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 29E7 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 29EA _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 29ED _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29F0 _ 8B. 40, 18
        test    eax, eax                                ; 29F3 _ 85. C0
        js      ?_149                                   ; 29F5 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 29FB _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 29FE _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2A01 _ 8B. 45, F0
        add     edx, eax                                ; 2A04 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2A06 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2A09 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 2A0C _ 8B. 45, F4
        add     eax, ecx                                ; 2A0F _ 01. C8
        sub     esp, 8                                  ; 2A11 _ 83. EC, 08
        push    0                                       ; 2A14 _ 6A, 00
        push    edx                                     ; 2A16 _ 52
        push    eax                                     ; 2A17 _ 50
        push    dword [ebp-10H]                         ; 2A18 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2A1B _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2A1E _ FF. 75, 08
        call    sheet_refreshmap                        ; 2A21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A26 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2A29 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A2C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2A2F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2A32 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2A35 _ 8B. 55, 14
        add     ecx, edx                                ; 2A38 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2A3A _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2A3D _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2A40 _ 8B. 55, 10
        add     edx, ebx                                ; 2A43 _ 01. DA
        sub     esp, 8                                  ; 2A45 _ 83. EC, 08
        push    eax                                     ; 2A48 _ 50
        push    ecx                                     ; 2A49 _ 51
        push    edx                                     ; 2A4A _ 52
        push    dword [ebp+14H]                         ; 2A4B _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2A4E _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2A51 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2A54 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A59 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2A5C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A5F _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 2A62 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2A65 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2A68 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2A6B _ 8B. 45, F0
        add     edx, eax                                ; 2A6E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2A70 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2A73 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2A76 _ 8B. 45, F4
        add     eax, ebx                                ; 2A79 _ 01. D8
        sub     esp, 4                                  ; 2A7B _ 83. EC, 04
        push    ecx                                     ; 2A7E _ 51
        push    0                                       ; 2A7F _ 6A, 00
        push    edx                                     ; 2A81 _ 52
        push    eax                                     ; 2A82 _ 50
        push    dword [ebp-10H]                         ; 2A83 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2A86 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2A89 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2A8C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A91 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2A94 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2A97 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2A9A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A9D _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2AA0 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2AA3 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2AA6 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2AA9 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2AAB _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2AAE _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2AB1 _ 8B. 4D, 10
        add     ecx, esi                                ; 2AB4 _ 01. F1
        sub     esp, 4                                  ; 2AB6 _ 83. EC, 04
        push    edx                                     ; 2AB9 _ 52
        push    eax                                     ; 2ABA _ 50
        push    ebx                                     ; 2ABB _ 53
        push    ecx                                     ; 2ABC _ 51
        push    dword [ebp+14H]                         ; 2ABD _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2AC0 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2AC3 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2AC6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2ACB _ 83. C4, 20
?_149:  nop                                             ; 2ACE _ 90
        lea     esp, [ebp-8H]                           ; 2ACF _ 8D. 65, F8
        pop     ebx                                     ; 2AD2 _ 5B
        pop     esi                                     ; 2AD3 _ 5E
        pop     ebp                                     ; 2AD4 _ 5D
        ret                                             ; 2AD5 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2AD6 _ 55
        mov     ebp, esp                                ; 2AD7 _ 89. E5
        sub     esp, 48                                 ; 2AD9 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2ADC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2ADF _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2AE1 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2AE4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2AE7 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2AEA _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2AED _ 83. 7D, 0C, 00
        jns     ?_150                                   ; 2AF1 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2AF3 _ C7. 45, 0C, 00000000
?_150:  cmp     dword [ebp+10H], 8                      ; 2AFA _ 83. 7D, 10, 08
        jg      ?_151                                   ; 2AFE _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 2B00 _ C7. 45, 10, 00000000
?_151:  mov     eax, dword [ebp+8H]                     ; 2B07 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B0A _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2B0D _ 39. 45, 14
        jle     ?_152                                   ; 2B10 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2B12 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2B15 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2B18 _ 89. 45, 14
?_152:  mov     eax, dword [ebp+8H]                     ; 2B1B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B1E _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2B21 _ 39. 45, 18
        jle     ?_153                                   ; 2B24 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2B26 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2B29 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2B2C _ 89. 45, 18
?_153:  mov     eax, dword [ebp+1CH]                    ; 2B2F _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2B32 _ 89. 45, FC
        jmp     ?_160                                   ; 2B35 _ E9, 0000010E

?_154:  mov     eax, dword [ebp+8H]                     ; 2B3A _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2B3D _ 8B. 55, FC
        add     edx, 4                                  ; 2B40 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2B43 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2B47 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2B4A _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2B4D _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 2B4F _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 2B52 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2B55 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 2B5B _ 8B. 45, E8
        sub     eax, edx                                ; 2B5E _ 29. D0
        sar     eax, 5                                  ; 2B60 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 2B63 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2B66 _ C7. 45, F4, 00000000
        jmp     ?_159                                   ; 2B6D _ E9, 000000C4

?_155:  mov     eax, dword [ebp-18H]                    ; 2B72 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2B75 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2B78 _ 8B. 45, F4
        add     eax, edx                                ; 2B7B _ 01. D0
        mov     dword [ebp-24H], eax                    ; 2B7D _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 2B80 _ C7. 45, F8, 00000000
        jmp     ?_158                                   ; 2B87 _ E9, 00000098

?_156:  mov     eax, dword [ebp-18H]                    ; 2B8C _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 2B8F _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2B92 _ 8B. 45, F8
        add     eax, edx                                ; 2B95 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2B97 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2B9A _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2B9D _ 3B. 45, D8
        jg      ?_157                                   ; 2BA0 _ 7F, 7F
        mov     eax, dword [ebp-28H]                    ; 2BA2 _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2BA5 _ 3B. 45, 14
        jge     ?_157                                   ; 2BA8 _ 7D, 77
        mov     eax, dword [ebp+10H]                    ; 2BAA _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2BAD _ 3B. 45, DC
        jg      ?_157                                   ; 2BB0 _ 7F, 6F
        mov     eax, dword [ebp-24H]                    ; 2BB2 _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2BB5 _ 3B. 45, 18
        jge     ?_157                                   ; 2BB8 _ 7D, 67
        mov     eax, dword [ebp-18H]                    ; 2BBA _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2BBD _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2BC0 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2BC4 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2BC6 _ 8B. 45, F8
        add     eax, edx                                ; 2BC9 _ 01. D0
        mov     edx, eax                                ; 2BCB _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2BCD _ 8B. 45, E4
        add     eax, edx                                ; 2BD0 _ 01. D0
        mov     al, byte [eax]                          ; 2BD2 _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2BD4 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2BD7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2BDA _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2BDD _ 0F AF. 45, DC
        mov     edx, eax                                ; 2BE1 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2BE3 _ 8B. 45, D8
        add     eax, edx                                ; 2BE6 _ 01. D0
        mov     edx, eax                                ; 2BE8 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2BEA _ 8B. 45, EC
        add     eax, edx                                ; 2BED _ 01. D0
        mov     al, byte [eax]                          ; 2BEF _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2BF1 _ 38. 45, E3
        jnz     ?_157                                   ; 2BF4 _ 75, 2B
        movzx   edx, byte [ebp-29H]                     ; 2BF6 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2BFA _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2BFD _ 8B. 40, 14
        cmp     edx, eax                                ; 2C00 _ 39. C2
        jz      ?_157                                   ; 2C02 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2C04 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C07 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2C0A _ 0F AF. 45, DC
        mov     edx, eax                                ; 2C0E _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2C10 _ 8B. 45, D8
        add     eax, edx                                ; 2C13 _ 01. D0
        mov     edx, eax                                ; 2C15 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2C17 _ 8B. 45, F0
        add     edx, eax                                ; 2C1A _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2C1C _ 8A. 45, D7
        mov     byte [edx], al                          ; 2C1F _ 88. 02
?_157:  inc     dword [ebp-8H]                          ; 2C21 _ FF. 45, F8
?_158:  mov     eax, dword [ebp-18H]                    ; 2C24 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C27 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2C2A _ 39. 45, F8
        jl      ?_156                                   ; 2C2D _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 2C33 _ FF. 45, F4
?_159:  mov     eax, dword [ebp-18H]                    ; 2C36 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2C39 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 2C3C _ 39. 45, F4
        jl      ?_155                                   ; 2C3F _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 2C45 _ FF. 45, FC
?_160:  mov     eax, dword [ebp-4H]                     ; 2C48 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 2C4B _ 3B. 45, 20
        jle     ?_154                                   ; 2C4E _ 0F 8E, FFFFFEE6
        nop                                             ; 2C54 _ 90
        nop                                             ; 2C55 _ 90
        leave                                           ; 2C56 _ C9
        ret                                             ; 2C57 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 2C58 _ 55
        mov     ebp, esp                                ; 2C59 _ 89. E5
        sub     esp, 64                                 ; 2C5B _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2C5E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C61 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2C64 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 2C67 _ 83. 7D, 0C, 00
        jns     ?_161                                   ; 2C6B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2C6D _ C7. 45, 0C, 00000000
?_161:  cmp     dword [ebp+10H], 0                      ; 2C74 _ 83. 7D, 10, 00
        jns     ?_162                                   ; 2C78 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2C7A _ C7. 45, 10, 00000000
?_162:  mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C84 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2C87 _ 39. 45, 14
        jle     ?_163                                   ; 2C8A _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2C8C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C8F _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2C92 _ 89. 45, 14
?_163:  mov     eax, dword [ebp+8H]                     ; 2C95 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C98 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2C9B _ 39. 45, 18
        jle     ?_164                                   ; 2C9E _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2CA0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CA3 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2CA6 _ 89. 45, 18
?_164:  mov     eax, dword [ebp+1CH]                    ; 2CA9 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2CAC _ 89. 45, FC
        jmp     ?_175                                   ; 2CAF _ E9, 00000137

?_165:  mov     eax, dword [ebp+8H]                     ; 2CB4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2CB7 _ 8B. 55, FC
        add     edx, 4                                  ; 2CBA _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2CBD _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2CC1 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2CC4 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2CC7 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2CCD _ 8B. 45, DC
        sub     eax, edx                                ; 2CD0 _ 29. D0
        sar     eax, 5                                  ; 2CD2 _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2CD5 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2CD8 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2CDB _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2CDD _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2CE0 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2CE3 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2CE6 _ 8B. 55, 0C
        sub     edx, eax                                ; 2CE9 _ 29. C2
        mov     eax, edx                                ; 2CEB _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2CED _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2CF0 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2CF3 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2CF6 _ 8B. 55, 10
        sub     edx, eax                                ; 2CF9 _ 29. C2
        mov     eax, edx                                ; 2CFB _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2CFD _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2D00 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2D03 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2D06 _ 8B. 55, 14
        sub     edx, eax                                ; 2D09 _ 29. C2
        mov     eax, edx                                ; 2D0B _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2D0D _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2D10 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2D13 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2D16 _ 8B. 55, 18
        sub     edx, eax                                ; 2D19 _ 29. C2
        mov     eax, edx                                ; 2D1B _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2D1D _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2D20 _ 83. 7D, F0, 00
        jns     ?_166                                   ; 2D24 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 2D26 _ C7. 45, F0, 00000000
?_166:  cmp     dword [ebp-14H], 0                      ; 2D2D _ 83. 7D, EC, 00
        jns     ?_167                                   ; 2D31 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 2D33 _ C7. 45, EC, 00000000
?_167:  mov     eax, dword [ebp-24H]                    ; 2D3A _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2D3D _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 2D40 _ 39. 45, E8
        jle     ?_168                                   ; 2D43 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 2D45 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2D48 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 2D4B _ 89. 45, E8
?_168:  mov     eax, dword [ebp-24H]                    ; 2D4E _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2D51 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 2D54 _ 39. 45, E4
        jle     ?_169                                   ; 2D57 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 2D59 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 2D5C _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 2D5F _ 89. 45, E4
?_169:  mov     eax, dword [ebp-14H]                    ; 2D62 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2D65 _ 89. 45, F4
        jmp     ?_174                                   ; 2D68 _ EB, 76

?_170:  mov     eax, dword [ebp-24H]                    ; 2D6A _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 2D6D _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2D70 _ 8B. 45, F4
        add     eax, edx                                ; 2D73 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2D75 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2D78 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2D7B _ 89. 45, F8
        jmp     ?_173                                   ; 2D7E _ EB, 55

?_171:  mov     eax, dword [ebp-24H]                    ; 2D80 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2D83 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2D86 _ 8B. 45, F8
        add     eax, edx                                ; 2D89 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2D8B _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 2D8E _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 2D91 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2D94 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2D98 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2D9A _ 8B. 45, F8
        add     eax, edx                                ; 2D9D _ 01. D0
        mov     edx, eax                                ; 2D9F _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2DA1 _ 8B. 45, D4
        add     eax, edx                                ; 2DA4 _ 01. D0
        mov     al, byte [eax]                          ; 2DA6 _ 8A. 00
        movzx   edx, al                                 ; 2DA8 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2DAB _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2DAE _ 8B. 40, 14
        cmp     edx, eax                                ; 2DB1 _ 39. C2
        jz      ?_172                                   ; 2DB3 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2DB5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2DB8 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2DBB _ 0F AF. 45, D0
        mov     edx, eax                                ; 2DBF _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2DC1 _ 8B. 45, CC
        add     eax, edx                                ; 2DC4 _ 01. D0
        mov     edx, eax                                ; 2DC6 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2DC8 _ 8B. 45, E0
        add     edx, eax                                ; 2DCB _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2DCD _ 8A. 45, DB
        mov     byte [edx], al                          ; 2DD0 _ 88. 02
?_172:  inc     dword [ebp-8H]                          ; 2DD2 _ FF. 45, F8
?_173:  mov     eax, dword [ebp-8H]                     ; 2DD5 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2DD8 _ 3B. 45, E8
        jl      ?_171                                   ; 2DDB _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2DDD _ FF. 45, F4
?_174:  mov     eax, dword [ebp-0CH]                    ; 2DE0 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2DE3 _ 3B. 45, E4
        jl      ?_170                                   ; 2DE6 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2DE8 _ FF. 45, FC
?_175:  mov     eax, dword [ebp+8H]                     ; 2DEB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2DEE _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2DF1 _ 39. 45, FC
        jle     ?_165                                   ; 2DF4 _ 0F 8E, FFFFFEBA
        nop                                             ; 2DFA _ 90
        leave                                           ; 2DFB _ C9
        ret                                             ; 2DFC _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2DFD _ 55
        mov     ebp, esp                                ; 2DFE _ 89. E5
        sub     esp, 24                                 ; 2E00 _ 83. EC, 18
        sub     esp, 8                                  ; 2E03 _ 83. EC, 08
        push    52                                      ; 2E06 _ 6A, 34
        push    67                                      ; 2E08 _ 6A, 43
        call    io_out8                                 ; 2E0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E0F _ 83. C4, 10
        sub     esp, 8                                  ; 2E12 _ 83. EC, 08
        push    156                                     ; 2E15 _ 68, 0000009C
        push    64                                      ; 2E1A _ 6A, 40
        call    io_out8                                 ; 2E1C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E21 _ 83. C4, 10
        sub     esp, 8                                  ; 2E24 _ 83. EC, 08
        push    46                                      ; 2E27 _ 6A, 2E
        push    64                                      ; 2E29 _ 6A, 40
        call    io_out8                                 ; 2E2B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E30 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 2E33 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 2E3D _ C7. 45, F4, 00000000
        jmp     ?_177                                   ; 2E44 _ EB, 25

?_176:  mov     eax, dword [ebp-0CH]                    ; 2E46 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E49 _ C1. E0, 04
        add     eax, ?_244                              ; 2E4C _ 05, 00000388(d)
        mov     dword [eax], 0                          ; 2E51 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2E57 _ 8B. 45, F4
        shl     eax, 4                                  ; 2E5A _ C1. E0, 04
        add     eax, ?_245                              ; 2E5D _ 05, 0000038C(d)
        mov     dword [eax], 0                          ; 2E62 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2E68 _ FF. 45, F4
?_177:  cmp     dword [ebp-0CH], 499                    ; 2E6B _ 81. 7D, F4, 000001F3
        jle     ?_176                                   ; 2E72 _ 7E, D2
        nop                                             ; 2E74 _ 90
        nop                                             ; 2E75 _ 90
        leave                                           ; 2E76 _ C9
        ret                                             ; 2E77 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2E78 _ 55
        mov     ebp, esp                                ; 2E79 _ 89. E5
        sub     esp, 16                                 ; 2E7B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2E7E _ C7. 45, FC, 00000000
        jmp     ?_180                                   ; 2E85 _ EB, 35

?_178:  mov     eax, dword [ebp-4H]                     ; 2E87 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E8A _ C1. E0, 04
        add     eax, ?_244                              ; 2E8D _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2E92 _ 8B. 00
        test    eax, eax                                ; 2E94 _ 85. C0
        jnz     ?_179                                   ; 2E96 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2E98 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E9B _ C1. E0, 04
        add     eax, ?_244                              ; 2E9E _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2EA3 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2EA9 _ 8B. 45, FC
        shl     eax, 4                                  ; 2EAC _ C1. E0, 04
        add     eax, timerctl                           ; 2EAF _ 05, 00000380(d)
        add     eax, 4                                  ; 2EB4 _ 83. C0, 04
        jmp     ?_181                                   ; 2EB7 _ EB, 11

?_179:  inc     dword [ebp-4H]                          ; 2EB9 _ FF. 45, FC
?_180:  cmp     dword [ebp-4H], 499                     ; 2EBC _ 81. 7D, FC, 000001F3
        jle     ?_178                                   ; 2EC3 _ 7E, C2
        mov     eax, 0                                  ; 2EC5 _ B8, 00000000
?_181:  leave                                           ; 2ECA _ C9
        ret                                             ; 2ECB _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2ECC _ 55
        mov     ebp, esp                                ; 2ECD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2ECF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2ED2 _ C7. 40, 04, 00000000
        nop                                             ; 2ED9 _ 90
        pop     ebp                                     ; 2EDA _ 5D
        ret                                             ; 2EDB _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2EDC _ 55
        mov     ebp, esp                                ; 2EDD _ 89. E5
        sub     esp, 4                                  ; 2EDF _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2EE2 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2EE5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2EE8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2EEB _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2EEE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2EF1 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2EF4 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2EF7 _ 88. 50, 0C
        nop                                             ; 2EFA _ 90
        leave                                           ; 2EFB _ C9
        ret                                             ; 2EFC _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2EFD _ 55
        mov     ebp, esp                                ; 2EFE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F00 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2F03 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2F06 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2F08 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2F0B _ C7. 40, 04, 00000002
        nop                                             ; 2F12 _ 90
        pop     ebp                                     ; 2F13 _ 5D
        ret                                             ; 2F14 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2F15 _ 55
        mov     ebp, esp                                ; 2F16 _ 89. E5
        sub     esp, 24                                 ; 2F18 _ 83. EC, 18
        sub     esp, 8                                  ; 2F1B _ 83. EC, 08
        push    32                                      ; 2F1E _ 6A, 20
        push    32                                      ; 2F20 _ 6A, 20
        call    io_out8                                 ; 2F22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F27 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2F2A _ A1, 00000380(d)
        inc     eax                                     ; 2F2F _ 40
        mov     dword [timerctl], eax                   ; 2F30 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 2F35 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2F39 _ C7. 45, F4, 00000000
        jmp     ?_185                                   ; 2F40 _ E9, 000000A8

?_182:  mov     eax, dword [ebp-0CH]                    ; 2F45 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F48 _ C1. E0, 04
        add     eax, ?_244                              ; 2F4B _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2F50 _ 8B. 00
        cmp     eax, 2                                  ; 2F52 _ 83. F8, 02
        jne     ?_183                                   ; 2F55 _ 0F 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2F5B _ 8B. 45, F4
        shl     eax, 4                                  ; 2F5E _ C1. E0, 04
        add     eax, ?_243                              ; 2F61 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2F66 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2F68 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2F6B _ 8B. 45, F4
        shl     eax, 4                                  ; 2F6E _ C1. E0, 04
        add     eax, ?_243                              ; 2F71 _ 05, 00000384(d)
        mov     dword [eax], edx                        ; 2F76 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2F78 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F7B _ C1. E0, 04
        add     eax, ?_243                              ; 2F7E _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2F83 _ 8B. 00
        test    eax, eax                                ; 2F85 _ 85. C0
        jnz     ?_183                                   ; 2F87 _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2F89 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F8C _ C1. E0, 04
        add     eax, ?_244                              ; 2F8F _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2F94 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2F9A _ 8B. 45, F4
        shl     eax, 4                                  ; 2F9D _ C1. E0, 04
        add     eax, ?_246                              ; 2FA0 _ 05, 00000390(d)
        mov     al, byte [eax]                          ; 2FA5 _ 8A. 00
        movzx   edx, al                                 ; 2FA7 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2FAA _ 8B. 45, F4
        shl     eax, 4                                  ; 2FAD _ C1. E0, 04
        add     eax, ?_245                              ; 2FB0 _ 05, 0000038C(d)
        mov     eax, dword [eax]                        ; 2FB5 _ 8B. 00
        sub     esp, 8                                  ; 2FB7 _ 83. EC, 08
        push    edx                                     ; 2FBA _ 52
        push    eax                                     ; 2FBB _ 50
        call    fifo8_put                               ; 2FBC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2FC1 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2FC4 _ 8B. 45, F4
        shl     eax, 4                                  ; 2FC7 _ C1. E0, 04
        add     eax, timerctl                           ; 2FCA _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 2FCF _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2FD2 _ A1, 00000000(d)
        cmp     edx, eax                                ; 2FD7 _ 39. C2
        jnz     ?_183                                   ; 2FD9 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2FDB _ C6. 45, F3, 01
?_183:  cmp     byte [ebp-0DH], 0                       ; 2FDF _ 80. 7D, F3, 00
        jz      ?_184                                   ; 2FE3 _ 74, 05
        call    task_switch                             ; 2FE5 _ E8, FFFFFFFC(rel)
?_184:  inc     dword [ebp-0CH]                         ; 2FEA _ FF. 45, F4
?_185:  cmp     dword [ebp-0CH], 499                    ; 2FED _ 81. 7D, F4, 000001F3
        jle     ?_182                                   ; 2FF4 _ 0F 8E, FFFFFF4B
        nop                                             ; 2FFA _ 90
        leave                                           ; 2FFB _ C9
        ret                                             ; 2FFC _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2FFD _ 55
        mov     ebp, esp                                ; 2FFE _ 89. E5
        mov     eax, timerctl                           ; 3000 _ B8, 00000380(d)
        pop     ebp                                     ; 3005 _ 5D
        ret                                             ; 3006 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 3007 _ 55
        mov     ebp, esp                                ; 3008 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 300A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 300D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3010 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3013 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3016 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 3019 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 301B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 301E _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3021 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3024 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3027 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 302E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3031 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3038 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 303B _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3042 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3045 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 3048 _ 89. 50, 18
        nop                                             ; 304B _ 90
        pop     ebp                                     ; 304C _ 5D
        ret                                             ; 304D _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 304E _ 55
        mov     ebp, esp                                ; 304F _ 89. E5
        sub     esp, 24                                 ; 3051 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3054 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 3057 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 305A _ 83. 7D, 08, 00
        jnz     ?_186                                   ; 305E _ 75, 0A
        mov     eax, 4294967295                         ; 3060 _ B8, FFFFFFFF
        jmp     ?_190                                   ; 3065 _ E9, 0000009F

?_186:  mov     eax, dword [ebp+8H]                     ; 306A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 306D _ 8B. 40, 10
        test    eax, eax                                ; 3070 _ 85. C0
        jnz     ?_187                                   ; 3072 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 3074 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3077 _ 8B. 40, 14
        or      eax, 01H                                ; 307A _ 83. C8, 01
        mov     edx, eax                                ; 307D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 307F _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 3082 _ 89. 50, 14
        mov     eax, 4294967295                         ; 3085 _ B8, FFFFFFFF
        jmp     ?_190                                   ; 308A _ EB, 7D

?_187:  mov     eax, dword [ebp+8H]                     ; 308C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 308F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3091 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3094 _ 8B. 40, 04
        add     edx, eax                                ; 3097 _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 3099 _ 8A. 45, F4
        mov     byte [edx], al                          ; 309C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 309E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30A1 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 30A4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 30A7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 30AA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30AD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 30B0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30B3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30B6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 30B9 _ 39. C2
        jnz     ?_188                                   ; 30BB _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 30BD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 30C0 _ C7. 40, 04, 00000000
?_188:  mov     eax, dword [ebp+8H]                     ; 30C7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 30CA _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 30CD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 30D0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 30D3 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 30D6 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30D9 _ 8B. 40, 18
        test    eax, eax                                ; 30DC _ 85. C0
        jz      ?_189                                   ; 30DE _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 30E0 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30E3 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 30E6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 30E9 _ 83. F8, 02
        jz      ?_189                                   ; 30EC _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 30EE _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 30F1 _ 8B. 40, 18
        sub     esp, 4                                  ; 30F4 _ 83. EC, 04
        push    0                                       ; 30F7 _ 6A, 00
        push    -1                                      ; 30F9 _ 6A, FF
        push    eax                                     ; 30FB _ 50
        call    task_run                                ; 30FC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3101 _ 83. C4, 10
?_189:  mov     eax, 0                                  ; 3104 _ B8, 00000000
?_190:  leave                                           ; 3109 _ C9
        ret                                             ; 310A _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 310B _ 55
        mov     ebp, esp                                ; 310C _ 89. E5
        sub     esp, 16                                 ; 310E _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3111 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 3114 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3117 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 311A _ 8B. 40, 0C
        cmp     edx, eax                                ; 311D _ 39. C2
        jnz     ?_191                                   ; 311F _ 75, 07
        mov     eax, 4294967295                         ; 3121 _ B8, FFFFFFFF
        jmp     ?_193                                   ; 3126 _ EB, 50

?_191:  mov     eax, dword [ebp+8H]                     ; 3128 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 312B _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 312D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3130 _ 8B. 40, 08
        add     eax, edx                                ; 3133 _ 01. D0
        mov     al, byte [eax]                          ; 3135 _ 8A. 00
        movzx   eax, al                                 ; 3137 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 313A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 313D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3140 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 3143 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3146 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3149 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 314C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 314F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3152 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3155 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3158 _ 39. C2
        jnz     ?_192                                   ; 315A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 315C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 315F _ C7. 40, 08, 00000000
?_192:  mov     eax, dword [ebp+8H]                     ; 3166 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3169 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 316C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 316F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3172 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3175 _ 8B. 45, FC
?_193:  leave                                           ; 3178 _ C9
        ret                                             ; 3179 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 317A _ 55
        mov     ebp, esp                                ; 317B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 317D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3180 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3183 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3186 _ 8B. 40, 10
        sub     edx, eax                                ; 3189 _ 29. C2
        mov     eax, edx                                ; 318B _ 89. D0
        pop     ebp                                     ; 318D _ 5D
        ret                                             ; 318E _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 318F _ 55
        mov     ebp, esp                                ; 3190 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3192 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_194                                   ; 3199 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 319B _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 31A2 _ 8B. 45, 0C
        shr     eax, 12                                 ; 31A5 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 31A8 _ 89. 45, 0C
?_194:  mov     eax, dword [ebp+0CH]                    ; 31AB _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 31AE _ 8B. 55, 08
        mov     word [edx], ax                          ; 31B1 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 31B4 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 31B7 _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 31BA _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 31BE _ 8B. 45, 10
        sar     eax, 16                                 ; 31C1 _ C1. F8, 10
        mov     dl, al                                  ; 31C4 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 31C6 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 31C9 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 31CC _ 8B. 45, 14
        mov     dl, al                                  ; 31CF _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 31D1 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 31D4 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 31D7 _ 8B. 45, 0C
        shr     eax, 16                                 ; 31DA _ C1. E8, 10
        and     eax, 0FH                                ; 31DD _ 83. E0, 0F
        mov     dl, al                                  ; 31E0 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 31E2 _ 8B. 45, 14
        sar     eax, 8                                  ; 31E5 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 31E8 _ 83. E0, F0
        or      eax, edx                                ; 31EB _ 09. D0
        mov     dl, al                                  ; 31ED _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 31EF _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 31F2 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 31F5 _ 8B. 45, 10
        shr     eax, 24                                 ; 31F8 _ C1. E8, 18
        mov     dl, al                                  ; 31FB _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 31FD _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3200 _ 88. 50, 07
        nop                                             ; 3203 _ 90
        pop     ebp                                     ; 3204 _ 5D
        ret                                             ; 3205 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 3206 _ 55
        mov     ebp, esp                                ; 3207 _ 89. E5
        mov     eax, dword [taskctl]                    ; 3209 _ A1, 000022C8(d)
        pop     ebp                                     ; 320E _ 5D
        ret                                             ; 320F _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 3210 _ 55
        mov     ebp, esp                                ; 3211 _ 89. E5
        sub     esp, 16                                 ; 3213 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3216 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 321C _ 8B. 55, 08
        mov     eax, edx                                ; 321F _ 89. D0
        shl     eax, 2                                  ; 3221 _ C1. E0, 02
        add     eax, edx                                ; 3224 _ 01. D0
        shl     eax, 2                                  ; 3226 _ C1. E0, 02
        add     eax, ecx                                ; 3229 _ 01. C8
        add     eax, 8                                  ; 322B _ 83. C0, 08
        mov     dword [eax], 0                          ; 322E _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 3234 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 323A _ 8B. 55, 08
        mov     eax, edx                                ; 323D _ 89. D0
        shl     eax, 2                                  ; 323F _ C1. E0, 02
        add     eax, edx                                ; 3242 _ 01. D0
        shl     eax, 2                                  ; 3244 _ C1. E0, 02
        add     eax, ecx                                ; 3247 _ 01. C8
        add     eax, 12                                 ; 3249 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 324C _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3252 _ C7. 45, FC, 00000000
        jmp     ?_196                                   ; 3259 _ EB, 20

?_195:  mov     ecx, dword [taskctl]                    ; 325B _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 3261 _ 8B. 55, FC
        mov     eax, edx                                ; 3264 _ 89. D0
        add     eax, eax                                ; 3266 _ 01. C0
        add     eax, edx                                ; 3268 _ 01. D0
        shl     eax, 3                                  ; 326A _ C1. E0, 03
        add     eax, ecx                                ; 326D _ 01. C8
        add     eax, 16                                 ; 326F _ 83. C0, 10
        mov     dword [eax], 0                          ; 3272 _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 3278 _ FF. 45, FC
?_196:  cmp     dword [ebp-4H], 2                       ; 327B _ 83. 7D, FC, 02
        jle     ?_195                                   ; 327F _ 7E, DA
        nop                                             ; 3281 _ 90
        nop                                             ; 3282 _ 90
        leave                                           ; 3283 _ C9
        ret                                             ; 3284 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3285 _ 55
        mov     ebp, esp                                ; 3286 _ 89. E5
        push    ebx                                     ; 3288 _ 53
        sub     esp, 20                                 ; 3289 _ 83. EC, 14
        call    get_addr_gdt                            ; 328C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3291 _ 89. 45, F0
        sub     esp, 8                                  ; 3294 _ 83. EC, 08
        push    668                                     ; 3297 _ 68, 0000029C
        push    dword [ebp+8H]                          ; 329C _ FF. 75, 08
        call    memman_alloc_4k                         ; 329F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 32A4 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 32A7 _ A3, 000022C8(d)
        mov     dword [ebp-0CH], 0                      ; 32AC _ C7. 45, F4, 00000000
        jmp     ?_198                                   ; 32B3 _ E9, 00000088

?_197:  mov     ecx, dword [taskctl]                    ; 32B8 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 32BE _ 8B. 55, F4
        mov     eax, edx                                ; 32C1 _ 89. D0
        shl     eax, 5                                  ; 32C3 _ C1. E0, 05
        sub     eax, edx                                ; 32C6 _ 29. D0
        shl     eax, 2                                  ; 32C8 _ C1. E0, 02
        add     eax, ecx                                ; 32CB _ 01. C8
        add     eax, 72                                 ; 32CD _ 83. C0, 48
        mov     dword [eax], 0                          ; 32D0 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 32D6 _ 8B. 45, F4
        add     eax, 7                                  ; 32D9 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 32DC _ 8B. 1D, 000022C8(d)
        lea     ecx, [eax*8]                            ; 32E2 _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 32E9 _ 8B. 55, F4
        mov     eax, edx                                ; 32EC _ 89. D0
        shl     eax, 5                                  ; 32EE _ C1. E0, 05
        sub     eax, edx                                ; 32F1 _ 29. D0
        shl     eax, 2                                  ; 32F3 _ C1. E0, 02
        add     eax, ebx                                ; 32F6 _ 01. D8
        add     eax, 68                                 ; 32F8 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 32FB _ 89. 08
        mov     ecx, dword [taskctl]                    ; 32FD _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 3303 _ 8B. 55, F4
        mov     eax, edx                                ; 3306 _ 89. D0
        shl     eax, 5                                  ; 3308 _ C1. E0, 05
        sub     eax, edx                                ; 330B _ 29. D0
        shl     eax, 2                                  ; 330D _ C1. E0, 02
        add     eax, 80                                 ; 3310 _ 83. C0, 50
        add     eax, ecx                                ; 3313 _ 01. C8
        add     eax, 8                                  ; 3315 _ 83. C0, 08
        mov     edx, eax                                ; 3318 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 331A _ 8B. 45, F4
        add     eax, 7                                  ; 331D _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 3320 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 3327 _ 8B. 45, F0
        add     eax, ecx                                ; 332A _ 01. C8
        push    137                                     ; 332C _ 68, 00000089
        push    edx                                     ; 3331 _ 52
        push    103                                     ; 3332 _ 6A, 67
        push    eax                                     ; 3334 _ 50
        call    set_segmdesc                            ; 3335 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 333A _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 333D _ FF. 45, F4
?_198:  cmp     dword [ebp-0CH], 4                      ; 3340 _ 83. 7D, F4, 04
        jle     ?_197                                   ; 3344 _ 0F 8E, FFFFFF6E
        mov     dword [ebp-0CH], 0                      ; 334A _ C7. 45, F4, 00000000
        jmp     ?_200                                   ; 3351 _ EB, 11

?_199:  sub     esp, 12                                 ; 3353 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 3356 _ FF. 75, F4
        call    init_task_level                         ; 3359 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 335E _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 3361 _ FF. 45, F4
?_200:  cmp     dword [ebp-0CH], 2                      ; 3364 _ 83. 7D, F4, 02
        jle     ?_199                                   ; 3368 _ 7E, E9
        call    task_alloc                              ; 336A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 336F _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3372 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 3375 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 337C _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 337F _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 3386 _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 3389 _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 3390 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 3393 _ FF. 75, EC
        call    task_add                                ; 3396 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 339B _ 83. C4, 10
        call    task_switchsub                          ; 339E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 33A3 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 33A6 _ 8B. 00
        sub     esp, 12                                 ; 33A8 _ 83. EC, 0C
        push    eax                                     ; 33AB _ 50
        call    load_tr                                 ; 33AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33B1 _ 83. C4, 10
        call    timer_alloc                             ; 33B4 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 33B9 _ A3, 000022C4(d)
        mov     eax, dword [ebp-14H]                    ; 33BE _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 33C1 _ 8B. 40, 08
        mov     edx, eax                                ; 33C4 _ 89. C2
        mov     eax, dword [task_timer]                 ; 33C6 _ A1, 000022C4(d)
        sub     esp, 8                                  ; 33CB _ 83. EC, 08
        push    edx                                     ; 33CE _ 52
        push    eax                                     ; 33CF _ 50
        call    timer_settime                           ; 33D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33D5 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 33D8 _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 33DB _ 8B. 5D, FC
        leave                                           ; 33DE _ C9
        ret                                             ; 33DF _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 33E0 _ 55
        mov     ebp, esp                                ; 33E1 _ 89. E5
        sub     esp, 16                                 ; 33E3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 33E6 _ C7. 45, FC, 00000000
        jmp     ?_203                                   ; 33ED _ E9, 000000ED

?_201:  mov     ecx, dword [taskctl]                    ; 33F2 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 33F8 _ 8B. 55, FC
        mov     eax, edx                                ; 33FB _ 89. D0
        shl     eax, 5                                  ; 33FD _ C1. E0, 05
        sub     eax, edx                                ; 3400 _ 29. D0
        shl     eax, 2                                  ; 3402 _ C1. E0, 02
        add     eax, ecx                                ; 3405 _ 01. C8
        add     eax, 72                                 ; 3407 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 340A _ 8B. 00
        test    eax, eax                                ; 340C _ 85. C0
        jne     ?_202                                   ; 340E _ 0F 85, 000000C8
        mov     ecx, dword [taskctl]                    ; 3414 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 341A _ 8B. 55, FC
        mov     eax, edx                                ; 341D _ 89. D0
        shl     eax, 5                                  ; 341F _ C1. E0, 05
        sub     eax, edx                                ; 3422 _ 29. D0
        shl     eax, 2                                  ; 3424 _ C1. E0, 02
        add     eax, 64                                 ; 3427 _ 83. C0, 40
        add     eax, ecx                                ; 342A _ 01. C8
        add     eax, 4                                  ; 342C _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 342F _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 3432 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 3435 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 343C _ 8B. 45, F8
        mov     dword [eax+38H], 514                    ; 343F _ C7. 40, 38, 00000202
        mov     eax, dword [ebp-8H]                     ; 3446 _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 3449 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3450 _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 3453 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 345A _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 345D _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 3464 _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 3467 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-8H]                     ; 346E _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 3471 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3478 _ 8B. 45, FC
        inc     eax                                     ; 347B _ 40
        shl     eax, 9                                  ; 347C _ C1. E0, 09
        mov     edx, eax                                ; 347F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 3481 _ 8B. 45, F8
        mov     dword [eax+4CH], edx                    ; 3484 _ 89. 50, 4C
        mov     eax, dword [ebp-8H]                     ; 3487 _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 348A _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 3491 _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 3494 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 349B _ 8B. 45, F8
        mov     dword [eax+5CH], 0                      ; 349E _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-8H]                     ; 34A5 _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 34A8 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 34AF _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 34B2 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 34B9 _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 34BC _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 34C3 _ 8B. 45, F8
        mov     dword [eax+74H], 0                      ; 34C6 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-8H]                     ; 34CD _ 8B. 45, F8
        mov     dword [eax+78H], 1073741824             ; 34D0 _ C7. 40, 78, 40000000
        mov     eax, dword [ebp-8H]                     ; 34D7 _ 8B. 45, F8
        jmp     ?_204                                   ; 34DA _ EB, 12

?_202:  inc     dword [ebp-4H]                          ; 34DC _ FF. 45, FC
?_203:  cmp     dword [ebp-4H], 4                       ; 34DF _ 83. 7D, FC, 04
        jle     ?_201                                   ; 34E3 _ 0F 8E, FFFFFF09
        mov     eax, 0                                  ; 34E9 _ B8, 00000000
?_204:  leave                                           ; 34EE _ C9
        ret                                             ; 34EF _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 34F0 _ 55
        mov     ebp, esp                                ; 34F1 _ 89. E5
        sub     esp, 8                                  ; 34F3 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 34F6 _ 83. 7D, 0C, 00
        jns     ?_205                                   ; 34FA _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 34FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 34FF _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3502 _ 89. 45, 0C
?_205:  cmp     dword [ebp+10H], 0                      ; 3505 _ 83. 7D, 10, 00
        jle     ?_206                                   ; 3509 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 350B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 350E _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3511 _ 89. 50, 08
?_206:  mov     eax, dword [ebp+8H]                     ; 3514 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3517 _ 8B. 40, 04
        cmp     eax, 2                                  ; 351A _ 83. F8, 02
        jnz     ?_207                                   ; 351D _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 351F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3522 _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 3525 _ 39. 45, 0C
        jz      ?_207                                   ; 3528 _ 74, 0E
        sub     esp, 12                                 ; 352A _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 352D _ FF. 75, 08
        call    task_remove                             ; 3530 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3535 _ 83. C4, 10
?_207:  mov     eax, dword [ebp+8H]                     ; 3538 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 353B _ 8B. 40, 04
        cmp     eax, 2                                  ; 353E _ 83. F8, 02
        jz      ?_208                                   ; 3541 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 3543 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3546 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3549 _ 89. 50, 0C
        sub     esp, 12                                 ; 354C _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 354F _ FF. 75, 08
        call    task_add                                ; 3552 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3557 _ 83. C4, 10
?_208:  mov     eax, dword [taskctl]                    ; 355A _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 355F _ C7. 40, 04, 00000001
        nop                                             ; 3566 _ 90
        leave                                           ; 3567 _ C9
        ret                                             ; 3568 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3569 _ 55
        mov     ebp, esp                                ; 356A _ 89. E5
        sub     esp, 24                                 ; 356C _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 356F _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 3575 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 357A _ 8B. 10
        mov     eax, edx                                ; 357C _ 89. D0
        shl     eax, 2                                  ; 357E _ C1. E0, 02
        add     eax, edx                                ; 3581 _ 01. D0
        shl     eax, 2                                  ; 3583 _ C1. E0, 02
        add     eax, ecx                                ; 3586 _ 01. C8
        add     eax, 8                                  ; 3588 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 358B _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 358E _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3591 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3594 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 3597 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 359B _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 359E _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 35A1 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 35A4 _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 35A7 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 35AA _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 35AD _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 35B0 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 35B3 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 35B6 _ 8B. 00
        cmp     edx, eax                                ; 35B8 _ 39. C2
        jnz     ?_209                                   ; 35BA _ 75, 0A
        mov     eax, dword [ebp-0CH]                    ; 35BC _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 35BF _ C7. 40, 04, 00000000
?_209:  mov     eax, dword [taskctl]                    ; 35C6 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 35CB _ 8B. 40, 04
        test    eax, eax                                ; 35CE _ 85. C0
        jz      ?_210                                   ; 35D0 _ 74, 24
        call    task_switchsub                          ; 35D2 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 35D7 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 35DD _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 35E2 _ 8B. 10
        mov     eax, edx                                ; 35E4 _ 89. D0
        shl     eax, 2                                  ; 35E6 _ C1. E0, 02
        add     eax, edx                                ; 35E9 _ 01. D0
        shl     eax, 2                                  ; 35EB _ C1. E0, 02
        add     eax, ecx                                ; 35EE _ 01. C8
        add     eax, 8                                  ; 35F0 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 35F3 _ 89. 45, F4
?_210:  mov     eax, dword [ebp-0CH]                    ; 35F6 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 35F9 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 35FC _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 35FF _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 3603 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3606 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 3609 _ 8B. 40, 08
        mov     edx, eax                                ; 360C _ 89. C2
        mov     eax, dword [task_timer]                 ; 360E _ A1, 000022C4(d)
        sub     esp, 8                                  ; 3613 _ 83. EC, 08
        push    edx                                     ; 3616 _ 52
        push    eax                                     ; 3617 _ 50
        call    timer_settime                           ; 3618 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 361D _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 3620 _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 3623 _ 3B. 45, F0
        jz      ?_211                                   ; 3626 _ 74, 1A
        cmp     dword [ebp-14H], 0                      ; 3628 _ 83. 7D, EC, 00
        jz      ?_211                                   ; 362C _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 362E _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3631 _ 8B. 00
        sub     esp, 8                                  ; 3633 _ 83. EC, 08
        push    eax                                     ; 3636 _ 50
        push    0                                       ; 3637 _ 6A, 00
        call    farjmp                                  ; 3639 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 363E _ 83. C4, 10
        nop                                             ; 3641 _ 90
?_211:  nop                                             ; 3642 _ 90
        leave                                           ; 3643 _ C9
        ret                                             ; 3644 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3645 _ 55
        mov     ebp, esp                                ; 3646 _ 89. E5
        sub     esp, 24                                 ; 3648 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 364B _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 3652 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 3659 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 365C _ 8B. 40, 04
        cmp     eax, 2                                  ; 365F _ 83. F8, 02
        jnz     ?_212                                   ; 3662 _ 75, 52
        call    task_now                                ; 3664 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3669 _ 89. 45, F0
        sub     esp, 12                                 ; 366C _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 366F _ FF. 75, 08
        call    task_remove                             ; 3672 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3677 _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 367A _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 3681 _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 3684 _ 3B. 45, F0
        jnz     ?_212                                   ; 3687 _ 75, 2D
        call    task_switchsub                          ; 3689 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 368E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3693 _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 3696 _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 369D _ 83. 7D, F0, 00
        jz      ?_212                                   ; 36A1 _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 36A3 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 36A6 _ 8B. 00
        sub     esp, 8                                  ; 36A8 _ 83. EC, 08
        push    eax                                     ; 36AB _ 50
        push    0                                       ; 36AC _ 6A, 00
        call    farjmp                                  ; 36AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 36B3 _ 83. C4, 10
?_212:  mov     eax, dword [ebp-0CH]                    ; 36B6 _ 8B. 45, F4
        leave                                           ; 36B9 _ C9
        ret                                             ; 36BA _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 36BB _ 55
        mov     ebp, esp                                ; 36BC _ 89. E5
        sub     esp, 16                                 ; 36BE _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 36C1 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 36C7 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 36CC _ 8B. 10
        mov     eax, edx                                ; 36CE _ 89. D0
        shl     eax, 2                                  ; 36D0 _ C1. E0, 02
        add     eax, edx                                ; 36D3 _ 01. D0
        shl     eax, 2                                  ; 36D5 _ C1. E0, 02
        add     eax, ecx                                ; 36D8 _ 01. C8
        add     eax, 8                                  ; 36DA _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 36DD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 36E0 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 36E3 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 36E6 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 36E9 _ 8B. 44 90, 08
        leave                                           ; 36ED _ C9
        ret                                             ; 36EE _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 36EF _ 55
        mov     ebp, esp                                ; 36F0 _ 89. E5
        sub     esp, 16                                 ; 36F2 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 36F5 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 36FB _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 36FE _ 8B. 50, 0C
        mov     eax, edx                                ; 3701 _ 89. D0
        shl     eax, 2                                  ; 3703 _ C1. E0, 02
        add     eax, edx                                ; 3706 _ 01. D0
        shl     eax, 2                                  ; 3708 _ C1. E0, 02
        add     eax, ecx                                ; 370B _ 01. C8
        add     eax, 8                                  ; 370D _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3710 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3713 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 3716 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 3718 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 371B _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 371E _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3722 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3725 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3727 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 372A _ 8B. 45, FC
        mov     dword [eax], edx                        ; 372D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 372F _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3732 _ C7. 40, 04, 00000002
        nop                                             ; 3739 _ 90
        leave                                           ; 373A _ C9
        ret                                             ; 373B _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 373C _ 55
        mov     ebp, esp                                ; 373D _ 89. E5
        sub     esp, 16                                 ; 373F _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3742 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 3748 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 374B _ 8B. 50, 0C
        mov     eax, edx                                ; 374E _ 89. D0
        shl     eax, 2                                  ; 3750 _ C1. E0, 02
        add     eax, edx                                ; 3753 _ 01. D0
        shl     eax, 2                                  ; 3755 _ C1. E0, 02
        add     eax, ecx                                ; 3758 _ 01. C8
        add     eax, 8                                  ; 375A _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 375D _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 3760 _ C7. 45, FC, 00000000
        jmp     ?_215                                   ; 3767 _ EB, 22

?_213:  mov     eax, dword [ebp-8H]                     ; 3769 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 376C _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 376F _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 3773 _ 39. 45, 08
        jnz     ?_214                                   ; 3776 _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 3778 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 377B _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 377E _ C7. 44 90, 08, 00000000
        jmp     ?_216                                   ; 3786 _ EB, 0D

?_214:  inc     dword [ebp-4H]                          ; 3788 _ FF. 45, FC
?_215:  mov     eax, dword [ebp-8H]                     ; 378B _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 378E _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 3790 _ 39. 45, FC
        jl      ?_213                                   ; 3793 _ 7C, D4
?_216:  mov     eax, dword [ebp-8H]                     ; 3795 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3798 _ 8B. 00
        lea     edx, [eax-1H]                           ; 379A _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 379D _ 8B. 45, F8
        mov     dword [eax], edx                        ; 37A0 _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 37A2 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 37A5 _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 37A8 _ 39. 45, FC
        jge     ?_217                                   ; 37AB _ 7D, 0F
        mov     eax, dword [ebp-8H]                     ; 37AD _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 37B0 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 37B3 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 37B6 _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 37B9 _ 89. 50, 04
?_217:  mov     eax, dword [ebp-8H]                     ; 37BC _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 37BF _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 37C2 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 37C5 _ 8B. 00
        cmp     edx, eax                                ; 37C7 _ 39. C2
        jl      ?_218                                   ; 37C9 _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 37CB _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 37CE _ C7. 40, 04, 00000000
?_218:  mov     eax, dword [ebp+8H]                     ; 37D5 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 37D8 _ C7. 40, 04, 00000001
        jmp     ?_220                                   ; 37DF _ EB, 1A

?_219:  mov     eax, dword [ebp-4H]                     ; 37E1 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 37E4 _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 37E7 _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 37EA _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 37EE _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 37F1 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 37F4 _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 37F8 _ FF. 45, FC
?_220:  mov     eax, dword [ebp-8H]                     ; 37FB _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 37FE _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 3800 _ 39. 45, FC
        jl      ?_219                                   ; 3803 _ 7C, DC
        nop                                             ; 3805 _ 90
        leave                                           ; 3806 _ C9
        ret                                             ; 3807 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 3808 _ 55
        mov     ebp, esp                                ; 3809 _ 89. E5
        sub     esp, 16                                 ; 380B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 380E _ C7. 45, FC, 00000000
        jmp     ?_222                                   ; 3815 _ EB, 21

?_221:  mov     ecx, dword [taskctl]                    ; 3817 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 381D _ 8B. 55, FC
        mov     eax, edx                                ; 3820 _ 89. D0
        shl     eax, 2                                  ; 3822 _ C1. E0, 02
        add     eax, edx                                ; 3825 _ 01. D0
        shl     eax, 2                                  ; 3827 _ C1. E0, 02
        add     eax, ecx                                ; 382A _ 01. C8
        add     eax, 8                                  ; 382C _ 83. C0, 08
        mov     eax, dword [eax]                        ; 382F _ 8B. 00
        test    eax, eax                                ; 3831 _ 85. C0
        jg      ?_223                                   ; 3833 _ 7F, 0B
        inc     dword [ebp-4H]                          ; 3835 _ FF. 45, FC
?_222:  cmp     dword [ebp-4H], 2                       ; 3838 _ 83. 7D, FC, 02
        jle     ?_221                                   ; 383C _ 7E, D9
        jmp     ?_224                                   ; 383E _ EB, 01

?_223:  nop                                             ; 3840 _ 90
?_224:  mov     eax, dword [taskctl]                    ; 3841 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 3846 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 3849 _ 89. 10
        mov     eax, dword [taskctl]                    ; 384B _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 3850 _ C7. 40, 04, 00000000
        nop                                             ; 3857 _ 90
        leave                                           ; 3858 _ C9
        ret                                             ; 3859 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 385A _ 55
        mov     ebp, esp                                ; 385B _ 89. E5
        sub     esp, 8                                  ; 385D _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 3860 _ 8B. 45, 10
        movzx   eax, al                                 ; 3863 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 3866 _ 8B. 55, 0C
        add     edx, 16                                 ; 3869 _ 83. C2, 10
        sub     esp, 8                                  ; 386C _ 83. EC, 08
        push    eax                                     ; 386F _ 50
        push    edx                                     ; 3870 _ 52
        call    fifo8_put                               ; 3871 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3876 _ 83. C4, 10
        sub     esp, 12                                 ; 3879 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 387C _ FF. 75, 08
        call    task_sleep                              ; 387F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3884 _ 83. C4, 10
        nop                                             ; 3887 _ 90
        leave                                           ; 3888 _ C9
        ret                                             ; 3889 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_225:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_226:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_227:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_228:                                                  ; byte
        db 3EH, 00H                                     ; 0017 _ >.

?_229:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0019 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0021 _ sk b.

?_230:                                                  ; byte
        db 42H, 00H                                     ; 0026 _ B.

?_231:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0028 _ page is:
        db 20H, 00H                                     ; 0030 _  .

?_232:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0032 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 003A _ L: .

?_233:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0046 _ H: .

?_234:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 004A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0052 _ w: .


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

table_rgb.1984:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0120 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.2031:                                            ; byte
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

closebtn.2150:                                          ; byte
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


SECTION .bss    align=32 noexecute                      ; section number 4, bss

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

task_main:                                              ; dword
        resd    1                                       ; 0274

task_a.1882:                                            ; dword
        resd    2                                       ; 0278

tss_a.1881:                                             ; byte
        resb    128                                     ; 0280

tss_b.1880:                                             ; byte
        resb    104                                     ; 0300

task_b.1866:                                            ; byte
        resb    12                                      ; 0368

str.2079:                                               ; byte
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


