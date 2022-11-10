import 'package:weather_app/features/weather/data/models/current_weather_model/coord_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/coord_entity.dart';
import 'package:weather_app/features/weather/domain/entities/location/city_entity.dart';

class CityModel extends City {
  const CityModel({
    final int? id,
    final String? name,
    final Coord? coord,
    final String? country,
    final int? population,
    final int? timezone,
    final int? sunrise,
    final int? sunset,
  }) : super(
          id: id,
          name: name,
          coord: coord,
          country: country,
          population: population,
          timezone: timezone,
          sunrise: sunrise,
          sunset: sunset,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null
          ? CoordModel.fromJson(json['coord']) as Coord
          : null,
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   if (coord != null) {
  //     data['coord'] = coord!.toJson();
  //   }
  //   data['country'] = country;
  //   data['population'] = population;
  //   data['timezone'] = timezone;
  //   data['sunrise'] = sunrise;
  //   data['sunset'] = sunset;
  //   return data;
  // }
}
