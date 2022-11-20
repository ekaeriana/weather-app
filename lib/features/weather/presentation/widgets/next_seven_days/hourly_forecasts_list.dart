import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/api_utils.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecasts_bloc/hourly_forecasts_bloc.dart';

class HourlyForecastsList extends StatefulWidget {
  const HourlyForecastsList({
    Key? key,
  }) : super(key: key);

  @override
  State<HourlyForecastsList> createState() => _HourlyForecastsListState();
}

class _HourlyForecastsListState extends State<HourlyForecastsList> {
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    BlocProvider.of<HourlyForecastsBlocBloc>(context).add(
        GetHourlyForecasts(lon: '115.1266', lat: '-8.5392', datetime: today));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyForecastsBlocBloc, HourlyForecastsBlocState>(
        builder: (context, state) {
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
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (context, index) {
              final data = state.hourlyForecasts.list?[index];

              if (data!.dtText!.contains(today.toString())) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.075),
                        blurRadius: 10.0,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('dd MMM, EEEE').format(
                                  DateTime.parse(
                                    state.hourlyForecasts.list![index].dtText!,
                                  ),
                                ),
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${state.hourlyForecasts.list?[index].main?.temp?.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(
                                      text: '/',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextSpan(
                                      text:
                                          '${state.hourlyForecasts.list?[index].main?.feelsLike?.toStringAsFixed(0)}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Image(
                        image: NetworkImage(
                          '$IMAGE_URL${state.hourlyForecasts.list?[index].weather?[0].icon}.png',
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            });
      } else if (state is HourlyForecastsError) {
        return Text(state.msg);
      } else {
        return const SizedBox();
      }
    });
  }
}
