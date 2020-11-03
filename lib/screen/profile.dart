import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class Profile extends StatefulWidget {
    static const routeName = '/Profile';
 
    @override
    State<StatefulWidget> createState() {
        return _ProfileState();
    }
}
 
class _ProfileState extends State<Profile> {
  String login = '...';

  //method
  @override
  void initState(){
    super.initState();

  }
  Future<void> findDisplayName()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var login = firebaseAuth.currentUser;
    print('login = $login');
  }

  
Widget showLogin() {
    return Text('Login by $login');
  }
  Widget showAppName() {
    return Text(
      'come to change',
      style: TextStyle(
        color: Colors.black87,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }
  Widget showHead() {
    return Drawer(
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          SizedBox(height: 6.0),
          showLogin(),
        ],
      ),
    );
  }
 
    @override
    Widget build(BuildContext context) {
 
        return Scaffold(
            appBar: AppBar(
                title: Text('Profile'),
                backgroundColor: Colors.orange[800]
            ),
            body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              showLogin(),
            ],
          ),
        ),
      ),
        );
    }
}