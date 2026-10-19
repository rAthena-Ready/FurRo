@echo off
:: Check for Admin permissions
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ==========================================================
    echo  Requesting Administrator Privileges...
    echo  (Please click 'Yes' in the Windows UAC confirmation dialog)
    echo ==========================================================
    powershell -Command "Start-Process cmd -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

title Install Visual Studio Build Tools (C++ CLI Only)
cd /d "%~dp0"
echo ====================================================================
echo  Installing Visual Studio Build Tools (C++ Compiler & MSBuild)
echo  Workload: Desktop development with C++ (CLI only, No IDE)
echo ====================================================================
echo.
echo Installing... You will see the Visual Studio progress bar on your screen.
echo This will take a few minutes depending on your internet connection.
echo.
"%~dp0vs_BuildTools.exe" --passive --norestart --nocache --add Microsoft.VisualStudio.Workload.VCTools;includeRecommended
echo.
if %ERRORLEVEL% EQU 0 (
    echo ==========================================================
    echo  SUCCESS: Visual Studio Build Tools installed successfully!
    echo  You can now compile rAthena.sln with msbuild.
    echo ==========================================================
) else (
    echo Installer completed with exit code: %ERRORLEVEL%
)
pause
