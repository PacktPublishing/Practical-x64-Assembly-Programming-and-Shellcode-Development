section .data
string1:	db	"DGF"


section .bss
string2:	resb	3


section .text
global _start

_start:

	cld		;clear the direction flag
	mov	rcx,3	;loop count

	lea	rsi,[string1]	;set up the source pointer in rsi
	lea	rdi,[string2]	;set up the destination ptr in rdi

Loop_Me:

	lodsb	;loading a single byte from rsi to rax reg
	xor	rax,0x5	; decrypt the value in rax

	stosb		;it will load the rax value into string2
	loop	Loop_Me

	;exit
	mov	rax,60	;syscall number for exit
	mov	rdi,0	;return status value for exit
	syscall

