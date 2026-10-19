@echo off
title Start FurRo Server
cd /d "%~dp0"

if not exist "login-server.exe" (
    echo ====================================================================
    echo  [ERROR] Server binaries not found!
    echo  Please compile rAthena first by double-clicking 'build_server.bat'.
    echo ====================================================================
    pause
    exit /b 1
)

:: Check if MariaDB is running
"%~dp0..\Database\mariadb\bin\mysqladmin.exe" -h 127.0.0.1 -u root -proot ping >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ====================================================================
    echo  [WARNING] MariaDB is NOT running!
    echo  Starting MariaDB Server automatically...
    echo ====================================================================
    start "MariaDB Database Server" /d "%~dp0..\Database" cmd /c "start_db.bat"
    echo Waiting for MariaDB to be ready...
    ping -n 4 127.0.0.1 >nul
)

echo ==============================================
echo  Starting FurRo Renewal Servers...
echo  (Windows will stay open so you can see logs)
echo ==============================================
echo.

echo [1/3] Starting Login Server...
start "FurRo - Login Server" cmd /k "login-server.exe"
ping -n 3 127.0.0.1 >nul

echo [2/3] Starting Character Server...
start "FurRo - Char Server" cmd /k "char-server.exe"
ping -n 3 127.0.0.1 >nul

echo [3/3] Starting Map Server...
start "FurRo - Map Server" cmd /k "map-server.exe"

echo.
echo ==============================================================
echo  All server windows have been launched!
echo  (Do NOT close the server windows while playing)
echo ==============================================================
