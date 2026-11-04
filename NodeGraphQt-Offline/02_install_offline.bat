@echo off
setlocal
cd /d "%~dp0"
call 01_check_offline.bat
if errorlevel 1 exit /b 1
if not exist ".venv\Scripts\python.exe" (
    py -3.10 -m venv .venv
    if errorlevel 1 goto error
)
".venv\Scripts\python.exe" -m pip install --no-index --find-links="%~dp0wheelhouse" -r requirements.txt
if errorlevel 1 goto error
".venv\Scripts\python.exe" -m pip check
if errorlevel 1 goto error
echo Installation successful.
pause
exit /b 0
:error
echo Installation failed. Check wheelhouse dependencies.
pause
exit /b 1
