import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/repositories/hourly_forecasts_repository/hourly_forecasts_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/hourly_forecasts_usecase/hourly_forecasts_usecase.dart';

import '../../../../../core/houry_forecasts_test.dart';
import '../../../../../core/latlon_test.dart';

class MockHourlyForecastsRepository extends Mock
    implements HourlyForecastsRepository {}

void main() {
  late MockHourlyForecastsRepository mockHourlyForecastsRepository;
  late HourlyForecastsUsecase usecase;

  setUp(() {
    mockHourlyForecastsRepository = MockHourlyForecastsRepository();
    usecase = HourlyForecastsUsecase(mockHourlyForecastsRepository);
  });

  test('should return hourly forecasts from repository', () async {
    when(mockHourlyForecastsRepository.getDataHourlyForecasts(
            lat: tLat.toString(), lon: tLon.toString()))
        .thenAnswer((_) async => const Right(tHourlyForecasts));

    final result = await usecase(
        HourlyForecastsParams(lat: tLat.toString(), lon: tLon.toString()));

    expect(result, const Right(tHourlyForecasts));
    verify(mockHourlyForecastsRepository.getDataHourlyForecasts(
        lat: tLat.toString(), lon: tLon.toString()));
    verifyNoMoreInteractions(mockHourlyForecastsRepository);
  });
}
