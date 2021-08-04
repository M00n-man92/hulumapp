import 'package:flutter/material.dart';
import 'product.dart';

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
                  containerr(Colors.white24, 40, 40, 'Logo is here', 8),
                  SizedBoss(10, 0),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: containerr(Colors.red, 40, 40, 'Hulum APP', 20)),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 5,
              ),
              child: Row(
                children: <Widget>[
                  butn(
                      Icon(
                        Icons.add,
                        size: 40,
                      ),
                      'New Product', () {
                    Navigator.pushNamed(context, Products.id);
                  }),
                  SizedBoss(10, 0),
                  butn(
                      Icon(
                        Icons.delete,
                        size: 40,
                      ),
                      'Remove',
                      () {}),
                  SizedBoss(10, 0),
                  butn(
                      Icon(
                        Icons.edit,
                        size: 40,
                      ),
                      'Update',
                      () {})
                ],
              ),
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
                    SizedBoss(10, 10),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.white24,
                    ),
                    SizedBoss(10, 10),
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
                    FootButton(() {}, Icon(Icons.help), 'Help', 60, 40, 10),
                    //  Container(width: 60, height: 40, color: Colors.white24),
                    SizedBoss(10, 0),
                    FootButton(
                        () {}, Icon(Icons.message), 'Contact Us', 60, 40, 10),
                    SizedBoss(10, 0),
                    FootButton(() {}, Icon(Icons.pages), 'View', 60, 40, 10),
                    SizedBoss(10, 0),
                    FootButton(
                        () {}, Icon(Icons.settings), 'Setting', 60, 40, 10),
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

class containerr extends StatelessWidget {
  final String textt;
  final Color colourr;
  final double heightt, widthh;
  final double fontsize;

  containerr(
    this.colourr,
    this.heightt,
    this.widthh,
    this.textt,
    this.fontsize,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightt,
      width: widthh,
      color: colourr,
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 8, right: 10),
        child: Text(textt,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: fontsize)),
      ),
    );
  }
}

class butn extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onpressed;
  butn(this.icon, this.text, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
      constraints: BoxConstraints.expand(width: 90, height: 90),
      //highlightElevation: 0.0,
      onPressed: onpressed,
      fillColor: Colors.white24,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 2, top: 5), child: icon),
          SizedBox(height: 10),
          Text(
            text,
            //  style: TextStyle(color: Colors.black12, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class FootButton extends StatelessWidget {
  final Function onpressed;
  final Icon icon;
  final String text;
  final double width, lenght, radius;
  FootButton(this.onpressed, this.icon, this.text,
      [this.width, this.lenght, this.radius]);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      constraints: BoxConstraints.expand(width: width, height: lenght),
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(radius)),
      fillColor: Colors.white24,
    );
  }
}

class SizedBoss extends StatelessWidget {
  final double widht, length;
  final Widget kid;
  SizedBoss(this.widht, this.length, [this.kid]);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: length,
      child: kid,
    );
  }
}
