import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("assets/images/pattern.png", fit: BoxFit.cover),
        ),
        Center(
          child: Image.asset("assets/images/logoo.png"),
        )
      ],
    );
  }
}
