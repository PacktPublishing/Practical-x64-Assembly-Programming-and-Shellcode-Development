section .text
global _start

my_function:

	;create stack frame for this function
	push	rbp
	mov	rbp,rsp
	sub	rsp,8

	;add two number and store the result on stack
	mov	rax,3
	mov	rbx,4
	add	rax,rbx	   ;result in rax
	
	;move the result in our stack vacant area
	mov	QWORD [rsp],rax

	;remove the stack frame
	mov	rsp,rbp
	pop	rbp

	;return from this function
	ret

_start:

	call	my_function

	;exit
	mov	rax,60	;system call number for exit
	mov	rdi,0	;return status value for exit
	syscall


