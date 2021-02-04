; Disassembly of file: ckernel.o
; Mon Feb  1 22:13:02 2021
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
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
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
        sub     esp, 96                                 ; 0005 _ 83. EC, 60
        sub     esp, 12                                 ; 0008 _ 83. EC, 0C
        push    bootInfo                                ; 000B _ 68, 00000000(d)
        call    initBootInfo                            ; 0010 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0015 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0018 _ A1, 00000000(d)
        mov     dword [ebp-24H], eax                    ; 001D _ 89. 45, DC
        mov     eax, dword [?_196]                      ; 0020 _ A1, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000011C(d)
        mov     ax, word [?_197]                        ; 002B _ 66: A1, 00000006(d)
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
        mov     dword [ebp-28H], eax                    ; 0057 _ 89. 45, D8
        sub     esp, 4                                  ; 005A _ 83. EC, 04
        push    10                                      ; 005D _ 6A, 0A
        push    timerinfo                               ; 005F _ 68, 000000F0(d)
        push    dword [ebp-28H]                         ; 0064 _ FF. 75, D8
        call    timer_init                              ; 0067 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006C _ 83. C4, 10
        sub     esp, 8                                  ; 006F _ 83. EC, 08
        push    100                                     ; 0072 _ 6A, 64
        push    dword [ebp-28H]                         ; 0074 _ FF. 75, D8
        call    timer_settime                           ; 0077 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007C _ 83. C4, 10
        call    timer_alloc                             ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0084 _ 89. 45, D4
        sub     esp, 4                                  ; 0087 _ 83. EC, 04
        push    2                                       ; 008A _ 6A, 02
        push    timerinfo                               ; 008C _ 68, 000000F0(d)
        push    dword [ebp-2CH]                         ; 0091 _ FF. 75, D4
        call    timer_init                              ; 0094 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0099 _ 83. C4, 10
        sub     esp, 8                                  ; 009C _ 83. EC, 08
        push    300                                     ; 009F _ 68, 0000012C
        push    dword [ebp-2CH]                         ; 00A4 _ FF. 75, D4
        call    timer_settime                           ; 00A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AC _ 83. C4, 10
        call    timer_alloc                             ; 00AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 00B4 _ 89. 45, D0
        sub     esp, 4                                  ; 00B7 _ 83. EC, 04
        push    1                                       ; 00BA _ 6A, 01
        push    timerinfo                               ; 00BC _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 00C1 _ FF. 75, D0
        call    timer_init                              ; 00C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00C9 _ 83. C4, 10
        sub     esp, 8                                  ; 00CC _ 83. EC, 08
        push    50                                      ; 00CF _ 6A, 32
        push    dword [ebp-30H]                         ; 00D1 _ FF. 75, D0
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
        mov     dword [ebp-34H], eax                    ; 011A _ 89. 45, CC
        call    get_adr_buffer                          ; 011D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0122 _ 89. 45, C8
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
        push    dword [ebp-24H]                         ; 0164 _ FF. 75, DC
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
        push    ?_185                                   ; 02B9 _ 68, 00000000(d)
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
        mov     dword [ebp-3CH], eax                    ; 031A _ 89. 45, C4
        call    get_addr_gdt                            ; 031D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 0322 _ 89. 45, C0
        mov     eax, dword [memman]                     ; 0325 _ A1, 00000000(d)
        sub     esp, 12                                 ; 032A _ 83. EC, 0C
        push    eax                                     ; 032D _ 50
        call    task_init                               ; 032E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0333 _ 83. C4, 10
        mov     dword [task_a.1844], eax                ; 0336 _ A3, 00000264(d)
        mov     eax, dword [task_a.1844]                ; 033B _ A1, 00000264(d)
        mov     dword [?_198], eax                      ; 0340 _ A3, 00000020(d)
        mov     dword [ebp-62H], 1802723700             ; 0345 _ C7. 45, 9E, 6B736174
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-5EH], 0                       ; 034C _ 66: C7. 45, A2, 0000
        mov     dword [ebp-14H], 0                      ; 0352 _ C7. 45, EC, 00000000
        mov     dword [ebp-14H], 0                      ; 0359 _ C7. 45, EC, 00000000
        jmp     ?_002                                   ; 0360 _ E9, 00000188

?_001:  mov     eax, dword [shtctl]                     ; 0365 _ A1, 00000244(d)
        sub     esp, 12                                 ; 036A _ 83. EC, 0C
        push    eax                                     ; 036D _ 50
        call    sheet_alloc                             ; 036E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0373 _ 83. C4, 10
        mov     edx, dword [ebp-14H]                    ; 0376 _ 8B. 55, EC
        mov     dword [ebp+edx*4-5CH], eax              ; 0379 _ 89. 44 95, A4
        mov     eax, dword [memman]                     ; 037D _ A1, 00000000(d)
        sub     esp, 8                                  ; 0382 _ 83. EC, 08
        push    7488                                    ; 0385 _ 68, 00001D40
        push    eax                                     ; 038A _ 50
        call    memman_alloc_4k                         ; 038B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0390 _ 83. C4, 10
        mov     dword [ebp-4CH], eax                    ; 0393 _ 89. 45, B4
        mov     eax, dword [ebp-14H]                    ; 0396 _ 8B. 45, EC
        add     eax, 98                                 ; 0399 _ 83. C0, 62
        mov     byte [ebp-4DH], al                      ; 039C _ 88. 45, B3
        mov     al, byte [ebp-4DH]                      ; 039F _ 8A. 45, B3
        mov     byte [ebp-5EH], al                      ; 03A2 _ 88. 45, A2
        mov     eax, dword [ebp-14H]                    ; 03A5 _ 8B. 45, EC
        mov     eax, dword [ebp+eax*4-5CH]              ; 03A8 _ 8B. 44 85, A4
        sub     esp, 12                                 ; 03AC _ 83. EC, 0C
        push    -1                                      ; 03AF _ 6A, FF
        push    52                                      ; 03B1 _ 6A, 34
        push    144                                     ; 03B3 _ 68, 00000090
        push    dword [ebp-4CH]                         ; 03B8 _ FF. 75, B4
        push    eax                                     ; 03BB _ 50
        call    sheet_setbuf                            ; 03BC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 03C1 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 03C4 _ 8B. 45, EC
        mov     edx, dword [ebp+eax*4-5CH]              ; 03C7 _ 8B. 54 85, A4
        mov     eax, dword [shtctl]                     ; 03CB _ A1, 00000244(d)
        sub     esp, 4                                  ; 03D0 _ 83. EC, 04
        lea     ecx, [ebp-62H]                          ; 03D3 _ 8D. 4D, 9E
        push    ecx                                     ; 03D6 _ 51
        push    edx                                     ; 03D7 _ 52
        push    eax                                     ; 03D8 _ 50
        call    make_window8                            ; 03D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DE _ 83. C4, 10
        call    task_alloc                              ; 03E1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 03E6 _ 8B. 55, EC
        mov     dword [task_b.1828+edx*4], eax          ; 03E9 _ 89. 04 95, 00000268(d)
        mov     eax, dword [ebp-14H]                    ; 03F0 _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 03F3 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+6CH], 0                      ; 03FA _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0401 _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0404 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+70H], 1073741824             ; 040B _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-3CH]                    ; 0412 _ 8B. 45, C4
        neg     eax                                     ; 0415 _ F7. D8
        lea     edx, [task_b_main+eax]                  ; 0417 _ 8D. 90, 00000000(d)
        mov     eax, dword [ebp-14H]                    ; 041D _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0420 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+2CH], edx                    ; 0427 _ 89. 50, 2C
        mov     eax, dword [ebp-14H]                    ; 042A _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 042D _ 8B. 04 85, 00000268(d)
        mov     dword [eax+54H], 0                      ; 0434 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-14H]                    ; 043B _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 043E _ 8B. 04 85, 00000268(d)
        mov     dword [eax+58H], 8                      ; 0445 _ C7. 40, 58, 00000008
        mov     eax, dword [ebp-14H]                    ; 044C _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 044F _ 8B. 04 85, 00000268(d)
        mov     dword [eax+5CH], 32                     ; 0456 _ C7. 40, 5C, 00000020
        mov     eax, dword [ebp-14H]                    ; 045D _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0460 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+60H], 24                     ; 0467 _ C7. 40, 60, 00000018
        mov     eax, dword [ebp-14H]                    ; 046E _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0471 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+64H], 0                      ; 0478 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-14H]                    ; 047F _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0482 _ 8B. 04 85, 00000268(d)
        mov     dword [eax+68H], 16                     ; 0489 _ C7. 40, 68, 00000010
        mov     eax, dword [ebp-14H]                    ; 0490 _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 0493 _ 8B. 04 85, 00000268(d)
        mov     edx, dword [eax+44H]                    ; 049A _ 8B. 50, 44
        mov     eax, dword [ebp-14H]                    ; 049D _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 04A0 _ 8B. 04 85, 00000268(d)
        sub     edx, 8                                  ; 04A7 _ 83. EA, 08
        mov     dword [eax+44H], edx                    ; 04AA _ 89. 50, 44
        mov     eax, dword [ebp-14H]                    ; 04AD _ 8B. 45, EC
        mov     edx, dword [ebp+eax*4-5CH]              ; 04B0 _ 8B. 54 85, A4
        mov     eax, dword [ebp-14H]                    ; 04B4 _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 04B7 _ 8B. 04 85, 00000268(d)
        mov     eax, dword [eax+44H]                    ; 04BE _ 8B. 40, 44
        add     eax, 4                                  ; 04C1 _ 83. C0, 04
        mov     dword [eax], edx                        ; 04C4 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 04C6 _ 8B. 45, EC
        lea     edx, [eax+1H]                           ; 04C9 _ 8D. 50, 01
        mov     eax, edx                                ; 04CC _ 89. D0
        shl     eax, 2                                  ; 04CE _ C1. E0, 02
        add     edx, eax                                ; 04D1 _ 01. C2
        mov     eax, dword [ebp-14H]                    ; 04D3 _ 8B. 45, EC
        mov     eax, dword [task_b.1828+eax*4]          ; 04D6 _ 8B. 04 85, 00000268(d)
        sub     esp, 8                                  ; 04DD _ 83. EC, 08
        push    edx                                     ; 04E0 _ 52
        push    eax                                     ; 04E1 _ 50
        call    task_run                                ; 04E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04E7 _ 83. C4, 10
        inc     dword [ebp-14H]                         ; 04EA _ FF. 45, EC
?_002:  cmp     dword [ebp-14H], 1                      ; 04ED _ 83. 7D, EC, 01
        jle     ?_001                                   ; 04F1 _ 0F 8E, FFFFFE6E
        mov     edx, dword [ebp-5CH]                    ; 04F7 _ 8B. 55, A4
        mov     eax, dword [shtctl]                     ; 04FA _ A1, 00000244(d)
        push    28                                      ; 04FF _ 6A, 1C
        push    16                                      ; 0501 _ 6A, 10
        push    edx                                     ; 0503 _ 52
        push    eax                                     ; 0504 _ 50
        call    sheet_slide                             ; 0505 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 050A _ 83. C4, 10
        mov     edx, dword [ebp-5CH]                    ; 050D _ 8B. 55, A4
        mov     eax, dword [shtctl]                     ; 0510 _ A1, 00000244(d)
        sub     esp, 4                                  ; 0515 _ 83. EC, 04
        push    1                                       ; 0518 _ 6A, 01
        push    edx                                     ; 051A _ 52
        push    eax                                     ; 051B _ 50
        call    sheet_updown                            ; 051C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0521 _ 83. C4, 10
        mov     edx, dword [ebp-58H]                    ; 0524 _ 8B. 55, A8
        mov     eax, dword [shtctl]                     ; 0527 _ A1, 00000244(d)
        push    28                                      ; 052C _ 6A, 1C
        push    160                                     ; 052E _ 68, 000000A0
        push    edx                                     ; 0533 _ 52
        push    eax                                     ; 0534 _ 50
        call    sheet_slide                             ; 0535 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 053A _ 83. C4, 10
        mov     edx, dword [ebp-58H]                    ; 053D _ 8B. 55, A8
        mov     eax, dword [shtctl]                     ; 0540 _ A1, 00000244(d)
        sub     esp, 4                                  ; 0545 _ 83. EC, 04
        push    1                                       ; 0548 _ 6A, 01
        push    edx                                     ; 054A _ 52
        push    eax                                     ; 054B _ 50
        call    sheet_updown                            ; 054C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0551 _ 83. C4, 10
        mov     dword [ebp-44H], 0                      ; 0554 _ C7. 45, BC, 00000000
        mov     dword [ebp-18H], 0                      ; 055B _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0562 _ C7. 45, EC, 00000000
        mov     dword [ebp-1CH], 0                      ; 0569 _ C7. 45, E4, 00000000
        mov     dword [ebp-20H], 0                      ; 0570 _ C7. 45, E0, 00000000
?_003:  call    io_cli                                  ; 0577 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 057C _ 83. EC, 0C
        push    keyinfo                                 ; 057F _ 68, 00000008(d)
        call    fifo8_status                            ; 0584 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0589 _ 83. C4, 10
        mov     ebx, eax                                ; 058C _ 89. C3
        sub     esp, 12                                 ; 058E _ 83. EC, 0C
        push    mouseinfo                               ; 0591 _ 68, 00000024(d)
        call    fifo8_status                            ; 0596 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 059B _ 83. C4, 10
        add     ebx, eax                                ; 059E _ 01. C3
        sub     esp, 12                                 ; 05A0 _ 83. EC, 0C
        push    timerinfo                               ; 05A3 _ 68, 000000F0(d)
        call    fifo8_status                            ; 05A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05AD _ 83. C4, 10
        add     eax, ebx                                ; 05B0 _ 01. D8
        test    eax, eax                                ; 05B2 _ 85. C0
        jnz     ?_004                                   ; 05B4 _ 75, 07
        call    io_sti                                  ; 05B6 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 05BB _ EB, BA

?_004:  sub     esp, 12                                 ; 05BD _ 83. EC, 0C
        push    keyinfo                                 ; 05C0 _ 68, 00000008(d)
        call    fifo8_status                            ; 05C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05CA _ 83. C4, 10
        test    eax, eax                                ; 05CD _ 85. C0
        je      ?_006                                   ; 05CF _ 0F 84, 00000186
        call    io_sti                                  ; 05D5 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 05DA _ 83. EC, 0C
        push    keyinfo                                 ; 05DD _ 68, 00000008(d)
        call    fifo8_get                               ; 05E2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05E7 _ 83. C4, 10
        mov     dword [ebp-44H], eax                    ; 05EA _ 89. 45, BC
        cmp     dword [ebp-44H], 28                     ; 05ED _ 83. 7D, BC, 1C
        jnz     ?_005                                   ; 05F1 _ 75, 5C
        mov     ebx, dword [xsize]                      ; 05F3 _ 8B. 1D, 0000011C(d)
        mov     ecx, dword [buf_back]                   ; 05F9 _ 8B. 0D, 00000124(d)
        mov     edx, dword [ebp-18H]                    ; 05FF _ 8B. 55, E8
        mov     eax, edx                                ; 0602 _ 89. D0
        shl     eax, 2                                  ; 0604 _ C1. E0, 02
        add     eax, edx                                ; 0607 _ 01. D0
        shl     eax, 2                                  ; 0609 _ C1. E0, 02
        mov     edx, eax                                ; 060C _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 060E _ 8B. 45, C8
        lea     esi, [edx+eax]                          ; 0611 _ 8D. 34 02
        mov     edx, dword [sht_back]                   ; 0614 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 061A _ A1, 00000244(d)
        sub     esp, 4                                  ; 061F _ 83. EC, 04
        push    7                                       ; 0622 _ 6A, 07
        push    ebx                                     ; 0624 _ 53
        push    dword [ebp-18H]                         ; 0625 _ FF. 75, E8
        push    ecx                                     ; 0628 _ 51
        push    esi                                     ; 0629 _ 56
        push    edx                                     ; 062A _ 52
        push    eax                                     ; 062B _ 50
        call    showMemoryInfo                          ; 062C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0631 _ 83. C4, 20
        inc     dword [ebp-18H]                         ; 0634 _ FF. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0637 _ 8B. 45, E8
        cmp     eax, dword [ebp-34H]                    ; 063A _ 3B. 45, CC
        jle     ?_003                                   ; 063D _ 0F 8E, FFFFFF34
        mov     dword [ebp-18H], 0                      ; 0643 _ C7. 45, E8, 00000000
        jmp     ?_003                                   ; 064A _ E9, FFFFFF28

?_005:  mov     eax, dword [ebp-44H]                    ; 064F _ 8B. 45, BC
        add     eax, keytable                           ; 0652 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 0657 _ 8A. 00
        test    al, al                                  ; 0659 _ 84. C0
        je      ?_003                                   ; 065B _ 0F 84, FFFFFF16
        cmp     dword [ebp-0CH], 143                    ; 0661 _ 81. 7D, F4, 0000008F
        jg      ?_003                                   ; 0668 _ 0F 8F, FFFFFF09
        mov     eax, dword [ebp-0CH]                    ; 066E _ 8B. 45, F4
        lea     ecx, [eax+7H]                           ; 0671 _ 8D. 48, 07
        mov     eax, dword [shtMsgBox]                  ; 0674 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0679 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 067C _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0681 _ 8B. 00
        sub     esp, 4                                  ; 0683 _ 83. EC, 04
        push    43                                      ; 0686 _ 6A, 2B
        push    ecx                                     ; 0688 _ 51
        push    28                                      ; 0689 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 068B _ FF. 75, F4
        push    7                                       ; 068E _ 6A, 07
        push    edx                                     ; 0690 _ 52
        push    eax                                     ; 0691 _ 50
        call    boxfill8                                ; 0692 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0697 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 069A _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 069D _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 06A0 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 06A6 _ A1, 00000244(d)
        sub     esp, 8                                  ; 06AB _ 83. EC, 08
        push    44                                      ; 06AE _ 6A, 2C
        push    ecx                                     ; 06B0 _ 51
        push    28                                      ; 06B1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06B3 _ FF. 75, F4
        push    edx                                     ; 06B6 _ 52
        push    eax                                     ; 06B7 _ 50
        call    sheet_refresh                           ; 06B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06BD _ 83. C4, 20
        mov     eax, dword [ebp-44H]                    ; 06C0 _ 8B. 45, BC
        add     eax, keytable                           ; 06C3 _ 05, 00000020(d)
        mov     al, byte [eax]                          ; 06C8 _ 8A. 00
        mov     byte [ebp-64H], al                      ; 06CA _ 88. 45, 9C
        mov     byte [ebp-63H], 0                       ; 06CD _ C6. 45, 9D, 00
        mov     edx, dword [shtMsgBox]                  ; 06D1 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 06D7 _ A1, 00000244(d)
        sub     esp, 8                                  ; 06DC _ 83. EC, 08
        lea     ecx, [ebp-64H]                          ; 06DF _ 8D. 4D, 9C
        push    ecx                                     ; 06E2 _ 51
        push    0                                       ; 06E3 _ 6A, 00
        push    28                                      ; 06E5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06E7 _ FF. 75, F4
        push    edx                                     ; 06EA _ 52
        push    eax                                     ; 06EB _ 50
        call    showString                              ; 06EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06F1 _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 06F4 _ 83. 45, F4, 08
        mov     dword [ebp-20H], 1                      ; 06F8 _ C7. 45, E0, 00000001
        mov     eax, dword [ebp-0CH]                    ; 06FF _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 0702 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 0705 _ 8B. 45, F0
        movzx   ecx, al                                 ; 0708 _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 070B _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 0710 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 0713 _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 0718 _ 8B. 00
        sub     esp, 4                                  ; 071A _ 83. EC, 04
        push    43                                      ; 071D _ 6A, 2B
        push    ebx                                     ; 071F _ 53
        push    28                                      ; 0720 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0722 _ FF. 75, F4
        push    ecx                                     ; 0725 _ 51
        push    edx                                     ; 0726 _ 52
        push    eax                                     ; 0727 _ 50
        call    boxfill8                                ; 0728 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 072D _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0730 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 0733 _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 0736 _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 073C _ A1, 00000244(d)
        sub     esp, 8                                  ; 0741 _ 83. EC, 08
        push    44                                      ; 0744 _ 6A, 2C
        push    ecx                                     ; 0746 _ 51
        push    28                                      ; 0747 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0749 _ FF. 75, F4
        push    edx                                     ; 074C _ 52
        push    eax                                     ; 074D _ 50
        call    sheet_refresh                           ; 074E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0753 _ 83. C4, 20
        jmp     ?_003                                   ; 0756 _ E9, FFFFFE1C

?_006:  sub     esp, 12                                 ; 075B _ 83. EC, 0C
        push    mouseinfo                               ; 075E _ 68, 00000024(d)
        call    fifo8_status                            ; 0763 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0768 _ 83. C4, 10
        test    eax, eax                                ; 076B _ 85. C0
        jz      ?_007                                   ; 076D _ 74, 24
        mov     ecx, dword [sht_mouse]                  ; 076F _ 8B. 0D, 0000024C(d)
        mov     edx, dword [sht_back]                   ; 0775 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 077B _ A1, 00000244(d)
        sub     esp, 4                                  ; 0780 _ 83. EC, 04
        push    ecx                                     ; 0783 _ 51
        push    edx                                     ; 0784 _ 52
        push    eax                                     ; 0785 _ 50
        call    show_mouse_info                         ; 0786 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078B _ 83. C4, 10
        jmp     ?_003                                   ; 078E _ E9, FFFFFDE4

?_007:  sub     esp, 12                                 ; 0793 _ 83. EC, 0C
        push    timerinfo                               ; 0796 _ 68, 000000F0(d)
        call    fifo8_status                            ; 079B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07A0 _ 83. C4, 10
        test    eax, eax                                ; 07A3 _ 85. C0
        je      ?_003                                   ; 07A5 _ 0F 84, FFFFFDCC
        call    io_sti                                  ; 07AB _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 07B0 _ 83. EC, 0C
        push    timerinfo                               ; 07B3 _ 68, 000000F0(d)
        call    fifo8_get                               ; 07B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07BD _ 83. C4, 10
        mov     dword [ebp-48H], eax                    ; 07C0 _ 89. 45, B8
        cmp     dword [ebp-48H], 10                     ; 07C3 _ 83. 7D, B8, 0A
        jnz     ?_008                                   ; 07C7 _ 75, 6F
        mov     edx, dword [sht_back]                   ; 07C9 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 07CF _ A1, 00000244(d)
        sub     esp, 8                                  ; 07D4 _ 83. EC, 08
        push    ?_186                                   ; 07D7 _ 68, 00000008(d)
        push    7                                       ; 07DC _ 6A, 07
        push    144                                     ; 07DE _ 68, 00000090
        push    dword [ebp-1CH]                         ; 07E3 _ FF. 75, E4
        push    edx                                     ; 07E6 _ 52
        push    eax                                     ; 07E7 _ 50
        call    showString                              ; 07E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 07ED _ 83. C4, 20
        sub     esp, 8                                  ; 07F0 _ 83. EC, 08
        push    100                                     ; 07F3 _ 6A, 64
        push    dword [ebp-28H]                         ; 07F5 _ FF. 75, D8
        call    timer_settime                           ; 07F8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07FD _ 83. C4, 10
        add     dword [ebp-1CH], 8                      ; 0800 _ 83. 45, E4, 08
        cmp     dword [ebp-1CH], 40                     ; 0804 _ 83. 7D, E4, 28
        jle     ?_003                                   ; 0808 _ 0F 8E, FFFFFD69
        cmp     dword [ebp-20H], 0                      ; 080E _ 83. 7D, E0, 00
        jne     ?_003                                   ; 0812 _ 0F 85, FFFFFD5F
        call    io_cli                                  ; 0818 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1844]                ; 081D _ A1, 00000264(d)
        sub     esp, 12                                 ; 0822 _ 83. EC, 0C
        push    eax                                     ; 0825 _ 50
        call    task_sleep                              ; 0826 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 082B _ 83. C4, 10
        call    io_sti                                  ; 082E _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 0833 _ E9, FFFFFD3F

