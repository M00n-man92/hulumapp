import 'package:flutter/material.dart';
import 'adminScreen.dart';
import 'package:crud1/constants/constant.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'dart:async';

class Products extends StatefulWidget {
  static String id = 'products_screen';
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  static String name;
  static String discription;
  static double price, quantity;
  File _image;
  final picker = ImagePicker();

  Future getImagefromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagefromCamera() async {
    final picked_File = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (picked_File != null || picked_File != null) {
        _image = File(picked_File.path);
      } else {
        print('No Pics Taken.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Row(
              children: <Widget>[
                FootButton(() {
                  Navigator.pop(context);
                }, Icon(Icons.backspace), 'Back', 40, 40, 5),
                SizedBoss(10, 0),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          containerr(Colors.red, 40, 40, 'Create Product', 20)),
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
          AddThings('Name', (value) {
            value = name;
          }),
          SizedBoss(0, 10),
          AddThings('Discription', (value) {
            value = discription;
          }),
          SizedBoss(0, 10),
          Flexible(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: AddThings('Price', (value) {
                    value = price;
                  }),
                ),
                SizedBoss(5, 5),
                Flexible(
                  child: AddThings('Quantity', (value) {
                    value = quantity;
                  }),
                )
              ],
            ),
          ),
          SizedBoss(0, 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 5,
            ),
            child: Row(children: <Widget>[
              RawMaterialButton(
                onPressed: () => getImagefromGallery(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fillColor: Colors.white38,
                constraints: BoxConstraints.expand(width: 50, height: 45),
                child: Icon(Icons.attach_file),
              ),

              /* butn(Icon(Icons.ac_unit), 'Press me', () => getImage(), 50, 45,
                    Colors.white38),
         */
              SizedBoss(0, 10),
              Flexible(
                  child: _image != null
                      ? Image.file(
                          _image,
                          fit: BoxFit.scaleDown,
                          width: 50,
                          height: 45,
                        )
                      : Text(
                          'no Image',
                          style: TextStyle(color: Colors.white38),
                        )),
              SizedBoss(62, 5),
              Flexible(
                child: RawMaterialButton(
                  onPressed: () => getImagefromCamera(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  fillColor: Colors.white38,
                  constraints: BoxConstraints.expand(width: 50, height: 45),
                  child: Icon(Icons.camera_alt),
                ),
              ),
              SizedBoss(0, 10),
              Flexible(
                  child: _image != null
                      ? Image.file(
                          _image,
                          fit: BoxFit.scaleDown,
                          width: 50,
                          height: 45,
                        )
                      : Text(
                          'no Image',
                          style: TextStyle(color: Colors.white38),
                        )),
            ]),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: RawMaterialButton(
                onPressed: () => {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fillColor: Colors.white38,
                constraints: BoxConstraints.expand(width: 50, height: 45),
                child: Icon(Icons.add)),
          ))
        ])));
  }
}

class AddThings extends StatelessWidget {
  final String name;
  final Function onpressed;
  AddThings(this.name, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 5,
        ),
        child: Row(
          children: <Widget>[
            containerr(Colors.white38, 45, 50, name, 11),
            SizedBoss(10, 0),
            Flexible(
                child: TextField(
              onChanged: onpressed,
              style: TextStyle(color: Colors.white24),
              textAlign: TextAlign.center,
              decoration: kdecorations.copyWith(
                hintText: 'Enter the Product Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38, width: 2.0),
                ),
              ),
            ))
          ],
        ));
  }
}
