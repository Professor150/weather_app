import 'package:flutter/material.dart';

class ShowWeather extends StatelessWidget {
  const ShowWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.pinkAccent.shade100,
                        Colors.deepPurple.shade200,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text('${index + 1} AM'),
                      Image(
                        width: 100,
                        image: AssetImage('assets/images/01n.png'),
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '30 °',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Colors.pink.shade100,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
