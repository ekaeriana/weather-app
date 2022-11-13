part of 'hourly_forecasts_bloc.dart';

abstract class HourlyForecastsBlocState extends Equatable {
  const HourlyForecastsBlocState();

  @override
  List<Object> get props => [];
}

class HourlyForecastsBlocInitial extends HourlyForecastsBlocState {}

class HourlyForecastsLoading extends HourlyForecastsBlocState {}

class HourlyForecastsLoaded extends HourlyForecastsBlocState {
  final HourlyForecasts hourlyForecasts;

  const HourlyForecastsLoaded({required this.hourlyForecasts});

  @override
  List<Object> get props => [hourlyForecasts];
}

class HourlyForecastsError extends HourlyForecastsBlocState {
  final String msg;

  const HourlyForecastsError({required this.msg});

  @override
  List<Object> get props => [msg];
}
