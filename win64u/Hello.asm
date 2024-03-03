    extern GetStdHandle   : proc
    extern WriteFile      : proc
    extern ExitProcess    : proc

.const

message db 'Hello from Win64', 13, 10
messageLen = $ - message

.code

main proc
    ; Reserve space for QWORD bytes return value
    ; of WriteFile
    sub     rsp, 10h         ; Allocate 16 bytes intead of 8
    mov     rbx, rsp         ; to keep stack pointer 16-byte aligned
    
    ; Allocate shadow space for function calls
    sub     rsp, 20h

    ; hStdOut = GetstdHandle( STD_OUTPUT_HANDLE)
    mov     rcx, -11
    call    GetStdHandle

    ; WriteFile( hstdOut, message, length(message), &bytes, 0);
    mov     rcx, rax                    ; hstdOut - 1st argument
    mov     rdx, offset message         ; message - 2nd argument
    mov     r8,  messageLen             ; msg Len - 3rd argument
    mov     r9,  rbx                    ; &bytes  - 4th argument
    mov     qword ptr [rsp + 20h], 0    ; NULL for 5th parameter
    call    WriteFile

    ; ExitProcess(0)
    xor     rcx, rcx
    call    ExitProcess
main endp 

end