@echo off
set TASM=C:\tasm
set ASM=%TASM%\bin\tasm.exe
set LNK=%TASM%\bin\tlink.exe
%ASM% /w2 /z /zn Hello.asm && ^
%LNK% Hello.obj, Hello.exe, Hello.map, , ,
