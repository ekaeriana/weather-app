import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/location_remote_data_source.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/entities/location/location_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationDataSourceImpl;
  final NetworkInfo network;

  LocationRepositoryImpl(
      {required this.locationDataSourceImpl, required this.network});

  @override
  Future<Either<Failure, List<Location>>> getLocation(
      int params) async {
    return await _getLocation(params);
  }

  Future<Either<Failure, List<Location>>> _getLocation(
      int params) async {
    if (await network.isConnected) {
      try {
        final location = await locationDataSourceImpl.getDataLocation(params)!;
        return Right(location);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
