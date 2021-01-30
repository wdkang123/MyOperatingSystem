; Disassembly of file: write_vga_desktop.o
; Fri Jan 29 11:09:15 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 20                                 ; 0004 _ 83. EC, 14
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 001C _ 89. 45, F4
        mov     eax, dword [?_035]                      ; 001F _ A1, 00000104(d)
        cwde                                            ; 0024 _ 98
        mov     dword [ebp-10H], eax                    ; 0025 _ 89. 45, F0
        mov     ax, word [?_036]                        ; 0028 _ 66: A1, 00000106(d)
        cwde                                            ; 002E _ 98
        mov     dword [ebp-14H], eax                    ; 002F _ 89. 45, EC
        call    init_palette                            ; 0032 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0037 _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 003A _ 8D. 50, E3
        mov     eax, dword [ebp-10H]                    ; 003D _ 8B. 45, F0
        dec     eax                                     ; 0040 _ 48
        sub     esp, 4                                  ; 0041 _ 83. EC, 04
        push    edx                                     ; 0044 _ 52
        push    eax                                     ; 0045 _ 50
        push    0                                       ; 0046 _ 6A, 00
        push    0                                       ; 0048 _ 6A, 00
        push    14                                      ; 004A _ 6A, 0E
        push    dword [ebp-10H]                         ; 004C _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 004F _ FF. 75, F4
        call    boxfill8                                ; 0052 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0057 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 005A _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 005D _ 8D. 48, E4
        mov     eax, dword [ebp-10H]                    ; 0060 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 0063 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0066 _ 8B. 45, EC
        sub     eax, 28                                 ; 0069 _ 83. E8, 1C
        sub     esp, 4                                  ; 006C _ 83. EC, 04
        push    ecx                                     ; 006F _ 51
        push    edx                                     ; 0070 _ 52
        push    eax                                     ; 0071 _ 50
        push    0                                       ; 0072 _ 6A, 00
        push    8                                       ; 0074 _ 6A, 08
        push    dword [ebp-10H]                         ; 0076 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0079 _ FF. 75, F4
        call    boxfill8                                ; 007C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0081 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0084 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 0087 _ 8D. 48, E5
        mov     eax, dword [ebp-10H]                    ; 008A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 008D _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0090 _ 8B. 45, EC
        sub     eax, 27                                 ; 0093 _ 83. E8, 1B
        sub     esp, 4                                  ; 0096 _ 83. EC, 04
        push    ecx                                     ; 0099 _ 51
        push    edx                                     ; 009A _ 52
        push    eax                                     ; 009B _ 50
        push    0                                       ; 009C _ 6A, 00
        push    7                                       ; 009E _ 6A, 07
        push    dword [ebp-10H]                         ; 00A0 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00A3 _ FF. 75, F4
        call    boxfill8                                ; 00A6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00AB _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00AE _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00B1 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 00B4 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 00B7 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00BA _ 8B. 45, EC
        sub     eax, 26                                 ; 00BD _ 83. E8, 1A
        sub     esp, 4                                  ; 00C0 _ 83. EC, 04
        push    ecx                                     ; 00C3 _ 51
        push    edx                                     ; 00C4 _ 52
        push    eax                                     ; 00C5 _ 50
        push    0                                       ; 00C6 _ 6A, 00
        push    8                                       ; 00C8 _ 6A, 08
        push    dword [ebp-10H]                         ; 00CA _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00CD _ FF. 75, F4
        call    boxfill8                                ; 00D0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00D5 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00D8 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 00DB _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 00DE _ 8B. 45, EC
        sub     eax, 24                                 ; 00E1 _ 83. E8, 18
        sub     esp, 4                                  ; 00E4 _ 83. EC, 04
        push    edx                                     ; 00E7 _ 52
        push    59                                      ; 00E8 _ 6A, 3B
        push    eax                                     ; 00EA _ 50
        push    3                                       ; 00EB _ 6A, 03
        push    7                                       ; 00ED _ 6A, 07
        push    dword [ebp-10H]                         ; 00EF _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 00F2 _ FF. 75, F4
        call    boxfill8                                ; 00F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00FA _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00FD _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0100 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0103 _ 8B. 45, EC
        sub     eax, 24                                 ; 0106 _ 83. E8, 18
        sub     esp, 4                                  ; 0109 _ 83. EC, 04
        push    edx                                     ; 010C _ 52
        push    2                                       ; 010D _ 6A, 02
        push    eax                                     ; 010F _ 50
        push    2                                       ; 0110 _ 6A, 02
        push    7                                       ; 0112 _ 6A, 07
        push    dword [ebp-10H]                         ; 0114 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0117 _ FF. 75, F4
        call    boxfill8                                ; 011A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 011F _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0122 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0125 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0128 _ 8B. 45, EC
        sub     eax, 4                                  ; 012B _ 83. E8, 04
        sub     esp, 4                                  ; 012E _ 83. EC, 04
        push    edx                                     ; 0131 _ 52
        push    59                                      ; 0132 _ 6A, 3B
        push    eax                                     ; 0134 _ 50
        push    3                                       ; 0135 _ 6A, 03
        push    15                                      ; 0137 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0139 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 013C _ FF. 75, F4
        call    boxfill8                                ; 013F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0144 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0147 _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 014A _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 014D _ 8B. 45, EC
        sub     eax, 23                                 ; 0150 _ 83. E8, 17
        sub     esp, 4                                  ; 0153 _ 83. EC, 04
        push    edx                                     ; 0156 _ 52
        push    59                                      ; 0157 _ 6A, 3B
        push    eax                                     ; 0159 _ 50
        push    59                                      ; 015A _ 6A, 3B
        push    15                                      ; 015C _ 6A, 0F
        push    dword [ebp-10H]                         ; 015E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0161 _ FF. 75, F4
        call    boxfill8                                ; 0164 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0169 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 016C _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 016F _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0172 _ 8B. 45, EC
        sub     eax, 3                                  ; 0175 _ 83. E8, 03
        sub     esp, 4                                  ; 0178 _ 83. EC, 04
        push    edx                                     ; 017B _ 52
        push    59                                      ; 017C _ 6A, 3B
        push    eax                                     ; 017E _ 50
        push    2                                       ; 017F _ 6A, 02
        push    0                                       ; 0181 _ 6A, 00
        push    dword [ebp-10H]                         ; 0183 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0186 _ FF. 75, F4
        call    boxfill8                                ; 0189 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 018E _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0191 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0194 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 0197 _ 8B. 45, EC
        sub     eax, 24                                 ; 019A _ 83. E8, 18
        sub     esp, 4                                  ; 019D _ 83. EC, 04
        push    edx                                     ; 01A0 _ 52
        push    60                                      ; 01A1 _ 6A, 3C
        push    eax                                     ; 01A3 _ 50
        push    60                                      ; 01A4 _ 6A, 3C
        push    0                                       ; 01A6 _ 6A, 00
        push    dword [ebp-10H]                         ; 01A8 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01AB _ FF. 75, F4
        call    boxfill8                                ; 01AE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01B3 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01B6 _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01B9 _ 8D. 58, E8
        mov     eax, dword [ebp-10H]                    ; 01BC _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 01BF _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01C2 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01C5 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 01C8 _ 8B. 45, F0
        sub     eax, 47                                 ; 01CB _ 83. E8, 2F
        sub     esp, 4                                  ; 01CE _ 83. EC, 04
        push    ebx                                     ; 01D1 _ 53
        push    ecx                                     ; 01D2 _ 51
        push    edx                                     ; 01D3 _ 52
        push    eax                                     ; 01D4 _ 50
        push    15                                      ; 01D5 _ 6A, 0F
        push    dword [ebp-10H]                         ; 01D7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 01DA _ FF. 75, F4
        call    boxfill8                                ; 01DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01E2 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01E5 _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 01E8 _ 8D. 58, FC
        mov     eax, dword [ebp-10H]                    ; 01EB _ 8B. 45, F0
        lea     ecx, [eax-2FH]                          ; 01EE _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 01F1 _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 01F4 _ 8D. 50, E9
        mov     eax, dword [ebp-10H]                    ; 01F7 _ 8B. 45, F0
        sub     eax, 47                                 ; 01FA _ 83. E8, 2F
        sub     esp, 4                                  ; 01FD _ 83. EC, 04
        push    ebx                                     ; 0200 _ 53
        push    ecx                                     ; 0201 _ 51
        push    edx                                     ; 0202 _ 52
        push    eax                                     ; 0203 _ 50
        push    15                                      ; 0204 _ 6A, 0F
        push    dword [ebp-10H]                         ; 0206 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0209 _ FF. 75, F4
        call    boxfill8                                ; 020C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0211 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0214 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0217 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 021A _ 8B. 45, F0
        lea     ecx, [eax-4H]                           ; 021D _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 0220 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 0223 _ 8D. 50, FD
        mov     eax, dword [ebp-10H]                    ; 0226 _ 8B. 45, F0
        sub     eax, 47                                 ; 0229 _ 83. E8, 2F
        sub     esp, 4                                  ; 022C _ 83. EC, 04
        push    ebx                                     ; 022F _ 53
        push    ecx                                     ; 0230 _ 51
        push    edx                                     ; 0231 _ 52
        push    eax                                     ; 0232 _ 50
        push    7                                       ; 0233 _ 6A, 07
        push    dword [ebp-10H]                         ; 0235 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0238 _ FF. 75, F4
        call    boxfill8                                ; 023B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0240 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0243 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0246 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 0249 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 024C _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 024F _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 0252 _ 8D. 50, E8
        mov     eax, dword [ebp-10H]                    ; 0255 _ 8B. 45, F0
        sub     eax, 3                                  ; 0258 _ 83. E8, 03
        sub     esp, 4                                  ; 025B _ 83. EC, 04
        push    ebx                                     ; 025E _ 53
        push    ecx                                     ; 025F _ 51
        push    edx                                     ; 0260 _ 52
        push    eax                                     ; 0261 _ 50
        push    7                                       ; 0262 _ 6A, 07
        push    dword [ebp-10H]                         ; 0264 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0267 _ FF. 75, F4
        call    boxfill8                                ; 026A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 026F _ 83. C4, 20
        sub     esp, 8                                  ; 0272 _ 83. EC, 08
        push    14                                      ; 0275 _ 6A, 0E
        push    mcursor                                 ; 0277 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 027C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0281 _ 83. C4, 10
        push    16                                      ; 0284 _ 6A, 10
        push    mcursor                                 ; 0286 _ 68, 00000000(d)
        push    80                                      ; 028B _ 6A, 50
        push    80                                      ; 028D _ 6A, 50
        push    16                                      ; 028F _ 6A, 10
        push    16                                      ; 0291 _ 6A, 10
        push    dword [ebp-10H]                         ; 0293 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0296 _ FF. 75, F4
        call    putblock                                ; 0299 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 029E _ 83. C4, 20
        call    io_sti                                  ; 02A1 _ E8, FFFFFFFC(rel)
