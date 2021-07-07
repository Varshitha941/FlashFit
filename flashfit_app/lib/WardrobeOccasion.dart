import 'dart:async';

import 'package:flashfit/WardrobeFilters.dart';
import 'package:flutter/material.dart';

class WardrobeOccasion extends StatefulWidget {
  @override
  _WardrobeOccasionState createState() => _WardrobeOccasionState();
}

class _WardrobeOccasionState extends State<WardrobeOccasion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _wardrobeoccasion = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Occasion", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(70.0),
                child: new Form(
                    key: _formKey,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: createInput() + createButtons(),
                    )
                )
            )
        )
    );
  }
  List<Widget> createInput(){
    return [
      Container(
        child: new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80,
          child: Image.asset('images/occasion.png'),
        ),
      ),
      SizedBox(height: 20),
      new Text("Please select the Occasion", style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo)),
      SizedBox(height: 10),
    ];
  }
  List<Widget> createButtons(){
    return[
      new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(() {
                _wardrobeoccasion = "Meeting or Interview";
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  WardrobeFilters()));
            },
            color: Colors.blueGrey,
            child: Text("Meeting/Interview", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
      SizedBox(height:10),
      new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(() {
                _wardrobeoccasion = "Office Party";
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  WardrobeFilters()));
            },
            color: Colors.blueGrey,
            child: Text("Office Party", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
      SizedBox(height: 10),
      new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(() {
                _wardrobeoccasion = "Festival";
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  WardrobeFilters()));
            },
            color: Colors.blueGrey,
            child: Text("Festival", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
      SizedBox(height: 10),
      new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(() {
                _wardrobeoccasion = "Wedding";
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  WardrobeFilters()));
            },
            color: Colors.blueGrey,
            child: Text("Wedding", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
      SizedBox(height: 10),
      new Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: FlatButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            onPressed: (){
              setState(() {
                _wardrobeoccasion = "Casual Party";
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  WardrobeFilters()));
            },
            color: Colors.blueGrey,
            child: Text("Casual Party", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
    ];
  }
}
