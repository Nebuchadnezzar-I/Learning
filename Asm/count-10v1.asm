BITS 64

    section .data
    msg db 1, 2, 3, 4, 5, 6
    ;
    section .text
    global _start

_start:
    mov rbx, 0x00

_loop:
    inc rbx
    cmp rbx, 0x06
    jnz _loop

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
