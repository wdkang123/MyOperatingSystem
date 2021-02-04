; Disassembly of file: ckernel.o
; Mon Feb  1 22:29:59 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
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
global memman

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
        push    esi                                     ; 0003 _ 56
        push    ebx                                     ; 0004 _ 53
        sub     esp, 80                                 ; 0005 _ 83. EC, 50
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-20H], eax                    ; 001D _ 89. 45, E0
        mov     eax, dword [?_211]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000011C(d)
        mov     ax, word [?_212]                        ; 002B _ 66: A1, 00000006(d)
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
        mov     dword [ebp-24H], eax                    ; 0057 _ 89. 45, DC
        sub     esp, 4                                  ; 005A _ 83. EC, 04
        push    10                                      ; 005D _ 6A, 0A
        push    timerinfo                               ; 005F _ 68, 000000F0(d)
        push    dword [ebp-24H]                         ; 0064 _ FF. 75, DC
        call    timer_init                              ; 0067 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006C _ 83. C4, 10
        sub     esp, 8                                  ; 006F _ 83. EC, 08
        push    100                                     ; 0072 _ 6A, 64
        push    dword [ebp-24H]                         ; 0074 _ FF. 75, DC
        call    timer_settime                           ; 0077 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007C _ 83. C4, 10
        call    timer_alloc                             ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0084 _ 89. 45, D8
        sub     esp, 4                                  ; 0087 _ 83. EC, 04
        push    2                                       ; 008A _ 6A, 02
        push    timerinfo                               ; 008C _ 68, 000000F0(d)
        push    dword [ebp-28H]                         ; 0091 _ FF. 75, D8
        call    timer_init                              ; 0094 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0099 _ 83. C4, 10
        sub     esp, 8                                  ; 009C _ 83. EC, 08
        push    300                                     ; 009F _ 68, 0000012C
        push    dword [ebp-28H]                         ; 00A4 _ FF. 75, D8
        call    timer_settime                           ; 00A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AC _ 83. C4, 10
        call    timer_alloc                             ; 00AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 00B4 _ 89. 45, D4
        sub     esp, 4                                  ; 00B7 _ 83. EC, 04
        push    1                                       ; 00BA _ 6A, 01
        push    timerinfo                               ; 00BC _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 00C1 _ FF. 75, D4
        call    timer_init                              ; 00C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C9 _ 83. C4, 10
        sub     esp, 8                                  ; 00CC _ 83. EC, 08
        push    50                                      ; 00CF _ 6A, 32
        push    dword [ebp-2CH]                         ; 00D1 _ FF. 75, D4
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
        mov     dword [ebp-30H], eax                    ; 011A _ 89. 45, D0
        call    get_adr_buffer                          ; 011D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0122 _ 89. 45, CC
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
        push    dword [ebp-20H]                         ; 0164 _ FF. 75, E0
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
        push    ?_199                                   ; 02B9 _ 68, 00000000(d)
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
        mov     dword [ebp-38H], eax                    ; 031A _ 89. 45, C8
        call    get_addr_gdt                            ; 031D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0322 _ 89. 45, C4
        mov     eax, dword [memman]                     ; 0325 _ A1, 00000000(d)
        sub     esp, 12                                 ; 032A _ 83. EC, 0C
        push    eax                                     ; 032D _ 50
        call    task_init                               ; 032E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0333 _ 83. C4, 10
        mov     dword [task_a.1855], eax                ; 0336 _ A3, 00000250(d)
        mov     eax, dword [task_a.1855]                ; 033B _ A1, 00000250(d)
        mov     dword [?_213], eax                      ; 0340 _ A3, 00000020(d)
        mov     eax, dword [task_a.1855]                ; 0345 _ A1, 00000250(d)
        sub     esp, 4                                  ; 034A _ 83. EC, 04
        push    0                                       ; 034D _ 6A, 00
        push    0                                       ; 034F _ 6A, 00
        push    eax                                     ; 0351 _ 50
        call    task_run                                ; 0352 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0357 _ 83. C4, 10
        call    launch_console                          ; 035A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 035F _ C7. 45, C0, 00000000
        mov     dword [ebp-14H], 0                      ; 0366 _ C7. 45, EC, 00000000
        mov     dword [ebp-44H], 0                      ; 036D _ C7. 45, BC, 00000000
        mov     dword [ebp-18H], 0                      ; 0374 _ C7. 45, E8, 00000000
        mov     dword [ebp-1CH], 0                      ; 037B _ C7. 45, E4, 00000000
?_001:  call    io_cli                                  ; 0382 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0387 _ 83. EC, 0C
        push    keyinfo                                 ; 038A _ 68, 00000008(d)
        call    fifo8_status                            ; 038F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0394 _ 83. C4, 10
        mov     ebx, eax                                ; 0397 _ 89. C3
        sub     esp, 12                                 ; 0399 _ 83. EC, 0C
        push    mouseinfo                               ; 039C _ 68, 00000024(d)
        call    fifo8_status                            ; 03A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03A6 _ 83. C4, 10
        add     ebx, eax                                ; 03A9 _ 01. C3
        sub     esp, 12                                 ; 03AB _ 83. EC, 0C
        push    timerinfo                               ; 03AE _ 68, 000000F0(d)
        call    fifo8_status                            ; 03B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03B8 _ 83. C4, 10
        add     eax, ebx                                ; 03BB _ 01. D8
        test    eax, eax                                ; 03BD _ 85. C0
        jnz     ?_002                                   ; 03BF _ 75, 07
        call    io_sti                                  ; 03C1 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03C6 _ EB, BA

?_002:  sub     esp, 12                                 ; 03C8 _ 83. EC, 0C
        push    keyinfo                                 ; 03CB _ 68, 00000008(d)
        call    fifo8_status                            ; 03D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03D5 _ 83. C4, 10
        test    eax, eax                                ; 03D8 _ 85. C0
        je      ?_004                                   ; 03DA _ 0F 84, 00000186
        call    io_sti                                  ; 03E0 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 03E5 _ 83. EC, 0C
        push    keyinfo                                 ; 03E8 _ 68, 00000008(d)
        call    fifo8_get                               ; 03ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F2 _ 83. C4, 10
        mov     dword [ebp-40H], eax                    ; 03F5 _ 89. 45, C0
        cmp     dword [ebp-40H], 28                     ; 03F8 _ 83. 7D, C0, 1C
        jnz     ?_003                                   ; 03FC _ 75, 5C
        mov     ebx, dword [xsize]                      ; 03FE _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [buf_back]                   ; 0404 _ 8B. 0D, 00000124(d)
        mov     edx, dword [ebp-14H]                    ; 040A _ 8B. 55, EC
        mov     eax, edx                                ; 040D _ 89. D0
        shl     eax, 2                                  ; 040F _ C1. E0, 02
        add     eax, edx                                ; 0412 _ 01. D0
        shl     eax, 2                                  ; 0414 _ C1. E0, 02
        mov     edx, eax                                ; 0417 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 0419 _ 8B. 45, CC
        lea     esi, [edx+eax]                          ; 041C _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 041F _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0425 _ A1, 00000244(d)
        sub     esp, 4                                  ; 042A _ 83. EC, 04
        push    7                                       ; 042D _ 6A, 07
        push    ebx                                     ; 042F _ 53
        push    dword [ebp-14H]                         ; 0430 _ FF. 75, EC
        push    ecx                                     ; 0433 _ 51
        push    esi                                     ; 0434 _ 56
        push    edx                                     ; 0435 _ 52
        push    eax                                     ; 0436 _ 50
        call    showMemoryInfo                          ; 0437 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 043C _ 83. C4, 20
        inc     dword [ebp-14H]                         ; 043F _ FF. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0442 _ 8B. 45, EC
        cmp     eax, dword [ebp-30H]                    ; 0445 _ 3B. 45, D0
        jle     ?_001                                   ; 0448 _ 0F 8E, FFFFFF34
        mov     dword [ebp-14H], 0                      ; 044E _ C7. 45, EC, 00000000
        jmp     ?_001                                   ; 0455 _ E9, FFFFFF28

?_003:  mov     eax, dword [ebp-40H]                    ; 045A _ 8B. 45, C0
        add     eax, keytable                           ; 045D _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0462 _ 8A. 00
        test    al, al                                  ; 0464 _ 84. C0
        je      ?_001                                   ; 0466 _ 0F 84, FFFFFF16
        cmp     dword [ebp-0CH], 143                    ; 046C _ 81. 7D, F4, 0000008F
        jg      ?_001                                   ; 0473 _ 0F 8F, FFFFFF09
        mov     eax, dword [ebp-0CH]                    ; 0479 _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 047C _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 047F _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0484 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0487 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 048C _ 8B. 00
        sub     esp, 4                                  ; 048E _ 83. EC, 04
        push    43                                      ; 0491 _ 6A, 2B
        push    ecx                                     ; 0493 _ 51
        push    28                                      ; 0494 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0496 _ FF. 75, F4
        push    7                                       ; 0499 _ 6A, 07
        push    edx                                     ; 049B _ 52
        push    eax                                     ; 049C _ 50
        call    boxfill8                                ; 049D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04A2 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 04A5 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 04A8 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 04AB _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 04B1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 04B6 _ 83. EC, 08
        push    44                                      ; 04B9 _ 6A, 2C
        push    ecx                                     ; 04BB _ 51
        push    28                                      ; 04BC _ 6A, 1C
        push    dword [ebp-0CH]                         ; 04BE _ FF. 75, F4
        push    edx                                     ; 04C1 _ 52
        push    eax                                     ; 04C2 _ 50
        call    sheet_refresh                           ; 04C3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04C8 _ 83. C4, 20
        mov     eax, dword [ebp-40H]                    ; 04CB _ 8B. 45, C0
        add     eax, keytable                           ; 04CE _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 04D3 _ 8A. 00
        mov     byte [ebp-56H], al                      ; 04D5 _ 88. 45, AA
        mov     byte [ebp-55H], 0                       ; 04D8 _ C6. 45, AB, 00
        mov     edx, dword [shtMsgBox]                  ; 04DC _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 04E2 _ A1, 00000244(d)
        sub     esp, 8                                  ; 04E7 _ 83. EC, 08
        lea     ecx, [ebp-56H]                          ; 04EA _ 8D. 4D, AA
        push    ecx                                     ; 04ED _ 51
        push    0                                       ; 04EE _ 6A, 00
        push    28                                      ; 04F0 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 04F2 _ FF. 75, F4
        push    edx                                     ; 04F5 _ 52
        push    eax                                     ; 04F6 _ 50
        call    showString                              ; 04F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 04FC _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 04FF _ 83. 45, F4, 08
        mov     dword [ebp-1CH], 1                      ; 0503 _ C7. 45, E4, 00000001
        mov     eax, dword [ebp-0CH]                    ; 050A _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 050D _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0510 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0513 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 0516 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 051B _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 051E _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0523 _ 8B. 00
        sub     esp, 4                                  ; 0525 _ 83. EC, 04
        push    43                                      ; 0528 _ 6A, 2B
        push    ebx                                     ; 052A _ 53
        push    28                                      ; 052B _ 6A, 1C
        push    dword [ebp-0CH]                         ; 052D _ FF. 75, F4
        push    ecx                                     ; 0530 _ 51
        push    edx                                     ; 0531 _ 52
        push    eax                                     ; 0532 _ 50
        call    boxfill8                                ; 0533 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0538 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 053B _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 053E _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0541 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 0547 _ A1, 00000244(d)
        sub     esp, 8                                  ; 054C _ 83. EC, 08
        push    44                                      ; 054F _ 6A, 2C
        push    ecx                                     ; 0551 _ 51
        push    28                                      ; 0552 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0554 _ FF. 75, F4
        push    edx                                     ; 0557 _ 52
        push    eax                                     ; 0558 _ 50
        call    sheet_refresh                           ; 0559 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 055E _ 83. C4, 20
        jmp     ?_001                                   ; 0561 _ E9, FFFFFE1C

?_004:  sub     esp, 12                                 ; 0566 _ 83. EC, 0C
        push    mouseinfo                               ; 0569 _ 68, 00000024(d)
        call    fifo8_status                            ; 056E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0573 _ 83. C4, 10
        test    eax, eax                                ; 0576 _ 85. C0
        jz      ?_005                                   ; 0578 _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 057A _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 0580 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0586 _ A1, 00000244(d)
        sub     esp, 4                                  ; 058B _ 83. EC, 04
        push    ecx                                     ; 058E _ 51
        push    edx                                     ; 058F _ 52
        push    eax                                     ; 0590 _ 50
        call    show_mouse_info                         ; 0591 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0596 _ 83. C4, 10
        jmp     ?_001                                   ; 0599 _ E9, FFFFFDE4

?_005:  sub     esp, 12                                 ; 059E _ 83. EC, 0C
        push    timerinfo                               ; 05A1 _ 68, 000000F0(d)
        call    fifo8_status                            ; 05A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05AB _ 83. C4, 10
        test    eax, eax                                ; 05AE _ 85. C0
        je      ?_001                                   ; 05B0 _ 0F 84, FFFFFDCC
        call    io_sti                                  ; 05B6 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05BB _ 83. EC, 0C
        push    timerinfo                               ; 05BE _ 68, 000000F0(d)
        call    fifo8_get                               ; 05C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05C8 _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 05CB _ 89. 45, B8
        cmp     dword [ebp-48H], 10                     ; 05CE _ 83. 7D, B8, 0A
        jnz     ?_006                                   ; 05D2 _ 75, 6A
        mov     edx, dword [sht_back]                   ; 05D4 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 05DA _ A1, 00000244(d)
        sub     esp, 8                                  ; 05DF _ 83. EC, 08
        push    ?_200                                   ; 05E2 _ 68, 00000008(d)
        push    7                                       ; 05E7 _ 6A, 07
        push    144                                     ; 05E9 _ 68, 00000090
        push    dword [ebp-18H]                         ; 05EE _ FF. 75, E8
        push    edx                                     ; 05F1 _ 52
        push    eax                                     ; 05F2 _ 50
        call    showString                              ; 05F3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05F8 _ 83. C4, 20
        sub     esp, 8                                  ; 05FB _ 83. EC, 08
        push    100                                     ; 05FE _ 6A, 64
        push    dword [ebp-24H]                         ; 0600 _ FF. 75, DC
        call    timer_settime                           ; 0603 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0608 _ 83. C4, 10
        add     dword [ebp-18H], 8                      ; 060B _ 83. 45, E8, 08
        cmp     dword [ebp-18H], 40                     ; 060F _ 83. 7D, E8, 28
        jle     ?_001                                   ; 0613 _ 0F 8E, FFFFFD69
        cmp     dword [ebp-1CH], 0                      ; 0619 _ 83. 7D, E4, 00
        jne     ?_001                                   ; 061D _ 0F 85, FFFFFD5F
        call    io_cli                                  ; 0623 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1855]                ; 0628 _ A1, 00000250(d)
        sub     esp, 12                                 ; 062D _ 83. EC, 0C
        push    eax                                     ; 0630 _ 50
        call    task_sleep                              ; 0631 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0636 _ 83. C4, 10
        jmp     ?_001                                   ; 0639 _ E9, FFFFFD44

?_006:  cmp     dword [ebp-48H], 2                      ; 063E _ 83. 7D, B8, 02
        jnz     ?_007                                   ; 0642 _ 75, 28
        mov     edx, dword [sht_back]                   ; 0644 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 064A _ A1, 00000244(d)
        sub     esp, 8                                  ; 064F _ 83. EC, 08
        push    ?_201                                   ; 0652 _ 68, 0000000A(d)
        push    7                                       ; 0657 _ 6A, 07
        push    32                                      ; 0659 _ 6A, 20
        push    0                                       ; 065B _ 6A, 00
        push    edx                                     ; 065D _ 52
        push    eax                                     ; 065E _ 50
        call    showString                              ; 065F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0664 _ 83. C4, 20
        jmp     ?_001                                   ; 0667 _ E9, FFFFFD16

?_007:  cmp     dword [ebp-48H], 0                      ; 066C _ 83. 7D, B8, 00
        jz      ?_008                                   ; 0670 _ 74, 1E
        sub     esp, 4                                  ; 0672 _ 83. EC, 04
        push    0                                       ; 0675 _ 6A, 00
        push    timerinfo                               ; 0677 _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 067C _ FF. 75, D4
        call    timer_init                              ; 067F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0684 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0687 _ C7. 45, F0, 00000000
        jmp     ?_009                                   ; 068E _ EB, 1C

?_008:  sub     esp, 4                                  ; 0690 _ 83. EC, 04
        push    1                                       ; 0693 _ 6A, 01
        push    timerinfo                               ; 0695 _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 069A _ FF. 75, D4
        call    timer_init                              ; 069D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06A2 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 06A5 _ C7. 45, F0, 00000007
?_009:  sub     esp, 8                                  ; 06AC _ 83. EC, 08
        push    50                                      ; 06AF _ 6A, 32
        push    dword [ebp-2CH]                         ; 06B1 _ FF. 75, D4
        call    timer_settime                           ; 06B4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06B9 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 06BC _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 06BF _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 06C2 _ 8B. 45, F0
        movzx   ecx, al                                 ; 06C5 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 06C8 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 06CD _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 06D0 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 06D5 _ 8B. 00
        sub     esp, 4                                  ; 06D7 _ 83. EC, 04
        push    43                                      ; 06DA _ 6A, 2B
        push    ebx                                     ; 06DC _ 53
        push    28                                      ; 06DD _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06DF _ FF. 75, F4
        push    ecx                                     ; 06E2 _ 51
        push    edx                                     ; 06E3 _ 52
        push    eax                                     ; 06E4 _ 50
        call    boxfill8                                ; 06E5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06EA _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 06ED _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 06F0 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 06F3 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 06F9 _ A1, 00000244(d)
        sub     esp, 8                                  ; 06FE _ 83. EC, 08
        push    44                                      ; 0701 _ 6A, 2C
        push    ecx                                     ; 0703 _ 51
        push    28                                      ; 0704 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0706 _ FF. 75, F4
        push    edx                                     ; 0709 _ 52
        push    eax                                     ; 070A _ 50
        call    sheet_refresh                           ; 070B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0710 _ 83. C4, 20
        jmp     ?_001                                   ; 0713 _ E9, FFFFFC6A
; CMain End of function

launch_console:; Function begin
        push    ebp                                     ; 0718 _ 55
        mov     ebp, esp                                ; 0719 _ 89. E5
        sub     esp, 24                                 ; 071B _ 83. EC, 18
        mov     eax, dword [shtctl]                     ; 071E _ A1, 00000244(d)
        sub     esp, 12                                 ; 0723 _ 83. EC, 0C
        push    eax                                     ; 0726 _ 50
        call    sheet_alloc                             ; 0727 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 072C _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 072F _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0732 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0737 _ 83. EC, 08
        push    42240                                   ; 073A _ 68, 0000A500
        push    eax                                     ; 073F _ 50
        call    memman_alloc_4k                         ; 0740 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0745 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0748 _ 89. 45, F0
        sub     esp, 12                                 ; 074B _ 83. EC, 0C
        push    99                                      ; 074E _ 6A, 63
        push    165                                     ; 0750 _ 68, 000000A5
        push    256                                     ; 0755 _ 68, 00000100
        push    dword [ebp-10H]                         ; 075A _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 075D _ FF. 75, F4
        call    sheet_setbuf                            ; 0760 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0765 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0768 _ A1, 00000244(d)
        sub     esp, 4                                  ; 076D _ 83. EC, 04
        push    ?_202                                   ; 0770 _ 68, 00000011(d)
        push    dword [ebp-0CH]                         ; 0775 _ FF. 75, F4
        push    eax                                     ; 0778 _ 50
        call    make_window8                            ; 0779 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 077E _ 83. C4, 10
        sub     esp, 8                                  ; 0781 _ 83. EC, 08
        push    0                                       ; 0784 _ 6A, 00
        push    128                                     ; 0786 _ 68, 00000080
        push    240                                     ; 078B _ 68, 000000F0
        push    28                                      ; 0790 _ 6A, 1C
        push    8                                       ; 0792 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0794 _ FF. 75, F4
        call    make_textbox8                           ; 0797 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 079C _ 83. C4, 20
        call    task_alloc                              ; 079F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 07A4 _ 89. 45, EC
        call    get_code32_addr                         ; 07A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 07AC _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 07AF _ 8B. 45, EC
        mov     dword [eax+70H], 0                      ; 07B2 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-14H]                    ; 07B9 _ 8B. 45, EC
        mov     dword [eax+74H], 1073741824             ; 07BC _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-18H]                    ; 07C3 _ 8B. 45, E8
        neg     eax                                     ; 07C6 _ F7. D8
        add     eax, console_task                       ; 07C8 _ 05, 00000000(d)
        mov     edx, eax                                ; 07CD _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 07CF _ 8B. 45, EC
        mov     dword [eax+30H], edx                    ; 07D2 _ 89. 50, 30
        mov     eax, dword [ebp-14H]                    ; 07D5 _ 8B. 45, EC
        mov     dword [eax+58H], 0                      ; 07D8 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-14H]                    ; 07DF _ 8B. 45, EC
        mov     dword [eax+5CH], 8                      ; 07E2 _ C7. 40, 5C, 00000008
        mov     eax, dword [ebp-14H]                    ; 07E9 _ 8B. 45, EC
        mov     dword [eax+60H], 32                     ; 07EC _ C7. 40, 60, 00000020
        mov     eax, dword [ebp-14H]                    ; 07F3 _ 8B. 45, EC
        mov     dword [eax+64H], 24                     ; 07F6 _ C7. 40, 64, 00000018
        mov     eax, dword [ebp-14H]                    ; 07FD _ 8B. 45, EC
        mov     dword [eax+68H], 0                      ; 0800 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-14H]                    ; 0807 _ 8B. 45, EC
        mov     dword [eax+6CH], 16                     ; 080A _ C7. 40, 6C, 00000010
        mov     eax, dword [ebp-14H]                    ; 0811 _ 8B. 45, EC
        mov     eax, dword [eax+48H]                    ; 0814 _ 8B. 40, 48
        lea     edx, [eax-8H]                           ; 0817 _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 081A _ 8B. 45, EC
        mov     dword [eax+48H], edx                    ; 081D _ 89. 50, 48
        mov     eax, dword [ebp-14H]                    ; 0820 _ 8B. 45, EC
        mov     eax, dword [eax+48H]                    ; 0823 _ 8B. 40, 48
        add     eax, 4                                  ; 0826 _ 83. C0, 04
        mov     edx, eax                                ; 0829 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 082B _ 8B. 45, F4
        mov     dword [edx], eax                        ; 082E _ 89. 02
        sub     esp, 4                                  ; 0830 _ 83. EC, 04
        push    5                                       ; 0833 _ 6A, 05
        push    1                                       ; 0835 _ 6A, 01
        push    dword [ebp-14H]                         ; 0837 _ FF. 75, EC
        call    task_run                                ; 083A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 083F _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0842 _ A1, 00000244(d)
        push    4                                       ; 0847 _ 6A, 04
        push    32                                      ; 0849 _ 6A, 20
        push    dword [ebp-0CH]                         ; 084B _ FF. 75, F4
        push    eax                                     ; 084E _ 50
        call    sheet_slide                             ; 084F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0854 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0857 _ A1, 00000244(d)
        sub     esp, 4                                  ; 085C _ 83. EC, 04
        push    1                                       ; 085F _ 6A, 01
        push    dword [ebp-0CH]                         ; 0861 _ FF. 75, F4
        push    eax                                     ; 0864 _ 50
        call    sheet_updown                            ; 0865 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 086A _ 83. C4, 10
        nop                                             ; 086D _ 90
        leave                                           ; 086E _ C9
        ret                                             ; 086F _ C3
