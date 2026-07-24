section .data
dividend:	dq	17
divisor:	dq	5

section .text
global _start
_start:

	mov	rax,[dividend]   ; moving dividend in rax
	mov	rbx,[divisor]  

	idiv	rbx	; rax will be divided by rbx ( divisor )

	; exit system call
	mov	rax,60   ; moving syscall number in rax
	mov	rdi,0   ; return value in rdi
	syscall