?_001:  call    io_hlt                                  ; 02A6 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 02AB _ EB, F9
; CMain End of function

initBootInfo:; Function begin
        push    ebp                                     ; 02AD _ 55
        mov     ebp, esp                                ; 02AE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 02B0 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 02B3 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 02B9 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 02BC _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 02C2 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 02C5 _ 66: C7. 40, 06, 00C8
        nop                                             ; 02CB _ 90
        pop     ebp                                     ; 02CC _ 5D
        ret                                             ; 02CD _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 02CE _ 55
        mov     ebp, esp                                ; 02CF _ 89. E5
        sub     esp, 24                                 ; 02D1 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 02D4 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 02D7 _ 88. 45, F4
        jmp     ?_003                                   ; 02DA _ EB, 35

?_002:  mov     eax, dword [ebp+1CH]                    ; 02DC _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 02DF _ 8A. 00
        movzx   eax, al                                 ; 02E1 _ 0F B6. C0
        shl     eax, 4                                  ; 02E4 _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 02E7 _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 02ED _ 0F BE. 45, F4
        sub     esp, 8                                  ; 02F1 _ 83. EC, 08
        push    edx                                     ; 02F4 _ 52
        push    eax                                     ; 02F5 _ 50
        push    dword [ebp+14H]                         ; 02F6 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 02F9 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 02FC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 02FF _ FF. 75, 08
        call    showFont8                               ; 0302 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0307 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 030A _ 83. 45, 10, 08
        inc     dword [ebp+1CH]                         ; 030E _ FF. 45, 1C
