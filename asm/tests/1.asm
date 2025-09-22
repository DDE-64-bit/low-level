section .bss
    buf resb 16

section .text
    global _start

_start:
    call _getInput

    mov rcx, buf

    cmp rcx, 16
    jle _exit
    
    mov rax, 60
    mov rdi, 1
    syscall
    

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 16
    syscall
    ret

