@echo off
ml64.exe /c /Cp Hello.asm && ^
link.exe /subsystem:console,6.0 ^
    /map:Hello.map ^
    /release /version:1.0 ^
    /nxcompat ^
    /entry:main ^
    Hello.obj kernel32.lib
