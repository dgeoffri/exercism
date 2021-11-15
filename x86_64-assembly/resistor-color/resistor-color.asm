section .rodata

black		db	"black",0
brown		db	"brown",0
red		db	"red",0
orange		db	"orange",0
yellow		db	"yellow",0
green		db	"green",0
blue		db	"blue",0
violet		db	"violet",0
grey		db	"grey",0
white		db	"white",0

color_array:
		dq	black, brown, red, orange, yellow, green, blue, violet, grey, white, 0

section .text
global colors
colors:
		lea	rax, [rel color_array]
		ret

global color_code
color_code:
		push	rbx
 		xor	rbx, rbx
.l1:
		lea	rcx, [rel color_array]
		mov	rsi, [rcx + rbx * 8]
		test	rsi, rsi
		jz	.failed
		push	rdi
		call	compare
		pop	rdi
		test	rax, rax
		jz	.done
		inc	rbx
		jmp	.l1
.failed:
		mov	rbx, -1
.done:
		mov	rax, rbx
		pop	rbx
		ret

compare:
.l1:
		mov	al, BYTE [rsi]
		mov	ah, BYTE [rdi]
		cmp	al, ah	
		jnz	.failed
		test	ah, ah
		jz	.matched
		inc	rsi
		inc	rdi
		jmp	.l1
.failed:
		mov	rax, 1
		jmp	.done
.matched:
		xor	rax, rax
.done:
		ret
