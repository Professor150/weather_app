import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/api_services.dart';
import 'package:weather_app/model/currentWeatherModel.dart';
import 'package:weather_app/model/images.dart';
import 'package:weather_app/model/mainController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screen/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextCotroller = TextEditingController();
  var _dataService = MainController();
  CurrentWeatherData? _response;

  void _search() async {
    final response = setState(() {});
  }

  final _updateNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    var date = DateFormat.yMMMMEEEEd().format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
            ),
            title: Text(
              date,
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
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
                icon: Icon(
                  Icons.light_mode,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
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
          child: FutureBuilder(
            future: controller.currentWeatherData,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                CurrentWeatherData data = snapshot.data;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // Textfiel For Serach Location
                      TextField(
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_updateNode),
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
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
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
                          // save button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          // update button
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: _search,
                              child: const Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // main Location Area
                      Text(
                        data.name.toUpperCase(),
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
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
                          // show tex degree

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: data.main.temp.toString(),
                                  style: TextStyle(
                                    fontSize: 60,
                                    letterSpacing: 0.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: data.weather[0].main.toString(),
                                  style: TextStyle(
                                    letterSpacing: 3,
                                    fontSize: 16,
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
                          // max temp show
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_less),
                            label: Text(
                              data.main.tempMax.toString(),
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          // show minimum temp
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.expand_less),
                            label: Text(
                              data.main.tempMin.toString(),
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      // IconName(),
                      //mid screen images and name
                      Column(
                        children: [
                          Row(
                            children: List.generate(3, (index) {
                              var iconList = [cloud, humidity, weather];
                              var values = [
                                '${data.clouds.all}',
                                '${data.main.humidity}',
                                '${data.wind.speed}',
                              ];
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
                                        border:
                                            Border.all(color: Colors.black)),
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
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
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

                      // ShowWeather(),
                      Column(
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
                                        image:
                                            AssetImage('assets/images/01n.png'),
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
                      // show wetaher on image

                      // Next7Days(),
                      Column(
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
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          day,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'assets/images/cloud.png',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                          label: Text(
                                            '27 °',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Text(
                                          "24 ° / 28 °",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          margin: EdgeInsets.all(20),
                          elevation: 2,
                          shadowColor: Colors.amber,
                          child: Text(
                            'Please Connect Internet',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'Open Again !',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600),
                        ),
                      ]),
                );
              }
            },
          ),
        ));
  }
}
