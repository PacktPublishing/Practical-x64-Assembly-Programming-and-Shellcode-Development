section .data
string1:	db	"ABC"

section .bss
string2:	resb	3

section .text
global _start

_start:

	cld		;clear the direction flag

	mov	rcx,3	; loop count

	lea	rsi,[string1]	;loading the addr of string1 in rsi
	lea	rdi,[string2]	;loading the addr of string2 in rdi

Loop_Me:

	lodsb		;load each byte one by one in rax reg
	xor	rax,0x5	; xoring rax value with 0x5
	stosb		; storing the encrypted byte in string2
	loop	Loop_Me

	;exit
	mov	rax,60	;syscall number for exit
	mov	rdi,0	;return status value for exit syscall
	syscall


