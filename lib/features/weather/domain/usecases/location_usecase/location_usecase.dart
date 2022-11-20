import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';

class GetLocationUsecase extends UseCase<Placemark, NoParams>{
  
  final LocationRepository locationRepository;

  GetLocationUsecase(this.locationRepository);

  @override
  Future<Either<Failure, Placemark>?> call(NoParams param) async {
    return await locationRepository.getLocation();
  }
  
}