?_008:  cmp     dword [ebp-48H], 2                      ; 0838 _ 83. 7D, B8, 02
        jnz     ?_009                                   ; 083C _ 75, 28
        mov     edx, dword [sht_back]                   ; 083E _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 0844 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0849 _ 83. EC, 08
        push    ?_187                                   ; 084C _ 68, 0000000A(d)
        push    7                                       ; 0851 _ 6A, 07
        push    32                                      ; 0853 _ 6A, 20
        push    0                                       ; 0855 _ 6A, 00
        push    edx                                     ; 0857 _ 52
        push    eax                                     ; 0858 _ 50
        call    showString                              ; 0859 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 085E _ 83. C4, 20
        jmp     ?_003                                   ; 0861 _ E9, FFFFFD11

?_009:  cmp     dword [ebp-48H], 0                      ; 0866 _ 83. 7D, B8, 00
        jz      ?_010                                   ; 086A _ 74, 1E
        sub     esp, 4                                  ; 086C _ 83. EC, 04
        push    0                                       ; 086F _ 6A, 00
        push    timerinfo                               ; 0871 _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0876 _ FF. 75, D0
        call    timer_init                              ; 0879 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 087E _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 0881 _ C7. 45, F0, 00000000
        jmp     ?_011                                   ; 0888 _ EB, 1C

?_010:  sub     esp, 4                                  ; 088A _ 83. EC, 04
        push    1                                       ; 088D _ 6A, 01
        push    timerinfo                               ; 088F _ 68, 000000F0(d)
        push    dword [ebp-30H]                         ; 0894 _ FF. 75, D0
        call    timer_init                              ; 0897 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 089C _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 089F _ C7. 45, F0, 00000007
?_011:  sub     esp, 8                                  ; 08A6 _ 83. EC, 08
        push    50                                      ; 08A9 _ 6A, 32
        push    dword [ebp-30H]                         ; 08AB _ FF. 75, D0
        call    timer_settime                           ; 08AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08B3 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 08B6 _ 8B. 45, F4
        lea     ebx, [eax+7H]                           ; 08B9 _ 8D. 58, 07
        mov     eax, dword [ebp-10H]                    ; 08BC _ 8B. 45, F0
        movzx   ecx, al                                 ; 08BF _ 0F B6. C8
        mov     eax, dword [shtMsgBox]                  ; 08C2 _ A1, 00000240(d)
        mov     edx, dword [eax+4H]                     ; 08C7 _ 8B. 50, 04
        mov     eax, dword [shtMsgBox]                  ; 08CA _ A1, 00000240(d)
        mov     eax, dword [eax]                        ; 08CF _ 8B. 00
        sub     esp, 4                                  ; 08D1 _ 83. EC, 04
        push    43                                      ; 08D4 _ 6A, 2B
        push    ebx                                     ; 08D6 _ 53
        push    28                                      ; 08D7 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 08D9 _ FF. 75, F4
        push    ecx                                     ; 08DC _ 51
        push    edx                                     ; 08DD _ 52
        push    eax                                     ; 08DE _ 50
        call    boxfill8                                ; 08DF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08E4 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 08E7 _ 8B. 45, F4
        lea     ecx, [eax+8H]                           ; 08EA _ 8D. 48, 08
        mov     edx, dword [shtMsgBox]                  ; 08ED _ 8B. 15, 00000240(d)
        mov     eax, dword [shtctl]                     ; 08F3 _ A1, 00000244(d)
        sub     esp, 8                                  ; 08F8 _ 83. EC, 08
        push    44                                      ; 08FB _ 6A, 2C
        push    ecx                                     ; 08FD _ 51
        push    28                                      ; 08FE _ 6A, 1C
        push    dword [ebp-0CH]                         ; 0900 _ FF. 75, F4
        push    edx                                     ; 0903 _ 52
        push    eax                                     ; 0904 _ 50
        call    sheet_refresh                           ; 0905 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 090A _ 83. C4, 20
        jmp     ?_003                                   ; 090D _ E9, FFFFFC65
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0912 _ 55
        mov     ebp, esp                                ; 0913 _ 89. E5
        sub     esp, 72                                 ; 0915 _ 83. EC, 48
        mov     edx, dword [sht_back]                   ; 0918 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 091E _ A1, 00000244(d)
        sub     esp, 8                                  ; 0923 _ 83. EC, 08
        push    ?_188                                   ; 0926 _ 68, 00000011(d)
        push    7                                       ; 092B _ 6A, 07
        push    160                                     ; 092D _ 68, 000000A0
        push    0                                       ; 0932 _ 6A, 00
        push    edx                                     ; 0934 _ 52
        push    eax                                     ; 0935 _ 50
        call    showString                              ; 0936 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 093B _ 83. C4, 20
        mov     dword [ebp-14H], 0                      ; 093E _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 0945 _ C7. 45, E8, 00000000
        push    0                                       ; 094C _ 6A, 00
        lea     eax, [ebp-40H]                          ; 094E _ 8D. 45, C0
        push    eax                                     ; 0951 _ 50
        push    8                                       ; 0952 _ 6A, 08
        lea     eax, [ebp-38H]                          ; 0954 _ 8D. 45, C8
        push    eax                                     ; 0957 _ 50
        call    fifo8_init                              ; 0958 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 095D _ 83. C4, 10
        call    timer_alloc                             ; 0960 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0965 _ 89. 45, EC
        sub     esp, 4                                  ; 0968 _ 83. EC, 04
        push    123                                     ; 096B _ 6A, 7B
        lea     eax, [ebp-38H]                          ; 096D _ 8D. 45, C8
        push    eax                                     ; 0970 _ 50
        push    dword [ebp-14H]                         ; 0971 _ FF. 75, EC
        call    timer_init                              ; 0974 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0979 _ 83. C4, 10
        sub     esp, 8                                  ; 097C _ 83. EC, 08
        push    100                                     ; 097F _ 6A, 64
        push    dword [ebp-14H]                         ; 0981 _ FF. 75, EC
        call    timer_settime                           ; 0984 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0989 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 098C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 0993 _ C7. 45, F0, 00000000
?_012:  inc     dword [ebp-0CH]                         ; 099A _ FF. 45, F4
        call    io_cli                                  ; 099D _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 09A2 _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 09A5 _ 8D. 45, C8
        push    eax                                     ; 09A8 _ 50
        call    fifo8_status                            ; 09A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09AE _ 83. C4, 10
        test    eax, eax                                ; 09B1 _ 85. C0
        jnz     ?_013                                   ; 09B3 _ 75, 07
        call    io_sti                                  ; 09B5 _ E8, FFFFFFFC(rel)
        jmp     ?_012                                   ; 09BA _ EB, DE

?_013:  sub     esp, 12                                 ; 09BC _ 83. EC, 0C
        lea     eax, [ebp-38H]                          ; 09BF _ 8D. 45, C8
        push    eax                                     ; 09C2 _ 50
        call    fifo8_get                               ; 09C3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 09C8 _ 83. C4, 10
        mov     dword [ebp-18H], eax                    ; 09CB _ 89. 45, E8
        call    io_sti                                  ; 09CE _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 123                    ; 09D3 _ 83. 7D, E8, 7B
        jnz     ?_012                                   ; 09D7 _ 75, C1
        mov     edx, dword [sht_back]                   ; 09D9 _ 8B. 15, 00000248(d)
        mov     eax, dword [shtctl]                     ; 09DF _ A1, 00000244(d)
        sub     esp, 8                                  ; 09E4 _ 83. EC, 08
        push    ?_189                                   ; 09E7 _ 68, 0000001E(d)
        push    7                                       ; 09EC _ 6A, 07
        push    192                                     ; 09EE _ 68, 000000C0
        push    dword [ebp-10H]                         ; 09F3 _ FF. 75, F0
        push    edx                                     ; 09F6 _ 52
        push    eax                                     ; 09F7 _ 50
        call    showString                              ; 09F8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 09FD _ 83. C4, 20
        sub     esp, 8                                  ; 0A00 _ 83. EC, 08
        push    100                                     ; 0A03 _ 6A, 64
        push    dword [ebp-14H]                         ; 0A05 _ FF. 75, EC
        call    timer_settime                           ; 0A08 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A0D _ 83. C4, 10
        add     dword [ebp-10H], 8                      ; 0A10 _ 83. 45, F0, 08
        mov     eax, dword [ebp+8H]                     ; 0A14 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 0A17 _ 8B. 00
        sub     esp, 4                                  ; 0A19 _ 83. EC, 04
        push    44                                      ; 0A1C _ 6A, 2C
        push    104                                     ; 0A1E _ 6A, 68
        push    28                                      ; 0A20 _ 6A, 1C
        push    24                                      ; 0A22 _ 6A, 18
        push    8                                       ; 0A24 _ 6A, 08
        push    144                                     ; 0A26 _ 68, 00000090
        push    eax                                     ; 0A2B _ 50
        call    boxfill8                                ; 0A2C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A31 _ 83. C4, 20
        mov     eax, dword [shtctl]                     ; 0A34 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A39 _ 83. EC, 08
        push    44                                      ; 0A3C _ 6A, 2C
        push    104                                     ; 0A3E _ 6A, 68
        push    28                                      ; 0A40 _ 6A, 1C
        push    24                                      ; 0A42 _ 6A, 18
        push    dword [ebp+8H]                          ; 0A44 _ FF. 75, 08
        push    eax                                     ; 0A47 _ 50
        call    sheet_refresh                           ; 0A48 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A4D _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 0A50 _ 8B. 45, F4
        sub     esp, 12                                 ; 0A53 _ 83. EC, 0C
        push    eax                                     ; 0A56 _ 50
        call    intToHexStr                             ; 0A57 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A5C _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0A5F _ 89. 45, E4
        mov     eax, dword [shtctl]                     ; 0A62 _ A1, 00000244(d)
        sub     esp, 8                                  ; 0A67 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0A6A _ FF. 75, E4
        push    7                                       ; 0A6D _ 6A, 07
        push    28                                      ; 0A6F _ 6A, 1C
        push    24                                      ; 0A71 _ 6A, 18
        push    dword [ebp+8H]                          ; 0A73 _ FF. 75, 08
        push    eax                                     ; 0A76 _ 50
        call    showString                              ; 0A77 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A7C _ 83. C4, 20
        jmp     ?_012                                   ; 0A7F _ E9, FFFFFF16
; task_b_main End of function

init_screen8:; Function begin
        push    ebp                                     ; 0A84 _ 55
        mov     ebp, esp                                ; 0A85 _ 89. E5
        push    ebx                                     ; 0A87 _ 53
        sub     esp, 4                                  ; 0A88 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 0A8B _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0A8E _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0A91 _ 8B. 45, 0C
        dec     eax                                     ; 0A94 _ 48
        sub     esp, 4                                  ; 0A95 _ 83. EC, 04
        push    edx                                     ; 0A98 _ 52
        push    eax                                     ; 0A99 _ 50
        push    0                                       ; 0A9A _ 6A, 00
        push    0                                       ; 0A9C _ 6A, 00
        push    14                                      ; 0A9E _ 6A, 0E
        push    dword [ebp+0CH]                         ; 0AA0 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0AA3 _ FF. 75, 08
        call    boxfill8                                ; 0AA6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AAB _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AAE _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0AB1 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0AB4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AB7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0ABA _ 8B. 45, 10
        sub     eax, 28                                 ; 0ABD _ 83. E8, 1C
        sub     esp, 4                                  ; 0AC0 _ 83. EC, 04
        push    ecx                                     ; 0AC3 _ 51
        push    edx                                     ; 0AC4 _ 52
        push    eax                                     ; 0AC5 _ 50
        push    0                                       ; 0AC6 _ 6A, 00
        push    8                                       ; 0AC8 _ 6A, 08
        push    dword [ebp+0CH]                         ; 0ACA _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0ACD _ FF. 75, 08
        call    boxfill8                                ; 0AD0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AD5 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0AD8 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0ADB _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0ADE _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AE1 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AE4 _ 8B. 45, 10
        sub     eax, 27                                 ; 0AE7 _ 83. E8, 1B
        sub     esp, 4                                  ; 0AEA _ 83. EC, 04
        push    ecx                                     ; 0AED _ 51
        push    edx                                     ; 0AEE _ 52
        push    eax                                     ; 0AEF _ 50
        push    0                                       ; 0AF0 _ 6A, 00
        push    7                                       ; 0AF2 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0AF4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0AF7 _ FF. 75, 08
        call    boxfill8                                ; 0AFA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AFF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B02 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B05 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B08 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B0B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B0E _ 8B. 45, 10
        sub     eax, 26                                 ; 0B11 _ 83. E8, 1A
        sub     esp, 4                                  ; 0B14 _ 83. EC, 04
        push    ecx                                     ; 0B17 _ 51
        push    edx                                     ; 0B18 _ 52
        push    eax                                     ; 0B19 _ 50
        push    0                                       ; 0B1A _ 6A, 00
        push    8                                       ; 0B1C _ 6A, 08
        push    dword [ebp+0CH]                         ; 0B1E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B21 _ FF. 75, 08
        call    boxfill8                                ; 0B24 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B29 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B2C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B2F _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B32 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B35 _ 83. E8, 18
        sub     esp, 4                                  ; 0B38 _ 83. EC, 04
        push    edx                                     ; 0B3B _ 52
        push    59                                      ; 0B3C _ 6A, 3B
        push    eax                                     ; 0B3E _ 50
        push    3                                       ; 0B3F _ 6A, 03
        push    7                                       ; 0B41 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B43 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B46 _ FF. 75, 08
        call    boxfill8                                ; 0B49 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B4E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B51 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B54 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B57 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B5A _ 83. E8, 18
        sub     esp, 4                                  ; 0B5D _ 83. EC, 04
        push    edx                                     ; 0B60 _ 52
        push    2                                       ; 0B61 _ 6A, 02
        push    eax                                     ; 0B63 _ 50
        push    2                                       ; 0B64 _ 6A, 02
        push    7                                       ; 0B66 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0B68 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B6B _ FF. 75, 08
        call    boxfill8                                ; 0B6E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B73 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B76 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0B79 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0B7C _ 8B. 45, 10
        sub     eax, 4                                  ; 0B7F _ 83. E8, 04
        sub     esp, 4                                  ; 0B82 _ 83. EC, 04
        push    edx                                     ; 0B85 _ 52
        push    59                                      ; 0B86 _ 6A, 3B
        push    eax                                     ; 0B88 _ 50
        push    3                                       ; 0B89 _ 6A, 03
        push    15                                      ; 0B8B _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0B8D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0B90 _ FF. 75, 08
        call    boxfill8                                ; 0B93 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B98 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0B9B _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0B9E _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0BA1 _ 8B. 45, 10
        sub     eax, 23                                 ; 0BA4 _ 83. E8, 17
        sub     esp, 4                                  ; 0BA7 _ 83. EC, 04
        push    edx                                     ; 0BAA _ 52
        push    59                                      ; 0BAB _ 6A, 3B
        push    eax                                     ; 0BAD _ 50
        push    59                                      ; 0BAE _ 6A, 3B
        push    15                                      ; 0BB0 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0BB2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BB5 _ FF. 75, 08
        call    boxfill8                                ; 0BB8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BBD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BC0 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0BC3 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0BC6 _ 8B. 45, 10
        sub     eax, 3                                  ; 0BC9 _ 83. E8, 03
        sub     esp, 4                                  ; 0BCC _ 83. EC, 04
        push    edx                                     ; 0BCF _ 52
        push    59                                      ; 0BD0 _ 6A, 3B
        push    eax                                     ; 0BD2 _ 50
        push    2                                       ; 0BD3 _ 6A, 02
        push    0                                       ; 0BD5 _ 6A, 00
        push    dword [ebp+0CH]                         ; 0BD7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BDA _ FF. 75, 08
        call    boxfill8                                ; 0BDD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BE2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0BE5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0BE8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0BEB _ 8B. 45, 10
        sub     eax, 24                                 ; 0BEE _ 83. E8, 18
        sub     esp, 4                                  ; 0BF1 _ 83. EC, 04
        push    edx                                     ; 0BF4 _ 52
        push    60                                      ; 0BF5 _ 6A, 3C
        push    eax                                     ; 0BF7 _ 50
        push    60                                      ; 0BF8 _ 6A, 3C
        push    0                                       ; 0BFA _ 6A, 00
        push    dword [ebp+0CH]                         ; 0BFC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0BFF _ FF. 75, 08
        call    boxfill8                                ; 0C02 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C07 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C0A _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0C0D _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0C10 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C13 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C16 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C19 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0C1C _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C1F _ 83. E8, 2F
        sub     esp, 4                                  ; 0C22 _ 83. EC, 04
        push    ebx                                     ; 0C25 _ 53
        push    ecx                                     ; 0C26 _ 51
        push    edx                                     ; 0C27 _ 52
        push    eax                                     ; 0C28 _ 50
        push    15                                      ; 0C29 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C2B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C2E _ FF. 75, 08
        call    boxfill8                                ; 0C31 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C36 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C39 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0C3C _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0C3F _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0C42 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0C45 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0C48 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0C4B _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C4E _ 83. E8, 2F
        sub     esp, 4                                  ; 0C51 _ 83. EC, 04
        push    ebx                                     ; 0C54 _ 53
        push    ecx                                     ; 0C55 _ 51
        push    edx                                     ; 0C56 _ 52
        push    eax                                     ; 0C57 _ 50
        push    15                                      ; 0C58 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 0C5A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C5D _ FF. 75, 08
        call    boxfill8                                ; 0C60 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C65 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C68 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0C6B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0C6E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0C71 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0C74 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C77 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0C7A _ 8B. 45, 0C
        sub     eax, 47                                 ; 0C7D _ 83. E8, 2F
        sub     esp, 4                                  ; 0C80 _ 83. EC, 04
        push    ebx                                     ; 0C83 _ 53
        push    ecx                                     ; 0C84 _ 51
        push    edx                                     ; 0C85 _ 52
        push    eax                                     ; 0C86 _ 50
        push    7                                       ; 0C87 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0C89 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0C8C _ FF. 75, 08
        call    boxfill8                                ; 0C8F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0C94 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 0C97 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0C9A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0C9D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0CA0 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0CA3 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CA6 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0CA9 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0CAC _ 83. E8, 03
        sub     esp, 4                                  ; 0CAF _ 83. EC, 04
        push    ebx                                     ; 0CB2 _ 53
        push    ecx                                     ; 0CB3 _ 51
        push    edx                                     ; 0CB4 _ 52
        push    eax                                     ; 0CB5 _ 50
        push    7                                       ; 0CB6 _ 6A, 07
        push    dword [ebp+0CH]                         ; 0CB8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0CBB _ FF. 75, 08
        call    boxfill8                                ; 0CBE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0CC3 _ 83. C4, 20
        nop                                             ; 0CC6 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0CC7 _ 8B. 5D, FC
        leave                                           ; 0CCA _ C9
        ret                                             ; 0CCB _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 0CCC _ 55
        mov     ebp, esp                                ; 0CCD _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 0CCF _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0CD2 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 0CD5 _ A1, 00000114(d)
        add     eax, edx                                ; 0CDA _ 01. D0
        mov     dword [mx], eax                         ; 0CDC _ A3, 00000114(d)
        mov     eax, dword [ebp+10H]                    ; 0CE1 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0CE4 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 0CE7 _ A1, 00000118(d)
        add     eax, edx                                ; 0CEC _ 01. D0
        mov     dword [my], eax                         ; 0CEE _ A3, 00000118(d)
        mov     eax, dword [mx]                         ; 0CF3 _ A1, 00000114(d)
        test    eax, eax                                ; 0CF8 _ 85. C0
        jns     ?_014                                   ; 0CFA _ 79, 0A
        mov     dword [mx], 0                           ; 0CFC _ C7. 05, 00000114(d), 00000000
?_014:  mov     eax, dword [my]                         ; 0D06 _ A1, 00000118(d)
        test    eax, eax                                ; 0D0B _ 85. C0
        jns     ?_015                                   ; 0D0D _ 79, 0A
        mov     dword [my], 0                           ; 0D0F _ C7. 05, 00000118(d), 00000000
?_015:  mov     edx, dword [xsize]                      ; 0D19 _ 8B. 15, 0000011C(d)
        mov     eax, dword [mx]                         ; 0D1F _ A1, 00000114(d)
        cmp     edx, eax                                ; 0D24 _ 39. C2
        jg      ?_016                                   ; 0D26 _ 7F, 0B
        mov     eax, dword [xsize]                      ; 0D28 _ A1, 0000011C(d)
        dec     eax                                     ; 0D2D _ 48
        mov     dword [mx], eax                         ; 0D2E _ A3, 00000114(d)
?_016:  mov     edx, dword [ysize]                      ; 0D33 _ 8B. 15, 00000120(d)
        mov     eax, dword [my]                         ; 0D39 _ A1, 00000118(d)
        cmp     edx, eax                                ; 0D3E _ 39. C2
        jg      ?_017                                   ; 0D40 _ 7F, 0B
        mov     eax, dword [ysize]                      ; 0D42 _ A1, 00000120(d)
        dec     eax                                     ; 0D47 _ 48
        mov     dword [my], eax                         ; 0D48 _ A3, 00000118(d)
?_017:  nop                                             ; 0D4D _ 90
        pop     ebp                                     ; 0D4E _ 5D
        ret                                             ; 0D4F _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0D50 _ 55
        mov     ebp, esp                                ; 0D51 _ 89. E5
        sub     esp, 24                                 ; 0D53 _ 83. EC, 18
        mov     eax, dword [buf_back]                   ; 0D56 _ A1, 00000124(d)
        mov     dword [ebp-0CH], eax                    ; 0D5B _ 89. 45, F4
        mov     byte [ebp-0DH], 0                       ; 0D5E _ C6. 45, F3, 00
        call    io_sti                                  ; 0D62 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0D67 _ 83. EC, 0C
        push    mouseinfo                               ; 0D6A _ 68, 00000024(d)
        call    fifo8_get                               ; 0D6F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D74 _ 83. C4, 10
        mov     byte [ebp-0DH], al                      ; 0D77 _ 88. 45, F3
        movzx   eax, byte [ebp-0DH]                     ; 0D7A _ 0F B6. 45, F3
        sub     esp, 8                                  ; 0D7E _ 83. EC, 08
        push    eax                                     ; 0D81 _ 50
        push    mdec                                    ; 0D82 _ 68, 000000E0(d)
        call    mouse_decode                            ; 0D87 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D8C _ 83. C4, 10
        test    eax, eax                                ; 0D8F _ 85. C0
        jz      ?_018                                   ; 0D91 _ 74, 60
        sub     esp, 4                                  ; 0D93 _ 83. EC, 04
        push    mdec                                    ; 0D96 _ 68, 000000E0(d)
        push    dword [ebp+0CH]                         ; 0D9B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0D9E _ FF. 75, 08
        call    computeMousePosition                    ; 0DA1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DA6 _ 83. C4, 10
        mov     edx, dword [my]                         ; 0DA9 _ 8B. 15, 00000118(d)
        mov     eax, dword [mx]                         ; 0DAF _ A1, 00000114(d)
        push    edx                                     ; 0DB4 _ 52
        push    eax                                     ; 0DB5 _ 50
        push    dword [ebp+10H]                         ; 0DB6 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 0DB9 _ FF. 75, 08
        call    sheet_slide                             ; 0DBC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DC1 _ 83. C4, 10
        mov     eax, dword [?_199]                      ; 0DC4 _ A1, 000000EC(d)
        and     eax, 01H                                ; 0DC9 _ 83. E0, 01
        test    eax, eax                                ; 0DCC _ 85. C0
        jz      ?_018                                   ; 0DCE _ 74, 23
        mov     eax, dword [my]                         ; 0DD0 _ A1, 00000118(d)
        lea     ecx, [eax-8H]                           ; 0DD5 _ 8D. 48, F8
        mov     eax, dword [mx]                         ; 0DD8 _ A1, 00000114(d)
        lea     edx, [eax-50H]                          ; 0DDD _ 8D. 50, B0
        mov     eax, dword [shtMsgBox]                  ; 0DE0 _ A1, 00000240(d)
        push    ecx                                     ; 0DE5 _ 51
        push    edx                                     ; 0DE6 _ 52
        push    eax                                     ; 0DE7 _ 50
        push    dword [ebp+8H]                          ; 0DE8 _ FF. 75, 08
        call    sheet_slide                             ; 0DEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DF0 _ 83. C4, 10
