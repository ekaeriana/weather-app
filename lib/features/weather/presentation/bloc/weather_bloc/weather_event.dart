part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetLocation extends WeatherEvent {
  final int locationId;

  const GetLocation({required this.locationId});

  @override
  List<Object> get props => [locationId];
}

class GetCurrentWeather extends WeatherEvent {
  final String lat;
  final String lon;

  const GetCurrentWeather({required this.lat, required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
