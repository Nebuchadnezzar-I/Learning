    section .data
    msg db "Hello World!", 0Ah
    len equ $ - msg

    section .text
    global main

main:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    call _exit

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
