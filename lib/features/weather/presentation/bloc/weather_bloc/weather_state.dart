part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class EmptyState extends WeatherState {}

class LoadingState extends WeatherState {}

class LoadedState extends WeatherState {
  final List<Location> location;

  const LoadedState({required this.location});

  @override
  List<Object> get props => [location];
}

class CurrentWeatherState extends WeatherState {
  final CurrentWeather currentWeather;

  const CurrentWeatherState({required this.currentWeather});

  @override
  List<Object> get props => [currentWeather];
}

class ErrorState extends WeatherState {
  final String errorMsg;

  const ErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
