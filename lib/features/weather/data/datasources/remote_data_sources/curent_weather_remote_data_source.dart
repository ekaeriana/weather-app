import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/api_utils.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/current_weather_model.dart';

abstract class CurrentWeatherRemoteDataSource {
  Future<CurrentWeatherModel>? getCurrentWeather(String lat, String lon);
}

class CurrentWeatherRemoteDataSourceImpl
    implements CurrentWeatherRemoteDataSource {
  final http.Client client;

  CurrentWeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String lat, String lon) {
    return getCurrentWeatherData(
      Uri.http(
        BASE_URL,
        '/data/2.5/weather',
        {
          'lat': lat,
          'lon': lon,
          'appid': API_KEY,
          'units': 'metric'
        },
      ),
    );
  }

  Future<CurrentWeatherModel> getCurrentWeatherData(Uri uri) async {
    final response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      final data = CurrentWeatherModel.fromJson(res);
      return data;
    } else {
      throw ServerException();
    }
  }
}
