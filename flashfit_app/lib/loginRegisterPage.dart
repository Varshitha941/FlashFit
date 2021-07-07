import 'dart:math';

import 'package:flashfit/Tools/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import 'StartUpPage.dart';


class loginRegisterPage extends StatefulWidget {
  final AuthImplementation auth;
  loginRegisterPage({this.auth,this.onSignedIn});
  final VoidCallback onSignedIn;
  @override
  _loginRegisterPageState createState() => _loginRegisterPageState();
}
enum FormType{login, register}
class _loginRegisterPageState extends State<loginRegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: new Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: new Form(
                      key: _formKey,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: createInput() + createButtons(),
                      )
                  )
              )
          )
      ),

    );
  }
  List<Widget> createInput(){
    if(_formType == FormType.login){
      return [
        SizedBox(height:50),
        logo(),
        SizedBox(height:50),
        new Text("Please enter your login details", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo)),
        SizedBox(height:10),
        new TextFormField(
          decoration: new InputDecoration(
              labelText: "Email",
              filled: true,
              fillColor: Colors.white ),
          validator: (value){
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value){
            return _email = value;
          },
        ),
        SizedBox(height:10),
        new TextFormField(
          decoration: new InputDecoration(
              labelText: "Password",
              filled: true,
              fillColor: Colors.white ),
          obscureText: true,
          validator: (value){
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value) {
            return _password = value;
          },
        ),
        SizedBox(height:20)
      ];
    } else if ( _formType == FormType.register){
      return [
        SizedBox(height:50),
        logo(),
        SizedBox(height:50),
        new Text("Please Register", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo)),
        SizedBox(height:10),
        new TextFormField(
          decoration: new InputDecoration(
              labelText: "Enter Email",
              filled: true,
              fillColor: Colors.white ),
          obscureText: false,
          validator: (value){
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value) {
            return _email = value;
          },
        ),
        SizedBox(height:10),
        new TextFormField(
          decoration: new InputDecoration(
              labelText: "Enter Password",
              filled: true,
              fillColor: Colors.white ),
          obscureText: true,
          validator: (value){
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value) {
            return _password = value;
          },
        ),
        SizedBox(height:10),
        new TextFormField(
          decoration: new InputDecoration(
              labelText: "Re-Enter Password",
              filled: true,
              fillColor: Colors.white ),
          obscureText: true,
          validator: (value){
            return value.isEmpty ? 'Password is required' : null;
          },
        ),
        SizedBox(height:20)
      ];
    }
  }
  List<Widget> createButtons(){
    if(_formType == FormType.login){
      return[
        new Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: signIn,
              color: Colors.blueGrey,
              child: Text('Login', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16 )),
            )
        ),
        SizedBox(height:10),

        new FlatButton(
            onPressed: moveToRegister,
            child: Text('No account? Register',style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold
            )))
      ];
    } else {
      return[
        new Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: signUp,
              color: Colors.blueGrey,
              child: Text('Register', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16 )),
            )
        ),
        SizedBox(height:10),

        new FlatButton(
            onPressed: moveToLogin,
            child: Text('Have account? Login', style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold
            )))
      ];
    }
  }
  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        showDialog(context: context,
            barrierDismissible: false,
            builder:(BuildContext context){
              return Center(
                child: Opacity(opacity: 1.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.blueGrey),
                  ),),
              );
            });

            new Future.delayed(new Duration(milliseconds: 300),
                ()async {
                  String userId = await widget.auth.SignIn(
                      _email, _password);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      StartUpPage(auth: Auth(),)));
                });
      }
      catch(e){print("Error" + e.toString());}
    }
  }

  void signUp() async {
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      try{
        String userId = await widget.auth.SignUp(
            _email, _password);
            if(userId == userId){
              showDialog(context: context,
                  barrierDismissible: false,
                  builder:(BuildContext context){
                    return Center(
                      child: Opacity(opacity: 1.0,
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Colors.blueGrey),
                        ),),
                    );
                  });
              Toast.show("Registration Successful", context,
              duration: Toast.LENGTH_LONG);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  loginRegisterPage(auth: Auth(),)));
            }
      }
      catch(e){print("Error" + e.toString());}
    }

  }

  Widget logo(){
    return new Hero(tag: 'hero',
        child: new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100,
          child: Image.asset('images/logo.jpg'),
        ));
  }

  Future<bool> onBackPressed(){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext){
          return AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Are you sure you want to exit?'),
            actions: <Widget> [
              FlatButton(
                child: Text("Yes"),
                onPressed: (){SystemNavigator.pop();},),
              FlatButton(
                child: Text("No"),
                onPressed: (){Navigator.of(context).pop();},)
            ],
          );
        });
    return Future.value(true);
  }
}