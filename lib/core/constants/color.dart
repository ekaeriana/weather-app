import 'package:flutter/material.dart';

class CustomColor {
  static const Color lightBlue = Color(0xFFAECDFF);
  static const Color blue = Color(0xFF5896FD);
  static const Color lightPurple = Color(0xFFB0A4FF);
  static const Color purple = Color(0xFF806EF8);
  static const Color black = Color(0xFF1A1D26);

  static const RadialGradient blueGradient = RadialGradient(
    colors: [
      lightBlue,
      blue,
    ],
    center: Alignment.topLeft,
    radius: 1.75,
  );
  
  static const RadialGradient purpleGradient = RadialGradient(
    colors: [
      lightPurple,
      purple,
    ],
    center: Alignment.topLeft,
    radius: 1.75,
  );
}
