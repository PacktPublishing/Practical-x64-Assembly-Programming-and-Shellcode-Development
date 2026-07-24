section .data
hello_str:   db   "Hello World",0

section .text
global _start
_start:

	; move system call number in RAX register
	mov  rax,1

	; move first input parameter of write syscall
	; first input parameter is 1 ( fd )
	mov  rdi,1
	
	; move second input parameter of write syscall
	; second input parameter is hello_str
	lea	rsi,[hello_str]
	
	;move third input parameter of write syscall
	mov	rdx,11
	syscall ; used to execute the system calls

	; use exit syscall
	;move system call number in RAX register
	mov	rax,60
	;move first input parameter for exit
	mov	rdi,0
	syscall

