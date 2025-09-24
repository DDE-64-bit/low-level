%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

%macro print 1
    lea rsi, [rel %1]
    xor rbx, rbx

%%printLoop:
    inc rbx
    inc rsi

    mov cl, [rsi]
    cmp cl, 0

    jnz %%printLoop

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel %1]
    mov rdx, rbx
    syscall
%endmacro

section .data
    text db "Hello World!!!!!", 10, 0

section .text
    global _start

_start:
    push 55
    push 29
    push 12

    mov rax, [rsp]

    print text

    exit 0