section .data
    file: db "data.txt", 0

section .bss
    buf: resb 256

section .text
    global _start

_start:
    ; open file
    mov rax, 2
    lea rdi, file
    mov rsi, 0x402
    mov rdx, 0
    syscall

    ; save fd to r12
    mov r12, rax

    ; stat call
    mov rax, 4
    mov rdi, r12
    lea rsi, [buf]
    syscall

    ; print stats
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, 256
    syscall

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall
