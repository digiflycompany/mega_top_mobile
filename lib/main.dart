import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/home_screens/presentation/pages/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Future.delayed(Duration(seconds: 1));
  runApp(const MyApp());
}
