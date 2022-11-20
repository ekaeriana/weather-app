import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/location_usecase/location_usecase.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late MockLocationRepository mockLocationRepository;
  late GetLocationUsecase usecase;

  setUp((){
    mockLocationRepository = MockLocationRepository();
    usecase = GetLocationUsecase(mockLocationRepository);
  });

  Placemark tPlacemark = Placemark();

  test(
    "should get location from repository",
    () async {

      when(mockLocationRepository.getLocation()).thenAnswer((_) async => Right(tPlacemark));

      final result = await usecase(NoParams());

      expect(result, Right(tPlacemark));
      verify(mockLocationRepository.getLocation());
      verifyNoMoreInteractions(mockLocationRepository);

    },
  );
}