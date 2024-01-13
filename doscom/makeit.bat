@echo off
set MASM=C:\devtools\assembler\masm32
rem set MASM=C:\masm32
rem /c for compile only
%MASM%\bin\ml.exe /c /Cp Hello.asm && ^
%MASM%\bin\link16.exe /tiny Hello.obj, Hello.com, Hello.com.map, , ,
rem C:\masm32\bin\link16.exe /stack:256 Hello.obj, Hello.exe, Hello.exe.map, , ,
