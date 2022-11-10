import 'package:weather_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/curent_weather_repository/current_weather_repository.dart';

class GetCurrentWeatherUsecase extends UseCase<CurrentWeather, CurrentWeatherParams>{

  final CurrentWeatherRepository currentWeatherRepository;

  GetCurrentWeatherUsecase(this.currentWeatherRepository);

  @override
  Future<Either<Failure, CurrentWeather>?> call(CurrentWeatherParams param) async {
    return await currentWeatherRepository.getCurrentWeather(param.lat, param.lon);
  }
  
}