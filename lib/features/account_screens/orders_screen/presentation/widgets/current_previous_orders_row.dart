import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class CurrentPreviousOrdersRow extends StatelessWidget {
  const CurrentPreviousOrdersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:[
        Expanded(
          child: Container(
            height: context.height*0.087,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                AppStrings.currentOrdersEn,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: context.height*0.087,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                AppStrings.currentOrdersEn,
                style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
