import 'blogHome.dart';
import 'data.dart' ;
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'dart:async';
import 'main.dart';
import 'MappingUser.dart';
import 'loginRegister.dart';
import 'data.dart';
import 'blogHome.dart';

class MapPage extends StatefulWidget
{
  final AuthImplementation auth;
  MapPage
      ({
    this.auth,
  });
  State<StatefulWidget> createState()
  {
    return MapPageState();
  }
}

enum AuthStatus
{
  notDetermined,
  notSignedIn,
  signedIn,
}
class MapPageState extends State<MapPage>
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
        return new MappingPage(
          auth: Auth(),
        );

      case AuthStatus.signedIn:
          return new HomPage(
            auth: widget.auth,
            onSignedOut: _signedOut,
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
class HomPage extends StatefulWidget
{
  HomPage({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  @override
  State<StatefulWidget> createState()
  {
    return HomPageState();
  }
}
class HomPageState extends State<HomPage>
{

   void logoutUser() async
   {
     try{
          await widget.auth.signOut();
          widget.onSignedOut();
     }
     catch(e)
     {
        print(e.toString());
     }
   }


  @override
//   void logout() {
  Widget build(BuildContext context) {
//
//       // TODO: implement build
    return Scaffold(
         body: new Container(

         ),
         bottomNavigationBar: new BottomAppBar(
           color: Colors.red,
           child: new Container(
             margin: const EdgeInsets.only(left: 70.0, right: 70.0),
             child: new Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 IconButton(
                   icon: Icon(Icons.assignment_turned_in), onPressed: logoutUser,
                   iconSize: 50,
                   color: Colors.white,
                 ),
                 IconButton(icon: Icon(Icons.cancel), onPressed:() {MyApp();},
                   iconSize: 50,
                   color: Colors.white,
                 )
               ],
             ),
           ),
         ),
    );
  }
}