?_018:  nop                                             ; 0DF3 _ 90
        leave                                           ; 0DF4 _ C9
        ret                                             ; 0DF5 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0DF6 _ 55
        mov     ebp, esp                                ; 0DF7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0DF9 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 0DFC _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 0E02 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0E05 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0E0B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0E0E _ 66: C7. 40, 06, 01E0
        nop                                             ; 0E14 _ 90
        pop     ebp                                     ; 0E15 _ 5D
        ret                                             ; 0E16 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0E17 _ 55
        mov     ebp, esp                                ; 0E18 _ 89. E5
        push    ebx                                     ; 0E1A _ 53
        sub     esp, 36                                 ; 0E1B _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 0E1E _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 0E21 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0E24 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0E27 _ 89. 45, F4
        jmp     ?_020                                   ; 0E2A _ EB, 3C

?_019:  mov     eax, dword [ebp+1CH]                    ; 0E2C _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E2F _ 8A. 00
        movzx   eax, al                                 ; 0E31 _ 0F B6. C0
        shl     eax, 4                                  ; 0E34 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0E37 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 0E3D _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 0E41 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0E44 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0E47 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0E4A _ 8B. 00
        sub     esp, 8                                  ; 0E4C _ 83. EC, 08
        push    ebx                                     ; 0E4F _ 53
        push    ecx                                     ; 0E50 _ 51
        push    dword [ebp+14H]                         ; 0E51 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 0E54 _ FF. 75, 10
        push    edx                                     ; 0E57 _ 52
        push    eax                                     ; 0E58 _ 50
        call    showFont8                               ; 0E59 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E5E _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 0E61 _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 0E65 _ FF. 45, 1C
?_020:  mov     eax, dword [ebp+1CH]                    ; 0E68 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0E6B _ 8A. 00
        test    al, al                                  ; 0E6D _ 84. C0
        jnz     ?_019                                   ; 0E6F _ 75, BB
        mov     eax, dword [ebp+14H]                    ; 0E71 _ 8B. 45, 14
        add     eax, 16                                 ; 0E74 _ 83. C0, 10
        sub     esp, 8                                  ; 0E77 _ 83. EC, 08
        push    eax                                     ; 0E7A _ 50
        push    dword [ebp+10H]                         ; 0E7B _ FF. 75, 10
        push    dword [ebp+14H]                         ; 0E7E _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 0E81 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 0E84 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0E87 _ FF. 75, 08
        call    sheet_refresh                           ; 0E8A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E8F _ 83. C4, 20
        nop                                             ; 0E92 _ 90
        mov     ebx, dword [ebp-4H]                     ; 0E93 _ 8B. 5D, FC
        leave                                           ; 0E96 _ C9
        ret                                             ; 0E97 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 0E98 _ 55
        mov     ebp, esp                                ; 0E99 _ 89. E5
        sub     esp, 8                                  ; 0E9B _ 83. EC, 08
        sub     esp, 4                                  ; 0E9E _ 83. EC, 04
        push    table_rgb.1911                          ; 0EA1 _ 68, 00000080(d)
        push    15                                      ; 0EA6 _ 6A, 0F
        push    0                                       ; 0EA8 _ 6A, 00
        call    set_palette                             ; 0EAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EAF _ 83. C4, 10
        nop                                             ; 0EB2 _ 90
        leave                                           ; 0EB3 _ C9
        ret                                             ; 0EB4 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0EB5 _ 55
        mov     ebp, esp                                ; 0EB6 _ 89. E5
        sub     esp, 24                                 ; 0EB8 _ 83. EC, 18
        call    io_load_eflags                          ; 0EBB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0EC0 _ 89. 45, F0
        call    io_cli                                  ; 0EC3 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 0EC8 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0ECB _ FF. 75, 08
        push    968                                     ; 0ECE _ 68, 000003C8
        call    io_out8                                 ; 0ED3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ED8 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0EDB _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0EDE _ 89. 45, F4
        jmp     ?_022                                   ; 0EE1 _ EB, 5F

?_021:  mov     eax, dword [ebp+10H]                    ; 0EE3 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 0EE6 _ 8A. 00
        shr     al, 2                                   ; 0EE8 _ C0. E8, 02
        movzx   eax, al                                 ; 0EEB _ 0F B6. C0
        sub     esp, 8                                  ; 0EEE _ 83. EC, 08
        push    eax                                     ; 0EF1 _ 50
        push    969                                     ; 0EF2 _ 68, 000003C9
        call    io_out8                                 ; 0EF7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0EFC _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0EFF _ 8B. 45, 10
        inc     eax                                     ; 0F02 _ 40
        mov     al, byte [eax]                          ; 0F03 _ 8A. 00
        shr     al, 2                                   ; 0F05 _ C0. E8, 02
        movzx   eax, al                                 ; 0F08 _ 0F B6. C0
        sub     esp, 8                                  ; 0F0B _ 83. EC, 08
        push    eax                                     ; 0F0E _ 50
        push    969                                     ; 0F0F _ 68, 000003C9
        call    io_out8                                 ; 0F14 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F19 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0F1C _ 8B. 45, 10
        add     eax, 2                                  ; 0F1F _ 83. C0, 02
        mov     al, byte [eax]                          ; 0F22 _ 8A. 00
        shr     al, 2                                   ; 0F24 _ C0. E8, 02
        movzx   eax, al                                 ; 0F27 _ 0F B6. C0
        sub     esp, 8                                  ; 0F2A _ 83. EC, 08
        push    eax                                     ; 0F2D _ 50
        push    969                                     ; 0F2E _ 68, 000003C9
        call    io_out8                                 ; 0F33 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F38 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 0F3B _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 0F3F _ FF. 45, F4
?_022:  mov     eax, dword [ebp-0CH]                    ; 0F42 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0F45 _ 3B. 45, 0C
        jle     ?_021                                   ; 0F48 _ 7E, 99
        sub     esp, 12                                 ; 0F4A _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0F4D _ FF. 75, F0
        call    io_store_eflags                         ; 0F50 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F55 _ 83. C4, 10
        nop                                             ; 0F58 _ 90
        leave                                           ; 0F59 _ C9
        ret                                             ; 0F5A _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 0F5B _ 55
        mov     ebp, esp                                ; 0F5C _ 89. E5
        sub     esp, 20                                 ; 0F5E _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0F61 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0F64 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0F67 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0F6A _ 89. 45, F8
        jmp     ?_026                                   ; 0F6D _ EB, 30

?_023:  mov     eax, dword [ebp+14H]                    ; 0F6F _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0F72 _ 89. 45, FC
        jmp     ?_025                                   ; 0F75 _ EB, 1D

?_024:  mov     eax, dword [ebp-8H]                     ; 0F77 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0F7A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F7E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0F80 _ 8B. 45, FC
        add     eax, edx                                ; 0F83 _ 01. D0
        mov     edx, eax                                ; 0F85 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F87 _ 8B. 45, 08
        add     edx, eax                                ; 0F8A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0F8C _ 8A. 45, EC
        mov     byte [edx], al                          ; 0F8F _ 88. 02
        inc     dword [ebp-4H]                          ; 0F91 _ FF. 45, FC
?_025:  mov     eax, dword [ebp-4H]                     ; 0F94 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0F97 _ 3B. 45, 1C
        jle     ?_024                                   ; 0F9A _ 7E, DB
        inc     dword [ebp-8H]                          ; 0F9C _ FF. 45, F8
?_026:  mov     eax, dword [ebp-8H]                     ; 0F9F _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0FA2 _ 3B. 45, 20
        jle     ?_023                                   ; 0FA5 _ 7E, C8
        nop                                             ; 0FA7 _ 90
        nop                                             ; 0FA8 _ 90
        leave                                           ; 0FA9 _ C9
        ret                                             ; 0FAA _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0FAB _ 55
        mov     ebp, esp                                ; 0FAC _ 89. E5
        sub     esp, 20                                 ; 0FAE _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0FB1 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 0FB4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0FB7 _ C7. 45, FC, 00000000
        jmp     ?_036                                   ; 0FBE _ E9, 00000162

?_027:  mov     edx, dword [ebp-4H]                     ; 0FC3 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 0FC6 _ 8B. 45, 1C
        add     eax, edx                                ; 0FC9 _ 01. D0
        mov     al, byte [eax]                          ; 0FCB _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0FCD _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0FD0 _ 80. 7D, FB, 00
        jns     ?_028                                   ; 0FD4 _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 0FD6 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0FD9 _ 8B. 45, FC
        add     eax, edx                                ; 0FDC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FDE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FE2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FE4 _ 8B. 45, 10
        add     eax, edx                                ; 0FE7 _ 01. D0
        mov     edx, eax                                ; 0FE9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FEB _ 8B. 45, 08
        add     edx, eax                                ; 0FEE _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0FF0 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0FF3 _ 88. 02
?_028:  movsx   eax, byte [ebp-5H]                      ; 0FF5 _ 0F BE. 45, FB
        and     eax, 40H                                ; 0FF9 _ 83. E0, 40
        test    eax, eax                                ; 0FFC _ 85. C0
        jz      ?_029                                   ; 0FFE _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1000 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1003 _ 8B. 45, FC
        add     eax, edx                                ; 1006 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1008 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 100C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 100E _ 8B. 45, 10
        add     eax, edx                                ; 1011 _ 01. D0
        lea     edx, [eax+1H]                           ; 1013 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1016 _ 8B. 45, 08
        add     edx, eax                                ; 1019 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 101B _ 8A. 45, EC
        mov     byte [edx], al                          ; 101E _ 88. 02
?_029:  movsx   eax, byte [ebp-5H]                      ; 1020 _ 0F BE. 45, FB
        and     eax, 20H                                ; 1024 _ 83. E0, 20
        test    eax, eax                                ; 1027 _ 85. C0
        jz      ?_030                                   ; 1029 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 102B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 102E _ 8B. 45, FC
        add     eax, edx                                ; 1031 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1033 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1037 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1039 _ 8B. 45, 10
        add     eax, edx                                ; 103C _ 01. D0
        lea     edx, [eax+2H]                           ; 103E _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1041 _ 8B. 45, 08
        add     edx, eax                                ; 1044 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1046 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1049 _ 88. 02
?_030:  movsx   eax, byte [ebp-5H]                      ; 104B _ 0F BE. 45, FB
        and     eax, 10H                                ; 104F _ 83. E0, 10
        test    eax, eax                                ; 1052 _ 85. C0
        jz      ?_031                                   ; 1054 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1056 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1059 _ 8B. 45, FC
        add     eax, edx                                ; 105C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 105E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1062 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1064 _ 8B. 45, 10
        add     eax, edx                                ; 1067 _ 01. D0
        lea     edx, [eax+3H]                           ; 1069 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 106C _ 8B. 45, 08
        add     edx, eax                                ; 106F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 1071 _ 8A. 45, EC
        mov     byte [edx], al                          ; 1074 _ 88. 02
?_031:  movsx   eax, byte [ebp-5H]                      ; 1076 _ 0F BE. 45, FB
        and     eax, 08H                                ; 107A _ 83. E0, 08
        test    eax, eax                                ; 107D _ 85. C0
        jz      ?_032                                   ; 107F _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1081 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1084 _ 8B. 45, FC
        add     eax, edx                                ; 1087 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1089 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 108D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 108F _ 8B. 45, 10
        add     eax, edx                                ; 1092 _ 01. D0
        lea     edx, [eax+4H]                           ; 1094 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1097 _ 8B. 45, 08
        add     edx, eax                                ; 109A _ 01. C2
        mov     al, byte [ebp-14H]                      ; 109C _ 8A. 45, EC
        mov     byte [edx], al                          ; 109F _ 88. 02
?_032:  movsx   eax, byte [ebp-5H]                      ; 10A1 _ 0F BE. 45, FB
        and     eax, 04H                                ; 10A5 _ 83. E0, 04
        test    eax, eax                                ; 10A8 _ 85. C0
        jz      ?_033                                   ; 10AA _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10AC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10AF _ 8B. 45, FC
        add     eax, edx                                ; 10B2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10B4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10B8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10BA _ 8B. 45, 10
        add     eax, edx                                ; 10BD _ 01. D0
        lea     edx, [eax+5H]                           ; 10BF _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10C2 _ 8B. 45, 08
        add     edx, eax                                ; 10C5 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10C7 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10CA _ 88. 02
?_033:  movsx   eax, byte [ebp-5H]                      ; 10CC _ 0F BE. 45, FB
        and     eax, 02H                                ; 10D0 _ 83. E0, 02
        test    eax, eax                                ; 10D3 _ 85. C0
        jz      ?_034                                   ; 10D5 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 10D7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 10DA _ 8B. 45, FC
        add     eax, edx                                ; 10DD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10DF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10E3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10E5 _ 8B. 45, 10
        add     eax, edx                                ; 10E8 _ 01. D0
        lea     edx, [eax+6H]                           ; 10EA _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10ED _ 8B. 45, 08
        add     edx, eax                                ; 10F0 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 10F2 _ 8A. 45, EC
        mov     byte [edx], al                          ; 10F5 _ 88. 02
?_034:  movsx   eax, byte [ebp-5H]                      ; 10F7 _ 0F BE. 45, FB
        and     eax, 01H                                ; 10FB _ 83. E0, 01
        test    eax, eax                                ; 10FE _ 85. C0
        jz      ?_035                                   ; 1100 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 1102 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 1105 _ 8B. 45, FC
        add     eax, edx                                ; 1108 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 110A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 110E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1110 _ 8B. 45, 10
        add     eax, edx                                ; 1113 _ 01. D0
        lea     edx, [eax+7H]                           ; 1115 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1118 _ 8B. 45, 08
        add     edx, eax                                ; 111B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 111D _ 8A. 45, EC
        mov     byte [edx], al                          ; 1120 _ 88. 02
?_035:  inc     dword [ebp-4H]                          ; 1122 _ FF. 45, FC
?_036:  cmp     dword [ebp-4H], 15                      ; 1125 _ 83. 7D, FC, 0F
        jle     ?_027                                   ; 1129 _ 0F 8E, FFFFFE94
        nop                                             ; 112F _ 90
        nop                                             ; 1130 _ 90
        leave                                           ; 1131 _ C9
        ret                                             ; 1132 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1133 _ 55
        mov     ebp, esp                                ; 1134 _ 89. E5
        sub     esp, 20                                 ; 1136 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1139 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 113C _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 113F _ C7. 45, F8, 00000000
        jmp     ?_043                                   ; 1146 _ E9, 000000AB

?_037:  mov     dword [ebp-4H], 0                       ; 114B _ C7. 45, FC, 00000000
        jmp     ?_042                                   ; 1152 _ E9, 00000092

?_038:  mov     eax, dword [ebp-8H]                     ; 1157 _ 8B. 45, F8
        shl     eax, 4                                  ; 115A _ C1. E0, 04
        mov     edx, eax                                ; 115D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 115F _ 8B. 45, FC
        add     eax, edx                                ; 1162 _ 01. D0
        add     eax, cursor.1958                        ; 1164 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1169 _ 8A. 00
        cmp     al, 42                                  ; 116B _ 3C, 2A
        jnz     ?_039                                   ; 116D _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 116F _ 8B. 45, F8
        shl     eax, 4                                  ; 1172 _ C1. E0, 04
        mov     edx, eax                                ; 1175 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1177 _ 8B. 45, FC
        add     eax, edx                                ; 117A _ 01. D0
        mov     edx, eax                                ; 117C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 117E _ 8B. 45, 08
        add     eax, edx                                ; 1181 _ 01. D0
        mov     byte [eax], 0                           ; 1183 _ C6. 00, 00
?_039:  mov     eax, dword [ebp-8H]                     ; 1186 _ 8B. 45, F8
        shl     eax, 4                                  ; 1189 _ C1. E0, 04
        mov     edx, eax                                ; 118C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 118E _ 8B. 45, FC
        add     eax, edx                                ; 1191 _ 01. D0
        add     eax, cursor.1958                        ; 1193 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 1198 _ 8A. 00
        cmp     al, 79                                  ; 119A _ 3C, 4F
        jnz     ?_040                                   ; 119C _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 119E _ 8B. 45, F8
        shl     eax, 4                                  ; 11A1 _ C1. E0, 04
        mov     edx, eax                                ; 11A4 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11A6 _ 8B. 45, FC
        add     eax, edx                                ; 11A9 _ 01. D0
        mov     edx, eax                                ; 11AB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11AD _ 8B. 45, 08
        add     eax, edx                                ; 11B0 _ 01. D0
        mov     byte [eax], 7                           ; 11B2 _ C6. 00, 07
?_040:  mov     eax, dword [ebp-8H]                     ; 11B5 _ 8B. 45, F8
        shl     eax, 4                                  ; 11B8 _ C1. E0, 04
        mov     edx, eax                                ; 11BB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11BD _ 8B. 45, FC
        add     eax, edx                                ; 11C0 _ 01. D0
        add     eax, cursor.1958                        ; 11C2 _ 05, 000000C0(d)
        mov     al, byte [eax]                          ; 11C7 _ 8A. 00
        cmp     al, 46                                  ; 11C9 _ 3C, 2E
        jnz     ?_041                                   ; 11CB _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11CD _ 8B. 45, F8
        shl     eax, 4                                  ; 11D0 _ C1. E0, 04
        mov     edx, eax                                ; 11D3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11D5 _ 8B. 45, FC
        add     eax, edx                                ; 11D8 _ 01. D0
        mov     edx, eax                                ; 11DA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11DC _ 8B. 45, 08
        add     edx, eax                                ; 11DF _ 01. C2
        mov     al, byte [ebp-14H]                      ; 11E1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 11E4 _ 88. 02
?_041:  inc     dword [ebp-4H]                          ; 11E6 _ FF. 45, FC
?_042:  cmp     dword [ebp-4H], 15                      ; 11E9 _ 83. 7D, FC, 0F
        jle     ?_038                                   ; 11ED _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 11F3 _ FF. 45, F8
?_043:  cmp     dword [ebp-8H], 15                      ; 11F6 _ 83. 7D, F8, 0F
        jle     ?_037                                   ; 11FA _ 0F 8E, FFFFFF4B
        nop                                             ; 1200 _ 90
        nop                                             ; 1201 _ 90
        leave                                           ; 1202 _ C9
        ret                                             ; 1203 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 1204 _ 55
        mov     ebp, esp                                ; 1205 _ 89. E5
        push    ebx                                     ; 1207 _ 53
        sub     esp, 16                                 ; 1208 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 120B _ C7. 45, F4, 00000000
        jmp     ?_047                                   ; 1212 _ EB, 4D

?_044:  mov     dword [ebp-8H], 0                       ; 1214 _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 121B _ EB, 39

?_045:  mov     eax, dword [ebp-0CH]                    ; 121D _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 1220 _ 0F AF. 45, 24
        mov     edx, eax                                ; 1224 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1226 _ 8B. 45, F8
        add     eax, edx                                ; 1229 _ 01. D0
        mov     edx, eax                                ; 122B _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 122D _ 8B. 45, 20
        add     eax, edx                                ; 1230 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 1232 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 1235 _ 8B. 55, F4
        add     edx, ecx                                ; 1238 _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 123A _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 123E _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 1241 _ 8B. 4D, F8
        add     ecx, ebx                                ; 1244 _ 01. D9
        add     edx, ecx                                ; 1246 _ 01. CA
        mov     ecx, edx                                ; 1248 _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 124A _ 8B. 55, 08
        add     edx, ecx                                ; 124D _ 01. CA
        mov     al, byte [eax]                          ; 124F _ 8A. 00
        mov     byte [edx], al                          ; 1251 _ 88. 02
        inc     dword [ebp-8H]                          ; 1253 _ FF. 45, F8
?_046:  mov     eax, dword [ebp-8H]                     ; 1256 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 1259 _ 3B. 45, 10
        jl      ?_045                                   ; 125C _ 7C, BF
        inc     dword [ebp-0CH]                         ; 125E _ FF. 45, F4
?_047:  mov     eax, dword [ebp-0CH]                    ; 1261 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 1264 _ 3B. 45, 14
        jl      ?_044                                   ; 1267 _ 7C, AB
        nop                                             ; 1269 _ 90
        nop                                             ; 126A _ 90
        add     esp, 16                                 ; 126B _ 83. C4, 10
        pop     ebx                                     ; 126E _ 5B
        pop     ebp                                     ; 126F _ 5D
        ret                                             ; 1270 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 1271 _ 55
        mov     ebp, esp                                ; 1272 _ 89. E5
        sub     esp, 24                                 ; 1274 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 1277 _ A1, 00000000(d)
        mov     dword [ebp-0CH], eax                    ; 127C _ 89. 45, F4
        mov     eax, dword [?_196]                      ; 127F _ A1, 00000004(d)
        cwde                                            ; 1284 _ 98
        mov     dword [ebp-10H], eax                    ; 1285 _ 89. 45, F0
        mov     ax, word [?_197]                        ; 1288 _ 66: A1, 00000006(d)
        cwde                                            ; 128E _ 98
        mov     dword [ebp-14H], eax                    ; 128F _ 89. 45, EC
        sub     esp, 8                                  ; 1292 _ 83. EC, 08
        push    32                                      ; 1295 _ 6A, 20
        push    32                                      ; 1297 _ 6A, 20
        call    io_out8                                 ; 1299 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 129E _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 12A1 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 12A5 _ 83. EC, 0C
        push    96                                      ; 12A8 _ 6A, 60
        call    io_in8                                  ; 12AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12AF _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 12B2 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 12B5 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 12B9 _ 83. EC, 08
        push    eax                                     ; 12BC _ 50
        push    keyinfo                                 ; 12BD _ 68, 00000008(d)
        call    fifo8_put                               ; 12C2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12C7 _ 83. C4, 10
        nop                                             ; 12CA _ 90
        leave                                           ; 12CB _ C9
        ret                                             ; 12CC _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 12CD _ 55
        mov     ebp, esp                                ; 12CE _ 89. E5
        sub     esp, 4                                  ; 12D0 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 12D3 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 12D6 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 12D9 _ 80. 7D, FC, 09
        jle     ?_048                                   ; 12DD _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 12DF _ 8A. 45, FC
        add     eax, 55                                 ; 12E2 _ 83. C0, 37
        jmp     ?_049                                   ; 12E5 _ EB, 06

?_048:  mov     al, byte [ebp-4H]                       ; 12E7 _ 8A. 45, FC
        add     eax, 48                                 ; 12EA _ 83. C0, 30
?_049:  leave                                           ; 12ED _ C9
        ret                                             ; 12EE _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 12EF _ 55
        mov     ebp, esp                                ; 12F0 _ 89. E5
        sub     esp, 20                                 ; 12F2 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 12F5 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 12F8 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 12FB _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 1302 _ 8A. 45, EC
        and     eax, 0FH                                ; 1305 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1308 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 130B _ 0F BE. 45, FB
        push    eax                                     ; 130F _ 50
        call    charToHexVal                            ; 1310 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1315 _ 83. C4, 04
        mov     byte [?_195], al                        ; 1318 _ A2, 00000077(d)
        mov     al, byte [ebp-14H]                      ; 131D _ 8A. 45, EC
        shr     al, 4                                   ; 1320 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1323 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 1326 _ 8A. 45, EC
        movsx   eax, al                                 ; 1329 _ 0F BE. C0
        push    eax                                     ; 132C _ 50
        call    charToHexVal                            ; 132D _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 1332 _ 83. C4, 04
        mov     byte [?_194], al                        ; 1335 _ A2, 00000076(d)
        mov     eax, keyval                             ; 133A _ B8, 00000074(d)
        leave                                           ; 133F _ C9
        ret                                             ; 1340 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1341 _ 55
        mov     ebp, esp                                ; 1342 _ 89. E5
        sub     esp, 16                                 ; 1344 _ 83. EC, 10
        mov     byte [str.2006], 48                     ; 1347 _ C6. 05, 00000368(d), 30
        mov     byte [?_200], 88                        ; 134E _ C6. 05, 00000369(d), 58
        mov     byte [?_201], 0                         ; 1355 _ C6. 05, 00000372(d), 00
        mov     dword [ebp-4H], 2                       ; 135C _ C7. 45, FC, 00000002
        jmp     ?_051                                   ; 1363 _ EB, 0E

?_050:  mov     eax, dword [ebp-4H]                     ; 1365 _ 8B. 45, FC
        add     eax, str.2006                           ; 1368 _ 05, 00000368(d)
        mov     byte [eax], 48                          ; 136D _ C6. 00, 30
        inc     dword [ebp-4H]                          ; 1370 _ FF. 45, FC
