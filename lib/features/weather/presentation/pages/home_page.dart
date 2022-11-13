import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pangkung Tibah,\nTabanan',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                date,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(height: 40),
                              const Hero(
                                  tag: 'blue_container', child: ForecastCard()),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
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
