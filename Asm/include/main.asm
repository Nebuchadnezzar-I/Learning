    section .data
    msg db "Hello World!", 0Ah
    len equ $ - msg

    section .text
    %include "exit.asm"
    global main

main:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    call _exit
