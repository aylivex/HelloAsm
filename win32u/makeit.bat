@echo off
rem set PATH=C:\masm32\bin
rem /c for compile only
C:\masm32\bin\ml.exe /c /Cp /coff Hello.asm && ^
C:\masm32\bin\link.exe /map:Hello.map /subsystem:console ^
    /release ^
    Hello.obj C:\masm32\lib\kernel32.lib
