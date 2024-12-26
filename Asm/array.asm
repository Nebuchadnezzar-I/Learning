BITS 64

    section .data
    msg db 1, 2 ,3
    fmt db "%d", 0x0A, 0
    ;
    section .text
    extern printf
    global main

main:
    lea rdi, [rel fmt]
    mov rsi, 10 ; make it a array index
    xor rax, rax
    call printf

    call _exit

_exit:
    mov rax, 0x00
    ret
