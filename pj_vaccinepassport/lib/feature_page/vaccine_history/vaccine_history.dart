import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Vaccine_history extends StatefulWidget {
  const Vaccine_history({super.key});

  @override
  State<Vaccine_history> createState() => _Vaccine_history();
}

class _Vaccine_history extends State<Vaccine_history> {
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
                    "ประวัติการฉีดวัคซีน",
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
                .collection('vaccine_history')
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
                      DateTime date =
                          (docs[index]['date'] as Timestamp).toDate();
                      String formatted = DateFormat('dd/MM/yyyy').format(date);
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
                              title: Text(docs[index]['vaccine'] as String,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                '${formatted}\n${docs[index]['hospital']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              isThreeLine: true),
                        ),
                      );
                    });
              } else {
                return Center(child: Text("No widget"));
              }
            }));
  }
}
