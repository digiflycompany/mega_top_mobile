import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class BigCircularProgressIndicator extends StatelessWidget {
  const BigCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
        ),
      ),
      child: Transform.scale(
          scale: 0.8, child: CircularProgressIndicator.adaptive()),
    );
  }
}
