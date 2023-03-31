import 'package:flutter/material.dart';
import 'package:weather_app/widgets/next_7days.dart';
import 'package:weather_app/widgets/show_weather.dart';

import '../model/images.dart';

class IconName extends StatelessWidget {
  const IconName({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: List.generate(3, (index) {
              var iconList = [cloud, humidity, weather];
              var values = ['70%', '40%', '3.5 km\h'];
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.deepPurple.shade200,
                            Colors.pinkAccent.shade100,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black)),
                    child: Image(
                      height: 100,
                      width: 130,
                      image: AssetImage(iconList[index]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    values[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              );
            }),
          ),
          Divider(color: Colors.pink.shade100, thickness: 1),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
