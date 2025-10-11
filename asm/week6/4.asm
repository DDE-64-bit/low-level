section .data

section .bss

section .text
    global _start

_start:
    call _stack    

    ; exit 
    mov rax, 60
    mov rdi, 0
    syscall

_stack:
    ; prepping stack
    push rbp

    ; align stack
    sub rsp, 16

    ; add to stack
    mov byte [rsp + 0], 'H'
    mov byte [rsp + 1], 'e'
    mov byte [rsp + 2], 'l'
    mov byte [rsp + 3], 'l'
    mov byte [rsp + 4], 'o'
    mov byte [rsp + 5], '!'
    mov byte [rsp + 6], 10

    ; print stack
    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp]
    mov rdx, 7
    syscall

    ; return the stack
    add rsp, 16
    pop rbp

    ret 