?_003:  mov     eax, dword [ebp+1CH]                    ; 0311 _ 8B. 45, 1C
        mov     al, byte [eax]                          ; 0314 _ 8A. 00
        test    al, al                                  ; 0316 _ 84. C0
        jnz     ?_002                                   ; 0318 _ 75, C2
        nop                                             ; 031A _ 90
        nop                                             ; 031B _ 90
        leave                                           ; 031C _ C9
        ret                                             ; 031D _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 031E _ 55
        mov     ebp, esp                                ; 031F _ 89. E5
        sub     esp, 8                                  ; 0321 _ 83. EC, 08
        sub     esp, 4                                  ; 0324 _ 83. EC, 04
        push    table_rgb.1590                          ; 0327 _ 68, 00000020(d)
        push    15                                      ; 032C _ 6A, 0F
        push    0                                       ; 032E _ 6A, 00
        call    set_palette                             ; 0330 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0335 _ 83. C4, 10
        nop                                             ; 0338 _ 90
        leave                                           ; 0339 _ C9
        ret                                             ; 033A _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 033B _ 55
        mov     ebp, esp                                ; 033C _ 89. E5
        sub     esp, 24                                 ; 033E _ 83. EC, 18
        call    io_load_eflags                          ; 0341 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0346 _ 89. 45, F0
        call    io_cli                                  ; 0349 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 034E _ 83. EC, 08
        push    dword [ebp+8H]                          ; 0351 _ FF. 75, 08
        push    968                                     ; 0354 _ 68, 000003C8
        call    io_out8                                 ; 0359 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 035E _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 0361 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0364 _ 89. 45, F4
        jmp     ?_005                                   ; 0367 _ EB, 5F

