section .text
global _start

_start:


	xor	rax,rax
	mov	al,1
	xor	rdi,rdi
	add	rdi,1
	
	push	0x0a646c72
	mov	rbx,0x6f77206f6c6c6548
	push 	rbx
	mov	rsi,rsp
	
	xor	rdx,rdx
	add	rdx,12
	syscall

	;exit
	xor	rax,rax
	mov	al,60
	xor	rdi,rdi
	syscall



