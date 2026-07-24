section .text
global _start

_start:

	mov	rax,100
	mov	rbx,200
	jmp	exit   ; jumping from here to exit label
	mov	rcx,30

exit:
	;exit system call
	mov	rax,60	;system call number
	mov	rdi,0   ;return status value for exit
	syscall

