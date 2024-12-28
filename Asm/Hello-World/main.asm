    section .data align=64
    msg db "let", "const", "for", "while", "true", "false", "break"
    end db 0Ah

    section .text
    global _start
    %include "help.asm"

_start:
    ; print let
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg + 0x00]
    mov rdx, 0x03
    syscall

    lea rbx, [_print_end_return_1]
    jmp _print_end

_print_end_return_1:
    ; print true
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg + 0x10]
    mov rdx, 0x04
    syscall

    lea rbx, [_exit]
    jmp _print_end
