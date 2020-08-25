import 'dart:typed_data';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashfit/FiltersPage.dart';
import 'package:flashfit/Tools/Authentication.dart';
import 'package:flashfit/loginRegisterPage.dart';
import 'package:flutter/material.dart';

import 'WardrobePage.dart';

class StartUpPage extends StatefulWidget {

  StartUpPage({this.auth,this.onSignedOut});
  final AuthImplementation auth;
  final VoidCallback onSignedOut;


  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {


  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> SignOut() async{
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("FlashFit", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            SignOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                loginRegisterPage(auth: Auth(),)));
          },
          backgroundColor: Colors.black45,
          child: Icon(Icons.power_settings_new),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  images:[
                    AssetImage("images/banner1.jpg"),
                    AssetImage("images/banner2.jpg"),
                    AssetImage("images/banner3.jpg"),
                  ],
                  autoplay: true,
                  dotBgColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 140,),
              new Center(
                child: ButtonBar(
                  children: <Widget>[
                    new Container(
                        color: Colors.transparent,
                        height: 100,
                        child: FlatButton.icon(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                FiltersPage()));
                          },
                          color: Colors.indigoAccent,
                          label: Text("   Filters   ", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20 )),
                          icon: Icon(Icons.dehaze, color: Colors.white,),
                        )
                    ),
                    SizedBox(height: 30,),
                    new Container(
                        color: Colors.transparent,
                        height: 100,
                        child: FlatButton.icon(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  WardrobePage()));
                            },
                            color: Colors.indigoAccent,
                            label: Text("Wardrobe", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20 )),
                            icon: Icon(Icons.account_balance_wallet, color: Colors.white,)
                        )
                    ),
                  ],
                  alignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        )
    );
  }
}