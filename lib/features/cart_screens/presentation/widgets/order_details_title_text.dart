import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class OrderDetailsTitleText extends StatelessWidget {
  const OrderDetailsTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final cartSummary = PreferencesHelper.getCartSummary();
    return Padding(
      padding: EdgeInsets.only(
          bottom: context.height * 0.022, left: context.width * 0.045),
      child: Row(
        children: [
          Text(
            AppStrings.yourOrder,
            style: TextStyle(
                color: AppColors.smallTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
          Text(
            AppStrings.openBracket,
            style: TextStyle(
                color: AppColors.smallTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
          Text(
            "${cartSummary['totalItems']}",
            style: TextStyle(
                color: AppColors.smallTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
          Text(
            AppStrings.closeBracket,
            style: TextStyle(
                color: AppColors.smallTextBlackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
