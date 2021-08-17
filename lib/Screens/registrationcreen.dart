import 'package:flutter/material.dart';
import 'adminScreen.dart';
import 'package:crud1/button.dart';
import 'package:crud1/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'regsitration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String passsword, email;
  bool _initialized = false;
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                value = email;
              },
              textAlign: TextAlign.center,
              decoration: kdecorations.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                value = passsword;
              },
              decoration:
                  kdecorations.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            PressedBut(
              'Register',
              Colors.blueAccent,
              () async {
                try {
                  UserCredential newuser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: passsword);
                  if (newuser != null) {
                    Navigator.pushNamed(context, Admin_Screen.id);
                  }
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Failed because $e"),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//'Enter your password'
