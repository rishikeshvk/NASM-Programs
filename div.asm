;Program to divide 2 numbers

%macro writes 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro reads 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .text
        global _start:
_start:
    writes msg1, len1
    reads num1, 2
    writes msg2, len2
    reads num2, 2
    mov al, [num1]
    mov bl, [num2]
    sub al, '0'
    sub bl, '0'
    div bl
    add al, '0'
    add ah, '0'
    mov [quo], al
    mov [rem], ah
    writes msg3, len3
    writes quo, 1
    writes break, len
    writes msg4, len4
    writes rem, 1
    writes break, len

    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    msg1: db "Enter 1st number: "
    len1: equ $-msg1
    msg2: db "Enter 2nd number: "
    len2: equ $-msg2
    msg3: db "The quotient is "
    len3: equ $-msg3
    msg4: db "The remainder is "
    len4: equ $-msg4
    break: db 0Ah
    len: equ $-break

section .bss
    num1: resb 1
    num2: resb 1
    quo: resb 1
    rem: resb 1
