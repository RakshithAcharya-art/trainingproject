import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/login.dart';
import 'package:logindemo/map.dart';
import 'package:logindemo/retrievedata.dart';


class Home{

  final databaseReference = Firestore.instance;


  Widget home ()
  {
    return Scaffold(
      appBar: AppBar(title: Text("Sample programming"),),
      body: Hotel(),
    );
  }

}