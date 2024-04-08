import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                    backgroundImage: AssetImage('assets/images/man_test.jpg'),
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
                    // Add your exit action here
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
                backgroundColor: Colors.transparent,
                radius: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.bloodtype,
                    color: Colors.white,
                    size: 80,
                  ),
                  onPressed: () {
                    // Add your notification action here
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
                    // Add your notification action here
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
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                'ประวัติ\nการฉีดวัคซีน',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                'ใบรับรอง',
                style: TextStyle(color: Colors.white),
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
              //Antibody
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
              // History
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
                    // Add your notification action here
                  },
                ),
              ),
              // Certificate
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
                ' ข้อมูลวัคซีน',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                '      ปฏิทิน',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                '      ค้นหา\n    สถานพยาบาล',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 70, 15, 0),
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
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 147, 147, 147,),
                        radius: 60,
                        child: IconButton(
                          icon: Icon(Icons.qr_code),
                          color: Colors.white,
                          iconSize: 50,
                          onPressed: () {},
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
    );
  }
}
