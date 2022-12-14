setlocal enableDelayedExpansion
set chars=0123456789abcdefghijklmnopqrstuvwxyz

cls
set /p key=What is the masterkey?: 
set /p app=What is the application name?: 
set /p pw=< passwords\%app%.txt


:: If application doesn't exist -> restarts
if not exist passwords\%app%.txt (
    cls
    echo Application doesn't exist
    pause
    call commands\main.bat

)

:: Decrypter, divides each number by key -> converts to letters
for /L %%N in (10 1 36) do (
    for /F %%C in ("!chars:~%%N,1!") do (

        set /a num=%%N*%key%

        for /F %%F in ("!num!") do (
           set "pw=!pw:%%F=%%C!" 
        )
    )
)

:: Removes -
for /F %%F in ("!pw!") do (
    set "pw=!pw:-=!"
)

echo !pw!
pause
call commands\main.bat