import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:pj_vaccinepassport/firebase_options.dart';
import 'package:pj_vaccinepassport/model/Profile.dart';

class CreateAccount2 extends StatefulWidget {
  final Profile profile;

  const CreateAccount2({super.key, required this.profile});

  @override
  State<CreateAccount2> createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  List<String> genderOptions = ['Male', 'Female'];
  String? selectedGender;

  TextEditingController datectl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
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
                        backgroundColor:
                            Colors.transparent, // Make app bar transparent
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
                              'เพศ',
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
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          validator: (value) {
                            if (value == null) {
                              return 'โปรดระบุเพศ';
                            }
                            return null;
                          },
                          onChanged: (String? value) {
                            setState(() {
                              selectedGender = value;
                              widget.profile.Gender = value!;
                            });
                          },
                          items: genderOptions.map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            hintText: 'Female',
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
                        height: 60,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาระบุชื่อจริง"),
                          ]),
                          onSaved: (fname) {
                            widget.profile.Firstname = fname!;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Emerson',
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
                        height: 60,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาระบุนามสกุล"),
                          ]),
                          onSaved: (lname) {
                            widget.profile.Surname = lname!;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Korsgaard',
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
                        height: 60,
                        child: TextFormField(
                          controller: datectl,
                          onTap: () async {
                            DateTime? date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            datectl.text = date!.toIso8601String();
                            setState(() {
                              datectl.text =
                                  DateFormat('dd-MM-yyyy').format(date!);
                            });
                                                    },
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "กรุณาระบุ วัน/เดือน/ปีเกิด"),
                            // DateValidator('dd-MM-yyyy',
                            //     errorText:
                            //         "กรุณาใส่ วัน/เดือน/ปีเกิด ตามลำดับ"),
                          ]),
                          onSaved: (dob) {
                            widget.profile.DoB = dob!;
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month_rounded,
                              color: Color.fromARGB(255, 45, 71, 55),
                            ),
                            hintText: '01/02/1999',
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
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState?.save();
                            try {
                              print(
                                  "email = ${widget.profile.CitizenID} password = ${widget.profile.Password}, PhoneNO = ${widget.profile.Phonenumber}, Passport = ${widget.profile.PassportNumber}");
                              print(
                                  "gender = ${widget.profile.Gender} fname  = ${widget.profile.Firstname} lname = ${widget.profile.Surname} dob = ${widget.profile.DoB}");
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: widget.profile.Email,
                                      password: widget.profile
                                          .Password); // สร้าง authentication บน firebase
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .add({
                                'citizenid': widget.profile.CitizenID,
                                'passportNO': widget.profile.PassportNumber,
                                'phoneNO': widget.profile.Phonenumber,
                                'email': widget.profile.Email,
                                'gender': widget.profile.Gender,
                                'firstname': widget.profile.Firstname,
                                'surname': widget.profile.Surname,
                                'dob': widget.profile.DoB,
                              })
                                  // addUserDetails(
                                  //         widget.profile.CitizenID,
                                  //         widget.profile.PassportNumber,
                                  //         widget.profile.Phonenumber,
                                  //         widget.profile.Email,
                                  //         widget.profile.Gender,
                                  //         widget.profile.Firstname,
                                  //         widget.profile.Surname,
                                  //         widget.profile.DoB) // เพิ่มข้อมูลส่วนตัวเข้า users บน firebase
                                  .then((value) {
                                formkey.currentState?.reset();
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              });
                            } on FirebaseAuthException catch (e) {
                              late String message;
                              print(e.message);
                              if (e.code == 'email-already-in-use') {
                                message =
                                    "ตรวจพบอีเมลนี้ในระบบโปรดใช้อีเมลอื่น";
                              } else if (e.code == 'weak-password') {
                                message = "รหัสผ่านต้องมีความยาวขั้นต่ำ 6 ตัว";
                              }
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Center(
                                          child: Icon(
                                        Icons.assignment_late_outlined,
                                        size: 50,
                                      )),
                                      content: Text("แจ้งเตือน\n\n${message}"),
                                      actions: [
                                        IconButton(
                                          iconSize: 50,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.red[900],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          }
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
