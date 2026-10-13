@echo off
setlocal
cd /d "%~dp0"
title CampusForum - One Click Database Setup
echo.
echo ===========================================
echo    CAMPUSFORUM DATABASE SETUP
 echo ===========================================
echo.
echo Finding a local SQL Server and running the setup...
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0RUN_DATABASE.ps1"
set "RESULT=%ERRORLEVEL%"
echo.
if "%RESULT%"=="0" (
    echo Setup finished successfully.
) else (
    echo Setup was NOT completed. Read the error above.
)
echo.
pause
exit /b %RESULT%
