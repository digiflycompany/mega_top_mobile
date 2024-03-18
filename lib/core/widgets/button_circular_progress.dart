import 'package:flutter/material.dart';

class ButtonCircularProgress extends StatelessWidget {
  const ButtonCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
        ),
      ),
      child: Transform.scale(
          scale: 0.5,
          child: CircularProgressIndicator.adaptive()),);
  }
}
