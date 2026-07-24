section .data
a:   dq   10
b:   dq   20

section .text
global _start
_start:

	mov	rax,[a]  ; moving value of a into rax
	mov	rbx,[b]  ; moving value of b into rbx
	add	rax,rbx  ; adding rax and rbx, result in rax

	;exit system
	mov	rax,60  ; exit syscall number
	mov	rdi,0   ; return status value
	syscall

