

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:async/async.dart';
import 'file:///C:/sampleprojects/logindemo/lib/company1/assets/Home.dart';
import 'package:logindemo/retrievedata.dart';
import 'package:email_validator/email_validator.dart';

enum FormType {
  login,
  register
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final databaseReference = Firestore.instance;
  final formKey=new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType=FormType.login;


  bool validateAndSave(){

    final form=formKey.currentState;
    if(form.validate())
      {
        form.save();
       return true;
      }
    else
      {
        return false;
      }
  }

  void validateAndSubmit() async {
    if(validateAndSave()) {
      try {

        if(_formType==FormType.login) {
          AuthResult result = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((user){
            Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=>Home().home()));}));
          FirebaseUser user=result.user;
          print('Signed in :'+user.uid);
 

//          await databaseReference.collection("books")
//              .document("1")
//              .setData({
//            'title': 'Mastering Flutter',
//            'description': 'Programming Guide for Dart'
//          });
//
//          DocumentReference ref = await databaseReference.collection("books")
//             .add({
//            'title': 'Flutter in Action',
//            'description': 'Complete Programming Guide to learn Flutter'
//          });
//          print(ref.documentID);

        }
        else
          {
            AuthResult result = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password).then((user){
              Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=>Home().home()));}));
            FirebaseUser user=result.user;
            print('Registered user: '+user.uid);
            await databaseReference.collection("books")
                .document("1")
                .setData({
              'email': '$_email',
              'password': '$_password'
            });

            DocumentReference ref = await databaseReference.collection("books")
                .add({
              'title': 'Flutter in Action',
              'description': 'Complete Programming Guide to learn Flutter'
            });
            print(ref.documentID);
          }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToLogin()
  {
    setState(() {
      formKey.currentState.reset();
      _formType=FormType.login;
    });
  }

  void moveToRegister()
  {
    formKey.currentState.reset();
    setState(() {
      _formType=FormType.register;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Flutter Login page"),backgroundColor: Colors.black,),
      body: Container(
        color: Colors.black,
        child: ListView(

          children: <Widget>[
            Container(
                color: Colors.black,
                padding: EdgeInsets.all(16),
                child:Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: AssetImage("assets/aicon.png"),radius: 120,),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: buildInputs()+buildSubmitButtons(),
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      )
    );
  }

  List<Widget> buildInputs(){
    return [


      TextFormField(

        decoration: InputDecoration(labelText: "Email",labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.white))),
          keyboardType: TextInputType.emailAddress,
        validator: (value)=> !EmailValidator.validate(value, true) ? "Invalid Email Id" : null,
        onSaved: (value)=>_email=value,




      ),
      SizedBox(height: 20,),
      TextFormField(
        decoration: InputDecoration(labelText: "Password",labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white))),
        keyboardType: TextInputType.visiblePassword,
        validator: (value)=>value.isEmpty?'password cant be empty':null,
        //obscureText: true,
        onSaved: (value)=>_password=value,
      ),

    ];
  }

  List<Widget> buildSubmitButtons(){
    if(_formType==FormType.login) {
      return [

       SizedBox(height: 10,),
        RaisedButton(
          child: Text(
            "Login", style: TextStyle(fontSize: 20.0),
          ),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text(
            "Create a new account", style: TextStyle(fontSize: 20.0,color: Colors.grey),),
          onPressed: moveToRegister,
        ),

      ];
    }

    else
      {
        return [
          RaisedButton(
            child: Text(
              "Creatan account ", style: TextStyle(fontSize: 20.0),
            ),
            onPressed: validateAndSubmit,
          ),
          FlatButton(
            child: Text(
              "Have an account login", style: TextStyle(fontSize: 20.0),),
            onPressed: moveToLogin,
          )
        ];
      }
  }

}

