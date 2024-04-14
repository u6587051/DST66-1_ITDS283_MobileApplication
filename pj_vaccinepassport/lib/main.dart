import 'package:flutter/material.dart';
import 'package:pj_vaccinepassport/common_pages/home-page.dart';
import 'package:pj_vaccinepassport/common_pages/login-page.dart';
import 'package:pj_vaccinepassport/common_pages/qr-page.dart';
import 'package:pj_vaccinepassport/create_account/create-account_1.dart';
import 'package:pj_vaccinepassport/create_account/create-account_2.dart';
import 'package:pj_vaccinepassport/feature_page/antibody/antibody.dart';
import 'package:pj_vaccinepassport/feature_page/calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vaccine Passport',
        debugShowCheckedModeBanner: false,
        home: LogInPage());
  }
}
