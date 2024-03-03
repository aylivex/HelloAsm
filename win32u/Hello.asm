; https://stackoverflow.com/q/1023593/572834
; https://stackoverflow.com/a/1029093/572834

.386
.model flat

    extern _GetStdHandle@4 : proc
    extern _WriteFile@20   : proc
    extern _WriteConsoleW@20 : proc
    extern _ExitProcess@4  : proc

.const

        ; 'Hello from Win32'
message dw 'H', 'e', 'l', 'l', 'o',
           ' ', 'f', 'r', 'o', 'm',
           ' ', 'W', 'i', 'n', '3', '2',
            13,  10,
           041Fh, 0440h, 0438h, 0432h, ; '������ �� Win32'
           0435h, 0442h, 0020h, 0438h,
           0437h, 0020h, 0057h, 0069h,
           006Eh, 0033h, 0032h,
              13,    10
messageLen = ($ - message) / 2

.code

_main:
    ; hStdOut = GetstdHandle( STD_OUTPUT_HANDLE)
    push    -11
    call    _GetStdHandle@4

    ; Reserve space for DWORD bytes
    sub     esp, 4
    mov     ebx, esp

    ; WriteFile( hstdOut, message, length(message), &bytes, 0);
    push    0
    push    ebx
    push    messageLen
    push    offset message
    push    eax
    ;call    _WriteFile@20
    call    _WriteConsoleW@20

    ; ExitProcess(0)
    push    0
    call    _ExitProcess@4

end _main