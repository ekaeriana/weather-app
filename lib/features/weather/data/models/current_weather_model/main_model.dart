import 'package:weather_app/features/weather/domain/entities/current_weather/main_entity.dart';

class MainModel extends Main {
  const MainModel({
    final double? temp,
    final double? feelsLike,
    final double? tempMin,
    final double? tempMax,
    final int? pressure,
    final int? humidity,
    final int? seaLevel,
    final int? grndLevel,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
        );

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: double.parse(json['temp'].toString()),
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: double.parse(json['temp_min'].toString()),
      tempMax: double.parse(json['temp_max'].toString()),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}