?_004:  mov     eax, dword [ebp+10H]                    ; 0369 _ 8B. 45, 10
        mov     al, byte [eax]                          ; 036C _ 8A. 00
        shr     al, 2                                   ; 036E _ C0. E8, 02
        movzx   eax, al                                 ; 0371 _ 0F B6. C0
        sub     esp, 8                                  ; 0374 _ 83. EC, 08
        push    eax                                     ; 0377 _ 50
        push    969                                     ; 0378 _ 68, 000003C9
        call    io_out8                                 ; 037D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0382 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 0385 _ 8B. 45, 10
        inc     eax                                     ; 0388 _ 40
        mov     al, byte [eax]                          ; 0389 _ 8A. 00
        shr     al, 2                                   ; 038B _ C0. E8, 02
        movzx   eax, al                                 ; 038E _ 0F B6. C0
        sub     esp, 8                                  ; 0391 _ 83. EC, 08
        push    eax                                     ; 0394 _ 50
        push    969                                     ; 0395 _ 68, 000003C9
        call    io_out8                                 ; 039A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 03A2 _ 8B. 45, 10
        add     eax, 2                                  ; 03A5 _ 83. C0, 02
        mov     al, byte [eax]                          ; 03A8 _ 8A. 00
        shr     al, 2                                   ; 03AA _ C0. E8, 02
        movzx   eax, al                                 ; 03AD _ 0F B6. C0
        sub     esp, 8                                  ; 03B0 _ 83. EC, 08
        push    eax                                     ; 03B3 _ 50
        push    969                                     ; 03B4 _ 68, 000003C9
        call    io_out8                                 ; 03B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03BE _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 03C1 _ 83. 45, 10, 03
        inc     dword [ebp-0CH]                         ; 03C5 _ FF. 45, F4
?_005:  mov     eax, dword [ebp-0CH]                    ; 03C8 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 03CB _ 3B. 45, 0C
        jle     ?_004                                   ; 03CE _ 7E, 99
        sub     esp, 12                                 ; 03D0 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 03D3 _ FF. 75, F0
        call    io_store_eflags                         ; 03D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03DB _ 83. C4, 10
        nop                                             ; 03DE _ 90
        leave                                           ; 03DF _ C9
        ret                                             ; 03E0 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 03E1 _ 55
        mov     ebp, esp                                ; 03E2 _ 89. E5
        sub     esp, 20                                 ; 03E4 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 03E7 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 03EA _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 03ED _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 03F0 _ 89. 45, F8
        jmp     ?_009                                   ; 03F3 _ EB, 30

?_006:  mov     eax, dword [ebp+14H]                    ; 03F5 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 03F8 _ 89. 45, FC
        jmp     ?_008                                   ; 03FB _ EB, 1D

?_007:  mov     eax, dword [ebp-8H]                     ; 03FD _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0400 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0404 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0406 _ 8B. 45, FC
        add     eax, edx                                ; 0409 _ 01. D0
        mov     edx, eax                                ; 040B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 040D _ 8B. 45, 08
        add     edx, eax                                ; 0410 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0412 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0415 _ 88. 02
        inc     dword [ebp-4H]                          ; 0417 _ FF. 45, FC
?_008:  mov     eax, dword [ebp-4H]                     ; 041A _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 041D _ 3B. 45, 1C
        jle     ?_007                                   ; 0420 _ 7E, DB
        inc     dword [ebp-8H]                          ; 0422 _ FF. 45, F8
?_009:  mov     eax, dword [ebp-8H]                     ; 0425 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0428 _ 3B. 45, 20
        jle     ?_006                                   ; 042B _ 7E, C8
        nop                                             ; 042D _ 90
        nop                                             ; 042E _ 90
        leave                                           ; 042F _ C9
        ret                                             ; 0430 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 0431 _ 55
        mov     ebp, esp                                ; 0432 _ 89. E5
        sub     esp, 20                                 ; 0434 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 0437 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 043A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 043D _ C7. 45, FC, 00000000
        jmp     ?_019                                   ; 0444 _ E9, 00000162

