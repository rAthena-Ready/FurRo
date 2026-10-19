@echo off
title FurRo Online Launcher (2025-07-16 Warpgate)
cd /d "%~dp0"

if exist "FurRO\FurRo.exe" (
    cd FurRO
    start "" "FurRo.exe" -1rag1
) else if exist "FurRO\2025-07-16_Ragexe_175220998_clientinfo.exe" (
    cd FurRO
    start "" "2025-07-16_Ragexe_175220998_clientinfo.exe" -1rag1
) else (
    echo ==============================================================
    echo  [ERROR] Game executable not found!
    echo ==============================================================
    pause
    exit /b 1
)
