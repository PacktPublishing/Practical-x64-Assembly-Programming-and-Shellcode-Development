section .text

;create an add function

add_function:

	;create stack frame for this function
	push	rbp
	mov	rbp,rsp
	sub	rsp,0x8
	
	;stack frame is created

	add	rax,rbx  ;result will be stored in rax
	;move the result in stack frame
	mov	QWORD [rsp],rax

	;remove the stack frame
	mov	rsp,rbp
	pop	rbp

	ret

global _start

_start:

	mov	rax,3	; moving the first input
	mov	rbx,4	
	
	call	add_function

	;exit
	mov	rax,60	;system call number for exit
	mov	rdi,0	;return status value for exit syscall
	syscall