?_010:  mov     edx, dword [ebp-4H]                     ; 0449 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 044C _ 8B. 45, 1C
        add     eax, edx                                ; 044F _ 01. D0
        mov     al, byte [eax]                          ; 0451 _ 8A. 00
        mov     byte [ebp-5H], al                       ; 0453 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 0456 _ 80. 7D, FB, 00
        jns     ?_011                                   ; 045A _ 79, 1F
        mov     edx, dword [ebp+14H]                    ; 045C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 045F _ 8B. 45, FC
        add     eax, edx                                ; 0462 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0464 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0468 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 046A _ 8B. 45, 10
        add     eax, edx                                ; 046D _ 01. D0
        mov     edx, eax                                ; 046F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0471 _ 8B. 45, 08
        add     edx, eax                                ; 0474 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0476 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0479 _ 88. 02
?_011:  movsx   eax, byte [ebp-5H]                      ; 047B _ 0F BE. 45, FB
        and     eax, 40H                                ; 047F _ 83. E0, 40
        test    eax, eax                                ; 0482 _ 85. C0
        jz      ?_012                                   ; 0484 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0486 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0489 _ 8B. 45, FC
        add     eax, edx                                ; 048C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 048E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0492 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0494 _ 8B. 45, 10
        add     eax, edx                                ; 0497 _ 01. D0
        lea     edx, [eax+1H]                           ; 0499 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 049C _ 8B. 45, 08
        add     edx, eax                                ; 049F _ 01. C2
        mov     al, byte [ebp-14H]                      ; 04A1 _ 8A. 45, EC
        mov     byte [edx], al                          ; 04A4 _ 88. 02
?_012:  movsx   eax, byte [ebp-5H]                      ; 04A6 _ 0F BE. 45, FB
        and     eax, 20H                                ; 04AA _ 83. E0, 20
        test    eax, eax                                ; 04AD _ 85. C0
        jz      ?_013                                   ; 04AF _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 04B1 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04B4 _ 8B. 45, FC
        add     eax, edx                                ; 04B7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04B9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04BD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 04BF _ 8B. 45, 10
        add     eax, edx                                ; 04C2 _ 01. D0
        lea     edx, [eax+2H]                           ; 04C4 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 04C7 _ 8B. 45, 08
        add     edx, eax                                ; 04CA _ 01. C2
        mov     al, byte [ebp-14H]                      ; 04CC _ 8A. 45, EC
        mov     byte [edx], al                          ; 04CF _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 04D1 _ 0F BE. 45, FB
        and     eax, 10H                                ; 04D5 _ 83. E0, 10
        test    eax, eax                                ; 04D8 _ 85. C0
        jz      ?_014                                   ; 04DA _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 04DC _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04DF _ 8B. 45, FC
        add     eax, edx                                ; 04E2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 04E4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04E8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 04EA _ 8B. 45, 10
        add     eax, edx                                ; 04ED _ 01. D0
        lea     edx, [eax+3H]                           ; 04EF _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 04F2 _ 8B. 45, 08
        add     edx, eax                                ; 04F5 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 04F7 _ 8A. 45, EC
        mov     byte [edx], al                          ; 04FA _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 04FC _ 0F BE. 45, FB
        and     eax, 08H                                ; 0500 _ 83. E0, 08
        test    eax, eax                                ; 0503 _ 85. C0
        jz      ?_015                                   ; 0505 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0507 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 050A _ 8B. 45, FC
        add     eax, edx                                ; 050D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 050F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0513 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0515 _ 8B. 45, 10
        add     eax, edx                                ; 0518 _ 01. D0
        lea     edx, [eax+4H]                           ; 051A _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 051D _ 8B. 45, 08
        add     edx, eax                                ; 0520 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0522 _ 8A. 45, EC
        mov     byte [edx], al                          ; 0525 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0527 _ 0F BE. 45, FB
        and     eax, 04H                                ; 052B _ 83. E0, 04
        test    eax, eax                                ; 052E _ 85. C0
        jz      ?_016                                   ; 0530 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0532 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0535 _ 8B. 45, FC
        add     eax, edx                                ; 0538 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 053A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 053E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0540 _ 8B. 45, 10
        add     eax, edx                                ; 0543 _ 01. D0
        lea     edx, [eax+5H]                           ; 0545 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0548 _ 8B. 45, 08
        add     edx, eax                                ; 054B _ 01. C2
        mov     al, byte [ebp-14H]                      ; 054D _ 8A. 45, EC
        mov     byte [edx], al                          ; 0550 _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 0552 _ 0F BE. 45, FB
        and     eax, 02H                                ; 0556 _ 83. E0, 02
        test    eax, eax                                ; 0559 _ 85. C0
        jz      ?_017                                   ; 055B _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 055D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0560 _ 8B. 45, FC
        add     eax, edx                                ; 0563 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0565 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0569 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 056B _ 8B. 45, 10
        add     eax, edx                                ; 056E _ 01. D0
        lea     edx, [eax+6H]                           ; 0570 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0573 _ 8B. 45, 08
        add     edx, eax                                ; 0576 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0578 _ 8A. 45, EC
        mov     byte [edx], al                          ; 057B _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 057D _ 0F BE. 45, FB
        and     eax, 01H                                ; 0581 _ 83. E0, 01
        test    eax, eax                                ; 0584 _ 85. C0
        jz      ?_018                                   ; 0586 _ 74, 20
        mov     edx, dword [ebp+14H]                    ; 0588 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 058B _ 8B. 45, FC
        add     eax, edx                                ; 058E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0590 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0594 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0596 _ 8B. 45, 10
        add     eax, edx                                ; 0599 _ 01. D0
        lea     edx, [eax+7H]                           ; 059B _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 059E _ 8B. 45, 08
        add     edx, eax                                ; 05A1 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 05A3 _ 8A. 45, EC
        mov     byte [edx], al                          ; 05A6 _ 88. 02
