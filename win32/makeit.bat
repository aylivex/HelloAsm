@echo off
set MASM=C:\devtools\assembler\masm32
rem set MASM=C:\masm32
rem /c for compile only
%MASM%\bin\ml.exe /c /Cp /coff Hello.asm && ^
%MASM%\bin\link.exe /subsystem:console,4.0 ^
    /map:Hello.map ^
    /stub:..\dos\Hello.exe ^
    Hello.obj %MASM%\lib\kernel32.lib
