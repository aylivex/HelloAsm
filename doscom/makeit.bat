@echo off
rem set PATH=C:\masm32\bin
rem /c for compile only
C:\masm32\bin\ml.exe /c /Cp Hello.asm && ^
C:\masm32\bin\link16.exe /tiny Hello.obj, Hello.com, Hello.com.map, , ,
rem C:\masm32\bin\link16.exe /stack:256 Hello.obj, Hello.exe, Hello.exe.map, , ,
