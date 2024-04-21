# DST66-1_ITDS283_MobileApplication

This Github Repository belongs to Project Vaccine Passport, created by group 1 section 1 in the course ITDS283 Mobile Application Development.

Prepared by:

Thanawich Juengkijthanawat  
Student ID: 6587017

Jittakan Damrongtrakoonwat  
Student ID: 6587051

Testing account => email:a@gmail.com  password:123456

การ Set up
1. เมื่อ Clone Repository แล้วให้ทำการเปลี่ยน Directory ไปที่ pj_vaccinepassport ผ่านคำสั่งบน Terminal:cd /pj_vaccinepassport
2. ใน Terminal เมื่ออยู่ใน Path /pj_vaccinepassport แล้วให้ทำการใช้คำสั่งบน Terminal:flutter pub get เพื่อดาวน์โหลด package นั้นมายังโปรเจ็คของเรา
3. ในส่วนของ Code จะใน Folder:lib
4. รายละเอียด Path
  - ใน Folder:common_pages จะประกอบไปด้วย home-page.dart เป็นโค๊ดสำหรับใช้รันหน้า Homepage, login-page.dart  เป็นโค๊ดสำหรับใช้รันหน้า Login page และ qr-page.dart เป็นโค๊ดสำหรับใช้รันหน้า QR Page ที่จำแสดงข้อมูลที่เราสมัครผ่านการลงทะเบียน ใน Create-account page 1 และ Create-account page 2
  - ใน Folder:create_account จะประกอบด้วย create-account_1.dart และ create-account_2.dart โดยในแต่ละหน้าจะให้ผู้ใช้ทำการลงทะเบียน
  - ใน Folder:feature_page จะประกอบไปด้วย Folder คือ antibody, calendar, map และ vaccine_history โดยข้างในจะประกอบไปด้วย antibody.dart, calendar.dart, healthlocation.dart และ vaccine_history.dart
  - ในไฟล์ antibody.dart เป็นโค๊ดสำหรับใช้รันหน้า Antibody ที่จะแสดงประวัติการตรวจ Antibody ในร่างกาย, calendar.dart เป็นโค๊ดสำหรับใช้รันหน้า Calendar โดยจะแสดงนัดหมายครั้งถัดไป, healthlocation.dart เป็นโค๊ดสำหรับใช้รันหน้า Health Location โดยจะแสดงตำแหน่งปัจจุบันของเราและสถานพยาบาลที่เข้าร่วมที่ใกล้ที่สุด และ vaccine_history.dart เป็นโค๊ดสำหรับใช้รันหน้า vaccine_history โดยจะแสดงประวัติการฉีดวัคซีนของผู้ใช้ 
  - ใน Folder: Model จะทำการเก็บ event.dart เป็น Class สำหรับเก็บข้อมูลหน้า calendar.dart และ profile.dart เป็น Class สำหรับเก็บข้อมูลผู้ใช้
5. สามารถรันแอพพลิเคชันได้ผ่าน main.dart โดยจะทำการรันหน้า Login Page
6. การทดสอบการใช้งาน
  - การใช้งาน สามารถสร้างบัญชีใหม่ที่แถบ ยังไม่มีบัญชี? ที่แถบด้านล่างของหน้า Login Page แต่เมื่อสมัครบัญชีผู้ใช้ใหม่จะยังไม่มีข้อมูลบนหน้า Antibody, Vaccine_history และ Calendar
  - สามารถลองผ่านบัญชีผู้ใช้ที่มีข้อมูล Login เพื่อดู UI กรณีมีข้อมูลต่าง ๆ โดย email:a@gmail.com,  password:123456
