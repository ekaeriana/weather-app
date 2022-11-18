import 'package:weather_app/features/weather/domain/entities/current_weather/cloud_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/main_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/weather_entity.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/wind_entity.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_forecasts/hourly_forecasts_entity.dart';

const HourlyForecasts tHourlyForecasts =
      HourlyForecasts(cod: "200", message: 0, cnt: 40, list: [
    CurrentWeather(
        dt: 1668783600,
        main: Main(
          temp: 297.92,
          feelsLike: 298.7,
          tempMin: 296.97,
          tempMax: 297.92,
          pressure: 1011,
          seaLevel: 1011,
          grndLevel: 996,
          humidity: 86,
        ),
        weather: [
          Weather(id: 500, main: "Rain", description: "light rain", icon: "10n")
        ],
        clouds: Clouds(all: 100),
        wind: Wind(speed: 1.21, deg: 41, gust: 1.43),
        visibility: 10000,
        dtText: "2022-11-18 15:00:00")
  ]);