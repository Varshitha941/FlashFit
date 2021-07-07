import 'package:flashfit/Tools/Authentication.dart';
import 'package:flutter/material.dart';
import '../StartUpPage.dart';
import '../loginRegisterPage.dart';

class Mapping extends StatefulWidget {
  final AuthImplementation auth;
  Mapping({this.auth});

  @override
  State<StatefulWidget> createState() => _MappingState();
}

enum AuthStatus{notSignedIn, signedIn,}

class _MappingState extends State<Mapping> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.getCurrentUser().then((fireBaseUserId){
      setState(() {
        authStatus = fireBaseUserId == null? AuthStatus.notSignedIn :
        AuthStatus.signedIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }
  void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus){
      case AuthStatus.notSignedIn:
        return new loginRegisterPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );

      case AuthStatus.signedIn:
        return new StartUpPage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }
}

