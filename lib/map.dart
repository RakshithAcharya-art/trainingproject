import 'package:flutter/material.dart';
import 'package:logindemo/company1/details.dart';
import 'dart:convert';
import 'detailhotel.dart';

import 'package:logindemo/login.dart';

class Hotel extends StatefulWidget {
  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Places near me",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:
      Center(
        child: FutureBuilder(builder: (context,snapshot){
          var mydata=json.decode(snapshot.data.toString());
          return Container(
            color: Colors.black,
            child: ListView.builder(
                itemCount: mydata.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    color: Colors.black,
                      child: Column(
                        children: <Widget>[
                          ListTile(

                              title: RaisedButton(
                                color: Colors.black,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                   CircleAvatar(backgroundImage: NetworkImage(mydata[index]['image']),radius: 20, ),
                                    SizedBox(width: 6,),
                                    Container(child: Text(mydata[index]['place'],style: TextStyle(color: Colors.white))),
                                    SizedBox(width: 6,),
                                    Container(child: Text(mydata[index]['distance'],style: TextStyle(color: Colors.yellow),)),

                                  ],
                                ),
                                onPressed: (){ Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>DetailsHotel(image:mydata[index]['image'],place: mydata[index]['place'],distance: mydata[index]['distance'])));},
                              )
                          ),
                        ],
                      )
                  );
                }),
          );
        },
            future:DefaultAssetBundle.of(context).loadString("assets/places.json")
        ),

      ),
    );

  }
}
























//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.790982,77.699450&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyA9nP4SfZRkj6btqAepUcPVNje8simxxkU



//import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';
//import 'package:async/async.dart';
////import 'package:flutter_google_places/flutter_google_places.dart';
//
//class Maps extends StatefulWidget {
//
//
//  @override
//  _MapsState createState() => _MapsState();
//}
//
//class _MapsState extends State<Maps> {
//  static const nycLat=12.790982;
//  static const nycLng=77.699450;
//  static const apiKey='AIzaSyA9nP4SfZRkj6btqAepUcPVNje8simxxkU';
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//
//  @override
//  void didChangeDependencies() async
//  {
//    super.didChangeDependencies();
//    print(await searchNearBy("hotel"));
//
//  }
// // https://maps.googleapis.com/maps/api/place/nearbysearch/json
//  Future<List<String>> searchNearBy(String keyword)async{
//    var dio=Dio();
//    var url='https://maps.googleapis.com/maps/api/place/nearbysearch/json';
//    var parameters={
//      'key':apiKey,
//      'location':'$nycLat,$nycLng',
//      'radius':'800',
//      'keyword':keyword
//    };
//    var response=await dio.get(url,data:parameters);
//
//    return response.data['results'].map<String>((result)=>result['name'].toString()).toList();
//  }
//
//
//}

