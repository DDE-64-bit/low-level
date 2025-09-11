.global _start
.intel_syntax noprefix

// %rax	System call	%rdi	%rsi	%rdx	%r10	%r8	%r9

_start:
    mov rax, 60
    mov rdi, 1
    syscall

// as -o file.o file.s 
// ld -o file file.o
