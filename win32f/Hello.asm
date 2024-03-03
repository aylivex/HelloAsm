format PE Console 4.0 NX
entry start

section '.text' code import readable executable

; Import table
  dd 0,0,0,RVA kernel_name,RVA kernel_table
  dd 0,0,0,0,0

kernel_table:
    GetStdHandle    dd RVA _GetStdHandle
    WriteFile       dd RVA _WriteFile
    ExitProcess     dd RVA _ExitProcess
    dd 0

kernel_name db 'kernel32.dll', 0

_GetStdHandle   dw 0
                db 'GetStdHandle', 0
_WriteFile      dw 0
                db 'WriteFile', 0
_ExitProcess    dw 0
                db 'ExitProcess', 0

align 10h
start:
    ; hStdOut = GetstdHandle(STD_OUTPUT_HANDLE)
    push    -11
    call    [GetStdHandle]

    ; Reserve space for DWORD bytes
    sub     esp, 4
    mov     ebx, esp

    ; WriteFile(hStdOut, message, length(message), &bytes, 0);
    push    0
    push    ebx
    push    messageLen
    push    message
    push    eax
    call    [WriteFile]

    ; ExitProcess(0)
    push    0
    call    [ExitProcess]


message db 'Hello World!', 13, 10
messageLen = $ - message


;section '.reloc' fixups data readable discardable	; needed for Win32s
