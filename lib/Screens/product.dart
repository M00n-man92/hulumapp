import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'adminScreen.dart';
import 'package:crud1/constants/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:async';

class Products extends StatefulWidget {
  static String id = 'products_screen';
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  static String name, trainee;
  static String discription;
  static String price;
  static String quantity;
  String downUrl;
  File _image;
  FirebaseFirestore _data = FirebaseFirestore.instance;
  final picker = ImagePicker();

  Future<void> setdata() async {}

  Future getImagefromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
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
        print(_image);
      } else {
        print('No Pics Taken.');
      }
    });
  }

  Future<void> setImageStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String file = await basename(_image.path);
    try {
      Reference ref = FirebaseStorage.instance.ref().child('images/$file');
      UploadTask upload = ref.putFile(_image);

      downUrl = await (await upload).ref.getDownloadURL().toString();
      print(downUrl);
    } on FirebaseException catch (e) {
      print('terer waws an exception$e');
    }
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
                          Containerr(Colors.red, 40, 40, 'Create Product', 20)),
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
          AddThings('Name', (value) async {
            discription = await value;
          }),
          SizedBoss(0, 10),
          AddThings('Discription', (value) async {
            name = await value;
          }),
          SizedBoss(0, 10),
          AddThings('Price', (value) async {
            price = await value;
          }),
          SizedBoss(0, 10),
          AddThings('quantity', (value) async {
            quantity = await value;
          }),
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
                onPressed: () async {
                  _data
                      .collection('fur')
                      .add({
                        'name': discription,
                        'discription': name,
                        'price': price,
                        'quantity': quantity
                      })
                      .then((value) => print('new ptof=duct added'))
                      .catchError(
                          (error) => print("Failed to merge data: $error"));
                  await setImageStorage();
                },
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
            Containerr(Colors.white38, 45, 50, name, 11),
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
