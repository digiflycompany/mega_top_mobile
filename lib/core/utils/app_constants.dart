import 'package:flutter/material.dart';
class AppConstants {
  AppConstants._();
  static const double circleRadius = 10;
  static const longDuration = 2500;
  static const shortDuration = 2000;
  static const String qatarDialCode = "+974";
  static  int id = 0;
  static String token ='';
  static const int otpLength = 4;
  static int minIdLength = 10;
  static int maxYears = 20;
  static String dateTimeFormat="yyyy-MM-dd";
  static int nShimmerItems=4;
  static double defaultElevation = 4;
  /* app uses two languages english and arabic */
  static const Locale enLocale = Locale('en', 'US');
  static const Locale arLocale = Locale('ar', 'EG');
  static const List<Locale> supportedLocales = [enLocale, arLocale];
  static String translationPath='assets/translations';

}