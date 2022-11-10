import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weather_app/core/constants/color.dart';
import 'package:weather_app/features/weather/presentation/pages/home_page.dart';
import 'package:weather_app/features/weather/presentation/widgets/drawer/menu_drawer.dart';

class CustomZoomDrawer extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  const CustomZoomDrawer({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuDrawer(),
      mainScreen: const HomePage(),
      angle: -7.0,
      borderRadius: 30.0,
      mainScreenScale: 0.2,
      showShadow: true,
      mainScreenTapClose: true,
      androidCloseOnBackTap: true,
      shadowLayer1Color: CustomColor.lightPurple.withOpacity(0.25),
      shadowLayer2Color: CustomColor.purple.withOpacity(0.25),
      menuBackgroundColor: Colors.grey.shade300,
      openCurve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
      drawerShadowsBackgroundColor: Colors.grey.shade50,
      slideWidth: MediaQuery.of(context).size.width * 0.725,
    );
  }
}
