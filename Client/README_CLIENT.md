# FurRo - Client Setup Guide (คู่มือติดตั้งตัวเกม Client)

โฟลเดอร์นี้ (`Client/`) คือที่สำหรับรันตัวเกม Ragnarok Online เชื่อมต่อกับเซิร์ฟเวอร์ FurRo (Renewal PACKETVER `20211103`)

---

## 1. สิ่งที่ระบบจัดเตรียมไว้ให้เรียบร้อยแล้ว (Ready):
- [x] **`Client/System/clientinfo.xml`**: ตั้งค่าเชื่อมต่อไปยัง `127.0.0.1:6900` สำหรับ FurRo
- [x] **`Client/DATA.INI`**: ชี้ไฟล์ asset ไปที่ `data.grf`
- [x] **`Client/data/`**: สคริปต์แปลภาษาอังกฤษ (ROenglishRE Renewal), Textures, และ UI ครบถ้วน
- [x] **`Client/System/`**: ไฟล์ itemInfo.lua, Navi_Data, Achievements และระบบ Renewal ล่าสุด
- [x] **`Client/cps.dll`**: ไลบรารีถอดรหัส packet client
- [x] **`Client/play_furro.bat`**: ตัวเปิดเกมอัตโนมัติ

---

## 2. สิ่งที่ต้องดาวน์โหลดเพิ่มเติม (มีเพียง 2 อย่าง):

### ส่วนที่ 1: ไฟล์ Asset หลัก (`data.grf`) (~1.5 - 2.5 GB)
คุณสามารถเลือกนำ `data.grf` มาใส่ได้จาก 2 ทาง:
- **วิธีที่ 1 (เร็วที่สุดในไทย):** ดาวน์โหลดตัวเกม Ragnarok Online Official จากเว็บ [Gravity Game Tech (RO GGT Thailand)](https://ro.gnjoy.in.th/) เมนูดาวน์โหลด ติดตั้งเสร็จแล้ว ให้คัดลอกไฟล์ `data.grf` มาวางไว้ในโฟลเดอร์ `Client/` นี้
- **วิธีที่ 2 (Lite Client):** โหลดตัว `data.grf` หรือ kRO Lite Client จากชุมชน rAthena / Hercules

### ส่วนที่ 2: ตัวรันเกม (`2021-11-03_Ragexe.exe`) & โปรแกรม Patch (NEMO / WARP)
- **เว็บ Patch ออนไลน์ (ง่ายที่สุด ไม่ต้องโหลดโปรแกรม):**
  - ลิงก์: [http://nemo.herc.ws/](http://nemo.herc.ws/)
- **โปรแกรม Patch แบบออฟไลน์ (WARP / NEMO):**
  - WARP: [https://github.com/Neo-Mind/WARP/releases](https://github.com/Neo-Mind/WARP/releases)
  - NEMO: [https://github.com/Neo-Mind/NEMO/releases](https://github.com/Neo-Mind/NEMO/releases)

---

## 3. รายการ Patches (Diffs) ที่แนะนำให้ติ๊กเลือกใน NEMO / WARP:
เมื่อโหลดตัว clean `2021-11-03_Ragexe` มาแล้ว ให้เปิดใน NEMO หรือ WARP แล้วติ๊กเลือกตามนี้:
1. `Read Data Folder First` *(สำคัญมาก: เพื่อให้อ่านไฟล์แปลไทย/อังกฤษในโฟลเดอร์ data ก่อน)*
2. `Disable 1rag1 & 1sak1` *(สำคัญ: เพื่อให้เปิดเกมได้โดยตรงไม่ต้องใส่ parameter)*
3. `Disable Ragexe Filename Check` *(สำคัญ: สามารถเปลี่ยนชื่อไฟล์เป็น FurRo.exe ได้)*
4. `Read clientinfo.xml` *(หรือ Load clientinfo.xml instead of sclientinfo.xml)*
5. `Load Custom Lua File instead of itemInfo.lub` *(ให้อ่าน System/itemInfo.lua)*
6. `Enable Multiple GRFs` *(อ่านไฟล์ DATA.INI)*
7. `Restore Custom Window Title` -> ตั้งชื่อหน้าต่างเป็น `FurRo Online`
8. `Remove Hardcoded Address/Port` *(ให้อ่าน IP และพอร์ตจาก clientinfo.xml)*
9. `Skip Packet Header Encryption`
10. `Ignore Missing Palette Error`
11. `Increase Zoom Out 75%` *(ซูมแผนที่ออกได้กว้างขึ้น)*
12. `Fix Camera Angles`
13. `Always read msgstringtable.txt`
14. `Enable /who /who2 /w Command`

เมื่อกด **Apply Patches** คุณจะได้ไฟล์ `.exe` ให้นำมาเปลี่ยนชื่อเป็น `FurRo.exe` (หรือ `Ragexe.exe`) แล้ววางในโฟลเดอร์ `Client/` นี้

---

## 4. เริ่มเล่นเกม:
1. ดับเบิ้ลคลิก `Database/start_db.bat`
2. ดับเบิ้ลคลิก `Server/start_server.bat`
3. ดับเบิ้ลคลิก `Client/play_furro.bat` เพื่อเข้าเล่นได้ทันที!
