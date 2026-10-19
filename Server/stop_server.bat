@echo off
title Stop FurRo Server
echo Stopping all FurRo server processes...
taskkill /f /im map-server.exe 2>nul
taskkill /f /im char-server.exe 2>nul
taskkill /f /im login-server.exe 2>nul
taskkill /f /im web-server.exe 2>nul
echo.
echo All server processes stopped.
pause
