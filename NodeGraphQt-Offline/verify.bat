@echo off
setlocal
cd /d "%~dp0"
set QT_API=pyqt5
".venv\Scripts\python.exe" -c "from PyQt5.QtWidgets import QApplication; from NodeGraphQt import NodeGraph; app=QApplication([]); graph=NodeGraph(); print('NodeGraphQt GUI initialized successfully')"
if errorlevel 1 (
  echo Verification failed.
  pause
  exit /b 1
)
pause
