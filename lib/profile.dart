import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logindemo/images.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFe0f2f1)),
        child: Center(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40,),
              CircleAvatar(backgroundColor: Colors.blue,radius: 150,),
              SizedBox(height: 40,),
              RaisedButton(child: Text("Edit profile"),onPressed:(){} ,color: Colors.blue,),
              SizedBox(height: 20,),
              RaisedButton(child: Text("Sign out"),onPressed:(){} ,color: Colors.blue,)
            ],
          ),
        ),
      ),
    );
  }
}
