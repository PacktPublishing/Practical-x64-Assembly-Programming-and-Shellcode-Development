section .text
global _start

_start:
	jmp	one


two:
	pop	rsi
	xor	rax,rax
	mov	al,1
	xor	rdi,rdi
	add	rdi,1
	xor	rdx,rdx
	add	rdx,12
	syscall

	;exit
	xor	rax,rax
	mov	al,60
	xor	rdi,rdi
	syscall


one:

call two
string1:	db	"Hello World",0xa

