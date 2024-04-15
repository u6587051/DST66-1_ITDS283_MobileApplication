import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Antibody extends StatefulWidget {
  const Antibody({super.key});

  @override
  State<Antibody> createState() => _AntibodyState();
}

class _AntibodyState extends State<Antibody> {
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('antibody')
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
              } else if (!snapshot.hasData || snapshot.data!.docs == null) {
                return Center(
                  child: Text('No data available'),
                );
              } else if (snapshot.hasData) {
                
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView(
                      itemExtent: 100,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.70, 0.80],
                                colors: [
                                  Color.fromARGB(255, 133, 161, 130),
                                  Color.fromARGB(255, 124, 150, 112),
                                  Color.fromARGB(255, 176, 173, 140),
                                ],
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "Hepatitis A Virus",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "Antigen : ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Text("Negative",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 41, 65, 18),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.70, 0.80],
                                colors: [
                                  Color.fromARGB(255, 133, 161, 130),
                                  Color.fromARGB(255, 124, 150, 112),
                                  Color.fromARGB(255, 176, 173, 140),
                                ],
                              ),
                            ),
                            child: ListTile(
                              title: Text("Hepatitis B Virus",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Row(
                                children: [
                                  Text("Antigen : ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  Text("Positive",
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text("No widget"));
              }
            }));
  }
}
