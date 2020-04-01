import 'package:flutter/material.dart';
import 'package:logindemo/Images.dart';
//import 'package:logindemo/company1/bottomNavigationBar.dart';
import 'package:logindemo/bnavigbar.dart';
//import 'company1/bottomNavigationBar.dart';
import 'package:logindemo/map.dart';
import 'package:logindemo/login.dart';
import 'package:logindemo/profilefs.dart';
import 'package:logindemo/rewiewspage.dart';
import 'profile.dart';
import 'Profileimageselection.dart';
import 'detailhotel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Home(),
      //Hotel(),
    );
  }
}
