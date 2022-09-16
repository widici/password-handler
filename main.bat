@echo off

:start
cls
echo -set (sets password)
echo -get (gets password)
echo -list (gets a list of all passwords)
echo.
set /p cmd=">>> "
goto %cmd%

:set
cls
set /p loc=What is the applictaion? 
set /p pw=What is the password? 
echo %pw%>passwords\%loc%.txt
pause
goto start

:get
cls
set /p loc=What applictaion do you want to get? 
type passwords\%loc%.txt
pause
goto start

:list
cls
for %%f in (passwords\*.*) do (
    echo %%~nf
    echo passwords\%%~nf.txt
    echo "passwords\example.txt"
)
echo.
pause
goto start