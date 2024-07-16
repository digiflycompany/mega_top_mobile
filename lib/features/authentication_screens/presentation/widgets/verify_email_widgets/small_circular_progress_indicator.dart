import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class SmallCircularProgressIndicator extends StatelessWidget {
  const SmallCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
        ),
      ),
      child: Transform.scale(
          scale: 0.5, child: CircularProgressIndicator.adaptive()),
    );
  }
}
