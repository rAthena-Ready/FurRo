@echo off
title MariaDB Portable - FurRo
cd /d "%~dp0"

if not exist "%~dp0mariadb\bin\mysqld.exe" (
    echo [INFO] MariaDB engine not found. Running automatic setup...
    call "%~dp0download_mariadb.bat"
)
echo Starting MariaDB Server on port 3306...
start "MariaDB-Server" /B "%~dp0mariadb\bin\mysqld.exe" --defaults-file="%~dp0my.ini" --datadir="%~dp0data" --plugin-dir="%~dp0mariadb\lib\plugin"
ping -n 3 127.0.0.1 >nul
"%~dp0mariadb\bin\mysqladmin.exe" -h 127.0.0.1 -u root -proot ping >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==============================================
    echo  MariaDB is RUNNING successfully on port 3306!
    echo ==============================================
) else (
    echo.
    echo [ERROR] Failed to start MariaDB.
)
pause
