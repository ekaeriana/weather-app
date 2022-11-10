import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';

import '../../entities/hourly_forecasts/hourly_forecasts_entity.dart';

abstract class HourlyForecastsRepository {
  Future<Either<Failure, HourlyForecasts>> getDataHourlyForecasts(
      int? cnt, String lat, String lon);
}
