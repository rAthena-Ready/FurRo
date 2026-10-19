@echo off
title MariaDB Database Server (Port 3306) - FurRo
cd /d "%~dp0"

if not exist "%~dp0mariadb\bin\mysqld.exe" (
    echo [INFO] MariaDB engine not found. Running automatic setup...
    call "%~dp0download_mariadb.bat"
)

:: Check if already running
"%~dp0mariadb\bin\mysqladmin.exe" -h 127.0.0.1 -u root -proot ping >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==============================================================
    echo  MariaDB is ALREADY running on port 3306!
    echo ==============================================================
    ping -n 3 127.0.0.1 >nul
    exit /b 0
)

echo ==============================================================
echo  MariaDB 10.11 Portable is RUNNING on port 3306!
echo  (Please MINIMIZE this window, do NOT close it while playing)
echo ==============================================================
echo.
"%~dp0mariadb\bin\mysqld.exe" --defaults-file="%~dp0my.ini" --datadir="%~dp0data" --plugin-dir="%~dp0mariadb\lib\plugin" --console
