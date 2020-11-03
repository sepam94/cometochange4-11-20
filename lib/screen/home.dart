import 'package:cometochange/screen/login.dart';
import 'package:cometochange/screen/launcher.dart';
import 'package:cometochange/screen/register.dart';
import 'package:cometochange/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Method

   @override
  void initState(){
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var user = firebaseAuth.currentUser;
    if (user != null){ 
    }
    
  }


  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'come to cahange',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontFamily: 'Prompt',
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.blue.shade300,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click Login');
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Login());
        Navigator.of(context).push(route);
      },
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.green.shade300,
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
       print('You Click Register'); MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Register());
        Navigator.of(context).push(route);
      },
    );
  }

  Widget showButton() {
    return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      signInButton(),
      SizedBox(
        width: 4.0,
      ),
      signUpButton(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().showLogo(),
              MyStyle().showAppName(),
              SizedBox(
                height: 8.0,
              ),
              showButton(),
            ],
          ),
        ),
      )),
    );
  }
}
