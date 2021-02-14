; Disassembly of file: crack.o
; Tue Dec  5 22:58:43 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386





main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 16                                 ; 0003 _ 83. EC, 10
        mov     dword [ebp-4H], 291                     ; 0006 _ C7. 45, FC, 00000123
        mov     eax, dword [ebp-4H]                     ; 000D _ 8B. 45, FC
        mov     byte [eax], 99                          ; 0010 _ C6. 00, 63
        mov     eax, dword [ebp-4H]                     ; 0013 _ 8B. 45, FC
        add     eax, 1                                  ; 0016 _ 83. C0, 01
        mov     byte [eax], 114                         ; 0019 _ C6. 00, 72
        mov     eax, dword [ebp-4H]                     ; 001C _ 8B. 45, FC
        add     eax, 2                                  ; 001F _ 83. C0, 02
        mov     byte [eax], 97                          ; 0022 _ C6. 00, 61
        mov     eax, dword [ebp-4H]                     ; 0025 _ 8B. 45, FC
        add     eax, 3                                  ; 0028 _ 83. C0, 03
        mov     byte [eax], 99                          ; 002B _ C6. 00, 63
        mov     eax, dword [ebp-4H]                     ; 002E _ 8B. 45, FC
        add     eax, 4                                  ; 0031 _ 83. C0, 04
        mov     byte [eax], 107                         ; 0034 _ C6. 00, 6B
        mov     eax, dword [ebp-4H]                     ; 0037 _ 8B. 45, FC
        add     eax, 5                                  ; 003A _ 83. C0, 05
        mov     byte [eax], 0                           ; 003D _ C6. 00, 00
        leave                                           ; 0040 _ C9
        ret                                             ; 0041 _ C3
; main End of function






