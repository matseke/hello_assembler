; nasm -f elf32 -o hello_world.o hello_world.asm
; nasm -f elf32 -o hello_world.o hello_world.asm

global  _start

section .text:

_start:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, message
        mov edx, message_length
        int 0x80

        mov eax, 0x1
        mov ebx, 0
        int 0x80

section .data:
message: db "Hello world!", 0xa
message_length: equ $-message
