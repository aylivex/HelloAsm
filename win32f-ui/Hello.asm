format PE GUI 4.0 NX
entry start

section '.text' code readable executable

start:
    ; MessageBox(NULL, message, caption, MB_OK);
    push    0       ; MB_OK
    push    caption
    push    message
    push    0
    call    [MessageBox]

    ; ExitProcess(0)
    push    0
    call    [ExitProcess]


message db 'Hello World!', 0
caption db 'Hello fasm', 0


align 10h
; Import table
data import
    dd 0, 0, 0, RVA kernel_name, RVA kernel_table
    dd 0, 0, 0, RVA user_name,   RVA user_table
    dd 0, 0, 0, 0, 0

align 10h
kernel_table:
    ExitProcess     dd RVA  _ExitProcess
    dd 0

user_table:
    MessageBox      dd RVA  _MessageBoxA
    dd 0

kernel_name db 'kernel32.dll', 0

user_name   db 'user32.dll', 0

align 4
_ExitProcess    dw 0
                db 'ExitProcess', 0

align 4
_MessageBoxA    dw 0
                db 'MessageBoxA', 0
end data
