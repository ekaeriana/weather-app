import 'dart:convert';

import 'package:weather_app/core/constants/api_utils.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/models/hourly_forecasts_model/hourly_forecasts_model.dart';
import 'package:http/http.dart' as http;

abstract class HourlyForecastsRemoteDataSource {
  Future<HourlyForecastsModel>? getHourlyForecasts(
      int? cnt, String lat, String lon);
}

class HourlyForecastsRemoteDataSourceImpl
    implements HourlyForecastsRemoteDataSource {
  final http.Client client;

  HourlyForecastsRemoteDataSourceImpl(this.client);

  @override
  Future<HourlyForecastsModel>? getHourlyForecasts(
      int? cnt, String lat, String lon) {
    return getHourlyForecastsData(Uri.http(BASE_URL, '/data/2.5/forecast', {
      'cnt': cnt,
      'lat': lat,
      'lon': lon,
      'units': 'matric',
      'appid': API_KEY,
    }));
  }

  Future<HourlyForecastsModel> getHourlyForecastsData(Uri uri) async {
    final response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      var data = HourlyForecastsModel.fromJson(res);
      return data;
    } else {
      throw ServerException();
    }
  }
}
