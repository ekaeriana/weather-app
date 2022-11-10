import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/pages/next_seven_days_page.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({
    Key? key,
  }) : super(key: key);

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
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NextSevenDaysPage(),));
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
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: const [
                      Text('12:00'),
                      Spacer(),
                      Icon(Icons.cloudy_snowing),
                      Spacer(),
                      Text('23')
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
