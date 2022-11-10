import 'package:weather_app/features/weather/domain/entities/current_weather/cloud_entity.dart';

class CloudsModel extends Clouds {
  const CloudsModel({final int? all}) : super(all: all);

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(
      all: json['all'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
