import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/hourly_forecasts_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/hourly_forecasts_repository/hourly_forecasts_repository.dart';

class HourlyForecastsRepositoryImpl extends HourlyForecastsRepository {
  final HourlyForecastsRemoteDataSource hourlyForecastsRemoteDataSource;
  final NetworkInfo network;

  HourlyForecastsRepositoryImpl(
      {required this.hourlyForecastsRemoteDataSource, required this.network});

  @override
  Future<Either<Failure, HourlyForecasts>> getDataHourlyForecasts(
      int? cnt, String lat, String lon) async {
    if (await network.isConnected) {
      try {
        final hourlyForecasts = await hourlyForecastsRemoteDataSource
            .getHourlyForecasts(cnt, lat, lon)!;

        return Right(hourlyForecasts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
