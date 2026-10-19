@echo off
title Install Visual Studio Build Tools (C++ CLI Only)
cd /d "%~dp0"

echo ====================================================================
echo  Installing Visual Studio Build Tools (C++ Compiler and MSBuild)
echo  Workload: Desktop development with C++ (CLI only, No IDE)
echo ====================================================================
echo.

if exist "%~dp0vs_BuildTools.exe" goto RUN_INSTALLER
echo [INFO] Downloading vs_BuildTools installer...
curl.exe -L -o "%~dp0vs_BuildTools.exe" "https://aka.ms/vs/17/release/vs_BuildTools.exe"

:RUN_INSTALLER
echo Starting Visual Studio Installer...
echo Please click Yes if Windows asks for Administrator permission.
echo.

"%~dp0vs_BuildTools.exe" --passive --norestart --nocache --add Microsoft.VisualStudio.Workload.VCTools;includeRecommended

echo.
if %ERRORLEVEL% EQU 0 (
    echo ==========================================================
    echo  SUCCESS: Visual Studio Build Tools installed successfully!
    echo  You can now compile rAthena.sln with build_server.bat.
    echo ==========================================================
) else (
    echo Installer completed with exit code: %ERRORLEVEL%
)
pause
