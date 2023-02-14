;Program to find largest of an array

%macro writes 2
    mov eax, 4
    mov ebx, 1
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
    xor ax, ax
    xor bx, bx
    mov cl, [n]
    mov edx, array
    mov al, [edx]
  label:
    mov bl, [edx]
    cmp al, bl
    jg large
    mov ax, bx
  large:
    inc edx 
    loop label
    add ax, '0'
    mov [res], ax
    writes msg1, len1
    writes res, 1
    writes break, len
    exit
       
    
section .data
    array: db 9,6,7,4
    n: db 4
    msg1: db "Largest: "
    len1: equ $-msg1
    break: db 0Ah
    len: equ $-break

section .bss
    res: resw 1
