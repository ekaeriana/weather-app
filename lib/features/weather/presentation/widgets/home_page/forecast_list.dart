import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/page_utils.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecasts_bloc/hourly_forecasts_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/next_seven_days_page.dart';

import '../../../../../core/constants/api_utils.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({
    Key? key,
  }) : super(key: key);

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    BlocProvider.of<HourlyForecastsBlocBloc>(context).add(
        GetHourlyForecasts(lon: '115.1266', lat: '-8.5392', datetime: today));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                    fontSize: kTitleTextSize, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NextSevenDaysPage(),
                  ));
                },
                child: Row(
                  children: const [
                    Text(
                      'Next 7 Day',
                      style: TextStyle(
                          fontSize: kBodyTextSize,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Hero(
          tag: 'forecasts-list',
          child: SizedBox(
            width: double.maxFinite,
            height: 135,
            child:
                BlocBuilder<HourlyForecastsBlocBloc, HourlyForecastsBlocState>(
              builder: (context, state) {
                if (state is HourlyForecastsBlocInitial) {
                  return const SizedBox();
                } else if (state is HourlyForecastsLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(strokeWidth: 1.5),
                      ),
                    ),
                  );
                } else if (state is HourlyForecastsLoaded) {
                  return ListView.builder(
                    itemCount: state.hourlyForecasts.list?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20),
                    itemBuilder: (context, index) {
                      final data = state.hourlyForecasts.list?[index];

                      if (data!.dtText!.contains(today.toString())) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('HH:mm').format(
                                  DateTime.parse(
                                    '${state.hourlyForecasts.list?[index].dtText}',
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: kSubtitleTextSize,
                                    color: Colors.grey.shade600),
                              ),
                              const Spacer(),
                              Image(
                                image: NetworkImage(
                                  '$IMAGE_URL${state.hourlyForecasts.list?[index].weather?[0].icon}.png',
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.hourlyForecasts.list?[index].main?.temp?.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontSize: kBodyTextSize,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'O',
                                    style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                } else if (state is HourlyForecastsError) {
                  return Center(
                    child: Text(state.msg),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