?_051:  cmp     dword [ebp-4H], 9                       ; 1373 _ 83. 7D, FC, 09
        jle     ?_050                                   ; 1377 _ 7E, EC
        mov     dword [ebp-8H], 9                       ; 1379 _ C7. 45, F8, 00000009
        jmp     ?_055                                   ; 1380 _ EB, 41

?_052:  mov     eax, dword [ebp+8H]                     ; 1382 _ 8B. 45, 08
        and     eax, 0FH                                ; 1385 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 1388 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 138B _ 8B. 45, 08
        shr     eax, 4                                  ; 138E _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1391 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 1394 _ 83. 7D, F4, 09
        jle     ?_053                                   ; 1398 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 139A _ 8B. 45, F4
        add     eax, 55                                 ; 139D _ 83. C0, 37
        mov     dl, al                                  ; 13A0 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 13A2 _ 8B. 45, F8
        add     eax, str.2006                           ; 13A5 _ 05, 00000368(d)
        mov     byte [eax], dl                          ; 13AA _ 88. 10
        jmp     ?_054                                   ; 13AC _ EB, 12

?_053:  mov     eax, dword [ebp-0CH]                    ; 13AE _ 8B. 45, F4
        add     eax, 48                                 ; 13B1 _ 83. C0, 30
        mov     dl, al                                  ; 13B4 _ 88. C2
        mov     eax, dword [ebp-8H]                     ; 13B6 _ 8B. 45, F8
        add     eax, str.2006                           ; 13B9 _ 05, 00000368(d)
        mov     byte [eax], dl                          ; 13BE _ 88. 10
?_054:  dec     dword [ebp-8H]                          ; 13C0 _ FF. 4D, F8
?_055:  cmp     dword [ebp-8H], 1                       ; 13C3 _ 83. 7D, F8, 01
        jle     ?_056                                   ; 13C7 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 13C9 _ 83. 7D, 08, 00
        jnz     ?_052                                   ; 13CD _ 75, B3
?_056:  mov     eax, str.2006                           ; 13CF _ B8, 00000368(d)
        leave                                           ; 13D4 _ C9
        ret                                             ; 13D5 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 13D6 _ 55
        mov     ebp, esp                                ; 13D7 _ 89. E5
        sub     esp, 8                                  ; 13D9 _ 83. EC, 08
?_057:  sub     esp, 12                                 ; 13DC _ 83. EC, 0C
        push    100                                     ; 13DF _ 6A, 64
        call    io_in8                                  ; 13E1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 13E6 _ 83. C4, 10
        and     eax, 02H                                ; 13E9 _ 83. E0, 02
        test    eax, eax                                ; 13EC _ 85. C0
        jz      ?_058                                   ; 13EE _ 74, 02
        jmp     ?_057                                   ; 13F0 _ EB, EA

?_058:  nop                                             ; 13F2 _ 90
        nop                                             ; 13F3 _ 90
        leave                                           ; 13F4 _ C9
        ret                                             ; 13F5 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 13F6 _ 55
        mov     ebp, esp                                ; 13F7 _ 89. E5
        sub     esp, 8                                  ; 13F9 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 13FC _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1401 _ 83. EC, 08
        push    96                                      ; 1404 _ 6A, 60
        push    100                                     ; 1406 _ 6A, 64
        call    io_out8                                 ; 1408 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 140D _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1410 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1415 _ 83. EC, 08
        push    71                                      ; 1418 _ 6A, 47
        push    96                                      ; 141A _ 6A, 60
        call    io_out8                                 ; 141C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1421 _ 83. C4, 10
        nop                                             ; 1424 _ 90
        leave                                           ; 1425 _ C9
        ret                                             ; 1426 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1427 _ 55
        mov     ebp, esp                                ; 1428 _ 89. E5
        sub     esp, 8                                  ; 142A _ 83. EC, 08
        call    wait_KBC_sendready                      ; 142D _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1432 _ 83. EC, 08
        push    212                                     ; 1435 _ 68, 000000D4
        push    100                                     ; 143A _ 6A, 64
        call    io_out8                                 ; 143C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1441 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 1444 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 1449 _ 83. EC, 08
        push    244                                     ; 144C _ 68, 000000F4
        push    96                                      ; 1451 _ 6A, 60
        call    io_out8                                 ; 1453 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1458 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 145B _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 145E _ C6. 40, 03, 00
        nop                                             ; 1462 _ 90
        leave                                           ; 1463 _ C9
        ret                                             ; 1464 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 1465 _ 55
        mov     ebp, esp                                ; 1466 _ 89. E5
        sub     esp, 24                                 ; 1468 _ 83. EC, 18
        sub     esp, 8                                  ; 146B _ 83. EC, 08
        push    32                                      ; 146E _ 6A, 20
        push    160                                     ; 1470 _ 68, 000000A0
        call    io_out8                                 ; 1475 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 147A _ 83. C4, 10
        sub     esp, 8                                  ; 147D _ 83. EC, 08
        push    32                                      ; 1480 _ 6A, 20
        push    32                                      ; 1482 _ 6A, 20
        call    io_out8                                 ; 1484 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1489 _ 83. C4, 10
        sub     esp, 12                                 ; 148C _ 83. EC, 0C
        push    96                                      ; 148F _ 6A, 60
        call    io_in8                                  ; 1491 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1496 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 1499 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 149C _ 0F B6. 45, F7
        sub     esp, 8                                  ; 14A0 _ 83. EC, 08
        push    eax                                     ; 14A3 _ 50
        push    mouseinfo                               ; 14A4 _ 68, 00000024(d)
        call    fifo8_put                               ; 14A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14AE _ 83. C4, 10
        nop                                             ; 14B1 _ 90
        leave                                           ; 14B2 _ C9
        ret                                             ; 14B3 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 14B4 _ 55
        mov     ebp, esp                                ; 14B5 _ 89. E5
        sub     esp, 4                                  ; 14B7 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 14BA _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 14BD _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 14C0 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 14C3 _ 8A. 40, 03
        test    al, al                                  ; 14C6 _ 84. C0
        jnz     ?_060                                   ; 14C8 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 14CA _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 14CE _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 14D0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 14D3 _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 14D7 _ B8, 00000000
        jmp     ?_067                                   ; 14DC _ E9, 00000104

?_060:  mov     eax, dword [ebp+8H]                     ; 14E1 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 14E4 _ 8A. 40, 03
        cmp     al, 1                                   ; 14E7 _ 3C, 01
        jnz     ?_062                                   ; 14E9 _ 75, 27
        movzx   eax, byte [ebp-4H]                      ; 14EB _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 14EF _ 25, 000000C8
        cmp     eax, 8                                  ; 14F4 _ 83. F8, 08
        jnz     ?_061                                   ; 14F7 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 14F9 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 14FC _ 8A. 55, FC
        mov     byte [eax], dl                          ; 14FF _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1501 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1504 _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 1508 _ B8, 00000000
        jmp     ?_067                                   ; 150D _ E9, 000000D3

?_062:  mov     eax, dword [ebp+8H]                     ; 1512 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1515 _ 8A. 40, 03
        cmp     al, 2                                   ; 1518 _ 3C, 02
        jnz     ?_063                                   ; 151A _ 75, 1A
        mov     eax, dword [ebp+8H]                     ; 151C _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 151F _ 8A. 55, FC
        mov     byte [eax+1H], dl                       ; 1522 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1525 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1528 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 152C _ B8, 00000000
        jmp     ?_067                                   ; 1531 _ E9, 000000AF

?_063:  mov     eax, dword [ebp+8H]                     ; 1536 _ 8B. 45, 08
        mov     al, byte [eax+3H]                       ; 1539 _ 8A. 40, 03
        cmp     al, 3                                   ; 153C _ 3C, 03
        jne     ?_066                                   ; 153E _ 0F 85, 0000009C
        mov     eax, dword [ebp+8H]                     ; 1544 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 1547 _ 8A. 55, FC
        mov     byte [eax+2H], dl                       ; 154A _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 154D _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1550 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1554 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1557 _ 8A. 00
        movzx   eax, al                                 ; 1559 _ 0F B6. C0
        and     eax, 07H                                ; 155C _ 83. E0, 07
        mov     edx, eax                                ; 155F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1561 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1564 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1567 _ 8B. 45, 08
        mov     al, byte [eax+1H]                       ; 156A _ 8A. 40, 01
        movzx   edx, al                                 ; 156D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1570 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1573 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1576 _ 8B. 45, 08
        mov     al, byte [eax+2H]                       ; 1579 _ 8A. 40, 02
        movzx   edx, al                                 ; 157C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 157F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1582 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1585 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 1588 _ 8A. 00
        movzx   eax, al                                 ; 158A _ 0F B6. C0
        and     eax, 10H                                ; 158D _ 83. E0, 10
        test    eax, eax                                ; 1590 _ 85. C0
        jz      ?_064                                   ; 1592 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1594 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1597 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 159A _ 0D, FFFFFF00
        mov     edx, eax                                ; 159F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15A1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 15A4 _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 15A7 _ 8B. 45, 08
        mov     al, byte [eax]                          ; 15AA _ 8A. 00
        movzx   eax, al                                 ; 15AC _ 0F B6. C0
        and     eax, 20H                                ; 15AF _ 83. E0, 20
        test    eax, eax                                ; 15B2 _ 85. C0
        jz      ?_065                                   ; 15B4 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 15B6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15B9 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 15BC _ 0D, FFFFFF00
        mov     edx, eax                                ; 15C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15C3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15C6 _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 15C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 15CC _ 8B. 40, 08
        neg     eax                                     ; 15CF _ F7. D8
        mov     edx, eax                                ; 15D1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15D3 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 15D6 _ 89. 50, 08
        mov     eax, 1                                  ; 15D9 _ B8, 00000001
        jmp     ?_067                                   ; 15DE _ EB, 05

?_066:  mov     eax, 4294967295                         ; 15E0 _ B8, FFFFFFFF
?_067:  leave                                           ; 15E5 _ C9
        ret                                             ; 15E6 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 15E7 _ 55
        mov     ebp, esp                                ; 15E8 _ 89. E5
        sub     esp, 40                                 ; 15EA _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 15ED _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 15F4 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 15FB _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 1602 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 1609 _ 8B. 15, 00000120(d)
        mov     eax, dword [ebp+0CH]                    ; 160F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1612 _ 8B. 00
        sub     esp, 4                                  ; 1614 _ 83. EC, 04
        push    edx                                     ; 1617 _ 52
        push    dword [ebp+1CH]                         ; 1618 _ FF. 75, 1C
        push    eax                                     ; 161B _ 50
        call    init_screen8                            ; 161C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1621 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 1624 _ 8B. 45, 20
        movsx   eax, al                                 ; 1627 _ 0F BE. C0
        sub     esp, 8                                  ; 162A _ 83. EC, 08
        push    ?_190                                   ; 162D _ 68, 00000020(d)
        push    eax                                     ; 1632 _ 50
        push    dword [ebp-10H]                         ; 1633 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1636 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1639 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 163C _ FF. 75, 08
        call    showString                              ; 163F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1644 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 1647 _ 8B. 45, 18
        sub     esp, 12                                 ; 164A _ 83. EC, 0C
        push    eax                                     ; 164D _ 50
        call    intToHexStr                             ; 164E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1653 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1656 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 1659 _ 8B. 45, 20
        movsx   eax, al                                 ; 165C _ 0F BE. C0
        sub     esp, 8                                  ; 165F _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 1662 _ FF. 75, E4
        push    eax                                     ; 1665 _ 50
        push    dword [ebp-10H]                         ; 1666 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1669 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 166C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 166F _ FF. 75, 08
        call    showString                              ; 1672 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1677 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 167A _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 167E _ 8B. 45, 20
        movsx   eax, al                                 ; 1681 _ 0F BE. C0
        sub     esp, 8                                  ; 1684 _ 83. EC, 08
        push    ?_191                                   ; 1687 _ 68, 0000002A(d)
        push    eax                                     ; 168C _ 50
        push    dword [ebp-10H]                         ; 168D _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1690 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 1693 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1696 _ FF. 75, 08
        call    showString                              ; 1699 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 169E _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 16A1 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 16A4 _ 8B. 00
        sub     esp, 12                                 ; 16A6 _ 83. EC, 0C
        push    eax                                     ; 16A9 _ 50
        call    intToHexStr                             ; 16AA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16AF _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 16B2 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 16B5 _ 8B. 45, 20
        movsx   eax, al                                 ; 16B8 _ 0F BE. C0
        sub     esp, 8                                  ; 16BB _ 83. EC, 08
        push    dword [ebp-20H]                         ; 16BE _ FF. 75, E0
        push    eax                                     ; 16C1 _ 50
        push    dword [ebp-10H]                         ; 16C2 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 16C5 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 16C8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16CB _ FF. 75, 08
        call    showString                              ; 16CE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16D3 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 16D6 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 16DA _ 8B. 45, 20
        movsx   eax, al                                 ; 16DD _ 0F BE. C0
        sub     esp, 8                                  ; 16E0 _ 83. EC, 08
        push    ?_192                                   ; 16E3 _ 68, 00000036(d)
        push    eax                                     ; 16E8 _ 50
        push    dword [ebp-10H]                         ; 16E9 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 16EC _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 16EF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 16F2 _ FF. 75, 08
        call    showString                              ; 16F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 16FA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 16FD _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1700 _ 8B. 40, 04
        sub     esp, 12                                 ; 1703 _ 83. EC, 0C
        push    eax                                     ; 1706 _ 50
        call    intToHexStr                             ; 1707 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 170C _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 170F _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 1712 _ 8B. 45, 20
        movsx   eax, al                                 ; 1715 _ 0F BE. C0
        sub     esp, 8                                  ; 1718 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 171B _ FF. 75, DC
        push    eax                                     ; 171E _ 50
        push    dword [ebp-10H]                         ; 171F _ FF. 75, F0
        push    dword [ebp-14H]                         ; 1722 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1725 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1728 _ FF. 75, 08
        call    showString                              ; 172B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1730 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 1733 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 1737 _ 8B. 45, 20
        movsx   eax, al                                 ; 173A _ 0F BE. C0
        sub     esp, 8                                  ; 173D _ 83. EC, 08
        push    ?_193                                   ; 1740 _ 68, 00000042(d)
        push    eax                                     ; 1745 _ 50
        push    dword [ebp-10H]                         ; 1746 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 1749 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 174C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 174F _ FF. 75, 08
        call    showString                              ; 1752 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1757 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 175A _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 175D _ 8B. 40, 08
        sub     esp, 12                                 ; 1760 _ 83. EC, 0C
        push    eax                                     ; 1763 _ 50
        call    intToHexStr                             ; 1764 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1769 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 176C _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 176F _ 8B. 45, 20
        movsx   eax, al                                 ; 1772 _ 0F BE. C0
        sub     esp, 8                                  ; 1775 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 1778 _ FF. 75, D8
        push    eax                                     ; 177B _ 50
        push    dword [ebp-10H]                         ; 177C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 177F _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 1782 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1785 _ FF. 75, 08
        call    showString                              ; 1788 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 178D _ 83. C4, 20
        nop                                             ; 1790 _ 90
        leave                                           ; 1791 _ C9
        ret                                             ; 1792 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 1793 _ 55
        mov     ebp, esp                                ; 1794 _ 89. E5
        sub     esp, 24                                 ; 1796 _ 83. EC, 18
        sub     esp, 12                                 ; 1799 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 179C _ FF. 75, 08
        call    sheet_alloc                             ; 179F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17A4 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 17A7 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 17AA _ A1, 00000000(d)
        sub     esp, 8                                  ; 17AF _ 83. EC, 08
        push    10880                                   ; 17B2 _ 68, 00002A80
        push    eax                                     ; 17B7 _ 50
        call    memman_alloc_4k                         ; 17B8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17BD _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 17C0 _ 89. 45, F0
        sub     esp, 12                                 ; 17C3 _ 83. EC, 0C
        push    -1                                      ; 17C6 _ 6A, FF
        push    68                                      ; 17C8 _ 6A, 44
        push    160                                     ; 17CA _ 68, 000000A0
        push    dword [ebp-10H]                         ; 17CF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 17D2 _ FF. 75, F4
        call    sheet_setbuf                            ; 17D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 17DA _ 83. C4, 20
        sub     esp, 4                                  ; 17DD _ 83. EC, 04
        push    dword [ebp+0CH]                         ; 17E0 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 17E3 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 17E6 _ FF. 75, 08
        call    make_window8                            ; 17E9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17EE _ 83. C4, 10
        sub     esp, 8                                  ; 17F1 _ 83. EC, 08
        push    7                                       ; 17F4 _ 6A, 07
        push    16                                      ; 17F6 _ 6A, 10
        push    144                                     ; 17F8 _ 68, 00000090
        push    28                                      ; 17FD _ 6A, 1C
        push    8                                       ; 17FF _ 6A, 08
        push    dword [ebp-0CH]                         ; 1801 _ FF. 75, F4
        call    make_textbox8                           ; 1804 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1809 _ 83. C4, 20
        push    172                                     ; 180C _ 68, 000000AC
        push    260                                     ; 1811 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 1816 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1819 _ FF. 75, 08
        call    sheet_slide                             ; 181C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1821 _ 83. C4, 10
        sub     esp, 4                                  ; 1824 _ 83. EC, 04
        push    2                                       ; 1827 _ 6A, 02
        push    dword [ebp-0CH]                         ; 1829 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 182C _ FF. 75, 08
        call    sheet_updown                            ; 182F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1834 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 1837 _ 8B. 45, F4
        leave                                           ; 183A _ C9
        ret                                             ; 183B _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 183C _ 55
        mov     ebp, esp                                ; 183D _ 89. E5
        push    ebx                                     ; 183F _ 53
        sub     esp, 36                                 ; 1840 _ 83. EC, 24
        mov     eax, dword [ebp+0CH]                    ; 1843 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1846 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 1849 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 184C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 184F _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 1852 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 1855 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 1858 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 185B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 185E _ 8B. 00
        push    0                                       ; 1860 _ 6A, 00
        push    edx                                     ; 1862 _ 52
        push    0                                       ; 1863 _ 6A, 00
        push    0                                       ; 1865 _ 6A, 00
        push    8                                       ; 1867 _ 6A, 08
        push    dword [ebp-18H]                         ; 1869 _ FF. 75, E8
        push    eax                                     ; 186C _ 50
        call    boxfill8                                ; 186D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1872 _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 1875 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 1878 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 187B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 187E _ 8B. 00
        push    1                                       ; 1880 _ 6A, 01
        push    edx                                     ; 1882 _ 52
        push    1                                       ; 1883 _ 6A, 01
        push    1                                       ; 1885 _ 6A, 01
        push    7                                       ; 1887 _ 6A, 07
        push    dword [ebp-18H]                         ; 1889 _ FF. 75, E8
        push    eax                                     ; 188C _ 50
        call    boxfill8                                ; 188D _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1892 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1895 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 1898 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 189B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 189E _ 8B. 00
        push    edx                                     ; 18A0 _ 52
        push    0                                       ; 18A1 _ 6A, 00
        push    0                                       ; 18A3 _ 6A, 00
        push    0                                       ; 18A5 _ 6A, 00
        push    8                                       ; 18A7 _ 6A, 08
        push    dword [ebp-18H]                         ; 18A9 _ FF. 75, E8
        push    eax                                     ; 18AC _ 50
        call    boxfill8                                ; 18AD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18B2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18B5 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 18B8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 18BB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18BE _ 8B. 00
        push    edx                                     ; 18C0 _ 52
        push    1                                       ; 18C1 _ 6A, 01
        push    1                                       ; 18C3 _ 6A, 01
        push    1                                       ; 18C5 _ 6A, 01
        push    7                                       ; 18C7 _ 6A, 07
        push    dword [ebp-18H]                         ; 18C9 _ FF. 75, E8
        push    eax                                     ; 18CC _ 50
        call    boxfill8                                ; 18CD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18D2 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18D5 _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 18D8 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 18DB _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 18DE _ 8D. 48, FE
        mov     eax, dword [ebp-18H]                    ; 18E1 _ 8B. 45, E8
        lea     edx, [eax-2H]                           ; 18E4 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 18E7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18EA _ 8B. 00
        push    ebx                                     ; 18EC _ 53
        push    ecx                                     ; 18ED _ 51
        push    1                                       ; 18EE _ 6A, 01
        push    edx                                     ; 18F0 _ 52
        push    15                                      ; 18F1 _ 6A, 0F
        push    dword [ebp-18H]                         ; 18F3 _ FF. 75, E8
        push    eax                                     ; 18F6 _ 50
        call    boxfill8                                ; 18F7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 18FC _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 18FF _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 1902 _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 1905 _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 1908 _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 190B _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 190E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1911 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1914 _ 8B. 00
        push    ebx                                     ; 1916 _ 53
        push    ecx                                     ; 1917 _ 51
        push    0                                       ; 1918 _ 6A, 00
        push    edx                                     ; 191A _ 52
        push    0                                       ; 191B _ 6A, 00
        push    dword [ebp-18H]                         ; 191D _ FF. 75, E8
        push    eax                                     ; 1920 _ 50
        call    boxfill8                                ; 1921 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1926 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1929 _ 8B. 45, E4
        lea     ecx, [eax-3H]                           ; 192C _ 8D. 48, FD
        mov     eax, dword [ebp-18H]                    ; 192F _ 8B. 45, E8
        lea     edx, [eax-3H]                           ; 1932 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1935 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1938 _ 8B. 00
        push    ecx                                     ; 193A _ 51
        push    edx                                     ; 193B _ 52
        push    2                                       ; 193C _ 6A, 02
        push    2                                       ; 193E _ 6A, 02
        push    8                                       ; 1940 _ 6A, 08
        push    dword [ebp-18H]                         ; 1942 _ FF. 75, E8
        push    eax                                     ; 1945 _ 50
        call    boxfill8                                ; 1946 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 194B _ 83. C4, 1C
        mov     eax, dword [ebp-18H]                    ; 194E _ 8B. 45, E8
        lea     edx, [eax-4H]                           ; 1951 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1954 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1957 _ 8B. 00
        push    20                                      ; 1959 _ 6A, 14
        push    edx                                     ; 195B _ 52
        push    3                                       ; 195C _ 6A, 03
        push    3                                       ; 195E _ 6A, 03
        push    12                                      ; 1960 _ 6A, 0C
        push    dword [ebp-18H]                         ; 1962 _ FF. 75, E8
        push    eax                                     ; 1965 _ 50
        call    boxfill8                                ; 1966 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 196B _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 196E _ 8B. 45, E4
        lea     ebx, [eax-2H]                           ; 1971 _ 8D. 58, FE
        mov     eax, dword [ebp-18H]                    ; 1974 _ 8B. 45, E8
        lea     ecx, [eax-2H]                           ; 1977 _ 8D. 48, FE
        mov     eax, dword [ebp-1CH]                    ; 197A _ 8B. 45, E4
        lea     edx, [eax-2H]                           ; 197D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1980 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1983 _ 8B. 00
        push    ebx                                     ; 1985 _ 53
        push    ecx                                     ; 1986 _ 51
        push    edx                                     ; 1987 _ 52
        push    1                                       ; 1988 _ 6A, 01
        push    15                                      ; 198A _ 6A, 0F
        push    dword [ebp-18H]                         ; 198C _ FF. 75, E8
        push    eax                                     ; 198F _ 50
        call    boxfill8                                ; 1990 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1995 _ 83. C4, 1C
        mov     eax, dword [ebp-1CH]                    ; 1998 _ 8B. 45, E4
        lea     ebx, [eax-1H]                           ; 199B _ 8D. 58, FF
        mov     eax, dword [ebp-18H]                    ; 199E _ 8B. 45, E8
        lea     ecx, [eax-1H]                           ; 19A1 _ 8D. 48, FF
        mov     eax, dword [ebp-1CH]                    ; 19A4 _ 8B. 45, E4
        lea     edx, [eax-1H]                           ; 19A7 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19AA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19AD _ 8B. 00
        push    ebx                                     ; 19AF _ 53
        push    ecx                                     ; 19B0 _ 51
        push    edx                                     ; 19B1 _ 52
        push    0                                       ; 19B2 _ 6A, 00
        push    0                                       ; 19B4 _ 6A, 00
        push    dword [ebp-18H]                         ; 19B6 _ FF. 75, E8
        push    eax                                     ; 19B9 _ 50
        call    boxfill8                                ; 19BA _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 19BF _ 83. C4, 1C
        sub     esp, 8                                  ; 19C2 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 19C5 _ FF. 75, 10
        push    7                                       ; 19C8 _ 6A, 07
        push    4                                       ; 19CA _ 6A, 04
        push    24                                      ; 19CC _ 6A, 18
        push    dword [ebp+0CH]                         ; 19CE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 19D1 _ FF. 75, 08
        call    showString                              ; 19D4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 19D9 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 19DC _ C7. 45, F0, 00000000
        jmp     ?_075                                   ; 19E3 _ EB, 7F

