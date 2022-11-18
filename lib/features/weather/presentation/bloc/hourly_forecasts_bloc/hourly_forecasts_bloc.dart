
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/domain/usecases/hourly_forecasts_usecase/hourly_forecasts_usecase.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';

part 'hourly_forecasts_event.dart';
part 'hourly_forecasts_state.dart';

class HourlyForecastsBlocBloc
    extends Bloc<HourlyForecastsBlocEvent, HourlyForecastsBlocState> {
  final HourlyForecastsUsecase getHourlyForecasts;

  HourlyForecastsBlocState get initialState => HourlyForecastsBlocInitial();

  HourlyForecastsBlocBloc({required this.getHourlyForecasts})
      : super(HourlyForecastsBlocInitial()) {
    on<GetHourlyForecasts>((event, emit) async {
      emit(HourlyForecastsLoading());
      final hourlyForecasts = await getHourlyForecasts(
          HourlyForecastsParams(lat: event.lat, lon: event.lon));
      await hourlyForecasts!.fold(
        (failure) async => emit(
          const HourlyForecastsError(msg: 'Something went wrong..'),
        ),
        (data) async => emit(
          HourlyForecastsLoaded(hourlyForecasts: data),
        ),
      );
    });
  }
}
