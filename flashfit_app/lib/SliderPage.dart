import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Tools/Authentication.dart';
import 'Tools/Mapping.dart';
import 'loginRegisterPage.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Carousel(
        showIndicator: false,
        animationDuration: Duration(milliseconds: 500),
        images: [
          AssetImage('images/slider1.png'),
          AssetImage('images/slider2.png'),
          AssetImage('images/slider3.png')
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(context: context,
              barrierDismissible: false,
              builder:(BuildContext context){
                return Center(
                  child: Opacity(opacity: 1.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.indigo),
                    ),),
                );
              });
              Timer(Duration(milliseconds: 500), ()=> Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  Mapping(auth: Auth(),))));

        },
        label: Text('Start'),
        icon: Icon(Icons.arrow_right),
        backgroundColor: Colors.indigo,
        elevation: 10,),
    );
  }
}