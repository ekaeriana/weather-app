import 'dart:convert';

import 'package:weather_app/features/weather/data/models/current_weather_model/coord_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/could_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/main_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/sys_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/weather_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model/wind_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/cloud_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/coord_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/main_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/sys_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/wind_entity.dart';

class CurrentWeatherModel extends CurrentWeather {
  const CurrentWeatherModel({
    final Coord? coord,
    final List<Weather>? weather,
    final String? base,
    final Main? main,
    final int? visibility,
    final Wind? wind,
    final Clouds? clouds,
    final int? dt,
    final Sys? sys,
    final int? timezone,
    final int? id,
    final String? name,
    final int? cod,
    final String? dtText,
  }) : super(
            coord: coord,
            weather: weather,
            base: base,
            main: main,
            visibility: visibility,
            wind: wind,
            clouds: clouds,
            dt: dt,
            sys: sys,
            timezone: timezone,
            id: id,
            name: name,
            cod: cod,
            dtText: dtText);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {

    List<WeatherModel> weatherToList(){
      final data = jsonDecode(jsonEncode(json['weather']));
      return List<WeatherModel>.from(data.map((e)=>WeatherModel.fromJson(e)));
    }

    return CurrentWeatherModel(
    coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) as Coord : null,
    weather: json['weather'] != null ? weatherToList():null,
    main: json['main'] != null ? MainModel.fromJson(json['main']) as Main : null,
    visibility: json['visibility'],
    wind: json['wind'] != null ? WindModel.fromJson(json['wind']) as Wind : null,
    clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) as Clouds : null,
    dt: json['dt'],
    sys: json['sys'] != null ? SysModel.fromJson(json['sys']) as Sys : null,
    timezone: json['timezone'],
    id: json['id'],
    name: json['name'],
    cod: json['cod'],
    dtText: json['dt_txt'],
    );
  }

  factory CurrentWeatherModel.fromCurrentWeather(CurrentWeather data){
    if(data is CurrentWeatherModel){
      return data;
    } 
    return CurrentWeatherModel(
      coord: data.coord,
    weather: data.weather,
    base: data.base,
    main: data.main,
    visibility: data.visibility,
    wind: data.wind,
    clouds: data.clouds,
    dt: data.dt,
    sys: data.sys,
    timezone: data.timezone,
    id: data.id,
    name: data.name,
    cod: data.cod,
    dtText: data.dtText,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (coord != null) {
  //     data['coord'] = coord!.toJson();
  //   }
  //   if (weather != null) {
  //     data['weather'] = weather!.map((v) => v.toJson()).toList();
  //   }
  //   data['base'] = base;
  //   if (main != null) {
  //     data['main'] = main!.toJson();
  //   }
  //   data['visibility'] = visibility;
  //   if (wind != null) {
  //     data['wind'] = wind!.toJson();
  //   }
  //   if (clouds != null) {
  //     data['clouds'] = clouds!.toJson();
  //   }
  //   data['dt'] = dt;
  //   if (sys != null) {
  //     data['sys'] = sys!.toJson();
  //   }
  //   data['timezone'] = timezone;
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['cod'] = cod;
  //   return data;
  // }
}
