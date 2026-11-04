@echo off
setlocal
cd /d "%~dp0"
echo Downloading all NodeGraphQt and PyQt5 dependencies for Windows x64 Python 3.10...
py -3.10 -c "import sys,struct; assert sys.version_info[:2]==(3,10) and struct.calcsize('P')==8, 'Python 3.10 x64 required'"
if errorlevel 1 goto error
if not exist wheelhouse mkdir wheelhouse
if not exist source mkdir source
py -3.10 -m pip download --only-binary=:all: --dest wheelhouse -r requirements.txt
if errorlevel 1 goto error
py -3.10 -m pip download --no-deps --no-binary=:all: --dest source NodeGraphQt==0.6.44
if errorlevel 1 goto error
py -3.10 scripts\check_wheels.py
if errorlevel 1 goto error
py -3.10 -c "from pathlib import Path; import zipfile; root=Path('.').resolve(); output=root/'NodeGraphQt-Offline-win_amd64-py310.zip'; z=zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED); [z.write(p,p.relative_to(root)) for folder in ('wheelhouse','source','scripts') for p in (root/folder).rglob('*') if p.is_file()]; [z.write(root/n,n) for n in ('README.md','requirements.txt','01_check_offline.bat','02_install_offline.bat','03_verify.bat')]; z.close(); print('CREATED',output)"
if errorlevel 1 goto error
echo COMPLETE. Copy the ZIP to the offline computer.
pause
exit /b 0
:error
echo FAILED. Check Python, network, proxy, or unavailable dependency.
pause
exit /b 1
