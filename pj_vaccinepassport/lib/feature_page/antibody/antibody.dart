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
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasData) {
                var docs = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final isPositive = docs[index]['antigen']
                          as bool; // Cast 'antigen' to bool
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                              title: Text(docs[index]['antibody'] as String,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600)),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'Antigen: ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22,fontWeight: FontWeight.w400,),
                                  ),
                                  Text(
                                    isPositive ? 'Positive' : 'Negative',
                                    style: TextStyle(
                                      color: isPositive
                                          ? Colors.red[800]
                                          : Color(0xFF294112),
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      height: 0.03,
                                      letterSpacing: 0.25,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    });
              } else {
                return Center(child: Text("No widget"));
              }
            }));
  }
}
