import 'package:geocoding/geocoding.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/location_remote_data_source.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationDataSourceImpl;
  final NetworkInfo network;

  LocationRepositoryImpl(
      {required this.locationDataSourceImpl, required this.network});

  @override
  Future<Either<Failure, Placemark>> getLocation() async {
    return await _getLocation();
  }

  Future<Either<Failure, Placemark>> _getLocation() async {
    if (await network.isConnected) {
      try {
        final location = await locationDataSourceImpl.getDataLocation()!;
        return Right(location);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
