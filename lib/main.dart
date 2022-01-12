import 'data.dart';
import 'hDesign.dart';
import 'flutterUpload.dart';
import 'package:bhaktapur_tourism/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'hDesign.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'loginRegister.dart';
import 'MappingUser.dart';
import 'blogHome.dart';
import 'hosts.dart';
import 'logoutuser.dart';
import 'Authentication.dart';
import 'package:bhaktapur_tourism/allHotspots.dart';
import 'addfavss.dart';
import 'smallCards.dart';
// import 'blogHome.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  var themeData = ThemeData(
      primaryColor: Colors.red, accentColor: Colors.red[800].withOpacity(0.8));
  runApp(
    MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => //print("Hello"),
          runApp(MaterialApp(
        home:
         MappingPage(
           auth: Auth(),
         ),
        debugShowCheckedModeBanner: false,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.13,
                    0.4,
                    0.8,
                    0.9
                  ],
                  colors: [
//                      Colors.pinkAccent[400].withOpacity(0.9),
//                      Colors.red[800].withOpacity(0.9),
//                      Colors.red[800],
//                      Colors.red[900]
                    Colors.red[600].withOpacity(0.9),
                    Colors.red[800],
                    Colors.red[900],
                    Colors.red[900]
                  ]),
            ),
            child: Opacity(
              opacity: 0.25,
              child: Image(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ImageIcon(
                          AssetImage(
                            'assets/logoWhite.png',
                          ),
                          color: Colors.white,
                          size: 65.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                    ),
                    Text("Explore and \n have Fun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        )),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Posts> postList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("Posts");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]['image'],
          DATA[individualKey]['description'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
        );
        postList.add(posts);
      }
      setState(() {
        print("Length : $postList.length");
      });
    });
  }

  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      Dialog errorDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          width: 300,
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10.0, bottom: 5.0),
                      child: Text(
                        "Error!",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.red[900],
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 30.0, right: 30.0, bottom: 15.0),
                      child: Text(
                        "${e.toString()}",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
      showDialog(
          context: context, builder: (BuildContext context) => errorDialog);
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
//            Color(0xFF1b1e44),
//            Color(0xFF2d3447),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.white30,
                  padding: EdgeInsets.only(
                      top: 35.0, left: 0.0, bottom: 10.0, right: 0.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.black45,
                            width: 0.6,
                          )),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Welcome to Bhaktapur,",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Futura bold",
                                      )),
                                  Text("Krishna",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Futura bold",
                                      )),
                                ],
                              ),
                              new Container(
                                width: 28.0,
                                height: 28.0,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(90.0),
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            "https://imgur.com/BoN9kdC.png"))),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "The Kingdom of Temples",
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, left: 20.0, bottom: 8.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Trending",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30.0,
                          fontFamily: "Futura Heavy",
