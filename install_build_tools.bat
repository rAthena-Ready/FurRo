@echo off
title Install Visual Studio Build Tools (C++ CLI Only)
cd /d "%~dp0"

echo ====================================================================
echo  Installing Visual Studio Build Tools (C++ Compiler & MSBuild)
echo  Workload: Desktop development with C++ (CLI only, No IDE)
echo ====================================================================
echo.

if not exist "%~dp0vs_BuildTools.exe" (
    echo [INFO] Downloading vs_BuildTools installer (~4 MB)...
    curl.exe -L -o "%~dp0vs_BuildTools.exe" "https://aka.ms/vs/17/release/vs_BuildTools.exe"
)

echo Starting Visual Studio Installer...
echo (If Windows asks for Administrator permission, please click "Yes")
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
