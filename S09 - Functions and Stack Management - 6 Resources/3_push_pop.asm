section .text
global _start

_start:

		push	0x11	;pushing 0x11 on top of the stack
		push	0x22	;pushing 0x22 on top of the stack
		
		
		pop		rax		;moving the top value of the stack in rax
		pop 	rbx		;moving the top value of the stack in rbx
		
		;exit
		
		mov		rax,60	;syscall number for exit
		mov		rdi,0	;return status value of exit
		syscall
