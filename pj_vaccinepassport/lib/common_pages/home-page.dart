import 'package:flutter/material.dart';

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

final PageController _pageController = PageController(initialPage: 0);

// Timer? _timer;

late List<Widget> _pages;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = List.generate(
        imagePath.length,
        (index) => ImagePlaceHolder(
              imagePath: imagePath[index],
            ));
  }

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
            stops: [0, 0.45, 0.75, 0.88],
            colors: [
              Color.fromARGB(255, 45, 71, 55),
              Color.fromARGB(255, 124, 150, 112),
              Color.fromARGB(255, 176, 173, 140),
              Color.fromARGB(255, 238, 230, 222),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
              height: MediaQuery.of(context).size.height / 4,
              child: PageView.builder(
                  itemCount: imagePath.length,
                  onPageChanged: (value) {
                    setState(() {
                      _activePage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  }),
            ),
            // Page Indicator
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: _activePage == index
                                ? Colors.grey.shade700
                                : Colors.grey,
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