; launch_console End of function

console_task:; Function begin
        push    ebp                                     ; 0870 _ 55
        mov     ebp, esp                                ; 0871 _ 89. E5
        push    ebx                                     ; 0873 _ 53
        sub     esp, 564                                ; 0874 _ 81. EC, 00000234
        call    task_now                                ; 087A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 087F _ 89. 45, F0
        mov     dword [ebp-14H], 8                      ; 0882 _ C7. 45, EC, 00000008
        mov     dword [ebp-0CH], 0                      ; 0889 _ C7. 45, F4, 00000000
        push    dword [ebp-10H]                         ; 0890 _ FF. 75, F0
        lea     eax, [ebp-238H]                         ; 0893 _ 8D. 85, FFFFFDC8
        push    eax                                     ; 0899 _ 50
        push    128                                     ; 089A _ 68, 00000080
        lea     eax, [ebp-38H]                          ; 089F _ 8D. 45, C8
        push    eax                                     ; 08A2 _ 50
        call    fifo8_init                              ; 08A3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08A8 _ 83. C4, 10
        call    timer_alloc                             ; 08AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 08B0 _ 89. 45, E8
        sub     esp, 4                                  ; 08B3 _ 83. EC, 04
        push    1                                       ; 08B6 _ 6A, 01
        lea     eax, [ebp-38H]                          ; 08B8 _ 8D. 45, C8
        push    eax                                     ; 08BB _ 50
        push    dword [ebp-18H]                         ; 08BC _ FF. 75, E8
        call    timer_init                              ; 08BF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08C4 _ 83. C4, 10
        sub     esp, 8                                  ; 08C7 _ 83. EC, 08
        push    50                                      ; 08CA _ 6A, 32
        push    dword [ebp-18H]                         ; 08CC _ FF. 75, E8
        call    timer_settime                           ; 08CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08D4 _ 83. C4, 10
?_010:  call    io_cli                                  ; 08D7 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 08DC _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 08DF _ 8D. 45, C8
        push    eax                                     ; 08E2 _ 50
        call    fifo8_status                            ; 08E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08E8 _ 83. C4, 10
        test    eax, eax                                ; 08EB _ 85. C0
        jnz     ?_011                                   ; 08ED _ 75, 07
        call    io_sti                                  ; 08EF _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 08F4 _ EB, E1

?_011:  sub     esp, 12                                 ; 08F6 _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 08F9 _ 8D. 45, C8
        push    eax                                     ; 08FC _ 50
        call    fifo8_get                               ; 08FD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0902 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0905 _ 89. 45, E4
        call    io_sti                                  ; 0908 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 1                      ; 090D _ 83. 7D, E4, 01
        jg      ?_010                                   ; 0911 _ 7F, C4
        cmp     dword [ebp-1CH], 0                      ; 0913 _ 83. 7D, E4, 00
        jz      ?_012                                   ; 0917 _ 74, 1D
        sub     esp, 4                                  ; 0919 _ 83. EC, 04
        push    0                                       ; 091C _ 6A, 00
        lea     eax, [ebp-38H]                          ; 091E _ 8D. 45, C8
        push    eax                                     ; 0921 _ 50
        push    dword [ebp-18H]                         ; 0922 _ FF. 75, E8
        call    timer_init                              ; 0925 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 092A _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 092D _ C7. 45, F4, 00000007
        jmp     ?_013                                   ; 0934 _ EB, 1B

?_012:  sub     esp, 4                                  ; 0936 _ 83. EC, 04
        push    1                                       ; 0939 _ 6A, 01
        lea     eax, [ebp-38H]                          ; 093B _ 8D. 45, C8
        push    eax                                     ; 093E _ 50
        push    dword [ebp-18H]                         ; 093F _ FF. 75, E8
        call    timer_init                              ; 0942 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0947 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 094A _ C7. 45, F4, 00000000
?_013:  sub     esp, 8                                  ; 0951 _ 83. EC, 08
        push    50                                      ; 0954 _ 6A, 32
        push    dword [ebp-18H]                         ; 0956 _ FF. 75, E8
        call    timer_settime                           ; 0959 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095E _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 0961 _ 8B. 45, EC
        lea     ebx, [eax+7H]                           ; 0964 _ 8D. 58, 07
        mov     eax, dword [ebp-0CH]                    ; 0967 _ 8B. 45, F4
        movzx   ecx, al                                 ; 096A _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 096D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 0970 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0973 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0976 _ 8B. 00
        sub     esp, 4                                  ; 0978 _ 83. EC, 04
        push    43                                      ; 097B _ 6A, 2B
        push    ebx                                     ; 097D _ 53
        push    28                                      ; 097E _ 6A, 1C
        push    dword [ebp-14H]                         ; 0980 _ FF. 75, EC
        push    ecx                                     ; 0983 _ 51
        push    edx                                     ; 0984 _ 52
        push    eax                                     ; 0985 _ 50
        call    boxfill8                                ; 0986 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 098B _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 098E _ 8B. 45, EC
        lea     edx, [eax+8H]                           ; 0991 _ 8D. 50, 08
        mov     eax, dword [shtctl]                     ; 0994 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0999 _ 83. EC, 08
        push    44                                      ; 099C _ 6A, 2C
        push    edx                                     ; 099E _ 52
        push    28                                      ; 099F _ 6A, 1C
        push    dword [ebp-14H]                         ; 09A1 _ FF. 75, EC
        push    dword [ebp+8H]                          ; 09A4 _ FF. 75, 08
        push    eax                                     ; 09A7 _ 50
        call    sheet_refresh                           ; 09A8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09AD _ 83. C4, 20
        jmp     ?_010                                   ; 09B0 _ E9, FFFFFF22
; console_task End of function

task_b_main:; Function begin
        push    ebp                                     ; 09B5 _ 55
        mov     ebp, esp                                ; 09B6 _ 89. E5
        sub     esp, 72                                 ; 09B8 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 09BB _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 09C1 _ A1, 00000244(d)
        sub     esp, 8                                  ; 09C6 _ 83. EC, 08
        push    ?_203                                   ; 09C9 _ 68, 00000019(d)
        push    7                                       ; 09CE _ 6A, 07
        push    160                                     ; 09D0 _ 68, 000000A0
        push    0                                       ; 09D5 _ 6A, 00
        push    edx                                     ; 09D7 _ 52
        push    eax                                     ; 09D8 _ 50
        call    showString                              ; 09D9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09DE _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 09E1 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 09E8 _ C7. 45, E8, 00000000
        push    0                                       ; 09EF _ 6A, 00
        lea     eax, [ebp-3CH]                          ; 09F1 _ 8D. 45, C4
        push    eax                                     ; 09F4 _ 50
        push    8                                       ; 09F5 _ 6A, 08
        lea     eax, [ebp-34H]                          ; 09F7 _ 8D. 45, CC
        push    eax                                     ; 09FA _ 50
        call    fifo8_init                              ; 09FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A00 _ 83. C4, 10
        call    timer_alloc                             ; 0A03 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0A08 _ 89. 45, EC
        sub     esp, 4                                  ; 0A0B _ 83. EC, 04
        push    123                                     ; 0A0E _ 6A, 7B
        lea     eax, [ebp-34H]                          ; 0A10 _ 8D. 45, CC
        push    eax                                     ; 0A13 _ 50
        push    dword [ebp-14H]                         ; 0A14 _ FF. 75, EC
        call    timer_init                              ; 0A17 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A1C _ 83. C4, 10
        sub     esp, 8                                  ; 0A1F _ 83. EC, 08
        push    100                                     ; 0A22 _ 6A, 64
        push    dword [ebp-14H]                         ; 0A24 _ FF. 75, EC
        call    timer_settime                           ; 0A27 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A2C _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 0A2F _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0A36 _ C7. 45, F0, 00000000
?_014:  inc     dword [ebp-0CH]                         ; 0A3D _ FF. 45, F4
        call    io_cli                                  ; 0A40 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0A45 _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0A48 _ 8D. 45, CC
        push    eax                                     ; 0A4B _ 50
        call    fifo8_status                            ; 0A4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A51 _ 83. C4, 10
        test    eax, eax                                ; 0A54 _ 85. C0
        jnz     ?_015                                   ; 0A56 _ 75, 07
        call    io_sti                                  ; 0A58 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0A5D _ EB, DE

?_015:  sub     esp, 12                                 ; 0A5F _ 83. EC, 0C
        lea     eax, [ebp-34H]                          ; 0A62 _ 8D. 45, CC
        push    eax                                     ; 0A65 _ 50
        call    fifo8_get                               ; 0A66 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A6B _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 0A6E _ 89. 45, E8
        call    io_sti                                  ; 0A71 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 0A76 _ 83. 7D, E8, 7B
        jnz     ?_014                                   ; 0A7A _ 75, C1
        mov     edx, dword [sht_back]                   ; 0A7C _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0A82 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A87 _ 83. EC, 08
        push    ?_204                                   ; 0A8A _ 68, 00000026(d)
        push    7                                       ; 0A8F _ 6A, 07
        push    192                                     ; 0A91 _ 68, 000000C0
        push    dword [ebp-10H]                         ; 0A96 _ FF. 75, F0
        push    edx                                     ; 0A99 _ 52
        push    eax                                     ; 0A9A _ 50
        call    showString                              ; 0A9B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AA0 _ 83. C4, 20
        sub     esp, 8                                  ; 0AA3 _ 83. EC, 08
        push    100                                     ; 0AA6 _ 6A, 64
        push    dword [ebp-14H]                         ; 0AA8 _ FF. 75, EC
        call    timer_settime                           ; 0AAB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB0 _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0AB3 _ 83. 45, F0, 08
        jmp     ?_014                                   ; 0AB7 _ EB, 84
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0AB9 _ 55
        mov     ebp, esp                                ; 0ABA _ 89. E5
        push    ebx                                     ; 0ABC _ 53
        sub     esp, 4                                  ; 0ABD _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0AC0 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0AC3 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0AC6 _ 8B. 45, 0C
        dec     eax                                     ; 0AC9 _ 48
        sub     esp, 4                                  ; 0ACA _ 83. EC, 04
        push    edx                                     ; 0ACD _ 52
        push    eax                                     ; 0ACE _ 50
        push    0                                       ; 0ACF _ 6A, 00
        push    0                                       ; 0AD1 _ 6A, 00
        push    14                                      ; 0AD3 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0AD5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0AD8 _ FF. 75, 08
        call    boxfill8                                ; 0ADB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AE0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AE3 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0AE6 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0AE9 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AEC _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AEF _ 8B. 45, 10
        sub     eax, 28                                 ; 0AF2 _ 83. E8, 1C
        sub     esp, 4                                  ; 0AF5 _ 83. EC, 04
        push    ecx                                     ; 0AF8 _ 51
        push    edx                                     ; 0AF9 _ 52
        push    eax                                     ; 0AFA _ 50
        push    0                                       ; 0AFB _ 6A, 00
        push    8                                       ; 0AFD _ 6A, 08
        push    dword [ebp+0CH]                         ; 0AFF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B02 _ FF. 75, 08
        call    boxfill8                                ; 0B05 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B0A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B0D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0B10 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0B13 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B16 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B19 _ 8B. 45, 10
        sub     eax, 27                                 ; 0B1C _ 83. E8, 1B
        sub     esp, 4                                  ; 0B1F _ 83. EC, 04
        push    ecx                                     ; 0B22 _ 51
        push    edx                                     ; 0B23 _ 52
        push    eax                                     ; 0B24 _ 50
        push    0                                       ; 0B25 _ 6A, 00
        push    7                                       ; 0B27 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B29 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B2C _ FF. 75, 08
        call    boxfill8                                ; 0B2F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B34 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B37 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B3A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B3D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B40 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B43 _ 8B. 45, 10
        sub     eax, 26                                 ; 0B46 _ 83. E8, 1A
        sub     esp, 4                                  ; 0B49 _ 83. EC, 04
        push    ecx                                     ; 0B4C _ 51
        push    edx                                     ; 0B4D _ 52
        push    eax                                     ; 0B4E _ 50
        push    0                                       ; 0B4F _ 6A, 00
        push    8                                       ; 0B51 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B53 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B56 _ FF. 75, 08
        call    boxfill8                                ; 0B59 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B5E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B61 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B64 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B67 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B6A _ 83. E8, 18
        sub     esp, 4                                  ; 0B6D _ 83. EC, 04
        push    edx                                     ; 0B70 _ 52
        push    59                                      ; 0B71 _ 6A, 3B
        push    eax                                     ; 0B73 _ 50
        push    3                                       ; 0B74 _ 6A, 03
        push    7                                       ; 0B76 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B78 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B7B _ FF. 75, 08
        call    boxfill8                                ; 0B7E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B83 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B86 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B89 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B8C _ 8B. 45, 10
        sub     eax, 24                                 ; 0B8F _ 83. E8, 18
        sub     esp, 4                                  ; 0B92 _ 83. EC, 04
        push    edx                                     ; 0B95 _ 52
        push    2                                       ; 0B96 _ 6A, 02
        push    eax                                     ; 0B98 _ 50
        push    2                                       ; 0B99 _ 6A, 02
        push    7                                       ; 0B9B _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B9D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BA0 _ FF. 75, 08
        call    boxfill8                                ; 0BA3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BA8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BAB _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BAE _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BB1 _ 8B. 45, 10
        sub     eax, 4                                  ; 0BB4 _ 83. E8, 04
        sub     esp, 4                                  ; 0BB7 _ 83. EC, 04
        push    edx                                     ; 0BBA _ 52
        push    59                                      ; 0BBB _ 6A, 3B
        push    eax                                     ; 0BBD _ 50
        push    3                                       ; 0BBE _ 6A, 03
        push    15                                      ; 0BC0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BC2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BC5 _ FF. 75, 08
        call    boxfill8                                ; 0BC8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BCD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BD0 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0BD3 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0BD6 _ 8B. 45, 10
        sub     eax, 23                                 ; 0BD9 _ 83. E8, 17
        sub     esp, 4                                  ; 0BDC _ 83. EC, 04
        push    edx                                     ; 0BDF _ 52
        push    59                                      ; 0BE0 _ 6A, 3B
        push    eax                                     ; 0BE2 _ 50
        push    59                                      ; 0BE3 _ 6A, 3B
        push    15                                      ; 0BE5 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BE7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BEA _ FF. 75, 08
        call    boxfill8                                ; 0BED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BF2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BF5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0BF8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0BFB _ 8B. 45, 10
        sub     eax, 3                                  ; 0BFE _ 83. E8, 03
        sub     esp, 4                                  ; 0C01 _ 83. EC, 04
        push    edx                                     ; 0C04 _ 52
        push    59                                      ; 0C05 _ 6A, 3B
        push    eax                                     ; 0C07 _ 50
        push    2                                       ; 0C08 _ 6A, 02
        push    0                                       ; 0C0A _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C0C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C0F _ FF. 75, 08
        call    boxfill8                                ; 0C12 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C17 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C1A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C1D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C20 _ 8B. 45, 10
        sub     eax, 24                                 ; 0C23 _ 83. E8, 18
        sub     esp, 4                                  ; 0C26 _ 83. EC, 04
        push    edx                                     ; 0C29 _ 52
        push    60                                      ; 0C2A _ 6A, 3C
        push    eax                                     ; 0C2C _ 50
        push    60                                      ; 0C2D _ 6A, 3C
        push    0                                       ; 0C2F _ 6A, 00
        push    dword [ebp+0CH]                         ; 0C31 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C34 _ FF. 75, 08
        call    boxfill8                                ; 0C37 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C3C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C3F _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0C42 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0C45 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C48 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C4B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C4E _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C51 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C54 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C57 _ 83. EC, 04
        push    ebx                                     ; 0C5A _ 53
        push    ecx                                     ; 0C5B _ 51
        push    edx                                     ; 0C5C _ 52
        push    eax                                     ; 0C5D _ 50
        push    15                                      ; 0C5E _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C60 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C63 _ FF. 75, 08
        call    boxfill8                                ; 0C66 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C6B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C6E _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0C71 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0C74 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0C77 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0C7A _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0C7D _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0C80 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C83 _ 83. E8, 2F
        sub     esp, 4                                  ; 0C86 _ 83. EC, 04
        push    ebx                                     ; 0C89 _ 53
        push    ecx                                     ; 0C8A _ 51
        push    edx                                     ; 0C8B _ 52
        push    eax                                     ; 0C8C _ 50
        push    15                                      ; 0C8D _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C8F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C92 _ FF. 75, 08
        call    boxfill8                                ; 0C95 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C9A _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C9D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CA0 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CA3 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0CA6 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0CA9 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0CAC _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0CAF _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CB2 _ 83. E8, 2F
        sub     esp, 4                                  ; 0CB5 _ 83. EC, 04
        push    ebx                                     ; 0CB8 _ 53
        push    ecx                                     ; 0CB9 _ 51
        push    edx                                     ; 0CBA _ 52
        push    eax                                     ; 0CBB _ 50
        push    7                                       ; 0CBC _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CBE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CC1 _ FF. 75, 08
        call    boxfill8                                ; 0CC4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CC9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0CCC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0CCF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0CD2 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0CD5 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0CD8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CDB _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0CDE _ 8B. 45, 0C
        sub     eax, 3                                  ; 0CE1 _ 83. E8, 03
        sub     esp, 4                                  ; 0CE4 _ 83. EC, 04
        push    ebx                                     ; 0CE7 _ 53
        push    ecx                                     ; 0CE8 _ 51
        push    edx                                     ; 0CE9 _ 52
        push    eax                                     ; 0CEA _ 50
        push    7                                       ; 0CEB _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CF0 _ FF. 75, 08
        call    boxfill8                                ; 0CF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CF8 _ 83. C4, 20
        nop                                             ; 0CFB _ 90
        mov     ebx, dword [ebp-4H]                     ; 0CFC _ 8B. 5D, FC
        leave                                           ; 0CFF _ C9
        ret                                             ; 0D00 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0D01 _ 55
        mov     ebp, esp                                ; 0D02 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0D04 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0D07 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0D0A _ A1, 00000114(d)
        add     eax, edx                                ; 0D0F _ 01. D0
        mov     dword [mx], eax                         ; 0D11 _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0D16 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0D19 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0D1C _ A1, 00000118(d)
        add     eax, edx                                ; 0D21 _ 01. D0
        mov     dword [my], eax                         ; 0D23 _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0D28 _ A1, 00000114(d)
        test    eax, eax                                ; 0D2D _ 85. C0
        jns     ?_016                                   ; 0D2F _ 79, 0A
        mov     dword [mx], 0                           ; 0D31 _ C7. 05, 00000114(d), 00000000
?_016:  mov     eax, dword [my]                         ; 0D3B _ A1, 00000118(d)
        test    eax, eax                                ; 0D40 _ 85. C0
        jns     ?_017                                   ; 0D42 _ 79, 0A
        mov     dword [my], 0                           ; 0D44 _ C7. 05, 00000118(d), 00000000
?_017:  mov     edx, dword [xsize]                      ; 0D4E _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0D54 _ A1, 00000114(d)
        cmp     edx, eax                                ; 0D59 _ 39. C2
        jg      ?_018                                   ; 0D5B _ 7F, 0B
        mov     eax, dword [xsize]                      ; 0D5D _ A1, 0000011C(d)
        dec     eax                                     ; 0D62 _ 48
        mov     dword [mx], eax                         ; 0D63 _ A3, 00000114(d)
?_018:  mov     edx, dword [ysize]                      ; 0D68 _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0D6E _ A1, 00000118(d)
        cmp     edx, eax                                ; 0D73 _ 39. C2
        jg      ?_019                                   ; 0D75 _ 7F, 0B
        mov     eax, dword [ysize]                      ; 0D77 _ A1, 00000120(d)
        dec     eax                                     ; 0D7C _ 48
        mov     dword [my], eax                         ; 0D7D _ A3, 00000118(d)
?_019:  nop                                             ; 0D82 _ 90
        pop     ebp                                     ; 0D83 _ 5D
        ret                                             ; 0D84 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D85 _ 55
        mov     ebp, esp                                ; 0D86 _ 89. E5
        sub     esp, 24                                 ; 0D88 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D8B _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 0D90 _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D93 _ C6. 45, F3, 00
        call    io_sti                                  ; 0D97 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0D9C _ 83. EC, 0C
        push    mouseinfo                               ; 0D9F _ 68, 00000024(d)
        call    fifo8_get                               ; 0DA4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DA9 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0DAC _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0DAF _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0DB3 _ 83. EC, 08
        push    eax                                     ; 0DB6 _ 50
        push    mdec                                    ; 0DB7 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0DBC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DC1 _ 83. C4, 10
        test    eax, eax                                ; 0DC4 _ 85. C0
        jz      ?_020                                   ; 0DC6 _ 74, 60
        sub     esp, 4                                  ; 0DC8 _ 83. EC, 04
        push    mdec                                    ; 0DCB _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0DD0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0DD3 _ FF. 75, 08
        call    computeMousePosition                    ; 0DD6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DDB _ 83. C4, 10
        mov     edx, dword [my]                         ; 0DDE _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0DE4 _ A1, 00000114(d)
        push    edx                                     ; 0DE9 _ 52
        push    eax                                     ; 0DEA _ 50
        push    dword [ebp+10H]                         ; 0DEB _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0DEE _ FF. 75, 08
        call    sheet_slide                             ; 0DF1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF6 _ 83. C4, 10
        mov     eax, dword [?_214]                      ; 0DF9 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0DFE _ 83. E0, 01
        test    eax, eax                                ; 0E01 _ 85. C0
        jz      ?_020                                   ; 0E03 _ 74, 23
        mov     eax, dword [my]                         ; 0E05 _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 0E0A _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0E0D _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 0E12 _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0E15 _ A1, 00000240(d)
        push    ecx                                     ; 0E1A _ 51
        push    edx                                     ; 0E1B _ 52
        push    eax                                     ; 0E1C _ 50
        push    dword [ebp+8H]                          ; 0E1D _ FF. 75, 08
        call    sheet_slide                             ; 0E20 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E25 _ 83. C4, 10
?_020:  nop                                             ; 0E28 _ 90
        leave                                           ; 0E29 _ C9
        ret                                             ; 0E2A _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0E2B _ 55
        mov     ebp, esp                                ; 0E2C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0E2E _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0E31 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0E37 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0E3A _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0E40 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0E43 _ 66: C7. 40, 06, 01E0
        nop                                             ; 0E49 _ 90
        pop     ebp                                     ; 0E4A _ 5D
        ret                                             ; 0E4B _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0E4C _ 55
        mov     ebp, esp                                ; 0E4D _ 89. E5
        push    ebx                                     ; 0E4F _ 53
        sub     esp, 36                                 ; 0E50 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0E53 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0E56 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0E59 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0E5C _ 89. 45, F4
        jmp     ?_022                                   ; 0E5F _ EB, 3C

