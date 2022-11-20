import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/location_usecase/location_usecase.dart';


part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUsecase getLocationUsecase;

  LocationInitial get initial => LocationInitial();

  LocationBloc({required this.getLocationUsecase}) : super(LocationInitial()) {
    on<GetLocation>((event, emit) async {
      emit(LoadingState());
      await getLocarionData(emit);
    });
  }

  Future<void> getLocarionData(Emitter<LocationState> emit) async {
    
    final failureOrData = await getLocationUsecase(NoParams());
    await failureOrData!.fold((failure) async {
      emit(
        const LocationError(
          errorMessage: 'Something went wrong..',
        ),
      );
    }, (data) async {
      final positionName = "${data.subLocality},\n${data.locality}";
      emit(
        LoadedState(location: positionName),
      );
    });
  }
}

