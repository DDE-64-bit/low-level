.global _start
.intel_syntax noprefix

// %rax	System call	%rdi	%rsi	%rdx	%r10	%r8	%r9

_start:
    mov r12, 5

    loop_start:
        mov rax, 1
        mov rdi, 1
        mov rdx, msg_end - msg
        lea rsi, [rip+msg]
        syscall

        dec r12
        jnz loop_start

    mov rax, 60
    mov rdi, 0
    syscall

msg:
    .ascii "Hello World!\n"
msg_end:



// could also use .asciz but that adds an \0
// as -o file.o file.s 
// ld -o file file.o
