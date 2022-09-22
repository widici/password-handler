cls

:: For file in passwords -> echos file name
for %%f in (passwords\*.*) do echo %%~nf
echo.

pause
call commands\main.bat
