@echo off
ml64.exe /c /Cp /Zi Hello.asm && ^
link.exe /subsystem:windows,6.0 ^
    /map:Hello.map ^
    /debug /version:1.0 ^
    /nxcompat ^
    /entry:main ^
    Hello.obj kernel32.lib user32.lib
