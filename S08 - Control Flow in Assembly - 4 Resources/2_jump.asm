section .text
global _start

_start:

	mov	rax,5
	mov	rbx,5
	sub	rax,rbx  ;  result is 0
	jz	exit_3
	
	;exit system call with return value 1
	mov	rax,60   ; system call number for exit
	mov	rdi,1	; return status value for exit
	syscall

exit_3:

	;exit system call with return value 3
	mov	rax,60
	mov	rdi,3
	syscall

