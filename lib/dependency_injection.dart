import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/curent_weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/hourly_forecasts_remote_data_source.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_sources/location_remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/current_weather_repository/current_weather_repository_impl.dart';
import 'package:weather_app/features/weather/data/repositories/hourly_forecasts_repository/hourly_forecasts_repository_impl.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository/location_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/curent_weather_repository/current_weather_repository.dart';
import 'package:weather_app/features/weather/domain/repositories/hourly_forecasts_repository/hourly_forecasts_repository.dart';
import 'package:weather_app/features/weather/domain/repositories/location_repository/location_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/current_weather_usecase/current_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/hourly_forecasts_usecase/hourly_forecasts_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/location_usecase/location_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecasts_bloc/hourly_forecasts_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => WeatherBloc(
      getLocationUsecase: sl(),
      getCurrentWeatherUsecase: sl(),
    ),
  );
  sl.registerFactory(
    () => HourlyForecastsBlocBloc(
      getHourlyForecasts: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetLocationUsecase(sl()));
  sl.registerLazySingleton(() => GetCurrentWeatherUsecase(sl()));
  sl.registerLazySingleton(() => HourlyForecastsUsecase(sl()));

  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      locationDataSourceImpl: sl(),
      network: sl(),
    ),
  );
  sl.registerLazySingleton<CurrentWeatherRepository>(
    () => CurrentWeatherRepositoryImpl(
      currentWeatherRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<HourlyForecastsRepository>(
    () => HourlyForecastsRepositoryImpl(
      hourlyForecastsRemoteDataSource: sl(),
      network: sl(),
    ),
  );

  sl.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<CurrentWeatherRemoteDataSource>(
    () => CurrentWeatherRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<HourlyForecastsRemoteDataSource>(
    () => HourlyForecastsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connection: sl()),
  );

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
