import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'smallCards.dart';
import 'addfavss.dart';
List<String> images = [
  "assets/siddha-pokhari.jpg",
  "assets/pilot-baba.jpg",
  "assets/religious-places.jpg",
  "assets/natapol.png",
];
List<String> hotspots = [
  "Bhaktapur Durbar Square",
  "Pilot Baba",
  "Changu Narayan",
  "Ghampe Dada",
  "Nagarkot",
  "Ranikot",
  "Siddha Pokhari",
  "Doleshwor Mahadev Temple",
  "Sanga",
  "Ananta Lingeshwor Temple",
  "Taleju Bhabani",
  "Subarneshwor Mahadev Than",
  "Pottery Square",
  "Nala Ghumba"
] ;
List<String> title = [
  "Siddha Pokhari",
  "Pilot Baba",
  "Durbar Square",
  "Natapol Temple",
];
//Favouties Places
List<String> categories = [
  "Hotel",
  "Religious Places",
  "Famous Temples",
  "For Trekking",
] ;
List<String> catimages = [
  "assets/stay.jpg",
  "assets/treeking.jpg",
  "assets/restaurants.jpg",
  "assets/relgious-places.jpg"
];
List<String> favourites = [
  "Nagarkot",
  "Changu Narayan",
  "Pilot Baba",
  "Ghampe Dada",
] ;
var isPressed = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var i;
addCheck(){
  for(var i=0;i<14;i++) {
    if (isPressed[i]==1) {
      return(1);
    }
  }
}
var checklog = 1;
var dist = 1.5;
var KM = 'Km';

class addfav extends StatefulWidget
{

  @override
  _addfavState createState() => new _addfavState();

}

class _addfavState extends State<addfav> {

  @override
  Widget build(BuildContext context) {


      return Container(

        child:
        hDesign(),


      );

}}


enum place{
  Bhaktapur_Durbar_Square,
  Pilot_Baba
}
