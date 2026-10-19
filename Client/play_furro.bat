@echo off
title FurRo Ragnarok Online Launcher
cd /d "%~dp0"

if not exist "data.grf" (
    echo ====================================================================
    echo  [WARNING] File 'data.grf' not found in Client folder!
    echo.
    echo  Please copy 'data.grf' from your Ragnarok Online installation
    echo  (e.g., GGT RO Thailand, iRO, kRO, or any Renewal Client)
    echo  and place it directly in this 'Client' folder.
    echo ====================================================================
    pause
    exit /b 1
)

if exist "FurRo.exe" (
    echo Starting FurRo...
    start "" "FurRo.exe" -1rag1
) else if exist "2021-11-03_Ragexe.exe" (
    echo Starting 2021-11-03_Ragexe...
    start "" "2021-11-03_Ragexe.exe" -1rag1
) else if exist "Ragexe.exe" (
    echo Starting Ragexe...
    start "" "Ragexe.exe" -1rag1
) else (
    echo ====================================================================
    echo  [ERROR] Game executable not found (FurRo.exe / Ragexe.exe)!
    echo  Please place the patched 2021-11-03 client executable in this folder.
    echo ====================================================================
    pause
    exit /b 1
)
