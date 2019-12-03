import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';
class hotSpots extends StatefulWidget
{
  @override
  hotSpotsState createState() => hotSpotsState();
}

class hotSpotsState extends State<hotSpots> {
  pressed(var fav) {
    var newVal;
    if(isPressed[fav]==1) {
      newVal = 0;

    } else {
      newVal = 1;
    }
    setState((){
      isPressed[fav] = newVal;


    });
  }

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
                                        Text("Hotspots",
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

          Container(
            width: 500,
            height: 700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: <Widget>[

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
                  ),

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
                                          hotspots[1],
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
                                            icon: new Icon( isPressed[1]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[2],
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
                                            icon: new Icon( isPressed[2]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[3],
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
                                            icon: new Icon( isPressed[3]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[4],
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
                                            icon: new Icon( isPressed[4]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[5],
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
                                            icon: new Icon( isPressed[5]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),

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
                                          hotspots[6],
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
                                            icon: new Icon( isPressed[6]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                  ),

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
                                          hotspots[8],
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
                                            icon: new Icon( isPressed[8]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[9],
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
                                            icon: new Icon( isPressed[9]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[10],
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
                                            icon: new Icon( isPressed[10]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[11],
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
                                            icon: new Icon( isPressed[11]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
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
                                          hotspots[12],
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
                                            icon: new Icon( isPressed[12]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),

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
                                          hotspots[13],
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
                                            icon: new Icon( isPressed[13]==1 ? Icons.favorite:Icons.favorite_border),
                                            onPressed:(){
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
                  ),
                ],
              ),
            ),


          ),


          ],
            ),

          ),
        )

    );
  }
}

