@echo off

:start
cls
echo -add (adds password)
echo -get (gets password)
echo -list (gets a list of all passwords)

echo.
set /p cmd=">>> "

if not exist commands\%cmd%.bat (
    cls
    echo Command not found
    pause
    goto :start

)

if exist commands\%cmd%.bat do (
    call commands\%cmd%.bat
)
