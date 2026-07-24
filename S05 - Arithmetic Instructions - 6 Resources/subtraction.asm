section .data
a:	dq	10
b:	dq	100

section .text
global _start
_start:

	mov	rax,[a] ; moving value a into rax
	mov	rbx,[b] ; moving value b into rbx
	sub	rbx,rax  ; 100-10  result in rbx

	;exit system
	mov	rax,60  ; moving syscall no. into rax
	mov	rdi,0  ; return status value into rdi
	syscall