?_021:  mov     eax, dword [ebp+1CH]                    ; 0E61 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E64 _ 8A. 00
        movzx   eax, al                                 ; 0E66 _ 0F B6. C0
        shl     eax, 4                                  ; 0E69 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0E6C _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0E72 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0E76 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0E79 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0E7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E7F _ 8B. 00
        sub     esp, 8                                  ; 0E81 _ 83. EC, 08
        push    ebx                                     ; 0E84 _ 53
        push    ecx                                     ; 0E85 _ 51
        push    dword [ebp+14H]                         ; 0E86 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0E89 _ FF. 75, 10
        push    edx                                     ; 0E8C _ 52
        push    eax                                     ; 0E8D _ 50
        call    showFont8                               ; 0E8E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E93 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0E96 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0E9A _ FF. 45, 1C
?_022:  mov     eax, dword [ebp+1CH]                    ; 0E9D _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0EA0 _ 8A. 00
        test    al, al                                  ; 0EA2 _ 84. C0
        jnz     ?_021                                   ; 0EA4 _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 0EA6 _ 8B. 45, 14
        add     eax, 16                                 ; 0EA9 _ 83. C0, 10
        sub     esp, 8                                  ; 0EAC _ 83. EC, 08
        push    eax                                     ; 0EAF _ 50
        push    dword [ebp+10H]                         ; 0EB0 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0EB3 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0EB6 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0EB9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0EBC _ FF. 75, 08
        call    sheet_refresh                           ; 0EBF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EC4 _ 83. C4, 20
        nop                                             ; 0EC7 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0EC8 _ 8B. 5D, FC
        leave                                           ; 0ECB _ C9
        ret                                             ; 0ECC _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0ECD _ 55
        mov     ebp, esp                                ; 0ECE _ 89. E5
        sub     esp, 8                                  ; 0ED0 _ 83. EC, 08
        sub     esp, 4                                  ; 0ED3 _ 83. EC, 04
        push    table_rgb.1934                          ; 0ED6 _ 68, 00000080(d)
        push    15                                      ; 0EDB _ 6A, 0F
        push    0                                       ; 0EDD _ 6A, 00
        call    set_palette                             ; 0EDF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EE4 _ 83. C4, 10
        nop                                             ; 0EE7 _ 90
        leave                                           ; 0EE8 _ C9
        ret                                             ; 0EE9 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0EEA _ 55
        mov     ebp, esp                                ; 0EEB _ 89. E5
        sub     esp, 24                                 ; 0EED _ 83. EC, 18
        call    io_load_eflags                          ; 0EF0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0EF5 _ 89. 45, F0
        call    io_cli                                  ; 0EF8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0EFD _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0F00 _ FF. 75, 08
        push    968                                     ; 0F03 _ 68, 000003C8
        call    io_out8                                 ; 0F08 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F0D _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0F10 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0F13 _ 89. 45, F4
        jmp     ?_024                                   ; 0F16 _ EB, 5F

?_023:  mov     eax, dword [ebp+10H]                    ; 0F18 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0F1B _ 8A. 00
        shr     al, 2                                   ; 0F1D _ C0. E8, 02
        movzx   eax, al                                 ; 0F20 _ 0F B6. C0
        sub     esp, 8                                  ; 0F23 _ 83. EC, 08
        push    eax                                     ; 0F26 _ 50
        push    969                                     ; 0F27 _ 68, 000003C9
        call    io_out8                                 ; 0F2C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F31 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F34 _ 8B. 45, 10
        inc     eax                                     ; 0F37 _ 40
        mov     al, byte [eax]                          ; 0F38 _ 8A. 00
        shr     al, 2                                   ; 0F3A _ C0. E8, 02
        movzx   eax, al                                 ; 0F3D _ 0F B6. C0
        sub     esp, 8                                  ; 0F40 _ 83. EC, 08
        push    eax                                     ; 0F43 _ 50
        push    969                                     ; 0F44 _ 68, 000003C9
        call    io_out8                                 ; 0F49 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F4E _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F51 _ 8B. 45, 10
        add     eax, 2                                  ; 0F54 _ 83. C0, 02
        mov     al, byte [eax]                          ; 0F57 _ 8A. 00
        shr     al, 2                                   ; 0F59 _ C0. E8, 02
        movzx   eax, al                                 ; 0F5C _ 0F B6. C0
        sub     esp, 8                                  ; 0F5F _ 83. EC, 08
        push    eax                                     ; 0F62 _ 50
        push    969                                     ; 0F63 _ 68, 000003C9
        call    io_out8                                 ; 0F68 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F6D _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0F70 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0F74 _ FF. 45, F4
?_024:  mov     eax, dword [ebp-0CH]                    ; 0F77 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0F7A _ 3B. 45, 0C
        jle     ?_023                                   ; 0F7D _ 7E, 99
        sub     esp, 12                                 ; 0F7F _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0F82 _ FF. 75, F0
        call    io_store_eflags                         ; 0F85 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F8A _ 83. C4, 10
        nop                                             ; 0F8D _ 90
        leave                                           ; 0F8E _ C9
        ret                                             ; 0F8F _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0F90 _ 55
        mov     ebp, esp                                ; 0F91 _ 89. E5
        sub     esp, 20                                 ; 0F93 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0F96 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0F99 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0F9C _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0F9F _ 89. 45, F8
        jmp     ?_028                                   ; 0FA2 _ EB, 30

?_025:  mov     eax, dword [ebp+14H]                    ; 0FA4 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0FA7 _ 89. 45, FC
        jmp     ?_027                                   ; 0FAA _ EB, 1D

?_026:  mov     eax, dword [ebp-8H]                     ; 0FAC _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0FAF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FB3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0FB5 _ 8B. 45, FC
        add     eax, edx                                ; 0FB8 _ 01. D0
        mov     edx, eax                                ; 0FBA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FBC _ 8B. 45, 08
        add     edx, eax                                ; 0FBF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0FC1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0FC4 _ 88. 02
        inc     dword [ebp-4H]                          ; 0FC6 _ FF. 45, FC
?_027:  mov     eax, dword [ebp-4H]                     ; 0FC9 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0FCC _ 3B. 45, 1C
        jle     ?_026                                   ; 0FCF _ 7E, DB
        inc     dword [ebp-8H]                          ; 0FD1 _ FF. 45, F8
?_028:  mov     eax, dword [ebp-8H]                     ; 0FD4 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0FD7 _ 3B. 45, 20
        jle     ?_025                                   ; 0FDA _ 7E, C8
        nop                                             ; 0FDC _ 90
        nop                                             ; 0FDD _ 90
        leave                                           ; 0FDE _ C9
        ret                                             ; 0FDF _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0FE0 _ 55
        mov     ebp, esp                                ; 0FE1 _ 89. E5
        sub     esp, 20                                 ; 0FE3 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0FE6 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0FE9 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FEC _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0FF3 _ E9, 00000162

?_029:  mov     edx, dword [ebp-4H]                     ; 0FF8 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0FFB _ 8B. 45, 1C
        add     eax, edx                                ; 0FFE _ 01. D0
        mov     al, byte [eax]                          ; 1000 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 1002 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 1005 _ 80. 7D, FB, 00
        jns     ?_030                                   ; 1009 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 100B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 100E _ 8B. 45, FC
        add     eax, edx                                ; 1011 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1013 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1017 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1019 _ 8B. 45, 10
        add     eax, edx                                ; 101C _ 01. D0
        mov     edx, eax                                ; 101E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1020 _ 8B. 45, 08
        add     edx, eax                                ; 1023 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1025 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1028 _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 102A _ 0F BE. 45, FB
        and     eax, 40H                                ; 102E _ 83. E0, 40
        test    eax, eax                                ; 1031 _ 85. C0
        jz      ?_031                                   ; 1033 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1035 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1038 _ 8B. 45, FC
        add     eax, edx                                ; 103B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 103D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1041 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1043 _ 8B. 45, 10
        add     eax, edx                                ; 1046 _ 01. D0
        lea     edx, [eax+1H]                           ; 1048 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 104B _ 8B. 45, 08
        add     edx, eax                                ; 104E _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1050 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1053 _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 1055 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1059 _ 83. E0, 20
        test    eax, eax                                ; 105C _ 85. C0
        jz      ?_032                                   ; 105E _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1060 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1063 _ 8B. 45, FC
        add     eax, edx                                ; 1066 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1068 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 106C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 106E _ 8B. 45, 10
        add     eax, edx                                ; 1071 _ 01. D0
        lea     edx, [eax+2H]                           ; 1073 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1076 _ 8B. 45, 08
        add     edx, eax                                ; 1079 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 107B _ 8A. 45, EC
        mov     byte [edx], al                          ; 107E _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 1080 _ 0F BE. 45, FB
        and     eax, 10H                                ; 1084 _ 83. E0, 10
        test    eax, eax                                ; 1087 _ 85. C0
        jz      ?_033                                   ; 1089 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 108B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 108E _ 8B. 45, FC
        add     eax, edx                                ; 1091 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1093 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1097 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1099 _ 8B. 45, 10
        add     eax, edx                                ; 109C _ 01. D0
        lea     edx, [eax+3H]                           ; 109E _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 10A1 _ 8B. 45, 08
        add     edx, eax                                ; 10A4 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10A6 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10A9 _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 10AB _ 0F BE. 45, FB
        and     eax, 08H                                ; 10AF _ 83. E0, 08
        test    eax, eax                                ; 10B2 _ 85. C0
        jz      ?_034                                   ; 10B4 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10B6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10B9 _ 8B. 45, FC
        add     eax, edx                                ; 10BC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10BE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10C2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10C4 _ 8B. 45, 10
        add     eax, edx                                ; 10C7 _ 01. D0
        lea     edx, [eax+4H]                           ; 10C9 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 10CC _ 8B. 45, 08
        add     edx, eax                                ; 10CF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10D1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10D4 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 10D6 _ 0F BE. 45, FB
        and     eax, 04H                                ; 10DA _ 83. E0, 04
        test    eax, eax                                ; 10DD _ 85. C0
        jz      ?_035                                   ; 10DF _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10E1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10E4 _ 8B. 45, FC
        add     eax, edx                                ; 10E7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10E9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10ED _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10EF _ 8B. 45, 10
        add     eax, edx                                ; 10F2 _ 01. D0
        lea     edx, [eax+5H]                           ; 10F4 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10F7 _ 8B. 45, 08
        add     edx, eax                                ; 10FA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10FC _ 8A. 45, EC
        mov     byte [edx], al                          ; 10FF _ 88. 02
?_035:  movsx   eax, byte [ebp-5H]                      ; 1101 _ 0F BE. 45, FB
        and     eax, 02H                                ; 1105 _ 83. E0, 02
        test    eax, eax                                ; 1108 _ 85. C0
        jz      ?_036                                   ; 110A _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 110C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 110F _ 8B. 45, FC
        add     eax, edx                                ; 1112 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1114 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1118 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 111A _ 8B. 45, 10
        add     eax, edx                                ; 111D _ 01. D0
        lea     edx, [eax+6H]                           ; 111F _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1122 _ 8B. 45, 08
        add     edx, eax                                ; 1125 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1127 _ 8A. 45, EC
        mov     byte [edx], al                          ; 112A _ 88. 02
?_036:  movsx   eax, byte [ebp-5H]                      ; 112C _ 0F BE. 45, FB
        and     eax, 01H                                ; 1130 _ 83. E0, 01
        test    eax, eax                                ; 1133 _ 85. C0
        jz      ?_037                                   ; 1135 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1137 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 113A _ 8B. 45, FC
        add     eax, edx                                ; 113D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 113F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1143 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1145 _ 8B. 45, 10
        add     eax, edx                                ; 1148 _ 01. D0
        lea     edx, [eax+7H]                           ; 114A _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 114D _ 8B. 45, 08
        add     edx, eax                                ; 1150 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1152 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1155 _ 88. 02
?_037:  inc     dword [ebp-4H]                          ; 1157 _ FF. 45, FC
?_038:  cmp     dword [ebp-4H], 15                      ; 115A _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 115E _ 0F 8E, FFFFFE94
        nop                                             ; 1164 _ 90
        nop                                             ; 1165 _ 90
        leave                                           ; 1166 _ C9
        ret                                             ; 1167 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1168 _ 55
        mov     ebp, esp                                ; 1169 _ 89. E5
        sub     esp, 20                                 ; 116B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 116E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1171 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1174 _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 117B _ E9, 000000AB

?_039:  mov     dword [ebp-4H], 0                       ; 1180 _ C7. 45, FC, 00000000
        jmp     ?_044                                   ; 1187 _ E9, 00000092

?_040:  mov     eax, dword [ebp-8H]                     ; 118C _ 8B. 45, F8
        shl     eax, 4                                  ; 118F _ C1. E0, 04
        mov     edx, eax                                ; 1192 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1194 _ 8B. 45, FC
        add     eax, edx                                ; 1197 _ 01. D0
        add     eax, cursor.1981                        ; 1199 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 119E _ 8A. 00
        cmp     al, 42                                  ; 11A0 _ 3C, 2A
        jnz     ?_041                                   ; 11A2 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 11A4 _ 8B. 45, F8
        shl     eax, 4                                  ; 11A7 _ C1. E0, 04
        mov     edx, eax                                ; 11AA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11AC _ 8B. 45, FC
        add     eax, edx                                ; 11AF _ 01. D0
        mov     edx, eax                                ; 11B1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11B3 _ 8B. 45, 08
        add     eax, edx                                ; 11B6 _ 01. D0
        mov     byte [eax], 0                           ; 11B8 _ C6. 00, 00
?_041:  mov     eax, dword [ebp-8H]                     ; 11BB _ 8B. 45, F8
        shl     eax, 4                                  ; 11BE _ C1. E0, 04
        mov     edx, eax                                ; 11C1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11C3 _ 8B. 45, FC
        add     eax, edx                                ; 11C6 _ 01. D0
        add     eax, cursor.1981                        ; 11C8 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11CD _ 8A. 00
        cmp     al, 79                                  ; 11CF _ 3C, 4F
        jnz     ?_042                                   ; 11D1 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 11D3 _ 8B. 45, F8
        shl     eax, 4                                  ; 11D6 _ C1. E0, 04
        mov     edx, eax                                ; 11D9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11DB _ 8B. 45, FC
        add     eax, edx                                ; 11DE _ 01. D0
        mov     edx, eax                                ; 11E0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11E2 _ 8B. 45, 08
        add     eax, edx                                ; 11E5 _ 01. D0
        mov     byte [eax], 7                           ; 11E7 _ C6. 00, 07
?_042:  mov     eax, dword [ebp-8H]                     ; 11EA _ 8B. 45, F8
        shl     eax, 4                                  ; 11ED _ C1. E0, 04
        mov     edx, eax                                ; 11F0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11F2 _ 8B. 45, FC
        add     eax, edx                                ; 11F5 _ 01. D0
        add     eax, cursor.1981                        ; 11F7 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11FC _ 8A. 00
        cmp     al, 46                                  ; 11FE _ 3C, 2E
        jnz     ?_043                                   ; 1200 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1202 _ 8B. 45, F8
        shl     eax, 4                                  ; 1205 _ C1. E0, 04
        mov     edx, eax                                ; 1208 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 120A _ 8B. 45, FC
        add     eax, edx                                ; 120D _ 01. D0
        mov     edx, eax                                ; 120F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1211 _ 8B. 45, 08
        add     edx, eax                                ; 1214 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1216 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1219 _ 88. 02
?_043:  inc     dword [ebp-4H]                          ; 121B _ FF. 45, FC
?_044:  cmp     dword [ebp-4H], 15                      ; 121E _ 83. 7D, FC, 0F
        jle     ?_040                                   ; 1222 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 1228 _ FF. 45, F8
?_045:  cmp     dword [ebp-8H], 15                      ; 122B _ 83. 7D, F8, 0F
        jle     ?_039                                   ; 122F _ 0F 8E, FFFFFF4B
        nop                                             ; 1235 _ 90
        nop                                             ; 1236 _ 90
        leave                                           ; 1237 _ C9
        ret                                             ; 1238 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1239 _ 55
        mov     ebp, esp                                ; 123A _ 89. E5
        push    ebx                                     ; 123C _ 53
        sub     esp, 16                                 ; 123D _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1240 _ C7. 45, F4, 00000000
        jmp     ?_049                                   ; 1247 _ EB, 4D

?_046:  mov     dword [ebp-8H], 0                       ; 1249 _ C7. 45, F8, 00000000
        jmp     ?_048                                   ; 1250 _ EB, 39

?_047:  mov     eax, dword [ebp-0CH]                    ; 1252 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1255 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1259 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 125B _ 8B. 45, F8
        add     eax, edx                                ; 125E _ 01. D0
        mov     edx, eax                                ; 1260 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 1262 _ 8B. 45, 20
        add     eax, edx                                ; 1265 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1267 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 126A _ 8B. 55, F4
        add     edx, ecx                                ; 126D _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 126F _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 1273 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1276 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1279 _ 01. D9
        add     edx, ecx                                ; 127B _ 01. CA
        mov     ecx, edx                                ; 127D _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 127F _ 8B. 55, 08
        add     edx, ecx                                ; 1282 _ 01. CA
        mov     al, byte [eax]                          ; 1284 _ 8A. 00
        mov     byte [edx], al                          ; 1286 _ 88. 02
        inc     dword [ebp-8H]                          ; 1288 _ FF. 45, F8
?_048:  mov     eax, dword [ebp-8H]                     ; 128B _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 128E _ 3B. 45, 10
        jl      ?_047                                   ; 1291 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 1293 _ FF. 45, F4
?_049:  mov     eax, dword [ebp-0CH]                    ; 1296 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1299 _ 3B. 45, 14
        jl      ?_046                                   ; 129C _ 7C, AB
        nop                                             ; 129E _ 90
        nop                                             ; 129F _ 90
        add     esp, 16                                 ; 12A0 _ 83. C4, 10
        pop     ebx                                     ; 12A3 _ 5B
        pop     ebp                                     ; 12A4 _ 5D
        ret                                             ; 12A5 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 12A6 _ 55
        mov     ebp, esp                                ; 12A7 _ 89. E5
        sub     esp, 24                                 ; 12A9 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 12AC _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 12B1 _ 89. 45, F4
        mov     eax, dword [?_211]                      ; 12B4 _ A1, 00000004(d)
        cwde                                            ; 12B9 _ 98
        mov     dword [ebp-10H], eax                    ; 12BA _ 89. 45, F0
        mov     ax, word [?_212]                        ; 12BD _ 66: A1, 00000006(d)
        cwde                                            ; 12C3 _ 98
        mov     dword [ebp-14H], eax                    ; 12C4 _ 89. 45, EC
        sub     esp, 8                                  ; 12C7 _ 83. EC, 08
        push    32                                      ; 12CA _ 6A, 20
        push    32                                      ; 12CC _ 6A, 20
        call    io_out8                                 ; 12CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12D3 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 12D6 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 12DA _ 83. EC, 0C
        push    96                                      ; 12DD _ 6A, 60
        call    io_in8                                  ; 12DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12E4 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 12E7 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 12EA _ 0F B6. 45, EB
        sub     esp, 8                                  ; 12EE _ 83. EC, 08
        push    eax                                     ; 12F1 _ 50
        push    keyinfo                                 ; 12F2 _ 68, 00000008(d)
        call    fifo8_put                               ; 12F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12FC _ 83. C4, 10
        nop                                             ; 12FF _ 90
        leave                                           ; 1300 _ C9
        ret                                             ; 1301 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1302 _ 55
        mov     ebp, esp                                ; 1303 _ 89. E5
        sub     esp, 4                                  ; 1305 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1308 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 130B _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 130E _ 80. 7D, FC, 09
        jle     ?_050                                   ; 1312 _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 1314 _ 8A. 45, FC
        add     eax, 55                                 ; 1317 _ 83. C0, 37
        jmp     ?_051                                   ; 131A _ EB, 06

?_050:  mov     al, byte [ebp-4H]                       ; 131C _ 8A. 45, FC
        add     eax, 48                                 ; 131F _ 83. C0, 30
?_051:  leave                                           ; 1322 _ C9
        ret                                             ; 1323 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1324 _ 55
        mov     ebp, esp                                ; 1325 _ 89. E5
        sub     esp, 20                                 ; 1327 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 132A _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 132D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1330 _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1337 _ 8A. 45, EC
        and     eax, 0FH                                ; 133A _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 133D _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1340 _ 0F BE. 45, FB
        push    eax                                     ; 1344 _ 50
        call    charToHexVal                            ; 1345 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 134A _ 83. C4, 04
        mov     byte [?_210], al                        ; 134D _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 1352 _ 8A. 45, EC
        shr     al, 4                                   ; 1355 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1358 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 135B _ 8A. 45, EC
        movsx   eax, al                                 ; 135E _ 0F BE. C0
        push    eax                                     ; 1361 _ 50
        call    charToHexVal                            ; 1362 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1367 _ 83. C4, 04
        mov     byte [?_209], al                        ; 136A _ A2, 00000076(d)
        mov     eax, keyval                             ; 136F _ B8, 00000074(d)
        leave                                           ; 1374 _ C9
        ret                                             ; 1375 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1376 _ 55
        mov     ebp, esp                                ; 1377 _ 89. E5
        sub     esp, 16                                 ; 1379 _ 83. EC, 10
        mov     byte [str.2029], 48                     ; 137C _ C6. 05, 00000354(d), 30
        mov     byte [?_215], 88                        ; 1383 _ C6. 05, 00000355(d), 58
        mov     byte [?_216], 0                         ; 138A _ C6. 05, 0000035E(d), 00
        mov     dword [ebp-4H], 2                       ; 1391 _ C7. 45, FC, 00000002
        jmp     ?_053                                   ; 1398 _ EB, 0E

?_052:  mov     eax, dword [ebp-4H]                     ; 139A _ 8B. 45, FC
        add     eax, str.2029                           ; 139D _ 05, 00000354(d)
        mov     byte [eax], 48                          ; 13A2 _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 13A5 _ FF. 45, FC
?_053:  cmp     dword [ebp-4H], 9                       ; 13A8 _ 83. 7D, FC, 09
        jle     ?_052                                   ; 13AC _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 13AE _ C7. 45, F8, 00000009
        jmp     ?_057                                   ; 13B5 _ EB, 41

?_054:  mov     eax, dword [ebp+8H]                     ; 13B7 _ 8B. 45, 08
        and     eax, 0FH                                ; 13BA _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 13BD _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 13C0 _ 8B. 45, 08
        shr     eax, 4                                  ; 13C3 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 13C6 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 13C9 _ 83. 7D, F4, 09
        jle     ?_055                                   ; 13CD _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 13CF _ 8B. 45, F4
        add     eax, 55                                 ; 13D2 _ 83. C0, 37
        mov     dl, al                                  ; 13D5 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 13D7 _ 8B. 45, F8
        add     eax, str.2029                           ; 13DA _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 13DF _ 88. 10
        jmp     ?_056                                   ; 13E1 _ EB, 12

