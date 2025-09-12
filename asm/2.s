.global _start
.intel_syntax noprefix

.bss
buffer: .zero 32

.data
name_msg: .ascii "What is your name?\n"
hello_msg: .ascii "Hello, "
exclam_msg: .ascii "!\n"
msg_end:

.text
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + name_msg]
    mov rdx, hello_msg - name_msg
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rip + buffer]
    mov rdx, 32
    syscall

    dec rax
    mov r12, rax
    mov byte ptr [buffer + rax], 0

    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + hello_msg]
    mov rdx, exclam_msg - hello_msg
    syscall

    mov rax, 1 
    mov rdi, 1
    lea rsi, [rip + buffer]
    mov rdx, r12
    syscall

    mov rax, 1
    mov rdi, 1 
    lea rsi, [rip + exclam_msg]
    mov rdx, msg_end - exclam_msg
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
