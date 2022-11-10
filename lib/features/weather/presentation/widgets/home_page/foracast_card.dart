import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/color.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key, this.weather, this.child}) : super(key: key);

  final CurrentWeather? weather;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          padding:
              const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: CustomColor.blueGradient,
            boxShadow: const [
              BoxShadow(
                color: CustomColor.lightBlue,
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child:
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, currentWeatherState) {
            if (currentWeatherState is CurrentWeatherState) {
              return Material(
                type: MaterialType.transparency,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${currentWeatherState.currentWeather.main?.temp?.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                      fontSize: 100,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                                const SizedBox(width: 5),
                                const Text('O',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            Text(
                              'Feels like ${currentWeatherState.currentWeather.main?.temp?.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${currentWeatherState.currentWeather.weather?[0].main}',
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${currentWeatherState.currentWeather.weather?[0].description}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.air,
                          size: 75,
                          color: Colors.white24,
                        )
                      ],
                    ),
                    if (child != null) child!
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        )
      ],
    );
  }
}
