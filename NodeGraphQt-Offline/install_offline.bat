@echo off
setlocal
cd /d "%~dp0"
py -3.10 -m venv .venv
if errorlevel 1 goto error
".venv\Scripts\python.exe" -m pip install --no-index --find-links="%~dp0wheelhouse" -r requirements.txt
if errorlevel 1 goto error
".venv\Scripts\python.exe" -m pip check
if errorlevel 1 goto error
echo Installation completed.
pause
exit /b 0
:error
echo Installation failed.
pause
exit /b 1
