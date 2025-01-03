import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/state_management/bloc_observer.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'my_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Future.delayed(Duration(seconds: 1));
  PreferencesHelper.init();
  runApp(MyApp());
}
