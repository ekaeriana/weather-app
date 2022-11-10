
import 'package:flutter/material.dart';

class ForecastDetails extends StatelessWidget {
  const ForecastDetails({
    Key? key,
    this.mainAxis,
    this.tileColor
  }) : super(key: key);

  final MainAxisAlignment? mainAxis;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: mainAxis?? MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:tileColor?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(image: image)
                ),
                child: const Icon(
                  Icons.wind_power_rounded,
                  size: 30,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '28%',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:tileColor?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(image: image)
                ),
                child: const Icon(
                  Icons.wind_power_rounded,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '8 km/h',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:tileColor?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(image: image)
                ),
                child: const Icon(
                  Icons.wind_power_rounded,
                  size: 30,
                  color: Colors.purpleAccent,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '64%',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
