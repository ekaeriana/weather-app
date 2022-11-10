import 'package:weather_app/features/weather/domain/entities/current_weather/sys_entity.dart';

class SysModel extends Sys {
  const SysModel({
    final int? type,
    final int? id,
    final String? country,
    final int? sunrise,
    final int? sunset,
  }) : super(
          type: type,
          id: id,
          country: country,
          sunrise: sunrise,
          sunset: sunset,
        );

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
