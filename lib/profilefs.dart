import 'dart:io';
//import 'package:firebase/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';//it is used to get the file name of the image that u have selected from the gallery and not the entire path

class ProfilePagefs extends StatefulWidget {
  @override
  _ProfilePagefsState createState() => _ProfilePagefsState();
}

class _ProfilePagefsState extends State<ProfilePagefs> {

  File _image;


  @override
  Widget build(BuildContext context) {

    Future uploadPic(BuildContext context) async{

      String fileName=basename(_image.path);//This is used to put only the name oof the image and the entite path and hence path provider is imported here
      StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask=await firebaseStorageRef.putFile(_image);
      await uploadTask.onComplete;
      setState(() {
        print("Profile picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });

//
//     Future<Uri> _pickSaveImage(String imageId) async {
//        File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
//        StorageReference ref =
//        FirebaseStorage.instance.ref().child(imageId).child("image.jpg");
//        StorageUploadTask uploadTask = ref.putFile(imageFile);
//        return (await uploadTask.future).downloadUrl;
//    }


    }

    Future getImage() async{
      var image=await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=image;
        print('Image path $_image');
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),
        onPressed:(){Navigator.pop(context);},
        ),
        title: Text("Edit Profile"),
      ),
      body: Builder(
        builder: (context)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.blue,
                      backgroundImage:( _image!=null)?FileImage(_image):NetworkImage("https://www.upv.edu.ph/images/2019/06/07/no-profile.png"),
                        //

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 60.0),
                  child:IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 30.0,
                    ),
                    onPressed: (){
                      getImage();

                    },
                  )
                  )
                ],
              ),
              SizedBox(height: 20,),
              Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('UserName',
                              style: TextStyle(
                                color: Colors.blueGrey,fontSize: 18.0),
                              ),
                              ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Rakshith Acharya',
                                style: TextStyle(
                                    color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        FontAwesomeIcons.pen,color: Colors.black,
                      ),
                    ),



                  ],
                ),
              ),
             SizedBox(height: 50,)
             , RaisedButton(
                child: Text("CANCEL"),
                color: Colors.blueGrey,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                elevation: 4.0,
                splashColor: Colors.blue,

              ),
              SizedBox(height: 40,)
              ,
              RaisedButton(
                child: Text("SUBMIT"),
                color: Colors.blueAccent,
                onPressed: (){
                 uploadPic(context);
                },
                elevation: 4.0,
                splashColor: Colors.blue,

              )
            ],
          ),
        )
        
        
      )
    );
  }
}

