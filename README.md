# FurRo - Ragnarok Online Server Project

โปรเจกต์เซิร์ฟเวอร์ Ragnarok Online **FurRo** (Renewal Mode รองรับ Class 4 & Doram) โครงสร้างแบบ **Portable Zero-Setup** ขนาดรวมทั้งโฟลเดอร์เพียง **~520 MB** (บีบอัด Zip เหลือเพียง ~150 MB)

> ⚡ **เปิดด่วนใน 1 นาที (ไม่ชอบอ่านยาว):** ดูได้ที่ [QUICK_START.md](file:///c:/Users/Zethen/Downloads/FurRo/QUICK_START.md)  
> 📘 **คู่มือเรียนรู้ฉบับละเอียด (มีคำอธิบาย):** ดูได้ที่ [TUTORIAL.md](file:///c:/Users/Zethen/Downloads/FurRo/TUTORIAL.md)

---

## 📁 โครงสร้างโปรเจกต์
- [Database/](file:///c:/Users/Zethen/Downloads/FurRo/Database): **MariaDB 10.11 Portable** (ขนาด ~388 MB)
  - มีตารางฐานข้อมูล RO ครบ 100% พร้อมใช้งานทันที
  - [start_db.bat](file:///c:/Users/Zethen/Downloads/FurRo/Database/start_db.bat): เปิด MariaDB (รองรับ Dynamic Path ก๊อปไปไว้ Drive/เครื่องไหนก็เปิดได้ทันที)
  - [stop_db.bat](file:///c:/Users/Zethen/Downloads/FurRo/Database/stop_db.bat): ปิด MariaDB อย่างปลอดภัย
  - พอร์ต: `3306` | ผู้ใช้: `ragnarok` / รหัสผ่าน: `ragnarok` | ฐานข้อมูล: `ragnarok`
- [Server/](file:///c:/Users/Zethen/Downloads/FurRo/Server): โค้ดต้นฉบับ **rAthena Renewal** พร้อมใช้งาน
  - **โหมด:** Renewal (`#define RENEWAL` ใน [renewal.hpp](file:///c:/Users/Zethen/Downloads/FurRo/Server/src/config/renewal.hpp))
  - **PACKETVER:** `20211103` (ใน [packets.hpp](file:///c:/Users/Zethen/Downloads/FurRo/Server/src/config/packets.hpp))
  - [build_server.bat](file:///c:/Users/Zethen/Downloads/FurRo/Server/build_server.bat): สคริปต์คอมไพล์ rAthena (Release x64) คลิกเดียวจบ มีระบบค้นหา MSBuild อัตโนมัติ
  - [start_server.bat](file:///c:/Users/Zethen/Downloads/FurRo/Server/start_server.bat): สคริปต์รัน Login, Char, Map Server พร้อมกันตามลำดับ
  - [stop_server.bat](file:///c:/Users/Zethen/Downloads/FurRo/Server/stop_server.bat): สคริปต์ปิด Server ทั้งหมดในคลิกเดียว
  - **GitHub Actions:** [build_and_release_binaries.yml](file:///c:/Users/Zethen/Downloads/FurRo/Server/.github/workflows/build_and_release_binaries.yml) (สำหรับสร้าง `.exe` บน Cloud 0 MB)
- [Client/](file:///c:/Users/Zethen/Downloads/FurRo/Client): สำหรับใส่ตัวเกม Lite Client (เวอร์ชัน 2021-11-03)
- [install_build_tools.bat](file:///c:/Users/Zethen/Downloads/FurRo/install_build_tools.bat): สคริปต์ติดตั้ง VS Build Tools C++ อัตโนมัติ (สำหรับเครื่องที่ยังไม่มีคอมไพเลอร์)

---

## 🚀 ขั้นตอนการเปิดใช้งาน (ถ้าส่งไฟล์ Zip ให้คนอื่น)
1. **แตกไฟล์ Zip** ไว้ที่ไหนก็ได้ในคอมพิวเตอร์
2. เข้าโฟลเดอร์ `Database/` แล้วดับเบิลคลิก **`start_db.bat`** (เปิดฐานข้อมูล)
3. เข้าโฟลเดอร์ `Server/` แล้วดับเบิลคลิก **`build_server.bat`** (คอมไพล์โค้ดเป็นไฟล์ `.exe`)
   *(ถ้าเครื่องนั้นยังไม่มีคอมไพเลอร์ ให้รัน `install_build_tools.bat` ที่โฟลเดอร์หลักก่อน)*
4. ดับเบิลคลิก **`start_server.bat`** ในโฟลเดอร์ `Server/` เซิร์ฟเวอร์จะเปิดพร้อมเล่นทันที!
