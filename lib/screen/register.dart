import 'package:cometochange/screen/launcher.dart';
import 'package:cometochange/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit

  final formKey = GlobalKey<FormState>();
  String nameString,
      genderString,
      facultyString,
      majorString,
      telephoneString,
      emailString,
      passwordString,
      chooseType;

  //Method
  Widget registerButton() {
    return IconButton(
        icon: Icon(Icons.done),
        onPressed: () {
          print('You Click Upload');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(
                'name = $nameString, gender = $genderString, faculty = $facultyString, major = $majorString, telephone = $telephoneString, email = $emailString, password = $passwordString');
            registerThread();
          }
        });
  }

  Future<void> registerThread() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    await Firebase.initializeApp(
        name: 'SecondaryApp',
        options: const FirebaseOptions(
            appId: 'my_appId',
            apiKey: 'my_apiKey',
            messagingSenderId: 'my_messagingSenderId',
            projectId: 'my_projectId'));
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email= $emailString');
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title,message = $message');
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    var user = firebaseAuth.currentUser;
    if (user != null) {
      user.updateProfile(displayName: nameString);

      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Launcher());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Name :',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your Name.',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name in the Blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget maleRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Male',
                  groupValue: chooseType,
                  onChanged: (value) => {
                    setState(() {
                      chooseType = value;
                    })
                  },
                ),
                Text(
                  'Male',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

      Widget femaleRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Female',
                  groupValue: chooseType,
                  onChanged: (value) => {
                    setState(() {
                      chooseType = value;
                    })
                  },
                ),
                Text(
                  'Female',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );


  Widget facultyText() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.book),
          labelText: 'Faculty :',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          helperText: 'Type Your Faculty.',
          helperStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Your Name in the Blank';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          facultyString = value.trim();
        });
  }

  Widget majorText() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.import_contacts),
          labelText: 'Major :',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          helperText: 'Type Your Major.',
          helperStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Your Name in the Blank';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          majorString = value.trim();
        });
  }

  Widget telephoneText() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.phone_android),
          labelText: 'Telephone :',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          helperText: 'Type Your Telephone Number.',
          helperStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Fill Your Name in the Blank';
          } else {
            return null;
          }
        },
        onSaved: (String value) {
          telephoneString = value.trim();
        });
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.mail_outline),
        labelText: 'E-mail :',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your E-mail',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email in Exp. you@email.com';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password :',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type Your Password more 6 Charactor',
        helperStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[registerButton()],
        backgroundColor: Colors.orange[800],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameText(),
            maleRadio(),
            femaleRadio(),
            facultyText(),
            majorText(),
            telephoneText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
