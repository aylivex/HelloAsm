@echo off
set MASM=C:\devtools\assembler\masm32
rem set MASM=C:\masm32
rem /c for compile only
rem     /stub:..\dos\Hello.exe ^
%MASM%\bin\ml.exe /c /Cp /coff Hello.asm && ^
%MASM%\bin\link.exe /subsystem:console,4.0 ^
    /map:Hello.map ^
    Hello.obj %MASM%\lib\kernel32.lib
