//import 'dart:html';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flashfit/Tools/Authentication.dart';
import 'Tools/Authentication.dart';
import 'WardrobePage.dart';

class EditWardrobe extends StatefulWidget {
  @override
  _EditWardrobeState createState() => _EditWardrobeState();
}

class _EditWardrobeState extends State<EditWardrobe> {

  File _imageFile;


  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Edit Wardrobe", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            new FlatButton(
                color: Colors.indigoAccent,
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
      body: new Column(
        children: <Widget>[
          SizedBox(height: 140),
          new Text("Please add your Outfit and Occasion", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
          SizedBox(height: 10),
          new FlatButton(
            child: Text('Open Camera', style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
            color: Colors.blueGrey,
            onPressed: () {
              _pickImage(ImageSource.camera);
            },
          ),
          Uploader(file: _imageFile),
          new FlatButton(
            child: Text('Open Gallery', style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
            color: Colors.blueGrey,
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
          ),
          Uploader(file: _imageFile),
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;



  Uploader({Key key, this.file}) : super(key: key);

  createState() => _UploaderState();
}
class _UploaderState extends State<Uploader> {
  String _occasion;
  String _person;



  var _occasions = [
    'Meeting or Interview 1','Meeting or Interview 2','Meeting or Interview 3','Meeting or Interview 4','Meeting or Interview 5',
    'Office Party 1','Office Party 2','Office Party 3','Office Party 4','Office Party 5',
    'Casual Party 1','Casual party 2','Casual Party 3','Casual Party 4','Casual Party 5',
    'Festival 1', 'Festival 2', 'Festival 3','Festival 4','Festival 5',
    'Wedding 1', 'Wedding 2','Wedding 3','Wedding 4','Wedding 5',
  ];
  var _currentItemSelected;
  final FirebaseStorage _storage =
  FirebaseStorage(storageBucket: 'gs://flashfit-7e054.appspot.com');
  StorageUploadTask _uploadTask;
  void _startUpload(fileName) {
    String filePath = 'Wardrobe/$_person/$fileName.jpg';
    if (fileName != null) {
      setState(() {
        _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      _person = user.email;
    });
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                  _occasion = _currentItemSelected;
                },
                value: _currentItemSelected,
              ),
              FlatButton.icon(
                  label: Text("Upload to Wardrobe", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                  icon: Icon(
                      Icons.add,
                      color: Colors.white
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    _startUpload(_occasion);
                    _currentItemSelected = null;
                  }
              ),

            ],
          ),
        ),
    );
  }
}
