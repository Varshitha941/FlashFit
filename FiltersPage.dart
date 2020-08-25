import 'dart:async';

import 'package:flashfit/SuggestionsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AgeSelectionPage.dart';
import 'GenderSelectionPage.dart';
import 'OccasionSelectionPage.dart';
import 'StartUpPage.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {

  String _Gender;
  String _Age;
  String _Occasion;
  var _genderOptions = ['Female', 'Male'];
  var _currentGenderSelected;
  var _ageOptions = ['15 - 20', '20 - 25', '25 - 30', '30 - 35'];
  var _currentAgeSelected;
  var _occasionOptions = ['Meeting or Interview', 'Office Party', 'Casual Party', 'Festival', 'Wedding'];
  var _currentOccasionSelected;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Filters", style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        actions: <Widget>[

          new FlatButton(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6),
                  Icon(Icons.home,color: Colors.white),
                  Text("Home",style: TextStyle(color: Colors.white),),
                ],
              ),
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                    StartUpPage()));
              }
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Container(
                child: new CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  child: Image.asset('images/filter.png'),
                ),
              ),
              SizedBox(height: 40,),
              new Text("Please Select your Gender",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10),
              DropdownButton<String>(
                items: _genderOptions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                hint: Text("Select Gender", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                onChanged: (String newValueSelected){
                  setState(() {
                    this._currentGenderSelected = newValueSelected;
                  });
                  _Gender = _currentGenderSelected;
                },
                value: _currentGenderSelected,
              ),
              SizedBox(height: 10,),
              new Text("Please Select your Age",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10),
              DropdownButton<String>(
                items: _ageOptions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                hint: Text("Select Age", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                onChanged: (String newValueSelected){
                  setState(() {
                    this._currentAgeSelected = newValueSelected;
                  });
                  _Age = _currentAgeSelected;
                },
                value: _currentAgeSelected,
              ),
              SizedBox(height: 10,),
              new Text("Please Select an Occasion",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10),
              DropdownButton<String>(
                items: _occasionOptions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                hint: Text("Select an Occasion", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                onChanged: (String newValueSelected){
                  setState(() {
                    this._currentOccasionSelected = newValueSelected;
                  });
                  _Occasion = _currentOccasionSelected;
                },
                value: _currentOccasionSelected,
              ),
              SizedBox(height: 10),
              new FlatButton(
                  color: Colors.indigoAccent,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 6),
                      Icon(Icons.filter, color: Colors.white),
                      Text("Apply", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        SuggestionsPage(_Gender = _Gender, _Age = _Age, _Occasion = _Occasion)));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