//                          fontWeight:FontWeight.w100,
                          letterSpacing: 0.5,
                        )),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13.0,
                      ),
                    )
                  ],
                ),
              ),
              //container_padding
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("Religious Places",
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Futura-Book",
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("12+ Places",
                        style: TextStyle(
                          color: Colors.teal[200],
                          fontWeight: FontWeight.w400,
                        ))
                  ],
                ),
              ),
              ImageCarousel(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Hotspots",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30.0,
                          fontFamily: "Futura Heavy",
//                          fontWeight:FontWeight.w100,
                          letterSpacing: 0.5,
                        )),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hotSpots(),
                            ));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 13.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              hDesigns(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Categories",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30.0,
                          fontFamily: "Futura Heavy",
//                          fontWeight:FontWeight.w100,
                          letterSpacing: 0.5,
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 425,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.5, 1.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    child: Image(
                                      image: AssetImage('assets/choela.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                flex: 5,
                                fit: FlexFit.tight,
                              ),
                              Flexible(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Experiences",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                                fit: FlexFit.loose,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.5, 1.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/durbar-square.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                flex: 5,
                                fit: FlexFit.tight,
                              ),
                              Flexible(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Religious Place",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                                fit: FlexFit.loose,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.5, 1.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    child: Image(
                                      image: AssetImage('assets/treeking.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                flex: 5,
                                fit: FlexFit.tight,
                              ),
                              Flexible(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Adventures",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                                fit: FlexFit.loose,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.5, 1.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    child: Image(
                                      image: AssetImage('assets/stay.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                flex: 5,
                                fit: FlexFit.tight,
                              ),
                              Flexible(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            "Stays",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                flex: 1,
                                fit: FlexFit.loose,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Travel Packages",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30.0,
                          fontFamily: "Futura Heavy",
//                          fontWeight:FontWeight.w100,
                          letterSpacing: 0.5,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 550,
                height: 415,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2.0, right: 2.0, bottom: 15.0),
                  child: postList.length == 0
                      ? Text("No Hosting Found")
                      : new ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (_, int index) {
                        return HostsUI(
                          postList[index].image,
                          postList[index].description,
                          postList[index].date,
                          postList[index].time,
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black87,
                  size: 28.0,
                ),
                onPressed: null),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black87,
                  size: 28.0,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => favRoute(),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.black87,
                  size: 28.0,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UploadPhotoPage();
                  }));
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: IconButton(
                icon: Icon(
                  Icons.face,
                  color: Colors.black87,
                  size: 28.0,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settingRoute()));
                }),
          )
        ],
      ),
    );
  }
}
Widget HostsUI(String image, String description, String date, String time) {
  return new Card(
      color: Colors.white,
      elevation: 0.1,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  opacity: 0.5,
                ),
                Opacity(
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  opacity: 0.5,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: [
                Center(

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(),
                    )),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1.3),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ));
}


class settingRoute extends StatefulWidget {
  @override
  _settingRouteState createState() => _settingRouteState();
}

class _settingRouteState extends State<settingRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.13,
                  0.5,
                  0.9
                ],
                colors: [
                  Color(0xFF1b1e44),
                  Color(0xFF2d3447),
                  Colors.red[800],
                ])),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      color: Colors.white10,
                      padding: EdgeInsets.only(
                          top: 35.0, left: 0.0, bottom: 8.0, right: 0.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[300],
                                width: 3.0,
                              )),
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
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 20.0,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyApp()));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: new Container(
                                      width: 38.0,
                                      height: 38.0,
                                      decoration: new BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(90.0),
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  "https://imgur.com/BoN9kdC.png"))),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 15.0),
                                        child: Text("Krishna K. Shrestha",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Futura bold",
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 40.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "View Profile",
                                              style: TextStyle(
                                                color: Colors.teal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ]),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => generalSetting()));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 10.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.settings,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "General",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => generalSetting()));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "Favourites",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => generalSetting()));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.business,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "Hosting",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => generalSetting()));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.swap_horizontal_circle,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "Switch Account",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapPage(
                                auth: Auth(),
                              )));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.call_missed_outgoing,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () { },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.help,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              "Get help",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 183.0,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => generalSetting()));
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.black45,
                              width: 0.6,
                            )),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 170.0, top: 20.0, bottom: 15.0, right: 0.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "About us",
                              style: TextStyle(
                                fontFamily: "Futura Bold",
                                color: Colors.teal[400],
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

class generalSetting extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      color: Colors.white10,
                      padding: EdgeInsets.only(
                          top: 35.0, left: 0.0, bottom: 8.0, right: 0.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[300],
                                width: 3.0,
                              )),
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
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 20.0,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    settingRoute()));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text("General Settings",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Futura bold",
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ]),
                Container(
                  decoration: new BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.black45,
                          width: 0.6,
                        )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 10.0, bottom: 15.0, right: 0.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontFamily: "Futura Bold",
                            color: Colors.black87,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ImageCarousel extends StatelessWidget {
  final carousel = Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('assets/natapol.png'),
      AssetImage('assets/siddha-pokhari.jpg'),
      AssetImage('assets/pilot-baba.jpg'),
      AssetImage('assets/treeking.jpg'),
    ],
    animationCurve: Curves.fastLinearToSlowEaseIn,
    animationDuration: Duration(milliseconds: 3000),
  );

  final banner = new Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.6),
    ),
    child: Text("Sample Texts"),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        height: 385.0,
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: ClipRect(
          child: Stack(
            children: <Widget>[
              carousel,
            ],
          ),
        ),
      ),
    );
  }
}
