@echo off
setlocal enableDelayedExpansion

set /p key=Key: 
set /p text=Text: 
set chars=0123456789abcdefghijklmnopqrstuvwxyz

for /L %%N in (10 1 36) do (
    for /F %%C in ("!chars:~%%N,1!") do (

        set /a num=%%N*%key%

        for /F %%F in ("!num!") do (
           set "text=!text:%%C=-%%F!" 
        )
    )
)

echo !text!

pause