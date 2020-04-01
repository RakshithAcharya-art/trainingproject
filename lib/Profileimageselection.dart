import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:async/async.dart';







class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {

  File imageFile=null;

  _openGallery(BuildContext context) async{
    var picture=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop;
  }

  _openCamera(BuildContext context) async{

    var picture=await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop;

  }
//
//  Future<void> _showChoiceDialog(BuildContext context)
//  {
//    return showDialog(context:context ,builder: (BuildContext context){
//      return AlertDialog(
//        title: Text("Select image"),
//        content: SingleChildScrollView(
//          child: ListBody(
//            children: <Widget>[
//              GestureDetector(
//                child: Text("Gallery"),
//                onTap: (){
//                  _openGallery(context);
//                },
//              ),
//              Padding(padding: EdgeInsets.all(10),),
//              GestureDetector(
//                child: Text("Camera"),
//                onTap: (){
//                  _openCamera(context);
//                },
//              )
//            ],
//          ),
//        ),
//      );
//    }) ;
//  }

  Widget decideImageView(){
    if(imageFile==null)
    {
      return Text("no image is selected");
    }
    else
    {
      return Image.file(imageFile,width: 400,height: 400,);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main screen"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              decideImageView(),

              RaisedButton
                (
                  child: Text("select image"),
                  onPressed: (){
                    _openCamera(context);
                  }
              )

            ],
          ),

        ),
      ),

    );
  }
}




