import 'package:flutter/material.dart';
import 'package:weather_app/screen/homescreen.dart';
import 'package:weather_app/screen/splash_screen.dart';

import 'screen/gradinat.dart';
import 'screen/home.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.brown,
        accentColor: Colors.black,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
