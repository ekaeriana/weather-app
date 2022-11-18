import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/repositories/curent_weather_repository/current_weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase/current_weather_usecase.dart';

import '../../../../../core/current_weather_test.dart';
import '../../../../../core/latlon_test.dart';

class MockCurrentWeatherRepository extends Mock
    implements CurrentWeatherRepository {}

void main() {
  late MockCurrentWeatherRepository mockCurrentWeatherRepository;
  late GetCurrentWeatherUsecase usecase;

  setUp(() {
    mockCurrentWeatherRepository = MockCurrentWeatherRepository();
    usecase = GetCurrentWeatherUsecase(mockCurrentWeatherRepository);
  });

  test(
    "should get current weather from repository",
    () async {
      when(mockCurrentWeatherRepository.getCurrentWeather(
              tLat.toString(), tLon.toString()))
          .thenAnswer((_) async => const Right(tCurrentWeather));

      final result = await usecase(
          CurrentWeatherParams(lat: tLat.toString(), lon: tLon.toString()));

      expect(result, const Right(tCurrentWeather));
      verify(mockCurrentWeatherRepository.getCurrentWeather(
          tLat.toString(), tLon.toString()));

      verifyNoMoreInteractions(mockCurrentWeatherRepository);
    },
  );
}
