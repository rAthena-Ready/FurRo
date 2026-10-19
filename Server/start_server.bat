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

echo ==============================================
echo  Starting FurRo Renewal Servers...
echo ==============================================
echo.
echo [1/3] Starting Login Server...
start "FurRo - Login Server" login-server.exe
ping -n 2 127.0.0.1 >nul

echo [2/3] Starting Character Server...
start "FurRo - Char Server" char-server.exe
ping -n 2 127.0.0.1 >nul

echo [3/3] Starting Map Server...
start "FurRo - Map Server" map-server.exe

echo.
echo All server components have been launched!
