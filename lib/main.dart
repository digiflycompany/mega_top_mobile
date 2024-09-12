import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/bloc_observer.dart';
import 'package:mega_top_mobile/core/functions/initialize_services.dart';
import 'features/home_screens/presentation/pages/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Future.delayed(Duration(seconds: 1));
  initializeServices();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => const MyApp()));
}
