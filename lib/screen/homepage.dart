import 'package:cometochange/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  static const routeName = '/homepage';

  final User user;

  const Homepage({Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}
class _HomepageState extends State<Homepage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  //Explicit
  //Method
  
  Widget signOutButton(){
  return IconButton(
    icon: Icon(Icons.exit_to_app),
    tooltip: 'Login Out',
    onPressed: (){
      myAlert();
    },
  );
}

void myAlert(){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are You Sure?'),
        content: Text('Do You Want Sign Out?'),
        actions: <Widget>[cancelButton(),okButton()],
      );
    }
  );
}

  Future<void> processSignOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }
  Widget okButton(){
  return FlatButton(
    child:Text('OK') ,
    onPressed: () {_signOut().whenComplete(() {
                    Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) => Home()));
                  });
                },
    
    );
}

Widget cancelButton(){
  return FlatButton(
    child: Text('Cancel'),
    onPressed: (){
      Navigator.of(context).pop();
    },
  );
}

 Widget postText() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.add,
          color: Colors.grey,
        ),
        labelText: 'Post',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget imgButton() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.perm_camera_mic),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.note_add),
          onPressed: () {},
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.orange[800],
        actions: <Widget>[signOutButton()],
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          postText(),
          imgButton(),
        ],
      ),
    );
  }
  Future _signOut() async {
    await _auth.signOut();
  }
}