?_055:  mov     eax, dword [ebp-0CH]                    ; 13E3 _ 8B. 45, F4
        add     eax, 48                                 ; 13E6 _ 83. C0, 30
        mov     dl, al                                  ; 13E9 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 13EB _ 8B. 45, F8
        add     eax, str.2029                           ; 13EE _ 05, 00000354(d)
        mov     byte [eax], dl                          ; 13F3 _ 88. 10
?_056:  dec     dword [ebp-8H]                          ; 13F5 _ FF. 4D, F8
?_057:  cmp     dword [ebp-8H], 1                       ; 13F8 _ 83. 7D, F8, 01
        jle     ?_058                                   ; 13FC _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 13FE _ 83. 7D, 08, 00
        jnz     ?_054                                   ; 1402 _ 75, B3
?_058:  mov     eax, str.2029                           ; 1404 _ B8, 00000354(d)
        leave                                           ; 1409 _ C9
        ret                                             ; 140A _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 140B _ 55
        mov     ebp, esp                                ; 140C _ 89. E5
        sub     esp, 8                                  ; 140E _ 83. EC, 08
?_059:  sub     esp, 12                                 ; 1411 _ 83. EC, 0C
        push    100                                     ; 1414 _ 6A, 64
        call    io_in8                                  ; 1416 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 141B _ 83. C4, 10
        and     eax, 02H                                ; 141E _ 83. E0, 02
        test    eax, eax                                ; 1421 _ 85. C0
        jz      ?_060                                   ; 1423 _ 74, 02
        jmp     ?_059                                   ; 1425 _ EB, EA

?_060:  nop                                             ; 1427 _ 90
        nop                                             ; 1428 _ 90
        leave                                           ; 1429 _ C9
        ret                                             ; 142A _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 142B _ 55
        mov     ebp, esp                                ; 142C _ 89. E5
        sub     esp, 8                                  ; 142E _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1431 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1436 _ 83. EC, 08
        push    96                                      ; 1439 _ 6A, 60
        push    100                                     ; 143B _ 6A, 64
        call    io_out8                                 ; 143D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1442 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1445 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 144A _ 83. EC, 08
        push    71                                      ; 144D _ 6A, 47
        push    96                                      ; 144F _ 6A, 60
        call    io_out8                                 ; 1451 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1456 _ 83. C4, 10
        nop                                             ; 1459 _ 90
        leave                                           ; 145A _ C9
        ret                                             ; 145B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 145C _ 55
        mov     ebp, esp                                ; 145D _ 89. E5
        sub     esp, 8                                  ; 145F _ 83. EC, 08
        call    wait_KBC_sendready                      ; 1462 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1467 _ 83. EC, 08
        push    212                                     ; 146A _ 68, 000000D4
        push    100                                     ; 146F _ 6A, 64
        call    io_out8                                 ; 1471 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1476 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1479 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 147E _ 83. EC, 08
        push    244                                     ; 1481 _ 68, 000000F4
        push    96                                      ; 1486 _ 6A, 60
        call    io_out8                                 ; 1488 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 148D _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1490 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 1493 _ C6. 40, 03, 00
        nop                                             ; 1497 _ 90
        leave                                           ; 1498 _ C9
        ret                                             ; 1499 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 149A _ 55
        mov     ebp, esp                                ; 149B _ 89. E5
        sub     esp, 24                                 ; 149D _ 83. EC, 18
        sub     esp, 8                                  ; 14A0 _ 83. EC, 08
        push    32                                      ; 14A3 _ 6A, 20
        push    160                                     ; 14A5 _ 68, 000000A0
        call    io_out8                                 ; 14AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14AF _ 83. C4, 10
        sub     esp, 8                                  ; 14B2 _ 83. EC, 08
        push    32                                      ; 14B5 _ 6A, 20
        push    32                                      ; 14B7 _ 6A, 20
        call    io_out8                                 ; 14B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14BE _ 83. C4, 10
        sub     esp, 12                                 ; 14C1 _ 83. EC, 0C
        push    96                                      ; 14C4 _ 6A, 60
        call    io_in8                                  ; 14C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14CB _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 14CE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 14D1 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 14D5 _ 83. EC, 08
        push    eax                                     ; 14D8 _ 50
        push    mouseinfo                               ; 14D9 _ 68, 00000024(d)
        call    fifo8_put                               ; 14DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14E3 _ 83. C4, 10
        nop                                             ; 14E6 _ 90
        leave                                           ; 14E7 _ C9
        ret                                             ; 14E8 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 14E9 _ 55
        mov     ebp, esp                                ; 14EA _ 89. E5
        sub     esp, 4                                  ; 14EC _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 14EF _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 14F2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14F5 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 14F8 _ 8A. 40, 03
        test    al, al                                  ; 14FB _ 84. C0
        jnz     ?_062                                   ; 14FD _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 14FF _ 80. 7D, FC, FA
        jnz     ?_061                                   ; 1503 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1505 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1508 _ C6. 40, 03, 01
?_061:  mov     eax, 0                                  ; 150C _ B8, 00000000
        jmp     ?_069                                   ; 1511 _ E9, 00000104

?_062:  mov     eax, dword [ebp+8H]                     ; 1516 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1519 _ 8A. 40, 03
        cmp     al, 1                                   ; 151C _ 3C, 01
        jnz     ?_064                                   ; 151E _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 1520 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1524 _ 25, 000000C8
        cmp     eax, 8                                  ; 1529 _ 83. F8, 08
        jnz     ?_063                                   ; 152C _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 152E _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1531 _ 8A. 55, FC
        mov     byte [eax], dl                          ; 1534 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1536 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1539 _ C6. 40, 03, 02
?_063:  mov     eax, 0                                  ; 153D _ B8, 00000000
        jmp     ?_069                                   ; 1542 _ E9, 000000D3

?_064:  mov     eax, dword [ebp+8H]                     ; 1547 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 154A _ 8A. 40, 03
        cmp     al, 2                                   ; 154D _ 3C, 02
        jnz     ?_065                                   ; 154F _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 1551 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1554 _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1557 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 155A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 155D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1561 _ B8, 00000000
        jmp     ?_069                                   ; 1566 _ E9, 000000AF

?_065:  mov     eax, dword [ebp+8H]                     ; 156B _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 156E _ 8A. 40, 03
        cmp     al, 3                                   ; 1571 _ 3C, 03
        jne     ?_068                                   ; 1573 _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 1579 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 157C _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 157F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1582 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1585 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1589 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 158C _ 8A. 00
        movzx   eax, al                                 ; 158E _ 0F B6. C0
        and     eax, 07H                                ; 1591 _ 83. E0, 07
        mov     edx, eax                                ; 1594 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1596 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1599 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 159C _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 159F _ 8A. 40, 01
        movzx   edx, al                                 ; 15A2 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15A5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15A8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15AB _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 15AE _ 8A. 40, 02
        movzx   edx, al                                 ; 15B1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 15B4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15B7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 15BA _ 8B. 45, 08
        mov     al, byte [eax]                          ; 15BD _ 8A. 00
        movzx   eax, al                                 ; 15BF _ 0F B6. C0
        and     eax, 10H                                ; 15C2 _ 83. E0, 10
        test    eax, eax                                ; 15C5 _ 85. C0
        jz      ?_066                                   ; 15C7 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15C9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 15CC _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 15CF _ 0D, FFFFFF00
        mov     edx, eax                                ; 15D4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15D6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15D9 _ 89. 50, 04
?_066:  mov     eax, dword [ebp+8H]                     ; 15DC _ 8B. 45, 08
        mov     al, byte [eax]                          ; 15DF _ 8A. 00
        movzx   eax, al                                 ; 15E1 _ 0F B6. C0
        and     eax, 20H                                ; 15E4 _ 83. E0, 20
        test    eax, eax                                ; 15E7 _ 85. C0
        jz      ?_067                                   ; 15E9 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15EB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15EE _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 15F1 _ 0D, FFFFFF00
        mov     edx, eax                                ; 15F6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15F8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15FB _ 89. 50, 08
?_067:  mov     eax, dword [ebp+8H]                     ; 15FE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1601 _ 8B. 40, 08
        neg     eax                                     ; 1604 _ F7. D8
        mov     edx, eax                                ; 1606 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1608 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 160B _ 89. 50, 08
        mov     eax, 1                                  ; 160E _ B8, 00000001
        jmp     ?_069                                   ; 1613 _ EB, 05

?_068:  mov     eax, 4294967295                         ; 1615 _ B8, FFFFFFFF
?_069:  leave                                           ; 161A _ C9
        ret                                             ; 161B _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 161C _ 55
        mov     ebp, esp                                ; 161D _ 89. E5
        sub     esp, 40                                 ; 161F _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 1622 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1629 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1630 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1637 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 163E _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 1644 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1647 _ 8B. 00
        sub     esp, 4                                  ; 1649 _ 83. EC, 04
        push    edx                                     ; 164C _ 52
        push    dword [ebp+1CH]                         ; 164D _ FF. 75, 1C
        push    eax                                     ; 1650 _ 50
        call    init_screen8                            ; 1651 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1656 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1659 _ 8B. 45, 20
        movsx   eax, al                                 ; 165C _ 0F BE. C0
        sub     esp, 8                                  ; 165F _ 83. EC, 08
        push    ?_205                                   ; 1662 _ 68, 00000028(d)
        push    eax                                     ; 1667 _ 50
        push    dword [ebp-10H]                         ; 1668 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 166B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 166E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1671 _ FF. 75, 08
        call    showString                              ; 1674 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1679 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 167C _ 8B. 45, 18
        sub     esp, 12                                 ; 167F _ 83. EC, 0C
        push    eax                                     ; 1682 _ 50
        call    intToHexStr                             ; 1683 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1688 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 168B _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 168E _ 8B. 45, 20
        movsx   eax, al                                 ; 1691 _ 0F BE. C0
        sub     esp, 8                                  ; 1694 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1697 _ FF. 75, E4
        push    eax                                     ; 169A _ 50
        push    dword [ebp-10H]                         ; 169B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 169E _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 16A1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16A4 _ FF. 75, 08
        call    showString                              ; 16A7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16AC _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 16AF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 16B3 _ 8B. 45, 20
        movsx   eax, al                                 ; 16B6 _ 0F BE. C0
        sub     esp, 8                                  ; 16B9 _ 83. EC, 08
        push    ?_206                                   ; 16BC _ 68, 00000032(d)
        push    eax                                     ; 16C1 _ 50
        push    dword [ebp-10H]                         ; 16C2 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 16C5 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 16C8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16CB _ FF. 75, 08
        call    showString                              ; 16CE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16D3 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 16D6 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 16D9 _ 8B. 00
        sub     esp, 12                                 ; 16DB _ 83. EC, 0C
        push    eax                                     ; 16DE _ 50
        call    intToHexStr                             ; 16DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16E4 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 16E7 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 16EA _ 8B. 45, 20
        movsx   eax, al                                 ; 16ED _ 0F BE. C0
        sub     esp, 8                                  ; 16F0 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 16F3 _ FF. 75, E0
        push    eax                                     ; 16F6 _ 50
        push    dword [ebp-10H]                         ; 16F7 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 16FA _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 16FD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1700 _ FF. 75, 08
        call    showString                              ; 1703 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1708 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 170B _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 170F _ 8B. 45, 20
        movsx   eax, al                                 ; 1712 _ 0F BE. C0
        sub     esp, 8                                  ; 1715 _ 83. EC, 08
        push    ?_207                                   ; 1718 _ 68, 0000003E(d)
        push    eax                                     ; 171D _ 50
        push    dword [ebp-10H]                         ; 171E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1721 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1724 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1727 _ FF. 75, 08
        call    showString                              ; 172A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 172F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 1732 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1735 _ 8B. 40, 04
        sub     esp, 12                                 ; 1738 _ 83. EC, 0C
        push    eax                                     ; 173B _ 50
        call    intToHexStr                             ; 173C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1741 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 1744 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1747 _ 8B. 45, 20
        movsx   eax, al                                 ; 174A _ 0F BE. C0
        sub     esp, 8                                  ; 174D _ 83. EC, 08
        push    dword [ebp-24H]                         ; 1750 _ FF. 75, DC
        push    eax                                     ; 1753 _ 50
        push    dword [ebp-10H]                         ; 1754 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1757 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 175A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 175D _ FF. 75, 08
        call    showString                              ; 1760 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1765 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1768 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 176C _ 8B. 45, 20
        movsx   eax, al                                 ; 176F _ 0F BE. C0
        sub     esp, 8                                  ; 1772 _ 83. EC, 08
        push    ?_208                                   ; 1775 _ 68, 0000004A(d)
        push    eax                                     ; 177A _ 50
        push    dword [ebp-10H]                         ; 177B _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 177E _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1781 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1784 _ FF. 75, 08
        call    showString                              ; 1787 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 178C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 178F _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1792 _ 8B. 40, 08
        sub     esp, 12                                 ; 1795 _ 83. EC, 0C
        push    eax                                     ; 1798 _ 50
        call    intToHexStr                             ; 1799 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 179E _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 17A1 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 17A4 _ 8B. 45, 20
        movsx   eax, al                                 ; 17A7 _ 0F BE. C0
        sub     esp, 8                                  ; 17AA _ 83. EC, 08
        push    dword [ebp-28H]                         ; 17AD _ FF. 75, D8
        push    eax                                     ; 17B0 _ 50
        push    dword [ebp-10H]                         ; 17B1 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 17B4 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 17B7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 17BA _ FF. 75, 08
        call    showString                              ; 17BD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17C2 _ 83. C4, 20
        nop                                             ; 17C5 _ 90
        leave                                           ; 17C6 _ C9
        ret                                             ; 17C7 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 17C8 _ 55
        mov     ebp, esp                                ; 17C9 _ 89. E5
        sub     esp, 24                                 ; 17CB _ 83. EC, 18
        sub     esp, 12                                 ; 17CE _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 17D1 _ FF. 75, 08
        call    sheet_alloc                             ; 17D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D9 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 17DC _ 89. 45, F4
        mov     eax, dword [memman]                     ; 17DF _ A1, 00000000(d)
        sub     esp, 8                                  ; 17E4 _ 83. EC, 08
        push    10880                                   ; 17E7 _ 68, 00002A80
        push    eax                                     ; 17EC _ 50
        call    memman_alloc_4k                         ; 17ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17F2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 17F5 _ 89. 45, F0
        sub     esp, 12                                 ; 17F8 _ 83. EC, 0C
        push    -1                                      ; 17FB _ 6A, FF
        push    68                                      ; 17FD _ 6A, 44
        push    160                                     ; 17FF _ 68, 000000A0
        push    dword [ebp-10H]                         ; 1804 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1807 _ FF. 75, F4
        call    sheet_setbuf                            ; 180A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 180F _ 83. C4, 20
        sub     esp, 4                                  ; 1812 _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 1815 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 1818 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 181B _ FF. 75, 08
        call    make_window8                            ; 181E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1823 _ 83. C4, 10
        sub     esp, 8                                  ; 1826 _ 83. EC, 08
        push    7                                       ; 1829 _ 6A, 07
        push    16                                      ; 182B _ 6A, 10
        push    144                                     ; 182D _ 68, 00000090
        push    28                                      ; 1832 _ 6A, 1C
        push    8                                       ; 1834 _ 6A, 08
        push    dword [ebp-0CH]                         ; 1836 _ FF. 75, F4
        call    make_textbox8                           ; 1839 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 183E _ 83. C4, 20
        push    172                                     ; 1841 _ 68, 000000AC
        push    260                                     ; 1846 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 184B _ FF. 75, F4
        push    dword [ebp+8H]                          ; 184E _ FF. 75, 08
        call    sheet_slide                             ; 1851 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1856 _ 83. C4, 10
        sub     esp, 4                                  ; 1859 _ 83. EC, 04
        push    2                                       ; 185C _ 6A, 02
        push    dword [ebp-0CH]                         ; 185E _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1861 _ FF. 75, 08
        call    sheet_updown                            ; 1864 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1869 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 186C _ 8B. 45, F4
        leave                                           ; 186F _ C9
        ret                                             ; 1870 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 1871 _ 55
        mov     ebp, esp                                ; 1872 _ 89. E5
        push    ebx                                     ; 1874 _ 53
        sub     esp, 36                                 ; 1875 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1878 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 187B _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 187E _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1881 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1884 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1887 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 188A _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 188D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1890 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1893 _ 8B. 00
        push    0                                       ; 1895 _ 6A, 00
        push    edx                                     ; 1897 _ 52
        push    0                                       ; 1898 _ 6A, 00
        push    0                                       ; 189A _ 6A, 00
        push    8                                       ; 189C _ 6A, 08
        push    dword [ebp-18H]                         ; 189E _ FF. 75, E8
        push    eax                                     ; 18A1 _ 50
        call    boxfill8                                ; 18A2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18A7 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 18AA _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 18AD _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 18B0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18B3 _ 8B. 00
        push    1                                       ; 18B5 _ 6A, 01
        push    edx                                     ; 18B7 _ 52
        push    1                                       ; 18B8 _ 6A, 01
        push    1                                       ; 18BA _ 6A, 01
        push    7                                       ; 18BC _ 6A, 07
        push    dword [ebp-18H]                         ; 18BE _ FF. 75, E8
        push    eax                                     ; 18C1 _ 50
        call    boxfill8                                ; 18C2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18C7 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18CA _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 18CD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18D0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18D3 _ 8B. 00
        push    edx                                     ; 18D5 _ 52
        push    0                                       ; 18D6 _ 6A, 00
        push    0                                       ; 18D8 _ 6A, 00
        push    0                                       ; 18DA _ 6A, 00
        push    8                                       ; 18DC _ 6A, 08
        push    dword [ebp-18H]                         ; 18DE _ FF. 75, E8
        push    eax                                     ; 18E1 _ 50
        call    boxfill8                                ; 18E2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18E7 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18EA _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 18ED _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18F0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18F3 _ 8B. 00
        push    edx                                     ; 18F5 _ 52
        push    1                                       ; 18F6 _ 6A, 01
        push    1                                       ; 18F8 _ 6A, 01
        push    1                                       ; 18FA _ 6A, 01
        push    7                                       ; 18FC _ 6A, 07
        push    dword [ebp-18H]                         ; 18FE _ FF. 75, E8
        push    eax                                     ; 1901 _ 50
        call    boxfill8                                ; 1902 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1907 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 190A _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 190D _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1910 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1913 _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 1916 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1919 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 191C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 191F _ 8B. 00
        push    ebx                                     ; 1921 _ 53
        push    ecx                                     ; 1922 _ 51
        push    1                                       ; 1923 _ 6A, 01
        push    edx                                     ; 1925 _ 52
        push    15                                      ; 1926 _ 6A, 0F
        push    dword [ebp-18H]                         ; 1928 _ FF. 75, E8
        push    eax                                     ; 192B _ 50
        call    boxfill8                                ; 192C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1931 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1934 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1937 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 193A _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 193D _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 1940 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1943 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1946 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1949 _ 8B. 00
        push    ebx                                     ; 194B _ 53
        push    ecx                                     ; 194C _ 51
        push    0                                       ; 194D _ 6A, 00
        push    edx                                     ; 194F _ 52
        push    0                                       ; 1950 _ 6A, 00
        push    dword [ebp-18H]                         ; 1952 _ FF. 75, E8
        push    eax                                     ; 1955 _ 50
        call    boxfill8                                ; 1956 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 195B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 195E _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 1961 _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 1964 _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1967 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 196A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 196D _ 8B. 00
        push    ecx                                     ; 196F _ 51
        push    edx                                     ; 1970 _ 52
        push    2                                       ; 1971 _ 6A, 02
        push    2                                       ; 1973 _ 6A, 02
        push    8                                       ; 1975 _ 6A, 08
        push    dword [ebp-18H]                         ; 1977 _ FF. 75, E8
        push    eax                                     ; 197A _ 50
        call    boxfill8                                ; 197B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1980 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1983 _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1986 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1989 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 198C _ 8B. 00
        push    20                                      ; 198E _ 6A, 14
        push    edx                                     ; 1990 _ 52
        push    3                                       ; 1991 _ 6A, 03
        push    3                                       ; 1993 _ 6A, 03
        push    12                                      ; 1995 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1997 _ FF. 75, E8
        push    eax                                     ; 199A _ 50
        call    boxfill8                                ; 199B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19A0 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 19A3 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 19A6 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 19A9 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 19AC _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 19AF _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 19B2 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19B5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19B8 _ 8B. 00
        push    ebx                                     ; 19BA _ 53
        push    ecx                                     ; 19BB _ 51
        push    edx                                     ; 19BC _ 52
        push    1                                       ; 19BD _ 6A, 01
        push    15                                      ; 19BF _ 6A, 0F
        push    dword [ebp-18H]                         ; 19C1 _ FF. 75, E8
        push    eax                                     ; 19C4 _ 50
        call    boxfill8                                ; 19C5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19CA _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 19CD _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 19D0 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 19D3 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 19D6 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 19D9 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 19DC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19DF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19E2 _ 8B. 00
        push    ebx                                     ; 19E4 _ 53
        push    ecx                                     ; 19E5 _ 51
        push    edx                                     ; 19E6 _ 52
        push    0                                       ; 19E7 _ 6A, 00
        push    0                                       ; 19E9 _ 6A, 00
        push    dword [ebp-18H]                         ; 19EB _ FF. 75, E8
        push    eax                                     ; 19EE _ 50
        call    boxfill8                                ; 19EF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19F4 _ 83. C4, 1C
        sub     esp, 8                                  ; 19F7 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 19FA _ FF. 75, 10
        push    7                                       ; 19FD _ 6A, 07
        push    4                                       ; 19FF _ 6A, 04
        push    24                                      ; 1A01 _ 6A, 18
        push    dword [ebp+0CH]                         ; 1A03 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1A06 _ FF. 75, 08
        call    showString                              ; 1A09 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A0E _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 1A11 _ C7. 45, F0, 00000000
        jmp     ?_077                                   ; 1A18 _ EB, 7F

?_070:  mov     dword [ebp-0CH], 0                      ; 1A1A _ C7. 45, F4, 00000000
        jmp     ?_076                                   ; 1A21 _ EB, 6D

?_071:  mov     eax, dword [ebp-10H]                    ; 1A23 _ 8B. 45, F0
        shl     eax, 4                                  ; 1A26 _ C1. E0, 04
        mov     edx, eax                                ; 1A29 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1A2B _ 8B. 45, F4
        add     eax, edx                                ; 1A2E _ 01. D0
        add     eax, closebtn.2091                      ; 1A30 _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1A35 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1A37 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1A3A _ 80. 7D, EF, 40
        jnz     ?_072                                   ; 1A3E _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1A40 _ C6. 45, EF, 00
        jmp     ?_075                                   ; 1A44 _ EB, 1C

