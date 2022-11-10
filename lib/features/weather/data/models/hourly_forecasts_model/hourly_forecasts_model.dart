import 'dart:convert';

import 'package:weather_app/features/weather/data/models/current_weather_model/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/location_model/city_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';
import 'package:weather_app/features/weather/domain/entities/location/city_entity.dart';

class HourlyForecastsModel extends HourlyForecasts {
  const HourlyForecastsModel(
      {final String? cod,
      final int? message,
      final int? cnt,
      final List<CurrentWeather>? list,
      final City? city})
      : super(cod: cod, message: message, cnt: cnt, list: list, city: city);

  factory HourlyForecastsModel.fromJson(Map<String, dynamic> json) {
    List<CurrentWeather> currentWeatherToList(dynamic cw) {
      final data = jsonDecode(jsonEncode(cw));
      return List<CurrentWeather>.from(
          data.map((cw) => CurrentWeatherModel.fromJson(cw)));
    }

    return HourlyForecastsModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: json['list'] != null ? currentWeatherToList(json['list']) : null,
      city: json['city'] != null
          ? CityModel.fromJson(json['city']) as City
          : null,
    );
  }
}
