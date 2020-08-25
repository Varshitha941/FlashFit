import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashfit/OccasionSelectionPage.dart';
import 'package:flashfit/WardrobePage.dart';
import 'package:flashfit/WardrobeSuggestions.dart';
import 'package:flutter/material.dart';

import 'ColorSelectionPage.dart';
import 'WardrobeOccasion.dart';

class WardrobeFilters extends StatefulWidget {
  @override
  _WardrobeFiltersState createState() => _WardrobeFiltersState();
}

class _WardrobeFiltersState extends State<WardrobeFilters> {

  String _Occasion;
  var _occasionOptions = ['Meeting or Interview', 'Office Party','Casual Party', 'Festival', 'Wedding'];
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
                color: Colors.indigoAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Icon(Icons.filter,color: Colors.white),
                    Text("Apply",style: TextStyle(color: Colors.white),),
                  ],
                ),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      WardrobeSuggestions( _Occasion = _Occasion)));
                }
            ),
            new FlatButton(
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Icon(Icons.account_balance_wallet,color: Colors.white),
                    Text("Wardrobe",style: TextStyle(color: Colors.white),),
                  ],
                ),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      WardrobePage()));
                }
            ),
          ]
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
            ],
          ),
        ),
      ),
    );
  }
}
