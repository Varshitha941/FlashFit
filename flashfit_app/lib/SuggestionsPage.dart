import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashfit/FiltersPage.dart';
import 'package:flutter/material.dart';

import 'StartUpPage.dart';

class SuggestionsPage extends StatelessWidget {
  String _Gender;
  String _Age;
  String _Occasion;
  SuggestionsPage(this._Gender,this._Age,this._Occasion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Outfits", style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            new FlatButton(
                color: Colors.indigoAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    Icon(Icons.dehaze,color: Colors.white),
                    Text("Filters",style: TextStyle(color: Colors.white),),
                  ],
                ),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      FiltersPage()));
                }
            ),
            new FlatButton(
                color: Colors.blue,
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
      body: StreamBuilder(
        stream: Firestore.instance.collection('${_Gender},${_Age},${_Occasion}').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Text('Loading');
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot my_collection = snapshot.data.documents[index];
                return SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 470,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  width: 300,
                                  height: 450,
                                  child: Image.network(
                                    '${my_collection['image']}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
