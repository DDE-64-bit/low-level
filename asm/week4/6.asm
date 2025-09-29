section .data
    inputText: db "Single number: "
    inputLen equ $ - inputText
    getPrintText: db "Please enter a text to print: "
    getPrintTextLen equ $ - getPrintText

    ; make a buf for r12b (single byte buffer)
    buf: db 0

section .bss
    input: resb 2 ; number + \n
    printText: resb 32

section .text
    global _start

_start:
    ; write text
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel inputText]
    mov rdx, inputLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel input]
    mov rdx, 2
    syscall

    ; print get print text
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel getPrintText]
    mov rdx, getPrintTextLen
    syscall

    ; get print text
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel printText]
    mov rdx, 32
    syscall

    ; save amount of input bytes
    mov rbx, rax


    ; print text 1 time

    ; mov rax, 1
    ; mov rdi, 1
    ; lea rsi, [rel printText];
    ; mov rdx, rbx
    ; syscall

    ; get info for loop

    ; reg, use
    ; rbx,          amount of input bytes
    ; rbp (bl),     loop counter
    ; r12 (r12b),   number

    ; set bl (8bit) to 0
    xor bl, bl

    ; move byte to al
    mov r12b, byte [input]

    ; ptr to r12b
    mov byte [buf], r12b

    ; debug print to check result
    mov rax, 1
    mov rdi, 1
    lea rsi, byte [buf]
    mov rdx, 1
    syscall

    ; use lea rsi, [input] to get access to the needed value



    ; start loop
    _loop:

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall
