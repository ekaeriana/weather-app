part of 'hourly_forecasts_bloc.dart';

abstract class HourlyForecastsBlocEvent extends Equatable {
  const HourlyForecastsBlocEvent();

  @override
  List<Object> get props => [];
}

class GetHourlyForecasts extends HourlyForecastsBlocEvent {
  final String lat;
  final String lon;

  const GetHourlyForecasts({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
