section .data
a:	dq	5
b:	dq	3

section .text
global _start
_start:

	mov	rax,[a]  ; moving a value into rax reg
	mov	rbx,[b]	 ; moving b value into rbx reg
	imul	rbx	; multiply rbx with rax and result in rax
	

	;exit system call
	mov	rax,60	;syscall number for exit
	mov	rdi,0	; return status value
	syscall

