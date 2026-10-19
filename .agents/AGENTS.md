# FurRo - Ragnarok Online Server Setup & Guidelines

## 1. Project Overview & Current Configuration
- **Project Name:** FurRo (Ragnarok Online Private Server)
- **Server Core:** rAthena (Latest Renewal Mode)
- **Target Mode:** **Renewal** (Class 3 & Class 4, Doram summoners, modern formulas)
- **Packet Version (PACKETVER):** `20250716` (Configured in `Server/src/custom/defines_pre.hpp` and `packets.hpp`)
- **Total Project Size:** ~520 MB (Portable Zero-Setup, compresses to ~150 MB ZIP)
- **Directory Layout:**
  - `Server/`: Cloned rAthena repository (~116 MB via shallow clone `--depth 1`). Includes `build_server.bat`, `start_server.bat`, `stop_server.bat`.
  - `Database/`: Portable MariaDB 10.11 (~388 MB). Dynamic paths (100% path-independent). Includes `start_db.bat`, `stop_db.bat`, and pre-imported `ragnarok` database.
  - `Client/`: Full Client 2025-07-16 (WARPGATE / WARP0716, `data.grf`, and patched executable).
  - `install_build_tools.bat`: Automatic installer for C++ CLI Build Tools.
  - `.agents/`: AI agent rules, guidelines, and context.

---

## 2. Database Configuration (100% Portable)
- **Engine:** MariaDB 10.11.11 (Portable - Dynamic paths via `%~dp0`)
- **Port:** `3306` (127.0.0.1)
- **Main Database:** `ragnarok`
- **User:** `ragnarok` / **Password:** `ragnarok`
- **Root User:** `root` / **Password:** `root`
- **Pre-imported Tables:** `main.sql`, `logs.sql`, `web.sql`, and `roulette_default_data.sql`

---

## 3. Compilation & Run Pipeline
- **Step 1 (If no compiler):** Run `install_build_tools.bat` (installs C++ CLI compiler & MSBuild).
- **Step 2 (Start Database):** Run `Database/start_db.bat`.
- **Step 3 (Compile):** Run `Server/build_server.bat` (Generates Release x64 `.exe` binaries).
- **Step 4 (Launch Server):** Run `Server/start_server.bat` (Launches Login, Char, Map servers in order).
- **Step 5 (Stop Server):** Run `Server/stop_server.bat` (Terminates all server instances).
