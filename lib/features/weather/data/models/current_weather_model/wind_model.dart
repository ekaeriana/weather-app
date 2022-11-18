import 'package:weather_app/features/weather/domain/entities/current_weather/wind_entity.dart';

class WindModel extends Wind {
  const WindModel({
    final double? speed,
    final int? deg,
    final double? gust,
  }) : super(
          speed: speed,
          deg: deg,
          gust: gust,
        );

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
      gust: double.parse(json['gust'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}
