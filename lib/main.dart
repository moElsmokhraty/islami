import 'package:flutter/material.dart';
import 'package:islami/Home/HomeScreen.dart';
import 'package:islami/SplashScreen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      routes: {
        SplashScreen.ROUTE_NAME: (context)=> SplashScreen(),
        HomeScreen.ROUTE_NAME: (context)=> HomeScreen()
      },
      initialRoute: SplashScreen.ROUTE_NAME,
    );
  }
}