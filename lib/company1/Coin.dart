import 'package:flutter/material.dart';
import 'dart:convert';

class Coins extends StatefulWidget {
  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Coins",
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
                  return Container(color: Colors.black12,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Row(
                              children: <Widget>[

                                Container(child: Text(mydata[index]['time'],style: TextStyle(color: Colors.white))),
                                SizedBox(width: 6,),
                                Container(child: Text(mydata[index]['record'],style: TextStyle(color: Colors.white))),
                                SizedBox(width: 6,),
                                Container(color:Colors.purple,child: Text(mydata[index]['coin'],style: TextStyle(color: Colors.yellow),)),

                              ],
                            )
                        ),
                      ],
                    )
                  );
                }),
          );
        },
            future:DefaultAssetBundle.of(context).loadString("assets/person.json")
        ),

      ),
    );

  }
}
