import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/core/error/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Placemark>>? getLocation();
}