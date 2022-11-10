import '../../../domain/entities/current_weather/coord_entity.dart';

class CoordModel extends Coord {
  const CoordModel({
    final double? lon,
    final double? lat,
  }) : super(lat: lat, lon: lon);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}
