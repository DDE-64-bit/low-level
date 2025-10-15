section .data

section .bss

section .text
    global _start

_start:
    call _printArgc
    
    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_printArgc:
    ; moves the pop'ed value into r12b (which would be the argc)
    pop r12

    ; print count
    mov rax, 1
    mov rdi, 1
    lea rsi, byte [r12]
    mov rdx, 1
    syscall

    ret