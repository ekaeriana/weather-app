import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/page_utils.dart';
import 'package:weather_app/dependency_injection.dart';
import 'package:weather_app/features/weather/presentation/bloc/location_bloc/location_bloc.dart';

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
  final String date = DateFormat('EEEE, dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<LocationBloc, LocationState>(
                          bloc: sl<LocationBloc>()..add(const GetLocation()),
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return const LinearProgressIndicator();
                            } else if (state is LoadedState) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.location,
                                      style: const TextStyle(
                                          fontSize: kTitleTextSize,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      date,
                                      style: const TextStyle(
                                          fontSize: kSubtitleTextSize,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Hero(
                            tag: 'blue_container', child: ForecastCard()),
                        const SizedBox(height: 15),
                        const Hero(
                            tag: 'forecast-details', child: ForecastDetails()),
                        const SizedBox(height: 40),
                        const ForecastList()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
