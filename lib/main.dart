import 'package:cometochange/screen/home.dart';
import 'package:cometochange/screen/homepage.dart';
import 'package:cometochange/screen/launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
                theme: ThemeData( 
                    primaryColor: Colors.pink,
                    accentColor: Colors.purple,
                    textTheme: TextTheme(body1: TextStyle(color: Colors.red)),
                ),
                title: 'First Flutter App',
                initialRoute: '/', // สามารถใช้ home แทนได้
                home: Home(),
        );
    }
  
}
