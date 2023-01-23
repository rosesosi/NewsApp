import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/news/NewsItemDetails.dart';
import 'package:news_app/view/news_details_screen.dart';
import 'package:news_app/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News",
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
        NewsItemDetails.routeName: (_) => NewsItemDetails(),
      },
    );
  }
}
