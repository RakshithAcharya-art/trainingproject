import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:async/async.dart';


class LoadingImage extends StatefulWidget {
  @override
  _LoadingImageState createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {

  File imageFile;

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

  Future<void> _showChoiceDialog(BuildContext context)
  {
    return showDialog(context:context ,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Select image"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(10),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              )
             ],
          ),
        ),
      );
    }) ;
  }

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
          margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                decideImageView(),
                SizedBox(height: 120,),

                RaisedButton
                  (
                  color: Colors.blue,
                  child: Text("select image"),
                    onPressed: (){
                      _showChoiceDialog(context);
                    }
                ),
                RaisedButton(
                  child: Text("Sign Out"),
                )


              ],
            ),
          ]
          ),

        ),
      ),

    );
  }
}
