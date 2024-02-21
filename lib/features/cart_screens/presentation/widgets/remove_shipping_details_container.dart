import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class RemoveShippingDetailsContainer extends StatelessWidget {
  const RemoveShippingDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Remove Icon (Basket Icon)
        SvgPicture.asset(AppAssets.basketIcon),
        HorizontalSpace(context.width * 0.011),

        /// Remove Text
        Text(
          AppStrings.removeEn,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
