@echo on

if not exist "%LIBRARY_LIB%" mkdir "%LIBRARY_LIB%"
if not exist "%LIBRARY_BIN%" mkdir "%LIBRARY_BIN%"

xcopy /E /I /Q /Y "%SRC_DIR%\electron" "%LIBRARY_LIB%\electron"
if errorlevel 1 exit 1

(
  echo @echo off
  echo "%%~dp0..\lib\electron\electron.exe" %%*
) > "%LIBRARY_BIN%\electron.bat"
if errorlevel 1 exit 1
