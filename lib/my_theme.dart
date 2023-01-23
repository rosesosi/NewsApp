import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightprimaryColor = Color(0xFF39A552);
  static const Color borderColor = Color(0xFF707070);

  ///////////////////////////////////////////////////////////
  static final lightTheme = ThemeData(
      primaryColor: lightprimaryColor,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: lightprimaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 22,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ))),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        headline5: TextStyle(fontSize: 20, color: Colors.white),
        headline4: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ));
}
