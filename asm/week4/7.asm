; print hello world via stack

section .text
    global _start

_start:
    call print_hello
    call print_world

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

print_world:
    push rbp
    mov rbp, rsp

    sub rsp, 16

    ; world
    mov byte [rsp + 0], 32
    mov byte [rsp + 1], 'W'
    mov byte [rsp + 2], 'o'
    mov byte [rsp + 3], 'r'
    mov byte [rsp + 4], 'l'
    mov byte [rsp + 5], 'd'
    mov byte [rsp + 6], '!'

    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp]
    mov rdx, 7
    syscall

    add rsp, 16
    pop rbp
    
    ret

print_hello:
    push rbp
    mov rbp, rsp

    ; reserve 16 bytes on the stack
    sub rsp, 16

    mov byte [rsp + 0], 'H'
    mov byte [rsp + 1], 'e'
    mov byte [rsp + 2], 'l'
    mov byte [rsp + 3], 'l'
    mov byte [rsp + 4], 'o'

    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp]
    mov rdx, 5
    syscall

    add rsp, 16
    
    pop rbp
    ret
