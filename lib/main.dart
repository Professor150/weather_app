import 'package:flutter/material.dart';
import 'package:weather_app/screen/homescreen.dart';
import 'package:weather_app/screen/splash_screen.dart';
import 'package:get/get.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WeatherApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.black,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
