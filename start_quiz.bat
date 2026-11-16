@echo off
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
    set "PYCMD=py -3"
    goto :found
)
where python >nul 2>nul
if %errorlevel%==0 (
    set "PYCMD=python"
    goto :found
)
where python3 >nul 2>nul
if %errorlevel%==0 (
    set "PYCMD=python3"
    goto :found
)

echo Could not find Python. Please install Python 3 from https://www.python.org/downloads/
echo and make sure to check "Add python.exe to PATH" during installation.
pause
exit /b 1

:found
start "AI Engineering Quiz Server" cmd /k %PYCMD% -m http.server 8765
timeout /t 2 /nobreak >nul
start "" http://127.0.0.1:8765
