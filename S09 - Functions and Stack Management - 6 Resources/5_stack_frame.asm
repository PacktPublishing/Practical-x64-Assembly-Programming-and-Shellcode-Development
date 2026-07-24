section .text
global _start

_start:

	;creating the stack frame
	push	rbp   	;pushing rbp on the stack
	mov	rbp,rsp  ; moving the address of rsp to rbp
	sub	rsp,8	;creating 8 bytes of space in this frame
	
	;moving our data into this frame
	mov	QWORD [rsp],4

	;removing the stack frame
	mov	rsp,rbp		;both points to the bottom of the stack
	pop	rbp		;removing rbp from the stack


	;exit
	mov	rax,60		;syscall number of exit
	mov	rdi,0		;return status value for exit
	syscall

