@echo off
:setup
MODE 60,20
if not exist chat.txt (
break> chat.txt
)
if not exist .\uploads (
mkdir uploads
)
:setup2
setlocal enabledelayedexpansion
set /p "username=Enter Username: "
echo ^^^> !username! has entered the chat 1>>chat.txt
start cmd /C chatview.bat
cls
:loop
set /p "message=Enter Message: "
if "!message!"=="/upload" (
set /p "filetoupload=Enter path to file: "
FOR /F "usebackq" %%A IN ('!filetoupload!') DO set filesize=%%~zA
xcopy !filetoupload! .\uploads
echo ^^^> !username! uploaded a file [!filesize! bytes] 1>>chat.txt
goto loop
)
if "!message!"=="/exit" (
echo ^^^> !username! has left the chat 1>>chat.txt
exit
)
SET timewithoutseconds=%TIME:~0,5%
echo !username! (!timewithoutseconds!): !message! 1>>chat.txt
if "!message!"=="/clear" (
break> chat.txt
echo ^> Chat cleared 1>>chat.txt
)
cls
goto loop