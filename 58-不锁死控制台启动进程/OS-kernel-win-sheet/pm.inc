%macro Descriptor 3
    dw    %2  &  0FFFFh
    dw    %1  &  0FFFFh
    db   (%1>>16) & 0FFh
    dw   ((%2 >> 8) & 0F00h) | (%3 & 0F0FFh)
    db   (%1 >> 24) & 0FFh
%endmacro


DA_32		EQU	4000h	; 32 位段
DA_C		EQU	98h	; 存在的只执行代码段属性值
DA_CR		EQU	9Ah
DA_DRW		EQU	92h	; 存在的可读写数据段属性值
DA_DRWA		EQU	93h	; 存在的已访问可读写数据段类型值
DA_386IGate EQU 8Eh ; 中断调用门
DA_LIMIT_4K	EQU	8000h	; 段界限粒度为 4K 字节
DA_386TSS	EQU	  89h

;Gate selecotor, offset, DCount, Attr
%macro Gate 4
  dw  (%2 & 0FFFFh)
  dw  %1
  dw  (%3 & 1Fh) | ((%4 << 8) & 0FF00h)
  dw  ((%2>>16) & 0FFFFh)
%endmacro