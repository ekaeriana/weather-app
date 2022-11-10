import 'package:equatable/equatable.dart';

import '../current_weather/current_weather_entity.dart';
import '../location/city_entity.dart';

class HourlyForecasts extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<CurrentWeather>? list;
  final City? city;

  const HourlyForecasts({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
