import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class NoResultColumn extends StatelessWidget {
  const NoResultColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: context.width * 0.5,
            height: context.height * 0.207,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.circleShadow,
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                AppAssets.noResultImg,
                width: context.width * 0.222,
              ),
            )),
        VerticalSpace(context.height * 0.05),
        Text(
          AppStrings.noResultsEn,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
        VerticalSpace(context.height * 0.01),
        Text(
          AppStrings.noResultLongEn,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
