import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/api_services.dart';
import 'package:weather_app/model/hourlyWeatherModel.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    currentWeatherData = getCurrentWeather();
    hourlyWeatherData = getHourlyWeather();

    super.onInit();
  }

  var currentWeatherData;
  var hourlyWeatherData;
}