?_068:  mov     dword [ebp-0CH], 0                      ; 19E5 _ C7. 45, F4, 00000000
        jmp     ?_074                                   ; 19EC _ EB, 6D

?_069:  mov     eax, dword [ebp-10H]                    ; 19EE _ 8B. 45, F0
        shl     eax, 4                                  ; 19F1 _ C1. E0, 04
        mov     edx, eax                                ; 19F4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 19F6 _ 8B. 45, F4
        add     eax, edx                                ; 19F9 _ 01. D0
        add     eax, closebtn.2068                      ; 19FB _ 05, 000001C0(d)
        mov     al, byte [eax]                          ; 1A00 _ 8A. 00
        mov     byte [ebp-11H], al                      ; 1A02 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1A05 _ 80. 7D, EF, 40
        jnz     ?_070                                   ; 1A09 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1A0B _ C6. 45, EF, 00
        jmp     ?_073                                   ; 1A0F _ EB, 1C

?_070:  cmp     byte [ebp-11H], 36                      ; 1A11 _ 80. 7D, EF, 24
        jnz     ?_071                                   ; 1A15 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1A17 _ C6. 45, EF, 0F
        jmp     ?_073                                   ; 1A1B _ EB, 10

?_071:  cmp     byte [ebp-11H], 81                      ; 1A1D _ 80. 7D, EF, 51
        jnz     ?_072                                   ; 1A21 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1A23 _ C6. 45, EF, 08
        jmp     ?_073                                   ; 1A27 _ EB, 04

?_072:  mov     byte [ebp-11H], 7                       ; 1A29 _ C6. 45, EF, 07
?_073:  mov     eax, dword [ebp+0CH]                    ; 1A2D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1A30 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1A32 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1A35 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1A38 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A3B _ 8B. 40, 04
        imul    ecx, eax                                ; 1A3E _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1A41 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1A44 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1A47 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1A4A _ 8B. 45, F4
        add     eax, ebx                                ; 1A4D _ 01. D8
        add     eax, ecx                                ; 1A4F _ 01. C8
        add     edx, eax                                ; 1A51 _ 01. C2
        mov     al, byte [ebp-11H]                      ; 1A53 _ 8A. 45, EF
        mov     byte [edx], al                          ; 1A56 _ 88. 02
        inc     dword [ebp-0CH]                         ; 1A58 _ FF. 45, F4
?_074:  cmp     dword [ebp-0CH], 15                     ; 1A5B _ 83. 7D, F4, 0F
        jle     ?_069                                   ; 1A5F _ 7E, 8D
        inc     dword [ebp-10H]                         ; 1A61 _ FF. 45, F0
?_075:  cmp     dword [ebp-10H], 13                     ; 1A64 _ 83. 7D, F0, 0D
        jle     ?_068                                   ; 1A68 _ 0F 8E, FFFFFF77
        nop                                             ; 1A6E _ 90
        mov     ebx, dword [ebp-4H]                     ; 1A6F _ 8B. 5D, FC
        leave                                           ; 1A72 _ C9
        ret                                             ; 1A73 _ C3
; make_window8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 1A74 _ 55
        mov     ebp, esp                                ; 1A75 _ 89. E5
        push    edi                                     ; 1A77 _ 57
        push    esi                                     ; 1A78 _ 56
        push    ebx                                     ; 1A79 _ 53
        sub     esp, 16                                 ; 1A7A _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 1A7D _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 1A80 _ 8B. 45, 14
        add     eax, edx                                ; 1A83 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1A85 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 1A88 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 1A8B _ 8B. 45, 18
        add     eax, edx                                ; 1A8E _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1A90 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1A93 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1A96 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 1A99 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A9C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A9F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AA2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1AA5 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1AA8 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1AAB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AAE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AB1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AB4 _ 8B. 00
        push    edi                                     ; 1AB6 _ 57
        push    esi                                     ; 1AB7 _ 56
        push    ebx                                     ; 1AB8 _ 53
        push    ecx                                     ; 1AB9 _ 51
        push    15                                      ; 1ABA _ 6A, 0F
        push    edx                                     ; 1ABC _ 52
        push    eax                                     ; 1ABD _ 50
        call    boxfill8                                ; 1ABE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AC3 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1AC6 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1AC9 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1ACC _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1ACF _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1AD2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1AD5 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1AD8 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1ADB _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1ADE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AE1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AE4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE7 _ 8B. 00
        push    edi                                     ; 1AE9 _ 57
        push    esi                                     ; 1AEA _ 56
        push    ebx                                     ; 1AEB _ 53
        push    ecx                                     ; 1AEC _ 51
        push    15                                      ; 1AED _ 6A, 0F
        push    edx                                     ; 1AEF _ 52
        push    eax                                     ; 1AF0 _ 50
        call    boxfill8                                ; 1AF1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1AF6 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1AF9 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1AFC _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1AFF _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1B02 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1B05 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1B08 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1B0B _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1B0E _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1B11 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B14 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B17 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B1A _ 8B. 00
        push    edi                                     ; 1B1C _ 57
        push    esi                                     ; 1B1D _ 56
        push    ebx                                     ; 1B1E _ 53
        push    ecx                                     ; 1B1F _ 51
        push    7                                       ; 1B20 _ 6A, 07
        push    edx                                     ; 1B22 _ 52
        push    eax                                     ; 1B23 _ 50
        call    boxfill8                                ; 1B24 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B29 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1B2C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1B2F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1B32 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1B35 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1B38 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1B3B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 1B3E _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1B41 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1B44 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B47 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B4A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B4D _ 8B. 00
        push    edi                                     ; 1B4F _ 57
        push    esi                                     ; 1B50 _ 56
        push    ebx                                     ; 1B51 _ 53
        push    ecx                                     ; 1B52 _ 51
        push    7                                       ; 1B53 _ 6A, 07
        push    edx                                     ; 1B55 _ 52
        push    eax                                     ; 1B56 _ 50
        call    boxfill8                                ; 1B57 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B5C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1B5F _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1B62 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1B65 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1B68 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1B6B _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 1B6E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1B71 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1B74 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1B77 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1B7A _ 8B. 00
        push    esi                                     ; 1B7C _ 56
        push    dword [ebp-10H]                         ; 1B7D _ FF. 75, F0
        push    ebx                                     ; 1B80 _ 53
        push    ecx                                     ; 1B81 _ 51
        push    0                                       ; 1B82 _ 6A, 00
        push    edx                                     ; 1B84 _ 52
        push    eax                                     ; 1B85 _ 50
        call    boxfill8                                ; 1B86 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1B8B _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 1B8E _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 1B91 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 1B94 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1B97 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 1B9A _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1B9D _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1BA0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BA3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BA6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BA9 _ 8B. 00
        push    dword [ebp-14H]                         ; 1BAB _ FF. 75, EC
        push    esi                                     ; 1BAE _ 56
        push    ebx                                     ; 1BAF _ 53
        push    ecx                                     ; 1BB0 _ 51
        push    0                                       ; 1BB1 _ 6A, 00
        push    edx                                     ; 1BB3 _ 52
        push    eax                                     ; 1BB4 _ 50
        call    boxfill8                                ; 1BB5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BBA _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BBD _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1BC0 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1BC3 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 1BC6 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 1BC9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1BCC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1BCF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1BD2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1BD5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1BD8 _ 8B. 00
        push    esi                                     ; 1BDA _ 56
        push    dword [ebp-10H]                         ; 1BDB _ FF. 75, F0
        push    ebx                                     ; 1BDE _ 53
        push    ecx                                     ; 1BDF _ 51
        push    8                                       ; 1BE0 _ 6A, 08
        push    edx                                     ; 1BE2 _ 52
        push    eax                                     ; 1BE3 _ 50
        call    boxfill8                                ; 1BE4 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1BE9 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 1BEC _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1BEF _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1BF2 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1BF5 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1BF8 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1BFB _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BFE _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1C01 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1C04 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C07 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C0A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C0D _ 8B. 00
        push    edi                                     ; 1C0F _ 57
        push    esi                                     ; 1C10 _ 56
        push    ebx                                     ; 1C11 _ 53
        push    ecx                                     ; 1C12 _ 51
        push    8                                       ; 1C13 _ 6A, 08
        push    edx                                     ; 1C15 _ 52
        push    eax                                     ; 1C16 _ 50
        call    boxfill8                                ; 1C17 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C1C _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 1C1F _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 1C22 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 1C25 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1C28 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 1C2B _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1C2E _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1C31 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1C34 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C37 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C3A _ 8B. 00
        push    dword [ebp-14H]                         ; 1C3C _ FF. 75, EC
        push    dword [ebp-10H]                         ; 1C3F _ FF. 75, F0
        push    esi                                     ; 1C42 _ 56
        push    ebx                                     ; 1C43 _ 53
        push    ecx                                     ; 1C44 _ 51
        push    edx                                     ; 1C45 _ 52
        push    eax                                     ; 1C46 _ 50
        call    boxfill8                                ; 1C47 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 1C4C _ 83. C4, 1C
        nop                                             ; 1C4F _ 90
        lea     esp, [ebp-0CH]                          ; 1C50 _ 8D. 65, F4
        pop     ebx                                     ; 1C53 _ 5B
        pop     esi                                     ; 1C54 _ 5E
        pop     edi                                     ; 1C55 _ 5F
        pop     ebp                                     ; 1C56 _ 5D
        ret                                             ; 1C57 _ C3
; make_textbox8 End of function

memman_init:; Function begin
        push    ebp                                     ; 1C58 _ 55
        mov     ebp, esp                                ; 1C59 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1C5B _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1C5E _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C64 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1C67 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C6E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1C71 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C78 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1C7B _ C7. 40, 0C, 00000000
        nop                                             ; 1C82 _ 90
        pop     ebp                                     ; 1C83 _ 5D
        ret                                             ; 1C84 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1C85 _ 55
        mov     ebp, esp                                ; 1C86 _ 89. E5
        sub     esp, 16                                 ; 1C88 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C8B _ C7. 45, F8, 00000000
        mov     dword [ebp-4H], 0                       ; 1C92 _ C7. 45, FC, 00000000
        jmp     ?_077                                   ; 1C99 _ EB, 13

?_076:  mov     eax, dword [ebp+8H]                     ; 1C9B _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1C9E _ 8B. 55, FC
        add     edx, 2                                  ; 1CA1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CA4 _ 8B. 44 D0, 04
        add     dword [ebp-8H], eax                     ; 1CA8 _ 01. 45, F8
        inc     dword [ebp-4H]                          ; 1CAB _ FF. 45, FC
?_077:  mov     eax, dword [ebp+8H]                     ; 1CAE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CB1 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1CB3 _ 39. 45, FC
        jc      ?_076                                   ; 1CB6 _ 72, E3
        mov     eax, dword [ebp-8H]                     ; 1CB8 _ 8B. 45, F8
        leave                                           ; 1CBB _ C9
        ret                                             ; 1CBC _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1CBD _ 55
        mov     ebp, esp                                ; 1CBE _ 89. E5
        sub     esp, 16                                 ; 1CC0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CC3 _ C7. 45, FC, 00000000
        jmp     ?_081                                   ; 1CCA _ E9, 00000084

?_078:  mov     eax, dword [ebp+8H]                     ; 1CCF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CD2 _ 8B. 55, FC
        add     edx, 2                                  ; 1CD5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CD8 _ 8B. 44 D0, 04
        cmp     dword [ebp+0CH], eax                    ; 1CDC _ 39. 45, 0C
        ja      ?_080                                   ; 1CDF _ 77, 6F
        mov     eax, dword [ebp+8H]                     ; 1CE1 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CE4 _ 8B. 55, FC
        add     edx, 2                                  ; 1CE7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1CEA _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 1CED _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1CF0 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1CF3 _ 8B. 55, FC
        add     edx, 2                                  ; 1CF6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1CF9 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1CFC _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1CFF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D02 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D05 _ 8B. 55, FC
        add     edx, 2                                  ; 1D08 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1D0B _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D0E _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D11 _ 8B. 55, FC
        add     edx, 2                                  ; 1D14 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D17 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D1B _ 2B. 45, 0C
        mov     edx, eax                                ; 1D1E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D20 _ 8B. 45, 08
        mov     ecx, dword [ebp-4H]                     ; 1D23 _ 8B. 4D, FC
        add     ecx, 2                                  ; 1D26 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D29 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D2D _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 1D30 _ 8B. 55, FC
        add     edx, 2                                  ; 1D33 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D36 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1D3A _ 85. C0
        jnz     ?_079                                   ; 1D3C _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1D3E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D41 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D43 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D46 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D49 _ 89. 10
?_079:  mov     eax, dword [ebp-8H]                     ; 1D4B _ 8B. 45, F8
        jmp     ?_082                                   ; 1D4E _ EB, 16

?_080:  inc     dword [ebp-4H]                          ; 1D50 _ FF. 45, FC
?_081:  mov     eax, dword [ebp+8H]                     ; 1D53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D56 _ 8B. 00
        cmp     dword [ebp-4H], eax                     ; 1D58 _ 39. 45, FC
        jc      ?_078                                   ; 1D5B _ 0F 82, FFFFFF6E
        mov     eax, 0                                  ; 1D61 _ B8, 00000000
?_082:  leave                                           ; 1D66 _ C9
        ret                                             ; 1D67 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1D68 _ 55
        mov     ebp, esp                                ; 1D69 _ 89. E5
        push    ebx                                     ; 1D6B _ 53
        sub     esp, 16                                 ; 1D6C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1D6F _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1D76 _ EB, 14

?_083:  mov     eax, dword [ebp+8H]                     ; 1D78 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D7B _ 8B. 55, F8
        add     edx, 2                                  ; 1D7E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D81 _ 8B. 04 D0
        cmp     dword [ebp+0CH], eax                    ; 1D84 _ 39. 45, 0C
        jc      ?_085                                   ; 1D87 _ 72, 0F
        inc     dword [ebp-8H]                          ; 1D89 _ FF. 45, F8
?_084:  mov     eax, dword [ebp+8H]                     ; 1D8C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D8F _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1D91 _ 39. 45, F8
        jl      ?_083                                   ; 1D94 _ 7C, E2
        jmp     ?_086                                   ; 1D96 _ EB, 01

?_085:  nop                                             ; 1D98 _ 90
?_086:  cmp     dword [ebp-8H], 0                       ; 1D99 _ 83. 7D, F8, 00
        jle     ?_088                                   ; 1D9D _ 0F 8E, 000000BA
        mov     eax, dword [ebp-8H]                     ; 1DA3 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1DA6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DA9 _ 8B. 45, 08
        add     edx, 2                                  ; 1DAC _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1DAF _ 8B. 14 D0
        mov     eax, dword [ebp-8H]                     ; 1DB2 _ 8B. 45, F8
        lea     ecx, [eax-1H]                           ; 1DB5 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1DB8 _ 8B. 45, 08
        add     ecx, 2                                  ; 1DBB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1DBE _ 8B. 44 C8, 04
        add     eax, edx                                ; 1DC2 _ 01. D0
        cmp     dword [ebp+0CH], eax                    ; 1DC4 _ 39. 45, 0C
        jne     ?_088                                   ; 1DC7 _ 0F 85, 00000090
        mov     eax, dword [ebp-8H]                     ; 1DCD _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1DD0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DD3 _ 8B. 45, 08
        add     edx, 2                                  ; 1DD6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DD9 _ 8B. 54 D0, 04
        mov     eax, dword [ebp-8H]                     ; 1DDD _ 8B. 45, F8
        lea     ebx, [eax-1H]                           ; 1DE0 _ 8D. 58, FF
        mov     eax, dword [ebp+10H]                    ; 1DE3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DE6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DE9 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1DEC _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1DEF _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DF3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DF6 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1DF8 _ 39. 45, F8
        jge     ?_087                                   ; 1DFB _ 7D, 56
        mov     edx, dword [ebp+0CH]                    ; 1DFD _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E00 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E03 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E06 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E09 _ 8B. 55, F8
        add     edx, 2                                  ; 1E0C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E0F _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E12 _ 39. C1
        jnz     ?_087                                   ; 1E14 _ 75, 3D
        mov     eax, dword [ebp-8H]                     ; 1E16 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E19 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E1C _ 8B. 45, 08
        add     edx, 2                                  ; 1E1F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E22 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E26 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1E29 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1E2C _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E2F _ 8B. 44 C8, 04
        mov     ecx, dword [ebp-8H]                     ; 1E33 _ 8B. 4D, F8
        lea     ebx, [ecx-1H]                           ; 1E36 _ 8D. 59, FF
        lea     ecx, [edx+eax]                          ; 1E39 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E3C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E3F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E42 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E46 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E49 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1E4B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E4E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E51 _ 89. 10
?_087:  mov     eax, 0                                  ; 1E53 _ B8, 00000000
        jmp     ?_094                                   ; 1E58 _ E9, 0000011B

?_088:  mov     eax, dword [ebp+8H]                     ; 1E5D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E60 _ 8B. 00
        cmp     dword [ebp-8H], eax                     ; 1E62 _ 39. 45, F8
        jge     ?_089                                   ; 1E65 _ 7D, 52
        mov     edx, dword [ebp+0CH]                    ; 1E67 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 1E6A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E6D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E70 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E73 _ 8B. 55, F8
        add     edx, 2                                  ; 1E76 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E79 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E7C _ 39. C1
        jnz     ?_089                                   ; 1E7E _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1E80 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E83 _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1E86 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E89 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1E8C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1E8F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1E92 _ 8B. 55, F8
        add     edx, 2                                  ; 1E95 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E98 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1E9C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E9F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EA2 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1EA5 _ 8B. 55, F8
        add     edx, 2                                  ; 1EA8 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1EAB _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1EAF _ B8, 00000000
        jmp     ?_094                                   ; 1EB4 _ E9, 000000BF

?_089:  mov     eax, dword [ebp+8H]                     ; 1EB9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EBC _ 8B. 00
        cmp     eax, 4095                               ; 1EBE _ 3D, 00000FFF
        jg      ?_093                                   ; 1EC3 _ 0F 8F, 00000086
        mov     eax, dword [ebp+8H]                     ; 1EC9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ECC _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 1ECE _ 89. 45, F4
        jmp     ?_091                                   ; 1ED1 _ EB, 27

?_090:  mov     eax, dword [ebp-0CH]                    ; 1ED3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1ED6 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1ED9 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 1EDC _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 1EDF _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1EE2 _ 8B. 45, 08
        add     edx, 2                                  ; 1EE5 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1EE8 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1EEB _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1EED _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1EF0 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1EF3 _ 89. 54 D9, 04
        dec     dword [ebp-0CH]                         ; 1EF7 _ FF. 4D, F4
?_091:  mov     eax, dword [ebp-0CH]                    ; 1EFA _ 8B. 45, F4
        cmp     eax, dword [ebp-8H]                     ; 1EFD _ 3B. 45, F8
        jg      ?_090                                   ; 1F00 _ 7F, D1
        mov     eax, dword [ebp+8H]                     ; 1F02 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F05 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F07 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F0A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F0D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F0F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F12 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F15 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F18 _ 8B. 00
        cmp     edx, eax                                ; 1F1A _ 39. C2
        jge     ?_092                                   ; 1F1C _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1F1E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F21 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F23 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F26 _ 89. 50, 04
?_092:  mov     eax, dword [ebp+8H]                     ; 1F29 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F2C _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F2F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1F32 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1F35 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F38 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1F3B _ 8B. 55, F8
        lea     ecx, [edx+2H]                           ; 1F3E _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1F41 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1F44 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1F48 _ B8, 00000000
        jmp     ?_094                                   ; 1F4D _ EB, 29

?_093:  mov     eax, dword [ebp+8H]                     ; 1F4F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F52 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1F55 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F58 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F5B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F5E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F61 _ 8B. 40, 08
        mov     edx, eax                                ; 1F64 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1F66 _ 8B. 45, 10
        add     eax, edx                                ; 1F69 _ 01. D0
        mov     edx, eax                                ; 1F6B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F6D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F70 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1F73 _ B8, FFFFFFFF
?_094:  add     esp, 16                                 ; 1F78 _ 83. C4, 10
        pop     ebx                                     ; 1F7B _ 5B
        pop     ebp                                     ; 1F7C _ 5D
        ret                                             ; 1F7D _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1F7E _ 55
        mov     ebp, esp                                ; 1F7F _ 89. E5
        sub     esp, 16                                 ; 1F81 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 1F84 _ 8B. 45, 0C
        add     eax, 4095                               ; 1F87 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1F8C _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1F91 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 1F94 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1F97 _ FF. 75, 08
        call    memman_alloc                            ; 1F9A _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 1F9F _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 1FA2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FA5 _ 8B. 45, FC
        leave                                           ; 1FA8 _ C9
        ret                                             ; 1FA9 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1FAA _ 55
        mov     ebp, esp                                ; 1FAB _ 89. E5
        sub     esp, 16                                 ; 1FAD _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 1FB0 _ 8B. 45, 10
        add     eax, 4095                               ; 1FB3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FB8 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1FBD _ 89. 45, 10
        push    dword [ebp+10H]                         ; 1FC0 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 1FC3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 1FC6 _ FF. 75, 08
        call    memman_free                             ; 1FC9 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 1FCE _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 1FD1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FD4 _ 8B. 45, FC
        leave                                           ; 1FD7 _ C9
        ret                                             ; 1FD8 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 1FD9 _ 55
        mov     ebp, esp                                ; 1FDA _ 89. E5
        sub     esp, 24                                 ; 1FDC _ 83. EC, 18
        sub     esp, 8                                  ; 1FDF _ 83. EC, 08
        push    9232                                    ; 1FE2 _ 68, 00002410
        push    dword [ebp+8H]                          ; 1FE7 _ FF. 75, 08
        call    memman_alloc_4k                         ; 1FEA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FEF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1FF2 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 1FF5 _ 83. 7D, F0, 00
        jnz     ?_095                                   ; 1FF9 _ 75, 0A
        mov     eax, 0                                  ; 1FFB _ B8, 00000000
        jmp     ?_099                                   ; 2000 _ E9, 00000099

?_095:  mov     eax, dword [ebp+10H]                    ; 2005 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2008 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 200C _ 83. EC, 08
        push    eax                                     ; 200F _ 50
        push    dword [ebp+8H]                          ; 2010 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2013 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2018 _ 83. C4, 10
        mov     edx, eax                                ; 201B _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 201D _ 8B. 45, F0
        mov     dword [eax+4H], edx                     ; 2020 _ 89. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2023 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2026 _ 8B. 40, 04
        test    eax, eax                                ; 2029 _ 85. C0
        jnz     ?_096                                   ; 202B _ 75, 1E
        mov     eax, dword [ebp-10H]                    ; 202D _ 8B. 45, F0
        sub     esp, 4                                  ; 2030 _ 83. EC, 04
        push    9232                                    ; 2033 _ 68, 00002410
        push    eax                                     ; 2038 _ 50
        push    dword [ebp+8H]                          ; 2039 _ FF. 75, 08
        call    memman_free_4k                          ; 203C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2041 _ 83. C4, 10
        mov     eax, 0                                  ; 2044 _ B8, 00000000
        jmp     ?_099                                   ; 2049 _ EB, 53

?_096:  mov     eax, dword [ebp-10H]                    ; 204B _ 8B. 45, F0
        mov     edx, dword [ebp+0CH]                    ; 204E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2051 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2053 _ 8B. 45, F0
        mov     edx, dword [ebp+10H]                    ; 2056 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 2059 _ 89. 50, 08
        mov     eax, dword [ebp-10H]                    ; 205C _ 8B. 45, F0
        mov     edx, dword [ebp+14H]                    ; 205F _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 2062 _ 89. 50, 0C
        mov     eax, dword [ebp-10H]                    ; 2065 _ 8B. 45, F0
        mov     dword [eax+10H], -1                     ; 2068 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-0CH], 0                      ; 206F _ C7. 45, F4, 00000000
        jmp     ?_098                                   ; 2076 _ EB, 1A