?_072:  cmp     byte [ebp-11H], 36                      ; 1A46 _ 80. 7D, EF, 24
        jnz     ?_073                                   ; 1A4A _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1A4C _ C6. 45, EF, 0F
        jmp     ?_075                                   ; 1A50 _ EB, 10

?_073:  cmp     byte [ebp-11H], 81                      ; 1A52 _ 80. 7D, EF, 51
        jnz     ?_074                                   ; 1A56 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1A58 _ C6. 45, EF, 08
        jmp     ?_075                                   ; 1A5C _ EB, 04

?_074:  mov     byte [ebp-11H], 7                       ; 1A5E _ C6. 45, EF, 07
?_075:  mov     eax, dword [ebp+0CH]                    ; 1A62 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1A65 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1A67 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1A6A _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1A6D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A70 _ 8B. 40, 04
        imul    ecx, eax                                ; 1A73 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1A76 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A79 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1A7C _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1A7F _ 8B. 45, F4
        add     eax, ebx                                ; 1A82 _ 01. D8
        add     eax, ecx                                ; 1A84 _ 01. C8
        add     edx, eax                                ; 1A86 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1A88 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1A8B _ 88. 02
        inc     dword [ebp-0CH]                         ; 1A8D _ FF. 45, F4
?_076:  cmp     dword [ebp-0CH], 15                     ; 1A90 _ 83. 7D, F4, 0F
        jle     ?_071                                   ; 1A94 _ 7E, 8D
        inc     dword [ebp-10H]                         ; 1A96 _ FF. 45, F0
?_077:  cmp     dword [ebp-10H], 13                     ; 1A99 _ 83. 7D, F0, 0D
        jle     ?_070                                   ; 1A9D _ 0F 8E, FFFFFF77
        nop                                             ; 1AA3 _ 90
        mov     ebx, dword [ebp-4H]                     ; 1AA4 _ 8B. 5D, FC
        leave                                           ; 1AA7 _ C9
        ret                                             ; 1AA8 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1AA9 _ 55
        mov     ebp, esp                                ; 1AAA _ 89. E5
        push    edi                                     ; 1AAC _ 57
        push    esi                                     ; 1AAD _ 56
        push    ebx                                     ; 1AAE _ 53
        sub     esp, 16                                 ; 1AAF _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1AB2 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1AB5 _ 8B. 45, 14
        add     eax, edx                                ; 1AB8 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1ABA _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1ABD _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1AC0 _ 8B. 45, 18
        add     eax, edx                                ; 1AC3 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1AC5 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1AC8 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1ACB _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1ACE _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1AD1 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1AD4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AD7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1ADA _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1ADD _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1AE0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AE3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AE6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE9 _ 8B. 00
        push    edi                                     ; 1AEB _ 57
        push    esi                                     ; 1AEC _ 56
        push    ebx                                     ; 1AED _ 53
        push    ecx                                     ; 1AEE _ 51
        push    15                                      ; 1AEF _ 6A, 0F
        push    edx                                     ; 1AF1 _ 52
        push    eax                                     ; 1AF2 _ 50
        call    boxfill8                                ; 1AF3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AF8 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1AFB _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1AFE _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1B01 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1B04 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1B07 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B0A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1B0D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B10 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B13 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B16 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B19 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B1C _ 8B. 00
        push    edi                                     ; 1B1E _ 57
        push    esi                                     ; 1B1F _ 56
        push    ebx                                     ; 1B20 _ 53
        push    ecx                                     ; 1B21 _ 51
        push    15                                      ; 1B22 _ 6A, 0F
        push    edx                                     ; 1B24 _ 52
        push    eax                                     ; 1B25 _ 50
        call    boxfill8                                ; 1B26 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B2B _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1B2E _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1B31 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1B34 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1B37 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1B3A _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1B3D _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1B40 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B43 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B46 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B49 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B4C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B4F _ 8B. 00
        push    edi                                     ; 1B51 _ 57
        push    esi                                     ; 1B52 _ 56
        push    ebx                                     ; 1B53 _ 53
        push    ecx                                     ; 1B54 _ 51
        push    7                                       ; 1B55 _ 6A, 07
        push    edx                                     ; 1B57 _ 52
        push    eax                                     ; 1B58 _ 50
        call    boxfill8                                ; 1B59 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B5E _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1B61 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1B64 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1B67 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1B6A _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1B6D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B70 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1B73 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1B76 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1B79 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B7C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B7F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B82 _ 8B. 00
        push    edi                                     ; 1B84 _ 57
        push    esi                                     ; 1B85 _ 56
        push    ebx                                     ; 1B86 _ 53
        push    ecx                                     ; 1B87 _ 51
        push    7                                       ; 1B88 _ 6A, 07
        push    edx                                     ; 1B8A _ 52
        push    eax                                     ; 1B8B _ 50
        call    boxfill8                                ; 1B8C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B91 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1B94 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B97 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1B9A _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1B9D _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1BA0 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1BA3 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1BA6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BA9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BAC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BAF _ 8B. 00
        push    esi                                     ; 1BB1 _ 56
        push    dword [ebp-10H]                         ; 1BB2 _ FF. 75, F0
        push    ebx                                     ; 1BB5 _ 53
        push    ecx                                     ; 1BB6 _ 51
        push    0                                       ; 1BB7 _ 6A, 00
        push    edx                                     ; 1BB9 _ 52
        push    eax                                     ; 1BBA _ 50
        call    boxfill8                                ; 1BBB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BC0 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1BC3 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1BC6 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1BC9 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BCC _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1BCF _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1BD2 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1BD5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BD8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BDB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BDE _ 8B. 00
        push    dword [ebp-14H]                         ; 1BE0 _ FF. 75, EC
        push    esi                                     ; 1BE3 _ 56
        push    ebx                                     ; 1BE4 _ 53
        push    ecx                                     ; 1BE5 _ 51
        push    0                                       ; 1BE6 _ 6A, 00
        push    edx                                     ; 1BE8 _ 52
        push    eax                                     ; 1BE9 _ 50
        call    boxfill8                                ; 1BEA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BEF _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BF2 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1BF5 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1BF8 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1BFB _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1BFE _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1C01 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1C04 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C07 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C0A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C0D _ 8B. 00
        push    esi                                     ; 1C0F _ 56
        push    dword [ebp-10H]                         ; 1C10 _ FF. 75, F0
        push    ebx                                     ; 1C13 _ 53
        push    ecx                                     ; 1C14 _ 51
        push    8                                       ; 1C15 _ 6A, 08
        push    edx                                     ; 1C17 _ 52
        push    eax                                     ; 1C18 _ 50
        call    boxfill8                                ; 1C19 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C1E _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1C21 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1C24 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1C27 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1C2A _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1C2D _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1C30 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C33 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C36 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C39 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C3C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C3F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C42 _ 8B. 00
        push    edi                                     ; 1C44 _ 57
        push    esi                                     ; 1C45 _ 56
        push    ebx                                     ; 1C46 _ 53
        push    ecx                                     ; 1C47 _ 51
        push    8                                       ; 1C48 _ 6A, 08
        push    edx                                     ; 1C4A _ 52
        push    eax                                     ; 1C4B _ 50
        call    boxfill8                                ; 1C4C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C51 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1C54 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1C57 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1C5A _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1C5D _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1C60 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1C63 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1C66 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C69 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C6C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C6F _ 8B. 00
        push    dword [ebp-14H]                         ; 1C71 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1C74 _ FF. 75, F0
        push    esi                                     ; 1C77 _ 56
        push    ebx                                     ; 1C78 _ 53
        push    ecx                                     ; 1C79 _ 51
        push    edx                                     ; 1C7A _ 52
        push    eax                                     ; 1C7B _ 50
        call    boxfill8                                ; 1C7C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C81 _ 83. C4, 1C
        nop                                             ; 1C84 _ 90
        lea     esp, [ebp-0CH]                          ; 1C85 _ 8D. 65, F4
        pop     ebx                                     ; 1C88 _ 5B
        pop     esi                                     ; 1C89 _ 5E
        pop     edi                                     ; 1C8A _ 5F
        pop     ebp                                     ; 1C8B _ 5D
        ret                                             ; 1C8C _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1C8D _ 55
        mov     ebp, esp                                ; 1C8E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1C90 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1C93 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C99 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1C9C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CA3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1CA6 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CAD _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1CB0 _ C7. 40, 0C, 00000000
        nop                                             ; 1CB7 _ 90
        pop     ebp                                     ; 1CB8 _ 5D
        ret                                             ; 1CB9 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1CBA _ 55
        mov     ebp, esp                                ; 1CBB _ 89. E5
        sub     esp, 16                                 ; 1CBD _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1CC0 _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1CC7 _ C7. 45, FC, 00000000
        jmp     ?_079                                   ; 1CCE _ EB, 13

?_078:  mov     eax, dword [ebp+8H]                     ; 1CD0 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CD3 _ 8B. 55, FC
        add     edx, 2                                  ; 1CD6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CD9 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1CDD _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1CE0 _ FF. 45, FC
?_079:  mov     eax, dword [ebp+8H]                     ; 1CE3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CE6 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1CE8 _ 39. 45, FC
        jc      ?_078                                   ; 1CEB _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1CED _ 8B. 45, F8
        leave                                           ; 1CF0 _ C9
        ret                                             ; 1CF1 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1CF2 _ 55
        mov     ebp, esp                                ; 1CF3 _ 89. E5
        sub     esp, 16                                 ; 1CF5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CF8 _ C7. 45, FC, 00000000
        jmp     ?_083                                   ; 1CFF _ E9, 00000084

?_080:  mov     eax, dword [ebp+8H]                     ; 1D04 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D07 _ 8B. 55, FC
        add     edx, 2                                  ; 1D0A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D0D _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1D11 _ 39. 45, 0C
        ja      ?_082                                   ; 1D14 _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1D16 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D19 _ 8B. 55, FC
        add     edx, 2                                  ; 1D1C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D1F _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1D22 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1D25 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D28 _ 8B. 55, FC
        add     edx, 2                                  ; 1D2B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1D2E _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1D31 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1D34 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D37 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D3A _ 8B. 55, FC
        add     edx, 2                                  ; 1D3D _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1D40 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D43 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D46 _ 8B. 55, FC
        add     edx, 2                                  ; 1D49 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D4C _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D50 _ 2B. 45, 0C
        mov     edx, eax                                ; 1D53 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D55 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1D58 _ 8B. 4D, FC
        add     ecx, 2                                  ; 1D5B _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D5E _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D62 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D65 _ 8B. 55, FC
        add     edx, 2                                  ; 1D68 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D6B _ 8B. 44 D0, 04
        test    eax, eax                                ; 1D6F _ 85. C0
        jnz     ?_081                                   ; 1D71 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1D73 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D76 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D78 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D7B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D7E _ 89. 10
?_081:  mov     eax, dword [ebp-8H]                     ; 1D80 _ 8B. 45, F8
        jmp     ?_084                                   ; 1D83 _ EB, 16

?_082:  inc     dword [ebp-4H]                          ; 1D85 _ FF. 45, FC
?_083:  mov     eax, dword [ebp+8H]                     ; 1D88 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D8B _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1D8D _ 39. 45, FC
        jc      ?_080                                   ; 1D90 _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 1D96 _ B8, 00000000
?_084:  leave                                           ; 1D9B _ C9
        ret                                             ; 1D9C _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1D9D _ 55
        mov     ebp, esp                                ; 1D9E _ 89. E5
        push    ebx                                     ; 1DA0 _ 53
        sub     esp, 16                                 ; 1DA1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1DA4 _ C7. 45, F8, 00000000
        jmp     ?_086                                   ; 1DAB _ EB, 14

?_085:  mov     eax, dword [ebp+8H]                     ; 1DAD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1DB0 _ 8B. 55, F8
        add     edx, 2                                  ; 1DB3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DB6 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1DB9 _ 39. 45, 0C
        jc      ?_087                                   ; 1DBC _ 72, 0F
        inc     dword [ebp-8H]                          ; 1DBE _ FF. 45, F8
?_086:  mov     eax, dword [ebp+8H]                     ; 1DC1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DC4 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1DC6 _ 39. 45, F8
        jl      ?_085                                   ; 1DC9 _ 7C, E2
        jmp     ?_088                                   ; 1DCB _ EB, 01

?_087:  nop                                             ; 1DCD _ 90
?_088:  cmp     dword [ebp-8H], 0                       ; 1DCE _ 83. 7D, F8, 00
        jle     ?_090                                   ; 1DD2 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 1DD8 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1DDB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DDE _ 8B. 45, 08
        add     edx, 2                                  ; 1DE1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1DE4 _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1DE7 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1DEA _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1DED _ 8B. 45, 08
        add     ecx, 2                                  ; 1DF0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1DF3 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1DF7 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1DF9 _ 39. 45, 0C
        jne     ?_090                                   ; 1DFC _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1E02 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E05 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E08 _ 8B. 45, 08
        add     edx, 2                                  ; 1E0B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E0E _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1E12 _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1E15 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1E18 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E1B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E1E _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E21 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E24 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E28 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E2B _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1E2D _ 39. 45, F8
        jge     ?_089                                   ; 1E30 _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 1E32 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E35 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E38 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E3B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E3E _ 8B. 55, F8
        add     edx, 2                                  ; 1E41 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E44 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E47 _ 39. C1
        jnz     ?_089                                   ; 1E49 _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 1E4B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E4E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E51 _ 8B. 45, 08
        add     edx, 2                                  ; 1E54 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E57 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E5B _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1E5E _ 8B. 4D, F8
        add     ecx, 2                                  ; 1E61 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E64 _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1E68 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1E6B _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1E6E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E74 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E77 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E7B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E7E _ 8B. 00
        lea     edx, [eax-1H]                           ; 1E80 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E83 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E86 _ 89. 10
?_089:  mov     eax, 0                                  ; 1E88 _ B8, 00000000
        jmp     ?_096                                   ; 1E8D _ E9, 0000011B

?_090:  mov     eax, dword [ebp+8H]                     ; 1E92 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E95 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1E97 _ 39. 45, F8
        jge     ?_091                                   ; 1E9A _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 1E9C _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E9F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1EA2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EA5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1EA8 _ 8B. 55, F8
        add     edx, 2                                  ; 1EAB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1EAE _ 8B. 04 D0
        cmp     ecx, eax                                ; 1EB1 _ 39. C1
        jnz     ?_091                                   ; 1EB3 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1EB5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1EB8 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1EBB _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1EBE _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1EC1 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1EC4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1EC7 _ 8B. 55, F8
        add     edx, 2                                  ; 1ECA _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1ECD _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1ED1 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1ED4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1ED7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1EDA _ 8B. 55, F8
        add     edx, 2                                  ; 1EDD _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1EE0 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1EE4 _ B8, 00000000
        jmp     ?_096                                   ; 1EE9 _ E9, 000000BF

?_091:  mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EF1 _ 8B. 00
        cmp     eax, 4095                               ; 1EF3 _ 3D, 00000FFF
        jg      ?_095                                   ; 1EF8 _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 1EFE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F01 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1F03 _ 89. 45, F4
        jmp     ?_093                                   ; 1F06 _ EB, 27

?_092:  mov     eax, dword [ebp-0CH]                    ; 1F08 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1F0B _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1F0E _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1F11 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1F14 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1F17 _ 8B. 45, 08
        add     edx, 2                                  ; 1F1A _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1F1D _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1F20 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1F22 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1F25 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1F28 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1F2C _ FF. 4D, F4
?_093:  mov     eax, dword [ebp-0CH]                    ; 1F2F _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1F32 _ 3B. 45, F8
        jg      ?_092                                   ; 1F35 _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 1F37 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F3A _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F3C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F3F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F42 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F44 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F47 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F4A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F4D _ 8B. 00
        cmp     edx, eax                                ; 1F4F _ 39. C2
        jge     ?_094                                   ; 1F51 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1F53 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F56 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F58 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F5B _ 89. 50, 04
?_094:  mov     eax, dword [ebp+8H]                     ; 1F5E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F61 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F64 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1F67 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1F6A _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F6D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F70 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F73 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1F76 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1F79 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1F7D _ B8, 00000000
        jmp     ?_096                                   ; 1F82 _ EB, 29

?_095:  mov     eax, dword [ebp+8H]                     ; 1F84 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F87 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1F8A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F8D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F90 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F93 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F96 _ 8B. 40, 08
        mov     edx, eax                                ; 1F99 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1F9B _ 8B. 45, 10
        add     eax, edx                                ; 1F9E _ 01. D0
        mov     edx, eax                                ; 1FA0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1FA2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1FA5 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1FA8 _ B8, FFFFFFFF
?_096:  add     esp, 16                                 ; 1FAD _ 83. C4, 10
        pop     ebx                                     ; 1FB0 _ 5B
        pop     ebp                                     ; 1FB1 _ 5D
        ret                                             ; 1FB2 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1FB3 _ 55
        mov     ebp, esp                                ; 1FB4 _ 89. E5
        sub     esp, 16                                 ; 1FB6 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1FB9 _ 8B. 45, 0C
        add     eax, 4095                               ; 1FBC _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FC1 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1FC6 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1FC9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1FCC _ FF. 75, 08
        call    memman_alloc                            ; 1FCF _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1FD4 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1FD7 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FDA _ 8B. 45, FC
        leave                                           ; 1FDD _ C9
        ret                                             ; 1FDE _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1FDF _ 55
        mov     ebp, esp                                ; 1FE0 _ 89. E5
        sub     esp, 16                                 ; 1FE2 _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1FE5 _ 8B. 45, 10
        add     eax, 4095                               ; 1FE8 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FED _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1FF2 _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1FF5 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1FF8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1FFB _ FF. 75, 08
        call    memman_free                             ; 1FFE _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 2003 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 2006 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2009 _ 8B. 45, FC
        leave                                           ; 200C _ C9
        ret                                             ; 200D _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 200E _ 55
        mov     ebp, esp                                ; 200F _ 89. E5
        sub     esp, 24                                 ; 2011 _ 83. EC, 18
        sub     esp, 8                                  ; 2014 _ 83. EC, 08
        push    9232                                    ; 2017 _ 68, 00002410
        push    dword [ebp+8H]                          ; 201C _ FF. 75, 08
        call    memman_alloc_4k                         ; 201F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2024 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 2027 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 202A _ 83. 7D, F0, 00
        jnz     ?_097                                   ; 202E _ 75, 0A
        mov     eax, 0                                  ; 2030 _ B8, 00000000
        jmp     ?_101                                   ; 2035 _ E9, 00000099

?_097:  mov     eax, dword [ebp+10H]                    ; 203A _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 203D _ 0F AF. 45, 14
        sub     esp, 8                                  ; 2041 _ 83. EC, 08
        push    eax                                     ; 2044 _ 50
        push    dword [ebp+8H]                          ; 2045 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2048 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 204D _ 83. C4, 10
        mov     edx, eax                                ; 2050 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2052 _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2055 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2058 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 205B _ 8B. 40, 04
        test    eax, eax                                ; 205E _ 85. C0
        jnz     ?_098                                   ; 2060 _ 75, 1E
        mov     eax, dword [ebp-10H]                    ; 2062 _ 8B. 45, F0
        sub     esp, 4                                  ; 2065 _ 83. EC, 04
        push    9232                                    ; 2068 _ 68, 00002410
        push    eax                                     ; 206D _ 50
        push    dword [ebp+8H]                          ; 206E _ FF. 75, 08
        call    memman_free_4k                          ; 2071 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2076 _ 83. C4, 10
        mov     eax, 0                                  ; 2079 _ B8, 00000000
        jmp     ?_101                                   ; 207E _ EB, 53

?_098:  mov     eax, dword [ebp-10H]                    ; 2080 _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 2083 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2086 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2088 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 208B _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 208E _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2091 _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 2094 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2097 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 209A _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 209D _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 20A4 _ C7. 45, F4, 00000000
        jmp     ?_100                                   ; 20AB _ EB, 1A

?_099:  mov     eax, dword [ebp-10H]                    ; 20AD _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 20B0 _ 8B. 55, F4
        add     edx, 33                                 ; 20B3 _ 83. C2, 21
        shl     edx, 5                                  ; 20B6 _ C1. E2, 05
        add     eax, edx                                ; 20B9 _ 01. D0
        add     eax, 16                                 ; 20BB _ 83. C0, 10
        mov     dword [eax], 0                          ; 20BE _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 20C4 _ FF. 45, F4
?_100:  cmp     dword [ebp-0CH], 255                    ; 20C7 _ 81. 7D, F4, 000000FF
        jle     ?_099                                   ; 20CE _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 20D0 _ 8B. 45, F0
?_101:  leave                                           ; 20D3 _ C9
        ret                                             ; 20D4 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 20D5 _ 55
        mov     ebp, esp                                ; 20D6 _ 89. E5
        sub     esp, 16                                 ; 20D8 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 20DB _ C7. 45, FC, 00000000
        jmp     ?_104                                   ; 20E2 _ EB, 5A

?_102:  mov     eax, dword [ebp+8H]                     ; 20E4 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20E7 _ 8B. 55, FC
        add     edx, 33                                 ; 20EA _ 83. C2, 21
        shl     edx, 5                                  ; 20ED _ C1. E2, 05
        add     eax, edx                                ; 20F0 _ 01. D0
        add     eax, 16                                 ; 20F2 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 20F5 _ 8B. 00
        test    eax, eax                                ; 20F7 _ 85. C0
        jnz     ?_103                                   ; 20F9 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 20FB _ 8B. 45, FC
        shl     eax, 5                                  ; 20FE _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2101 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2107 _ 8B. 45, 08
        add     eax, edx                                ; 210A _ 01. D0
        add     eax, 4                                  ; 210C _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 210F _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2112 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2115 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 2118 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 211B _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 211E _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 2122 _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 2125 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 212C _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 212F _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2136 _ 8B. 45, F8
        jmp     ?_105                                   ; 2139 _ EB, 11

?_103:  inc     dword [ebp-4H]                          ; 213B _ FF. 45, FC
?_104:  cmp     dword [ebp-4H], 255                     ; 213E _ 81. 7D, FC, 000000FF
        jle     ?_102                                   ; 2145 _ 7E, 9D
        mov     eax, 0                                  ; 2147 _ B8, 00000000
?_105:  leave                                           ; 214C _ C9
        ret                                             ; 214D _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 214E _ 55
        mov     ebp, esp                                ; 214F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2151 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2154 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2157 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2159 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 215C _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 215F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2162 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2165 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2168 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 216B _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 216E _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2171 _ 89. 50, 14
        nop                                             ; 2174 _ 90
        pop     ebp                                     ; 2175 _ 5D
        ret                                             ; 2176 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2177 _ 55
        mov     ebp, esp                                ; 2178 _ 89. E5
        push    esi                                     ; 217A _ 56
        push    ebx                                     ; 217B _ 53
        sub     esp, 16                                 ; 217C _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 217F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2182 _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2185 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2188 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 218B _ 8B. 40, 10
        inc     eax                                     ; 218E _ 40
        cmp     dword [ebp+10H], eax                    ; 218F _ 39. 45, 10
        jle     ?_106                                   ; 2192 _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 2194 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2197 _ 8B. 40, 10
        inc     eax                                     ; 219A _ 40
        mov     dword [ebp+10H], eax                    ; 219B _ 89. 45, 10
