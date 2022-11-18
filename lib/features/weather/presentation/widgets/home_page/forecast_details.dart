import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc/weather_bloc.dart';

class ForecastDetails extends StatelessWidget {
  const ForecastDetails({Key? key, this.mainAxis, this.tileColor})
      : super(key: key);

  final MainAxisAlignment? mainAxis;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is CurrentWeatherState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: mainAxis ?? MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: tileColor ?? Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      // image: DecorationImage(image: image)
                    ),
                    child: const Icon(
                      Icons.wind_power_rounded,
                      size: 24,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${state.currentWeather.main?.humidity}%',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: tileColor ?? Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      // image: DecorationImage(image: image)
                    ),
                    child: const Icon(
                      Icons.wind_power_rounded,
                      size: 24,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${state.currentWeather.wind?.speed?.toStringAsFixed(1)}km/h',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: tileColor ?? Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      // image: DecorationImage(image: image)
                    ),
                    child: const Icon(
                      Icons.wind_power_rounded,
                      size: 24,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${state.currentWeather.wind?.deg}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        );
      } else {
        return const Text('error');
      }
    });
  }
}
