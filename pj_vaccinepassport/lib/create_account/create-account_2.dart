import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pj_vaccinepassport/model/Profile.dart';

class CreateAccount2 extends StatefulWidget {
  final Profile profile;

  const CreateAccount2({super.key, required this.profile});



  @override
  State<CreateAccount2> createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: Form(
            key: formkey,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text(
                      'คำนำหน้า',
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
                  onSaved: (title) {
                    widget.profile.Title = title!;
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 25,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'นาย',
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
                      'ชื่อ',
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
                  onSaved: (fname) {
                    widget.profile.Firstname = fname!;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'เอเมอร์สัน',
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
                      'นามสกุล',
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
                  onSaved: (lname) {
                    widget.profile.Surname = lname!;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'คอร์สการ์ด',
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
                      'วันเดือนปีเกิด',
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
                  onSaved: (dob) {
                    widget.profile.DoB = dob!;
                  },
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: Color.fromARGB(255, 45, 71, 55),
                    ),
                    hintText: '1/2/1999',
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
                  formkey.currentState?.save();
                  print(
                      "email = ${widget.profile.CitizenID} password = ${widget.profile.Password}, PhoneNO = ${widget.profile.Phonenumber}, Passport = ${widget.profile.PassportNumber}");
                  print(
                      "title = ${widget.profile.Title} fname  = ${widget.profile.Firstname} lname = ${widget.profile.Surname} dob = ${widget.profile.DoB}");
                  formkey.currentState?.reset();
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
          ),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2024));
    if (pickeddate != null) {
      setState(() {
        _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
      });
    }
  }
}
