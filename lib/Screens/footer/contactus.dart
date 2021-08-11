import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'this where the chatter happens',
            style: TextStyle(color: Colors.red, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
