import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/color.dart';

import '../../../../../core/constants/api_utils.dart';
import '../../bloc/weather_bloc/weather_bloc.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context)
        .add(const GetCurrentWeather(lon: '115.1266', lat: '-8.5392'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
              if (state is EmptyState) {
                return const SizedBox();
              } else if (state is LoadingState) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              } else if (state is CurrentWeatherState) {
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
                                    '${state.currentWeather.main?.temp?.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                        fontSize: 75,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold,
                                        height: 1),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text('O',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Feels like ${state.currentWeather.main?.temp?.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    'O',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.currentWeather.weather?[0].main}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${state.currentWeather.weather?[0].description}',
                                  style: const TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.air,
                                size: 60,
                                color: Colors.white24,
                              ),
                            ),
                          )
                        ],
                      ),
                      if (widget.child != null) widget.child!
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is CurrentWeatherState) {
                return Image(
                  width: 200,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      '$IMAGE_URL${state.currentWeather.weather![0].icon!}@4x.png'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }
}
