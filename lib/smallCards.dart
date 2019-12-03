import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';
class favRoute extends StatefulWidget
{
  @override
  favRouteState createState() => favRouteState();
}

class favRouteState extends State<favRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.13, 0.5, 0.9],
                colors: [
                  Color(0xFF1b1e44),
                  Color(0xFF2d3447),
                  Colors.red[800],

                ]
            )
        ),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                    children: <Widget>[ Container(
                        color: Colors.white10,
                        padding: EdgeInsets.only(
                            top: 35.0, left: 0.0, bottom: 8.0, right: 0.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[300],
                                  width: 3.0,
                                )
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 20, bottom: 2.0),
                            child: Column(
                              children: <Widget>[
                                Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back_ios,
                                          size: 20.0,
                                          color: Colors.redAccent,
                                        ), onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) => MyApp())
                                        );
                                      },
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("Favourites",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Futura bold",
                                            )),
                                      ],
                                    ),
//                                        addFav(0)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                    ]
                ),

  addCheck()==1?(addfav()):Text("No favourites added"),

              ],
            ),

          ),
        )

    );
  }
}

