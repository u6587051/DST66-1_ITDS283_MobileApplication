import 'package:flutter/material.dart';

class calendar extends StatelessWidget {
  const calendar({super.key});

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
                onPressed: () {},
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text(
                  "Antibody",
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
        child: Column(
          children: [
            Row(
              children: [Text('Hello')],
            )
          ],
        ),
      ),
    );
  }
}
