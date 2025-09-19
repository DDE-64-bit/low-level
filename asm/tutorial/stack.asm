section .data
    text db "Pushed data", 10
section .bss
    input resb 32

section .text
    global _start

_start:
    call _getInput
    
    push input
    call _pushInput
    call _printStack
    call _exit

_getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 32
    syscall
    ret

_pushInput:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 12
    syscall
    call _printStack

_printStack:
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 5
    syscall
    call _pushInput

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
