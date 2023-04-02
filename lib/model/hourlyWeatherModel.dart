// // To parse this JSON data, do
// //
// //     final hourlyWeatherData = hourlyWeatherDataFromJson(jsonString);

// import 'dart:convert';

// HourlyWeatherData hourlyWeatherDataFromJson(String str) =>
//     HourlyWeatherData.fromJson(json.decode(str));

// String hourlyWeatherDataToJson(HourlyWeatherData data) =>
//     json.encode(data.toJson());

// class HourlyWeatherData {
//   HourlyWeatherData({
//     required this.cod,
//     required this.message,
//     required this.cnt,
//     required this.list,
//     required this.city,
//   });

//   int cod;
//   int message;
//   int cnt;
//   List<ListElement> list;
//   City city;

//   factory newHourlyWeatherData.fromJson(Map<String, dynamic> json) =>
//       HourlyWeatherData(
//         cod: json["cod"],
//         message: json["message"],
//         cnt: json["cnt"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//         city: City.fromJson(json["city"]),
//       );

//   Map<String, dynamic> toJson() => {
//         // "cod": cod,
//         "message": message,
//         "cnt": cnt,
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "city": city.toJson(),
//       };
// }

// class City {
//   City({
//     required this.id,
//     required this.name,
//     required this.coord,
//     required this.country,
//     required this.population,
//     required this.timezone,
//     required this.sunrise,
//     required this.sunset,
//   });

//   int id;
//   String name;
//   Coord coord;
//   String country;
//   int population;
//   int timezone;
//   int sunrise;
//   int sunset;

//   factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"],
//         name: json["name"],
//         coord: Coord.fromJson(json["coord"]),
//         country: json["country"],
//         population: json["population"],
//         timezone: json["timezone"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "coord": coord.toJson(),
//         "country": country,
//         "population": population,
//         "timezone": timezone,
//         "sunrise": sunrise,
//         "sunset": sunset,
//       };
// }

// class Coord {
//   Coord({
//     required this.lat,
//     required this.lon,
//   });

//   double lat;
//   double lon;

//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lon": lon,
//       };
// }

// class ListElement {
//   ListElement({
//     required this.dt,
//     required this.main,
//     required this.weather,
//     required this.clouds,
//     required this.wind,
//     required this.visibility,
//     required this.pop,
//     required this.dtTxt,
//   });

//   int dt;
//   MainClass main;
//   List<Weather> weather;
//   Clouds clouds;
//   Wind wind;
//   int visibility;
//   double pop;

//   DateTime dtTxt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         dt: json["dt"],
//         main: MainClass.fromJson(json["main"]),
//         weather:
//             List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         clouds: Clouds.fromJson(json["clouds"]),
//         wind: Wind.fromJson(json["wind"]),
//         visibility: json["visibility"],
//         pop: json["pop"]?.toDouble(),
//         dtTxt: DateTime.parse(json["dt_txt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "dt": dt,
//         "main": main.toJson(),
//         "clouds": clouds.toJson(),
//         "wind": wind.toJson(),
//         "dt_txt": dtTxt.toIso8601String(),
//       };
// }

// class Clouds {
//   Clouds({
//     required this.all,
//   });

//   int all;

//   factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
//         all: json["all"],
//       );

//   Map<String, dynamic> toJson() => {
//         "all": all,
//       };
// }

// class MainClass {
//   MainClass({
//     required this.temp,
//     required this.tempMin,
//     required this.tempMax,
//     required this.humidity,
//   });

//   double temp;

//   double tempMin;
//   double tempMax;

//   int humidity;

//   factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
//         temp: json["temp"]?.toDouble(),
//         tempMin: json["temp_min"]?.toDouble(),
//         tempMax: json["temp_max"]?.toDouble(),
//         humidity: json["humidity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "temp": temp,
//         "temp_min": tempMin,
//         "temp_max": tempMax,
//         "humidity": humidity,
//       };
// }

// class Weather {
//   Weather({
//     required this.id,
//     required this.icon,
//   });

//   int id;

//   String icon;

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         id: json["id"],
//         icon: json["icon"],
//       );
// }

// class Wind {
//   Wind({
//     required this.speed,
//     required this.deg,
//     required this.gust,
//   });

//   double speed;
//   int deg;
//   double gust;

//   factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//         speed: json["speed"]?.toDouble(),
//         deg: json["deg"],
//         gust: json["gust"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "speed": speed,
//         "deg": deg,
//         "gust": gust,
//       };
// }
// To parse this JSON data, do
//
//     final hourlyWeatherData = hourlyWeatherDataFromJson(jsonString);

import 'dart:convert';

HourlyWeatherData hourlyWeatherDataFromJson(String str) =>
    HourlyWeatherData.fromJson(json.decode(str));

class HourlyWeatherData {
  HourlyWeatherData({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;
  City? city;

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) =>
      HourlyWeatherData(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
      );
}

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord!.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class ListElement {
  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.dtTxt,
  });

  int? dt;
  MainClass? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;

  DateTime? dtTxt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClass {
  MainClass({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  int? temp;

  int? tempMin;
  int? tempMax;

  int? humidity;

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toInt(),
        tempMin: json["temp_min"].toInt(),
        tempMax: json["temp_max"].toInt(),
        humidity: json["humidity"],
      );
}

class Weather {
  Weather({
    this.id,
    this.icon,
  });

  int? id;

  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        icon: json["icon"],
      );
}

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
