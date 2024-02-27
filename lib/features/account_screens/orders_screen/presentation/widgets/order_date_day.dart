import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class OrderDateAndDay extends StatelessWidget {
  const OrderDateAndDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.orderDayAndDateEn,
      style: TextStyle(
        color: AppColors.greyTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
  }
}
