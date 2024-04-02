import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Your profile picture
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add your notification action here
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                // Add your exit action here
              },
            ),
          ],
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
                Color.fromARGB(255, 238, 230, 222)
              ],
            ),
          ),
          child: Row(
            children: [],
            
          ),
        ));
  }
}
