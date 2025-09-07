.global _start
.intel_syntax noprefix

// %rax	System call	%rdi	%rsi	%rdx	%r10	%r8	%r9

.section .data
msg: .ascii "Hello, world!\n"
.equ msg_len, .-msg 

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + msg]
    mov rdx, msg_len
    syscall

    mov rax, 60
    mov rdi, 69
    syscall
