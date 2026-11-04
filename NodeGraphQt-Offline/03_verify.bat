@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
 echo Virtual environment not found. Run 02_install_offline.bat first.
 pause
 exit /b 1
)
set QT_API=pyqt5
".venv\Scripts\python.exe" -c "from PyQt5.QtWidgets import QApplication; from NodeGraphQt import NodeGraph; app=QApplication([]); graph=NodeGraph(); print('GUI initialization OK')"
if errorlevel 1 (
 echo GUI verification FAILED.
 pause
 exit /b 1
)
pause
