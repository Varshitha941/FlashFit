import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'EditWardrobe.dart';
import 'StartUpPage.dart';
import 'WardrobeFilters.dart';

class WardrobePage extends StatefulWidget {
  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  String _downloadUrl;
  String fileName;
  String _person;
  var _occasions = [
    'Meeting or Interview 1','Meeting or Interview 2','Meeting or Interview 3','Meeting or Interview 4','Meeting or Interview 5',
    'Office Party 1','Office Party 2','Office Party 3','Office Party 4','Office Party 5',
    'Casual Party 1','Casual party 2','Casual Party 3','Casual Party 4','Casual Party 5',
    'Festival 1', 'Festival 2', 'Festival 3','Festival 4','Festival 5',
    'Wedding 1', 'Wedding 2','Wedding 3','Wedding 4','Wedding 5',
  ];
  var _currentItemSelected;


  Future<dynamic> downloadImage() async {
    StorageReference _reference= FirebaseStorage.instance.ref().child('Wardrobe').child('$_person').child('$fileName.jpg');
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _downloadUrl = downloadAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      _person = user.email;
    });
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Wardrobe", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            new FlatButton(
                color: Colors.indigoAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
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
          ]
      ),
      body: Center(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              new Text("Select the Outfit you want to view",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 10),
              DropdownButton<String>(
                items: _occasions.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                hint: Text("Select an Occasion"),
                onChanged: (String newValueSelected){
                  setState(() {
                    this._currentItemSelected = newValueSelected;
                  });
                  fileName = _currentItemSelected;
                },
                value: _currentItemSelected,
              ),
              FlatButton(
                child: Text("View Outfit",style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
                color: Colors.blueGrey,
                onPressed: (){
                  downloadImage();
                },
              ),
              _downloadUrl == null? Container(
                child: Text("", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),) : Image.network(_downloadUrl),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Edit"),
          icon: Icon(Icons.edit),
          backgroundColor: Colors.indigo,
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                EditWardrobe()));
          }
      ),
    );
  }
}
