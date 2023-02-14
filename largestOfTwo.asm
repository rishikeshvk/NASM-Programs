;Program to find largest of two numbers

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

%macro exit 0
    mov eax, 1
    mov ebx, 0
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
    cmp al, bl
    je equal
    jg first
    writes msg3, len3
    writes num2, 1
    writes break, len
    exit
  equal:
    writes msg4, len4
    writes break, len
    exit
  first:
    writes msg3, len3
    writes num1, 1
    writes break, len
    exit
    
section .data
    msg1: db "Enter 1st number: "
    len1: equ $-msg1
    msg2: db "Enter 2nd number: "
    len2: equ $-msg2
    msg3: db "Largest number is "
    len3: equ $-msg3
    msg4: db "Both the numbers are equal"
    len4: equ $-msg4
    break: db 0Ah
    len: equ $-break

section .bss
    num1: resb 1
    num2: resb 1
