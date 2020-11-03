import 'package:flutter/material.dart';

class MyStyle{

  Color darkColor = Colors.black54;

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

  MyStyle();
}