?_097:  mov     eax, dword [ebp-10H]                    ; 2078 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 207B _ 8B. 55, F4
        add     edx, 33                                 ; 207E _ 83. C2, 21
        shl     edx, 5                                  ; 2081 _ C1. E2, 05
        add     eax, edx                                ; 2084 _ 01. D0
        add     eax, 16                                 ; 2086 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2089 _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 208F _ FF. 45, F4
?_098:  cmp     dword [ebp-0CH], 255                    ; 2092 _ 81. 7D, F4, 000000FF
        jle     ?_097                                   ; 2099 _ 7E, DD
        mov     eax, dword [ebp-10H]                    ; 209B _ 8B. 45, F0
?_099:  leave                                           ; 209E _ C9
        ret                                             ; 209F _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 20A0 _ 55
        mov     ebp, esp                                ; 20A1 _ 89. E5
        sub     esp, 16                                 ; 20A3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 20A6 _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 20AD _ EB, 5A

?_100:  mov     eax, dword [ebp+8H]                     ; 20AF _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20B2 _ 8B. 55, FC
        add     edx, 33                                 ; 20B5 _ 83. C2, 21
        shl     edx, 5                                  ; 20B8 _ C1. E2, 05
        add     eax, edx                                ; 20BB _ 01. D0
        add     eax, 16                                 ; 20BD _ 83. C0, 10
        mov     eax, dword [eax]                        ; 20C0 _ 8B. 00
        test    eax, eax                                ; 20C2 _ 85. C0
        jnz     ?_101                                   ; 20C4 _ 75, 40
        mov     eax, dword [ebp-4H]                     ; 20C6 _ 8B. 45, FC
        shl     eax, 5                                  ; 20C9 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 20CC _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 20D2 _ 8B. 45, 08
        add     eax, edx                                ; 20D5 _ 01. D0
        add     eax, 4                                  ; 20D7 _ 83. C0, 04
        mov     dword [ebp-8H], eax                     ; 20DA _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 20DD _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 20E0 _ 8B. 55, FC
        lea     ecx, [edx+4H]                           ; 20E3 _ 8D. 4A, 04
        mov     edx, dword [ebp-8H]                     ; 20E6 _ 8B. 55, F8
        mov     dword [eax+ecx*4+4H], edx               ; 20E9 _ 89. 54 88, 04
        mov     eax, dword [ebp-8H]                     ; 20ED _ 8B. 45, F8
        mov     dword [eax+1CH], 1                      ; 20F0 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-8H]                     ; 20F7 _ 8B. 45, F8
        mov     dword [eax+18H], -1                     ; 20FA _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-8H]                     ; 2101 _ 8B. 45, F8
        jmp     ?_103                                   ; 2104 _ EB, 11

?_101:  inc     dword [ebp-4H]                          ; 2106 _ FF. 45, FC
?_102:  cmp     dword [ebp-4H], 255                     ; 2109 _ 81. 7D, FC, 000000FF
        jle     ?_100                                   ; 2110 _ 7E, 9D
        mov     eax, 0                                  ; 2112 _ B8, 00000000
?_103:  leave                                           ; 2117 _ C9
        ret                                             ; 2118 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2119 _ 55
        mov     ebp, esp                                ; 211A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 211C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 211F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2122 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2124 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2127 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 212A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 212D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2130 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2133 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2136 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2139 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 213C _ 89. 50, 14
        nop                                             ; 213F _ 90
        pop     ebp                                     ; 2140 _ 5D
        ret                                             ; 2141 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2142 _ 55
        mov     ebp, esp                                ; 2143 _ 89. E5
        push    esi                                     ; 2145 _ 56
        push    ebx                                     ; 2146 _ 53
        sub     esp, 16                                 ; 2147 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 214A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 214D _ 8B. 40, 18
        mov     dword [ebp-10H], eax                    ; 2150 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 2153 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2156 _ 8B. 40, 10
        inc     eax                                     ; 2159 _ 40
        cmp     dword [ebp+10H], eax                    ; 215A _ 39. 45, 10
        jle     ?_104                                   ; 215D _ 7E, 0A
        mov     eax, dword [ebp+8H]                     ; 215F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2162 _ 8B. 40, 10
        inc     eax                                     ; 2165 _ 40
        mov     dword [ebp+10H], eax                    ; 2166 _ 89. 45, 10
?_104:  cmp     dword [ebp+10H], -1                     ; 2169 _ 83. 7D, 10, FF
        jge     ?_105                                   ; 216D _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 216F _ C7. 45, 10, FFFFFFFF
?_105:  mov     eax, dword [ebp+0CH]                    ; 2176 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2179 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 217C _ 89. 50, 18
        mov     eax, dword [ebp-10H]                    ; 217F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2182 _ 3B. 45, 10
        jle     ?_112                                   ; 2185 _ 0F 8E, 000001D3
        cmp     dword [ebp+10H], 0                      ; 218B _ 83. 7D, 10, 00
        js      ?_108                                   ; 218F _ 0F 88, 000000E1
        mov     eax, dword [ebp-10H]                    ; 2195 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2198 _ 89. 45, F4
        jmp     ?_107                                   ; 219B _ EB, 33

?_106:  mov     eax, dword [ebp-0CH]                    ; 219D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 21A0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21A3 _ 8B. 45, 08
        add     edx, 4                                  ; 21A6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21A9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21AD _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 21B0 _ 8B. 4D, F4
        add     ecx, 4                                  ; 21B3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21B6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21BA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21BD _ 8B. 55, F4
        add     edx, 4                                  ; 21C0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 21C3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 21C7 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 21CA _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 21CD _ FF. 4D, F4
?_107:  mov     eax, dword [ebp-0CH]                    ; 21D0 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 21D3 _ 3B. 45, 10
        jg      ?_106                                   ; 21D6 _ 7F, C5
        mov     eax, dword [ebp+8H]                     ; 21D8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 21DB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 21DE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 21E1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 21E4 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 21E8 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 21EB _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 21EE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21F1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21F4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 21F7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 21FA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 21FD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2200 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2203 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2206 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2209 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 220C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 220F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2212 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2215 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2218 _ 83. EC, 08
        push    esi                                     ; 221B _ 56
        push    ebx                                     ; 221C _ 53
        push    ecx                                     ; 221D _ 51
        push    edx                                     ; 221E _ 52
        push    eax                                     ; 221F _ 50
        push    dword [ebp+8H]                          ; 2220 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2223 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2228 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 222B _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 222E _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2231 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2234 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2237 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 223A _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 223D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2240 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2243 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2246 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2249 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 224C _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 224F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2252 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2255 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2258 _ 8B. 40, 0C
        sub     esp, 4                                  ; 225B _ 83. EC, 04
        push    dword [ebp-10H]                         ; 225E _ FF. 75, F0
        push    esi                                     ; 2261 _ 56
        push    ebx                                     ; 2262 _ 53
        push    ecx                                     ; 2263 _ 51
        push    edx                                     ; 2264 _ 52
        push    eax                                     ; 2265 _ 50
        push    dword [ebp+8H]                          ; 2266 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2269 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 226E _ 83. C4, 20
        jmp     ?_119                                   ; 2271 _ E9, 00000239

?_108:  mov     eax, dword [ebp+8H]                     ; 2276 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2279 _ 8B. 40, 10
        cmp     dword [ebp-10H], eax                    ; 227C _ 39. 45, F0
        jge     ?_111                                   ; 227F _ 7D, 46
        mov     eax, dword [ebp-10H]                    ; 2281 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2284 _ 89. 45, F4
        jmp     ?_110                                   ; 2287 _ EB, 33

?_109:  mov     eax, dword [ebp-0CH]                    ; 2289 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 228C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 228F _ 8B. 45, 08
        add     edx, 4                                  ; 2292 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2295 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2299 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 229C _ 8B. 4D, F4
        add     ecx, 4                                  ; 229F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22A2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 22A6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22A9 _ 8B. 55, F4
        add     edx, 4                                  ; 22AC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 22AF _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 22B3 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 22B6 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 22B9 _ FF. 45, F4
?_110:  mov     eax, dword [ebp+8H]                     ; 22BC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22BF _ 8B. 40, 10
        cmp     dword [ebp-0CH], eax                    ; 22C2 _ 39. 45, F4
        jl      ?_109                                   ; 22C5 _ 7C, C2
?_111:  mov     eax, dword [ebp+8H]                     ; 22C7 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 22CA _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 22CD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22D0 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 22D3 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22D9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22DC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 22DF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 22E2 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 22E5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22E8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22EB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 22EE _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 22F1 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22F4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22F7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22FA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22FD _ 8B. 40, 0C
        sub     esp, 8                                  ; 2300 _ 83. EC, 08
        push    0                                       ; 2303 _ 6A, 00
        push    ebx                                     ; 2305 _ 53
        push    ecx                                     ; 2306 _ 51
        push    edx                                     ; 2307 _ 52
        push    eax                                     ; 2308 _ 50
        push    dword [ebp+8H]                          ; 2309 _ FF. 75, 08
        call    sheet_refreshmap                        ; 230C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2311 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2314 _ 8B. 45, F0
        lea     esi, [eax-1H]                           ; 2317 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 231A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 231D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2320 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2323 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2326 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2329 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 232C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 232F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2332 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2335 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2338 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 233B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 233E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2341 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2344 _ 83. EC, 04
        push    esi                                     ; 2347 _ 56
        push    0                                       ; 2348 _ 6A, 00
        push    ebx                                     ; 234A _ 53
        push    ecx                                     ; 234B _ 51
        push    edx                                     ; 234C _ 52
        push    eax                                     ; 234D _ 50
        push    dword [ebp+8H]                          ; 234E _ FF. 75, 08
        call    sheet_refreshsub                        ; 2351 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2356 _ 83. C4, 20
        jmp     ?_119                                   ; 2359 _ E9, 00000151

?_112:  mov     eax, dword [ebp-10H]                    ; 235E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2361 _ 3B. 45, 10
        jge     ?_119                                   ; 2364 _ 0F 8D, 00000145
        cmp     dword [ebp-10H], 0                      ; 236A _ 83. 7D, F0, 00
        js      ?_115                                   ; 236E _ 78, 55
        mov     eax, dword [ebp-10H]                    ; 2370 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 2373 _ 89. 45, F4
        jmp     ?_114                                   ; 2376 _ EB, 33

?_113:  mov     eax, dword [ebp-0CH]                    ; 2378 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 237B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 237E _ 8B. 45, 08
        add     edx, 4                                  ; 2381 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2384 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2388 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 238B _ 8B. 4D, F4
        add     ecx, 4                                  ; 238E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2391 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2395 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2398 _ 8B. 55, F4
        add     edx, 4                                  ; 239B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 239E _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 23A2 _ 8B. 55, F4
        mov     dword [eax+18H], edx                    ; 23A5 _ 89. 50, 18
        inc     dword [ebp-0CH]                         ; 23A8 _ FF. 45, F4
?_114:  mov     eax, dword [ebp-0CH]                    ; 23AB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23AE _ 3B. 45, 10
        jl      ?_113                                   ; 23B1 _ 7C, C5
        mov     eax, dword [ebp+8H]                     ; 23B3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 23B6 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 23B9 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 23BC _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 23BF _ 89. 54 88, 04
        jmp     ?_118                                   ; 23C3 _ EB, 69

?_115:  mov     eax, dword [ebp+8H]                     ; 23C5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 23C8 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 23CB _ 89. 45, F4
        jmp     ?_117                                   ; 23CE _ EB, 37

?_116:  mov     eax, dword [ebp-0CH]                    ; 23D0 _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 23D3 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 23D6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23D9 _ 8B. 55, F4
        add     edx, 4                                  ; 23DC _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23DF _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23E3 _ 8B. 45, 08
        add     ecx, 4                                  ; 23E6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 23E9 _ 89. 54 88, 04
        mov     eax, dword [ebp-0CH]                    ; 23ED _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 23F0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23F3 _ 8B. 45, 08
        add     edx, 4                                  ; 23F6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 23F9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-0CH]                    ; 23FD _ 8B. 55, F4
        inc     edx                                     ; 2400 _ 42
        mov     dword [eax+18H], edx                    ; 2401 _ 89. 50, 18
        dec     dword [ebp-0CH]                         ; 2404 _ FF. 4D, F4
?_117:  mov     eax, dword [ebp-0CH]                    ; 2407 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 240A _ 3B. 45, 10
        jge     ?_116                                   ; 240D _ 7D, C1
        mov     eax, dword [ebp+8H]                     ; 240F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2412 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2415 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2418 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 241B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 241F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2422 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2425 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2428 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 242B _ 89. 50, 10
?_118:  mov     eax, dword [ebp+0CH]                    ; 242E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2431 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2434 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2437 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 243A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 243D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2440 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2443 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2446 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2449 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 244C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 244F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2452 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2455 _ 8B. 40, 0C
        sub     esp, 8                                  ; 2458 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 245B _ FF. 75, 10
        push    ebx                                     ; 245E _ 53
        push    ecx                                     ; 245F _ 51
        push    edx                                     ; 2460 _ 52
        push    eax                                     ; 2461 _ 50
        push    dword [ebp+8H]                          ; 2462 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2465 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 246A _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 246D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2470 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2473 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2476 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2479 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 247C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 247F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2482 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2485 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2488 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 248B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 248E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2491 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2494 _ 8B. 40, 0C
        sub     esp, 4                                  ; 2497 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 249A _ FF. 75, 10
        push    dword [ebp+10H]                         ; 249D _ FF. 75, 10
        push    ebx                                     ; 24A0 _ 53
        push    ecx                                     ; 24A1 _ 51
        push    edx                                     ; 24A2 _ 52
        push    eax                                     ; 24A3 _ 50
        push    dword [ebp+8H]                          ; 24A4 _ FF. 75, 08
        call    sheet_refreshsub                        ; 24A7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24AC _ 83. C4, 20
?_119:  nop                                             ; 24AF _ 90
        lea     esp, [ebp-8H]                           ; 24B0 _ 8D. 65, F8
        pop     ebx                                     ; 24B3 _ 5B
        pop     esi                                     ; 24B4 _ 5E
        pop     ebp                                     ; 24B5 _ 5D
        ret                                             ; 24B6 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 24B7 _ 55
        mov     ebp, esp                                ; 24B8 _ 89. E5
        push    edi                                     ; 24BA _ 57
        push    esi                                     ; 24BB _ 56
        push    ebx                                     ; 24BC _ 53
        sub     esp, 28                                 ; 24BD _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 24C0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24C3 _ 8B. 40, 18
        test    eax, eax                                ; 24C6 _ 85. C0
        js      ?_120                                   ; 24C8 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 24CA _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 24CD _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 24D0 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 24D3 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 24D6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24D9 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 24DC _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 24DF _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 24E2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24E5 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 24E8 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 24EB _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 24EE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24F1 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 24F4 _ 8B. 45, 14
        add     edx, eax                                ; 24F7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 24F9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24FC _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 24FF _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2502 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 2505 _ 03. 45, E4
        sub     esp, 4                                  ; 2508 _ 83. EC, 04
        push    ebx                                     ; 250B _ 53
        push    ecx                                     ; 250C _ 51
        push    edi                                     ; 250D _ 57
        push    esi                                     ; 250E _ 56
        push    edx                                     ; 250F _ 52
        push    eax                                     ; 2510 _ 50
        push    dword [ebp+8H]                          ; 2511 _ FF. 75, 08
        call    sheet_refreshsub                        ; 2514 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2519 _ 83. C4, 20
?_120:  mov     eax, 0                                  ; 251C _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 2521 _ 8D. 65, F4
        pop     ebx                                     ; 2524 _ 5B
        pop     esi                                     ; 2525 _ 5E
        pop     edi                                     ; 2526 _ 5F
        pop     ebp                                     ; 2527 _ 5D
        ret                                             ; 2528 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2529 _ 55
        mov     ebp, esp                                ; 252A _ 89. E5
        push    esi                                     ; 252C _ 56
        push    ebx                                     ; 252D _ 53
        sub     esp, 16                                 ; 252E _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 2531 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2534 _ 8B. 40, 0C
        mov     dword [ebp-0CH], eax                    ; 2537 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 253A _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 253D _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 2540 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2543 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2546 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2549 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 254C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 254F _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2552 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2555 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2558 _ 8B. 40, 18
        test    eax, eax                                ; 255B _ 85. C0
        js      ?_121                                   ; 255D _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 2563 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2566 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 2569 _ 8B. 45, F0
        add     edx, eax                                ; 256C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 256E _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2571 _ 8B. 48, 04
        mov     eax, dword [ebp-0CH]                    ; 2574 _ 8B. 45, F4
        add     eax, ecx                                ; 2577 _ 01. C8
        sub     esp, 8                                  ; 2579 _ 83. EC, 08
        push    0                                       ; 257C _ 6A, 00
        push    edx                                     ; 257E _ 52
        push    eax                                     ; 257F _ 50
        push    dword [ebp-10H]                         ; 2580 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 2583 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 2586 _ FF. 75, 08
        call    sheet_refreshmap                        ; 2589 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 258E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 2591 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2594 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2597 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 259A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 259D _ 8B. 55, 14
        add     ecx, edx                                ; 25A0 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25A2 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 25A5 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 25A8 _ 8B. 55, 10
        add     edx, ebx                                ; 25AB _ 01. DA
        sub     esp, 8                                  ; 25AD _ 83. EC, 08
        push    eax                                     ; 25B0 _ 50
        push    ecx                                     ; 25B1 _ 51
        push    edx                                     ; 25B2 _ 52
        push    dword [ebp+14H]                         ; 25B3 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 25B6 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 25B9 _ FF. 75, 08
        call    sheet_refreshmap                        ; 25BC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25C1 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25C4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25C7 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 25CA _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 25CD _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25D0 _ 8B. 50, 08
        mov     eax, dword [ebp-10H]                    ; 25D3 _ 8B. 45, F0
        add     edx, eax                                ; 25D6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25D8 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 25DB _ 8B. 58, 04
        mov     eax, dword [ebp-0CH]                    ; 25DE _ 8B. 45, F4
        add     eax, ebx                                ; 25E1 _ 01. D8
        sub     esp, 4                                  ; 25E3 _ 83. EC, 04
        push    ecx                                     ; 25E6 _ 51
        push    0                                       ; 25E7 _ 6A, 00
        push    edx                                     ; 25E9 _ 52
        push    eax                                     ; 25EA _ 50
        push    dword [ebp-10H]                         ; 25EB _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 25EE _ FF. 75, F4
        push    dword [ebp+8H]                          ; 25F1 _ FF. 75, 08
        call    sheet_refreshsub                        ; 25F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25F9 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 25FC _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 25FF _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 2602 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2605 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 2608 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 260B _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 260E _ 8B. 4D, 14
        add     ebx, ecx                                ; 2611 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 2613 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 2616 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 2619 _ 8B. 4D, 10
        add     ecx, esi                                ; 261C _ 01. F1
        sub     esp, 4                                  ; 261E _ 83. EC, 04
        push    edx                                     ; 2621 _ 52
        push    eax                                     ; 2622 _ 50
        push    ebx                                     ; 2623 _ 53
        push    ecx                                     ; 2624 _ 51
        push    dword [ebp+14H]                         ; 2625 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2628 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 262B _ FF. 75, 08
        call    sheet_refreshsub                        ; 262E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2633 _ 83. C4, 20
?_121:  nop                                             ; 2636 _ 90
        lea     esp, [ebp-8H]                           ; 2637 _ 8D. 65, F8
        pop     ebx                                     ; 263A _ 5B
        pop     esi                                     ; 263B _ 5E
        pop     ebp                                     ; 263C _ 5D
        ret                                             ; 263D _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 263E _ 55
        mov     ebp, esp                                ; 263F _ 89. E5
        sub     esp, 48                                 ; 2641 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2644 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2647 _ 8B. 00
        mov     dword [ebp-10H], eax                    ; 2649 _ 89. 45, F0
        mov     eax, dword [ebp+8H]                     ; 264C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 264F _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 2652 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2655 _ 83. 7D, 0C, 00
        jns     ?_122                                   ; 2659 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 265B _ C7. 45, 0C, 00000000
?_122:  cmp     dword [ebp+10H], 8                      ; 2662 _ 83. 7D, 10, 08
        jg      ?_123                                   ; 2666 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 2668 _ C7. 45, 10, 00000000
?_123:  mov     eax, dword [ebp+8H]                     ; 266F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2672 _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 2675 _ 39. 45, 14
        jle     ?_124                                   ; 2678 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 267A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 267D _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 2680 _ 89. 45, 14
?_124:  mov     eax, dword [ebp+8H]                     ; 2683 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2686 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2689 _ 39. 45, 18
        jle     ?_125                                   ; 268C _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 268E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2691 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 2694 _ 89. 45, 18
?_125:  mov     eax, dword [ebp+1CH]                    ; 2697 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 269A _ 89. 45, FC
        jmp     ?_132                                   ; 269D _ E9, 0000010E

?_126:  mov     eax, dword [ebp+8H]                     ; 26A2 _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 26A5 _ 8B. 55, FC
        add     edx, 4                                  ; 26A8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26AB _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 26AF _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 26B2 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 26B5 _ 8B. 00
        mov     dword [ebp-1CH], eax                    ; 26B7 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 26BA _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 26BD _ 8D. 90, 00000414
        mov     eax, dword [ebp-18H]                    ; 26C3 _ 8B. 45, E8
        sub     eax, edx                                ; 26C6 _ 29. D0
        sar     eax, 5                                  ; 26C8 _ C1. F8, 05
        mov     byte [ebp-1DH], al                      ; 26CB _ 88. 45, E3
        mov     dword [ebp-0CH], 0                      ; 26CE _ C7. 45, F4, 00000000
        jmp     ?_131                                   ; 26D5 _ E9, 000000C4

?_127:  mov     eax, dword [ebp-18H]                    ; 26DA _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 26DD _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 26E0 _ 8B. 45, F4
        add     eax, edx                                ; 26E3 _ 01. D0
        mov     dword [ebp-24H], eax                    ; 26E5 _ 89. 45, DC
        mov     dword [ebp-8H], 0                       ; 26E8 _ C7. 45, F8, 00000000
        jmp     ?_130                                   ; 26EF _ E9, 00000098

?_128:  mov     eax, dword [ebp-18H]                    ; 26F4 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 26F7 _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 26FA _ 8B. 45, F8
        add     eax, edx                                ; 26FD _ 01. D0
        mov     dword [ebp-28H], eax                    ; 26FF _ 89. 45, D8
        mov     eax, dword [ebp+0CH]                    ; 2702 _ 8B. 45, 0C
        cmp     eax, dword [ebp-28H]                    ; 2705 _ 3B. 45, D8
        jg      ?_129                                   ; 2708 _ 7F, 7F
        mov     eax, dword [ebp-28H]                    ; 270A _ 8B. 45, D8
        cmp     eax, dword [ebp+14H]                    ; 270D _ 3B. 45, 14
        jge     ?_129                                   ; 2710 _ 7D, 77
        mov     eax, dword [ebp+10H]                    ; 2712 _ 8B. 45, 10
        cmp     eax, dword [ebp-24H]                    ; 2715 _ 3B. 45, DC
        jg      ?_129                                   ; 2718 _ 7F, 6F
        mov     eax, dword [ebp-24H]                    ; 271A _ 8B. 45, DC
        cmp     eax, dword [ebp+18H]                    ; 271D _ 3B. 45, 18
        jge     ?_129                                   ; 2720 _ 7D, 67
        mov     eax, dword [ebp-18H]                    ; 2722 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2725 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2728 _ 0F AF. 45, F4
        mov     edx, eax                                ; 272C _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 272E _ 8B. 45, F8
        add     eax, edx                                ; 2731 _ 01. D0
        mov     edx, eax                                ; 2733 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 2735 _ 8B. 45, E4
        add     eax, edx                                ; 2738 _ 01. D0
        mov     al, byte [eax]                          ; 273A _ 8A. 00
        mov     byte [ebp-29H], al                      ; 273C _ 88. 45, D7
        mov     eax, dword [ebp+8H]                     ; 273F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2742 _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2745 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2749 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 274B _ 8B. 45, D8
        add     eax, edx                                ; 274E _ 01. D0
        mov     edx, eax                                ; 2750 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2752 _ 8B. 45, EC
        add     eax, edx                                ; 2755 _ 01. D0
        mov     al, byte [eax]                          ; 2757 _ 8A. 00
        cmp     byte [ebp-1DH], al                      ; 2759 _ 38. 45, E3
        jnz     ?_129                                   ; 275C _ 75, 2B
        movzx   edx, byte [ebp-29H]                     ; 275E _ 0F B6. 55, D7
        mov     eax, dword [ebp-18H]                    ; 2762 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2765 _ 8B. 40, 14
        cmp     edx, eax                                ; 2768 _ 39. C2
        jz      ?_129                                   ; 276A _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 276C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 276F _ 8B. 40, 08
        imul    eax, dword [ebp-24H]                    ; 2772 _ 0F AF. 45, DC
        mov     edx, eax                                ; 2776 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 2778 _ 8B. 45, D8
        add     eax, edx                                ; 277B _ 01. D0
        mov     edx, eax                                ; 277D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 277F _ 8B. 45, F0
        add     edx, eax                                ; 2782 _ 01. C2
        mov     al, byte [ebp-29H]                      ; 2784 _ 8A. 45, D7
        mov     byte [edx], al                          ; 2787 _ 88. 02
