@echo off
set MASM=C:\devtools\assembler\masm32
rem set PATH=C:\masm32\bin
rem /c for compile only
%MASM%\bin\ml.exe /c /Cp /coff Hello.asm && ^
%MASM%\bin\link.exe /map:Hello.map /subsystem:console ^
    /release ^
    Hello.obj %MASM%\lib\kernel32.lib
