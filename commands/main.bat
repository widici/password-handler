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

if %cmd% NEQ add (
    if %cmd% NEQ get (
        if %cmd% NEQ list (
            echo.
            echo command %cmd% not found!
            pause
            goto start
        )
    )
)

call commands\%cmd%.bat