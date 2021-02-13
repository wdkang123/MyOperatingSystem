; Disassembly of file: app.o
; Sat Jul 29 17:24:07 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386





main:   ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
?_001:  jmp     ?_001                                   ; 0003 _ EB, FE
; main End of function






