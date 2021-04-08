import 'package:flutter/material.dart';
import 'package:resu_mo/Screens/Login_phonenumber/login_phone_number.dart';
import 'package:resu_mo/anhdhq/app.dart';
import 'package:resu_mo/tuanhcm1/app.dart';
import 'package:resu_mo/tuanhcm2/app.dart';

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
        // backgroundColor: Colors.white,
      ),
      home: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Loginphonenumber()));
            },
            child: Text('MyTV'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp1()));
            },
            child: Text('AnhDHQ')),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => App1()));
            },
            child: Text('TuanHCM_pj1')),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => App2()));
            },
            child: Text('TuanHCM_pj2')),
        ElevatedButton(onPressed: () {}, child: Text('TuanHCM_pj3')),
      ]),
    );
  }
}
