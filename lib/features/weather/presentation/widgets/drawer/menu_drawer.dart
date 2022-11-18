import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_app/core/constants/page_utils.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
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
                size: 30,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'I Wayan Eka Eriana',
              style: TextStyle(
                  fontSize: kBodyTextSize, fontWeight: FontWeight.bold),
            ),
            Text('eka.erian10@gmail.com',
                style: TextStyle(
                    fontSize: kSubtitleTextSize, color: Colors.grey.shade600)),
            const SizedBox(height: 30),
            MenuTile(
              title: 'Find City',
              icon: LineIcons.compass,
              onTap: () {},
            ),
            MenuTile(
              title: 'Map',
              icon: LineIcons.mapPin,
              onTap: () {},
            ),
            MenuTile(
              title: 'Weather News',
              icon: LineIcons.newspaper,
              onTap: () {},
            ),
            MenuTile(
              title: 'Report',
              icon: LineIcons.barChartAlt,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  bool v = false;
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const MenuTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      minLeadingWidth: 5,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: kBodyTextSize, fontWeight: FontWeight.bold),
      ),
      leading: Icon(icon, color: Colors.blueAccent),
      onTap: onTap,
    );
  }
}