?_106:  cmp     dword [ebp+10H], -1                     ; 219E _ 83. 7D, 10, FF
        jge     ?_107                                   ; 21A2 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 21A4 _ C7. 45, 10, FFFFFFFF
?_107:  mov     eax, dword [ebp+0CH]                    ; 21AB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 21AE _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 21B1 _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 21B4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 21B7 _ 3B. 45, 10
        jle     ?_114                                   ; 21BA _ 0F 8E, 000001D3
        cmp     dword [ebp+10H], 0                      ; 21C0 _ 83. 7D, 10, 00
        js      ?_110                                   ; 21C4 _ 0F 88, 000000E1
        mov     eax, dword [ebp-10H]                    ; 21CA _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 21CD _ 89. 45, F4
        jmp     ?_109                                   ; 21D0 _ EB, 33

?_108:  mov     eax, dword [ebp-0CH]                    ; 21D2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 21D5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21D8 _ 8B. 45, 08
        add     edx, 4                                  ; 21DB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21DE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21E2 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 21E5 _ 8B. 4D, F4
        add     ecx, 4                                  ; 21E8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21EB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21EF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21F2 _ 8B. 55, F4
        add     edx, 4                                  ; 21F5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21F8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 21FC _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 21FF _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2202 _ FF. 4D, F4
?_109:  mov     eax, dword [ebp-0CH]                    ; 2205 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2208 _ 3B. 45, 10
        jg      ?_108                                   ; 220B _ 7F, C5
        mov     eax, dword [ebp+8H]                     ; 220D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2210 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2213 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2216 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2219 _ 89. 54 88, 04
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
        sub     esp, 8                                  ; 224D _ 83. EC, 08
        push    esi                                     ; 2250 _ 56
        push    ebx                                     ; 2251 _ 53
        push    ecx                                     ; 2252 _ 51
        push    edx                                     ; 2253 _ 52
        push    eax                                     ; 2254 _ 50
        push    dword [ebp+8H]                          ; 2255 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2258 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 225D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2260 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2263 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2266 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2269 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 226C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 226F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2272 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2275 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2278 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 227B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 227E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2281 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2284 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2287 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 228A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 228D _ 8B. 40, 0C
        sub     esp, 4                                  ; 2290 _ 83. EC, 04
        push    dword [ebp-10H]                         ; 2293 _ FF. 75, F0
        push    esi                                     ; 2296 _ 56
        push    ebx                                     ; 2297 _ 53
        push    ecx                                     ; 2298 _ 51
        push    edx                                     ; 2299 _ 52
        push    eax                                     ; 229A _ 50
        push    dword [ebp+8H]                          ; 229B _ FF. 75, 08
        call    sheet_refreshsub                        ; 229E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22A3 _ 83. C4, 20
        jmp     ?_121                                   ; 22A6 _ E9, 00000239

?_110:  mov     eax, dword [ebp+8H]                     ; 22AB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22AE _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 22B1 _ 39. 45, F0
        jge     ?_113                                   ; 22B4 _ 7D, 46
        mov     eax, dword [ebp-10H]                    ; 22B6 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 22B9 _ 89. 45, F4
        jmp     ?_112                                   ; 22BC _ EB, 33

?_111:  mov     eax, dword [ebp-0CH]                    ; 22BE _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 22C1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22C4 _ 8B. 45, 08
        add     edx, 4                                  ; 22C7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 22CA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 22CE _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 22D1 _ 8B. 4D, F4
        add     ecx, 4                                  ; 22D4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22D7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 22DB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22DE _ 8B. 55, F4
        add     edx, 4                                  ; 22E1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22E4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 22E8 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 22EB _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 22EE _ FF. 45, F4
?_112:  mov     eax, dword [ebp+8H]                     ; 22F1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22F4 _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 22F7 _ 39. 45, F4
        jl      ?_111                                   ; 22FA _ 7C, C2
?_113:  mov     eax, dword [ebp+8H]                     ; 22FC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22FF _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2302 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2305 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2308 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 230B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 230E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2311 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2314 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2317 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 231A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 231D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2320 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2323 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2326 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2329 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 232C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 232F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2332 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2335 _ 83. EC, 08
        push    0                                       ; 2338 _ 6A, 00
        push    ebx                                     ; 233A _ 53
        push    ecx                                     ; 233B _ 51
        push    edx                                     ; 233C _ 52
        push    eax                                     ; 233D _ 50
        push    dword [ebp+8H]                          ; 233E _ FF. 75, 08
        call    sheet_refreshmap                        ; 2341 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2346 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2349 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 234C _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 234F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2352 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2355 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2358 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 235B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 235E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2361 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2364 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2367 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 236A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 236D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2370 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2373 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2376 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2379 _ 83. EC, 04
        push    esi                                     ; 237C _ 56
        push    0                                       ; 237D _ 6A, 00
        push    ebx                                     ; 237F _ 53
        push    ecx                                     ; 2380 _ 51
        push    edx                                     ; 2381 _ 52
        push    eax                                     ; 2382 _ 50
        push    dword [ebp+8H]                          ; 2383 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2386 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 238B _ 83. C4, 20
        jmp     ?_121                                   ; 238E _ E9, 00000151

?_114:  mov     eax, dword [ebp-10H]                    ; 2393 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2396 _ 3B. 45, 10
        jge     ?_121                                   ; 2399 _ 0F 8D, 00000145
        cmp     dword [ebp-10H], 0                      ; 239F _ 83. 7D, F0, 00
        js      ?_117                                   ; 23A3 _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 23A5 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 23A8 _ 89. 45, F4
        jmp     ?_116                                   ; 23AB _ EB, 33

?_115:  mov     eax, dword [ebp-0CH]                    ; 23AD _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 23B0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23B3 _ 8B. 45, 08
        add     edx, 4                                  ; 23B6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23B9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23BD _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 23C0 _ 8B. 4D, F4
        add     ecx, 4                                  ; 23C3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 23C6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 23CA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23CD _ 8B. 55, F4
        add     edx, 4                                  ; 23D0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 23D3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 23D7 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 23DA _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 23DD _ FF. 45, F4
?_116:  mov     eax, dword [ebp-0CH]                    ; 23E0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23E3 _ 3B. 45, 10
        jl      ?_115                                   ; 23E6 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 23E8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 23EB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 23EE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 23F1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 23F4 _ 89. 54 88, 04
        jmp     ?_120                                   ; 23F8 _ EB, 69

?_117:  mov     eax, dword [ebp+8H]                     ; 23FA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23FD _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2400 _ 89. 45, F4
        jmp     ?_119                                   ; 2403 _ EB, 37

?_118:  mov     eax, dword [ebp-0CH]                    ; 2405 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 2408 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 240B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 240E _ 8B. 55, F4
        add     edx, 4                                  ; 2411 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2414 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2418 _ 8B. 45, 08
        add     ecx, 4                                  ; 241B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 241E _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 2422 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 2425 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2428 _ 8B. 45, 08
        add     edx, 4                                  ; 242B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 242E _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 2432 _ 8B. 55, F4
        inc     edx                                     ; 2435 _ 42
        mov     dword [eax+18H], edx                    ; 2436 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2439 _ FF. 4D, F4
?_119:  mov     eax, dword [ebp-0CH]                    ; 243C _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 243F _ 3B. 45, 10
        jge     ?_118                                   ; 2442 _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 2444 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2447 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 244A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 244D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2450 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2454 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2457 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 245A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 245D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2460 _ 89. 50, 10
?_120:  mov     eax, dword [ebp+0CH]                    ; 2463 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2466 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2469 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 246C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 246F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2472 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2475 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2478 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 247B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 247E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2481 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2484 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2487 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 248A _ 8B. 40, 0C
        sub     esp, 8                                  ; 248D _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2490 _ FF. 75, 10
        push    ebx                                     ; 2493 _ 53
        push    ecx                                     ; 2494 _ 51
        push    edx                                     ; 2495 _ 52
        push    eax                                     ; 2496 _ 50
        push    dword [ebp+8H]                          ; 2497 _ FF. 75, 08
        call    sheet_refreshmap                        ; 249A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 249F _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 24A2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24A5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24A8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24AB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 24AE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 24B1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24B4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24B7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24BA _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 24BD _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 24C0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24C3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24C6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24C9 _ 8B. 40, 0C
        sub     esp, 4                                  ; 24CC _ 83. EC, 04
        push    dword [ebp+10H]                         ; 24CF _ FF. 75, 10
        push    dword [ebp+10H]                         ; 24D2 _ FF. 75, 10
        push    ebx                                     ; 24D5 _ 53
        push    ecx                                     ; 24D6 _ 51
        push    edx                                     ; 24D7 _ 52
        push    eax                                     ; 24D8 _ 50
        push    dword [ebp+8H]                          ; 24D9 _ FF. 75, 08
        call    sheet_refreshsub                        ; 24DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24E1 _ 83. C4, 20
?_121:  nop                                             ; 24E4 _ 90
        lea     esp, [ebp-8H]                           ; 24E5 _ 8D. 65, F8
        pop     ebx                                     ; 24E8 _ 5B
        pop     esi                                     ; 24E9 _ 5E
        pop     ebp                                     ; 24EA _ 5D
        ret                                             ; 24EB _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 24EC _ 55
        mov     ebp, esp                                ; 24ED _ 89. E5
        push    edi                                     ; 24EF _ 57
        push    esi                                     ; 24F0 _ 56
        push    ebx                                     ; 24F1 _ 53
        sub     esp, 28                                 ; 24F2 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 24F5 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24F8 _ 8B. 40, 18
        test    eax, eax                                ; 24FB _ 85. C0
        js      ?_122                                   ; 24FD _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 24FF _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 2502 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 2505 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 2508 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 250B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 250E _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 2511 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 2514 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 2517 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 251A _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 251D _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 2520 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2523 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2526 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 2529 _ 8B. 45, 14
        add     edx, eax                                ; 252C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 252E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2531 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 2534 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2537 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 253A _ 03. 45, E4
        sub     esp, 4                                  ; 253D _ 83. EC, 04
        push    ebx                                     ; 2540 _ 53
        push    ecx                                     ; 2541 _ 51
        push    edi                                     ; 2542 _ 57
        push    esi                                     ; 2543 _ 56
        push    edx                                     ; 2544 _ 52
        push    eax                                     ; 2545 _ 50
        push    dword [ebp+8H]                          ; 2546 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2549 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 254E _ 83. C4, 20
?_122:  mov     eax, 0                                  ; 2551 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2556 _ 8D. 65, F4
        pop     ebx                                     ; 2559 _ 5B
        pop     esi                                     ; 255A _ 5E
        pop     edi                                     ; 255B _ 5F
        pop     ebp                                     ; 255C _ 5D
        ret                                             ; 255D _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 255E _ 55
        mov     ebp, esp                                ; 255F _ 89. E5
        push    esi                                     ; 2561 _ 56
        push    ebx                                     ; 2562 _ 53
        sub     esp, 16                                 ; 2563 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2566 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2569 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 256C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 256F _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2572 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2575 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2578 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 257B _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 257E _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2581 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2584 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2587 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 258A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 258D _ 8B. 40, 18
        test    eax, eax                                ; 2590 _ 85. C0
        js      ?_123                                   ; 2592 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 2598 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 259B _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 259E _ 8B. 45, F0
        add     edx, eax                                ; 25A1 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25A3 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25A6 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 25A9 _ 8B. 45, F4
        add     eax, ecx                                ; 25AC _ 01. C8
        sub     esp, 8                                  ; 25AE _ 83. EC, 08
        push    0                                       ; 25B1 _ 6A, 00
        push    edx                                     ; 25B3 _ 52
        push    eax                                     ; 25B4 _ 50
        push    dword [ebp-10H]                         ; 25B5 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 25B8 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 25BB _ FF. 75, 08
        call    sheet_refreshmap                        ; 25BE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25C3 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25C6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25C9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 25CC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 25CF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 25D2 _ 8B. 55, 14
        add     ecx, edx                                ; 25D5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25D7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 25DA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 25DD _ 8B. 55, 10
        add     edx, ebx                                ; 25E0 _ 01. DA
        sub     esp, 8                                  ; 25E2 _ 83. EC, 08
        push    eax                                     ; 25E5 _ 50
        push    ecx                                     ; 25E6 _ 51
        push    edx                                     ; 25E7 _ 52
        push    dword [ebp+14H]                         ; 25E8 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 25EB _ FF. 75, 10
        push    dword [ebp+8H]                          ; 25EE _ FF. 75, 08
        call    sheet_refreshmap                        ; 25F1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25F6 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25F9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25FC _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 25FF _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2602 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2605 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2608 _ 8B. 45, F0
        add     edx, eax                                ; 260B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 260D _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 2610 _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 2613 _ 8B. 45, F4
        add     eax, ebx                                ; 2616 _ 01. D8
        sub     esp, 4                                  ; 2618 _ 83. EC, 04
        push    ecx                                     ; 261B _ 51
        push    0                                       ; 261C _ 6A, 00
        push    edx                                     ; 261E _ 52
        push    eax                                     ; 261F _ 50
        push    dword [ebp-10H]                         ; 2620 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2623 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2626 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2629 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 262E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2631 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 2634 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2637 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 263A _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 263D _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 2640 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 2643 _ 8B. 4D, 14
        add     ebx, ecx                                ; 2646 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2648 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 264B _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 264E _ 8B. 4D, 10
        add     ecx, esi                                ; 2651 _ 01. F1
        sub     esp, 4                                  ; 2653 _ 83. EC, 04
        push    edx                                     ; 2656 _ 52
        push    eax                                     ; 2657 _ 50
        push    ebx                                     ; 2658 _ 53
        push    ecx                                     ; 2659 _ 51
        push    dword [ebp+14H]                         ; 265A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 265D _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2660 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2663 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2668 _ 83. C4, 20
?_123:  nop                                             ; 266B _ 90
        lea     esp, [ebp-8H]                           ; 266C _ 8D. 65, F8
        pop     ebx                                     ; 266F _ 5B
        pop     esi                                     ; 2670 _ 5E
        pop     ebp                                     ; 2671 _ 5D
        ret                                             ; 2672 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 2673 _ 55
        mov     ebp, esp                                ; 2674 _ 89. E5
        sub     esp, 48                                 ; 2676 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2679 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 267C _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 267E _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2681 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2684 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2687 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 268A _ 83. 7D, 0C, 00
        jns     ?_124                                   ; 268E _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2690 _ C7. 45, 0C, 00000000
?_124:  cmp     dword [ebp+10H], 8                      ; 2697 _ 83. 7D, 10, 08
        jg      ?_125                                   ; 269B _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 269D _ C7. 45, 10, 00000000
?_125:  mov     eax, dword [ebp+8H]                     ; 26A4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26A7 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 26AA _ 39. 45, 14
        jle     ?_126                                   ; 26AD _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 26AF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26B2 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 26B5 _ 89. 45, 14
?_126:  mov     eax, dword [ebp+8H]                     ; 26B8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26BB _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 26BE _ 39. 45, 18
        jle     ?_127                                   ; 26C1 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 26C3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26C6 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 26C9 _ 89. 45, 18
?_127:  mov     eax, dword [ebp+1CH]                    ; 26CC _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 26CF _ 89. 45, FC
        jmp     ?_134                                   ; 26D2 _ E9, 0000010E

?_128:  mov     eax, dword [ebp+8H]                     ; 26D7 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 26DA _ 8B. 55, FC
        add     edx, 4                                  ; 26DD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26E0 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 26E4 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 26E7 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 26EA _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 26EC _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 26EF _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 26F2 _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 26F8 _ 8B. 45, E8
        sub     eax, edx                                ; 26FB _ 29. D0
        sar     eax, 5                                  ; 26FD _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 2700 _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 2703 _ C7. 45, F4, 00000000
        jmp     ?_133                                   ; 270A _ E9, 000000C4

?_129:  mov     eax, dword [ebp-18H]                    ; 270F _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 2712 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2715 _ 8B. 45, F4
        add     eax, edx                                ; 2718 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 271A _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 271D _ C7. 45, F8, 00000000
        jmp     ?_132                                   ; 2724 _ E9, 00000098

?_130:  mov     eax, dword [ebp-18H]                    ; 2729 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 272C _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 272F _ 8B. 45, F8
        add     eax, edx                                ; 2732 _ 01. D0
        mov     dword [ebp-28H], eax                    ; 2734 _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2737 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 273A _ 3B. 45, D8
        jg      ?_131                                   ; 273D _ 7F, 7F
        mov     eax, dword [ebp-28H]                    ; 273F _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 2742 _ 3B. 45, 14
        jge     ?_131                                   ; 2745 _ 7D, 77
        mov     eax, dword [ebp+10H]                    ; 2747 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 274A _ 3B. 45, DC
        jg      ?_131                                   ; 274D _ 7F, 6F
        mov     eax, dword [ebp-24H]                    ; 274F _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 2752 _ 3B. 45, 18
        jge     ?_131                                   ; 2755 _ 7D, 67
        mov     eax, dword [ebp-18H]                    ; 2757 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 275A _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 275D _ 0F AF. 45, F4
        mov     edx, eax                                ; 2761 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2763 _ 8B. 45, F8
        add     eax, edx                                ; 2766 _ 01. D0
        mov     edx, eax                                ; 2768 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 276A _ 8B. 45, E4
        add     eax, edx                                ; 276D _ 01. D0
        mov     al, byte [eax]                          ; 276F _ 8A. 00
        mov     byte [ebp-29H], al                      ; 2771 _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 2774 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2777 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 277A _ 0F AF. 45, DC
        mov     edx, eax                                ; 277E _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2780 _ 8B. 45, D8
        add     eax, edx                                ; 2783 _ 01. D0
        mov     edx, eax                                ; 2785 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2787 _ 8B. 45, EC
        add     eax, edx                                ; 278A _ 01. D0
        mov     al, byte [eax]                          ; 278C _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 278E _ 38. 45, E3
        jnz     ?_131                                   ; 2791 _ 75, 2B
        movzx   edx, byte [ebp-29H]                     ; 2793 _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2797 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 279A _ 8B. 40, 14
        cmp     edx, eax                                ; 279D _ 39. C2
        jz      ?_131                                   ; 279F _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 27A1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27A4 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 27A7 _ 0F AF. 45, DC
        mov     edx, eax                                ; 27AB _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 27AD _ 8B. 45, D8
        add     eax, edx                                ; 27B0 _ 01. D0
        mov     edx, eax                                ; 27B2 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 27B4 _ 8B. 45, F0
        add     edx, eax                                ; 27B7 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 27B9 _ 8A. 45, D7
        mov     byte [edx], al                          ; 27BC _ 88. 02
?_131:  inc     dword [ebp-8H]                          ; 27BE _ FF. 45, F8
?_132:  mov     eax, dword [ebp-18H]                    ; 27C1 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 27C4 _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 27C7 _ 39. 45, F8
        jl      ?_130                                   ; 27CA _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 27D0 _ FF. 45, F4
?_133:  mov     eax, dword [ebp-18H]                    ; 27D3 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 27D6 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 27D9 _ 39. 45, F4
        jl      ?_129                                   ; 27DC _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 27E2 _ FF. 45, FC
?_134:  mov     eax, dword [ebp-4H]                     ; 27E5 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 27E8 _ 3B. 45, 20
        jle     ?_128                                   ; 27EB _ 0F 8E, FFFFFEE6
        nop                                             ; 27F1 _ 90
        nop                                             ; 27F2 _ 90
        leave                                           ; 27F3 _ C9
        ret                                             ; 27F4 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 27F5 _ 55
        mov     ebp, esp                                ; 27F6 _ 89. E5
        sub     esp, 64                                 ; 27F8 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 27FB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27FE _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 2801 _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 2804 _ 83. 7D, 0C, 00
        jns     ?_135                                   ; 2808 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 280A _ C7. 45, 0C, 00000000
?_135:  cmp     dword [ebp+10H], 0                      ; 2811 _ 83. 7D, 10, 00
        jns     ?_136                                   ; 2815 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2817 _ C7. 45, 10, 00000000
?_136:  mov     eax, dword [ebp+8H]                     ; 281E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2821 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2824 _ 39. 45, 14
        jle     ?_137                                   ; 2827 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2829 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 282C _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 282F _ 89. 45, 14
?_137:  mov     eax, dword [ebp+8H]                     ; 2832 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2835 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2838 _ 39. 45, 18
        jle     ?_138                                   ; 283B _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 283D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2840 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2843 _ 89. 45, 18
?_138:  mov     eax, dword [ebp+1CH]                    ; 2846 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2849 _ 89. 45, FC
        jmp     ?_149                                   ; 284C _ E9, 00000137

?_139:  mov     eax, dword [ebp+8H]                     ; 2851 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 2854 _ 8B. 55, FC
        add     edx, 4                                  ; 2857 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 285A _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 285E _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 2861 _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 2864 _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 286A _ 8B. 45, DC
        sub     eax, edx                                ; 286D _ 29. D0
        sar     eax, 5                                  ; 286F _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 2872 _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2875 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2878 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 287A _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 287D _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 2880 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2883 _ 8B. 55, 0C
        sub     edx, eax                                ; 2886 _ 29. C2
        mov     eax, edx                                ; 2888 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 288A _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 288D _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 2890 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2893 _ 8B. 55, 10
        sub     edx, eax                                ; 2896 _ 29. C2
        mov     eax, edx                                ; 2898 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 289A _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 289D _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 28A0 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 28A3 _ 8B. 55, 14
        sub     edx, eax                                ; 28A6 _ 29. C2
        mov     eax, edx                                ; 28A8 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 28AA _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 28AD _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 28B0 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 28B3 _ 8B. 55, 18
        sub     edx, eax                                ; 28B6 _ 29. C2
        mov     eax, edx                                ; 28B8 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 28BA _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 28BD _ 83. 7D, F0, 00
        jns     ?_140                                   ; 28C1 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 28C3 _ C7. 45, F0, 00000000
?_140:  cmp     dword [ebp-14H], 0                      ; 28CA _ 83. 7D, EC, 00
        jns     ?_141                                   ; 28CE _ 79, 07
        mov     dword [ebp-14H], 0                      ; 28D0 _ C7. 45, EC, 00000000
?_141:  mov     eax, dword [ebp-24H]                    ; 28D7 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28DA _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 28DD _ 39. 45, E8
        jle     ?_142                                   ; 28E0 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 28E2 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28E5 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 28E8 _ 89. 45, E8
?_142:  mov     eax, dword [ebp-24H]                    ; 28EB _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28EE _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 28F1 _ 39. 45, E4
        jle     ?_143                                   ; 28F4 _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 28F6 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28F9 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 28FC _ 89. 45, E4
?_143:  mov     eax, dword [ebp-14H]                    ; 28FF _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 2902 _ 89. 45, F4
        jmp     ?_148                                   ; 2905 _ EB, 76

