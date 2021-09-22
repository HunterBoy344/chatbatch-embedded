@echo off
:setup
MODE 60,20
:loop
cls
type chat.txt
timeout 1 >nul
goto loop
