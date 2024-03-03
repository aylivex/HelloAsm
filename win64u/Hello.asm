    extern GetStdHandle   : proc
    extern WriteFile      : proc
    extern WriteConsoleW  : proc
    extern ExitProcess    : proc

.const

message     dw  'H', 'e', 'l', 'l', 'o',        ; Hello from Win64
                ' ', 'f', 'r', 'o', 'm',
                ' ', 'W', 'i', 'n', '6', '4',
                13,  10,
                041Fh, 0440h, 0438h, 0432h,     ; Привет из Win64
                0435h, 0442h, 0020h, 0438h,
                0437h, 0020h, 0057h, 0069h,
                006Eh, 0036h, 0034h,
                   13,    10
messageLen = ($ - message) / 2

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

    ; WriteConsole(hstdOut, message, length(message), &bytes, 0);
    mov     rcx, rax                    ; hstdOut - 1st argument
    mov     rdx, offset message         ; message - 2nd argument
    mov     r8,  messageLen             ; msg Len - 3rd argument
    mov     r9,  rbx                    ; &bytes  - 4th argument
    mov     qword ptr [rsp + 20h], 0    ; NULL for 5th parameter
    call    WriteConsoleW

    or      rax, rax
    jnz     exit                        ; Succeeded -> exit

    ; WriteConsole failed, use WriteFile instead
    mov     rcx, rax                    ; hstdOut - 1st argument
    mov     rdx, offset message         ; message - 2nd argument
    mov     r8,  messageLen             ; msg Len - 3rd argument
    mov     r9,  rbx                    ; &bytes  - 4th argument
    mov     qword ptr [rsp + 20h], 0    ; NULL for 5th parameter
    call    WriteFile

exit:
    ; ExitProcess(0)
    xor     rcx, rcx
    call    ExitProcess
main endp 

end