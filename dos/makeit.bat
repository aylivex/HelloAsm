@echo off
rem set PATH=C:\masm32\bin
rem /c for compile only
C:\masm32\bin\ml.exe /c /Cp Hello.asm && ^
C:\masm32\bin\link16.exe /knoweas Hello.obj, Hello.exe, Hello.map, , ,