?_129:  inc     dword [ebp-8H]                          ; 2789 _ FF. 45, F8
?_130:  mov     eax, dword [ebp-18H]                    ; 278C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 278F _ 8B. 40, 04
        cmp     dword [ebp-8H], eax                     ; 2792 _ 39. 45, F8
        jl      ?_128                                   ; 2795 _ 0F 8C, FFFFFF59
        inc     dword [ebp-0CH]                         ; 279B _ FF. 45, F4
?_131:  mov     eax, dword [ebp-18H]                    ; 279E _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 27A1 _ 8B. 40, 08
        cmp     dword [ebp-0CH], eax                    ; 27A4 _ 39. 45, F4
        jl      ?_127                                   ; 27A7 _ 0F 8C, FFFFFF2D
        inc     dword [ebp-4H]                          ; 27AD _ FF. 45, FC
?_132:  mov     eax, dword [ebp-4H]                     ; 27B0 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 27B3 _ 3B. 45, 20
        jle     ?_126                                   ; 27B6 _ 0F 8E, FFFFFEE6
        nop                                             ; 27BC _ 90
        nop                                             ; 27BD _ 90
        leave                                           ; 27BE _ C9
        ret                                             ; 27BF _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 27C0 _ 55
        mov     ebp, esp                                ; 27C1 _ 89. E5
        sub     esp, 64                                 ; 27C3 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 27C6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27C9 _ 8B. 40, 04
        mov     dword [ebp-20H], eax                    ; 27CC _ 89. 45, E0
        cmp     dword [ebp+0CH], 0                      ; 27CF _ 83. 7D, 0C, 00
        jns     ?_133                                   ; 27D3 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 27D5 _ C7. 45, 0C, 00000000
?_133:  cmp     dword [ebp+10H], 0                      ; 27DC _ 83. 7D, 10, 00
        jns     ?_134                                   ; 27E0 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 27E2 _ C7. 45, 10, 00000000
?_134:  mov     eax, dword [ebp+8H]                     ; 27E9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27EC _ 8B. 40, 08
        cmp     dword [ebp+14H], eax                    ; 27EF _ 39. 45, 14
        jle     ?_135                                   ; 27F2 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 27F4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27F7 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 27FA _ 89. 45, 14
?_135:  mov     eax, dword [ebp+8H]                     ; 27FD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2800 _ 8B. 40, 0C
        cmp     dword [ebp+18H], eax                    ; 2803 _ 39. 45, 18
        jle     ?_136                                   ; 2806 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2808 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 280B _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 280E _ 89. 45, 18
?_136:  mov     eax, dword [ebp+1CH]                    ; 2811 _ 8B. 45, 1C
        mov     dword [ebp-4H], eax                     ; 2814 _ 89. 45, FC
        jmp     ?_147                                   ; 2817 _ E9, 00000137

?_137:  mov     eax, dword [ebp+8H]                     ; 281C _ 8B. 45, 08
        mov     edx, dword [ebp-4H]                     ; 281F _ 8B. 55, FC
        add     edx, 4                                  ; 2822 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2825 _ 8B. 44 90, 04
        mov     dword [ebp-24H], eax                    ; 2829 _ 89. 45, DC
        mov     eax, dword [ebp+8H]                     ; 282C _ 8B. 45, 08
        lea     edx, [eax+414H]                         ; 282F _ 8D. 90, 00000414
        mov     eax, dword [ebp-24H]                    ; 2835 _ 8B. 45, DC
        sub     eax, edx                                ; 2838 _ 29. D0
        sar     eax, 5                                  ; 283A _ C1. F8, 05
        mov     byte [ebp-25H], al                      ; 283D _ 88. 45, DB
        mov     eax, dword [ebp-24H]                    ; 2840 _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 2843 _ 8B. 00
        mov     dword [ebp-2CH], eax                    ; 2845 _ 89. 45, D4
        mov     eax, dword [ebp-24H]                    ; 2848 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 284B _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 284E _ 8B. 55, 0C
        sub     edx, eax                                ; 2851 _ 29. C2
        mov     eax, edx                                ; 2853 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 2855 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 2858 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 285B _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 285E _ 8B. 55, 10
        sub     edx, eax                                ; 2861 _ 29. C2
        mov     eax, edx                                ; 2863 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2865 _ 89. 45, EC
        mov     eax, dword [ebp-24H]                    ; 2868 _ 8B. 45, DC
        mov     eax, dword [eax+0CH]                    ; 286B _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 286E _ 8B. 55, 14
        sub     edx, eax                                ; 2871 _ 29. C2
        mov     eax, edx                                ; 2873 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2875 _ 89. 45, E8
        mov     eax, dword [ebp-24H]                    ; 2878 _ 8B. 45, DC
        mov     eax, dword [eax+10H]                    ; 287B _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 287E _ 8B. 55, 18
        sub     edx, eax                                ; 2881 _ 29. C2
        mov     eax, edx                                ; 2883 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2885 _ 89. 45, E4
        cmp     dword [ebp-10H], 0                      ; 2888 _ 83. 7D, F0, 00
        jns     ?_138                                   ; 288C _ 79, 07
        mov     dword [ebp-10H], 0                      ; 288E _ C7. 45, F0, 00000000
?_138:  cmp     dword [ebp-14H], 0                      ; 2895 _ 83. 7D, EC, 00
        jns     ?_139                                   ; 2899 _ 79, 07
        mov     dword [ebp-14H], 0                      ; 289B _ C7. 45, EC, 00000000
?_139:  mov     eax, dword [ebp-24H]                    ; 28A2 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28A5 _ 8B. 40, 04
        cmp     dword [ebp-18H], eax                    ; 28A8 _ 39. 45, E8
        jle     ?_140                                   ; 28AB _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 28AD _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28B0 _ 8B. 40, 04
        mov     dword [ebp-18H], eax                    ; 28B3 _ 89. 45, E8
?_140:  mov     eax, dword [ebp-24H]                    ; 28B6 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28B9 _ 8B. 40, 08
        cmp     dword [ebp-1CH], eax                    ; 28BC _ 39. 45, E4
        jle     ?_141                                   ; 28BF _ 7E, 09
        mov     eax, dword [ebp-24H]                    ; 28C1 _ 8B. 45, DC
        mov     eax, dword [eax+8H]                     ; 28C4 _ 8B. 40, 08
        mov     dword [ebp-1CH], eax                    ; 28C7 _ 89. 45, E4
?_141:  mov     eax, dword [ebp-14H]                    ; 28CA _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 28CD _ 89. 45, F4
        jmp     ?_146                                   ; 28D0 _ EB, 76

?_142:  mov     eax, dword [ebp-24H]                    ; 28D2 _ 8B. 45, DC
        mov     edx, dword [eax+10H]                    ; 28D5 _ 8B. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 28D8 _ 8B. 45, F4
        add     eax, edx                                ; 28DB _ 01. D0
        mov     dword [ebp-30H], eax                    ; 28DD _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 28E0 _ 8B. 45, F0
        mov     dword [ebp-8H], eax                     ; 28E3 _ 89. 45, F8
        jmp     ?_145                                   ; 28E6 _ EB, 55

?_143:  mov     eax, dword [ebp-24H]                    ; 28E8 _ 8B. 45, DC
        mov     edx, dword [eax+0CH]                    ; 28EB _ 8B. 50, 0C
        mov     eax, dword [ebp-8H]                     ; 28EE _ 8B. 45, F8
        add     eax, edx                                ; 28F1 _ 01. D0
        mov     dword [ebp-34H], eax                    ; 28F3 _ 89. 45, CC
        mov     eax, dword [ebp-24H]                    ; 28F6 _ 8B. 45, DC
        mov     eax, dword [eax+4H]                     ; 28F9 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 28FC _ 0F AF. 45, F4
        mov     edx, eax                                ; 2900 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2902 _ 8B. 45, F8
        add     eax, edx                                ; 2905 _ 01. D0
        mov     edx, eax                                ; 2907 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 2909 _ 8B. 45, D4
        add     eax, edx                                ; 290C _ 01. D0
        mov     al, byte [eax]                          ; 290E _ 8A. 00
        movzx   edx, al                                 ; 2910 _ 0F B6. D0
        mov     eax, dword [ebp-24H]                    ; 2913 _ 8B. 45, DC
        mov     eax, dword [eax+14H]                    ; 2916 _ 8B. 40, 14
        cmp     edx, eax                                ; 2919 _ 39. C2
        jz      ?_144                                   ; 291B _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 291D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2920 _ 8B. 40, 08
        imul    eax, dword [ebp-30H]                    ; 2923 _ 0F AF. 45, D0
        mov     edx, eax                                ; 2927 _ 89. C2
        mov     eax, dword [ebp-34H]                    ; 2929 _ 8B. 45, CC
        add     eax, edx                                ; 292C _ 01. D0
        mov     edx, eax                                ; 292E _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2930 _ 8B. 45, E0
        add     edx, eax                                ; 2933 _ 01. C2
        mov     al, byte [ebp-25H]                      ; 2935 _ 8A. 45, DB
        mov     byte [edx], al                          ; 2938 _ 88. 02
?_144:  inc     dword [ebp-8H]                          ; 293A _ FF. 45, F8
?_145:  mov     eax, dword [ebp-8H]                     ; 293D _ 8B. 45, F8
        cmp     eax, dword [ebp-18H]                    ; 2940 _ 3B. 45, E8
        jl      ?_143                                   ; 2943 _ 7C, A3
        inc     dword [ebp-0CH]                         ; 2945 _ FF. 45, F4
?_146:  mov     eax, dword [ebp-0CH]                    ; 2948 _ 8B. 45, F4
        cmp     eax, dword [ebp-1CH]                    ; 294B _ 3B. 45, E4
        jl      ?_142                                   ; 294E _ 7C, 82
        inc     dword [ebp-4H]                          ; 2950 _ FF. 45, FC
?_147:  mov     eax, dword [ebp+8H]                     ; 2953 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2956 _ 8B. 40, 10
        cmp     dword [ebp-4H], eax                     ; 2959 _ 39. 45, FC
        jle     ?_137                                   ; 295C _ 0F 8E, FFFFFEBA
        nop                                             ; 2962 _ 90
        leave                                           ; 2963 _ C9
        ret                                             ; 2964 _ C3
; sheet_refreshmap End of function

init_pit:; Function begin
        push    ebp                                     ; 2965 _ 55
        mov     ebp, esp                                ; 2966 _ 89. E5
        sub     esp, 24                                 ; 2968 _ 83. EC, 18
        sub     esp, 8                                  ; 296B _ 83. EC, 08
        push    52                                      ; 296E _ 6A, 34
        push    67                                      ; 2970 _ 6A, 43
        call    io_out8                                 ; 2972 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2977 _ 83. C4, 10
        sub     esp, 8                                  ; 297A _ 83. EC, 08
        push    156                                     ; 297D _ 68, 0000009C
        push    64                                      ; 2982 _ 6A, 40
        call    io_out8                                 ; 2984 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2989 _ 83. C4, 10
        sub     esp, 8                                  ; 298C _ 83. EC, 08
        push    46                                      ; 298F _ 6A, 2E
        push    64                                      ; 2991 _ 6A, 40
        call    io_out8                                 ; 2993 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2998 _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 299B _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 29A5 _ C7. 45, F4, 00000000
        jmp     ?_149                                   ; 29AC _ EB, 25

?_148:  mov     eax, dword [ebp-0CH]                    ; 29AE _ 8B. 45, F4
        shl     eax, 4                                  ; 29B1 _ C1. E0, 04
        add     eax, ?_203                              ; 29B4 _ 05, 00000388(d)
        mov     dword [eax], 0                          ; 29B9 _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 29BF _ 8B. 45, F4
        shl     eax, 4                                  ; 29C2 _ C1. E0, 04
        add     eax, ?_204                              ; 29C5 _ 05, 0000038C(d)
        mov     dword [eax], 0                          ; 29CA _ C7. 00, 00000000
        inc     dword [ebp-0CH]                         ; 29D0 _ FF. 45, F4
?_149:  cmp     dword [ebp-0CH], 499                    ; 29D3 _ 81. 7D, F4, 000001F3
        jle     ?_148                                   ; 29DA _ 7E, D2
        nop                                             ; 29DC _ 90
        nop                                             ; 29DD _ 90
        leave                                           ; 29DE _ C9
        ret                                             ; 29DF _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 29E0 _ 55
        mov     ebp, esp                                ; 29E1 _ 89. E5
        sub     esp, 16                                 ; 29E3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 29E6 _ C7. 45, FC, 00000000
        jmp     ?_152                                   ; 29ED _ EB, 35

?_150:  mov     eax, dword [ebp-4H]                     ; 29EF _ 8B. 45, FC
        shl     eax, 4                                  ; 29F2 _ C1. E0, 04
        add     eax, ?_203                              ; 29F5 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 29FA _ 8B. 00
        test    eax, eax                                ; 29FC _ 85. C0
        jnz     ?_151                                   ; 29FE _ 75, 21
        mov     eax, dword [ebp-4H]                     ; 2A00 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A03 _ C1. E0, 04
        add     eax, ?_203                              ; 2A06 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2A0B _ C7. 00, 00000001
        mov     eax, dword [ebp-4H]                     ; 2A11 _ 8B. 45, FC
        shl     eax, 4                                  ; 2A14 _ C1. E0, 04
        add     eax, timerctl                           ; 2A17 _ 05, 00000380(d)
        add     eax, 4                                  ; 2A1C _ 83. C0, 04
        jmp     ?_153                                   ; 2A1F _ EB, 11

?_151:  inc     dword [ebp-4H]                          ; 2A21 _ FF. 45, FC
?_152:  cmp     dword [ebp-4H], 499                     ; 2A24 _ 81. 7D, FC, 000001F3
        jle     ?_150                                   ; 2A2B _ 7E, C2
        mov     eax, 0                                  ; 2A2D _ B8, 00000000
?_153:  leave                                           ; 2A32 _ C9
        ret                                             ; 2A33 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A34 _ 55
        mov     ebp, esp                                ; 2A35 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A37 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A3A _ C7. 40, 04, 00000000
        nop                                             ; 2A41 _ 90
        pop     ebp                                     ; 2A42 _ 5D
        ret                                             ; 2A43 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A44 _ 55
        mov     ebp, esp                                ; 2A45 _ 89. E5
        sub     esp, 4                                  ; 2A47 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A4A _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A4D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A50 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A53 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2A56 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A59 _ 8B. 45, 08
        mov     dl, byte [ebp-4H]                       ; 2A5C _ 8A. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A5F _ 88. 50, 0C
        nop                                             ; 2A62 _ 90
        leave                                           ; 2A63 _ C9
        ret                                             ; 2A64 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A65 _ 55
        mov     ebp, esp                                ; 2A66 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A68 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A6B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2A6E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2A70 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2A73 _ C7. 40, 04, 00000002
        nop                                             ; 2A7A _ 90
        pop     ebp                                     ; 2A7B _ 5D
        ret                                             ; 2A7C _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 2A7D _ 55
        mov     ebp, esp                                ; 2A7E _ 89. E5
        sub     esp, 24                                 ; 2A80 _ 83. EC, 18
        sub     esp, 8                                  ; 2A83 _ 83. EC, 08
        push    32                                      ; 2A86 _ 6A, 20
        push    32                                      ; 2A88 _ 6A, 20
        call    io_out8                                 ; 2A8A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2A8F _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 2A92 _ A1, 00000380(d)
        inc     eax                                     ; 2A97 _ 40
        mov     dword [timerctl], eax                   ; 2A98 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 2A9D _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 2AA1 _ C7. 45, F4, 00000000
        jmp     ?_157                                   ; 2AA8 _ E9, 000000A8

?_154:  mov     eax, dword [ebp-0CH]                    ; 2AAD _ 8B. 45, F4
        shl     eax, 4                                  ; 2AB0 _ C1. E0, 04
        add     eax, ?_203                              ; 2AB3 _ 05, 00000388(d)
        mov     eax, dword [eax]                        ; 2AB8 _ 8B. 00
        cmp     eax, 2                                  ; 2ABA _ 83. F8, 02
        jne     ?_155                                   ; 2ABD _ 0F 85, 00000084
        mov     eax, dword [ebp-0CH]                    ; 2AC3 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AC6 _ C1. E0, 04
        add     eax, ?_202                              ; 2AC9 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2ACE _ 8B. 00
        lea     edx, [eax-1H]                           ; 2AD0 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2AD3 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AD6 _ C1. E0, 04
        add     eax, ?_202                              ; 2AD9 _ 05, 00000384(d)
        mov     dword [eax], edx                        ; 2ADE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2AE0 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AE3 _ C1. E0, 04
        add     eax, ?_202                              ; 2AE6 _ 05, 00000384(d)
        mov     eax, dword [eax]                        ; 2AEB _ 8B. 00
        test    eax, eax                                ; 2AED _ 85. C0
        jnz     ?_155                                   ; 2AEF _ 75, 56
        mov     eax, dword [ebp-0CH]                    ; 2AF1 _ 8B. 45, F4
        shl     eax, 4                                  ; 2AF4 _ C1. E0, 04
        add     eax, ?_203                              ; 2AF7 _ 05, 00000388(d)
        mov     dword [eax], 1                          ; 2AFC _ C7. 00, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2B02 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B05 _ C1. E0, 04
        add     eax, ?_205                              ; 2B08 _ 05, 00000390(d)
        mov     al, byte [eax]                          ; 2B0D _ 8A. 00
        movzx   edx, al                                 ; 2B0F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2B12 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B15 _ C1. E0, 04
        add     eax, ?_204                              ; 2B18 _ 05, 0000038C(d)
        mov     eax, dword [eax]                        ; 2B1D _ 8B. 00
        sub     esp, 8                                  ; 2B1F _ 83. EC, 08
        push    edx                                     ; 2B22 _ 52
        push    eax                                     ; 2B23 _ 50
        call    fifo8_put                               ; 2B24 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B29 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 2B2C _ 8B. 45, F4
        shl     eax, 4                                  ; 2B2F _ C1. E0, 04
        add     eax, timerctl                           ; 2B32 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 2B37 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 2B3A _ A1, 00000000(d)
        cmp     edx, eax                                ; 2B3F _ 39. C2
        jnz     ?_155                                   ; 2B41 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 2B43 _ C6. 45, F3, 01
?_155:  cmp     byte [ebp-0DH], 0                       ; 2B47 _ 80. 7D, F3, 00
        jz      ?_156                                   ; 2B4B _ 74, 05
        call    task_switch                             ; 2B4D _ E8, FFFFFFFC(rel)
?_156:  inc     dword [ebp-0CH]                         ; 2B52 _ FF. 45, F4
?_157:  cmp     dword [ebp-0CH], 499                    ; 2B55 _ 81. 7D, F4, 000001F3
        jle     ?_154                                   ; 2B5C _ 0F 8E, FFFFFF4B
        nop                                             ; 2B62 _ 90
        leave                                           ; 2B63 _ C9
        ret                                             ; 2B64 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 2B65 _ 55
        mov     ebp, esp                                ; 2B66 _ 89. E5
        mov     eax, timerctl                           ; 2B68 _ B8, 00000380(d)
        pop     ebp                                     ; 2B6D _ 5D
        ret                                             ; 2B6E _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2B6F _ 55
        mov     ebp, esp                                ; 2B70 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B72 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B75 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2B78 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2B7B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2B7E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2B81 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2B83 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B86 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2B89 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2B8C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2B8F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B96 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B99 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BA0 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2BA3 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BAA _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2BAD _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2BB0 _ 89. 50, 18
        nop                                             ; 2BB3 _ 90
        pop     ebp                                     ; 2BB4 _ 5D
        ret                                             ; 2BB5 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2BB6 _ 55
        mov     ebp, esp                                ; 2BB7 _ 89. E5
        sub     esp, 24                                 ; 2BB9 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2BBC _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 2BBF _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 2BC2 _ 83. 7D, 08, 00
        jnz     ?_158                                   ; 2BC6 _ 75, 0A
        mov     eax, 4294967295                         ; 2BC8 _ B8, FFFFFFFF
        jmp     ?_162                                   ; 2BCD _ E9, 0000009D

?_158:  mov     eax, dword [ebp+8H]                     ; 2BD2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BD5 _ 8B. 40, 10
        test    eax, eax                                ; 2BD8 _ 85. C0
        jnz     ?_159                                   ; 2BDA _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 2BDC _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2BDF _ 8B. 40, 14
        or      eax, 01H                                ; 2BE2 _ 83. C8, 01
        mov     edx, eax                                ; 2BE5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BE7 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2BEA _ 89. 50, 14
        mov     eax, 4294967295                         ; 2BED _ B8, FFFFFFFF
        jmp     ?_162                                   ; 2BF2 _ EB, 7B

?_159:  mov     eax, dword [ebp+8H]                     ; 2BF4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2BF7 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2BF9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BFC _ 8B. 40, 04
        add     edx, eax                                ; 2BFF _ 01. C2
        mov     al, byte [ebp-0CH]                      ; 2C01 _ 8A. 45, F4
        mov     byte [edx], al                          ; 2C04 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2C06 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C09 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2C0C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2C0F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2C12 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C15 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2C18 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2C1B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C1E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2C21 _ 39. C2
        jnz     ?_160                                   ; 2C23 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2C25 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C28 _ C7. 40, 04, 00000000
?_160:  mov     eax, dword [ebp+8H]                     ; 2C2F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C32 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2C35 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C38 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2C3B _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C3E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C41 _ 8B. 40, 18
        test    eax, eax                                ; 2C44 _ 85. C0
        jz      ?_161                                   ; 2C46 _ 74, 22
        mov     eax, dword [ebp+8H]                     ; 2C48 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C4B _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2C4E _ 8B. 40, 04
        cmp     eax, 2                                  ; 2C51 _ 83. F8, 02
        jz      ?_161                                   ; 2C54 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 2C56 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2C59 _ 8B. 40, 18
        sub     esp, 8                                  ; 2C5C _ 83. EC, 08
        push    0                                       ; 2C5F _ 6A, 00
        push    eax                                     ; 2C61 _ 50
        call    task_run                                ; 2C62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C67 _ 83. C4, 10
?_161:  mov     eax, 0                                  ; 2C6A _ B8, 00000000
?_162:  leave                                           ; 2C6F _ C9
        ret                                             ; 2C70 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2C71 _ 55
        mov     ebp, esp                                ; 2C72 _ 89. E5
        sub     esp, 16                                 ; 2C74 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2C77 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2C7A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2C7D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2C80 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2C83 _ 39. C2
        jnz     ?_163                                   ; 2C85 _ 75, 07
        mov     eax, 4294967295                         ; 2C87 _ B8, FFFFFFFF
        jmp     ?_165                                   ; 2C8C _ EB, 50

?_163:  mov     eax, dword [ebp+8H]                     ; 2C8E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2C91 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2C93 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C96 _ 8B. 40, 08
        add     eax, edx                                ; 2C99 _ 01. D0
        mov     al, byte [eax]                          ; 2C9B _ 8A. 00
        movzx   eax, al                                 ; 2C9D _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2CA0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2CA3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CA6 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2CA9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CAC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2CAF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CB2 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2CB5 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CB8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CBB _ 8B. 40, 0C
        cmp     edx, eax                                ; 2CBE _ 39. C2
        jnz     ?_164                                   ; 2CC0 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2CC2 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2CC5 _ C7. 40, 08, 00000000
