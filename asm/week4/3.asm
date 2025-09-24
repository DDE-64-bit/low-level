%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .data
text: db "Enter a single number", 10
len equ $ - text

section .bss
    input resb 2

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel text]
    mov rdx, len
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 2
    syscall

    mov rax, 1
    mov rdi, 1
    lea rdi, [rel input]
    mov rdx, 2
    syscall

    exit 0