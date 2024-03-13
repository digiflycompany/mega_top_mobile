import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/home_screens/presentation/pages/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}