?_018:  inc     dword [ebp-4H]                          ; 05A8 _ FF. 45, FC
?_019:  cmp     dword [ebp-4H], 15                      ; 05AB _ 83. 7D, FC, 0F
        jle     ?_010                                   ; 05AF _ 0F 8E, FFFFFE94
        nop                                             ; 05B5 _ 90
        nop                                             ; 05B6 _ 90
        leave                                           ; 05B7 _ C9
        ret                                             ; 05B8 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 05B9 _ 55
        mov     ebp, esp                                ; 05BA _ 89. E5
        sub     esp, 20                                 ; 05BC _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 05BF _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 05C2 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 05C5 _ C7. 45, F8, 00000000
        jmp     ?_026                                   ; 05CC _ E9, 000000AB

?_020:  mov     dword [ebp-4H], 0                       ; 05D1 _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 05D8 _ E9, 00000092

?_021:  mov     eax, dword [ebp-8H]                     ; 05DD _ 8B. 45, F8
        shl     eax, 4                                  ; 05E0 _ C1. E0, 04
        mov     edx, eax                                ; 05E3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 05E5 _ 8B. 45, FC
        add     eax, edx                                ; 05E8 _ 01. D0
        add     eax, cursor.1637                        ; 05EA _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 05EF _ 8A. 00
        cmp     al, 42                                  ; 05F1 _ 3C, 2A
        jnz     ?_022                                   ; 05F3 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 05F5 _ 8B. 45, F8
        shl     eax, 4                                  ; 05F8 _ C1. E0, 04
        mov     edx, eax                                ; 05FB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 05FD _ 8B. 45, FC
        add     eax, edx                                ; 0600 _ 01. D0
        mov     edx, eax                                ; 0602 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0604 _ 8B. 45, 08
        add     eax, edx                                ; 0607 _ 01. D0
        mov     byte [eax], 0                           ; 0609 _ C6. 00, 00
?_022:  mov     eax, dword [ebp-8H]                     ; 060C _ 8B. 45, F8
        shl     eax, 4                                  ; 060F _ C1. E0, 04
        mov     edx, eax                                ; 0612 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0614 _ 8B. 45, FC
        add     eax, edx                                ; 0617 _ 01. D0
        add     eax, cursor.1637                        ; 0619 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 061E _ 8A. 00
        cmp     al, 79                                  ; 0620 _ 3C, 4F
        jnz     ?_023                                   ; 0622 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 0624 _ 8B. 45, F8
        shl     eax, 4                                  ; 0627 _ C1. E0, 04
        mov     edx, eax                                ; 062A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 062C _ 8B. 45, FC
        add     eax, edx                                ; 062F _ 01. D0
        mov     edx, eax                                ; 0631 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0633 _ 8B. 45, 08
        add     eax, edx                                ; 0636 _ 01. D0
        mov     byte [eax], 7                           ; 0638 _ C6. 00, 07
