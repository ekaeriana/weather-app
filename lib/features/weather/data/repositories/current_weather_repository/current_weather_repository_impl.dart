import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/curent_weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/curent_weather_repository/current_weather_repository.dart';

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository {
  final CurrentWeatherRemoteDataSource currentWeatherRemoteDataSource;
  final NetworkInfo networkInfo;

  CurrentWeatherRepositoryImpl(
      {required this.currentWeatherRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, CurrentWeather>>? getCurrentWeather(
      String lat, String lon) async {
    if (await networkInfo.isConnected) {
      try {
        final currentWeather =
            await currentWeatherRemoteDataSource.getCurrentWeather(lat, lon)!;
        return Right(currentWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
