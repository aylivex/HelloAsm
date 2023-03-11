; https://medium.com/ax1al/dos-assembly-101-4c3660957d25
.model small

.stack 100h

.data

hello db "Hello from DOS", 10, 13, "$"

.code

_main proc
    mov ax, @data
    mov ds, ax

    lea dx, hello
    mov ah, 9h
    int 21h

    mov ah, 4Ch
    int 21h
_main endp

end _main