?_144:  mov     eax, dword [ebp-24H]                    ; 2907 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 290A _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 290D _ 8B. 45, F4
        add     eax, edx                                ; 2910 _ 01. D0
        mov     dword [ebp-30H], eax                    ; 2912 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2915 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 2918 _ 89. 45, F8
        jmp     ?_147                                   ; 291B _ EB, 55

?_145:  mov     eax, dword [ebp-24H]                    ; 291D _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 2920 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 2923 _ 8B. 45, F8
        add     eax, edx                                ; 2926 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 2928 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 292B _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 292E _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2931 _ 0F AF. 45, F4
        mov     edx, eax                                ; 2935 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2937 _ 8B. 45, F8
        add     eax, edx                                ; 293A _ 01. D0
        mov     edx, eax                                ; 293C _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 293E _ 8B. 45, D4
        add     eax, edx                                ; 2941 _ 01. D0
        mov     al, byte [eax]                          ; 2943 _ 8A. 00
        movzx   edx, al                                 ; 2945 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2948 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 294B _ 8B. 40, 14
        cmp     edx, eax                                ; 294E _ 39. C2
        jz      ?_146                                   ; 2950 _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 2952 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2955 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2958 _ 0F AF. 45, D0
        mov     edx, eax                                ; 295C _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 295E _ 8B. 45, CC
        add     eax, edx                                ; 2961 _ 01. D0
        mov     edx, eax                                ; 2963 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2965 _ 8B. 45, E0
        add     edx, eax                                ; 2968 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 296A _ 8A. 45, DB
        mov     byte [edx], al                          ; 296D _ 88. 02
?_146:  inc     dword [ebp-8H]                          ; 296F _ FF. 45, F8
?_147:  mov     eax, dword [ebp-8H]                     ; 2972 _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2975 _ 3B. 45, E8
        jl      ?_145                                   ; 2978 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 297A _ FF. 45, F4
?_148:  mov     eax, dword [ebp-0CH]                    ; 297D _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 2980 _ 3B. 45, E4
        jl      ?_144                                   ; 2983 _ 7C, 82
        inc     dword [ebp-4H]                          ; 2985 _ FF. 45, FC
?_149:  mov     eax, dword [ebp+8H]                     ; 2988 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 298B _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 298E _ 39. 45, FC
        jle     ?_139                                   ; 2991 _ 0F 8E, FFFFFEBA
        nop                                             ; 2997 _ 90
        leave                                           ; 2998 _ C9
        ret                                             ; 2999 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 299A _ 55
        mov     ebp, esp                                ; 299B _ 89. E5
        sub     esp, 24                                 ; 299D _ 83. EC, 18
        sub     esp, 8                                  ; 29A0 _ 83. EC, 08
        push    52                                      ; 29A3 _ 6A, 34
        push    67                                      ; 29A5 _ 6A, 43
        call    io_out8                                 ; 29A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29AC _ 83. C4, 10
        sub     esp, 8                                  ; 29AF _ 83. EC, 08
        push    156                                     ; 29B2 _ 68, 0000009C
        push    64                                      ; 29B7 _ 6A, 40
        call    io_out8                                 ; 29B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29BE _ 83. C4, 10
        sub     esp, 8                                  ; 29C1 _ 83. EC, 08
        push    46                                      ; 29C4 _ 6A, 2E
        push    64                                      ; 29C6 _ 6A, 40
        call    io_out8                                 ; 29C8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29CD _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 29D0 _ C7. 05, 00000360(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 29DA _ C7. 45, F4, 00000000
        jmp     ?_151                                   ; 29E1 _ EB, 25

?_150:  mov     eax, dword [ebp-0CH]                    ; 29E3 _ 8B. 45, F4
        shl     eax, 4                                  ; 29E6 _ C1. E0, 04
        add     eax, ?_218                              ; 29E9 _ 05, 00000368(d)
        mov     dword [eax], 0                          ; 29EE _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 29F4 _ 8B. 45, F4
        shl     eax, 4                                  ; 29F7 _ C1. E0, 04
        add     eax, ?_219                              ; 29FA _ 05, 0000036C(d)
        mov     dword [eax], 0                          ; 29FF _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 2A05 _ FF. 45, F4
?_151:  cmp     dword [ebp-0CH], 499                    ; 2A08 _ 81. 7D, F4, 000001F3
        jle     ?_150                                   ; 2A0F _ 7E, D2
        nop                                             ; 2A11 _ 90
        nop                                             ; 2A12 _ 90
        leave                                           ; 2A13 _ C9
        ret                                             ; 2A14 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2A15 _ 55
        mov     ebp, esp                                ; 2A16 _ 89. E5
        sub     esp, 16                                 ; 2A18 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2A1B _ C7. 45, FC, 00000000
        jmp     ?_154                                   ; 2A22 _ EB, 35

?_152:  mov     eax, dword [ebp-4H]                     ; 2A24 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A27 _ C1. E0, 04
        add     eax, ?_218                              ; 2A2A _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2A2F _ 8B. 00
        test    eax, eax                                ; 2A31 _ 85. C0
        jnz     ?_153                                   ; 2A33 _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2A35 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A38 _ C1. E0, 04
        add     eax, ?_218                              ; 2A3B _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2A40 _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A46 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A49 _ C1. E0, 04
        add     eax, timerctl                           ; 2A4C _ 05, 00000360(d)
        add     eax, 4                                  ; 2A51 _ 83. C0, 04
        jmp     ?_155                                   ; 2A54 _ EB, 11

?_153:  inc     dword [ebp-4H]                          ; 2A56 _ FF. 45, FC
?_154:  cmp     dword [ebp-4H], 499                     ; 2A59 _ 81. 7D, FC, 000001F3
        jle     ?_152                                   ; 2A60 _ 7E, C2
        mov     eax, 0                                  ; 2A62 _ B8, 00000000
?_155:  leave                                           ; 2A67 _ C9
        ret                                             ; 2A68 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A69 _ 55
        mov     ebp, esp                                ; 2A6A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A6C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A6F _ C7. 40, 04, 00000000
        nop                                             ; 2A76 _ 90
        pop     ebp                                     ; 2A77 _ 5D
        ret                                             ; 2A78 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A79 _ 55
        mov     ebp, esp                                ; 2A7A _ 89. E5
        sub     esp, 4                                  ; 2A7C _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A7F _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A82 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A85 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A88 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2A8B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A8E _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2A91 _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A94 _ 88. 50, 0C
        nop                                             ; 2A97 _ 90
        leave                                           ; 2A98 _ C9
        ret                                             ; 2A99 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A9A _ 55
        mov     ebp, esp                                ; 2A9B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A9D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AA0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2AA3 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2AA5 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2AA8 _ C7. 40, 04, 00000002
        nop                                             ; 2AAF _ 90
        pop     ebp                                     ; 2AB0 _ 5D
        ret                                             ; 2AB1 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2AB2 _ 55
        mov     ebp, esp                                ; 2AB3 _ 89. E5
        sub     esp, 24                                 ; 2AB5 _ 83. EC, 18
        sub     esp, 8                                  ; 2AB8 _ 83. EC, 08
        push    32                                      ; 2ABB _ 6A, 20
        push    32                                      ; 2ABD _ 6A, 20
        call    io_out8                                 ; 2ABF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2AC4 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2AC7 _ A1, 00000360(d)
        inc     eax                                     ; 2ACC _ 40
        mov     dword [timerctl], eax                   ; 2ACD _ A3, 00000360(d)
        mov     byte [ebp-0DH], 0                       ; 2AD2 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2AD6 _ C7. 45, F4, 00000000
        jmp     ?_159                                   ; 2ADD _ E9, 000000A8

?_156:  mov     eax, dword [ebp-0CH]                    ; 2AE2 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AE5 _ C1. E0, 04
        add     eax, ?_218                              ; 2AE8 _ 05, 00000368(d)
        mov     eax, dword [eax]                        ; 2AED _ 8B. 00
        cmp     eax, 2                                  ; 2AEF _ 83. F8, 02
        jne     ?_157                                   ; 2AF2 _ 0F 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2AF8 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AFB _ C1. E0, 04
        add     eax, ?_217                              ; 2AFE _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2B03 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2B05 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2B08 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B0B _ C1. E0, 04
        add     eax, ?_217                              ; 2B0E _ 05, 00000364(d)
        mov     dword [eax], edx                        ; 2B13 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2B15 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B18 _ C1. E0, 04
        add     eax, ?_217                              ; 2B1B _ 05, 00000364(d)
        mov     eax, dword [eax]                        ; 2B20 _ 8B. 00
        test    eax, eax                                ; 2B22 _ 85. C0
        jnz     ?_157                                   ; 2B24 _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2B26 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B29 _ C1. E0, 04
        add     eax, ?_218                              ; 2B2C _ 05, 00000368(d)
        mov     dword [eax], 1                          ; 2B31 _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2B37 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B3A _ C1. E0, 04
        add     eax, ?_220                              ; 2B3D _ 05, 00000370(d)
        mov     al, byte [eax]                          ; 2B42 _ 8A. 00
        movzx   edx, al                                 ; 2B44 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2B47 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B4A _ C1. E0, 04
        add     eax, ?_219                              ; 2B4D _ 05, 0000036C(d)
        mov     eax, dword [eax]                        ; 2B52 _ 8B. 00
        sub     esp, 8                                  ; 2B54 _ 83. EC, 08
        push    edx                                     ; 2B57 _ 52
        push    eax                                     ; 2B58 _ 50
        call    fifo8_put                               ; 2B59 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B5E _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2B61 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B64 _ C1. E0, 04
        add     eax, timerctl                           ; 2B67 _ 05, 00000360(d)
        lea     edx, [eax+4H]                           ; 2B6C _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2B6F _ A1, 00000000(d)
        cmp     edx, eax                                ; 2B74 _ 39. C2
        jnz     ?_157                                   ; 2B76 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2B78 _ C6. 45, F3, 01
?_157:  cmp     byte [ebp-0DH], 0                       ; 2B7C _ 80. 7D, F3, 00
        jz      ?_158                                   ; 2B80 _ 74, 05
        call    task_switch                             ; 2B82 _ E8, FFFFFFFC(rel)
?_158:  inc     dword [ebp-0CH]                         ; 2B87 _ FF. 45, F4
?_159:  cmp     dword [ebp-0CH], 499                    ; 2B8A _ 81. 7D, F4, 000001F3
        jle     ?_156                                   ; 2B91 _ 0F 8E, FFFFFF4B
        nop                                             ; 2B97 _ 90
        leave                                           ; 2B98 _ C9
        ret                                             ; 2B99 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2B9A _ 55
        mov     ebp, esp                                ; 2B9B _ 89. E5
        mov     eax, timerctl                           ; 2B9D _ B8, 00000360(d)
        pop     ebp                                     ; 2BA2 _ 5D
        ret                                             ; 2BA3 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2BA4 _ 55
        mov     ebp, esp                                ; 2BA5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BA7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2BAA _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2BAD _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2BB0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2BB3 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2BB6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2BB8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2BBB _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2BBE _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2BC1 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2BC4 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BCB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2BCE _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BD5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2BD8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BDF _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2BE2 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2BE5 _ 89. 50, 18
        nop                                             ; 2BE8 _ 90
        pop     ebp                                     ; 2BE9 _ 5D
        ret                                             ; 2BEA _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2BEB _ 55
        mov     ebp, esp                                ; 2BEC _ 89. E5
        sub     esp, 24                                 ; 2BEE _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2BF1 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2BF4 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2BF7 _ 83. 7D, 08, 00
        jnz     ?_160                                   ; 2BFB _ 75, 0A
        mov     eax, 4294967295                         ; 2BFD _ B8, FFFFFFFF
        jmp     ?_164                                   ; 2C02 _ E9, 0000009F

?_160:  mov     eax, dword [ebp+8H]                     ; 2C07 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C0A _ 8B. 40, 10
        test    eax, eax                                ; 2C0D _ 85. C0
        jnz     ?_161                                   ; 2C0F _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2C11 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2C14 _ 8B. 40, 14
        or      eax, 01H                                ; 2C17 _ 83. C8, 01
        mov     edx, eax                                ; 2C1A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2C1C _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2C1F _ 89. 50, 14
        mov     eax, 4294967295                         ; 2C22 _ B8, FFFFFFFF
        jmp     ?_164                                   ; 2C27 _ EB, 7D

?_161:  mov     eax, dword [ebp+8H]                     ; 2C29 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2C2C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2C2E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C31 _ 8B. 40, 04
        add     edx, eax                                ; 2C34 _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2C36 _ 8A. 45, F4
        mov     byte [edx], al                          ; 2C39 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2C3B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C3E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2C41 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C44 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2C47 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C4A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2C4D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C50 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C53 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2C56 _ 39. C2
        jnz     ?_162                                   ; 2C58 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2C5A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C5D _ C7. 40, 04, 00000000
?_162:  mov     eax, dword [ebp+8H]                     ; 2C64 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C67 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2C6A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C6D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2C70 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C73 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C76 _ 8B. 40, 18
        test    eax, eax                                ; 2C79 _ 85. C0
        jz      ?_163                                   ; 2C7B _ 74, 24
        mov     eax, dword [ebp+8H]                     ; 2C7D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C80 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2C83 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2C86 _ 83. F8, 02
        jz      ?_163                                   ; 2C89 _ 74, 16
        mov     eax, dword [ebp+8H]                     ; 2C8B _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C8E _ 8B. 40, 18
        sub     esp, 4                                  ; 2C91 _ 83. EC, 04
        push    0                                       ; 2C94 _ 6A, 00
        push    -1                                      ; 2C96 _ 6A, FF
        push    eax                                     ; 2C98 _ 50
        call    task_run                                ; 2C99 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C9E _ 83. C4, 10
?_163:  mov     eax, 0                                  ; 2CA1 _ B8, 00000000
?_164:  leave                                           ; 2CA6 _ C9
        ret                                             ; 2CA7 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2CA8 _ 55
        mov     ebp, esp                                ; 2CA9 _ 89. E5
        sub     esp, 16                                 ; 2CAB _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2CAE _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2CB1 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2CB4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CB7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CBA _ 39. C2
        jnz     ?_165                                   ; 2CBC _ 75, 07
        mov     eax, 4294967295                         ; 2CBE _ B8, FFFFFFFF
        jmp     ?_167                                   ; 2CC3 _ EB, 50

?_165:  mov     eax, dword [ebp+8H]                     ; 2CC5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2CC8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2CCA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CCD _ 8B. 40, 08
        add     eax, edx                                ; 2CD0 _ 01. D0
        mov     al, byte [eax]                          ; 2CD2 _ 8A. 00
        movzx   eax, al                                 ; 2CD4 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2CD7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2CDA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CDD _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2CE0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CE3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2CE6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CE9 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2CEC _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CEF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CF2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CF5 _ 39. C2
        jnz     ?_166                                   ; 2CF7 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2CF9 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2CFC _ C7. 40, 08, 00000000
?_166:  mov     eax, dword [ebp+8H]                     ; 2D03 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D06 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2D09 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D0C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2D0F _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2D12 _ 8B. 45, FC
?_167:  leave                                           ; 2D15 _ C9
        ret                                             ; 2D16 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2D17 _ 55
        mov     ebp, esp                                ; 2D18 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2D1A _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2D1D _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D20 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D23 _ 8B. 40, 10
        sub     edx, eax                                ; 2D26 _ 29. C2
        mov     eax, edx                                ; 2D28 _ 89. D0
        pop     ebp                                     ; 2D2A _ 5D
        ret                                             ; 2D2B _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2D2C _ 55
        mov     ebp, esp                                ; 2D2D _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2D2F _ 81. 7D, 0C, 000FFFFF
        jbe     ?_168                                   ; 2D36 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2D38 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2D3F _ 8B. 45, 0C
        shr     eax, 12                                 ; 2D42 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2D45 _ 89. 45, 0C
?_168:  mov     eax, dword [ebp+0CH]                    ; 2D48 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2D4B _ 8B. 55, 08
        mov     word [edx], ax                          ; 2D4E _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2D51 _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2D54 _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2D57 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2D5B _ 8B. 45, 10
        sar     eax, 16                                 ; 2D5E _ C1. F8, 10
        mov     dl, al                                  ; 2D61 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D63 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2D66 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2D69 _ 8B. 45, 14
        mov     dl, al                                  ; 2D6C _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D6E _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2D71 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2D74 _ 8B. 45, 0C
        shr     eax, 16                                 ; 2D77 _ C1. E8, 10
        and     eax, 0FH                                ; 2D7A _ 83. E0, 0F
        mov     dl, al                                  ; 2D7D _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2D7F _ 8B. 45, 14
        sar     eax, 8                                  ; 2D82 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2D85 _ 83. E0, F0
        or      eax, edx                                ; 2D88 _ 09. D0
        mov     dl, al                                  ; 2D8A _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D8C _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2D8F _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2D92 _ 8B. 45, 10
        shr     eax, 24                                 ; 2D95 _ C1. E8, 18
        mov     dl, al                                  ; 2D98 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D9A _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2D9D _ 88. 50, 07
        nop                                             ; 2DA0 _ 90
        pop     ebp                                     ; 2DA1 _ 5D
        ret                                             ; 2DA2 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 2DA3 _ 55
        mov     ebp, esp                                ; 2DA4 _ 89. E5
        mov     eax, dword [taskctl]                    ; 2DA6 _ A1, 000022A8(d)
        pop     ebp                                     ; 2DAB _ 5D
        ret                                             ; 2DAC _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 2DAD _ 55
        mov     ebp, esp                                ; 2DAE _ 89. E5
        sub     esp, 16                                 ; 2DB0 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 2DB3 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 2DB9 _ 8B. 55, 08
        mov     eax, edx                                ; 2DBC _ 89. D0
        shl     eax, 2                                  ; 2DBE _ C1. E0, 02
        add     eax, edx                                ; 2DC1 _ 01. D0
        shl     eax, 2                                  ; 2DC3 _ C1. E0, 02
        add     eax, ecx                                ; 2DC6 _ 01. C8
        add     eax, 8                                  ; 2DC8 _ 83. C0, 08
        mov     dword [eax], 0                          ; 2DCB _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 2DD1 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp+8H]                     ; 2DD7 _ 8B. 55, 08
        mov     eax, edx                                ; 2DDA _ 89. D0
        shl     eax, 2                                  ; 2DDC _ C1. E0, 02
        add     eax, edx                                ; 2DDF _ 01. D0
        shl     eax, 2                                  ; 2DE1 _ C1. E0, 02
        add     eax, ecx                                ; 2DE4 _ 01. C8
        add     eax, 12                                 ; 2DE6 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 2DE9 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 2DEF _ C7. 45, FC, 00000000
        jmp     ?_170                                   ; 2DF6 _ EB, 20

?_169:  mov     ecx, dword [taskctl]                    ; 2DF8 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 2DFE _ 8B. 55, FC
        mov     eax, edx                                ; 2E01 _ 89. D0
        add     eax, eax                                ; 2E03 _ 01. C0
        add     eax, edx                                ; 2E05 _ 01. D0
        shl     eax, 3                                  ; 2E07 _ C1. E0, 03
        add     eax, ecx                                ; 2E0A _ 01. C8
        add     eax, 16                                 ; 2E0C _ 83. C0, 10
        mov     dword [eax], 0                          ; 2E0F _ C7. 00, 00000000
        inc     dword [ebp-4H]                          ; 2E15 _ FF. 45, FC
?_170:  cmp     dword [ebp-4H], 2                       ; 2E18 _ 83. 7D, FC, 02
        jle     ?_169                                   ; 2E1C _ 7E, DA
        nop                                             ; 2E1E _ 90
        nop                                             ; 2E1F _ 90
        leave                                           ; 2E20 _ C9
        ret                                             ; 2E21 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 2E22 _ 55
        mov     ebp, esp                                ; 2E23 _ 89. E5
        push    ebx                                     ; 2E25 _ 53
        sub     esp, 20                                 ; 2E26 _ 83. EC, 14
        call    get_addr_gdt                            ; 2E29 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2E2E _ 89. 45, F0
        sub     esp, 8                                  ; 2E31 _ 83. EC, 08
        push    668                                     ; 2E34 _ 68, 0000029C
        push    dword [ebp+8H]                          ; 2E39 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2E3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E41 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2E44 _ A3, 000022A8(d)
        mov     dword [ebp-0CH], 0                      ; 2E49 _ C7. 45, F4, 00000000
        jmp     ?_172                                   ; 2E50 _ E9, 000000A0

?_171:  mov     ecx, dword [taskctl]                    ; 2E55 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 2E5B _ 8B. 55, F4
        mov     eax, edx                                ; 2E5E _ 89. D0
        add     eax, eax                                ; 2E60 _ 01. C0
        add     eax, edx                                ; 2E62 _ 01. D0
        lea     edx, [eax*4]                            ; 2E64 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2E6B _ 01. D0
        shl     eax, 3                                  ; 2E6D _ C1. E0, 03
        add     eax, ecx                                ; 2E70 _ 01. C8
        add     eax, 72                                 ; 2E72 _ 83. C0, 48
        mov     dword [eax], 0                          ; 2E75 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2E7B _ 8B. 45, F4
        add     eax, 7                                  ; 2E7E _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 2E81 _ 8B. 1D, 000022A8(d)
        lea     ecx, [eax*8]                            ; 2E87 _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2E8E _ 8B. 55, F4
        mov     eax, edx                                ; 2E91 _ 89. D0
        add     eax, eax                                ; 2E93 _ 01. C0
        add     eax, edx                                ; 2E95 _ 01. D0
        lea     edx, [eax*4]                            ; 2E97 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2E9E _ 01. D0
        shl     eax, 3                                  ; 2EA0 _ C1. E0, 03
        add     eax, ebx                                ; 2EA3 _ 01. D8
        add     eax, 68                                 ; 2EA5 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 2EA8 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 2EAA _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-0CH]                    ; 2EB0 _ 8B. 55, F4
        mov     eax, edx                                ; 2EB3 _ 89. D0
        add     eax, eax                                ; 2EB5 _ 01. C0
        add     eax, edx                                ; 2EB7 _ 01. D0
        lea     edx, [eax*4]                            ; 2EB9 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2EC0 _ 01. D0
        shl     eax, 3                                  ; 2EC2 _ C1. E0, 03
        add     eax, 80                                 ; 2EC5 _ 83. C0, 50
        add     eax, ecx                                ; 2EC8 _ 01. C8
        add     eax, 4                                  ; 2ECA _ 83. C0, 04
        mov     edx, eax                                ; 2ECD _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2ECF _ 8B. 45, F4
        add     eax, 7                                  ; 2ED2 _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 2ED5 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 2EDC _ 8B. 45, F0
        add     eax, ecx                                ; 2EDF _ 01. C8
        push    137                                     ; 2EE1 _ 68, 00000089
        push    edx                                     ; 2EE6 _ 52
        push    103                                     ; 2EE7 _ 6A, 67
        push    eax                                     ; 2EE9 _ 50
        call    set_segmdesc                            ; 2EEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EEF _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 2EF2 _ FF. 45, F4
