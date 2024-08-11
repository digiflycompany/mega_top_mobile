import 'package:flutter/material.dart';

class SmallWhiteCircularProgressIndicator extends StatelessWidget {
  const SmallWhiteCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
        ),
      ),
      child: Transform.scale(
          scale: 0.45, child: CircularProgressIndicator.adaptive()),
    );
  }
}
