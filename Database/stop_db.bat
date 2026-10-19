@echo off
title Stop MariaDB Portable - FurRo
cd /d "%~dp0"
echo Stopping MariaDB Server...
"%~dp0mariadb\bin\mysqladmin.exe" -h 127.0.0.1 -u root -proot shutdown
echo.
echo MariaDB has been stopped safely.
pause
