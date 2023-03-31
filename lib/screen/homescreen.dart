import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/data_service.dart';
import 'package:weather_app/model/images.dart';
import 'package:weather_app/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/widgets/icon_name.dart';

import '../widgets/next_7days.dart';
import '../widgets/show_weather.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextCotroller = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  void _search() async {
    final response = await _dataService.getWeather(_cityTextCotroller.text);
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat.yMMMMEEEEd().format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            title: Text(
              date,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            flexibleSpace: Container(
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
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.light_mode),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ]),
        backgroundColor: Colors.deepPurple.shade100,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              // background color Gradient
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.deepPurple.shade200,
                Colors.pinkAccent.shade100,
              ])),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // Textfiel For Serach Location
                TextField(
                  controller: _cityTextCotroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white24,
                    prefixIcon: const Icon(Icons.location_city),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: _cityTextCotroller.clear,
                    ),
                    filled: true,
                    labelText: 'Find Location',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 20,
                  width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: 100,
                        child: const Center(
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: _search,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: 100,
                        child: const Center(
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // main Location Area
                const Text(
                  'Kathmandu',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.height * 0.1,
                        image: AssetImage('assets/images/01d.png')),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "30",
                            style: TextStyle(
                              fontSize: 60,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "Sunny",
                            style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.expand_less),
                      label: const Text(
                        '41 °',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                IconName(),
                ShowWeather(),
                // Next7Days(),
              ],
            ),
          ),
        ));
  }
}
