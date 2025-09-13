.global _start
.intel_syntax noprefix

.bss
buffer: .zero 64

.data
question: .ascii "Wat is je naam?\n"
welkom: .ascii "Welkom, "
data_end:

.text
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + question]
    mov rdx, welkom - question
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rip + buffer]
    mov rdx, 64
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + welkom]
    mov rdx, nl - welkom
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + buffer]
    mov rdx, rcx
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
