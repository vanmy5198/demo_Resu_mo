import 'package:flutter/material.dart';
import 'package:resu_mo/Screens/Login_phonenumber/login_phone_number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loginphonenumber(),
    );
  }
}
