@echo off

:start
cls
echo -add (adds password)
echo -get (gets password)
echo -list (gets a list of all passwords)

echo.
set /p cmd=">>> "

:: If command doesn't exist -> restarts | calls command
if not exist commands\%cmd%.bat (
    cls
    echo Command not found
    pause
    goto :start

)

call commands\%cmd%.bat
