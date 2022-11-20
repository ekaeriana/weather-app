part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LoadingState extends LocationState {}

class LoadedState extends LocationState {
  final String location;

  const LoadedState({required this.location});

  @override
  List<Object> get props => [location];
}

class LocationError extends LocationState {
  final String errorMessage;

  const LocationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}