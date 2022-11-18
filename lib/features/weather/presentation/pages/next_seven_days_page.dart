import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page/foracast_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page/forecast_details.dart';

import '../../../../core/constants/color.dart';
import '../widgets/next_seven_days/hourly_forecasts_list.dart';

class NextSevenDaysPage extends StatefulWidget {
  const NextSevenDaysPage({super.key});

  @override
  State<NextSevenDaysPage> createState() => _NextSevenDaysPageState();
}

class _NextSevenDaysPageState extends State<NextSevenDaysPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offset;
  late Animation<Offset> listOffset;
  late Animation<Offset> forecastOffset;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    offset = Tween<Offset>(
            begin: Offset.zero.translate(0, 2), end: const Offset(0, 0.65))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn));
    listOffset = Tween<Offset>(
            begin: Offset.zero.translate(3, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn));
    forecastOffset = Tween<Offset>(
            begin: Offset.zero.translate(0, 4), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Hero(
              tag: 'blue_container',
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(color: CustomColor.blue),
              ),
            ),
            SlideTransition(
              position: offset,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.65,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              LineIcons.angleLeft,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Text(
                          'Next 7 Days',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                blurRadius: 8.0,
                                offset: const Offset(3, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            LineIcons.userAlt,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Column(
                      children: [
                        SlideTransition(
                          position: listOffset,
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 110,
                            child: ListView.builder(
                              itemCount: 7,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 20),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: index == 2
                                          ? Colors.white
                                          : Colors.white12,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.cloudy_snowing,
                                        size: 30,
                                        color: index == 2
                                            ? CustomColor.purple
                                            : Colors.white,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '07',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: index == 2
                                                ? Colors.purple
                                                : Colors.white),
                                      ),
                                      Text(
                                        'Nov',
                                        style: TextStyle(
                                            color: index == 2
                                                ? Colors.purple
                                                : Colors.white),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SlideTransition(
                                  position: forecastOffset,
                                  child: ForecastCard(
                                    child: Column(children: const [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ForecastDetails(
                                        tileColor: Colors.white30,
                                        mainAxis:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ]),
                                  ),
                                ),
                                SlideTransition(
                                  position: forecastOffset,
                                  child: const HourlyForecastsList(),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
