%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .bss
    input: resb 10 ;9 digits and \n

section .data
    giveInputText: db "Please give a single number as input: "
    len equ $ - giveInputText
    printText: db "Print Text", 10
    printTextLen equ $ - printText

section .text
    global _start

_start:
    call _getInput
    call
    call _prepLoop
    call _loop

    exit 0

_getInput:
    mov rax, 1
    mov rdi, 1
    lea rsi, giveInputText
    mov rdx, len
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rel input]
    mov rdx, 2
    syscall

    ret 

_prepLoop:
    xor bx, bx
    xor r12w, r12w

    movzx bx, byte [rel input]
    sub bx, '0'
    ret

_loop:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel printText]
    mov rdx, printTextLen
    syscall
    
    inc r12w ;counter

    cmp bx, r12w
    jne _loop

    ret