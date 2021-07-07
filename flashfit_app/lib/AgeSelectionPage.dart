import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'FiltersPage.dart';
import 'OccasionSelectionPage.dart';

class AgeSelectionPage extends StatefulWidget {
  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Age = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Age", style: TextStyle(
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
          child: Image.asset("images/age-group.png"),
        ),
      ),
      SizedBox(height: 20),
      new Text("Please select your Age", style: TextStyle(
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
                _Age = '15 - 20';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
            },
            color: Colors.blueGrey,
            child: Text("15 - 20", style: TextStyle(
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
                _Age = '20 - 25';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
            },
            color: Colors.blueGrey,
            child: Text("20 - 25", style: TextStyle(
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
                _Age = '25 - 30';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
            },
            color: Colors.blueGrey,
            child: Text("25 - 30", style: TextStyle(
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
                _Age = '30 - 35';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
            },
            color: Colors.blueGrey,
            child: Text("30 - 35", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
    ];
  }
}
