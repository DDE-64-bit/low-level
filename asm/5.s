.global _start
.intel_syntax noprefix

// %rax	System call	%rdi	%rsi	%rdx	%r10	%r8	%r9

bss:
buffer: .zero 20
.align 16
iov: .zero 16*3
bss_end:

data:
ask_input: .ascii "What is your name?\n"
hello_msg: .ascii "Hello, "
exclamation: .ascii "!\n"
data_end:

text:
_start: 
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + ask_input]
    mov rdx, hello_msg - ask_input
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rip + buffer]
    mov rdx, 20
    syscall

    mov rcx, rax

    lea rbx, [rip + iov]

    lea rax, [rip + hello_msg]
    mov qword ptr [rbx + 0], rax
    mov rax, exclamation - hello_msg
    mov qword ptr [rbx + 8], 7

    lea rax, [rip + buffer]
    mov qword ptr [rbx + 16], rax
    mov qword ptr [rbx + 24], rcx

    lea rax, [rip + exclamation]
    mov qword ptr [rbx + 32], rax
    mov rax, data_end - exclamation
    mov qword ptr [rbx + 40], 2

    mov rax, 20
    mov rdi, 1
    mov rsi, rbx
    mov rdx, 3
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
