import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

import 'config/amplifyconfiguration.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Amplifutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Ampliflutter(),
    ),
  );
}

class Ampliflutter extends StatefulWidget {
  @override
  _AmpliflutterState createState() => _AmpliflutterState();
}

class _AmpliflutterState extends State<Ampliflutter> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  bool _amplifyConfigured = false;

  Future<void> _configureAmplify() async {
    if (!mounted) return;

    Amplify.addPlugin(
      AmplifyAuthCognito(),
    );

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Amplify was already configured. Was the app restarted?");
    }

    try {
      setState(() => _amplifyConfigured = true);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('OTP example'),
            ),
            body: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Phone"),
                  controller: _phoneController,
                  validator: (value) =>
                      !validatePhone(value) ? "Phone is Invalid" : null,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "OTP"),
                  controller: _otp,
                ),
                ElevatedButton(
                  child: Text("CREATE ACCOUNT"),
                  onPressed: () => _createAccountOnPressed(context),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Theme.of(context).primaryColorLight),
                ),
                ElevatedButton(
                  child: Text("SIGNIN ACCOUNT"),
                  onPressed: () => _signIn(context),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Theme.of(context).primaryColorLight),
                ),
                ElevatedButton(
                  child: Text("VERIFY ACCOUNT"),
                  onPressed: () => _verify(context),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Theme.of(context).primaryColorLight),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )));
  }

  bool validatePhone(String val) {
    return true;
  }

  Future<void> _createAccountOnPressed(BuildContext context) async {
    final phone = _phoneController.text;
    try {
      SignUpResult res = await Amplify.Auth.signUp(
          username: phone,
          password: '111111Abc@',
          options: CognitoSignUpOptions(userAttributes: {
            'phone_number': phone,
            "email": 'leon.mytv@gmail.com'
          }));
      print('lol ${res.isSignUpComplete}');
    } catch (e) {
      print('error lol');
      print(e);
    } finally {
      print('lol');
    }
  }

  Future<void> _signIn(BuildContext context) async {
    final phone = _phoneController.text;
    SignInResult cognitoUser;
    try {
      cognitoUser =
          await Amplify.Auth.signIn(username: phone, password: '111111Abc@');
      if (cognitoUser.isSignedIn) {
        print('sent');
      }
    } catch (e) {
      // Handle sign in errors
      print('error lol');
      print(e);
    }

    SignInResult tmp =
        await Amplify.Auth.confirmSignIn(confirmationValue: _otp.text);
    if (tmp.isSignedIn) {
      print('success');
    }
  }

  Future<void> _verify(BuildContext context) async {
    final phone = _phoneController.text;
    final otp = _otp.text;
    SignUpResult cognitoUser;
    try {
      cognitoUser = await Amplify.Auth.confirmSignUp(
          username: phone, confirmationCode: '111111');
      if (cognitoUser.isSignUpComplete) {
        print('lol signup');
      }
    } catch (e) {
      // Handle sign in errors
      print('error lol');
      print(e);
    }
  }
}
