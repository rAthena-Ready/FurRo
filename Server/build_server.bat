@echo off
title Build rAthena Server (Release x64)
cd /d "%~dp0"
echo ==============================================================
echo  Compiling rAthena Solution (Release x64 - Renewal Mode)
echo ==============================================================
echo.

:: Locate MSBuild via vswhere
set "MSBUILD="
for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
    set "MSBUILD=%%i"
)

if not defined MSBUILD (
    for /f "tokens=*" %%i in ('where msbuild.exe 2^>nul') do (
        set "MSBUILD=%%i"
    )
)

if not defined MSBUILD (
    echo [ERROR] MSBuild was not found!
    echo Please make sure you have run install_build_tools.bat in the root folder,
    echo or installed Visual Studio C++ build tools.
    echo.
    pause
    exit /b 1
)

echo Found MSBuild: "%MSBUILD%"
echo Starting build...
echo.

"%MSBUILD%" rAthena.sln /t:Build /p:Configuration=Release /p:Platform=x64

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==============================================================
    echo  SUCCESS: rAthena compiled successfully!
    echo  Executables are ready:
    echo   - login-server.exe
    echo   - char-server.exe
    echo   - map-server.exe
    echo   - web-server.exe
    echo ==============================================================
) else (
    echo.
    echo [ERROR] Compilation failed. Check the error messages above.
)
pause
