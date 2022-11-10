import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';

abstract class CurrentWeatherRepository {
  Future<Either<Failure,CurrentWeather>>? getCurrentWeather(String lat, String lon);
}