?_172:  cmp     dword [ebp-0CH], 4                      ; 2EF5 _ 83. 7D, F4, 04
        jle     ?_171                                   ; 2EF9 _ 0F 8E, FFFFFF56
        mov     dword [ebp-0CH], 0                      ; 2EFF _ C7. 45, F4, 00000000
        jmp     ?_174                                   ; 2F06 _ EB, 11

?_173:  sub     esp, 12                                 ; 2F08 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 2F0B _ FF. 75, F4
        call    init_task_level                         ; 2F0E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F13 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 2F16 _ FF. 45, F4
?_174:  cmp     dword [ebp-0CH], 2                      ; 2F19 _ 83. 7D, F4, 02
        jle     ?_173                                   ; 2F1D _ 7E, E9
        call    task_alloc                              ; 2F1F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2F24 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2F27 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 2F2A _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 2F31 _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 2F34 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-14H]                    ; 2F3B _ 8B. 45, EC
        mov     dword [eax+0CH], 0                      ; 2F3E _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 2F45 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 2F48 _ FF. 75, EC
        call    task_add                                ; 2F4B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F50 _ 83. C4, 10
        call    task_switchsub                          ; 2F53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 2F58 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 2F5B _ 8B. 00
        sub     esp, 12                                 ; 2F5D _ 83. EC, 0C
        push    eax                                     ; 2F60 _ 50
        call    load_tr                                 ; 2F61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F66 _ 83. C4, 10
        call    timer_alloc                             ; 2F69 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 2F6E _ A3, 000022A4(d)
        mov     eax, dword [ebp-14H]                    ; 2F73 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 2F76 _ 8B. 40, 08
        mov     edx, eax                                ; 2F79 _ 89. C2
        mov     eax, dword [task_timer]                 ; 2F7B _ A1, 000022A4(d)
        sub     esp, 8                                  ; 2F80 _ 83. EC, 08
        push    edx                                     ; 2F83 _ 52
        push    eax                                     ; 2F84 _ 50
        call    timer_settime                           ; 2F85 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F8A _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 2F8D _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 2F90 _ 8B. 5D, FC
        leave                                           ; 2F93 _ C9
        ret                                             ; 2F94 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 2F95 _ 55
        mov     ebp, esp                                ; 2F96 _ 89. E5
        sub     esp, 16                                 ; 2F98 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2F9B _ C7. 45, FC, 00000000
        jmp     ?_177                                   ; 2FA2 _ E9, 000000FD

?_175:  mov     ecx, dword [taskctl]                    ; 2FA7 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 2FAD _ 8B. 55, FC
        mov     eax, edx                                ; 2FB0 _ 89. D0
        add     eax, eax                                ; 2FB2 _ 01. C0
        add     eax, edx                                ; 2FB4 _ 01. D0
        lea     edx, [eax*4]                            ; 2FB6 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2FBD _ 01. D0
        shl     eax, 3                                  ; 2FBF _ C1. E0, 03
        add     eax, ecx                                ; 2FC2 _ 01. C8
        add     eax, 72                                 ; 2FC4 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 2FC7 _ 8B. 00
        test    eax, eax                                ; 2FC9 _ 85. C0
        jne     ?_176                                   ; 2FCB _ 0F 85, 000000D0
        mov     ecx, dword [taskctl]                    ; 2FD1 _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 2FD7 _ 8B. 55, FC
        mov     eax, edx                                ; 2FDA _ 89. D0
        add     eax, eax                                ; 2FDC _ 01. C0
        add     eax, edx                                ; 2FDE _ 01. D0
        lea     edx, [eax*4]                            ; 2FE0 _ 8D. 14 85, 00000000
        add     eax, edx                                ; 2FE7 _ 01. D0
        shl     eax, 3                                  ; 2FE9 _ C1. E0, 03
        add     eax, 64                                 ; 2FEC _ 83. C0, 40
        add     eax, ecx                                ; 2FEF _ 01. C8
        add     eax, 4                                  ; 2FF1 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 2FF4 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 2FF7 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 2FFA _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 3001 _ 8B. 45, F8
        mov     dword [eax+34H], 514                    ; 3004 _ C7. 40, 34, 00000202
        mov     eax, dword [ebp-8H]                     ; 300B _ 8B. 45, F8
        mov     dword [eax+38H], 0                      ; 300E _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-8H]                     ; 3015 _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 3018 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 301F _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 3022 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 3029 _ 8B. 45, F8
        mov     dword [eax+44H], 0                      ; 302C _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 3033 _ 8B. 45, F8
        mov     dword [eax+4CH], 0                      ; 3036 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 303D _ 8B. 45, FC
        inc     eax                                     ; 3040 _ 40
        shl     eax, 9                                  ; 3041 _ C1. E0, 09
        mov     edx, eax                                ; 3044 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 3046 _ 8B. 45, F8
        mov     dword [eax+48H], edx                    ; 3049 _ 89. 50, 48
        mov     eax, dword [ebp-8H]                     ; 304C _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 304F _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-8H]                     ; 3056 _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 3059 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 3060 _ 8B. 45, F8
        mov     dword [eax+58H], 0                      ; 3063 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-8H]                     ; 306A _ 8B. 45, F8
        mov     dword [eax+64H], 0                      ; 306D _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-8H]                     ; 3074 _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 3077 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 307E _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 3081 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 3088 _ 8B. 45, F8
        mov     dword [eax+70H], 0                      ; 308B _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-8H]                     ; 3092 _ 8B. 45, F8
        mov     dword [eax+74H], 1073741824             ; 3095 _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-8H]                     ; 309C _ 8B. 45, F8
        jmp     ?_178                                   ; 309F _ EB, 12

?_176:  inc     dword [ebp-4H]                          ; 30A1 _ FF. 45, FC
?_177:  cmp     dword [ebp-4H], 4                       ; 30A4 _ 83. 7D, FC, 04
        jle     ?_175                                   ; 30A8 _ 0F 8E, FFFFFEF9
        mov     eax, 0                                  ; 30AE _ B8, 00000000
?_178:  leave                                           ; 30B3 _ C9
        ret                                             ; 30B4 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 30B5 _ 55
        mov     ebp, esp                                ; 30B6 _ 89. E5
        sub     esp, 8                                  ; 30B8 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 30BB _ 83. 7D, 0C, 00
        jns     ?_179                                   ; 30BF _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 30C1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30C4 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 30C7 _ 89. 45, 0C
?_179:  cmp     dword [ebp+10H], 0                      ; 30CA _ 83. 7D, 10, 00
        jle     ?_180                                   ; 30CE _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 30D0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 30D3 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 30D6 _ 89. 50, 08
?_180:  mov     eax, dword [ebp+8H]                     ; 30D9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30DC _ 8B. 40, 04
        cmp     eax, 2                                  ; 30DF _ 83. F8, 02
        jnz     ?_181                                   ; 30E2 _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 30E4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30E7 _ 8B. 40, 0C
        cmp     dword [ebp+0CH], eax                    ; 30EA _ 39. 45, 0C
        jz      ?_181                                   ; 30ED _ 74, 0E
        sub     esp, 12                                 ; 30EF _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 30F2 _ FF. 75, 08
        call    task_remove                             ; 30F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30FA _ 83. C4, 10
?_181:  mov     eax, dword [ebp+8H]                     ; 30FD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3100 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3103 _ 83. F8, 02
        jz      ?_182                                   ; 3106 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 3108 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 310B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 310E _ 89. 50, 0C
        sub     esp, 12                                 ; 3111 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3114 _ FF. 75, 08
        call    task_add                                ; 3117 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 311C _ 83. C4, 10
?_182:  mov     eax, dword [taskctl]                    ; 311F _ A1, 000022A8(d)
        mov     dword [eax+4H], 1                       ; 3124 _ C7. 40, 04, 00000001
        nop                                             ; 312B _ 90
        leave                                           ; 312C _ C9
        ret                                             ; 312D _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 312E _ 55
        mov     ebp, esp                                ; 312F _ 89. E5
        sub     esp, 24                                 ; 3131 _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 3134 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 313A _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 313F _ 8B. 10
        mov     eax, edx                                ; 3141 _ 89. D0
        shl     eax, 2                                  ; 3143 _ C1. E0, 02
        add     eax, edx                                ; 3146 _ 01. D0
        shl     eax, 2                                  ; 3148 _ C1. E0, 02
        add     eax, ecx                                ; 314B _ 01. C8
        add     eax, 8                                  ; 314D _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 3150 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3153 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3156 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3159 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 315C _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3160 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3163 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 3166 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3169 _ 8D. 50, 01
        mov     eax, dword [ebp-0CH]                    ; 316C _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 316F _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3172 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 3175 _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3178 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 317B _ 8B. 00
        cmp     edx, eax                                ; 317D _ 39. C2
        jnz     ?_183                                   ; 317F _ 75, 0A
        mov     eax, dword [ebp-0CH]                    ; 3181 _ 8B. 45, F4
        mov     dword [eax+4H], 0                       ; 3184 _ C7. 40, 04, 00000000
?_183:  mov     eax, dword [taskctl]                    ; 318B _ A1, 000022A8(d)
        mov     eax, dword [eax+4H]                     ; 3190 _ 8B. 40, 04
        test    eax, eax                                ; 3193 _ 85. C0
        jz      ?_184                                   ; 3195 _ 74, 24
        call    task_switchsub                          ; 3197 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 319C _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 31A2 _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 31A7 _ 8B. 10
        mov     eax, edx                                ; 31A9 _ 89. D0
        shl     eax, 2                                  ; 31AB _ C1. E0, 02
        add     eax, edx                                ; 31AE _ 01. D0
        shl     eax, 2                                  ; 31B0 _ C1. E0, 02
        add     eax, ecx                                ; 31B3 _ 01. C8
        add     eax, 8                                  ; 31B5 _ 83. C0, 08
        mov     dword [ebp-0CH], eax                    ; 31B8 _ 89. 45, F4
?_184:  mov     eax, dword [ebp-0CH]                    ; 31BB _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 31BE _ 8B. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 31C1 _ 8B. 45, F4
        mov     eax, dword [eax+edx*4+8H]               ; 31C4 _ 8B. 44 90, 08
        mov     dword [ebp-14H], eax                    ; 31C8 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 31CB _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 31CE _ 8B. 40, 08
        mov     edx, eax                                ; 31D1 _ 89. C2
        mov     eax, dword [task_timer]                 ; 31D3 _ A1, 000022A4(d)
        sub     esp, 8                                  ; 31D8 _ 83. EC, 08
        push    edx                                     ; 31DB _ 52
        push    eax                                     ; 31DC _ 50
        call    timer_settime                           ; 31DD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31E2 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 31E5 _ 8B. 45, EC
        cmp     eax, dword [ebp-10H]                    ; 31E8 _ 3B. 45, F0
        jz      ?_185                                   ; 31EB _ 74, 1A
        cmp     dword [ebp-14H], 0                      ; 31ED _ 83. 7D, EC, 00
        jz      ?_185                                   ; 31F1 _ 74, 14
        mov     eax, dword [ebp-14H]                    ; 31F3 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 31F6 _ 8B. 00
        sub     esp, 8                                  ; 31F8 _ 83. EC, 08
        push    eax                                     ; 31FB _ 50
        push    0                                       ; 31FC _ 6A, 00
        call    farjmp                                  ; 31FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3203 _ 83. C4, 10
        nop                                             ; 3206 _ 90
?_185:  nop                                             ; 3207 _ 90
        leave                                           ; 3208 _ C9
        ret                                             ; 3209 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 320A _ 55
        mov     ebp, esp                                ; 320B _ 89. E5
        sub     esp, 24                                 ; 320D _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 3210 _ C7. 45, F0, 00000000
        mov     dword [ebp-0CH], 0                      ; 3217 _ C7. 45, F4, 00000000
        mov     eax, dword [ebp+8H]                     ; 321E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3221 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3224 _ 83. F8, 02
        jnz     ?_186                                   ; 3227 _ 75, 52
        call    task_now                                ; 3229 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 322E _ 89. 45, F0
        sub     esp, 12                                 ; 3231 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3234 _ FF. 75, 08
        call    task_remove                             ; 3237 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 323C _ 83. C4, 10
        mov     dword [ebp-0CH], 1                      ; 323F _ C7. 45, F4, 00000001
        mov     eax, dword [ebp+8H]                     ; 3246 _ 8B. 45, 08
        cmp     eax, dword [ebp-10H]                    ; 3249 _ 3B. 45, F0
        jnz     ?_186                                   ; 324C _ 75, 2D
        call    task_switchsub                          ; 324E _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3253 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3258 _ 89. 45, F0
        mov     dword [ebp-0CH], 2                      ; 325B _ C7. 45, F4, 00000002
        cmp     dword [ebp-10H], 0                      ; 3262 _ 83. 7D, F0, 00
        jz      ?_186                                   ; 3266 _ 74, 13
        mov     eax, dword [ebp-10H]                    ; 3268 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 326B _ 8B. 00
        sub     esp, 8                                  ; 326D _ 83. EC, 08
        push    eax                                     ; 3270 _ 50
        push    0                                       ; 3271 _ 6A, 00
        call    farjmp                                  ; 3273 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3278 _ 83. C4, 10
?_186:  mov     eax, dword [ebp-0CH]                    ; 327B _ 8B. 45, F4
        leave                                           ; 327E _ C9
        ret                                             ; 327F _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3280 _ 55
        mov     ebp, esp                                ; 3281 _ 89. E5
        sub     esp, 16                                 ; 3283 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3286 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [taskctl]                    ; 328C _ A1, 000022A8(d)
        mov     edx, dword [eax]                        ; 3291 _ 8B. 10
        mov     eax, edx                                ; 3293 _ 89. D0
        shl     eax, 2                                  ; 3295 _ C1. E0, 02
        add     eax, edx                                ; 3298 _ 01. D0
        shl     eax, 2                                  ; 329A _ C1. E0, 02
        add     eax, ecx                                ; 329D _ 01. C8
        add     eax, 8                                  ; 329F _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 32A2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 32A5 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 32A8 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 32AB _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 32AE _ 8B. 44 90, 08
        leave                                           ; 32B2 _ C9
        ret                                             ; 32B3 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 32B4 _ 55
        mov     ebp, esp                                ; 32B5 _ 89. E5
        sub     esp, 16                                 ; 32B7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 32BA _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 32C0 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 32C3 _ 8B. 50, 0C
        mov     eax, edx                                ; 32C6 _ 89. D0
        shl     eax, 2                                  ; 32C8 _ C1. E0, 02
        add     eax, edx                                ; 32CB _ 01. D0
        shl     eax, 2                                  ; 32CD _ C1. E0, 02
        add     eax, ecx                                ; 32D0 _ 01. C8
        add     eax, 8                                  ; 32D2 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 32D5 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 32D8 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 32DB _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 32DD _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 32E0 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 32E3 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 32E7 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 32EA _ 8B. 00
        lea     edx, [eax+1H]                           ; 32EC _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 32EF _ 8B. 45, FC
        mov     dword [eax], edx                        ; 32F2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 32F4 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 32F7 _ C7. 40, 04, 00000002
        nop                                             ; 32FE _ 90
        leave                                           ; 32FF _ C9
        ret                                             ; 3300 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 3301 _ 55
        mov     ebp, esp                                ; 3302 _ 89. E5
        sub     esp, 16                                 ; 3304 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 3307 _ 8B. 0D, 000022A8(d)
        mov     eax, dword [ebp+8H]                     ; 330D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3310 _ 8B. 50, 0C
        mov     eax, edx                                ; 3313 _ 89. D0
        shl     eax, 2                                  ; 3315 _ C1. E0, 02
        add     eax, edx                                ; 3318 _ 01. D0
        shl     eax, 2                                  ; 331A _ C1. E0, 02
        add     eax, ecx                                ; 331D _ 01. C8
        add     eax, 8                                  ; 331F _ 83. C0, 08
        mov     dword [ebp-8H], eax                     ; 3322 _ 89. 45, F8
        mov     dword [ebp-4H], 0                       ; 3325 _ C7. 45, FC, 00000000
        jmp     ?_189                                   ; 332C _ EB, 22

?_187:  mov     eax, dword [ebp-8H]                     ; 332E _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3331 _ 8B. 55, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3334 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 3338 _ 39. 45, 08
        jnz     ?_188                                   ; 333B _ 75, 10
        mov     eax, dword [ebp-8H]                     ; 333D _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 3340 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], 0                 ; 3343 _ C7. 44 90, 08, 00000000
        jmp     ?_190                                   ; 334B _ EB, 0D

?_188:  inc     dword [ebp-4H]                          ; 334D _ FF. 45, FC
?_189:  mov     eax, dword [ebp-8H]                     ; 3350 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 3353 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 3355 _ 39. 45, FC
        jl      ?_187                                   ; 3358 _ 7C, D4
?_190:  mov     eax, dword [ebp-8H]                     ; 335A _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 335D _ 8B. 00
        lea     edx, [eax-1H]                           ; 335F _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 3362 _ 8B. 45, F8
        mov     dword [eax], edx                        ; 3365 _ 89. 10
        mov     eax, dword [ebp-8H]                     ; 3367 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 336A _ 8B. 40, 04
        cmp     dword [ebp-4H], eax                     ; 336D _ 39. 45, FC
        jge     ?_191                                   ; 3370 _ 7D, 0F
        mov     eax, dword [ebp-8H]                     ; 3372 _ 8B. 45, F8
        mov     eax, dword [eax+4H]                     ; 3375 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3378 _ 8D. 50, FF
        mov     eax, dword [ebp-8H]                     ; 337B _ 8B. 45, F8
        mov     dword [eax+4H], edx                     ; 337E _ 89. 50, 04
?_191:  mov     eax, dword [ebp-8H]                     ; 3381 _ 8B. 45, F8
        mov     edx, dword [eax+4H]                     ; 3384 _ 8B. 50, 04
        mov     eax, dword [ebp-8H]                     ; 3387 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 338A _ 8B. 00
        cmp     edx, eax                                ; 338C _ 39. C2
        jl      ?_192                                   ; 338E _ 7C, 0A
        mov     eax, dword [ebp-8H]                     ; 3390 _ 8B. 45, F8
        mov     dword [eax+4H], 0                       ; 3393 _ C7. 40, 04, 00000000
?_192:  mov     eax, dword [ebp+8H]                     ; 339A _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 339D _ C7. 40, 04, 00000001
        jmp     ?_194                                   ; 33A4 _ EB, 1A

?_193:  mov     eax, dword [ebp-4H]                     ; 33A6 _ 8B. 45, FC
        lea     edx, [eax+1H]                           ; 33A9 _ 8D. 50, 01
        mov     eax, dword [ebp-8H]                     ; 33AC _ 8B. 45, F8
        mov     ecx, dword [eax+edx*4+8H]               ; 33AF _ 8B. 4C 90, 08
        mov     eax, dword [ebp-8H]                     ; 33B3 _ 8B. 45, F8
        mov     edx, dword [ebp-4H]                     ; 33B6 _ 8B. 55, FC
        mov     dword [eax+edx*4+8H], ecx               ; 33B9 _ 89. 4C 90, 08
        inc     dword [ebp-4H]                          ; 33BD _ FF. 45, FC
?_194:  mov     eax, dword [ebp-8H]                     ; 33C0 _ 8B. 45, F8
        mov     eax, dword [eax]                        ; 33C3 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 33C5 _ 39. 45, FC
        jl      ?_193                                   ; 33C8 _ 7C, DC
        nop                                             ; 33CA _ 90
        leave                                           ; 33CB _ C9
        ret                                             ; 33CC _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 33CD _ 55
        mov     ebp, esp                                ; 33CE _ 89. E5
        sub     esp, 16                                 ; 33D0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 33D3 _ C7. 45, FC, 00000000
        jmp     ?_196                                   ; 33DA _ EB, 21

?_195:  mov     ecx, dword [taskctl]                    ; 33DC _ 8B. 0D, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 33E2 _ 8B. 55, FC
        mov     eax, edx                                ; 33E5 _ 89. D0
        shl     eax, 2                                  ; 33E7 _ C1. E0, 02
        add     eax, edx                                ; 33EA _ 01. D0
        shl     eax, 2                                  ; 33EC _ C1. E0, 02
        add     eax, ecx                                ; 33EF _ 01. C8
        add     eax, 8                                  ; 33F1 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 33F4 _ 8B. 00
        test    eax, eax                                ; 33F6 _ 85. C0
        jg      ?_197                                   ; 33F8 _ 7F, 0B
        inc     dword [ebp-4H]                          ; 33FA _ FF. 45, FC
?_196:  cmp     dword [ebp-4H], 2                       ; 33FD _ 83. 7D, FC, 02
        jle     ?_195                                   ; 3401 _ 7E, D9
        jmp     ?_198                                   ; 3403 _ EB, 01

?_197:  nop                                             ; 3405 _ 90
?_198:  mov     eax, dword [taskctl]                    ; 3406 _ A1, 000022A8(d)
        mov     edx, dword [ebp-4H]                     ; 340B _ 8B. 55, FC
        mov     dword [eax], edx                        ; 340E _ 89. 10
        mov     eax, dword [taskctl]                    ; 3410 _ A1, 000022A8(d)
        mov     dword [eax+4H], 0                       ; 3415 _ C7. 40, 04, 00000000
        nop                                             ; 341C _ 90
        leave                                           ; 341D _ C9
        ret                                             ; 341E _ C3
; task_switchsub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_199:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_200:                                                  ; byte
        db 41H, 00H                                     ; 0008 _ A.

?_201:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 000A _ 3[sec].

?_202:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0011 _ console.

?_203:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0019 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0021 _ sk b.

?_204:                                                  ; byte
        db 42H, 00H                                     ; 0026 _ B.

?_205:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0028 _ page is:
        db 20H, 00H                                     ; 0030 _  .

?_206:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0032 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 003A _ L: .

?_207:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 003E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0046 _ H: .

?_208:                                                  ; byte
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
        db 32H, 33H, 30H, 2EH                           ; 0070 _ 230.

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0074 _ 0X

?_209:  db 00H                                          ; 0076 _ .

?_210:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1934:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1981:                                            ; byte
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

closebtn.2091:                                          ; byte
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

?_211:                                                  ; dword
        resb    2                                       ; 0004

?_212:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_213:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_214:  resd    1                                       ; 00EC

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

task_a.1855:                                            ; dword
        resd    4                                       ; 0250

tss_a.1854:                                             ; byte
        resb    128                                     ; 0260

tss_b.1853:                                             ; byte
        resb    104                                     ; 02E0

task_b.1839:                                            ; byte
        resb    12                                      ; 0348

str.2029:                                               ; byte
        resb    1                                       ; 0354

?_215:  resb    9                                       ; 0355

?_216:  resb    2                                       ; 035E

timerctl:                                               ; byte
        resd    1                                       ; 0360

?_217:                                                  ; byte
        resb    4                                       ; 0364

?_218:                                                  ; byte
        resb    4                                       ; 0368

?_219:                                                  ; byte
        resb    4                                       ; 036C

?_220:                                                  ; byte
        resb    7988                                    ; 0370

task_timer:                                             ; dword
        resd    1                                       ; 22A4

taskctl: resd   1                                       ; 22A8


