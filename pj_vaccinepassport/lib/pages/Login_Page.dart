import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7C9670), Color(0xB2AFAD8B), Color(0xFFEEE6DE)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vaccine',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Passport',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'เลขประจำตัวประชาชน หรือ เบอร์มือถือ',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF76A186),
                ),
                child: Text('เข้าสู่ระบบ'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text(
                  'สร้างบัญชีใหม่',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  'ลืมรหัสผ่าน?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
