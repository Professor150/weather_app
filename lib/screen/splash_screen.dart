import 'dart:async';

import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/images.dart';
import 'package:weather_app/screen/homescreen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = '/splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.yMMMMEEEEd().format(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent.shade100, Colors.blue.shade200],
              stops: [0.5, 0.9],
            ),
            image: DecorationImage(
              // frame phot for background

              alignment: Alignment.center,
              image: AssetImage('assets/images/frams.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  '" We show weather for you "',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // center image  splash Screen

              Image(
                height: 400,
                width: double.infinity,
                image: AssetImage('assets/images/icon.png'),
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                time,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.6),
              ),
              SizedBox(
                height: 70,
              ),
              SpinKitWave(
                // duration: Duration(seconds: 4),
                size: 60,
                color: Colors.blue,
              ),
              Align(
                heightFactor: 5.5,
                widthFactor: 2.5,
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  // skip button
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Skip  >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Row(
                children: List.generate(3, (index) {
                  var iconList = [cloud, humidity, weather];
                  return Column(
                    children: [],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
