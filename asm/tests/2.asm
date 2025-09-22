section .data
    digit db 0, 10

section .text
    global _start

_start:
    push 4
    push 9
    push 6
    push 3

    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit

    call _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret
