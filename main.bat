@echo off
setlocal enableDelayedExpansion
set chars=0123456789abcdefghijklmnopqrstuvwxyz

:start
cls
echo -add (adds password)
echo -get (gets password)
echo -list (gets a list of all passwords)

echo.
set /p cmd=">>> "

goto %cmd%


:::::::::::::::
:: Functions ::
:::::::::::::::


:: Checks if txt file exists
:valid_app
if not exist passwords\%app%.txt (
    cls
    echo Application doesn't exist
    pause
    goto :start

)
exit /b


:: Encrypter
:encrypter
for /L %%N in (10 1 36) do (
    for /F %%C in ("!chars:~%%N,1!") do (

        set /a num=%%N*%key%

        for /F %%F in ("!num!") do (
           set "pw=!pw:%%C=-%%F!" 
        )
    )
)
exit /b


:: Decrypter
:decrypter
for /L %%N in (10 1 36) do (
    for /F %%C in ("!chars:~%%N,1!") do (

        set /a num=%%N*%key%

        for /F %%F in ("!num!") do (
           set "pw=!pw:%%F=%%C!" 
        )
    )
)

for /F %%F in ("!pw!") do (
    set "pw=!pw:-=!"
)
exit /b


::::::::::::::
:: Commands ::
::::::::::::::


:: Add Command
:add
cls
set /p key=What is the masterkey?: 
set /p app=What is the application name?: 
set /p pw=What is the password?: 

call :encrypter

echo !pw!>passwords\%app%.txt
pause
goto start


:: Get Command
:get
cls
set /p key=What is the masterkey?: 
set /p app=What is the application name?: 
set /p pw=< passwords\%app%.txt

call :valid_app

call :decrypter

echo !pw!
pause
goto start


:: List Command
:list
cls
for %%f in (passwords\*.*) do echo %%~nf
echo.
pause
goto start
