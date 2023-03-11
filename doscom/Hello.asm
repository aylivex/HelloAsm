.model tiny

.code

org 100h

main:
    lea dx, hello
    mov ah, 9h
    int 21h

    mov ah, 4Ch
    int 21h

.data

hello db "Hello from DOS", 10, 13, "$"

end main
