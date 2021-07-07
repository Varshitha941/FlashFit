import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'FiltersPage.dart';
import 'StartUpPage.dart';



class GenderSelectionPage extends StatefulWidget {
  @override
  _GenderSelectionPageState createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Gender", style: TextStyle(
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
          radius: 100,
          child: Image.asset('images/gender.jpeg'),
        ),
      ),
      SizedBox(height: 20),
      new Text("Please select your Gender", style: TextStyle(
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
                _gender = 'Female';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
              return _gender;
            },
            color: Colors.blueGrey,
            child: Text("Female", style: TextStyle(
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
                _gender = 'Male';
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  FiltersPage()));
              return _gender;
            },
            color: Colors.blueGrey,
            child: Text("Male", style: TextStyle(
                color: Colors.white,
                fontSize: 20 )),
          )
      ),
    ];
  }
}