import 'package:flutter/material.dart';
import 'package:weather_app/dependency_injection.dart' as di;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await di.init();
  runApp(const MyApp());
}
