import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pj_vaccinepassport/create_account/create-account_2.dart';

class CreateAccount1 extends StatelessWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 1],
                    colors: [
                      Color.fromARGB(255, 45, 71, 55),
                      Color.fromARGB(255, 124, 150, 112),
                    ],
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent, // Make app bar transparent
                elevation: 0, // Remove app bar shadow
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Text(
                    "สร้างบัญชี",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text(
                    'เลขประจำตัวประชาชน',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 45, 71, 55),
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 330,
              height: 45,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // for below version 2 use this
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 13,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '1 2345 67890 12 3',
                  fillColor: Colors.grey[300],
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text(
                    'หมายเลขหนังสือเดินทาง',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 45, 71, 55),
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 330,
              height: 45,
              child: TextFormField(
                maxLength: 8,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'AA123456',
                  fillColor: Colors.grey[300],
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text(
                    'เบอร์มือถือ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 45, 71, 55),
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 330,
              height: 45,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // for below version 2 use this
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '099-999-9999',
                  fillColor: Colors.grey[300],
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.all(16),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccount2()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF76A186),
              ),
              child: Text(
                'ถัดไป',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ));
  }
}
