import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Next7Days extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next 7 Days',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                var day = DateFormat('EEEE').format(
                  DateTime.now().add(
                    Duration(days: index + 1),
                  ),
                );
                return Card(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.deepPurple.shade200,
                          Colors.pinkAccent.shade100,
                        ],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(children: [
                      // Text(day),
                    ]),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
