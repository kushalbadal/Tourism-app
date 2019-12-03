import 'package:flutter/material.dart';
import 'loginRegister.dart';
import 'blogHome.dart';
import 'Authentication.dart';

class MappingPage extends StatefulWidget
{
  final AuthImplementation auth;
  MappingPage
      ({
    this.auth,
  });
  State<StatefulWidget> createState()
  {
    return _MappingPageState();
  }
}

enum AuthStatus
{
  notDetermined,
  notSignedIn,
  signedIn,
}

class _MappingPageState extends State<MappingPage>
{
  AuthStatus authStatus = AuthStatus.notSignedIn;
  int a;
  void initState()
  {
    super.initState();
    widget.auth.getCurrentUser().then((String userId) {
      if(userId!=null) {
        a = 1;
      }
      else{
        a=0;
      }
      setState(() {
        authStatus = a== 0 ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    }).catchError((onError){
      authStatus = AuthStatus.notSignedIn;
    });

  }
  void _signedIn()
  {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }
  void _signedOut()
  {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(authStatus)
    {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return new LoginRegisterPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );

      case AuthStatus.signedIn:
        return new HomePage(
        );


    }
    return null;
  }
  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}