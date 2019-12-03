import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>
{
  @override
  Widget build(BuildContext center)
  {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE53935),
                  Color(0xFFF44336),
                  Color(0xFFEF5350),
                ],stops:[0.1,0.4,0.7,0.9],
              )
            ),
          )
        ],
      ),
    );
  }

}