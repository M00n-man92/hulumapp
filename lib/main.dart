import 'package:flutter/material.dart';
import 'Screens/welcomeScreen.dart';
import 'Screens/adminScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/registrationcreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Admin_Screen.id: (contex) => Admin_Screen(),
      },
    );
  }
}