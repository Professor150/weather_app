import 'package:flutter/material.dart';

class GradiantScreen extends StatelessWidget {
  const GradiantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.green.shade200,
            ],
          ),
        ),
        child: Column(children: [
          Text('data'),
        ]),
      ),
    );
  }
}
