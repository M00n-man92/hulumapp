import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Admin_Screen extends StatefulWidget {
  static String id = 'admin_screen';
  @override
  _Admin_ScreenState createState() => _Admin_ScreenState();
}

class _Admin_ScreenState extends State<Admin_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.white24,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 8, right: 10),
                      child: Text('Logo is here',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 8)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(left: 10),
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 8, right: 10),
                          child: Text(
                            'Hulum APP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
            SizedBox(
              height: 10,
              width: 290,
              child: Divider(
                color: Colors.white38,
                height: 10,
              ),
            ),
            SizedBox(
              height: 30,
              child: Container(
                color: Colors.white30,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 90,
                  color: Colors.white24,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 2, top: 5),
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Text(
                          'New Product',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 90,
                  color: Colors.white24,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 2, top: 5),
                        child: Icon(
                          Icons.delete,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Remove',
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    color: Colors.white24,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 2, top: 5),
                            child: Icon(Icons.update, size: 40)),
                        SizedBox(height: 10),
                        Text(
                          'Update',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 80.0),
              child: Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.white24,
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.white24,
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.white24,
                    ),
                  ],
                ),
              )),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                child: Row(
                  children: <Widget>[
                    Container(width: 60, height: 40, color: Colors.white24),
                    SizedBox(width: 10),
                    Container(width: 60, height: 40, color: Colors.white24),
                    SizedBox(
                      width: 10,
                    ),
                    Container(width: 60, height: 40, color: Colors.white24),
                    SizedBox(
                      width: 10,
                    ),
                    Container(width: 60, height: 40, color: Colors.white24),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
