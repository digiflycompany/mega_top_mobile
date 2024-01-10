import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_fonts.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_first_screen.dart';
import 'package:mega_top_mobile/features/on_boarding_screens/presentation/pages/on_boarding_screens.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: FontFamilies.cairo,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreens(),
    );
  }
}
