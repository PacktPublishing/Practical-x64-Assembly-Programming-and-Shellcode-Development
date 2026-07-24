section .data
string1:	db 	"ABC"


section .bss
string2:	resb	3

section .text

global _start

_start:

	cld	;clear the direction flag

	mov	rcx,3

	lea	rsi,[string1]	; loading string1 addr to rsi
	lea	rdi,[string2]	; loading string2 addr to rdi


Loop_Me:

	lodsb	;loading bytes from string1 into rax register
	stosb	;storing bytes from rax into string2
	loop	Loop_Me

	;exit
	mov	rax,60	;exit system call number
	mov	rdi,0	;return status value for exit
	syscall