?_023:  mov     eax, dword [ebp-8H]                     ; 063B _ 8B. 45, F8
        shl     eax, 4                                  ; 063E _ C1. E0, 04
        mov     edx, eax                                ; 0641 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0643 _ 8B. 45, FC
        add     eax, edx                                ; 0646 _ 01. D0
        add     eax, cursor.1637                        ; 0648 _ 05, 00000060(d)
        mov     al, byte [eax]                          ; 064D _ 8A. 00
        cmp     al, 46                                  ; 064F _ 3C, 2E
        jnz     ?_024                                   ; 0651 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0653 _ 8B. 45, F8
        shl     eax, 4                                  ; 0656 _ C1. E0, 04
        mov     edx, eax                                ; 0659 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 065B _ 8B. 45, FC
        add     eax, edx                                ; 065E _ 01. D0
        mov     edx, eax                                ; 0660 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0662 _ 8B. 45, 08
        add     edx, eax                                ; 0665 _ 01. C2
        mov     al, byte [ebp-14H]                      ; 0667 _ 8A. 45, EC
        mov     byte [edx], al                          ; 066A _ 88. 02
?_024:  inc     dword [ebp-4H]                          ; 066C _ FF. 45, FC
?_025:  cmp     dword [ebp-4H], 15                      ; 066F _ 83. 7D, FC, 0F
        jle     ?_021                                   ; 0673 _ 0F 8E, FFFFFF64
        inc     dword [ebp-8H]                          ; 0679 _ FF. 45, F8
?_026:  cmp     dword [ebp-8H], 15                      ; 067C _ 83. 7D, F8, 0F
        jle     ?_020                                   ; 0680 _ 0F 8E, FFFFFF4B
        nop                                             ; 0686 _ 90
        nop                                             ; 0687 _ 90
        leave                                           ; 0688 _ C9
        ret                                             ; 0689 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 068A _ 55
        mov     ebp, esp                                ; 068B _ 89. E5
        push    ebx                                     ; 068D _ 53
        sub     esp, 16                                 ; 068E _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 0691 _ C7. 45, F4, 00000000
        jmp     ?_030                                   ; 0698 _ EB, 4D

?_027:  mov     dword [ebp-8H], 0                       ; 069A _ C7. 45, F8, 00000000
        jmp     ?_029                                   ; 06A1 _ EB, 39

?_028:  mov     eax, dword [ebp-0CH]                    ; 06A3 _ 8B. 45, F4
        imul    eax, dword [ebp+24H]                    ; 06A6 _ 0F AF. 45, 24
        mov     edx, eax                                ; 06AA _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06AC _ 8B. 45, F8
        add     eax, edx                                ; 06AF _ 01. D0
        mov     edx, eax                                ; 06B1 _ 89. C2
        mov     eax, dword [ebp+20H]                    ; 06B3 _ 8B. 45, 20
        add     eax, edx                                ; 06B6 _ 01. D0
        mov     ecx, dword [ebp+1CH]                    ; 06B8 _ 8B. 4D, 1C
        mov     edx, dword [ebp-0CH]                    ; 06BB _ 8B. 55, F4
        add     edx, ecx                                ; 06BE _ 01. CA
        imul    edx, dword [ebp+0CH]                    ; 06C0 _ 0F AF. 55, 0C
        mov     ebx, dword [ebp+18H]                    ; 06C4 _ 8B. 5D, 18
        mov     ecx, dword [ebp-8H]                     ; 06C7 _ 8B. 4D, F8
        add     ecx, ebx                                ; 06CA _ 01. D9
        add     edx, ecx                                ; 06CC _ 01. CA
        mov     ecx, edx                                ; 06CE _ 89. D1
        mov     edx, dword [ebp+8H]                     ; 06D0 _ 8B. 55, 08
        add     edx, ecx                                ; 06D3 _ 01. CA
        mov     al, byte [eax]                          ; 06D5 _ 8A. 00
        mov     byte [edx], al                          ; 06D7 _ 88. 02
        inc     dword [ebp-8H]                          ; 06D9 _ FF. 45, F8
?_029:  mov     eax, dword [ebp-8H]                     ; 06DC _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 06DF _ 3B. 45, 10
        jl      ?_028                                   ; 06E2 _ 7C, BF
        inc     dword [ebp-0CH]                         ; 06E4 _ FF. 45, F4
