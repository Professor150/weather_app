// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:weather_app/model/currentWeatherModel.dart';
import 'package:weather_app/model/hourlyWeatherModel.dart';
import 'package:weather_app/model/strings.dart';

var link =
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric';

getCurrentWeather() async {
  var response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    var data = currentWeatherDataFromJson(response.body.toString());
    print('data is recived');
    return data;
  }
}

var hourlyLink =
    'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apikey&units=matric';

getHourlyWeather() async {
  var response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(response.body.toString());
    print('hourly is recived');
    return data;
  }
}
