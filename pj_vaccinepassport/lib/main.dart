import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pj_vaccinepassport/common_pages/login-page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vaccine Passport',
        theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme(),),
        debugShowCheckedModeBanner: false,
        home: LogInPage());
  }
}
