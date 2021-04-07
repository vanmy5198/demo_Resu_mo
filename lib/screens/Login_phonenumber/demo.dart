import 'package:flutter/material.dart';

// ignore: camel_case_types
class demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: new Center(
        child: Text(
          "本人確認・ログイン",
          textAlign: TextAlign.center,
        ),
      )),
      body: demobody(),
    );
  }
}

// ignore: camel_case_types
class demobody extends StatefulWidget {
  @override
  _demobodyState createState() => _demobodyState();
}

// ignore: camel_case_types
class _demobodyState extends State<demobody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
