import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:companyproject/Content.dart';
//import  'package:companyproject/DetailsofReviews.dart';
class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({this.heroTag,this.foodName,this.foodPrice});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool state=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height:MediaQuery.of(context).size.height-82.0,
                  width:MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                Positioned(
                  top:75.0,
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),

                      ),
                          color:Colors.black,
                    ) ,
                    height:MediaQuery.of(context).size.height,
                    width:MediaQuery.of(context).size.width,
                  )
                ),
                Positioned(
                  top:30,
                  left:(MediaQuery.of(context).size.width/2)-100,
                  child: Hero(
                    tag:widget.heroTag,
                    child:Container(
//                      decoration: BoxDecoration(
//                        image:
//                        DecorationImage(
//                          image:AssetImage(widget.heroTag),
//                          fit:BoxFit.cover
//                        )
//                      ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.heroTag),
                    ),
                      height: 200.0,
                      width: 200.0,
                    )
                  ),
                ),

                Positioned(
                  top:250.0,
                  left: 25.0,
                  right: 25.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Center(
                        child: Text(widget.foodName,
                        style: (
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        )
                        ),
                        ),
                      ),

                    ],
                  )
                ),

                Positioned(
                    top:350.0,
                    left: 25.0,
                    right: 25.0,
                    child: Container(
                      height: 40,
                      color: Colors.grey,
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: state,
                            onChanged: (bool s){
                              setState(() {
                                state=s;
                                Timer(state);
                              });

                            },
                          ),

                        ],
                      ),
                    )
                ),
                Positioned(
                    top:450.0,
                    left: 25.0,
                    right: 25.0,
                    child: RaisedButton(
                      child: Row(
                        children: <Widget>[

                          SizedBox(width: 5,),
                          Text("click here to add reviews")

                        ],
                      ),
                      onPressed: (){
                       // var sup=MaterialPageRoute(builder:(BuildContext context)=>Review());
                        //Navigator.of(context).push(sup);
                      },
                    )
                ),



              ],
            ),
            Container(
              color: Colors.black,
            )

          ],
        ),
      )
    );
  }
  Widget Timer(bool iss)
  {
    if(iss)
      {
        return Container(
          color: Colors.blue,
          child: TextFormField(

        )
        );


      }
  }
}



///////////////////////////////////////////////////////////////


//
//
//class _DetailsPageState extends State<DetailsPage> {
//  bool state=false;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//        body:ListView(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                Container(
//                  height:MediaQuery.of(context).size.height-82.0,
//                  width:MediaQuery.of(context).size.width,
//                  color: Colors.black,
//                ),
//                Positioned(
//                    top:75.0,
//                    child:Container(
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(
//                          topLeft: Radius.circular(45.0),
//                          topRight: Radius.circular(45.0),
//
//                        ),
//                        color:Colors.black,
//                      ) ,
//                      height:MediaQuery.of(context).size.height,
//                      width:MediaQuery.of(context).size.width,
//                    )
//                ),
//                Positioned(
//                  top:30,
//                  left:(MediaQuery.of(context).size.width/2)-100,
//                  child: Hero(
//                      tag:widget.heroTag,
//                      child:Container(
//                        decoration: BoxDecoration(
//                            image:DecorationImage(
//                                image:AssetImage(widget.heroTag),
//                                fit:BoxFit.cover
//                            )
//                        ),
//                        height: 200.0,
//                        width: 200.0,
//                      )
//                  ),
//                ),
//
//                Positioned(
//                    top:250.0,
//                    left: 25.0,
//                    right: 25.0,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        SizedBox(height: 50),
//                        Center(
//                          child: Text(widget.foodName,
//                            style: (
//                                TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 40,
//                                  color: Colors.white,
//                                )
//                            ),
//                          ),
//                        ),
//                      ],
//                    )
//                ),
//
//                Positioned(
//                    top:350.0,
//                    left: 25.0,
//                    right: 25.0,
//                    child: Container(
//                      height: 40,
//                      color: Colors.grey,
//                      child: Row(
//                        children: <Widget>[
//                          Switch(
//                            value: state,
//                            onChanged: (bool s){
//                              setState(() {
//                                state=s;
//                                Timer(state);
//                              });
//
//                            },
//                          ),
//
//                        ],
//                      ),
//                    )
//                ),
//
//
//
//              ],
//            ),
//            Container(
//              color: Colors.black,
//            )
//
//          ],
//        )
//    );
//  }
//  Widget Timer(bool iss)
//  {
//    if(iss)
//    {
//      return Container(
//          color: Colors.blue,
//          child: TextFormField(
//
//          )
//      );
//
//
//    }
//  }
//}
//
//







////////////////////////////////////////////////////////////////

//
//Scaffold(
//appBar: AppBar(
//backgroundColor: Colors.blue,
//title: Text("Places near you"),
//),
//body: ListView(
//children: <Widget>[
//Hero(
//tag:widget.heroTag,
//child:Container(
//decoration:BoxDecoration(
//image:DecorationImage(
//image:AssetImage(widget.heroTag),
//fit: BoxFit.cover
//)
//)
//)
//)
//],
//)
//);