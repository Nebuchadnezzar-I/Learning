    section .data
    msg db "Hello World!", 0Ah
    len equ $ - msg

    section .text
    global main

main:
    mov rbx, 0x00

_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    inc rbx
    cmp rbx, 0x06
    jnz _loop

    call _exit

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
