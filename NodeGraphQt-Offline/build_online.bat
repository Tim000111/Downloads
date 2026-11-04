@echo off
setlocal
cd /d "%~dp0"
py -3.10 -c "import sys,struct; assert sys.version_info[:2]==(3,10) and struct.calcsize('P')==8, 'Python 3.10 x64 required'"
if errorlevel 1 exit /b 1
py -3.10 build_bundle.py
if errorlevel 1 exit /b 1
echo Bundle generated successfully.
pause
