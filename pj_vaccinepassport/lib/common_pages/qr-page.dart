import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QRinfo extends StatefulWidget {
  const QRinfo({super.key});

  @override
  State<QRinfo> createState() => _QRinfoState();
}

class _QRinfoState extends State<QRinfo> {
  final auth = FirebaseAuth.instance;

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
                  backgroundColor:
                      Colors.transparent, // Make app bar transparent
                  elevation: 0, // Remove app bar shadow
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print(auth.currentUser?.email);
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where("email", isEqualTo: auth.currentUser!.email)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text('No data available'),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      var _citizenid = data['citizenid'].replaceAllMapped(
                          RegExp(r'(\d{1})(\d{4})(\d{5})(\d{2})(\d{1})'),
                          (Match match) =>
                              '${match[1]}-${match[2]}-${match[3]}-${match[4]}-${match[5]}'); //เปลี่ยน format บัตรประชาชนใช้ regexpr
                      String genderThai =
                          data['gender'] == 'Male' ? 'ชาย' : 'หญิง';
                      return Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.45, 0.75, 0.98],
                              colors: [
                                Color.fromARGB(255, 45, 71, 55),
                                Color.fromARGB(255, 124, 150, 112),
                                Color.fromARGB(255, 176, 173, 140),
                                Color.fromARGB(255, 238, 230, 222),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0, 0.45, 0.75, 0.98],
                                    colors: [
                                      Color.fromARGB(255, 71, 67, 68),
                                      Color.fromARGB(190, 71, 67, 68),
                                      Color.fromARGB(255, 173, 163, 166),
                                      Color.fromARGB(255, 238, 230, 222),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data['firstname']} ${data['surname']}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 34),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "วัน/เดือน/ปีเกิด: ${data['dob']}\nเพศ: ${genderThai}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 34),
                                        child: Text(
                                          'เลขประจำตัวประชาชน',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 325,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 4, 0, 4),
                                        child: Text("${_citizenid}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 34),
                                        child: Text(
                                          'หมายเลขหนังสือเดินทาง',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 325,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 4, 0, 4),
                                        child: Text("${data['passportNO']}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  Container(
                                    width: 250,
                                    height: 250,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/commons/2/2f/Rickrolling_QR_code.png?20200615212723"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'กรุณาแสดง QR code ให้เจ้าหน้าที่',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.bold,
                                          height: 0,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30,)
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg'),
                            ),
                          ],
                        )
                      ]);
                    });
              } else {
                return Center(child: Text("No widget"));
              }
            }));
  }
}
