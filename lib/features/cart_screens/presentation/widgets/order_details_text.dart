import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class OrderDetailsText extends StatelessWidget {
  const OrderDetailsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height*0.015,left: context.width*0.045),
      child: Text(
        AppStrings.orderDetailsEn,
        style: TextStyle(
            color: AppColors.smallTextBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp
        ),
      ),
    );
  }
}
