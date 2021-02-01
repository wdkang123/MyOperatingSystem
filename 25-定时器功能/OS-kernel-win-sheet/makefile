ckernel_u.asm : ckernel.o
	./objconv -fnasm ckernel.o ckernel_u.asm
ckernel.o : write_vga_desktop.o win_sheet.o mem_util.o timer.o global_define.o
	i386-elf-ld -m elf_i386 -r write_vga_desktop.o mem_util.o win_sheet.o timer.o global_define.o -o ckernel.o
write_vga_desktop.o : write_vga_desktop.c win_sheet.c win_sheet.h mem_util.c mem_util.h timer.c timer.h global_define.c global_define.h
	i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o write_vga_desktop.o write_vga_desktop.c
win_sheet.o : win_sheet.c win_sheet.h
	i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o win_sheet.o win_sheet.c
mem_util.o : mem_util.h mem_util.c
	i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o mem_util.o mem_util.c
timer.o : timer.c timer.h
	i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o timer.o timer.c
global_define.o: global_define.c global_define.h
	i386-elf-gcc -m32 -fno-asynchronous-unwind-tables -s -c -o global_define.o global_define.c
