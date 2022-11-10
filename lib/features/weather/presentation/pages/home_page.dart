import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

import '../widgets/home_page/foracast_card.dart';
import '../widgets/home_page/forecast_details.dart';
import '../widgets/home_page/forecast_list.dart';
import '../widgets/home_page/top_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context
        .read<WeatherBloc>()
        .add(const GetCurrentWeather(lon: '115.1266', lat: '-8.5392'));

    return Scaffold(
      extendBodyBehindAppBar: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TopMenu(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is EmptyState) {
                      return Container();
                    } else if (state is LoadingState) {
                      return const Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      );
                    } else if (state is CurrentWeatherState) {
                      return HomeContents(weatherData: state.currentWeather);
                    } else if (state is ErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: const Placeholder(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContents extends StatelessWidget {
  final CurrentWeather? weatherData;
  HomeContents({super.key, this.weatherData});

  final String date = DateFormat('EEEE, dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pangkung Tibah,\nTabanan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  Hero(tag: 'blue_container', child: ForecastCard(weather: weatherData,)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Hero(tag: 'forecast-details', child: ForecastDetails()),
            const SizedBox(height: 40),
            const ForecastList()
          ],
        ),
      ),
    );
  }
}
