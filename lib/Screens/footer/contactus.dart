import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crud1/Screens/adminScreen.dart';
import 'package:crud1/constants/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUs extends StatefulWidget {
  static String id = 'chat_screen';
  static Size size;

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>
    with SingleTickerProviderStateMixin {
  FirebaseFirestore _firestor = FirebaseFirestore.instance;

  static String chatter;
  static double width = 20;
  static String sent_messages;
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode = FocusNode();
  Future<void> sendmessage() async {
    await _firestor
        .collection('message')
        .add({'text': sent_messages})
        .then((value) => print('sent message'))
        .catchError((error) => print('ther was an error somewherre'));
  }

  void getmessagse() {}

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          toolbarHeight: 70,
          leading: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Row(children: <Widget>[
                FootButton(() {
                  Navigator.pop(context);
                }, Icon(Icons.backspace), 'Back', 40, 40, 5)
              ])),
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Containerr(Colors.red, 40, 500, 'Contact Us', 20)),
          titleSpacing: 0,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: _firestor.collection('message').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                      children: snapshot.data.docs.map((document) {
                    return Center(
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Text(' ' + document['text'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    );
                  }).toList());
                })),
        bottomSheet: SizedBoss(
          320,
          50,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  child: TextField(
                focusNode: _focusNode,
                onChanged: (value) {
                  sent_messages = value;
                },
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: kdecorations.copyWith(
                  hintText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                  ),
                ),
              )),
              SizedBoss(10, 0),
              RawMaterialButton(
                onPressed: () async {
                  await sendmessage();
                  getmessagse();
                },
                fillColor: Colors.blueGrey,
                constraints: BoxConstraints.tight(Size(70, 47)),
                child: Icon(Icons.send),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
        ));
  }
}
 /* SliverList(
                        delegate:
                            SliverChildListDelegate([SingleChildScrollView()])); */
                       /* Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  Containerr(Colors.white24, 40, 40, 'Logo is here', 8),
                  SizedBoss(10, 0),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Containerr(Colors.red, 40, 40, 'Hulum APP', 20)),
                  ),
                  SizedBoss(10, 0),
                  Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
            SizedBoss(
                290,
                10,
                Divider(
                  color: Colors.white38,
                  height: 10,
                )),
            SizedBoss(
              0,
              30,
              Container(
                color: Colors.white,
              ),
            ),
            
          ]),  */ /* CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 40,
                toolbarHeight: 75,
                title: Padding(
                    padding: EdgeInsets.all(10),
                    child: Containerr(Colors.red, 40, 500, 'Contact Us', 20)),
                titleSpacing: 0,
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBoss(
                    40,
                    40,
                    Containerr(
                        Colors.yellowAccent, 40, 40, 'textts go here', 20)),
              ),
              

              /**/
            ],
          ), */