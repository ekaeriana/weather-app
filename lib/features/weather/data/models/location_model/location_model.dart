
import 'package:weather_app/features/weather/domain/entities/location/location_entity.dart';

class LocationModel extends Location {
  const LocationModel({
    final String? name,
    final String? lat,
    final String? lon,
    final String? countryCode,
    final String? stateName,
  }) : super(
            name: name,
            lat: lat,
            lon: lon,
            countryCode: countryCode,
            stateName: stateName);


  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      lat: json['lat'].toString(),
      lon: json['lon'].toString(),
      countryCode: json['country'],
      stateName: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = countryCode;
    data['state'] = stateName;
    return data;
  }
}
