import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomStatusBarColor extends StatelessWidget {
  final Color color;

  const CustomStatusBarColor({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness:Brightness.dark,
    ));
    return Container();
  }
}
