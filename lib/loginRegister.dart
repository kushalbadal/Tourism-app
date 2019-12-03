import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'blogHome.dart';
import 'Authentication.dart';
import 'MappingUser.dart';
class LoginRegisterPage extends StatefulWidget
{
  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
});
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
//  final VoidCallback onSignedOut;
  State<StatefulWidget> createState()
  {
    return _LoginResiterState();
  }
}

enum FormType
{
  login,
  register
}

class _LoginResiterState extends State<LoginRegisterPage> {
  //code
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  bool validateAndSave()
  {
    final form = formKey.currentState;
    if(form.validate())
      {
        form.save();
        return true;
      }
    else
      {
        return false;
      }
  }
  //for Firebase
  void validateAndSubmit() async
  {
    if(validateAndSave())
      {
        try{
          if(_formType == FormType.login)
            {
              String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
              print("Login userId = " + userId);
            }
          else
            {
              String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
              print("Register userId = " + userId);
            }
          widget.onSignedIn();
        }

        catch(e){
         Dialog errorDialog =  Dialog(
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
                                    padding: EdgeInsets.only(left:30.0,right:30.0,top: 10.0,bottom: 5.0),
                                  child: Text("Error occured !",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.red[900],
                                  ),
                                  )

                                ),
                                Padding(padding: EdgeInsets.only(top:10.0,left: 30.0,right: 30.0,bottom: 15.0),
                                    child:Text("${e.toString()}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    )
                                ),

                              ],
                            ),
                  ],
              ),
            ),
          );
          showDialog(context: context, builder: (BuildContext context) => errorDialog );
    print("Error occured = " + e.toString());
        }
      }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
          _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  //design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration:BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.13,0.4,0.8,0.9],
                colors: [
                  Colors.red[900].withOpacity(0.825),
                  Colors.red[800],
                  Colors.red[900],
                  Colors.red[900]

                ]
            )
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
                decoration: BoxDecoration(
//                  image: DecorationImage(
//                   image: AssetImage('assets/bg.png'),
//                    fit: BoxFit.cover,
//                  ),
    ),
              ),
          ),
         Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: createInputs() + createButtons(),
                ),
              )
          ),
        ],

      ),
    );
  }

  List<Widget> createInputs() {
    return
      [
        SizedBox(height: 10.0,),
        logo(),
        SizedBox(height: 20.0,),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
               children:<Widget>[ Text(
                  "Welcome Back",style: TextStyle(
                    color: Colors.white,fontSize: 56.0,
                    fontFamily:'LittleLord'
                ),
                ),
                Text(
                  "Login with your account ",style: TextStyle(
                    color: Colors.white,fontSize: 14.0,fontFamily:'Futura-book'
                ),
              ),]

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:5.0,top: 15.0),

              child: TextFormField(

                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,

                  fillColor: Colors.white.withOpacity(0.33),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0),
                    child: Icon(Icons.email,color: Colors.white,),
                  ),
                  labelText: 'Email',
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelStyle:TextStyle(
    color: Colors.white.withOpacity(0.8),fontSize: 17.0,
    ),
                hoverColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all((Radius.circular(50.0))),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.4),
                    )
                  ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.all((Radius.circular(25.0))),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                validator:(value)
                {
                  return value.isEmpty ? 'Email is required.' : null;
                },
                onSaved: (value)
                {
                  return _email = value;
                },

              ),
            ),
          ],
        ),
        SizedBox(height: 10.0,),



        Padding(
          padding: const EdgeInsets.only(bottom:15.0),
          child: TextFormField(

            style: TextStyle(
                color: Colors.white,
            ),

            cursorColor: Colors.white,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0),
                child: Icon(Icons.vpn_key,color: Colors.white,),
              ),
              labelText: 'Password',
              errorStyle: TextStyle(
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.33),
              labelStyle:TextStyle(
                color: Colors.white,fontSize: 17.0,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all((Radius.circular(50.0))),
                  gapPadding: 13.0,
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.4)
                  )
              ),


              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all((Radius.circular(25.0))),
                  borderSide: BorderSide(
                  )
              ),
            ),
            obscureText: true,
            validator:(value)
            {
              return value.isEmpty ? 'Password is required.' : null;
            },
            onSaved: (value)
            {
              return _password = value;
            },
          ),
        ),
        SizedBox(height: 20.0,),

      ];
  }

  Widget logo() {
    return Hero(
        tag: 'hero',
        child: Column(
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30.0,
              child: Image.asset('assets/logoWhite.png', fit: BoxFit.contain,),
            ),
          ],
        )
    );
  }

  List<Widget> createButtons() {
      if(_formType == FormType.login)
        {
          return
            [
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: RaisedButton(onPressed:(){ validateAndSubmit();},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color:Colors.white.withOpacity(0.3),
                            ),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Login",
                            style: TextStyle(fontSize: 20.0,),
                          ),
                        ), textColor: Colors.red[700],
                        color: Colors.white.withOpacity(0.95),
                      ),
                  ),


              FlatButton(
                onPressed: moveToRegister,
                child: Text("Create Account?",
                  style: TextStyle(fontSize: 14.0,),
                ), textColor: Colors.red[200],
              ),
                ],
              ),
            ];
        }
      else
        {
          return
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(onPressed: validateAndSubmit,
                  padding: EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color:Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Text("Create Account",
                    style: TextStyle(fontSize: 18.0,),
                  ), textColor: Colors.red[700],
                  color: Colors.white.withOpacity(0.95),
                ),
              ),
              FlatButton(
                onPressed: moveToLogin,
                child: Text("Already have Account? Login",
                  style: TextStyle(fontSize: 13.0,),
                ), textColor: Colors.red[200],
              ),
            ];
        }
  }

}