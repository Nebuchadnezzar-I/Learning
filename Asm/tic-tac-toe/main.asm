    section .bss
    ; user
    io_buffer resb 1
    ; game
    action_buf resb 9
    ;
    section .data
    ; global
    new_line db 0Ah
    clear_screen db 0x1b, "[2J", 0x1b, "[H", 0
    clear_screen_len equ $ - clear_screen
    ; board
    tbl db "     |     |     ", 0Ah
        db "  A  |  B  |  C  ", 0Ah
        db "_____|_____|_____", 0Ah
        db "     |     |     ", 0Ah
        db "  D  |  E  |  F  ", 0Ah
        db "_____|_____|_____", 0Ah
        db "     |     |     ", 0Ah
        db "  G  |  H  |  I  ", 0Ah
        db "     |     |     ", 0Ah
    tbl_len equ $ - tbl
    ; row A
    offset_A equ 20
    offset_B equ 26
    offset_C equ 32
    ; row B
    offset_D equ 74
    offset_E equ 80
    offset_F equ 86
    ; row C
    offset_G equ 128
    offset_H equ 134
    offset_I equ 140
    ;
    ;
    section .text
    global _start

_start:
    mov r9, 0x00
_draw:
    ; clear ccreen
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, clear_screen
    mov rdx, clear_screen_len
    syscall
    ; print board
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, tbl
    mov rdx, tbl_len
    syscall
    ; print last action
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, io_buffer
    mov rdx, 0x01
    syscall
    ; print new line
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, new_line
    mov rdx, 0x01
    syscall
    ; read
    mov rax, 0x00
    mov rdi, 0x00
    mov rsi, io_buffer
    mov rdx, 0x14
    syscall

    ; identify io buffer
_ident:
    cmp byte [io_buffer], 'A'
    mov rbx, offset_A
    je _update_table
    ;
    cmp byte [io_buffer], 'B'
    mov rbx, offset_B
    je _update_table
    ;
    cmp byte [io_buffer], 'C'
    mov rbx, offset_C
    je _update_table
    ;
    cmp byte [io_buffer], 'D'
    mov rbx, offset_D
    je _update_table
    ;
    cmp byte [io_buffer], 'E'
    mov rbx, offset_E
    je _update_table
    ;
    cmp byte [io_buffer], 'F'
    mov rbx, offset_F
    je _update_table
    ;
    cmp byte [io_buffer], 'G'
    mov rbx, offset_G
    je _update_table
    ;
    cmp byte [io_buffer], 'H'
    mov rbx, offset_H
    je _update_table
    ;
    cmp byte [io_buffer], 'I'
    mov rbx, offset_I
    je _update_table

    jne _draw

_update_table:
    mov al, [io_buffer]
    mov byte [action_buf + r9], al
    inc r9

    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rsi, action_buf
    ; mov rdx, 0x09
    ; syscall

    mov byte [tbl + rbx], 'X'
    jmp _draw

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall


    ; ; clear ccreen
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rsi, clear_screen
    ; mov rdx, clear_screen_len
    ; syscall
    ; ; A
    ; lea rsi, [tbl]
    ; add rsi, offset_A
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, clear_screen_len
    ; syscall
    ; ; B
    ; lea rsi, [tbl]
    ; add rsi, offset_B
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; C
    ; lea rsi, [tbl]
    ; add rsi, offset_C
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; D
    ; lea rsi, [tbl]
    ; add rsi, offset_D
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; E
    ; lea rsi, [tbl]
    ; add rsi, offset_E
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; F
    ; lea rsi, [tbl]
    ; add rsi, offset_F
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; G
    ; lea rsi, [tbl]
    ; add rsi, offset_G
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; H
    ; lea rsi, [tbl]
    ; add rsi, offset_H
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
    ; ; I
    ; lea rsi, [tbl]
    ; add rsi, offset_I
    ; mov rax, 0x01
    ; mov rdi, 0x01
    ; mov rdx, 0x01
    ; syscall
