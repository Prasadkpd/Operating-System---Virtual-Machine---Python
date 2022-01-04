.code16
.global init

init:
	mov $0x0e41, %ax
	mov $msg, %si
	print_char:
		lodsb
		cmp $0, %al
		je end
		int $0x10
		jmp print_char
	end:
		hlt
		
msg:
	.asciz "Hello World!"
	
.fill 510-(.-init), 1, 0
.word 0xaa55
