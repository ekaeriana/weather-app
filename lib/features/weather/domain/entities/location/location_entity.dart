import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? name;
  final String? lat;
  final String? lon;
  final String? countryCode;
  final String? stateName;

  const Location(
      {this.name,
      this.lat,
      this.lon,
      this.countryCode,
      this.stateName});

  @override
  List<Object?> get props =>
      [name, lat, lon, countryCode, stateName];
}
