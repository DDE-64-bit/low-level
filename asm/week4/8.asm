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

    mov 