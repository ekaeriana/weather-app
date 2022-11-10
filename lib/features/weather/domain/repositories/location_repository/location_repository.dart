import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/location/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>>? getLocation(int params);
}