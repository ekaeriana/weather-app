import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/constants/page_utils.dart';
import 'package:weather_app/dependency_injection.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/drawer/custom_drawer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    final zoomDrawerController = ZOOM_DRAWER_CONTROLLER;

    return BlocProvider(
      create: (context) => sl<WeatherBloc>(),
      child: MaterialApp(
        title: 'Weather',
        theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme()),
        darkTheme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.teal,
            textTheme: GoogleFonts.poppinsTextTheme()),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: CustomZoomDrawer(zoomDrawerController: zoomDrawerController),
      ),
    );
  }
}
