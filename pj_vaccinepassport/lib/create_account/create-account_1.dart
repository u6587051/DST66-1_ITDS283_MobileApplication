import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pj_vaccinepassport/create_account/create-account_2.dart';
import 'package:pj_vaccinepassport/model/Profile.dart';

class CreateAccount1 extends StatefulWidget {
  const CreateAccount1({Key? key}) : super(key: key);

  @override
  State<CreateAccount1> createState() => _CreateAccount1State();
}

class _CreateAccount1State extends State<CreateAccount1> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      CitizenID: '',
      PassportNumber: '',
      Phonenumber: '',
      Email: '',
      Password: '',
      Gender: '',
      Firstname: '',
      Surname: '',
      DoB: '');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
                resizeToAvoidBottomInset: true,
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
                body: SingleChildScrollView(
                  reverse: true,
                  child: Container(
                    child: Form(
                      key: formkey,
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
                          height: 60,
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText:
                                      "กรุณาป้อนหมายเลขบัตรประจำตัวประชาชน 13 หลัก"),
                              MinLengthValidator(13,
                                  errorText:
                                      "กรุณาป้อนหมายเลขพาสปอร์ตขั้นต่ำ 13 หลัก")
                            ]),
                            onSaved: (citizenid) {
                              profile.CitizenID = citizenid!;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
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
                          height: 60,
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText:
                                      "กรุณาป้อนหมายเลขพาสปอร์ต 6-7 หลัก"),
                              MinLengthValidator(6,
                                  errorText:
                                      "กรุณาป้อนหมายเลขพาสปอร์ตขั้นต่ำ 6 หลัก")
                            ]),
                            onSaved: (passportnumber) {
                              profile.PassportNumber = passportnumber!;
                            },
                            maxLength: 7,
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
                          height: 60,
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "กรุณาป้อนหมายเลขโทรศัพท์"),
                              MinLengthValidator(10,
                                  errorText: "หมายเลขโทรศัพท์ไม่ถูกต้อง")
                            ]),
                            onSaved: (phonenumber) {
                              profile.Phonenumber = phonenumber!;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // for below version 2 use this
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                              child: Text(
                                'อีเมล',
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
                            keyboardType: TextInputType.emailAddress,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                              EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                            ]),
                            onSaved: (email) {
                              profile.Email = email!;
                            },
                            maxLength: 40,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'abcd123@email.com',
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
                                'รหัสผ่าน',
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
                              RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน"),
                              MinLengthValidator(6,
                                  errorText:
                                      "กำหนดรหัสผ่านขั้นต่ำอย่างน้อย 6 ตัว")
                            ]),
                            onSaved: (password) {
                              profile.Password = password!;
                            },
                            obscureText: true,
                            maxLength: 25,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Password',
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
                            if (formkey.currentState!.validate()) {
                              formkey.currentState?.save();
                              print(
                                  "email = ${profile.CitizenID} password = ${profile.Password}, PhoneNO = ${profile.Phonenumber}, Passport = ${profile.PassportNumber}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateAccount2(profile: profile)),
                              );
                              formkey.currentState?.reset();
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
