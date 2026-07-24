section .text
global _start

_start:

	;exit
	xor	rax,rax
	mov	al,60
	xor	rdi,rdi		
	syscall

