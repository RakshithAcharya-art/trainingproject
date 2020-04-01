import 'package:logindemo/company1/Coin.dart';
import 'package:logindemo/company1/bottomNavigationBar.dart';
import 'package:logindemo/login.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black,
          ),),
      ),
      body: Container(
        //height:MediaQuery.of(context).size.height-100.0,
        decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [BoxShadow(color: Colors.white,blurRadius: 3.0,spreadRadius: 3.0)]
        ),
        child: ListView(
          primary:false,
          //padding: EdgeInsets.only(left: 15.0,right: 10.0),
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height-100.0,
              child: ListView(
                children: <Widget>[
                  _buildFoodItem('assets/img1.jpg', "Place1", "amount1"),
                  SizedBox(height: 20),
                  _buildFoodItem('assets/img2.jpg', "place2", "amount2"),
                  SizedBox(height: 20),
                  _buildFoodItem('assets/img3.jpg', "place3", "amount3")
                ],
              ),
            )
          ],

        ),
      ),

    );
  }

  Widget _buildFoodItem(String imgPath,String foodName,String price)
  {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>DetailsPage(heroTag: imgPath,foodName: foodName,foodPrice: price)
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(imgPath),
                        radius: 40,
                      ),

//                  child:Image(
//                    image:AssetImage(imgPath),
//                   // fit:BoxFit.cover,
//                    //height: 75.0,
//                    //width: 75.0,
//                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    Text(
                        price,
                        style:TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            onPressed: (){

            },
          )
        ],
      ),
    );
  }
}


////////////////////////////////////////////////
//
//class _HomePageState extends State<HomePage> {
//
//  int _currentIndex=0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        title: Text("Home",
//        style: TextStyle(
//          color: Colors.white,
//          backgroundColor: Colors.black,
//        ),),
//      ),
//      body: Container(
//        height:MediaQuery.of(context).size.height-100.0,
//        decoration: BoxDecoration(
//          color: Colors.black,
//          boxShadow: [BoxShadow(color: Colors.white,blurRadius: 3.0,spreadRadius: 3.0)]
//        ),
//        child: ListView(
//          primary:false,
//          padding: EdgeInsets.only(left: 15.0,right: 10.0),
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(top:45.0),
//              child: Container(
//                height:MediaQuery.of(context).size.height-300.0,
//                child: ListView(
//                  children: <Widget>[
//                    _buildFoodItem('assets/img1.jpg', "Place1", "amount1"),
//                    SizedBox(height: 20),
//                    _buildFoodItem('assets/img2.jpg', "place2", "amount2"),
//                    SizedBox(height: 20),
//                    _buildFoodItem('assets/img3.jpg', "place3", "amount3")
//                  ],
//                ),
//              ),
//            )
//          ],
//
//        ),
//      ),
//
//    );
//  }
//
//  Widget _buildFoodItem(String imgPath,String foodName,String price)
//  {
//    return Padding(
//      padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
//      child: InkWell(
//        onTap: (){
//          Navigator.of(context).push(MaterialPageRoute(
//            builder: (context) =>DetailsPage(heroTag: imgPath,foodName: foodName,foodPrice: price)
//          ));
//        },
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Container(
//              child: Row(
//                children: <Widget>[
//                  Hero(
//                    tag: imgPath,
//                      child:Image(
//                        image:AssetImage(imgPath),
//                        fit:BoxFit.cover,
//                        height: 75.0,
//                        width: 75.0,
//                      ),
//                  ),
//                  SizedBox(width: 20.0),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        foodName,
//                        style: TextStyle(
//                          fontSize: 17.0,
//                          fontWeight:FontWeight.bold
//                        ),
//                      ),
//                      Text(
//                        price,
//                        style:TextStyle(
//                          fontSize: 15.0,
//                          color: Colors.grey
//                        )
//                      )
//                    ],
//                  )
//                ],
//              ),
//            ),
//            IconButton(
//              icon: Icon(Icons.arrow_right),
//              color: Colors.black,
//              onPressed: (){
//
//              },
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
///////////////////////////////////////////////////////////////////////////////////