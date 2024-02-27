import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class DefaultCircle extends StatelessWidget {
  const DefaultCircle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w, // Specify the width of the circle
      height: 24.h, // Specify the height of the circle
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.hintColor, // Specify the color of the border
          width: 3, // Specify the width of the border
        ),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: AppColors.primaryColor)),
      ),
    );
  }
}
