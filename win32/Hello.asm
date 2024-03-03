; https://stackoverflow.com/q/1023593/572834
; https://stackoverflow.com/a/1029093/572834

.386
.model flat

    extern _GetStdHandle@4   : proc
    extern _WriteFile@20     : proc
    extern _ExitProcess@4    : proc

.const

message db 'Hello from Win32', 13, 10,
;           '������ �� Win32', 13, 10
messageLen = $ - message

.code

_main:
    ; hStdOut = GetstdHandle( STD_OUTPUT_HANDLE)
    push    -11
    call    _GetStdHandle@4
    mov     ebx, eax    

    ; Reserve space for DWORD bytes
    sub     esp, 4
    mov     ebx, esp

    ; WriteFile( hstdOut, message, length(message), &bytes, 0);
    push    0
    push    ebx
    push    messageLen
    push    offset message
    push    eax
    call    _WriteFile@20

    ; ExitProcess(0)
    push    0
    call    _ExitProcess@4

end _main