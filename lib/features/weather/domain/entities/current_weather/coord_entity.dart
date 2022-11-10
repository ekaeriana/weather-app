import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final double? lon;
  final double? lat;

  const Coord({this.lon, this.lat});

  @override
  List<Object?> get props => [lon, lat];
}
