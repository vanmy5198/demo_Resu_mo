import 'package:flutter/material.dart';
import 'package:resu_mo/Screens/Login_phonenumber/verify_otp.dart';

class LoginEmail extends StatelessWidget {
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
      body: BodyWidgetEmail(),
    );
  }
}

class BodyWidgetEmail extends StatefulWidget {
  @override
  _BodyWidgetEmailState createState() => _BodyWidgetEmailState();
}

class _BodyWidgetEmailState extends State<BodyWidgetEmail> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate() {
    if (formKey.currentState.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => verifyOTP()));
      // print('valid');
    } else {
      print("invalid");
    }
  }

  String validateEmail(value) {
    Pattern pattern = r'^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return "メールアドレスが正しい形式ではありません。もう一度入力してください。";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 40, right: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "メ一ルア ド レスを入力 してく ださい",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "本人確認のため、 入力 したメールア ド レスに認証コ一 ドが送信されます。",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black26),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "メ一ルア ド レス",
              ),
              validator: validateEmail,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 500,
              height: 60,
              // ignore: deprecated_member_use
              child: FlatButton(
                  color: Colors.yellow.shade400,
                  child: Text("認証コードを送信する"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: validate),
            ),
          ],
        ),
      ),
    );
  }
}
