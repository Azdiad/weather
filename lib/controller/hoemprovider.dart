import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/weather_api_client.dart';

class HomeProvider extends ChangeNotifier {
  WeatherApiclient client = WeatherApiclient();
  Weather? data;

  Future<void> getData(String place) async {
    data = await client.currentweather(place);
    notifyListeners();
  }
}
