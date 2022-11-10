import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_app/core/constants/page_utils.dart';


class TopMenu extends StatelessWidget {
  TopMenu({Key? key}) : super(key: key);

  final ZoomDrawerController drawerController = ZOOM_DRAWER_CONTROLLER;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            drawerController.toggle!();
          },
          child: Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8.0,
                  offset: const Offset(3, 5),
                ),
              ],
            ),
            child: const Icon(
              LineIcons.bars,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8.0,
                  offset: const Offset(3, 5),
                ),
              ],
            ),
            child: const Icon(
              LineIcons.bell,
              color: Colors.black,
            ),
          ),
        ),
        const Spacer(),
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
    );
  }
}
