section .data
    pleaseSelectActionText db "Please select an action: ", 10
    option1Text db "1. ", 10
    option3Text db "3. Exit", 10
    getUserInput db "Action: ", 10
    getNumberOneText db "Give first single number to sum", 10
    getNumberTwoText db "Give second single number to sum", 10

section .bss
    actionInputBuf resb 2
    firstNumberInput resb 2
    secondNumberInput resb 2

section .text
    global _start

_start:
    call _printOptions
    call _getActionInput
    call _compareAction

    mov rcx, 0
    call _exitWithRCX

_printOptions:
    mov rax, 1
    mov rdi, 1
    mov rsi, pleaseSelectActionText
    mov rdx, 26
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, option3Text
    mov rdx, 8
    syscall

    ret

_getActionInput:
    mov rax, 1
    mov rdi, 1
    mov rsi, getUserInput
    mov rdx, 9
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, actionInputBuf
    mov rdi, 2
    syscall

    ret

_compareAction:
    add rax, 48
    mov al, [actionInputBuf]

    cmp al, 49 ; 1st action
    ; je _......
    je _sum

    cmp al, 51 ; 3th action - exit
    mov rcx, 0
    je _exitWithRCX

    ; return to input

    call _start

_exitWithRCX:
    mov rax, 60
    mov rdi, rcx
    syscall

_sum:
    mov rax, 1
    mov rdi, 1
    mov rsi, getNumberOneText
    mov rdx, 32
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, firstNumberInput
    mov rdx, 2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, getNumberTwoText
    mov rdx, 33
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, secondNumberInput
    mov rdx, 2
    syscall
    
    ; add first byte of input to 

    ret
