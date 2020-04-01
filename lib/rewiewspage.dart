import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'Images.dart';
import 'package:logindemo/Images.dart';
import 'dart:io';
import 'Profileimageselection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';// this is the path provider that should be used to provide path

class Rewiews extends StatefulWidget {

  @override
  _RewiewsState createState() => _RewiewsState();
}

class _RewiewsState extends State<Rewiews> {

  File _image;
  final myController=TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  var databaseReference=Firestore.instance;


  _sendreview(BuildContext context) async{

    await databaseReference.collection("books")
          .document("1")
          .setData({
        'About Hotel': '${myController.text}',

      });


  }

  Future uploadPic(BuildContext context) async{

    String fileName=basename(_image.path);//This is used to put only the name oof the image and the entite path and hence path provider is imported here
    StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask=await firebaseStorageRef.putFile(_image);
    await uploadTask.onComplete;
    setState(() {
      print("Profile picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewiews"),backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
//          TextField(
//              decoration: const InputDecoration(
//                contentPadding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 40),
//              )
//          ),
          SizedBox(height: 30),
            TextFormField(
              controller: myController,
              decoration: InputDecoration(labelText: "Add reviews here",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      borderSide: BorderSide(color: Colors.white)),
                  focusColor: myFocusNode.hasFocus ? Colors.blue : Colors.black,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 200.0),
              ),
              style: TextStyle(color: Colors.white),


            ),
            Image(
              image:( _image!=null)?FileImage(_image):NetworkImage("https://www.nuveen.com/global/-/media/nuveen/default/no-image-selected.ashx"),
            ),

            SizedBox(height: 20,),
            RaisedButton(
              color: Colors.grey,
              child: Row(
                children: <Widget>[
                  Icon(Icons.image),
                  SizedBox(width: 10,),
                  Text("Upload images")
                ],
              ),
              onPressed: (){
                _openCamera(context);
              }
            ),

            RaisedButton(
              child: Text("SUBMIT"),
              color: Colors.blueAccent,
              onPressed: (){
                _sendreview(context);
                uploadPic(context);
              },
              elevation: 4.0,
              splashColor: Colors.blue,

            ),


          ],
        ),
      ),
    );
  }

  _openCamera(BuildContext context) async{

    var picture=await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=picture;
    });
    Navigator.of(context).pop;

  }
}