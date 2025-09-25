%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .bss
    inputNumber: resb 16
    inputBuffer: resb 16

section .data
    text: db "Test", 10
    textLen equ $ - text

section .text
    global _start

_start:
    ; xor rbx, rbx
    xor bl, bl
    xor r12, r12

    ;get number input
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel inputNumber]
    ;1 less than size(inputNumber)
    mov rdx, 15
    syscall

    lea rbx, [rel inputNumber]
    mov byte [rbx + rax], 0

    cmp byte [rbx + rax - 1], 10
    je _foundNL

_loop:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel text]
    mov rdx, textLen
    syscall

    inc rbx

    cmp r12b, bl
    ; cmp rbx, 3

    jne _loop

    exit 0

_flush:
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel inputBuffer]
    mov rdx, 64
    syscall
    cmp rax, 0
    jle _foundNL

    mov rcx, rax
    lea rbx, [rel inputBuffer]


_findNL:
    cmp rcx, 0
    je _flush

    cmp byte [rbx], 10
    je _foundNL

    inc rbx
    dec rcx
    jmp _findNL

_foundNL:
    mov rax, 1
    mov rdi, 1

    lea rsi, [rel inputNumber]
    mov rdx, 63
    syscall

    exit 0

_runCode:
    movzx r12, byte [inputNumber] ;mov as unsigned 
    sub r12, '0'
 
    call _loop