?_030:  mov     eax, dword [ebp-0CH]                    ; 06E7 _ 8B. 45, F4
        cmp     eax, dword [ebp+14H]                    ; 06EA _ 3B. 45, 14
        jl      ?_027                                   ; 06ED _ 7C, AB
        nop                                             ; 06EF _ 90
        nop                                             ; 06F0 _ 90
        add     esp, 16                                 ; 06F1 _ 83. C4, 10
        pop     ebx                                     ; 06F4 _ 5B
        pop     ebp                                     ; 06F5 _ 5D
        ret                                             ; 06F6 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 06F7 _ 55
        mov     ebp, esp                                ; 06F8 _ 89. E5
        sub     esp, 40                                 ; 06FA _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 06FD _ A1, 00000100(d)
        mov     dword [ebp-0CH], eax                    ; 0702 _ 89. 45, F4
        mov     eax, dword [?_035]                      ; 0705 _ A1, 00000104(d)
        cwde                                            ; 070A _ 98
        mov     dword [ebp-10H], eax                    ; 070B _ 89. 45, F0
        mov     ax, word [?_036]                        ; 070E _ 66: A1, 00000106(d)
        cwde                                            ; 0714 _ 98
        mov     dword [ebp-14H], eax                    ; 0715 _ 89. 45, EC
        sub     esp, 8                                  ; 0718 _ 83. EC, 08
        push    33                                      ; 071B _ 6A, 21
        push    32                                      ; 071D _ 6A, 20
        call    io_out8                                 ; 071F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0724 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 0727 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 072B _ 83. EC, 0C
        push    96                                      ; 072E _ 6A, 60
        call    io_in8                                  ; 0730 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0735 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 0738 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 073B _ 0F B6. 45, EB
        sub     esp, 12                                 ; 073F _ 83. EC, 0C
        push    eax                                     ; 0742 _ 50
        call    charToHexStr                            ; 0743 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0748 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 074B _ 89. 45, E4
        mov     eax, dword [showPos.1673]               ; 074E _ A1, 00000108(d)
        sub     esp, 8                                  ; 0753 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0756 _ FF. 75, E4
        push    7                                       ; 0759 _ 6A, 07
        push    0                                       ; 075B _ 6A, 00
        push    eax                                     ; 075D _ 50
        push    dword [ebp-10H]                         ; 075E _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0761 _ FF. 75, F4
        call    showString                              ; 0764 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0769 _ 83. C4, 20
        mov     eax, dword [showPos.1673]               ; 076C _ A1, 00000108(d)
        add     eax, 32                                 ; 0771 _ 83. C0, 20
        mov     dword [showPos.1673], eax               ; 0774 _ A3, 00000108(d)
        nop                                             ; 0779 _ 90
        leave                                           ; 077A _ C9
        ret                                             ; 077B _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 077C _ 55
        mov     ebp, esp                                ; 077D _ 89. E5
        sub     esp, 4                                  ; 077F _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0782 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0785 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0788 _ 80. 7D, FC, 09
        jle     ?_031                                   ; 078C _ 7E, 08
        mov     al, byte [ebp-4H]                       ; 078E _ 8A. 45, FC
        add     eax, 55                                 ; 0791 _ 83. C0, 37
        jmp     ?_032                                   ; 0794 _ EB, 06

?_031:  mov     al, byte [ebp-4H]                       ; 0796 _ 8A. 45, FC
        add     eax, 48                                 ; 0799 _ 83. C0, 30
?_032:  leave                                           ; 079C _ C9
        ret                                             ; 079D _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 079E _ 55
        mov     ebp, esp                                ; 079F _ 89. E5
        sub     esp, 20                                 ; 07A1 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 07A4 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 07A7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 07AA _ C7. 45, FC, 00000000
        mov     al, byte [ebp-14H]                      ; 07B1 _ 8A. 45, EC
        and     eax, 0FH                                ; 07B4 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 07B7 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 07BA _ 0F BE. 45, FB
        push    eax                                     ; 07BE _ 50
        call    charToHexVal                            ; 07BF _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 07C4 _ 83. C4, 04
        mov     byte [?_034], al                        ; 07C7 _ A2, 00000013(d)
        mov     al, byte [ebp-14H]                      ; 07CC _ 8A. 45, EC
        shr     al, 4                                   ; 07CF _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 07D2 _ 88. 45, EC
        mov     al, byte [ebp-14H]                      ; 07D5 _ 8A. 45, EC
        movsx   eax, al                                 ; 07D8 _ 0F BE. C0
        push    eax                                     ; 07DB _ 50
        call    charToHexVal                            ; 07DC _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 07E1 _ 83. C4, 04
        mov     byte [?_033], al                        ; 07E4 _ A2, 00000012(d)
        mov     eax, keyval                             ; 07E9 _ B8, 00000010(d)
        leave                                           ; 07EE _ C9
        ret                                             ; 07EF _ C3
; charToHexStr End of function

fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_033:  db 00H                                          ; 0012 _ .

?_034:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1590:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1637:                                            ; byte
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

?_035:                                                  ; dword
        resb    2                                       ; 0104

?_036:  resw    1                                       ; 0106

showPos.1673:                                           ; dword
        resd    1                                       ; 0108


