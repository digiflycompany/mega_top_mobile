import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/core/utils/theme/appbar_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: FontFamilies.cairo,
      splashColor: Colors.transparent,
      useMaterial3: false,
      appBarTheme: CustomAppBarTheme.appBarTheme);
}
