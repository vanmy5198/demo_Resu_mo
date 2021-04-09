import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resu_mo/Screens/Login_phonenumber/verify_otp.dart';
import 'package:resu_mo/screens/Login_phonenumber/login_email.dart';

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
  bool isButtonEnable = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState.validate()) {
      openAlertValid(context);
    } else {
      print("invalid");
    }
  }

  void openAlertValid(BuildContext context) {
    // Create a AlertDialog.
    AlertDialog dialog = AlertDialog(
      title: Text(''),
      content: Text(
        "上記の蓄号にSMSで \n認証コードを送信します。",
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('キヤンセル'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => verifyOTP()));
          },
          child: Text('送る'),
        ),
      ],
    );

    // Call showDialog function.
    Future<bool> futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
    futureValue.then((value) {
      print("Return value: " + value.toString()); // true/false
    });
  }

  String validatePhone(value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty || !regex.hasMatch(value)) {
      return "";
    } else {
      return null;
    }
  }

  disableButton() {}

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
              onChanged: (val) {
                print(val.length);
                if (val.length == 10)
                  setState(() => isButtonEnable = true);
                else
                  setState(() => isButtonEnable = false);
              },
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 500,
              child: TextButton(
                onPressed: isButtonEnable ? () => validate() : null,
                child: Text('認証コードを送信する'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow.shade400,
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
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
              height: 60,
              width: 500,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginEmail()));
                },
                child: Text('メールアドレスでログイン'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow.shade400,
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
