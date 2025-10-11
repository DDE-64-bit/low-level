section .data
    question: db "Please give some input to print: "
    questionLen equ $ - question
    debug: db "debug", 10
    debugLen equ $ - debug

section .bss
    buf: resb 2048

section .text
    global _start

_start:
    call _getAndSaveInput


    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_getAndSaveInput:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, question
    mov rdx, questionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [buf]
    mov rdx, 2048
    syscall

    ; save input size
    mov r12, rax

    ; align r12 to 16
    add r12, 15 
    add r12, -16

    ; prepare stack
    push rbp

    ; align stack with the length + most likely buffer of the input
    sub rsp, r12

    ; add buf to stack
    mov rsp + 0, buf

    ; clear buf to check
    

    ; print stack
    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp]
    mov rdx, r12
    syscall

    ret 
