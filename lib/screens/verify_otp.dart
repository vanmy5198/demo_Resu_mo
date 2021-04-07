import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
// import 'package:resu_mo/Screens/Login_phonenumber/login_phone_number.dart';

// ignore: camel_case_types
class verifyOTP extends StatelessWidget {
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
      body: BodyWidgetOTP(),
    );
  }
}

class BodyWidgetOTP extends StatefulWidget {
  @override
  _BodyWidgetOTPState createState() => _BodyWidgetOTPState();
}

class _BodyWidgetOTPState extends State<BodyWidgetOTP> {
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();
  final pin5Controller = TextEditingController();
  final pin6Controller = TextEditingController();
  String otp;
  String otpReal;
  bool isEqual = false;
  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    randomNumber();
    print(otp);
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  randomNumber() {
    this.otp = randomNumeric(6).toString();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    super.dispose();
  }

  printPin() {
    String pin1 = pin1Controller.text;
    String pin2 = pin2Controller.text;
    String pin3 = pin3Controller.text;
    String pin4 = pin4Controller.text;
    String pin5 = pin5Controller.text;
    String pin6 = pin6Controller.text;
    otpReal = '$pin1$pin2$pin3$pin4$pin5$pin6';
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void previousField(String value, FocusNode focusNode) {
    if (value.length == 0) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 40, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "6桁のコ一ドを入力 してください",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "認証コ ー ドが0901234567に邁信されま し た",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: TextFormField(
                  controller: pin1Controller,
                  focusNode: pin1FocusNode,
                  autofocus: true,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                    // myController.text = isNumeric(value) ? value : '';
                    // myController.selection = TextSelection.collapsed(offset: 1);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: pin2Controller,
                  focusNode: pin2FocusNode,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                    previousField(value, pin1FocusNode);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: pin3Controller,
                  focusNode: pin3FocusNode,
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                    previousField(value, pin2FocusNode);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: pin4Controller,
                  focusNode: pin4FocusNode,
                  onChanged: (value) {
                    nextField(value, pin5FocusNode);
                    previousField(value, pin3FocusNode);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: pin5Controller,
                  focusNode: pin5FocusNode,
                  onChanged: (value) {
                    nextField(value, pin6FocusNode);
                    previousField(value, pin4FocusNode);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: pin6Controller,
                  focusNode: pin6FocusNode,
                  onChanged: (value) {
                    previousField(value, pin5FocusNode);
                    printPin();
                    if (otpReal.length == 6) {
                      if (otp == otpReal) {
                        print('Valid OTP: $otpReal , $otp');
                        // setState(() {
                        //   isEqual = true;
                        // });

                      } else {
                        print('Invalid OTP');
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "コードを再送　60s",
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "認証番号が届かない方",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "認証コードがSMSに届かない場合は、SMS受信設定を確認してください。それでも届かない場合は、お問い合わせください。",
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
