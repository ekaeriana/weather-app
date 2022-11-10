import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Params extends Equatable {
  final int idLocation;

  const Params({required this.idLocation});

  @override
  List<Object?> get props => [idLocation];
}

class CurrentWeatherParams extends Equatable {
  final String lat;
  final String lon;

  const CurrentWeatherParams({required this.lat, required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}

class HourlyForecastsParams extends Equatable {
  final int? cnt;
  final String lat;
  final String lon;

  const HourlyForecastsParams({this.cnt, required this.lat, required this.lon});

  @override
  List<Object?> get props => [cnt, lat, lon];
}
