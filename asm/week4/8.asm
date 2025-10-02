section .text
    global _start

_start:
    call _printFromStack

    mov rax, 60
    mov rdi, 0
    syscall

_printFromStack:
    ; push rbp to the stack
    push rbp

    ; save current stackptr for later use
    mov rbp, rsp

    ; adds 16 to the stack
    sub rsp, 16

    mov byte [rsp + 0], 'H'
    mov byte [rsp + 1], 'e'
    mov byte [rsp + 2], 'l'
    mov byte [rsp + 3], 'l'
    mov byte [rsp + 4], 'o'
    mov byte [rsp + 5], ' '
    mov byte [rsp + 6], 'w'
    mov byte [rsp + 7], 'o'
    mov byte [rsp + 8], 'r'
    mov byte [rsp + 9], 'l'
    mov byte [rsp + 10], 'd'
    mov byte [rsp + 11], '!'

    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp]
    mov rdx, 16
    syscall

    ; restore stack
    add rsp, 16

    pop rbp

    ret
