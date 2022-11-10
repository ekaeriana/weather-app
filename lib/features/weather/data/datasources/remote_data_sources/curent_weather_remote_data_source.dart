import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/api_utils.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/current_weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';

abstract class CurrentWeatherRemoteDataSource {
  Future<CurrentWeather>? getCurrentWeather(String lat, String lon);
}

class CurrentWeatherRemoteDataSourceImpl
    implements CurrentWeatherRemoteDataSource {
  final http.Client client;

  CurrentWeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentWeather> getCurrentWeather(String lat, String lon) {
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

  Future<CurrentWeather> getCurrentWeatherData(Uri uri) async {
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
