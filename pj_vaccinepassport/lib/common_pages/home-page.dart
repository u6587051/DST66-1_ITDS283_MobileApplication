import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pj_vaccinepassport/common_pages/login-page.dart';
import 'package:pj_vaccinepassport/common_pages/qr-page.dart';
import 'package:pj_vaccinepassport/feature_page/antibody/antibody.dart';
import 'package:pj_vaccinepassport/feature_page/calendar/calendar.dart';
import 'package:pj_vaccinepassport/feature_page/map/healthlocation.dart';
import 'package:pj_vaccinepassport/feature_page/vaccine_history/vaccine_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imagePath = [
  "assets/images/vaccine1.png",
  "assets/images/vaccine2.png",
  "assets/images/vaccine3.png",
  "assets/images/vaccine4.png",
  "assets/images/vaccine5.png",
  "assets/images/vaccine6.png"
];

int _activePage = 0;

class _HomePageState extends State<HomePage> {
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
              backgroundColor: Colors.transparent, // Make app bar transparent
              elevation: 0, // Remove app bar shadow
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg'),
                    // Your profile picture
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    // Add your notification action here
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    print("exit clicked");
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Center(
                                child: Icon(
                              Icons.assignment_late_outlined,
                              size: 50,
                              // color: Color.fromARGB(1, 71, 67, 68),
                            )),
                            content: Text(
                                "แจ้งเตือน\n\nคุณต้องการออกจากระบบหรือไม่"),
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
                              IconButton(
                                iconSize: 50,
                                onPressed: () {
                                  auth.signOut().then((value) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return LogInPage();
                                    })));
                                  });
                                },
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.green[900],
                                ),
                              )
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
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
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: CarouselSlider.builder(
                itemCount: imagePath.length,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height / 4,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _activePage = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Image.asset(
                    imagePath[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            // Page Indicator
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  imagePath.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: _activePage == index
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Antibody
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.bloodtype,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Antibody();
                      }));
                    },
                  ),
                ),
                // History
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.folder_copy_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Vaccine_history();
                      }));
                    },
                  ),
                ),
                // Certificate
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      // Add your notification action here
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ' Antibody',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'ประวัติ\nการฉีดวัคซีน',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'ใบรับรอง',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //ข้อมูลวัคซีน
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.vaccines,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      // Add your notification action here
                    },
                  ),
                ),
                // ปฏิทิน
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Calendar();
                        },
                      ));
                    },
                  ),
                ),
                // Location
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 45, 71, 55),
                  radius: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                      size: 80,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MapHealth();
                      }));
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '    ข้อมูลวัคซีน',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  
                ),
                Text(
                  '         ปฏิทิน',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '         ค้นหา\n        สถานพยาบาล',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 84, 15, 0),
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 71, 67, 68),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home),
                        color: Colors.white,
                        iconSize: 50,
                        onPressed: () {
                          print(auth.currentUser?.email);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(
                            255,
                            147,
                            147,
                            147,
                          ),
                          radius: 60,
                          child: IconButton(
                            icon: Icon(Icons.qr_code),
                            color: Colors.white,
                            iconSize: 50,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return QRinfo();
                              }));
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        iconSize: 50,
                        onPressed: () {},
                      ),
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
