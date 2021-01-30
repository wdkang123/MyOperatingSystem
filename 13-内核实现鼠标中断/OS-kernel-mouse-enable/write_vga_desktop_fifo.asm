; Disassembly of file: write_vga_desktop.o
; Mon Oct 10 22:10:32 2016
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386



CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 36                                 ; 0004 _ 83. EC, 24
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000100(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000100(d)
        mov     dword [ebp-1CH], eax                    ; 001C _ 89. 45, E4
        movzx   eax, word [?_047]                       ; 001F _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0026 _ 98
        mov     dword [ebp-18H], eax                    ; 0027 _ 89. 45, E8
        movzx   eax, word [?_048]                       ; 002A _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0031 _ 98
        mov     dword [ebp-14H], eax                    ; 0032 _ 89. 45, EC
        sub     esp, 4                                  ; 0035 _ 83. EC, 04
        push    keybuf                                  ; 0038 _ 68, 00000120(d)
        push    32                                      ; 003D _ 6A, 20
        push    keyinfo                                 ; 003F _ 68, 00000108(d)
        call    fifo8_init                              ; 0044 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0049 _ 83. C4, 10
        call    init_palette                            ; 004C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 0051 _ 8B. 45, EC
        lea     edx, [eax-1DH]                          ; 0054 _ 8D. 50, E3
        mov     eax, dword [ebp-18H]                    ; 0057 _ 8B. 45, E8
        sub     eax, 1                                  ; 005A _ 83. E8, 01
        sub     esp, 4                                  ; 005D _ 83. EC, 04
        push    edx                                     ; 0060 _ 52
        push    eax                                     ; 0061 _ 50
        push    0                                       ; 0062 _ 6A, 00
        push    0                                       ; 0064 _ 6A, 00
        push    14                                      ; 0066 _ 6A, 0E
        push    dword [ebp-18H]                         ; 0068 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 006B _ FF. 75, E4
        call    boxfill8                                ; 006E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0073 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0076 _ 8B. 45, EC
        lea     ecx, [eax-1CH]                          ; 0079 _ 8D. 48, E4
        mov     eax, dword [ebp-18H]                    ; 007C _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 007F _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 0082 _ 8B. 45, EC
        sub     eax, 28                                 ; 0085 _ 83. E8, 1C
        sub     esp, 4                                  ; 0088 _ 83. EC, 04
        push    ecx                                     ; 008B _ 51
        push    edx                                     ; 008C _ 52
        push    eax                                     ; 008D _ 50
        push    0                                       ; 008E _ 6A, 00
        push    8                                       ; 0090 _ 6A, 08
        push    dword [ebp-18H]                         ; 0092 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0095 _ FF. 75, E4
        call    boxfill8                                ; 0098 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 009D _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00A0 _ 8B. 45, EC
        lea     ecx, [eax-1BH]                          ; 00A3 _ 8D. 48, E5
        mov     eax, dword [ebp-18H]                    ; 00A6 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00A9 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00AC _ 8B. 45, EC
        sub     eax, 27                                 ; 00AF _ 83. E8, 1B
        sub     esp, 4                                  ; 00B2 _ 83. EC, 04
        push    ecx                                     ; 00B5 _ 51
        push    edx                                     ; 00B6 _ 52
        push    eax                                     ; 00B7 _ 50
        push    0                                       ; 00B8 _ 6A, 00
        push    7                                       ; 00BA _ 6A, 07
        push    dword [ebp-18H]                         ; 00BC _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00BF _ FF. 75, E4
        call    boxfill8                                ; 00C2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00C7 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00CA _ 8B. 45, EC
        lea     ecx, [eax-1H]                           ; 00CD _ 8D. 48, FF
        mov     eax, dword [ebp-18H]                    ; 00D0 _ 8B. 45, E8
        lea     edx, [eax-1H]                           ; 00D3 _ 8D. 50, FF
        mov     eax, dword [ebp-14H]                    ; 00D6 _ 8B. 45, EC
        sub     eax, 26                                 ; 00D9 _ 83. E8, 1A
        sub     esp, 4                                  ; 00DC _ 83. EC, 04
        push    ecx                                     ; 00DF _ 51
        push    edx                                     ; 00E0 _ 52
        push    eax                                     ; 00E1 _ 50
        push    0                                       ; 00E2 _ 6A, 00
        push    8                                       ; 00E4 _ 6A, 08
        push    dword [ebp-18H]                         ; 00E6 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 00E9 _ FF. 75, E4
        call    boxfill8                                ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 00F1 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 00F4 _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 00F7 _ 8D. 50, E8
        mov     eax, dword [ebp-14H]                    ; 00FA _ 8B. 45, EC
        sub     eax, 24                                 ; 00FD _ 83. E8, 18
        sub     esp, 4                                  ; 0100 _ 83. EC, 04
        push    edx                                     ; 0103 _ 52
        push    59                                      ; 0104 _ 6A, 3B
        push    eax                                     ; 0106 _ 50
        push    3                                       ; 0107 _ 6A, 03
        push    7                                       ; 0109 _ 6A, 07
        push    dword [ebp-18H]                         ; 010B _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 010E _ FF. 75, E4
        call    boxfill8                                ; 0111 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0116 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0119 _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 011C _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 011F _ 8B. 45, EC
        sub     eax, 24                                 ; 0122 _ 83. E8, 18
        sub     esp, 4                                  ; 0125 _ 83. EC, 04
        push    edx                                     ; 0128 _ 52
        push    2                                       ; 0129 _ 6A, 02
        push    eax                                     ; 012B _ 50
        push    2                                       ; 012C _ 6A, 02
        push    7                                       ; 012E _ 6A, 07
        push    dword [ebp-18H]                         ; 0130 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0133 _ FF. 75, E4
        call    boxfill8                                ; 0136 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 013B _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 013E _ 8B. 45, EC
        lea     edx, [eax-4H]                           ; 0141 _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 0144 _ 8B. 45, EC
        sub     eax, 4                                  ; 0147 _ 83. E8, 04
        sub     esp, 4                                  ; 014A _ 83. EC, 04
        push    edx                                     ; 014D _ 52
        push    59                                      ; 014E _ 6A, 3B
        push    eax                                     ; 0150 _ 50
        push    3                                       ; 0151 _ 6A, 03
        push    15                                      ; 0153 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0155 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0158 _ FF. 75, E4
        call    boxfill8                                ; 015B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0160 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0163 _ 8B. 45, EC
        lea     edx, [eax-5H]                           ; 0166 _ 8D. 50, FB
        mov     eax, dword [ebp-14H]                    ; 0169 _ 8B. 45, EC
        sub     eax, 23                                 ; 016C _ 83. E8, 17
        sub     esp, 4                                  ; 016F _ 83. EC, 04
        push    edx                                     ; 0172 _ 52
        push    59                                      ; 0173 _ 6A, 3B
        push    eax                                     ; 0175 _ 50
        push    59                                      ; 0176 _ 6A, 3B
        push    15                                      ; 0178 _ 6A, 0F
        push    dword [ebp-18H]                         ; 017A _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 017D _ FF. 75, E4
        call    boxfill8                                ; 0180 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0185 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0188 _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 018B _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 018E _ 8B. 45, EC
        sub     eax, 3                                  ; 0191 _ 83. E8, 03
        sub     esp, 4                                  ; 0194 _ 83. EC, 04
        push    edx                                     ; 0197 _ 52
        push    59                                      ; 0198 _ 6A, 3B
        push    eax                                     ; 019A _ 50
        push    2                                       ; 019B _ 6A, 02
        push    0                                       ; 019D _ 6A, 00
        push    dword [ebp-18H]                         ; 019F _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01A2 _ FF. 75, E4
        call    boxfill8                                ; 01A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01AA _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01AD _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 01B0 _ 8D. 50, FD
        mov     eax, dword [ebp-14H]                    ; 01B3 _ 8B. 45, EC
        sub     eax, 24                                 ; 01B6 _ 83. E8, 18
        sub     esp, 4                                  ; 01B9 _ 83. EC, 04
        push    edx                                     ; 01BC _ 52
        push    60                                      ; 01BD _ 6A, 3C
        push    eax                                     ; 01BF _ 50
        push    60                                      ; 01C0 _ 6A, 3C
        push    0                                       ; 01C2 _ 6A, 00
        push    dword [ebp-18H]                         ; 01C4 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01C7 _ FF. 75, E4
        call    boxfill8                                ; 01CA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01CF _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 01D2 _ 8B. 45, EC
        lea     ebx, [eax-18H]                          ; 01D5 _ 8D. 58, E8
        mov     eax, dword [ebp-18H]                    ; 01D8 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 01DB _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 01DE _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 01E1 _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 01E4 _ 8B. 45, E8
        sub     eax, 47                                 ; 01E7 _ 83. E8, 2F
        sub     esp, 4                                  ; 01EA _ 83. EC, 04
        push    ebx                                     ; 01ED _ 53
        push    ecx                                     ; 01EE _ 51
        push    edx                                     ; 01EF _ 52
        push    eax                                     ; 01F0 _ 50
        push    15                                      ; 01F1 _ 6A, 0F
        push    dword [ebp-18H]                         ; 01F3 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 01F6 _ FF. 75, E4
        call    boxfill8                                ; 01F9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01FE _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0201 _ 8B. 45, EC
        lea     ebx, [eax-4H]                           ; 0204 _ 8D. 58, FC
        mov     eax, dword [ebp-18H]                    ; 0207 _ 8B. 45, E8
        lea     ecx, [eax-2FH]                          ; 020A _ 8D. 48, D1
        mov     eax, dword [ebp-14H]                    ; 020D _ 8B. 45, EC
        lea     edx, [eax-17H]                          ; 0210 _ 8D. 50, E9
        mov     eax, dword [ebp-18H]                    ; 0213 _ 8B. 45, E8
        sub     eax, 47                                 ; 0216 _ 83. E8, 2F
        sub     esp, 4                                  ; 0219 _ 83. EC, 04
        push    ebx                                     ; 021C _ 53
        push    ecx                                     ; 021D _ 51
        push    edx                                     ; 021E _ 52
        push    eax                                     ; 021F _ 50
        push    15                                      ; 0220 _ 6A, 0F
        push    dword [ebp-18H]                         ; 0222 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0225 _ FF. 75, E4
        call    boxfill8                                ; 0228 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 022D _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 0230 _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0233 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0236 _ 8B. 45, E8
        lea     ecx, [eax-4H]                           ; 0239 _ 8D. 48, FC
        mov     eax, dword [ebp-14H]                    ; 023C _ 8B. 45, EC
        lea     edx, [eax-3H]                           ; 023F _ 8D. 50, FD
        mov     eax, dword [ebp-18H]                    ; 0242 _ 8B. 45, E8
        sub     eax, 47                                 ; 0245 _ 83. E8, 2F
        sub     esp, 4                                  ; 0248 _ 83. EC, 04
        push    ebx                                     ; 024B _ 53
        push    ecx                                     ; 024C _ 51
        push    edx                                     ; 024D _ 52
        push    eax                                     ; 024E _ 50
        push    7                                       ; 024F _ 6A, 07
        push    dword [ebp-18H]                         ; 0251 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0254 _ FF. 75, E4
        call    boxfill8                                ; 0257 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 025C _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 025F _ 8B. 45, EC
        lea     ebx, [eax-3H]                           ; 0262 _ 8D. 58, FD
        mov     eax, dword [ebp-18H]                    ; 0265 _ 8B. 45, E8
        lea     ecx, [eax-3H]                           ; 0268 _ 8D. 48, FD
        mov     eax, dword [ebp-14H]                    ; 026B _ 8B. 45, EC
        lea     edx, [eax-18H]                          ; 026E _ 8D. 50, E8
        mov     eax, dword [ebp-18H]                    ; 0271 _ 8B. 45, E8
        sub     eax, 3                                  ; 0274 _ 83. E8, 03
        sub     esp, 4                                  ; 0277 _ 83. EC, 04
        push    ebx                                     ; 027A _ 53
        push    ecx                                     ; 027B _ 51
        push    edx                                     ; 027C _ 52
        push    eax                                     ; 027D _ 50
        push    7                                       ; 027E _ 6A, 07
        push    dword [ebp-18H]                         ; 0280 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0283 _ FF. 75, E4
        call    boxfill8                                ; 0286 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 028B _ 83. C4, 20
        sub     esp, 8                                  ; 028E _ 83. EC, 08
        push    14                                      ; 0291 _ 6A, 0E
        push    mcursor                                 ; 0293 _ 68, 00000000(d)
        call    init_mouse_cursor                       ; 0298 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 029D _ 83. C4, 10
        push    16                                      ; 02A0 _ 6A, 10
        push    mcursor                                 ; 02A2 _ 68, 00000000(d)
        push    80                                      ; 02A7 _ 6A, 50
        push    80                                      ; 02A9 _ 6A, 50
        push    16                                      ; 02AB _ 6A, 10
        push    16                                      ; 02AD _ 6A, 10
        push    dword [ebp-18H]                         ; 02AF _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 02B2 _ FF. 75, E4
        call    putblock                                ; 02B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 02BA _ 83. C4, 20
        call    io_sti                                  ; 02BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 02C2 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 02C9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02CE _ 83. EC, 0C
        push    keyinfo                                 ; 02D1 _ 68, 00000108(d)
        call    fifo8_status                            ; 02D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02DB _ 83. C4, 10
        test    eax, eax                                ; 02DE _ 85. C0
        jnz     ?_002                                   ; 02E0 _ 75, 07
        call    io_stihlt                               ; 02E2 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 02E7 _ EB, 58

?_002:  call    io_sti                                  ; 02E9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 02EE _ 83. EC, 0C
        push    keyinfo                                 ; 02F1 _ 68, 00000108(d)
        call    fifo8_get                               ; 02F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FB _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 02FE _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 0301 _ 8B. 45, F0
        movzx   eax, al                                 ; 0304 _ 0F B6. C0
        sub     esp, 12                                 ; 0307 _ 83. EC, 0C
        push    eax                                     ; 030A _ 50
        call    charToHexStr                            ; 030B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0310 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0313 _ 89. 45, F4
        mov     eax, dword [showPos.1495]               ; 0316 _ A1, 00000140(d)
        sub     esp, 8                                  ; 031B _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 031E _ FF. 75, F4
        push    7                                       ; 0321 _ 6A, 07
        push    0                                       ; 0323 _ 6A, 00
        push    eax                                     ; 0325 _ 50
        push    dword [ebp-18H]                         ; 0326 _ FF. 75, E8
        push    dword [ebp-1CH]                         ; 0329 _ FF. 75, E4
        call    showString                              ; 032C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0331 _ 83. C4, 20
        mov     eax, dword [showPos.1495]               ; 0334 _ A1, 00000140(d)
        add     eax, 32                                 ; 0339 _ 83. C0, 20
        mov     dword [showPos.1495], eax               ; 033C _ A3, 00000140(d)
?_003:  jmp     ?_001                                   ; 0341 _ EB, 86
; CMain End of function

initBootInfo:; Function begin
        push    ebp                                     ; 0343 _ 55
        mov     ebp, esp                                ; 0344 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0346 _ 8B. 45, 08
        mov     dword [eax], 655360                     ; 0349 _ C7. 00, 000A0000
        mov     eax, dword [ebp+8H]                     ; 034F _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0352 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 0358 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 035B _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0361 _ 5D
        ret                                             ; 0362 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 0363 _ 55
        mov     ebp, esp                                ; 0364 _ 89. E5
        sub     esp, 24                                 ; 0366 _ 83. EC, 18
        mov     eax, dword [ebp+18H]                    ; 0369 _ 8B. 45, 18
        mov     byte [ebp-0CH], al                      ; 036C _ 88. 45, F4
        jmp     ?_005                                   ; 036F _ EB, 37

?_004:  mov     eax, dword [ebp+1CH]                    ; 0371 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 0374 _ 0F B6. 00
        movzx   eax, al                                 ; 0377 _ 0F B6. C0
        shl     eax, 4                                  ; 037A _ C1. E0, 04
        lea     edx, [systemFont+eax]                   ; 037D _ 8D. 90, 00000000(d)
        movsx   eax, byte [ebp-0CH]                     ; 0383 _ 0F BE. 45, F4
        sub     esp, 8                                  ; 0387 _ 83. EC, 08
        push    edx                                     ; 038A _ 52
        push    eax                                     ; 038B _ 50
        push    dword [ebp+14H]                         ; 038C _ FF. 75, 14
        push    dword [ebp+10H]                         ; 038F _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 0392 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 0395 _ FF. 75, 08
        call    showFont8                               ; 0398 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 039D _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 03A0 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 03A4 _ 83. 45, 1C, 01
?_005:  mov     eax, dword [ebp+1CH]                    ; 03A8 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 03AB _ 0F B6. 00
        test    al, al                                  ; 03AE _ 84. C0
        jnz     ?_004                                   ; 03B0 _ 75, BF
        leave                                           ; 03B2 _ C9
        ret                                             ; 03B3 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 03B4 _ 55
        mov     ebp, esp                                ; 03B5 _ 89. E5
        sub     esp, 8                                  ; 03B7 _ 83. EC, 08
        sub     esp, 4                                  ; 03BA _ 83. EC, 04
        push    table_rgb.1514                          ; 03BD _ 68, 00000020(d)
        push    15                                      ; 03C2 _ 6A, 0F
        push    0                                       ; 03C4 _ 6A, 00
        call    set_palette                             ; 03C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03CB _ 83. C4, 10
        nop                                             ; 03CE _ 90
        leave                                           ; 03CF _ C9
        ret                                             ; 03D0 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 03D1 _ 55
        mov     ebp, esp                                ; 03D2 _ 89. E5
        sub     esp, 24                                 ; 03D4 _ 83. EC, 18
        call    io_load_eflags                          ; 03D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 03DC _ 89. 45, F4
        call    io_cli                                  ; 03DF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 03E4 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 03E7 _ FF. 75, 08
        push    968                                     ; 03EA _ 68, 000003C8
        call    io_out8                                 ; 03EF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F4 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 03F7 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 03FA _ 89. 45, F0
        jmp     ?_007                                   ; 03FD _ EB, 65

?_006:  mov     eax, dword [ebp+10H]                    ; 03FF _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0402 _ 0F B6. 00
        shr     al, 2                                   ; 0405 _ C0. E8, 02
        movzx   eax, al                                 ; 0408 _ 0F B6. C0
        sub     esp, 8                                  ; 040B _ 83. EC, 08
        push    eax                                     ; 040E _ 50
        push    969                                     ; 040F _ 68, 000003C9
        call    io_out8                                 ; 0414 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0419 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 041C _ 8B. 45, 10
        add     eax, 1                                  ; 041F _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0422 _ 0F B6. 00
        shr     al, 2                                   ; 0425 _ C0. E8, 02
        movzx   eax, al                                 ; 0428 _ 0F B6. C0
        sub     esp, 8                                  ; 042B _ 83. EC, 08
        push    eax                                     ; 042E _ 50
        push    969                                     ; 042F _ 68, 000003C9
        call    io_out8                                 ; 0434 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0439 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 043C _ 8B. 45, 10
        add     eax, 2                                  ; 043F _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0442 _ 0F B6. 00
        shr     al, 2                                   ; 0445 _ C0. E8, 02
        movzx   eax, al                                 ; 0448 _ 0F B6. C0
        sub     esp, 8                                  ; 044B _ 83. EC, 08
        push    eax                                     ; 044E _ 50
        push    969                                     ; 044F _ 68, 000003C9
        call    io_out8                                 ; 0454 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0459 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 045C _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0460 _ 83. 45, F0, 01
?_007:  mov     eax, dword [ebp-10H]                    ; 0464 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0467 _ 3B. 45, 0C
        jle     ?_006                                   ; 046A _ 7E, 93
        sub     esp, 12                                 ; 046C _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 046F _ FF. 75, F4
        call    io_store_eflags                         ; 0472 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0477 _ 83. C4, 10
        nop                                             ; 047A _ 90
        leave                                           ; 047B _ C9
        ret                                             ; 047C _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 047D _ 55
        mov     ebp, esp                                ; 047E _ 89. E5
        sub     esp, 20                                 ; 0480 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0483 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0486 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0489 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 048C _ 89. 45, FC
        jmp     ?_011                                   ; 048F _ EB, 33

?_008:  mov     eax, dword [ebp+14H]                    ; 0491 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0494 _ 89. 45, F8
        jmp     ?_010                                   ; 0497 _ EB, 1F

?_009:  mov     eax, dword [ebp-4H]                     ; 0499 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 049C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 04A0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 04A2 _ 8B. 45, F8
        add     eax, edx                                ; 04A5 _ 01. D0
        mov     edx, eax                                ; 04A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 04A9 _ 8B. 45, 08
        add     edx, eax                                ; 04AC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 04AE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 04B2 _ 88. 02
        add     dword [ebp-8H], 1                       ; 04B4 _ 83. 45, F8, 01
?_010:  mov     eax, dword [ebp-8H]                     ; 04B8 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 04BB _ 3B. 45, 1C
        jle     ?_009                                   ; 04BE _ 7E, D9
        add     dword [ebp-4H], 1                       ; 04C0 _ 83. 45, FC, 01
?_011:  mov     eax, dword [ebp-4H]                     ; 04C4 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 04C7 _ 3B. 45, 20
        jle     ?_008                                   ; 04CA _ 7E, C5
        leave                                           ; 04CC _ C9
        ret                                             ; 04CD _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 04CE _ 55
        mov     ebp, esp                                ; 04CF _ 89. E5
        sub     esp, 20                                 ; 04D1 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 04D4 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 04D7 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 04DA _ C7. 45, FC, 00000000
        jmp     ?_021                                   ; 04E1 _ E9, 0000016C

?_012:  mov     edx, dword [ebp-4H]                     ; 04E6 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 04E9 _ 8B. 45, 1C
        add     eax, edx                                ; 04EC _ 01. D0
        movzx   eax, byte [eax]                         ; 04EE _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 04F1 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 04F4 _ 80. 7D, FB, 00
        jns     ?_013                                   ; 04F8 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 04FA _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 04FD _ 8B. 45, FC
        add     eax, edx                                ; 0500 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0502 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0506 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0508 _ 8B. 45, 10
        add     eax, edx                                ; 050B _ 01. D0
        mov     edx, eax                                ; 050D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 050F _ 8B. 45, 08
        add     edx, eax                                ; 0512 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0514 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0518 _ 88. 02
?_013:  movsx   eax, byte [ebp-5H]                      ; 051A _ 0F BE. 45, FB
        and     eax, 40H                                ; 051E _ 83. E0, 40
        test    eax, eax                                ; 0521 _ 85. C0
        jz      ?_014                                   ; 0523 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0525 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0528 _ 8B. 45, FC
        add     eax, edx                                ; 052B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 052D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0531 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0533 _ 8B. 45, 10
        add     eax, edx                                ; 0536 _ 01. D0
        lea     edx, [eax+1H]                           ; 0538 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 053B _ 8B. 45, 08
        add     edx, eax                                ; 053E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0540 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0544 _ 88. 02
?_014:  movsx   eax, byte [ebp-5H]                      ; 0546 _ 0F BE. 45, FB
        and     eax, 20H                                ; 054A _ 83. E0, 20
        test    eax, eax                                ; 054D _ 85. C0
        jz      ?_015                                   ; 054F _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0551 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0554 _ 8B. 45, FC
        add     eax, edx                                ; 0557 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0559 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 055D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 055F _ 8B. 45, 10
        add     eax, edx                                ; 0562 _ 01. D0
        lea     edx, [eax+2H]                           ; 0564 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0567 _ 8B. 45, 08
        add     edx, eax                                ; 056A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 056C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0570 _ 88. 02
?_015:  movsx   eax, byte [ebp-5H]                      ; 0572 _ 0F BE. 45, FB
        and     eax, 10H                                ; 0576 _ 83. E0, 10
        test    eax, eax                                ; 0579 _ 85. C0
        jz      ?_016                                   ; 057B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 057D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0580 _ 8B. 45, FC
        add     eax, edx                                ; 0583 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0585 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0589 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 058B _ 8B. 45, 10
        add     eax, edx                                ; 058E _ 01. D0
        lea     edx, [eax+3H]                           ; 0590 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0593 _ 8B. 45, 08
        add     edx, eax                                ; 0596 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0598 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 059C _ 88. 02
?_016:  movsx   eax, byte [ebp-5H]                      ; 059E _ 0F BE. 45, FB
        and     eax, 08H                                ; 05A2 _ 83. E0, 08
        test    eax, eax                                ; 05A5 _ 85. C0
        jz      ?_017                                   ; 05A7 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05A9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05AC _ 8B. 45, FC
        add     eax, edx                                ; 05AF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05B1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05B5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05B7 _ 8B. 45, 10
        add     eax, edx                                ; 05BA _ 01. D0
        lea     edx, [eax+4H]                           ; 05BC _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 05BF _ 8B. 45, 08
        add     edx, eax                                ; 05C2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05C4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05C8 _ 88. 02
?_017:  movsx   eax, byte [ebp-5H]                      ; 05CA _ 0F BE. 45, FB
        and     eax, 04H                                ; 05CE _ 83. E0, 04
        test    eax, eax                                ; 05D1 _ 85. C0
        jz      ?_018                                   ; 05D3 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 05D5 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 05D8 _ 8B. 45, FC
        add     eax, edx                                ; 05DB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 05DD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 05E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 05E3 _ 8B. 45, 10
        add     eax, edx                                ; 05E6 _ 01. D0
        lea     edx, [eax+5H]                           ; 05E8 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 05EB _ 8B. 45, 08
        add     edx, eax                                ; 05EE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 05F0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 05F4 _ 88. 02
?_018:  movsx   eax, byte [ebp-5H]                      ; 05F6 _ 0F BE. 45, FB
        and     eax, 02H                                ; 05FA _ 83. E0, 02
        test    eax, eax                                ; 05FD _ 85. C0
        jz      ?_019                                   ; 05FF _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 0601 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0604 _ 8B. 45, FC
        add     eax, edx                                ; 0607 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0609 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 060D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 060F _ 8B. 45, 10
        add     eax, edx                                ; 0612 _ 01. D0
        lea     edx, [eax+6H]                           ; 0614 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0617 _ 8B. 45, 08
        add     edx, eax                                ; 061A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 061C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0620 _ 88. 02
?_019:  movsx   eax, byte [ebp-5H]                      ; 0622 _ 0F BE. 45, FB
        and     eax, 01H                                ; 0626 _ 83. E0, 01
        test    eax, eax                                ; 0629 _ 85. C0
        jz      ?_020                                   ; 062B _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 062D _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 0630 _ 8B. 45, FC
        add     eax, edx                                ; 0633 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0635 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0639 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 063B _ 8B. 45, 10
        add     eax, edx                                ; 063E _ 01. D0
        lea     edx, [eax+7H]                           ; 0640 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0643 _ 8B. 45, 08
        add     edx, eax                                ; 0646 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0648 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 064C _ 88. 02
?_020:  add     dword [ebp-4H], 1                       ; 064E _ 83. 45, FC, 01
?_021:  cmp     dword [ebp-4H], 15                      ; 0652 _ 83. 7D, FC, 0F
        jle     ?_012                                   ; 0656 _ 0F 8E, FFFFFE8A
        leave                                           ; 065C _ C9
        ret                                             ; 065D _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 065E _ 55
        mov     ebp, esp                                ; 065F _ 89. E5
        sub     esp, 20                                 ; 0661 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0664 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0667 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 066A _ C7. 45, FC, 00000000
        jmp     ?_028                                   ; 0671 _ E9, 000000B1

?_022:  mov     dword [ebp-8H], 0                       ; 0676 _ C7. 45, F8, 00000000
        jmp     ?_027                                   ; 067D _ E9, 00000097

?_023:  mov     eax, dword [ebp-4H]                     ; 0682 _ 8B. 45, FC
        shl     eax, 4                                  ; 0685 _ C1. E0, 04
        mov     edx, eax                                ; 0688 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 068A _ 8B. 45, F8
        add     eax, edx                                ; 068D _ 01. D0
        add     eax, cursor.1561                        ; 068F _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0694 _ 0F B6. 00
        cmp     al, 42                                  ; 0697 _ 3C, 2A
        jnz     ?_024                                   ; 0699 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 069B _ 8B. 45, FC
        shl     eax, 4                                  ; 069E _ C1. E0, 04
        mov     edx, eax                                ; 06A1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06A3 _ 8B. 45, F8
        add     eax, edx                                ; 06A6 _ 01. D0
        mov     edx, eax                                ; 06A8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06AA _ 8B. 45, 08
        add     eax, edx                                ; 06AD _ 01. D0
        mov     byte [eax], 0                           ; 06AF _ C6. 00, 00
?_024:  mov     eax, dword [ebp-4H]                     ; 06B2 _ 8B. 45, FC
        shl     eax, 4                                  ; 06B5 _ C1. E0, 04
        mov     edx, eax                                ; 06B8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06BA _ 8B. 45, F8
        add     eax, edx                                ; 06BD _ 01. D0
        add     eax, cursor.1561                        ; 06BF _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 06C4 _ 0F B6. 00
        cmp     al, 79                                  ; 06C7 _ 3C, 4F
        jnz     ?_025                                   ; 06C9 _ 75, 17
        mov     eax, dword [ebp-4H]                     ; 06CB _ 8B. 45, FC
        shl     eax, 4                                  ; 06CE _ C1. E0, 04
        mov     edx, eax                                ; 06D1 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06D3 _ 8B. 45, F8
        add     eax, edx                                ; 06D6 _ 01. D0
        mov     edx, eax                                ; 06D8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 06DA _ 8B. 45, 08
        add     eax, edx                                ; 06DD _ 01. D0
        mov     byte [eax], 7                           ; 06DF _ C6. 00, 07
?_025:  mov     eax, dword [ebp-4H]                     ; 06E2 _ 8B. 45, FC
        shl     eax, 4                                  ; 06E5 _ C1. E0, 04
        mov     edx, eax                                ; 06E8 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 06EA _ 8B. 45, F8
        add     eax, edx                                ; 06ED _ 01. D0
        add     eax, cursor.1561                        ; 06EF _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 06F4 _ 0F B6. 00
        cmp     al, 46                                  ; 06F7 _ 3C, 2E
        jnz     ?_026                                   ; 06F9 _ 75, 1A
        mov     eax, dword [ebp-4H]                     ; 06FB _ 8B. 45, FC
        shl     eax, 4                                  ; 06FE _ C1. E0, 04
        mov     edx, eax                                ; 0701 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0703 _ 8B. 45, F8
        add     eax, edx                                ; 0706 _ 01. D0
        mov     edx, eax                                ; 0708 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 070A _ 8B. 45, 08
        add     edx, eax                                ; 070D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 070F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0713 _ 88. 02
?_026:  add     dword [ebp-8H], 1                       ; 0715 _ 83. 45, F8, 01
?_027:  cmp     dword [ebp-8H], 15                      ; 0719 _ 83. 7D, F8, 0F
        jle     ?_023                                   ; 071D _ 0F 8E, FFFFFF5F
        add     dword [ebp-4H], 1                       ; 0723 _ 83. 45, FC, 01
?_028:  cmp     dword [ebp-4H], 15                      ; 0727 _ 83. 7D, FC, 0F
        jle     ?_022                                   ; 072B _ 0F 8E, FFFFFF45
        leave                                           ; 0731 _ C9
        ret                                             ; 0732 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 0733 _ 55
        mov     ebp, esp                                ; 0734 _ 89. E5
        sub     esp, 16                                 ; 0736 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0739 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0740 _ EB, 50

?_029:  mov     dword [ebp-8H], 0                       ; 0742 _ C7. 45, F8, 00000000
        jmp     ?_031                                   ; 0749 _ EB, 3B

?_030:  mov     edx, dword [ebp+1CH]                    ; 074B _ 8B. 55, 1C
        mov     eax, dword [ebp-4H]                     ; 074E _ 8B. 45, FC
        add     eax, edx                                ; 0751 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0753 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 0757 _ 8B. 4D, 18
        mov     edx, dword [ebp-8H]                     ; 075A _ 8B. 55, F8
        add     edx, ecx                                ; 075D _ 01. CA
        add     eax, edx                                ; 075F _ 01. D0
        mov     edx, eax                                ; 0761 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0763 _ 8B. 45, 08
        add     edx, eax                                ; 0766 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 0768 _ 8B. 45, FC
        imul    eax, dword [ebp+24H]                    ; 076B _ 0F AF. 45, 24
        mov     ecx, eax                                ; 076F _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 0771 _ 8B. 45, F8
        add     eax, ecx                                ; 0774 _ 01. C8
        mov     ecx, eax                                ; 0776 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0778 _ 8B. 45, 20
        add     eax, ecx                                ; 077B _ 01. C8
        movzx   eax, byte [eax]                         ; 077D _ 0F B6. 00
        mov     byte [edx], al                          ; 0780 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0782 _ 83. 45, F8, 01
?_031:  mov     eax, dword [ebp-8H]                     ; 0786 _ 8B. 45, F8
        cmp     eax, dword [ebp+10H]                    ; 0789 _ 3B. 45, 10
        jl      ?_030                                   ; 078C _ 7C, BD
        add     dword [ebp-4H], 1                       ; 078E _ 83. 45, FC, 01
?_032:  mov     eax, dword [ebp-4H]                     ; 0792 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 0795 _ 3B. 45, 14
        jl      ?_029                                   ; 0798 _ 7C, A8
        leave                                           ; 079A _ C9
        ret                                             ; 079B _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 079C _ 55
        mov     ebp, esp                                ; 079D _ 89. E5
        sub     esp, 24                                 ; 079F _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 07A2 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 07A7 _ 89. 45, EC
        movzx   eax, word [?_047]                       ; 07AA _ 0F B7. 05, 00000104(d)
        cwde                                            ; 07B1 _ 98
        mov     dword [ebp-10H], eax                    ; 07B2 _ 89. 45, F0
        movzx   eax, word [?_048]                       ; 07B5 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 07BC _ 98
        mov     dword [ebp-0CH], eax                    ; 07BD _ 89. 45, F4
        sub     esp, 8                                  ; 07C0 _ 83. EC, 08
        push    33                                      ; 07C3 _ 6A, 21
        push    32                                      ; 07C5 _ 6A, 20
        call    io_out8                                 ; 07C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07CC _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 07CF _ C6. 45, EB, 00
        sub     esp, 12                                 ; 07D3 _ 83. EC, 0C
        push    96                                      ; 07D6 _ 6A, 60
        call    io_in8                                  ; 07D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DD _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 07E0 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 07E3 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 07E7 _ 83. EC, 08
        push    eax                                     ; 07EA _ 50
        push    keyinfo                                 ; 07EB _ 68, 00000108(d)
        call    fifo8_put                               ; 07F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07F5 _ 83. C4, 10
        nop                                             ; 07F8 _ 90
        leave                                           ; 07F9 _ C9
        ret                                             ; 07FA _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 07FB _ 55
        mov     ebp, esp                                ; 07FC _ 89. E5
        sub     esp, 4                                  ; 07FE _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 0801 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 0804 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 0807 _ 80. 7D, FC, 09
        jle     ?_033                                   ; 080B _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 080D _ 0F B6. 45, FC
        add     eax, 55                                 ; 0811 _ 83. C0, 37
        jmp     ?_034                                   ; 0814 _ EB, 07

?_033:  movzx   eax, byte [ebp-4H]                      ; 0816 _ 0F B6. 45, FC
        add     eax, 48                                 ; 081A _ 83. C0, 30
?_034:  leave                                           ; 081D _ C9
        ret                                             ; 081E _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 081F _ 55
        mov     ebp, esp                                ; 0820 _ 89. E5
        sub     esp, 20                                 ; 0822 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 0825 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 0828 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 082B _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 0832 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 0836 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 0839 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 083C _ 0F BE. 45, FB
        push    eax                                     ; 0840 _ 50
        call    charToHexVal                            ; 0841 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0846 _ 83. C4, 04
        mov     byte [?_046], al                        ; 0849 _ A2, 00000013(d)
        movzx   eax, byte [ebp-14H]                     ; 084E _ 0F B6. 45, EC
        shr     al, 4                                   ; 0852 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 0855 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 0858 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 085C _ 0F BE. C0
        push    eax                                     ; 085F _ 50
        call    charToHexVal                            ; 0860 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 0865 _ 83. C4, 04
        mov     byte [?_045], al                        ; 0868 _ A2, 00000012(d)
        mov     eax, keyval                             ; 086D _ B8, 00000010(d)
        leave                                           ; 0872 _ C9
        ret                                             ; 0873 _ C3
; charToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 0874 _ 55
        mov     ebp, esp                                ; 0875 _ 89. E5
        sub     esp, 8                                  ; 0877 _ 83. EC, 08
?_035:  sub     esp, 12                                 ; 087A _ 83. EC, 0C
        push    100                                     ; 087D _ 6A, 64
        call    io_in8                                  ; 087F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0884 _ 83. C4, 10
        and     eax, 02H                                ; 0887 _ 83. E0, 02
        test    eax, eax                                ; 088A _ 85. C0
        jnz     ?_036                                   ; 088C _ 75, 02
        jmp     ?_037                                   ; 088E _ EB, 02

?_036:  jmp     ?_035                                   ; 0890 _ EB, E8

?_037:  leave                                           ; 0892 _ C9
        ret                                             ; 0893 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 0894 _ 55
        mov     ebp, esp                                ; 0895 _ 89. E5
        sub     esp, 8                                  ; 0897 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 089A _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 089F _ 83. EC, 08
        push    96                                      ; 08A2 _ 6A, 60
        push    100                                     ; 08A4 _ 6A, 64
        call    io_out8                                 ; 08A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08AB _ 83. C4, 10
        call    wait_KBC_sendready                      ; 08AE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08B3 _ 83. EC, 08
        push    71                                      ; 08B6 _ 6A, 47
        push    96                                      ; 08B8 _ 6A, 60
        call    io_out8                                 ; 08BA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08BF _ 83. C4, 10
        nop                                             ; 08C2 _ 90
        leave                                           ; 08C3 _ C9
        ret                                             ; 08C4 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 08C5 _ 55
        mov     ebp, esp                                ; 08C6 _ 89. E5
        sub     esp, 8                                  ; 08C8 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 08CB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08D0 _ 83. EC, 08
        push    212                                     ; 08D3 _ 68, 000000D4
        push    100                                     ; 08D8 _ 6A, 64
        call    io_out8                                 ; 08DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08DF _ 83. C4, 10
        call    wait_KBC_sendready                      ; 08E2 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 08E7 _ 83. EC, 08
        push    244                                     ; 08EA _ 68, 000000F4
        push    96                                      ; 08EF _ 6A, 60
        call    io_out8                                 ; 08F1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08F6 _ 83. C4, 10
        nop                                             ; 08F9 _ 90
        leave                                           ; 08FA _ C9
        ret                                             ; 08FB _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 08FC _ 55
        mov     ebp, esp                                ; 08FD _ 89. E5
        sub     esp, 24                                 ; 08FF _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 0902 _ A1, 00000100(d)
        mov     dword [ebp-14H], eax                    ; 0907 _ 89. 45, EC
        movzx   eax, word [?_047]                       ; 090A _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0911 _ 98
        mov     dword [ebp-10H], eax                    ; 0912 _ 89. 45, F0
        movzx   eax, word [?_048]                       ; 0915 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 091C _ 98
        mov     dword [ebp-0CH], eax                    ; 091D _ 89. 45, F4
        sub     esp, 8                                  ; 0920 _ 83. EC, 08
        push    ?_049                                   ; 0923 _ 68, 00000000(d)
        push    7                                       ; 0928 _ 6A, 07
        push    0                                       ; 092A _ 6A, 00
        push    0                                       ; 092C _ 6A, 00
        push    dword [ebp-10H]                         ; 092E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 0931 _ FF. 75, EC
        call    showString                              ; 0934 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0939 _ 83. C4, 20
?_038:  call    io_hlt                                  ; 093C _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0941 _ EB, F9
; intHandlerForMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 0943 _ 55
        mov     ebp, esp                                ; 0944 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0946 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 0949 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 094C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 094F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 0952 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 0955 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0957 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 095A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 095D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0960 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 0963 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 096A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 096D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 0974 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0977 _ C7. 40, 08, 00000000
        nop                                             ; 097E _ 90
        pop     ebp                                     ; 097F _ 5D
        ret                                             ; 0980 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 0981 _ 55
        mov     ebp, esp                                ; 0982 _ 89. E5
        sub     esp, 4                                  ; 0984 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 0987 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 098A _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 098D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0990 _ 8B. 40, 10
        test    eax, eax                                ; 0993 _ 85. C0
        jnz     ?_039                                   ; 0995 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 0997 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 099A _ 8B. 40, 14
        or      eax, 01H                                ; 099D _ 83. C8, 01
        mov     edx, eax                                ; 09A0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 09A2 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 09A5 _ 89. 50, 14
        mov     eax, 4294967295                         ; 09A8 _ B8, FFFFFFFF
        jmp     ?_041                                   ; 09AD _ EB, 50

?_039:  mov     eax, dword [ebp+8H]                     ; 09AF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 09B2 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 09B4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 09B7 _ 8B. 40, 04
        add     edx, eax                                ; 09BA _ 01. C2
        movzx   eax, byte [ebp-4H]                      ; 09BC _ 0F B6. 45, FC
        mov     byte [edx], al                          ; 09C0 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 09C2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 09C5 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 09C8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 09CB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 09CE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 09D1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 09D4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 09D7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 09DA _ 8B. 40, 0C
        cmp     edx, eax                                ; 09DD _ 39. C2
        jnz     ?_040                                   ; 09DF _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 09E1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 09E4 _ C7. 40, 04, 00000000
?_040:  mov     eax, dword [ebp+8H]                     ; 09EB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 09EE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 09F1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 09F4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 09F7 _ 89. 50, 10
        mov     eax, 0                                  ; 09FA _ B8, 00000000
?_041:  leave                                           ; 09FF _ C9
        ret                                             ; 0A00 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 0A01 _ 55
        mov     ebp, esp                                ; 0A02 _ 89. E5
        sub     esp, 16                                 ; 0A04 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 0A07 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 0A0A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 0A0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A10 _ 8B. 40, 0C
        cmp     edx, eax                                ; 0A13 _ 39. C2
        jnz     ?_042                                   ; 0A15 _ 75, 07
        mov     eax, 4294967295                         ; 0A17 _ B8, FFFFFFFF
        jmp     ?_044                                   ; 0A1C _ EB, 51

?_042:  mov     eax, dword [ebp+8H]                     ; 0A1E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 0A21 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 0A23 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0A26 _ 8B. 40, 08
        add     eax, edx                                ; 0A29 _ 01. D0
        movzx   eax, byte [eax]                         ; 0A2B _ 0F B6. 00
        movzx   eax, al                                 ; 0A2E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 0A31 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 0A34 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 0A37 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 0A3A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A3D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 0A40 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0A43 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 0A46 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 0A49 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 0A4C _ 8B. 40, 0C
        cmp     edx, eax                                ; 0A4F _ 39. C2
        jnz     ?_043                                   ; 0A51 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 0A53 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 0A56 _ C7. 40, 08, 00000000
?_043:  mov     eax, dword [ebp+8H]                     ; 0A5D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A60 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 0A63 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0A66 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 0A69 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 0A6C _ 8B. 45, FC
?_044:  leave                                           ; 0A6F _ C9
        ret                                             ; 0A70 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 0A71 _ 55
        mov     ebp, esp                                ; 0A72 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 0A74 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 0A77 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 0A7A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 0A7D _ 8B. 40, 10
        sub     edx, eax                                ; 0A80 _ 29. C2
        mov     eax, edx                                ; 0A82 _ 89. D0
        pop     ebp                                     ; 0A84 _ 5D
        ret                                             ; 0A85 _ C3
; fifo8_status End of function


fontA:                                                  ; oword
        db 00H, 18H, 18H, 18H, 18H, 24H, 24H, 24H       ; 0000 _ .....$$$
        db 24H, 7EH, 42H, 42H, 42H, 0E7H, 00H, 00H      ; 0008 _ $~BBB...

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0010 _ 0X

?_045:  db 00H                                          ; 0012 _ .

?_046:  db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0013 _ ........
        db 00H, 00H, 00H, 00H, 00H                      ; 001B _ .....

table_rgb.1514:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0020 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

cursor.1561:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0080 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0088 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0090 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0098 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0100 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0110 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0120 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0128 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0130 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0138 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0140 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0148 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0150 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0158 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0168 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0178 _ .....***


mcursor:                                                ; byte
        resb    256                                     ; 0000

bootInfo:                                               ; qword
        resb    4                                       ; 0100

?_047:  resw    1                                       ; 0104

?_048:  resw    1                                       ; 0106

keyinfo:                                                ; byte
        resb    24                                      ; 0108

keybuf:                                                 ; yword
        resb    32                                      ; 0120

showPos.1495:                                           ; dword
        resd    1                                       ; 0140


?_049:                                                  ; byte
        db 50H, 53H, 2FH, 32H, 20H, 4DH, 6FH, 75H       ; 0000 _ PS/2 Mou
        db 73H, 65H, 20H, 48H, 61H, 6EH, 64H, 6CH       ; 0008 _ se Handl
        db 65H, 72H, 00H                                ; 0010 _ er.


