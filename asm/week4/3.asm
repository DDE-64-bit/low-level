%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .data
text: db "Enter a single number", 10
len equ $ - text

helloWorld: db "Hello, World!", 10
helloWorldLen equ $ - helloWorld

section .bss
    input resb 2

section .text
    global _start

_start:
    call _getAmount ;loads 'input' with a number

    mov r12b, [rel input]
    sub r12b, '0' ;makes it a digit (non ascii)
    xor bl, bl
    call _printLoop

    exit 0

_getAmount:
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

    ; mov rax, 1
    ; mov rdi, 1
    ; lea rsi, [rel input]
    ; mov rdx, 2
    ; syscall
    ret

_printLoop:    
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel helloWorld]
    mov rdx, helloWorldLen
    syscall

    inc bl
    cmp bl, r12b
    jb _printLoop

    ret