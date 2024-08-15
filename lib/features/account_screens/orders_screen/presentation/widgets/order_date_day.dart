import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class OrderDateAndDay extends StatelessWidget {
  final String date;
  const OrderDateAndDay({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
  }
}
