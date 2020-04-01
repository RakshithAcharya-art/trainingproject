import 'package:flutter/material.dart';
import 'Content.dart';
import 'package:logindemo/login.dart';
import 'Coin.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex=0;

  final tabs=[
    Center(child:HomePage()),
    Center(child:LoginPage()),
    Center(child:Coins()),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        iconSize: 15,
        selectedFontSize: 15,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.red,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Profile'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Coins'),
           backgroundColor: Colors.deepOrange
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );
  }
}
