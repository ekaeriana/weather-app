import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecasts_bloc/hourly_forecasts_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/next_seven_days_page.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({
    Key? key,
  }) : super(key: key);

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {


  @override
  void initState() {
    BlocProvider.of<HourlyForecastsBlocBloc>(context).add(const GetHourlyForecasts(lon: '115.1266', lat: '-8.5392'));
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          fontSize: 16,
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
            height: 125,
            child:
                BlocBuilder<HourlyForecastsBlocBloc, HourlyForecastsBlocState>(
              builder: (context, state) {
                print(state);
                if (state is HourlyForecastsBlocInitial) {
                  return const SizedBox();
                } else if (state is HourlyForecastsLoading) {
                  return const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(strokeWidth: 1.5),
                  );
                } else if (state is HourlyForecastsLoaded) {
                  return ListView.builder(
                    itemCount: state.hourlyForecasts.list?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          children: [
                            Text(DateFormat('HH:mm').format(DateTime.parse(
                                '${state.hourlyForecasts.list?[index].dtText}'))),
                            const Spacer(),
                            const Icon(Icons.cloudy_snowing),
                            const Spacer(),
                            Text(
                                '${state.hourlyForecasts.list?[index].main?.temp}')
                          ],
                        ),
                      );
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
