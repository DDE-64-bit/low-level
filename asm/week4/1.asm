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
    text db "Hello, World!", 10, 0
    text1 db "Hello, World Two!", 10, 0

section .text
    global _start

_start:
    print text
    print text1

    exit 0

input: rax
output: print string at rax
_print:
    push rax
    mov rbx, 0
_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0

    jnz _printLoop

    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret

; section .data
;     text: db "Text", 10

; section .text
; _start:
;     mov rax, 1
;     mov rdi, 1
;     lea rsi, [rel text]
;     mov rdx, 5
;     syscall
    
;     mov rax, 60
;     mov rdi, 0
;     syscall
