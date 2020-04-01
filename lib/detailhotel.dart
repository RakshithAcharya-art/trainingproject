//import 'package:logindemo/map.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:logindemo/rewiewspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class DetailsHotel extends StatefulWidget {

  final image;
  final place;
  final  distance;
  DetailsHotel({this.image,this.place,this.distance});

  @override
  _DetailsHotelState createState() => _DetailsHotelState(image,place,distance);
}

class _DetailsHotelState extends State<DetailsHotel> {
  final databaseReference = Firestore.instance;//This is to get the instance of the firestore
  String image;
  String place;
  String distance;
  bool startispressed=true;
  bool stopispressed=true;
  String stoptimetodisplay="00:00:00";
  var swatch=Stopwatch();
  final dur=const Duration(seconds: 1);
  String timefs;



  _DetailsHotelState(this.image,this.place,this.distance,);

  void starttimer()
  {
    Timer(dur, keeprunning);
  }

  _sendTime(BuildContext context,String tim) async{

   await databaseReference.collection("books")
      .document("1")
        .setData({
      'timespent': '$tim',

    });

  }


  void keeprunning(){
    if(swatch.isRunning){
      starttimer();
    }
    setState(() {
      stoptimetodisplay=swatch.elapsed.inHours.toString().padLeft(2,"0")+":"+(swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"+(swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    });
  }


  void startstopwatch()
  {
  setState(() {
    stopispressed=false;

  });
  swatch.start();
  starttimer();
  }



  void stopstopwatch ()
  {
    setState(() {
      startispressed=true;
      _sendTime(context, stoptimetodisplay.toString());

    });
    swatch.stop();
    print(stoptimetodisplay.toString());
    starttimer();
    timefs=stoptimetodisplay.toString();

  }


  @override
  Widget build(BuildContext context) {
   // bool state=false;
    return Scaffold(
      appBar: AppBar(title: Text(place),backgroundColor: Colors.black,),
      body: Container(
        color: Colors.black,
        child: Center(
          child: ListView(
            children: <Widget>[
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[SizedBox(height: 20,),
                Image(image:NetworkImage(image),width: 300,height: 300,),
                SizedBox(height: 20,),
                Container(color: Colors.grey,height: 40,margin: EdgeInsets.all(20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                      RaisedButton(child: Text("login"),color: Colors.purple,
                        onPressed: startispressed?startstopwatch:stopstopwatch,
                      ),

                    SizedBox(width: 20,),
                    RaisedButton(child: Text("logout"),color: Colors.purple,
                        onPressed:stopispressed?startstopwatch:stopstopwatch),
                    Text(stoptimetodisplay),


                  ],
                ),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.grey,
                  child: Text("click here to Add Rewiews"),
                  onPressed: (){

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>Rewiews()));
                  },
                ),


              ],
            ),
          ],
          ),

        ),
      ),
    );
  }



}
