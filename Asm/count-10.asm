BITS 64

    section .data
    fmt db "%d", 0x0A, 0
    msg db 1, 2, 3, 4, 5, 6
    ;
    section .text
    extern printf
    global main

main:
    mov rbx, 0x00

_loop:
    ;
    mov rdi, fmt
    movzx rsi, byte [msg + rbx]
    xor rax, rax
    call printf
    ;
    inc rbx
    cmp rbx, 0x06
    jnz _loop

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
