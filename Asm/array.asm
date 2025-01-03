BITS 64

    section .data
    fmt db "%d", 0x0A, 0
    msg db 1, 2, 3
    ;
    section .text
    extern printf
    global main

main:
    lea rdi, [rel fmt]
    lea rdx, [msg + 5000] ; array indexing
    movzx rsi, byte [rdx] ; load val to rsi
    mov rax, 0

    call printf
    jmp _exit

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
