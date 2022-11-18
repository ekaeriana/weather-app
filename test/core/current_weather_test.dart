import 'package:weather_app/features/weather/domain/entities/current_weather/cloud_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/coord_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/main_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/sys_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/wind_entity.dart';

const tCurrentWeather = CurrentWeather(
    coord: Coord(
      lat: -8.5392,
      lon: 115.1266,
    ),
    weather: [
      Weather(id: 501, main: "Rain", description: "moderate rain", icon: "10d"),
    ],
    base: "stations",
    main: Main(
      temp: 25.88,
      feelsLike: 26.85,
      tempMin: 25.88,
      tempMax: 26.18,
      pressure: 1006,
      humidity: 89,
      seaLevel: 1006,
      grndLevel: 991,
    ),
    visibility: 10000,
    wind: Wind(
      speed: 0.6,
      deg: 327,
      gust: 1.1,
    ),
    clouds: Clouds(
      all: 100,
    ),
    dt: 1668582811,
    sys: Sys(
      type: 2,
      id: 2020640,
      country: "ID",
      sunrise: 1668548948,
      sunset: 1668593968,
    ),
    timezone: 28800,
    id: 7333603,
    name: "Banjar Jambe Baleran",
    cod: 200,
  );