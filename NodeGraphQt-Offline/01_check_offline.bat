@echo off
setlocal
cd /d "%~dp0"
py -3.10 -c "import sys,struct; assert sys.version_info[:2]==(3,10) and struct.calcsize('P')==8, 'Python 3.10 x64 required'"
if errorlevel 1 goto error
py -3.10 scripts\check_wheels.py
if errorlevel 1 goto error
echo Offline wheel files found. Proceed to 02_install_offline.bat
pause
exit /b 0
:error
echo PRECHECK FAILED. No online download will be attempted.
pause
exit /b 1
