// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:weather_app/model/model.dart';

// class DataService {
//   Future<WeatherResponse> getWeather(String city) async {
//     final queryParamter = {
//       'q': city,
//       'appid': 'beefaa488aeec8319bdc26de0bd82fc3',
//     };
//     final uri =
//         Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParamter);
//     final response = await http.get(uri);
//     print(response.body);
//     final json = jsonDecode(response.body);
//     return WeatherResponse.fromJSON(json);
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
