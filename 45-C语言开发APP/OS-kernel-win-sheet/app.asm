; Disassembly of file: app.o
; Fri Feb 12 13:30:29 2021
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386






main:   ; Function begin
        lea     ecx, [esp+4H]                           ; 0000 _ 8D. 4C 24, 04
        and     esp, 0FFFFFFF0H                         ; 0004 _ 83. E4, F0
        push    dword [ecx-4H]                          ; 0007 _ FF. 71, FC
        push    ebp                                     ; 000A _ 55
        mov     ebp, esp                                ; 000B _ 89. E5
        push    ecx                                     ; 000D _ 51
        sub     esp, 4                                  ; 000E _ 83. EC, 04
        sub     esp, 12                                 ; 0011 _ 83. EC, 0C
        push    68                                      ; 0014 _ 6A, 44
        call    api_putchar                             ; 0016 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 001B _ 83. C4, 10
        nop                                             ; 001E _ 90
        mov     ecx, dword [ebp-4H]                     ; 001F _ 8B. 4D, FC
        leave                                           ; 0022 _ C9
        lea     esp, [ecx-4H]                           ; 0023 _ 8D. 61, FC
        ret                                             ; 0026 _ C3
; main End of function






