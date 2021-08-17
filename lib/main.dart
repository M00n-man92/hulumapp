import 'package:flutter/material.dart';
import 'Screens/welcomeScreen.dart';
import 'Screens/adminScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/registrationcreen.dart';
import 'Screens/product.dart';
import 'Screens/footer/contactus.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

Widget SomethingWentWrong() {
  print('somehting wemnt wrioj');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          /*   if (snapshot.hasError) {
           SomethingWentWrong();
        } */
          if (snapshot.connectionState == ConnectionState.done) {
            print('initialized');
            return MaterialApp(
              home: WelcomeScreen(),
              initialRoute: WelcomeScreen.id,
              routes: {
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                Admin_Screen.id: (contex) => Admin_Screen(),
                Products.id: (contex) => Products(),
                ContactUs.id: (context) => ContactUs()
              },
            );
          }
          //make animation while its waitng
          return Center(child: CircularProgressIndicator());
        });
    /*   */
  }
}
