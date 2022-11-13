import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/location/location_entity.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';

class GetLocationUsecase extends UseCase<List<Location>, Params>{
  
  final LocationRepository locationRepository;

  GetLocationUsecase(this.locationRepository);

  @override
  Future<Either<Failure, List<Location>>?> call(Params param) async {
    return await locationRepository.getLocation(param.idLocation);
  }
  
}