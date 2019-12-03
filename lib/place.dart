//import 'package:bhaktapur_tourism/gmap.dart';
//import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:bhaktapur_tourism/smallCards.dart';
//
//import 'data.dart';
//
//class places extends StatefulWidget {
//  @override
//  _placesState createState() => new _placesState();
//}
//
//class _placesState extends State<places> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return SafeArea(
//      child: Scaffold(
//        body: Carousel(
//          boxFit: BoxFit.cover,
//          images: [
//            AssetImage('assets/natapol.png'),
//            AssetImage('assets/durbar-square.jpg'),
//            AssetImage('assets/pilot-baba.jpg'),
//            AssetImage('assets/siddha-pokhari.jpg'),
//          ],
//          animationCurve: Curves.fastLinearToSlowEaseIn,
//          animationDuration: Duration(milliseconds: 4000),
//          dotColor: Colors.redAccent[200],
//          dotSpacing: 35.0,
//          dotBgColor: Colors.transparent.withOpacity(0.15),
//        ),
//      ),
//    );
//  }15
//}
//
//class durbar_square extends StatefulWidget {
//  @override
//  _durbar_squareState createState() => new _durbar_squareState();
//}
//
//class _durbar_squareState extends State<durbar_square> {
//  pressed() {
//    bool newVal;
//    if (isPressed) {
//      newVal = false;
//      remove = newVal;
//    } else {
//      newVal = true;
//      remove = newVal;
//    }
//    setState(() {
//      isPressed = newVal;
//      remove = newVal;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return SafeArea(
//      child: Scaffold(
//        resizeToAvoidBottomPadding: false,
//        body: SingleChildScrollView(
//            child: Column(
//          children: <Widget>[
//            Container(
//                height: 300,
//                child: Carousel(
//                  boxFit: BoxFit.cover,
//                  images: [
//                    AssetImage('assets/natapol.png'),
//                    AssetImage('assets/durbar-square.jpg'),
//                    AssetImage('assets/pilot-baba.jpg'),
//                    AssetImage('assets/siddha-pokhari.jpg'),
//                  ],
//                  animationCurve: Curves.fastLinearToSlowEaseIn,
//                  animationDuration: Duration(milliseconds: 4000),
//                  dotColor: Colors.redAccent[200],
//                  dotSpacing: 35.0,
//                  dotBgColor: Colors.transparent.withOpacity(0.15),
//                )),
//            Container(
//              child: Padding(
//                padding:
//                    const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 20.0),
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 0.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Text("Bhaktapur Durbar Square",
//                              textAlign: TextAlign.start,
//                              style: TextStyle(
//                                color: Colors.grey[800],
//                                fontSize: 15.0,
//                                fontFamily: "Futura Heavy",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                        ],
//                      ),
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Wrap(direction: Axis.vertical, children: <Widget>[
//                          Text(
//                              "Bhaktapur Durbar Square is the royal palace of the old ",
//                              style: TextStyle(
//                                color: Colors.grey[600],
//                                fontSize: 13.0,
//                                fontFamily: "Futura Light",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                          Text(
//                              "Bhaktapur Kingdom, 1400 meters above sea level. It is a ",
//                              style: TextStyle(
//                                color: Colors.grey[600],
//                                fontSize: 13.0,
//                                fontFamily: "Futura Light",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                          Text(
//                              "UNESCO World Heritage Site. The Bhaktapur Durbar Square.",
//                              style: TextStyle(
//                                color: Colors.grey[600],
//                                fontSize: 13.0,
//                                fontFamily: "Futura Light",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                          Text(
//                              "is the located in the current town of Bhaktapur.",
//                              style: TextStyle(
//                                color: Colors.grey[600],
//                                fontSize: 13.0,
//                                fontFamily: "Futura Light",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                        ]),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 20.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Text("Explore Nearby",
//                              textAlign: TextAlign.start,
//                              style: TextStyle(
//                                color: Colors.grey[800],
//                                fontSize: 15.0,
//                                fontFamily: "Futura Heavy",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      width: 500,
//                      height: 230,
//                      child: Padding(
//                        padding: EdgeInsets.all(8.0),
//                        child: ListView(
//                          padding: EdgeInsets.only(top: 5.0, left: 10.0),
//                          scrollDirection: Axis.horizontal,
//                          children: <Widget>[
//                            Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Container(
//                                  width: 160.0,
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(20.0),
//                                    boxShadow: <BoxShadow>[
//                                      BoxShadow(
//                                        color: Colors.grey,
//                                        offset: Offset(0.5, 1.0),
//                                        blurRadius: 5.0,
//                                      )
//                                    ],
//                                    color: Colors.white,
//                                  ),
//                                  child: Column(
//                                    children: <Widget>[
//                                      Flexible(
//                                        child: Container(
//                                          child: ClipRRect(
//                                            borderRadius: BorderRadius.only(
//                                                topLeft: Radius.circular(20.0),
//                                                topRight:
//                                                    Radius.circular(20.0)),
//                                            child: Image(
//                                              image: AssetImage(
//                                                  'assets/durbar-square.jpg'),
//                                              fit: BoxFit.cover,
//                                            ),
//                                          ),
//                                        ),
//                                        flex: 2,
//                                        fit: FlexFit.tight,
//                                      ),
//                                      Flexible(
//                                        child: Container(
//                                          child: SingleChildScrollView(
//                                            child: Column(
//                                              children: <Widget>[
//                                                Padding(
//                                                  padding:
//                                                      const EdgeInsets.only(
//                                                          top: 8.0),
//                                                  child: Text(
//                                                    hotspots[0],
//                                                    style: TextStyle(
//                                                      fontSize: 13.0,
//                                                    ),
//                                                  ),
//                                                ),
//                                                Row(
//                                                  mainAxisAlignment:
//                                                      MainAxisAlignment
//                                                          .spaceEvenly,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      'Culture',
//                                                      style: TextStyle(
//                                                        color: Colors.grey[600],
//                                                      ),
//                                                    ),
//                                                    IconButton(
//                                                      icon: new Icon(isPressed
//                                                          ? Icons.favorite
//                                                          : Icons
//                                                              .favorite_border),
//                                                      onPressed: () {
//                                                        pressed();
//                                                      },
//                                                      iconSize: 20.0,
//                                                      color: Colors.pink,
//                                                    ),
//                                                  ],
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                        flex: 1,
//                                        fit: FlexFit.loose,
//                                      ),
//                                    ],
//                                  ),
//                                )),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 20.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Text("Can't find a Way ?",
//                              textAlign: TextAlign.start,
//                              style: TextStyle(
//                                color: Colors.grey[800],
//                                fontSize: 15.0,
//                                fontFamily: "Futura Heavy",
////                          fontWeight:FontWeight.w100,
//                                letterSpacing: 0.5,
//                              )),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: MyMap(),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            MyMap(),
//          ],
//        )),
//      ),
//    );
//  }
//}
