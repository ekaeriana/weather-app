import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/cloud_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/coord_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/main_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/sys_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/wind_entity.dart';

class CurrentWeather extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;
  final String? dtText;

  const CurrentWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod,
      this.dtText});

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
        dtText,
      ];
}
