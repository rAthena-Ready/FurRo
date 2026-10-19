@echo off
title Download and Setup MariaDB Portable - FurRo
cd /d "%~dp0"

if exist "%~dp0data" (
    echo ==============================================================
    echo  [INFO] ฐานข้อมูล MariaDB และตาราง RO มีอยู่แล้วในเครื่อง!
    echo  คุณสามารถดับเบิลคลิกที่ 'start_db.bat' เพื่อเปิดใช้งานได้เลยครับ
    echo ==============================================================
    pause
    exit /b 0
)
echo ==============================================================
echo  Downloading MariaDB 10.11 Portable (~86 MB)...
echo ==============================================================
echo.
curl.exe -L -o "%~dp0mariadb.zip" "https://archive.mariadb.org/mariadb-10.11.11/winx64-packages/mariadb-10.11.11-winx64.zip"
if not exist "%~dp0mariadb.zip" (
    echo [ERROR] Failed to download MariaDB.
    pause
    exit /b 1
)

echo Extracting MariaDB archive...
tar.exe -xf "%~dp0mariadb.zip"
del "%~dp0mariadb.zip"
if exist "%~dp0mariadb-10.11.11-winx64" (
    ren "%~dp0mariadb-10.11.11-winx64" "mariadb"
)

echo Initializing Database Data Directory...
"%~dp0mariadb\bin\mysql_install_db.exe" --datadir="%~dp0data" --password="root"

echo Starting temporary MariaDB to import rAthena tables...
start "MariaDB-Temp" /B "%~dp0mariadb\bin\mysqld.exe" --defaults-file="%~dp0my.ini" --datadir="%~dp0data" --plugin-dir="%~dp0mariadb\lib\plugin"
ping -n 4 127.0.0.1 >nul

"%~dp0mariadb\bin\mysql.exe" -h 127.0.0.1 -u root -proot -e "CREATE DATABASE IF NOT EXISTS ragnarok DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER IF NOT EXISTS 'ragnarok'@'localhost' IDENTIFIED BY 'ragnarok'; CREATE USER IF NOT EXISTS 'ragnarok'@'127.0.0.1' IDENTIFIED BY 'ragnarok'; GRANT ALL PRIVILEGES ON ragnarok.* TO 'ragnarok'@'localhost'; GRANT ALL PRIVILEGES ON ragnarok.* TO 'ragnarok'@'127.0.0.1'; FLUSH PRIVILEGES;"

type "%~dp0..\Server\sql-files\main.sql" | "%~dp0mariadb\bin\mysql.exe" -h 127.0.0.1 -u ragnarok -pragnarok ragnarok
type "%~dp0..\Server\sql-files\logs.sql" | "%~dp0mariadb\bin\mysql.exe" -h 127.0.0.1 -u ragnarok -pragnarok ragnarok
type "%~dp0..\Server\sql-files\web.sql" | "%~dp0mariadb\bin\mysql.exe" -h 127.0.0.1 -u ragnarok -pragnarok ragnarok
type "%~dp0..\Server\sql-files\roulette_default_data.sql" | "%~dp0mariadb\bin\mysql.exe" -h 127.0.0.1 -u ragnarok -pragnarok ragnarok

"%~dp0mariadb\bin\mysqladmin.exe" -h 127.0.0.1 -u root -proot shutdown

echo.
echo ==============================================================
echo  MariaDB Portable setup completed successfully!
echo ==============================================================
pause
