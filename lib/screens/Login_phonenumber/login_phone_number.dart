import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resu_mo/Screens/verify_otp.dart';

class Loginphonenumber extends StatelessWidget {
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
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate() {
    if (formKey.currentState.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => verifyOTP()));
    } else {
      print("invalid");
    }
  }

  String validatePhone(value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return "要求";
    }
    if (!regex.hasMatch(value)) {
      return "電話番号が正しい形式ではありません。もう一度入力してください。";
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
              "携帯電話番号を入力してください",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "本人確認のために、携帯電話のSMS（ショートメッセージサービス）を利用して認証を行います。",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black26),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "携帯電話番号",
              ),
              validator: validatePhone,
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
            SizedBox(
              height: 100,
            ),
            Text(
              "すでに会員登録されていて携帯電話番号を変更された方",
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 500,
              height: 60,
              // ignore: deprecated_member_use
              child: FlatButton(
                  color: Colors.yellow.shade400,
                  child: Text("メールアドレスでログイン"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
