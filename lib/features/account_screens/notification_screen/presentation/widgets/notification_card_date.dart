import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class NotificationCardDate extends StatelessWidget {
  final String date;
  const NotificationCardDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
          color: AppColors.blackGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp
      ),
    );
  }
}
