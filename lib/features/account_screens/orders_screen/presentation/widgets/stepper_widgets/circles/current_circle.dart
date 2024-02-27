import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class CurrentCircle extends StatelessWidget {
  const CurrentCircle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.h,
      height: 22.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: AppColors.primaryColor)),
      ),
    );
  }
}
