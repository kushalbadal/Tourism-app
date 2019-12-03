import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';
import 'smallCards.dart';

class hDesign extends StatefulWidget
{

  @override
  _hDesignState createState() => new _hDesignState();

}

class _hDesignState extends State<hDesign>{


  pressed(var fav) {
    var newVal;
    if(isPressed[fav]==1) {
      newVal = 0;

    } else {
      newVal = 1;
    }
    setState((){
      isPressed[fav] = newVal;
      Navigator.push(context, MaterialPageRoute(builder: (context) => favRoute(),
      )
      );

    });
  }


  @override
  Widget build(BuildContext context)
  {
    return   Container(
      width: 500,
      height: 700,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
        scrollDirection: Axis.vertical,
          children: <Widget>[
//            j<7?

            isPressed[0] == 1 ?

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow:<BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 1.0),
                        blurRadius:5.0,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(

                        child:Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                            child: Image(
                              image:AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child:Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child:
                                  Text(
                                    hotspots[0],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away',style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon( isPressed[0]==1 ? Icons.favorite:Icons.favorite_border),
                                      onPressed:(){
                                        pressed(0);
                                      },

                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ):Text(""),



        isPressed[1] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[1],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[1] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(1);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :Text("")
    ,

            isPressed[2] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[2],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[2] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(2);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[3] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[3],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[3] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(3);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[4] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[4],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[4] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(4);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[5] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[5],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[5] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(5);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[6] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[6],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[6] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(6);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[7] == 1 ?

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow:<BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 1.0),
                        blurRadius:5.0,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(

                        child:Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                            child: Image(
                              image:AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child:Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child:
                                  Text(
                                    hotspots[7],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away',style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon( isPressed[7]==1 ? Icons.favorite:Icons.favorite_border),
                                      onPressed:(){
                                        pressed(7);
                                      },

                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ):Text(""),



            isPressed[8] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[8],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[8] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(8);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :Text("")
            ,

            isPressed[9] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[9],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[9] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(9);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[10] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[10],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[10] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(10);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[11] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[11],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[11] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(11);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[12] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[12],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[12] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(12);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

            isPressed[13] == 1 ?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(

                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child:
                                  Text(
                                    hotspots[13],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('$dist$KM away', style: TextStyle(
                                      color: Colors.grey[600],
                                    ),),


                                    IconButton(
                                      icon: new Icon(isPressed[13] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed(13);
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
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


                )
            ) :
            Text(""),

          ],
        ),
      ),


    );




  }
}

