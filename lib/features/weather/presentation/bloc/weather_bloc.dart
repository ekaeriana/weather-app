import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';
import 'package:weather_app/features/weather/domain/entities/location/location_entity.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase/current_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/hourly_forecasts_usecase/hourly_forecasts_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/location)usecase/location_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetLocationUsecase getLocationUsecase;
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  final HourlyForecastsUsecase getHourlyForecastsUsecase;

  WeatherState get initialState => EmptyState();

  WeatherBloc({
    required this.getLocationUsecase,
    required this.getCurrentWeatherUsecase,
    required this.getHourlyForecastsUsecase,
  }) : super(EmptyState()) {
    on<GetLocation>((event, emit) async {
      emit(LoadingState());
      final failureOrData = await getLocationUsecase(
        Params(idLocation: event.locationId),
      );
      await failureOrData!.fold(
        (failure) async => emit(
          const ErrorState(errorMsg: 'Something went wrong..'),
        ),
        (data) async => emit(
          LoadedState(location: data),
        ),
      );
    });

    //Get CurrentWeather
    on<GetCurrentWeather>((event, emit) async {
      emit(LoadingState());
      final failureOrData = await getCurrentWeatherUsecase(
        CurrentWeatherParams(lat: event.lat, lon: event.lon),
      );
      await failureOrData!.fold(
        (failure) async => emit(
          const ErrorState(errorMsg: 'Something went wrong..'),
        ),
        (data) async => emit(
          CurrentWeatherState(currentWeather: data),
        ),
      );
    });

    //Get HourlyForecasts
    on<GetHourlyForecasts>((event, emit) async {
      emit(LoadingState());
      final failureOrData = await getHourlyForecastsUsecase(
          HourlyForecastsParams(
              lat: event.lat, lon: event.lon, cnt: event.cnt));
      await failureOrData!.fold(
        (failure) async => emit(
          const ErrorState(errorMsg: 'Something went wrong..'),
        ),
        (data) async => emit(
          HourlyForecastsState(hourlyForecasts: data),
        ),
      );
    });
  }
}
