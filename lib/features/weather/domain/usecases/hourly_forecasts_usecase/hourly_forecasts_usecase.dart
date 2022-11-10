import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/hourly_forecasts_repository/hourly_forecasts_repository.dart';

class HourlyForecastsUsecase extends UseCase<HourlyForecasts, HourlyForecastsParams> {

  final HourlyForecastsRepository hourlyForecastsRepository;

  HourlyForecastsUsecase(this.hourlyForecastsRepository);

  
  @override
  Future<Either<Failure, HourlyForecasts>?> call(HourlyForecastsParams param) { 
    return hourlyForecastsRepository.getDataHourlyForecasts(param.cnt, param.lat, param.lon);
  }
  
}