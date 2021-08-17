import 'package:crud1/Screens/adminScreen.dart';
import 'package:flutter/material.dart';
import 'package:crud1/constants/constant.dart';
import 'package:crud1/button.dart';
import 'adminScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;
  String email, password;
  FirebaseAuth _auht = FirebaseAuth.instance;
  UserCredential _userCredential;
  User _user;
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
                textAlign: TextAlign.center,
                onChanged: (value) {
                  value = email;
                },
                decoration:
                    kdecorations.copyWith(hintText: 'Enter your email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  value = password;
                },
                decoration:
                    kdecorations.copyWith(hintText: 'enter yourpassword')),
            SizedBox(
              height: 24.0,
            ),
            PressedBut('Log In', Colors.lightBlueAccent, () async {
              Navigator.pushNamed(context, Admin_Screen.id);
              /*  try {
                _userCredential = await _auht.signInWithEmailAndPassword(
                    email: email, password: password);
                if (_userCredential != null) {
                 
                } else {
                  print('somethin went wrong');
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
 */
              /*  try {
                final logedinuser = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (logedinuser != null) {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }
              } catch (e) {
                FocusScope.of(context).unfocus();
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Failed because $e"),
                ));
              } */
            }),
          ],
        ),
      ),
    );
  }
}
//
//
