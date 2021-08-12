import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crud1/Screens/adminScreen.dart';
import 'package:crud1/constants/constant.dart';

class ContactUs extends StatefulWidget {
  static String id = 'chat_screen';
  static Size size;

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>
    with SingleTickerProviderStateMixin {
  static String chatter;
  static double width = 20;

  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode = FocusNode();
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
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 40,
                toolbarHeight: 75,
                title: Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Containerr(Colors.red, 40, 500, 'Contact Us', 20)),
                ),
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
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Containerr(Colors.white38, 40, 50, 'talk', 12);
                },
                childCount: 20,
              )),
            ],
          ),
        ),
        bottomSheet: SizedBoss(
          320,
          50,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  child: TextField(
                focusNode: _focusNode,
                onChanged: (value) {},
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: kdecorations.copyWith(
                  hintText: 'Enter the Product Name',
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
                onPressed: () {
                  setState() {}
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