?_164:  mov     eax, dword [ebp+8H]                     ; 2CCC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CCF _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2CD2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CD5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2CD8 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2CDB _ 8B. 45, FC
?_165:  leave                                           ; 2CDE _ C9
        ret                                             ; 2CDF _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2CE0 _ 55
        mov     ebp, esp                                ; 2CE1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2CE3 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2CE6 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2CE9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CEC _ 8B. 40, 10
        sub     edx, eax                                ; 2CEF _ 29. C2
        mov     eax, edx                                ; 2CF1 _ 89. D0
        pop     ebp                                     ; 2CF3 _ 5D
        ret                                             ; 2CF4 _ C3
; fifo8_status End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 2CF5 _ 55
        mov     ebp, esp                                ; 2CF6 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 2CF8 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_166                                   ; 2CFF _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 2D01 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 2D08 _ 8B. 45, 0C
        shr     eax, 12                                 ; 2D0B _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 2D0E _ 89. 45, 0C
?_166:  mov     eax, dword [ebp+0CH]                    ; 2D11 _ 8B. 45, 0C
        mov     edx, dword [ebp+8H]                     ; 2D14 _ 8B. 55, 08
        mov     word [edx], ax                          ; 2D17 _ 66: 89. 02
        mov     eax, dword [ebp+10H]                    ; 2D1A _ 8B. 45, 10
        mov     edx, dword [ebp+8H]                     ; 2D1D _ 8B. 55, 08
        mov     word [edx+2H], ax                       ; 2D20 _ 66: 89. 42, 02
        mov     eax, dword [ebp+10H]                    ; 2D24 _ 8B. 45, 10
        sar     eax, 16                                 ; 2D27 _ C1. F8, 10
        mov     dl, al                                  ; 2D2A _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D2C _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 2D2F _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 2D32 _ 8B. 45, 14
        mov     dl, al                                  ; 2D35 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D37 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 2D3A _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 2D3D _ 8B. 45, 0C
        shr     eax, 16                                 ; 2D40 _ C1. E8, 10
        and     eax, 0FH                                ; 2D43 _ 83. E0, 0F
        mov     dl, al                                  ; 2D46 _ 88. C2
        mov     eax, dword [ebp+14H]                    ; 2D48 _ 8B. 45, 14
        sar     eax, 8                                  ; 2D4B _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 2D4E _ 83. E0, F0
        or      eax, edx                                ; 2D51 _ 09. D0
        mov     dl, al                                  ; 2D53 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D55 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 2D58 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 2D5B _ 8B. 45, 10
        shr     eax, 24                                 ; 2D5E _ C1. E8, 18
        mov     dl, al                                  ; 2D61 _ 88. C2
        mov     eax, dword [ebp+8H]                     ; 2D63 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 2D66 _ 88. 50, 07
        nop                                             ; 2D69 _ 90
        pop     ebp                                     ; 2D6A _ 5D
        ret                                             ; 2D6B _ C3
; set_segmdesc End of function

task_init:; Function begin
        push    ebp                                     ; 2D6C _ 55
        mov     ebp, esp                                ; 2D6D _ 89. E5
        push    ebx                                     ; 2D6F _ 53
        sub     esp, 20                                 ; 2D70 _ 83. EC, 14
        call    get_addr_gdt                            ; 2D73 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2D78 _ 89. 45, F0
        sub     esp, 8                                  ; 2D7B _ 83. EC, 08
        push    608                                     ; 2D7E _ 68, 00000260
        push    dword [ebp+8H]                          ; 2D83 _ FF. 75, 08
        call    memman_alloc_4k                         ; 2D86 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D8B _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 2D8E _ A3, 000022C8(d)
        mov     dword [ebp-0CH], 0                      ; 2D93 _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 2D9A _ E9, 000000A0

?_167:  mov     ecx, dword [taskctl]                    ; 2D9F _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2DA5 _ 8B. 55, F4
        mov     eax, edx                                ; 2DA8 _ 89. D0
        add     eax, eax                                ; 2DAA _ 01. C0
        add     eax, edx                                ; 2DAC _ 01. D0
        add     eax, eax                                ; 2DAE _ 01. C0
        add     eax, edx                                ; 2DB0 _ 01. D0
        shl     eax, 2                                  ; 2DB2 _ C1. E0, 02
        add     eax, edx                                ; 2DB5 _ 01. D0
        shl     eax, 2                                  ; 2DB7 _ C1. E0, 02
        add     eax, ecx                                ; 2DBA _ 01. C8
        add     eax, 32                                 ; 2DBC _ 83. C0, 20
        mov     dword [eax], 0                          ; 2DBF _ C7. 00, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2DC5 _ 8B. 45, F4
        add     eax, 7                                  ; 2DC8 _ 83. C0, 07
        mov     ebx, dword [taskctl]                    ; 2DCB _ 8B. 1D, 000022C8(d)
        lea     ecx, [eax*8]                            ; 2DD1 _ 8D. 0C C5, 00000000
        mov     edx, dword [ebp-0CH]                    ; 2DD8 _ 8B. 55, F4
        mov     eax, edx                                ; 2DDB _ 89. D0
        add     eax, eax                                ; 2DDD _ 01. C0
        add     eax, edx                                ; 2DDF _ 01. D0
        add     eax, eax                                ; 2DE1 _ 01. C0
        add     eax, edx                                ; 2DE3 _ 01. D0
        shl     eax, 2                                  ; 2DE5 _ C1. E0, 02
        add     eax, edx                                ; 2DE8 _ 01. D0
        shl     eax, 2                                  ; 2DEA _ C1. E0, 02
        add     eax, ebx                                ; 2DED _ 01. D8
        add     eax, 28                                 ; 2DEF _ 83. C0, 1C
        mov     dword [eax], ecx                        ; 2DF2 _ 89. 08
        mov     ecx, dword [taskctl]                    ; 2DF4 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 2DFA _ 8B. 55, F4
        mov     eax, edx                                ; 2DFD _ 89. D0
        add     eax, eax                                ; 2DFF _ 01. C0
        add     eax, edx                                ; 2E01 _ 01. D0
        add     eax, eax                                ; 2E03 _ 01. C0
        add     eax, edx                                ; 2E05 _ 01. D0
        shl     eax, 2                                  ; 2E07 _ C1. E0, 02
        add     eax, edx                                ; 2E0A _ 01. D0
        shl     eax, 2                                  ; 2E0C _ C1. E0, 02
        add     eax, 16                                 ; 2E0F _ 83. C0, 10
        add     eax, ecx                                ; 2E12 _ 01. C8
        add     eax, 24                                 ; 2E14 _ 83. C0, 18
        mov     edx, eax                                ; 2E17 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2E19 _ 8B. 45, F4
        add     eax, 7                                  ; 2E1C _ 83. C0, 07
        lea     ecx, [eax*8]                            ; 2E1F _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E26 _ 8B. 45, F0
        add     eax, ecx                                ; 2E29 _ 01. C8
        push    137                                     ; 2E2B _ 68, 00000089
        push    edx                                     ; 2E30 _ 52
        push    103                                     ; 2E31 _ 6A, 67
        push    eax                                     ; 2E33 _ 50
        call    set_segmdesc                            ; 2E34 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E39 _ 83. C4, 10
        inc     dword [ebp-0CH]                         ; 2E3C _ FF. 45, F4
?_168:  cmp     dword [ebp-0CH], 4                      ; 2E3F _ 83. 7D, F4, 04
        jle     ?_167                                   ; 2E43 _ 0F 8E, FFFFFF56
        call    task_alloc                              ; 2E49 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2E4E _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2E51 _ 8B. 45, EC
        mov     dword [eax+4H], 2                       ; 2E54 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-14H]                    ; 2E5B _ 8B. 45, EC
        mov     dword [eax+8H], 100                     ; 2E5E _ C7. 40, 08, 00000064
        mov     eax, dword [taskctl]                    ; 2E65 _ A1, 000022C8(d)
        mov     dword [eax], 1                          ; 2E6A _ C7. 00, 00000001
        mov     eax, dword [taskctl]                    ; 2E70 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 2E75 _ C7. 40, 04, 00000000
        mov     eax, dword [taskctl]                    ; 2E7C _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 2E81 _ 8B. 55, EC
        mov     dword [eax+8H], edx                     ; 2E84 _ 89. 50, 08
        mov     eax, dword [ebp-14H]                    ; 2E87 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 2E8A _ 8B. 00
        sub     esp, 12                                 ; 2E8C _ 83. EC, 0C
        push    eax                                     ; 2E8F _ 50
        call    load_tr                                 ; 2E90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E95 _ 83. C4, 10
        call    timer_alloc                             ; 2E98 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 2E9D _ A3, 000022C4(d)
        mov     eax, dword [ebp-14H]                    ; 2EA2 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 2EA5 _ 8B. 40, 08
        mov     edx, eax                                ; 2EA8 _ 89. C2
        mov     eax, dword [task_timer]                 ; 2EAA _ A1, 000022C4(d)
        sub     esp, 8                                  ; 2EAF _ 83. EC, 08
        push    edx                                     ; 2EB2 _ 52
        push    eax                                     ; 2EB3 _ 50
        call    timer_settime                           ; 2EB4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EB9 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 2EBC _ 8B. 45, EC
        mov     ebx, dword [ebp-4H]                     ; 2EBF _ 8B. 5D, FC
        leave                                           ; 2EC2 _ C9
        ret                                             ; 2EC3 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 2EC4 _ 55
        mov     ebp, esp                                ; 2EC5 _ 89. E5
        sub     esp, 16                                 ; 2EC7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2ECA _ C7. 45, FC, 00000000
        jmp     ?_171                                   ; 2ED1 _ E9, 000000FD

?_169:  mov     ecx, dword [taskctl]                    ; 2ED6 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 2EDC _ 8B. 55, FC
        mov     eax, edx                                ; 2EDF _ 89. D0
        add     eax, eax                                ; 2EE1 _ 01. C0
        add     eax, edx                                ; 2EE3 _ 01. D0
        add     eax, eax                                ; 2EE5 _ 01. C0
        add     eax, edx                                ; 2EE7 _ 01. D0
        shl     eax, 2                                  ; 2EE9 _ C1. E0, 02
        add     eax, edx                                ; 2EEC _ 01. D0
        shl     eax, 2                                  ; 2EEE _ C1. E0, 02
        add     eax, ecx                                ; 2EF1 _ 01. C8
        add     eax, 32                                 ; 2EF3 _ 83. C0, 20
        mov     eax, dword [eax]                        ; 2EF6 _ 8B. 00
        test    eax, eax                                ; 2EF8 _ 85. C0
        jne     ?_170                                   ; 2EFA _ 0F 85, 000000D0
        mov     ecx, dword [taskctl]                    ; 2F00 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 2F06 _ 8B. 55, FC
        mov     eax, edx                                ; 2F09 _ 89. D0
        add     eax, eax                                ; 2F0B _ 01. C0
        add     eax, edx                                ; 2F0D _ 01. D0
        add     eax, eax                                ; 2F0F _ 01. C0
        add     eax, edx                                ; 2F11 _ 01. D0
        shl     eax, 2                                  ; 2F13 _ C1. E0, 02
        add     eax, edx                                ; 2F16 _ 01. D0
        shl     eax, 2                                  ; 2F18 _ C1. E0, 02
        add     eax, 16                                 ; 2F1B _ 83. C0, 10
        add     eax, ecx                                ; 2F1E _ 01. C8
        add     eax, 12                                 ; 2F20 _ 83. C0, 0C
        mov     dword [ebp-8H], eax                     ; 2F23 _ 89. 45, F8
        mov     eax, dword [ebp-8H]                     ; 2F26 _ 8B. 45, F8
        mov     dword [eax+4H], 1                       ; 2F29 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-8H]                     ; 2F30 _ 8B. 45, F8
        mov     dword [eax+30H], 514                    ; 2F33 _ C7. 40, 30, 00000202
        mov     eax, dword [ebp-8H]                     ; 2F3A _ 8B. 45, F8
        mov     dword [eax+34H], 0                      ; 2F3D _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F44 _ 8B. 45, F8
        mov     dword [eax+38H], 0                      ; 2F47 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F4E _ 8B. 45, F8
        mov     dword [eax+3CH], 0                      ; 2F51 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F58 _ 8B. 45, F8
        mov     dword [eax+40H], 0                      ; 2F5B _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F62 _ 8B. 45, F8
        mov     dword [eax+48H], 0                      ; 2F65 _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-4H]                     ; 2F6C _ 8B. 45, FC
        inc     eax                                     ; 2F6F _ 40
        shl     eax, 9                                  ; 2F70 _ C1. E0, 09
        mov     edx, eax                                ; 2F73 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 2F75 _ 8B. 45, F8
        mov     dword [eax+44H], edx                    ; 2F78 _ 89. 50, 44
        mov     eax, dword [ebp-8H]                     ; 2F7B _ 8B. 45, F8
        mov     dword [eax+4CH], 0                      ; 2F7E _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F85 _ 8B. 45, F8
        mov     dword [eax+50H], 0                      ; 2F88 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F8F _ 8B. 45, F8
        mov     dword [eax+54H], 0                      ; 2F92 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-8H]                     ; 2F99 _ 8B. 45, F8
        mov     dword [eax+60H], 0                      ; 2F9C _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 2FA3 _ 8B. 45, F8
        mov     dword [eax+64H], 0                      ; 2FA6 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-8H]                     ; 2FAD _ 8B. 45, F8
        mov     dword [eax+68H], 0                      ; 2FB0 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 2FB7 _ 8B. 45, F8
        mov     dword [eax+6CH], 0                      ; 2FBA _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-8H]                     ; 2FC1 _ 8B. 45, F8
        mov     dword [eax+70H], 1073741824             ; 2FC4 _ C7. 40, 70, 40000000
        mov     eax, dword [ebp-8H]                     ; 2FCB _ 8B. 45, F8
        jmp     ?_172                                   ; 2FCE _ EB, 12

?_170:  inc     dword [ebp-4H]                          ; 2FD0 _ FF. 45, FC
?_171:  cmp     dword [ebp-4H], 4                       ; 2FD3 _ 83. 7D, FC, 04
        jle     ?_169                                   ; 2FD7 _ 0F 8E, FFFFFEF9
        mov     eax, 0                                  ; 2FDD _ B8, 00000000
?_172:  leave                                           ; 2FE2 _ C9
        ret                                             ; 2FE3 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 2FE4 _ 55
        mov     ebp, esp                                ; 2FE5 _ 89. E5
        cmp     dword [ebp+0CH], 0                      ; 2FE7 _ 83. 7D, 0C, 00
        jle     ?_173                                   ; 2FEB _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 2FED _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2FF0 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2FF3 _ 89. 50, 08
?_173:  mov     eax, dword [ebp+8H]                     ; 2FF6 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2FF9 _ C7. 40, 04, 00000002
        mov     eax, dword [taskctl]                    ; 3000 _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 3005 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx]                        ; 300B _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 300D _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3010 _ 89. 4C 90, 08
        mov     eax, dword [taskctl]                    ; 3014 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3019 _ 8B. 10
        inc     edx                                     ; 301B _ 42
        mov     dword [eax], edx                        ; 301C _ 89. 10
        nop                                             ; 301E _ 90
        pop     ebp                                     ; 301F _ 5D
        ret                                             ; 3020 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3021 _ 55
        mov     ebp, esp                                ; 3022 _ 89. E5
        sub     esp, 24                                 ; 3024 _ 83. EC, 18
        mov     eax, dword [taskctl]                    ; 3027 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 302C _ 8B. 00
        cmp     eax, 1                                  ; 302E _ 83. F8, 01
        jle     ?_175                                   ; 3031 _ 7E, 7D
        mov     eax, dword [taskctl]                    ; 3033 _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 3038 _ 8B. 50, 04
        inc     edx                                     ; 303B _ 42
        mov     dword [eax+4H], edx                     ; 303C _ 89. 50, 04
        mov     eax, dword [taskctl]                    ; 303F _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 3044 _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 3047 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 304C _ 8B. 00
        cmp     edx, eax                                ; 304E _ 39. C2
        jnz     ?_174                                   ; 3050 _ 75, 0C
        mov     eax, dword [taskctl]                    ; 3052 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 3057 _ C7. 40, 04, 00000000
?_174:  mov     eax, dword [taskctl]                    ; 305E _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 3063 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 3069 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 306C _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3070 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3073 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3076 _ 8B. 40, 08
        mov     edx, eax                                ; 3079 _ 89. C2
        mov     eax, dword [task_timer]                 ; 307B _ A1, 000022C4(d)
        sub     esp, 8                                  ; 3080 _ 83. EC, 08
        push    edx                                     ; 3083 _ 52
        push    eax                                     ; 3084 _ 50
        call    timer_settime                           ; 3085 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 308A _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 308D _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 3092 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 3098 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 309B _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 309F _ 8B. 00
        sub     esp, 8                                  ; 30A1 _ 83. EC, 08
        push    eax                                     ; 30A4 _ 50
        push    0                                       ; 30A5 _ 6A, 00
        call    farjmp                                  ; 30A7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 30AC _ 83. C4, 10
        nop                                             ; 30AF _ 90
?_175:  nop                                             ; 30B0 _ 90
        leave                                           ; 30B1 _ C9
        ret                                             ; 30B2 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 30B3 _ 55
        mov     ebp, esp                                ; 30B4 _ 89. E5
        sub     esp, 24                                 ; 30B6 _ 83. EC, 18
        mov     byte [ebp-0DH], 0                       ; 30B9 _ C6. 45, F3, 00
        mov     eax, dword [ebp+8H]                     ; 30BD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 30C0 _ 8B. 40, 04
        cmp     eax, 2                                  ; 30C3 _ 83. F8, 02
        jne     ?_184                                   ; 30C6 _ 0F 85, 000000E9
        mov     eax, dword [taskctl]                    ; 30CC _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 30D1 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 30D7 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 30DA _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 30DE _ 39. 45, 08
        jnz     ?_176                                   ; 30E1 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 30E3 _ C6. 45, F3, 01
?_176:  mov     dword [ebp-0CH], 0                      ; 30E7 _ C7. 45, F4, 00000000
        jmp     ?_178                                   ; 30EE _ EB, 14

?_177:  mov     eax, dword [taskctl]                    ; 30F0 _ A1, 000022C8(d)
        mov     edx, dword [ebp-0CH]                    ; 30F5 _ 8B. 55, F4
        mov     eax, dword [eax+edx*4+8H]               ; 30F8 _ 8B. 44 90, 08
        cmp     dword [ebp+8H], eax                     ; 30FC _ 39. 45, 08
        jz      ?_179                                   ; 30FF _ 74, 11
        inc     dword [ebp-0CH]                         ; 3101 _ FF. 45, F4
?_178:  mov     eax, dword [taskctl]                    ; 3104 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 3109 _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 310B _ 39. 45, F4
        jl      ?_177                                   ; 310E _ 7C, E0
        jmp     ?_180                                   ; 3110 _ EB, 01

?_179:  nop                                             ; 3112 _ 90
?_180:  mov     eax, dword [taskctl]                    ; 3113 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 3118 _ 8B. 10
        dec     edx                                     ; 311A _ 4A
        mov     dword [eax], edx                        ; 311B _ 89. 10
        mov     eax, dword [taskctl]                    ; 311D _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 3122 _ 8B. 40, 04
        cmp     dword [ebp-0CH], eax                    ; 3125 _ 39. 45, F4
        jge     ?_182                                   ; 3128 _ 7D, 2D
        mov     eax, dword [taskctl]                    ; 312A _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 312F _ 8B. 50, 04
        dec     edx                                     ; 3132 _ 4A
        mov     dword [eax+4H], edx                     ; 3133 _ 89. 50, 04
        jmp     ?_182                                   ; 3136 _ EB, 1F

?_181:  mov     edx, dword [taskctl]                    ; 3138 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-0CH]                    ; 313E _ 8B. 45, F4
        lea     ecx, [eax+1H]                           ; 3141 _ 8D. 48, 01
        mov     eax, dword [taskctl]                    ; 3144 _ A1, 000022C8(d)
        mov     ecx, dword [edx+ecx*4+8H]               ; 3149 _ 8B. 4C 8A, 08
        mov     edx, dword [ebp-0CH]                    ; 314D _ 8B. 55, F4
        mov     dword [eax+edx*4+8H], ecx               ; 3150 _ 89. 4C 90, 08
        inc     dword [ebp-0CH]                         ; 3154 _ FF. 45, F4
?_182:  mov     eax, dword [taskctl]                    ; 3157 _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 315C _ 8B. 00
        cmp     dword [ebp-0CH], eax                    ; 315E _ 39. 45, F4
        jl      ?_181                                   ; 3161 _ 7C, D5
        mov     eax, dword [ebp+8H]                     ; 3163 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3166 _ C7. 40, 04, 00000001
        cmp     byte [ebp-0DH], 0                       ; 316D _ 80. 7D, F3, 00
        jz      ?_184                                   ; 3171 _ 74, 42
        mov     eax, dword [taskctl]                    ; 3173 _ A1, 000022C8(d)
        mov     edx, dword [eax+4H]                     ; 3178 _ 8B. 50, 04
        mov     eax, dword [taskctl]                    ; 317B _ A1, 000022C8(d)
        mov     eax, dword [eax]                        ; 3180 _ 8B. 00
        cmp     edx, eax                                ; 3182 _ 39. C2
        jl      ?_183                                   ; 3184 _ 7C, 0C
        mov     eax, dword [taskctl]                    ; 3186 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 318B _ C7. 40, 04, 00000000
?_183:  mov     eax, dword [taskctl]                    ; 3192 _ A1, 000022C8(d)
        mov     edx, dword [taskctl]                    ; 3197 _ 8B. 15, 000022C8(d)
        mov     edx, dword [edx+4H]                     ; 319D _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 31A0 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 31A4 _ 8B. 00
        sub     esp, 8                                  ; 31A6 _ 83. EC, 08
        push    eax                                     ; 31A9 _ 50
        push    0                                       ; 31AA _ 6A, 00
        call    farjmp                                  ; 31AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31B1 _ 83. C4, 10
        nop                                             ; 31B4 _ 90
?_184:  nop                                             ; 31B5 _ 90
        leave                                           ; 31B6 _ C9
        ret                                             ; 31B7 _ C3
; task_sleep End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_185:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_186:                                                  ; byte
        db 41H, 00H                                     ; 0008 _ A.

?_187:                                                  ; byte
        db 33H, 5BH, 73H, 65H, 63H, 5DH, 00H            ; 000A _ 3[sec].

?_188:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_189:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_190:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_191:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_192:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_193:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0042 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 004A _ w: .


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

?_194:  db 00H                                          ; 0076 _ .

?_195:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0077 _ ........
        db 00H                                          ; 007F _ .

table_rgb.1911:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0080 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1958:                                            ; byte
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

closebtn.2068:                                          ; byte
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

?_196:                                                  ; dword
        resb    2                                       ; 0004

?_197:  resw    1                                       ; 0006

keyinfo:                                                ; byte
        resb    24                                      ; 0008

?_198:  resd    1                                       ; 0020

mouseinfo:                                              ; byte
        resb    28                                      ; 0024

keybuf:                                                 ; yword
        resb    32                                      ; 0040

mousebuf:                                               ; byte
        resb    128                                     ; 0060

mdec:                                                   ; oword
        resb    12                                      ; 00E0

?_199:  resd    1                                       ; 00EC

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

task_b: resd    1                                       ; 0250

g_timer_b:                                              ; oword
        resb    16                                      ; 0254

task_a.1844:                                            ; dword
        resd    1                                       ; 0264

task_b.1828:                                            ; byte
        resd    6                                       ; 0268

tss_a.1843:                                             ; byte
        resb    128                                     ; 0280

tss_b.1842:                                             ; byte
        resb    104                                     ; 0300

str.2006:                                               ; byte
        resb    1                                       ; 0368

?_200:  resb    9                                       ; 0369

?_201:  resb    14                                      ; 0372

timerctl:                                               ; byte
        resd    1                                       ; 0380

?_202:                                                  ; byte
        resb    4                                       ; 0384

?_203:                                                  ; byte
        resb    4                                       ; 0388

?_204:                                                  ; byte
        resb    4                                       ; 038C

?_205:                                                  ; byte
        resb    7988                                    ; 0390

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


