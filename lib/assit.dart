import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'main.dart';

class Assit extends StatefulWidget {
  @override
  AssitState createState() => AssitState();
}

class AssitState extends State<Assit> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText = "";
  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
        (bool result) => setState(() => _isAvailable = result));
    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isAvailable = true),
    );
    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );
    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

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
                                              builder: (context) => MyApp()),
                                        );
                                      },
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("Assistant",
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
                      )),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                    FloatingActionButton(
//                      child: Icon(Icons.cancel),
//                      mini: true,
//                      backgroundColor: Colors.deepOrange,
//                                      onPressed:
//                      (){
//                        if(_isListening)
//                          _speechRecognition.cancel().then((result) => setState(() { _isListening =result;resultText ="";}),);
//
//                       },
//                    ),

//
//                                    FloatingActionButton(
//                                      child: Icon(Icons.mic),
//                                      backgroundColor: Colors.pink,
//                                      onPressed:
//                          (){
//                        if (_isAvailable && !_isListening)
//                          _speechRecognition.listen(locale: "en_US").then((result) => print('$result'));
//                      },
//                                    ),
//                                    FloatingActionButton(
//                                      child: Icon(Icons.stop),
//                                      mini: true,
//                                      backgroundColor: Colors.deepPurple,
//                                      onPressed:
//                          (){
//                        if(_isListening)
//                          _speechRecognition.stop().then((result) => setState(() => _isListening =result),);
//                      },
//                                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent[100],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Text(resultText),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
