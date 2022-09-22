setlocal enableDelayedExpansion
set chars=0123456789abcdefghijklmnopqrstuvwxyz

cls
set /p key=What is the masterkey?: 
set /p app=What is the application name?: 
set /p pw=What is the password?: 


:: If application exist -> restarts
if exist passwords\%app%.txt (
    cls
    echo Application already exist
    pause
    call commands\main.bat
)


:: Encrypter, converts to numbers -> multiplies each number by key
for /L %%N in (10 1 36) do (
    for /F %%C in ("!chars:~%%N,1!") do (

        set /a num=%%N*%key%

        for /F %%F in ("!num!") do (
           set "pw=!pw:%%C=-%%F!" 
        )
    )
)


echo !pw!>passwords\%app%.txt
pause
call commands\main.bat