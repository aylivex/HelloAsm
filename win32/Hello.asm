; https://stackoverflow.com/q/1023593/572834
; https://stackoverflow.com/a/1029093/572834

.386
.model flat

    extern _GetStdHandle@4   : proc
    extern _WriteFile@20     : proc
    extern _ExitProcess@4    : proc

.const

message db 'Hello from Win32', 13, 10,
;           'Привет из Win32', 13, 10
messageLen = $ - message

.code

_main:
    ; DWORD  bytes;    
    mov     ebp, esp
    sub     esp, 4

    ; hStdOut = GetstdHandle( STD_OUTPUT_HANDLE)
    push    -11
    call    _GetStdHandle@4
    mov     ebx, eax    

    ; WriteFile( hstdOut, message, length(message), &bytes, 0);
    push    0
    lea     eax, [ebp-4]
    push    eax
    push    messageLen
    push    offset message
    push    ebx
    call    _WriteFile@20

    ; ExitProcess(0)
    push    0
    call    _ExitProcess@4

end _main